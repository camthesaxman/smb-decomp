#include "shader.hpp"

#include "../../gpu.hpp"
#include "../common.hpp"

#include <aurora/log.hpp>
#include <magic_enum.hpp>
#include <utility>

namespace aurora::gfx::stream {
static logwrapper::Module Log("aurora::gfx::stream");

using gpu::g_device;

wgpu::RenderPipeline create_pipeline(const State& state, [[maybe_unused]] const PipelineConfig& config) {
  const auto info = build_shader_info(config.shaderConfig); // TODO remove
  const auto shader = build_shader(config.shaderConfig, info);

  std::array<wgpu::VertexAttribute, 4> attributes{};
  attributes[0] = wgpu::VertexAttribute{
      .format = wgpu::VertexFormat::Float32x3,
      .offset = 0,
      .shaderLocation = 0,
  };
  uint64_t offset = 12;
  uint32_t shaderLocation = 1;
  if (config.shaderConfig.vtxAttrs[GX_VA_NRM] == GX_DIRECT) {
    attributes[shaderLocation] = wgpu::VertexAttribute{
        .format = wgpu::VertexFormat::Float32x3,
        .offset = offset,
        .shaderLocation = shaderLocation,
    };
    offset += 12;
    shaderLocation++;
  }
  if (config.shaderConfig.vtxAttrs[GX_VA_CLR0] == GX_DIRECT) {
    attributes[shaderLocation] = wgpu::VertexAttribute{
        .format = wgpu::VertexFormat::Float32x4,
        .offset = offset,
        .shaderLocation = shaderLocation,
    };
    offset += 16;
    shaderLocation++;
  }
  for (int i = GX_VA_TEX0; i < GX_VA_TEX7; ++i) {
    if (config.shaderConfig.vtxAttrs[i] != GX_DIRECT) {
      continue;
    }
    attributes[shaderLocation] = wgpu::VertexAttribute{
        .format = wgpu::VertexFormat::Float32x2,
        .offset = offset,
        .shaderLocation = shaderLocation,
    };
    offset += 8;
    shaderLocation++;
  }
  const std::array vertexBuffers{wgpu::VertexBufferLayout{
      .arrayStride = offset,
      .attributeCount = shaderLocation,
      .attributes = attributes.data(),
  }};

  return build_pipeline(config, info, vertexBuffers, shader, "Stream Pipeline");
}

State construct_state() { return {}; }

void render(const State& state, const DrawData& data, const wgpu::RenderPassEncoder& pass) {
  if (!bind_pipeline(data.pipeline, pass)) {
    return;
  }

  const std::array offsets{data.uniformRange.offset};
  pass.SetBindGroup(0, find_bind_group(data.bindGroups.uniformBindGroup), offsets.size(), offsets.data());
  if (data.bindGroups.samplerBindGroup && data.bindGroups.textureBindGroup) {
    pass.SetBindGroup(1, find_bind_group(data.bindGroups.samplerBindGroup));
    pass.SetBindGroup(2, find_bind_group(data.bindGroups.textureBindGroup));
  }
  pass.SetVertexBuffer(0, g_vertexBuffer, data.vertRange.offset, data.vertRange.size);
  pass.SetIndexBuffer(g_indexBuffer, wgpu::IndexFormat::Uint16, data.indexRange.offset, data.indexRange.size);
  if (data.dstAlpha != UINT32_MAX) {
    const wgpu::Color color{0.f, 0.f, 0.f, data.dstAlpha / 255.f};
    pass.SetBlendConstant(&color);
  }
  pass.DrawIndexed(data.indexCount);
}
} // namespace aurora::gfx::stream
