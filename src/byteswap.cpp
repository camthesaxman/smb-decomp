#include <cassert>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <dolphin.h>
#include <unordered_set>

extern "C"
{
#include "byteswap.h"
#include "global.h"
}

template <typename T> [[nodiscard]] constexpr T bswap16(T val) noexcept
{
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

template <typename T> [[nodiscard]] constexpr T bswap32(T val) noexcept
{
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
    v.u = ((v.u & 0x0000FFFF) << 16) | ((v.u & 0xFFFF0000) >> 16) | ((v.u & 0x00FF00FF) << 8) |
          ((v.u & 0xFF00FF00) >> 8);
#endif
    return v.t;
}

static void bswap16_unaligned(u8 *ptr)
{
    u8 temp = ptr[0];
    ptr[0] = ptr[1];
    ptr[1] = temp;
}

static void bswap32_unaligned(u8 *ptr)
{
    u8 temp = ptr[0];
    ptr[0] = ptr[3];
    ptr[3] = temp;
    temp = ptr[1];
    ptr[1] = ptr[2];
    ptr[2] = temp;
}

static std::unordered_set<void *> sVisitedPtrs;

template <typename B, typename T> T *offset_ptr(B &base, T *ptr)
{
    return reinterpret_cast<T *>(reinterpret_cast<uintptr_t>(&base) +
                                 reinterpret_cast<uintptr_t>(ptr));
}
template <typename B, typename T> T *offset_ptr(B &base, T *ptr, void *extra)
{
    return reinterpret_cast<T *>(reinterpret_cast<uintptr_t>(&base) +
                                 reinterpret_cast<uintptr_t>(ptr) +
                                 reinterpret_cast<uintptr_t>(extra));
}

template <typename B, typename T> static inline void bswap(B &base, T &data);
template <typename B, typename P> void bswap(B &base, P *&ptr)
{
    ptr = bswap32(ptr);
}
template <typename B, typename T> void bswap(B &base, T *&ptr, s32 count)
{
    ptr = bswap32(ptr);
    if (ptr == nullptr)
    {
        return;
    }
    T *objBase = offset_ptr(base, ptr);
    for (s32 i = 0; i < count; ++i)
    {
        if (sVisitedPtrs.contains(objBase))
        {
            continue;
        }
        sVisitedPtrs.insert(objBase);
        bswap(base, *objBase);
        ++objBase;
    }
}
template <typename B, typename T> void bswap_list(B &base, T **&ptr)
{
    ptr = bswap32(ptr);
    if (ptr == nullptr)
    {
        return;
    }
    T **objBase = offset_ptr(base, ptr);
    while (*objBase != nullptr)
    {
        bswap(base, *objBase, 1);
        ++objBase;
    }
}
template <typename B, typename T> void bswap_list(B &base, T *(&ptr)[])
{
    T **objBase = ptr;
    while (*objBase != nullptr)
    {
        bswap(base, *objBase, 1);
        ++objBase;
    }
}
template <typename B, typename T> void bswap_flat(B &base, T *start, s32 count)
{
    T *objBase = start;
    for (s32 i = 0; i < count; ++i)
    {
        bswap(base, objBase[i]);
    }
}
template <typename B> void bswap(B &base, f32 &v)
{
    v = bswap32(v);
}
template <typename B> void bswap(B &base, s32 &v)
{
    v = bswap32(v);
}
template <typename B> void bswap(B &base, u32 &v)
{
    v = bswap32(v);
}
template <typename B> void bswap(B &base, s16 &v)
{
    v = bswap16(v);
}
template <typename B> void bswap(B &base, u16 &v)
{
    v = bswap16(v);
}
template <typename B> void bswap(B &base, u8 &v)
{
    // no-op
}
template <typename B> void bswap(B &base, s8 &v)
{
    // no-op
}
template <typename B> void bswap(B &base, char &v)
{
    // no-op
}
template <typename B> void bswap(B &base, Vec &vec)
{
    bswap(base, vec.x);
    bswap(base, vec.y);
    bswap(base, vec.z);
}
template <typename B> void bswap(B &base, S16Vec &vec)
{
    bswap(base, vec.x);
    bswap(base, vec.y);
    bswap(base, vec.z);
}
template <typename B> void bswap(B &base, Vec2d &vec)
{
    bswap(base, vec.x);
    bswap(base, vec.y);
}
template <typename B> void bswap(B &base, StageAnimGroup &group)
{
    bswap(base, group.initPos);
    bswap(base, group.initRot);
    bswap(base, group.unk12);
    bswap(base, group.anim, 1);
    bswap_list(base, group.modelNames);
    bswap(base, group.gridCellCountX);
    bswap(base, group.gridCellCountZ);
    bswap(base, group.gridCellTris);
    s16 triMax = -1;
    s16 **gridCellTris = offset_ptr(base, group.gridCellTris);
    for (int i = 0; i < group.gridCellCountX * group.gridCellCountZ; ++i)
    {
        bswap(base, gridCellTris[i]);
        if (gridCellTris[i] == nullptr)
        {
            continue;
        }
        s16 *tris = offset_ptr(base, gridCellTris[i]);
        while (true)
        {
            bswap(base, *tris);
            if (*tris < 0)
            {
                break;
            }
            triMax = std::max(triMax, *tris);
            ++tris;
        }
    }
    bswap(base, group.triangles, triMax + 1);
    bswap(base, group.gridOriginX);
    bswap(base, group.gridOriginZ);
    bswap(base, group.gridStepX);
    bswap(base, group.gridStepZ);
    bswap(base, group.goalCount);
    bswap(base, group.goals, group.goalCount);
    bswap(base, group.unk48);
    bswap(base, group.bumperCount);
    bswap(base, group.bumpers, group.bumperCount);
    bswap(base, group.jamabarCount);
    bswap(base, group.jamabars, group.jamabarCount);
    bswap(base, group.bananaCount);
    bswap(base, group.bananas, group.bananaCount);
    bswap(base, group.coliConeCount);
    bswap(base, group.coliCones, group.coliConeCount);
    bswap(base, group.coliSphereCount);
    bswap(base, group.coliSpheres, group.coliSphereCount);
    bswap(base, group.coliCylinderCount);
    bswap(base, group.coliCylinders, group.coliCylinderCount);
    bswap(base, group.animGroupModelCount);
    bswap(base, group.animGroupModels, group.animGroupModelCount);
    bswap(base, group.unk84);
    bswap(base, group.unk88, group.unk84);
    bswap(base, group.unk8C);
    bswap(base, group.unk90, group.unk8C);
    bswap(base, group.unkB8);
}
template <typename B> void bswap(B &base, StageStartPos &pos)
{
    bswap(base, pos.pos);
    bswap(base, pos.xrot);
    bswap(base, pos.yrot);
    bswap(base, pos.zrot);
}
template <typename B> void bswap(B &base, StageGoal &goal)
{
    bswap(base, goal.pos);
    bswap(base, goal.rotX);
    bswap(base, goal.rotY);
    bswap(base, goal.rotZ);
}
template <typename B> void bswap(B &base, StageBumper &bumper)
{
    bswap(base, bumper.pos);
    bswap(base, bumper.rotX);
    bswap(base, bumper.rotY);
    bswap(base, bumper.rotZ);
    bswap(base, bumper.unk14);
}
template <typename B> void bswap(B &base, StageJamabar &jamabar)
{
    bswap(base, jamabar.pos);
    bswap(base, jamabar.rotX);
    bswap(base, jamabar.rotY);
    bswap(base, jamabar.rotZ);
    bswap(base, jamabar.unk14);
}
template <typename B> void bswap(B &base, StageBanana &banana)
{
    bswap(base, banana.pos);
    bswap(base, banana.type);
}
template <typename B> void bswap(B &base, StageBgObject &bgObject)
{
    bswap(base, bgObject.flags);
    bswap(base, bgObject.name);
    bswap(base, bgObject.model, 1);
    bswap(base, bgObject.pos);
    bswap(base, bgObject.rotX);
    bswap(base, bgObject.rotY);
    bswap(base, bgObject.rotZ);
    bswap(base, bgObject.scale);
    bswap(base, bgObject.translucency);
    bswap(base, bgObject.anim, 1);
    bswap(base, bgObject.flipbooks, 1);
}
template <typename B> void bswap(B &base, StageColiCone &coliCone)
{
    bswap(base, coliCone.pos);
    bswap(base, coliCone.rot);
    bswap(base, coliCone.flags);
    bswap(base, coliCone.scale);
}
template <typename B> void bswap(B &base, StageColiSphere &coliSphere)
{
    bswap(base, coliSphere.pos);
    bswap(base, coliSphere.radius);
    bswap(base, coliSphere.flags);
}
template <typename B> void bswap(B &base, StageColiCylinder &coliCylinder)
{
    bswap(base, coliCylinder.pos);
    bswap(base, coliCylinder.radius);
    bswap(base, coliCylinder.height);
    bswap(base, coliCylinder.rot);
    bswap(base, coliCylinder.flags);
}
template <typename B> void bswap(B &base, StageColiTri &coliTri)
{
    bswap(base, coliTri.pos);
    bswap(base, coliTri.normal);
    bswap(base, coliTri.rot);
    bswap(base, coliTri.flags);
    bswap(base, coliTri.vert2);
    bswap(base, coliTri.vert3);
    bswap(base, coliTri.edge2Normal);
    bswap(base, coliTri.edge3Normal);
}
template <typename B> void bswap(B &base, StageCollHdr_child2 &obj)
{
    bswap(base, obj.unk0);
    bswap(base, obj.unkC);
    bswap(base, obj.unk18);
    bswap(base, obj.unk1A);
    bswap(base, obj.unk1C);
}
template <typename B> void bswap(B &base, AnimGroupModel &model)
{
    bswap(base, model.unk0);
    bswap(base, model.name);
    bswap(base, model.unk8);
}
template <typename B> void bswap(B &base, DecodedStageLzPtr_child5 &obj)
{
    // TODO
}
template <typename B> void bswap(B &base, DecodedStageLzPtr_child_child4 &obj)
{
    bswap(base, obj.unk0);
    bswap(base, obj.unk4);
}
template <typename B> void bswap(B &base, DecodedStageLzPtr_child6 &obj)
{
    bswap(base, obj.unkC, 1);
    bswap(base, obj.unk10, 1);
}
template <typename B> void bswap(B &base, StageBgAnim &anim)
{
    bswap(base, anim.loopStartSeconds);
    bswap(base, anim.loopEndSeconds);
    bswap(base, anim.scaleXKeyframeCount);
    bswap(base, anim.scaleXKeyframes, anim.scaleXKeyframeCount);
    bswap(base, anim.scaleYKeyframeCount);
    bswap(base, anim.scaleYKeyframes, anim.scaleYKeyframeCount);
    bswap(base, anim.scaleZKeyframeCount);
    bswap(base, anim.scaleZKeyframes, anim.scaleZKeyframeCount);
    bswap(base, anim.rotXKeyframeCount);
    bswap(base, anim.rotXKeyframes, anim.rotXKeyframeCount);
    bswap(base, anim.rotYKeyframeCount);
    bswap(base, anim.rotYKeyframes, anim.rotYKeyframeCount);
    bswap(base, anim.rotZKeyframeCount);
    bswap(base, anim.rotZKeyframes, anim.rotZKeyframeCount);
    bswap(base, anim.posXKeyframeCount);
    bswap(base, anim.posXKeyframes, anim.posXKeyframeCount);
    bswap(base, anim.posYKeyframeCount);
    bswap(base, anim.posYKeyframes, anim.posYKeyframeCount);
    bswap(base, anim.posZKeyframeCount);
    bswap(base, anim.posZKeyframes, anim.posZKeyframeCount);
    bswap(base, anim.visibleKeyframeCount);
    bswap(base, anim.visibleKeyframes, anim.visibleKeyframeCount);
    bswap(base, anim.translucencyKeyframeCount);
    bswap(base, anim.translucencyKeyframes, anim.translucencyKeyframeCount);
}
template <typename B> void bswap(B &base, StageFlipbookAnims &anims)
{
    bswap(base, anims.nightWindowAnimCount);
    bswap(base, anims.nightWindowAnims, anims.nightWindowAnimCount);
    bswap(base, anims.stormFireAnimCount);
    bswap(base, anims.stormFireAnims, anims.stormFireAnimCount);
}
template <typename B> void bswap(B &base, StageAnimGroupAnim &anim)
{
    bswap(base, anim.rotXKeyframeCount);
    bswap(base, anim.rotXKeyframes, anim.rotXKeyframeCount);
    bswap(base, anim.rotYKeyframeCount);
    bswap(base, anim.rotYKeyframes, anim.rotYKeyframeCount);
    bswap(base, anim.rotZKeyframeCount);
    bswap(base, anim.rotZKeyframes, anim.rotZKeyframeCount);
    bswap(base, anim.posXKeyframeCount);
    bswap(base, anim.posXKeyframes, anim.posXKeyframeCount);
    bswap(base, anim.posYKeyframeCount);
    bswap(base, anim.posYKeyframes, anim.posYKeyframeCount);
    bswap(base, anim.posZKeyframeCount);
    bswap(base, anim.posZKeyframes, anim.posZKeyframeCount);
}
template <typename B> void bswap(B &base, Keyframe &keyframe)
{
    bswap(base, keyframe.easeType);
    bswap(base, keyframe.timeSeconds);
    bswap(base, keyframe.value);
    bswap(base, keyframe.tangentIn);
    bswap(base, keyframe.tangentOut);
}
template <typename B> void bswap(B &base, NightWindowAnim &anim)
{
    bswap(base, anim.pos);
    bswap(base, anim.rotX);
    bswap(base, anim.rotY);
    bswap(base, anim.rotZ);
}
template <typename B> void bswap(B &base, StormFireAnim &anim)
{
    bswap(base, anim.pos);
}

static void byteswap_displaylist(u8 *data, u32 size, u32 vtxAttrs)
{
    // Aurora doesn't require byteswapping here
#ifndef AURORA
    u32 pos = 0;
    GXPrimitive prim;
    GXVtxFmt fmt;
    int vtxCount;

    while (pos < size)
    {
        u8 opcode = data[pos++];

        if (opcode == GX_NOP)
            continue;
        if (opcode == GX_LOAD_BP_REG)
        {
            bswap(data, *(u32 *)(data + pos));
            pos += 4;
        }

        prim = (GXPrimitive)(opcode & ~3);
        fmt = (GXVtxFmt)(opcode & 3);
        switch (prim)
        {
        case GX_QUADS:
        case GX_TRIANGLES:
        case GX_TRIANGLESTRIP:
        case GX_TRIANGLEFAN:
        case GX_LINES:
        case GX_LINESTRIP:
        case GX_POINTS:
            bswap(data, *(u16 *)(data + pos));
            vtxCount = data[pos] | (data[pos + 1] << 8);
            pos += 2;
            while (vtxCount-- > 0)
            {
                int attr;
                GXCompCnt compCnt;
                GXCompType compType;
                u8 frac;
                for (attr = 0; attr < GX_VA_MAX_ATTR; attr++)
                {
                    GXGetVtxAttrFmt(fmt, (GXAttr)attr, &compCnt, &compType, &frac);
                    if (vtxAttrs & (1 << attr))
                    {
                        if (attr >= GX_VA_PNMTXIDX && attr <= GX_VA_TEX7MTXIDX)
                        {
                            pos++;
                            continue;
                        }
                        #define COMBINE(val1, val2, val3) (((val1)<<16)|((val2)<<8)|(val3))
                        switch (COMBINE(attr, compCnt, compType))
                        {
                        case COMBINE(GX_VA_POS, GX_POS_XYZ, GX_F32):
                        case COMBINE(GX_VA_NRM, GX_NRM_XYZ, GX_F32):
                            bswap32_unaligned(data + pos + 0);
                            bswap32_unaligned(data + pos + 4);
                            bswap32_unaligned(data + pos + 8);
                            pos += 12;
                            break;
                        case COMBINE(GX_VA_POS, GX_POS_XYZ, GX_S16):
                        case COMBINE(GX_VA_NRM, GX_NRM_XYZ, GX_S16):
                            bswap16_unaligned(data + pos + 0);
                            bswap16_unaligned(data + pos + 2);
                            bswap16_unaligned(data + pos + 4);
                            pos += 6;
                            break;
                        case COMBINE(GX_VA_TEX0, GX_TEX_ST, GX_F32):
                        case COMBINE(GX_VA_TEX1, GX_TEX_ST, GX_F32):
                        case COMBINE(GX_VA_TEX2, GX_TEX_ST, GX_F32):
                            bswap32_unaligned(data + pos + 0);
                            bswap32_unaligned(data + pos + 4);
                            pos += 8;
                            break;
                        case COMBINE(GX_VA_TEX0, GX_TEX_ST, GX_S16):
                        case COMBINE(GX_VA_TEX1, GX_TEX_ST, GX_S16):
                        case COMBINE(GX_VA_TEX2, GX_TEX_ST, GX_S16):
                            bswap16_unaligned(data + pos + 0);
                            bswap16_unaligned(data + pos + 2);
                            pos += 4;
                            break;
                        case COMBINE(GX_VA_CLR0, GX_CLR_RGBA, GX_RGBA8):
                            pos += 4;
                            break;
                        default:
                            assert(0);
                            break;
                        }
                        #undef COMBINE
                    }
                }
            }
            continue;
        default:
            assert(0);
        }
    }
#endif
}

template <typename B> static inline GMAShape *bswap_shape(B &base, GMAShape &shape)
{
    bswap(base, shape.flags);
    bswap_flat(base, shape.tevLayerIdxs,
               sizeof(shape.tevLayerIdxs) / sizeof(shape.tevLayerIdxs[0]));
    bswap(base, shape.vtxAttrs);
    bswap_flat(base, shape.dispListSizes,
               sizeof(shape.dispListSizes) / sizeof(shape.dispListSizes[0]));
    bswap(base, shape.origin);
    bswap(base, shape.blendFactors);
    u8 *next = shape.dispLists;
    for (int j = 0; j < 2; j++)
    {
        if (shape.dispListFlags & (1 << j))
        {
            byteswap_displaylist(next, shape.dispListSizes[j], shape.vtxAttrs);
            next += shape.dispListSizes[j];
        }
    }
    if (shape.dispListFlags & (GMA_SHAPE_HAS_DLIST2 | GMA_SHAPE_HAS_DLIST3))
    {
        auto &extra = *reinterpret_cast<GMAExtraDispLists *>(next);
        bswap_flat(base, extra.dispListSizes, 2);
        next = extra.dlists + extra.dispListSizes[0] + extra.dispListSizes[1];
    }
    return reinterpret_cast<GMAShape *>(next);
}
template <typename B> void bswap(B &base, GMAModel &model)
{
    bswap(base, model.magic);
    if (model.magic != (('G' << 24) | ('C' << 16) | ('M' << 8) | 'F'))
    {
        abort();
    }
    bswap(base, model.flags);
    bswap(base, model.boundSphereCenter);
    bswap(base, model.boundSphereRadius);
    bswap(base, model.tevLayerCount);
    bswap(base, model.opaqueShapeCount);
    bswap(base, model.translucentShapeCount);
    bswap(base, model.headerSize);
    bswap_flat(base, model.tevLayers, model.tevLayerCount);
    u8 *shapeStart = reinterpret_cast<u8 *>(&model) + model.headerSize;
    if (model.flags & (GCMF_SKIN | GCMF_EFFECTIVE))
    {
        shapeStart += 0x20;
    }
    auto *shape = reinterpret_cast<GMAShape *>(shapeStart);
    for (int i = 0; i < model.opaqueShapeCount + model.translucentShapeCount; ++i)
    {
        shape = bswap_shape(base, *shape);
    }
}
template <typename B> void bswap(B &base, GMATevLayer &layer)
{
    bswap(base, layer.flags);
    bswap(base, layer.texIndex);
}
template <typename B> void bswap(B &base, Stage &stage)
{
    bswap(base, stage.loopStartSeconds);
    bswap(base, stage.loopEndSeconds);
    bswap(base, stage.animGroupCount);
    bswap(base, stage.animGroups, stage.animGroupCount);
    bswap(base, stage.startPos, 1);
    bswap(base, stage.pFallOutY, 1);
    bswap(base, stage.goalsCount);
    bswap(base, stage.goals, stage.goalsCount);
    bswap(base, stage.unk24);
    bswap(base, stage.bumperCount);
    bswap(base, stage.bumpers, stage.bumperCount);
    bswap(base, stage.jamabarCount);
    bswap(base, stage.jamabars, stage.jamabarCount);
    bswap(base, stage.bananaCount);
    bswap(base, stage.bananas, stage.bananaCount);
    bswap(base, stage.coliConeCount);
    bswap(base, stage.coliCones, stage.coliConeCount);
    bswap(base, stage.coliSphereCount);
    bswap(base, stage.coliSpheres, stage.coliSphereCount);
    bswap(base, stage.coliCylinderCount);
    bswap(base, stage.coliCylinders, stage.coliCylinderCount);
    bswap(base, stage.animGroupModelCount);
    bswap(base, stage.animGroupModels, stage.animGroupModelCount);
    bswap(base, stage.unk64);
    bswap(base, stage.bgObjectCount);
    bswap(base, stage.bgObjects, stage.bgObjectCount);
    bswap(base, stage.fgObjectCount);
    bswap(base, stage.fgObjects, stage.fgObjectCount);
    bswap(base, stage.unk78, 1);
    bswap(base, stage.unk7C);
    bswap(base, stage.mirrorCount);
    bswap(base, stage.mirrors /*, stage.mirrorCount*/);
    bswap(base, stage.unk88, 1);
    bswap(base, stage.unk90);
}

template <typename B> void bswap(B &base, ChildJointList &obj)
{
    bswap(base, obj.count);
    bswap(base, obj.children);
}
template <typename B> void bswap(B &base, MotRotation &obj)
{
    bswap(base, obj.rotX);
    bswap(base, obj.rotY);
    bswap(base, obj.rotZ);
}
template <typename B> void bswap(B &base, MotSkeletonEntry1 &obj)
{
    bswap(base, obj.unk0);
    bswap(base, obj.childLists, 4 * 7);
    int rotCount = 0;
    int vecCount = 0;
    const u32 *flags = u_jointFlagLists[0];
    while (*flags != 0)
    {
        if (*flags & (1 << 6))
        {
            ++rotCount;
        }
        if (*flags & (1 << 1))
        {
            ++vecCount;
        }
        ++flags;
    }
    bswap(base, obj.rotations, rotCount);
    bswap(base, obj.unkC, vecCount);
    bswap(base, obj.unk10, vecCount);
    bswap(base, obj.name);
}
template <typename B> void bswap(B &base, Struct80034B50_child2_child &obj)
{
    bswap(base, obj.unk0);
}
template <typename B> void bswap(B &base, MotSkeletonEntry2 &obj)
{
    bswap(base, obj.unk0);
    bswap(base, obj.unk4[0], 1);
    bswap(base, obj.unk4[1], 1);
    bswap(base, obj.unk4[2], 1);
    bswap(base, obj.unk10[0]);
    bswap(base, obj.unk10[1]);
    bswap(base, obj.unk10[2]);
}
template <typename B> void bswap(B &base, MotSkeleton &stage)
{
    bswap(base, stage.unk4);
    bswap(base, stage.unk0, stage.unk4);
    bswap(base, stage.unkC);
    bswap(base, stage.unk8, stage.unkC);
}

template <typename B> void bswap(B &base, NlMesh_sub &obj)
{
    bswap(base, obj.materialColorA);
    bswap(base, obj.materialColorR);
    bswap(base, obj.materialColorG);
    bswap(base, obj.materialColorB);
}
template <typename B> static inline NlMesh *bswap_nlmesh(B &base, NlMesh &mesh)
{
    bswap(base, mesh.flags);
    bswap(base, mesh.unk4);
    bswap(base, mesh.texFlags);
    bswap(base, mesh.texObj);
    bswap(base, mesh.unk10);
    bswap(base, mesh.tplTexIdx);
    bswap(base, mesh.type);
    bswap(base, mesh.ambientColorScale);
    bswap(base, mesh.sub2C);
    bswap(base, mesh.dispListSize);
    // Taking a shortcut here: instead of parsing the display lists,
    // we know all members are 32-bits and can simply swap them all.
    bswap_flat(base, reinterpret_cast<u32 *>(mesh.dispListStart), mesh.dispListSize / 4);
    return reinterpret_cast<NlMesh *>(mesh.dispListStart + mesh.dispListSize);
}
template <typename B> void bswap(B &base, NlModelHeader_child2 &obj)
{
    // no-op
}
template <typename B> void bswap(B &base, NlModelHeader_child &obj)
{
    bswap(base, obj.modelSize);
}
template <typename B> void bswap(B &base, NlModelHeader &header)
{
    bswap(base, header.unk0, 1);
    bswap(base, header.unk4, 1);
}
template <typename B> void bswap(B &base, NlModel &model)
{
    bswap(base, *NLMODEL_HEADER(&model));
    bswap(base, model.u_valid);
    bswap(base, model.flags);
    bswap(base, model.boundSphereCenter);
    bswap(base, model.boundSphereRadius);
    auto *mesh = reinterpret_cast<NlMesh *>(model.meshStart);
    while (mesh->flags != 0)
    {
        mesh = bswap_nlmesh(base, *mesh);
    }
}
template <typename B> void bswap(B &base, NlObj_UnkChild_Child &obj)
{
    bswap(base, obj.unk0);
    bswap(base, obj.unk4);
}
template <typename B> void bswap(B &base, NlObj_UnkChild &obj)
{
    bswap(base, obj.childStructs);
    auto *ptr = offset_ptr(base, obj.childStructs);
    while (ptr->unk0 != 0)
    {
        bswap(base, *ptr);
        ++ptr;
    }
}
template <typename B> void bswap(B &base, NlObj &obj)
{
    bswap(base, obj.unk0, 1);
    bswap_list(base, obj.models);
}

template <typename B> void bswap(B &base, GMAModelEntry &obj)
{
    bswap(base, obj.model);
    bswap(base, obj.name);
}
template <typename B> void bswap(B &base, GMA &obj)
{
    bswap(base, obj.numModels);
    bswap(base, obj.modelsBase);
    auto *entry = reinterpret_cast<GMAModelEntry *>(&obj.modelEntries);
    for (u32 i = 0; i < obj.numModels; ++i)
    {
        bswap(base, *entry);
        if (reinterpret_cast<u32>(entry->model) != 0xFFFFFFFF)
        {
            bswap(base, *offset_ptr(base, entry->model, obj.modelsBase));
        }
        ++entry;
    }
}

template <typename B> void bswap(B &base, struct TPLTextureHeader &tpl)
{
    bswap(base, tpl.format);
    bswap(base, tpl.imageOffset);
    bswap(base, tpl.width);
    bswap(base, tpl.height);
}
template <typename B> void bswap(B &base, struct TPL &tpl)
{
    bswap(base, tpl.numTextures);
    bswap_flat(base, reinterpret_cast<TPLTextureHeader *>(&tpl.texHeaders), tpl.numTextures);
}

template <typename B> void bswap(B &base, struct MotDatJoint &joint)
{
    bswap(base, joint.jointIdx);
    bswap(base, joint.chanFlags);
}
template <typename B> void bswap(B &base, struct MotDat &dat)
{
    bswap(base, dat.unk0);
    int numJoints = 0;
    for (const u32 *flags = u_jointFlagLists[0]; *flags != 0; ++numJoints, ++flags)
    {
    }
    bswap(base, dat.jointInfo, numJoints);
    auto *jointInfo = offset_ptr(base, dat.jointInfo);
    int numChannels = 0;
    for (int jointIdx = 0; jointIdx < numJoints; jointIdx++, jointInfo++)
    {
        if (jointInfo->jointIdx != jointIdx)
        {
            continue;
        }
        u32 chanFlags = jointInfo->chanFlags;
        for (int i = 0; i < 9; ++i)
        {
            if (chanFlags & (1 << i))
            {
                ++numChannels;
            }
        }
    }
    bswap(base, dat.keyframeCounts);
    auto* keyframeCounts = offset_ptr(base, dat.keyframeCounts);
    int numKeyframes = 0;
    for (int i = 0; i < numChannels; ++i)
    {
        numKeyframes += *keyframeCounts;
        ++keyframeCounts;
    }
    bswap(base, dat.times, numKeyframes);
    bswap(base, dat.valueCounts);
    auto* valueCounts = offset_ptr(base, dat.valueCounts);
    int numValues = 0;
    for (int i = 0; i < numKeyframes; ++i)
    {
        numValues += *valueCounts;
        ++valueCounts;
    }
    bswap(base, dat.values, numValues);
}

template <typename B> void bswap(B &base, struct MotInfo &info)
{
    bswap_flat(base, info.unk30, 16);
    bswap_flat(base, info.unk70, 16);
}

void byteswap_stage(Stage *stage)
{
    bswap(*stage, *stage);
    sVisitedPtrs.clear();
}
void byteswap_motskeleton(MotSkeleton *skel)
{
    bswap(*skel, *skel);
    sVisitedPtrs.clear();
}
void byteswap_motlabel(u8 *data)
{
    u32 count;
    u32 *namePtrs;

    bswap(data, *(u32 *)data);  // count
    count = *(u32 *)data;
    namePtrs = (u32 *)(data + 4);
    while (count-- > 0)
        bswap(data, *namePtrs++);
}
void byteswap_motdat(struct MotDat *dat)
{
    bswap(*dat, *dat);
    sVisitedPtrs.clear();
}
void byteswap_motinfo(struct MotInfo* info) {
    bswap(*info, *info);
    sVisitedPtrs.clear();
}
void byteswap_nlobj(NlObj *obj)
{
    bswap(*obj, *obj);
    sVisitedPtrs.clear();
}
void byteswap_gma(struct GMA *gma)
{
    bswap(*gma, *gma);
    sVisitedPtrs.clear();
}
void byteswap_tpl(struct TPL *tpl)
{
    bswap(*tpl, *tpl);
}
