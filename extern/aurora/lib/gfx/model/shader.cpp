#include "shader.hpp"

#include "../../webgpu/gpu.hpp"

#include <absl/container/flat_hash_map.h>

namespace aurora::gfx::model {
static Module Log("aurora::gfx::model");

template <typename T>
constexpr T bswap16(T val) noexcept {
  static_assert(sizeof(T) == sizeof(u16));
  union {
    u16 u;
    T t;
  } v{.t = val};
#if __GNUC__
  v.u = __builtin_bswap16(v.u);
#elif _WIN32
  v.u = _byteswap_ushort(v.u);
#else
  v.u = (v.u << 8) | ((v.u >> 8) & 0xFF);
#endif
  return v.t;
}
template <typename T>
constexpr T bswap32(T val) noexcept {
  static_assert(sizeof(T) == sizeof(u32));
  union {
    u32 u;
    T t;
  } v{.t = val};
#if __GNUC__
  v.u = __builtin_bswap32(v.u);
#elif _WIN32
  v.u = _byteswap_ulong(v.u);
#else
  v.u = ((v.u & 0x0000FFFF) << 16) | ((v.u & 0xFFFF0000) >> 16) | ((v.u & 0x00FF00FF) << 8) | ((v.u & 0xFF00FF00) >> 8);
#endif
  return v.t;
}

static inline void read_vert(ByteBuffer& out, const u8* data) noexcept {
  size_t offset = 0;
  for (const auto& type : gx::g_gxState.vtxDesc) {
    if (type == GX_INDEX8) {
      const auto v = static_cast<s16>(data[offset]); // expand to s16
      out.append(&v, 2);
      ++offset;
    } else if (type == GX_INDEX16) {
      const s16 v = bswap16(*reinterpret_cast<const s16*>(data + offset));
      out.append(&v, 2);
      offset += 2;
    }
  }
  constexpr size_t align = 4; // Sint16x2
  if (offset % align != 0) {
    out.append_zeroes(align - (offset % align));
  }
}

static absl::flat_hash_map<HashType, std::pair<ByteBuffer, ByteBuffer>> sCachedDisplayLists;

static u32 prepare_vtx_buffer(ByteBuffer& buf, GXVtxFmt vtxfmt, const u8* ptr, u16 vtxCount) {
  using aurora::gfx::gx::g_gxState;
  struct {
    u8 count;
    GXCompType type;
  } attrArrays[GX_VA_MAX_ATTR] = {0};
  u32 vtxSize = 0;
  u32 outVtxSize = 0;

  // Calculate attribute offsets and vertex size
  for (int attr = 0; attr < GX_VA_MAX_ATTR; attr++) {
    const auto& attrFmt = g_gxState.vtxFmts[vtxfmt].attrs[attr];
    switch (g_gxState.vtxDesc[attr]) {
    case GX_NONE:
      break;
    case GX_DIRECT:
#define COMBINE(val1, val2, val3) (((val1) << 16) | ((val2) << 8) | (val3))
      switch (COMBINE(attr, attrFmt.cnt, attrFmt.type)) {
      case COMBINE(GX_VA_POS, GX_POS_XYZ, GX_F32):
      case COMBINE(GX_VA_NRM, GX_NRM_XYZ, GX_F32):
        attrArrays[attr].count = 3;
        attrArrays[attr].type = GX_F32;
        vtxSize += 12;
        outVtxSize += 12;
        break;
      case COMBINE(GX_VA_POS, GX_POS_XYZ, GX_S16):
      case COMBINE(GX_VA_NRM, GX_NRM_XYZ, GX_S16):
        attrArrays[attr].count = 3;
        attrArrays[attr].type = GX_S16;
        vtxSize += 6;
        outVtxSize += 12;
        break;
      case COMBINE(GX_VA_TEX0, GX_TEX_ST, GX_F32):
      case COMBINE(GX_VA_TEX1, GX_TEX_ST, GX_F32):
      case COMBINE(GX_VA_TEX2, GX_TEX_ST, GX_F32):
      case COMBINE(GX_VA_TEX3, GX_TEX_ST, GX_F32):
      case COMBINE(GX_VA_TEX4, GX_TEX_ST, GX_F32):
      case COMBINE(GX_VA_TEX5, GX_TEX_ST, GX_F32):
      case COMBINE(GX_VA_TEX6, GX_TEX_ST, GX_F32):
      case COMBINE(GX_VA_TEX7, GX_TEX_ST, GX_F32):
        attrArrays[attr].count = 2;
        attrArrays[attr].type = GX_F32;
        vtxSize += 8;
        outVtxSize += 8;
        break;
      case COMBINE(GX_VA_TEX0, GX_TEX_ST, GX_S16):
      case COMBINE(GX_VA_TEX1, GX_TEX_ST, GX_S16):
      case COMBINE(GX_VA_TEX2, GX_TEX_ST, GX_S16):
      case COMBINE(GX_VA_TEX3, GX_TEX_ST, GX_S16):
      case COMBINE(GX_VA_TEX4, GX_TEX_ST, GX_S16):
      case COMBINE(GX_VA_TEX5, GX_TEX_ST, GX_S16):
      case COMBINE(GX_VA_TEX6, GX_TEX_ST, GX_S16):
      case COMBINE(GX_VA_TEX7, GX_TEX_ST, GX_S16):
        attrArrays[attr].count = 2;
        attrArrays[attr].type = GX_S16;
        vtxSize += 4;
        outVtxSize += 8;
        break;
      case COMBINE(GX_VA_CLR0, GX_CLR_RGBA, GX_RGBA8):
      case COMBINE(GX_VA_CLR1, GX_CLR_RGBA, GX_RGBA8):
        attrArrays[attr].count = 4;
        attrArrays[attr].type = GX_RGBA8;
        vtxSize += 4;
        outVtxSize += 16;
        break;
      default:
        Log.report(LOG_FATAL, FMT_STRING("not handled: attr {}, cnt {}, type {}"), attr, attrFmt.cnt, attrFmt.type);
        break;
      }
#undef COMBINE
      break;
    default:
      Log.report(LOG_FATAL, FMT_STRING("indexed attributes unhandled"));
    }
  }

  // Build vertex buffer
  buf.reserve_extra(vtxCount * outVtxSize);
  std::array<f32, 4> out{};
  for (u32 v = 0; v < vtxCount; ++v) {
    for (int attr = 0; attr < GX_VA_MAX_ATTR; attr++) {
      if (g_gxState.vtxDesc[attr] != GX_DIRECT) {
        continue;
      }
      const auto& attrFmt = g_gxState.vtxFmts[vtxfmt].attrs[attr];
      u8 count = attrArrays[attr].count;
      switch (attrArrays[attr].type) {
      case GX_U8:
        for (int i = 0; i < count; ++i) {
          const auto value = reinterpret_cast<const u8*>(ptr)[i];
          out[i] = static_cast<f32>(value) / static_cast<f32>(1 << attrFmt.frac);
        }
        buf.append(out.data(), sizeof(f32) * count);
        ptr += count;
        break;
      case GX_S8:
        for (int i = 0; i < count; ++i) {
          const auto value = reinterpret_cast<const s8*>(ptr)[i];
          out[i] = static_cast<f32>(value) / static_cast<f32>(1 << attrFmt.frac);
        }
        buf.append(out.data(), sizeof(f32) * count);
        ptr += count;
        break;
      case GX_U16:
        for (int i = 0; i < count; ++i) {
          const auto value = bswap16(reinterpret_cast<const u16*>(ptr)[i]);
          out[i] = static_cast<f32>(value) / static_cast<f32>(1 << attrFmt.frac);
        }
        buf.append(out.data(), sizeof(f32) * count);
        ptr += count * sizeof(u16);
        break;
      case GX_S16:
        for (int i = 0; i < count; ++i) {
          const auto value = bswap16(reinterpret_cast<const s16*>(ptr)[i]);
          out[i] = static_cast<f32>(value) / static_cast<f32>(1 << attrFmt.frac);
        }
        buf.append(out.data(), sizeof(f32) * count);
        ptr += count * sizeof(s16);
        break;
      case GX_F32:
        for (int i = 0; i < count; ++i) {
          out[i] = bswap32(reinterpret_cast<const f32*>(ptr)[i]);
        }
        buf.append(out.data(), sizeof(f32) * count);
        ptr += count * sizeof(f32);
        break;
      case GX_RGBA8:
        out[0] = static_cast<f32>(ptr[0]) / 255.f;
        out[1] = static_cast<f32>(ptr[1]) / 255.f;
        out[2] = static_cast<f32>(ptr[2]) / 255.f;
        out[3] = static_cast<f32>(ptr[3]) / 255.f;
        buf.append(out.data(), sizeof(f32) * 4);
        ptr += sizeof(u32);
        break;
      }
    }
  }

  return vtxSize;
}

static u16 prepare_idx_buffer(ByteBuffer& buf, GXPrimitive prim, u16 vtxStart, u16 vtxCount) {
  u16 numIndices = 0;
  if (prim == GX_TRIANGLES) {
    buf.reserve_extra(vtxCount * sizeof(u16));
    for (u16 v = 0; v < vtxCount; ++v) {
      const u16 idx = vtxStart + v;
      buf.append(&idx, sizeof(u16));
      ++numIndices;
    }
  } else if (prim == GX_TRIANGLEFAN) {
    buf.reserve_extra(((u32(vtxCount) - 3) * 3 + 3) * sizeof(u16));
    for (u16 v = 0; v < vtxCount; ++v) {
      const u16 idx = vtxStart + v;
      if (v < 3) {
        buf.append(&idx, sizeof(u16));
        ++numIndices;
        continue;
      }
      const std::array<u16, 3> idxs{vtxStart, u16(idx - 1), idx};
      buf.append(idxs.data(), sizeof(u16) * 3);
      numIndices += 3;
    }
  } else if (prim == GX_TRIANGLESTRIP) {
    buf.reserve_extra(((u32(vtxCount) - 3) * 3 + 3) * sizeof(u16));
    for (u16 v = 0; v < vtxCount; ++v) {
      const u16 idx = vtxStart + v;
      if (v < 3) {
        buf.append(&idx, sizeof(u16));
        ++numIndices;
        continue;
      }
      if ((v & 1) == 0) {
        const std::array<u16, 3> idxs{u16(idx - 2), u16(idx - 1), idx};
        buf.append(idxs.data(), sizeof(u16) * 3);
      } else {
        const std::array<u16, 3> idxs{u16(idx - 1), u16(idx - 2), idx};
        buf.append(idxs.data(), sizeof(u16) * 3);
      }
      numIndices += 3;
    }
  } else {
    Log.report(LOG_FATAL, FMT_STRING("Unsupported primitive type {}"), static_cast<u32>(prim));
  }
  return numIndices;
}

void queue_surface(const u8* dlStart, u32 dlSize) noexcept {
  const auto hash = xxh3_hash_s(dlStart, dlSize, 0);
  Range vertRange, idxRange;
  u32 numIndices = 0;
  auto it = sCachedDisplayLists.find(hash);
  if (it != sCachedDisplayLists.end()) {
    const auto& [verts, indices] = it->second;
    numIndices = indices.size() / 2;
    vertRange = push_verts(verts.data(), verts.size());
    idxRange = push_indices(indices.data(), indices.size());
  } else {
    const u8* data = dlStart;
    u32 pos = 0;
    ByteBuffer vtxBuf;
    ByteBuffer idxBuf;
    u16 vtxStart = 0;

    while (pos < dlSize) {
      u8 opcode = data[pos++];

      if (opcode == GX_NOP)
        continue;
      if (opcode == GX_LOAD_BP_REG)
        pos += 4;

      const auto prim = static_cast<GXPrimitive>(opcode & ~3);
      switch (opcode & ~3) {
      case GX_DRAW_QUADS:
      case GX_DRAW_TRIANGLES:
      case GX_DRAW_TRIANGLE_STRIP:
      case GX_DRAW_TRIANGLE_FAN: {
        const auto fmt = static_cast<GXVtxFmt>(opcode & 3);
        u16 vtxCount = bswap16(*reinterpret_cast<const u16*>(data + pos));
        pos += 2;
        pos += vtxCount * prepare_vtx_buffer(vtxBuf, fmt, data + pos, vtxCount);
        numIndices += prepare_idx_buffer(idxBuf, prim, vtxStart, vtxCount);
        vtxStart += vtxCount;
        break;
      }
      case GX_DRAW_LINES:
      case GX_DRAW_LINE_STRIP:
      case GX_DRAW_POINTS:
        Log.report(LOG_FATAL, FMT_STRING("unimplemented prim type: {}"), u32(prim));
        break;
      }
    }
    vertRange = push_verts(vtxBuf.data(), vtxBuf.size());
    idxRange = push_indices(idxBuf.data(), idxBuf.size());
    sCachedDisplayLists.try_emplace(hash, std::move(vtxBuf), std::move(idxBuf));
  }

  //  Range sVtxRange, sNrmRange, sTcRange, sPackedTcRange;
  //  if (cachedVtxRange) {
  //    sVtxRange = *cachedVtxRange;
  //  } else {
  //    sVtxRange = push_storage(reinterpret_cast<const uint8_t*>(vtxData->data()), vtxData->size() * 16);
  //    cachedVtxRange = sVtxRange;
  //  }
  //  if (cachedNrmRange) {
  //    sNrmRange = *cachedNrmRange;
  //  } else {
  //    sNrmRange = push_storage(reinterpret_cast<const uint8_t*>(nrmData->data()), nrmData->size() * 16);
  //    cachedNrmRange = sNrmRange;
  //  }
  //  if (cachedTc0Range) {
  //    sTcRange = *cachedTc0Range;
  //  } else {
  //    sTcRange = push_storage(reinterpret_cast<const uint8_t*>(tc1Data->data()), tc1Data->size() * 8);
  //    cachedTc0Range = sTcRange;
  //  }
  //  if (cachedTc1Range) {
  //    sPackedTcRange = *cachedTc1Range;
  //  } else if (tc1Data == tc0Data) {
  //    sPackedTcRange = sTcRange;
  //  } else {
  //    sPackedTcRange = push_storage(reinterpret_cast<const uint8_t*>(tc0Data->data()), tc0Data->size() * 8);
  //    cachedTc1Range = sPackedTcRange;
  //  }

  model::PipelineConfig config{};
  populate_pipeline_config(config, GX_TRIANGLES);
  const auto info = gx::build_shader_info(config.shaderConfig);
  const gx::BindGroupRanges ranges{
      //      .vtxDataRange = sVtxRange,
      //      .nrmDataRange = sNrmRange,
      //      .tcDataRange = sTcRange,
      //      .packedTcDataRange = sPackedTcRange,
  };
  const auto bindGroups = gx::build_bind_groups(info, config.shaderConfig, ranges);
  const auto pipeline = pipeline_ref(config);

  push_draw_command(model::DrawData{
      .pipeline = pipeline,
      .vertRange = vertRange,
      .idxRange = idxRange,
      .dataRanges = ranges,
      .uniformRange = build_uniform(info),
      .indexCount = numIndices,
      .bindGroups = bindGroups,
      .dstAlpha = gx::g_gxState.dstAlpha,
  });
}

State construct_state() { return {}; }

WGPURenderPipeline create_pipeline(const State& state, [[maybe_unused]] const PipelineConfig& config) {
  const auto info = build_shader_info(config.shaderConfig); // TODO remove
  const auto shader = build_shader(config.shaderConfig, info);

  std::array<WGPUVertexAttribute, gx::MaxVtxAttr> vtxAttrs{};
  auto [num4xAttr, rem] = std::div(config.shaderConfig.indexedAttributeCount, 4);
  u32 num2xAttr = 0;
  if (rem > 2) {
    ++num4xAttr;
  } else if (rem > 0) {
    ++num2xAttr;
  }

  u32 offset = 0;
  u32 shaderLocation = 0;

  // Indexed attributes
  for (u32 i = 0; i < num4xAttr; ++i) {
    vtxAttrs[shaderLocation] = {
        .format = WGPUVertexFormat_Sint16x4,
        .offset = offset,
        .shaderLocation = shaderLocation,
    };
    offset += 8;
    ++shaderLocation;
  }
  for (u32 i = 0; i < num2xAttr; ++i) {
    vtxAttrs[shaderLocation] = {
        .format = WGPUVertexFormat_Sint16x2,
        .offset = offset,
        .shaderLocation = shaderLocation,
    };
    offset += 4;
    ++shaderLocation;
  }

  // Direct attributes
  for (int i = 0; i < gx::MaxVtxAttr; ++i) {
    const auto attrType = config.shaderConfig.vtxAttrs[i];
    if (attrType != GX_DIRECT) {
      continue;
    }
    const auto attr = static_cast<GXAttr>(i);
    switch (attr) {
    case GX_VA_POS:
    case GX_VA_NRM:
      vtxAttrs[shaderLocation] = WGPUVertexAttribute{
          .format = WGPUVertexFormat_Float32x3,
          .offset = offset,
          .shaderLocation = shaderLocation,
      };
      offset += 12;
      break;
    case GX_VA_CLR0:
    case GX_VA_CLR1:
      vtxAttrs[shaderLocation] = WGPUVertexAttribute{
          .format = WGPUVertexFormat_Float32x4,
          .offset = offset,
          .shaderLocation = shaderLocation,
      };
      offset += 16;
      break;
    case GX_VA_TEX0:
    case GX_VA_TEX1:
    case GX_VA_TEX2:
    case GX_VA_TEX3:
    case GX_VA_TEX4:
    case GX_VA_TEX5:
    case GX_VA_TEX6:
    case GX_VA_TEX7:
      vtxAttrs[shaderLocation] = WGPUVertexAttribute{
          .format = WGPUVertexFormat_Float32x2,
          .offset = offset,
          .shaderLocation = shaderLocation,
      };
      offset += 8;
      break;
    default:
      Log.report(LOG_FATAL, FMT_STRING("unhandled direct attr {}"), i);
    }
    ++shaderLocation;
  }

  const std::array vtxBuffers{WGPUVertexBufferLayout{
      .arrayStride = offset,
      .stepMode = WGPUVertexStepMode_Vertex,
      .attributeCount = shaderLocation,
      .attributes = vtxAttrs.data(),
  }};

  return build_pipeline(config, info, vtxBuffers, shader, "GX Pipeline");
}

void render(const State& state, const DrawData& data, const WGPURenderPassEncoder& pass) {
  if (!bind_pipeline(data.pipeline, pass)) {
    return;
  }

  const std::array offsets{
      data.uniformRange.offset,
      storage_offset(data.dataRanges.vtxDataRange),
      storage_offset(data.dataRanges.nrmDataRange),
      storage_offset(data.dataRanges.packedTcDataRange),
      storage_offset(data.dataRanges.tcDataRange),
  };
  wgpuRenderPassEncoderSetBindGroup(pass, 0, find_bind_group(data.bindGroups.uniformBindGroup),
                                    // TODO match number of indexed attrs
                                    data.dataRanges.vtxDataRange.size ? offsets.size() : 1, offsets.data());
  if (data.bindGroups.samplerBindGroup && data.bindGroups.textureBindGroup) {
    wgpuRenderPassEncoderSetBindGroup(pass, 1, find_bind_group(data.bindGroups.samplerBindGroup), 0, nullptr);
    wgpuRenderPassEncoderSetBindGroup(pass, 2, find_bind_group(data.bindGroups.textureBindGroup), 0, nullptr);
  }
  wgpuRenderPassEncoderSetVertexBuffer(pass, 0, g_vertexBuffer, data.vertRange.offset, data.vertRange.size);
  wgpuRenderPassEncoderSetIndexBuffer(pass, g_indexBuffer, WGPUIndexFormat_Uint16, data.idxRange.offset,
                                      data.idxRange.size);
  if (data.dstAlpha != UINT32_MAX) {
    const WGPUColor color{0.f, 0.f, 0.f, data.dstAlpha / 255.f};
    wgpuRenderPassEncoderSetBlendConstant(pass, &color);
  }
  wgpuRenderPassEncoderDrawIndexed(pass, data.indexCount, 1, 0, 0, 0);
}
} // namespace aurora::gfx::model

static absl::flat_hash_map<aurora::HashType, aurora::gfx::Range> sCachedRanges;
