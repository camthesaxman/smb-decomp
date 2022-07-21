extern "C"
{
#include "byteswap.h"
}

#include <cstdlib>

template <typename T> constexpr T bswap16(T val) noexcept
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
template <typename T> constexpr T bswap32(T val) noexcept
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

template <typename B, typename T> static inline void bswap(B &base, T &data);
template <typename B> void bswap(B &base, void *&ptr)
{
    ptr = bswap32(ptr);
}
template <typename B, typename T> void bswap(B &base, T *&ptr, s32 count)
{
    ptr = bswap32(ptr);
    T *objBase = reinterpret_cast<T *>(reinterpret_cast<uintptr_t>(&base) +
                                       reinterpret_cast<uintptr_t>(ptr));
    for (s32 i = 0; i < count; ++i)
    {
        bswap(base, objBase[i]);
    }
}
template <typename B, typename T> void bswap_flat(B &base, T *start, s32 count)
{
    T *objBase = reinterpret_cast<T *>(reinterpret_cast<uintptr_t>(&base) +
                                       reinterpret_cast<uintptr_t>(&start));
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
template <typename B> void bswap(B &base, StageAnimGroup &group)
{
    // TODO
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
template <typename B> void bswap(B &base, AnimGroupModel &model)
{
    bswap(base, model.unk0);
    bswap(base, model.unk8);
}
template <typename B> void bswap(B &base, DecodedStageLzPtr_child5 &obj)
{
    // TODO
}
template <typename B> void bswap(B &base, DecodedStageLzPtr_child6 &obj)
{
    bswap(base, obj.unkC, 1);
    bswap(base, obj.unk10, 1);
}
GMAShape *bswap_shape(GMAShape &shape)
{
    bswap(shape, shape.flags);
    bswap_flat(shape, shape.tevLayerIdxs,
               sizeof(shape.tevLayerIdxs) / sizeof(shape.tevLayerIdxs[0]));
    bswap(shape, shape.vtxAttrs);
    bswap_flat(shape, shape.dispListSizes,
               sizeof(shape.dispListSizes) / sizeof(shape.dispListSizes[0]));
    bswap(shape, shape.origin);
    bswap(shape, shape.blendFactors);
    // TODO display lists
    return nullptr;
}
template <typename B> void bswap(B &base, GMAModel &model)
{
    bswap(base, model.magic);
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
        shape = bswap_shape(*shape);
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

void byteswap_stage(Stage *stage)
{
//    bswap(*stage, *stage);
}
