#include <dolphin.h>
#include <string.h>

#include "global.h"
#include "mathutil.h"
#include "nl2ngc.h"

static float lbl_802F1F60;

static void lbl_800481A0(struct NlVtxTypeB *);
static void lbl_800482A4(struct NlVtxTypeA *);

struct Struct80048084
{
    u8 filler0[0x20];
    u32 unk20;
    GXTexObj *unk24;
};

void func_80048084(struct NlModel *arg0, struct Struct80048084 *arg1, float *arg2)
{
    struct NlMesh *mesh;
    struct NlMesh *next;
    u64 r30;
    GXTexObj *r29;

    if (arg0->u_valid == -1)
        return;
    arg0->flags &= 0xFFFFFFF9;
    memcpy(&lbl_802F1F60, arg2, 4);
    r30 = arg1->unk20;
    r29 = arg1->unk24;
    mesh = (struct NlMesh *)arg0->meshStart;
    while (mesh->flags != 0)
    {
        next = (struct NlMesh *)(mesh->dispListStart + mesh->dispListSize);
        switch (mesh->type)
        {
        case -2:
            break;
        case -3:
            u_apply_func_to_nl_disp_list_type_a((struct NlDispList *)mesh->dispListStart, next, lbl_800482A4);
            break;
        default:
            u_apply_func_to_nl_disp_list_type_b((struct NlDispList *)mesh->dispListStart, next, lbl_800481A0);
            break;
        }
        mesh->flags &= 0xF8FFFFFE;
        mesh->flags |= 0x02000008;
        mesh->unk4 &= 0xFFBFFFFF;
        mesh->unk4 |= 0x02000000;
        mesh->texFlags = r30;
        mesh->texObj = r29;
        mesh->type = -3;
        mesh = next;
    }
}

static void lbl_800481A0(struct NlVtxTypeB *arg0)
{
    u8 dummy[8];
    Vec spC;
    u32 color;
    s32 phi_r4;
    struct NlVtxTypeA *arg0_ = (void *)arg0;

    spC.x = arg0->nx;
    spC.y = arg0->ny;
    spC.z = arg0->nz;
    mathutil_mtxA_tf_vec(&spC, &spC);
    if (spC.z > 0.0)
        color = 0;
    else
    {
        mathutil_vec_normalize_len(&spC);
        phi_r4 = (float)(255.0 * -spC.z) * lbl_802F1F60;
        if (phi_r4 > 255)
            phi_r4 = 255;
        color = RGBA(phi_r4, phi_r4, phi_r4, 0);
    }
    spC.x = arg0->x;
    spC.y = arg0->y;
    spC.z = arg0->z;
    mathutil_mtxA_tf_point(&spC, &spC);
    arg0_->s = spC.x;
    arg0_->t = spC.y;
    *(u32 *)&arg0_->t |= 1;
    arg0_->color = color;
    arg0_->unk14 = 0;
}

static void lbl_800482A4(struct NlVtxTypeA *arg0)
{
	u8 dummy[8];
	Vec spC;
    u32 color;
    s32 phi_r4;

    spC.x = 0.0078125 * (s8)(u8)(arg0->unkC >> 16);
    spC.y = 0.0078125 * (s8)(u8)(arg0->unkC >> 8);
    spC.z = 0.0078125 * (s8)(u8)(arg0->unkC);
    mathutil_mtxA_tf_vec(&spC, &spC);
    if (spC.z > 0.0)
        color = 0;
    else
    {
        mathutil_vec_normalize_len(&spC);
        phi_r4 = (float)(255.0 * -spC.z) * lbl_802F1F60;
        if (phi_r4 > 255)
            phi_r4 = 255;
        color = RGBA(phi_r4, phi_r4, phi_r4, 0);
    }
    spC.x = arg0->x;
    spC.y = arg0->y;
    spC.z = arg0->z;
    mathutil_mtxA_tf_point(&spC, &spC);
    arg0->s = spC.x;
    arg0->t = spC.y;
    *(u32 *)&arg0->t |= 1;
    arg0->color = color;
    arg0->unk14 = 0;
}

static void lbl_8004853C(struct NlVtxTypeB *);
static void lbl_8004863C(struct NlVtxTypeA *);

void func_80048420(struct NlModel *arg0, struct Struct80048084 *arg1, float *arg2)
{
    struct NlMesh *mesh;
    struct NlMesh *next;
    u64 r30;
    GXTexObj *r29;

    if (arg0->u_valid == -1)
        return;
    arg0->flags &= 0xFFFFFFF9;
    memcpy(&lbl_802F1F60, arg2, 4);
    r30 = arg1->unk20;
    r29 = arg1->unk24;
    mesh = (struct NlMesh *)arg0->meshStart;
    while (mesh->flags != 0)
    {
        next = (struct NlMesh *)(mesh->dispListStart + mesh->dispListSize);
        switch (mesh->type)
        {
        case -2:
            break;
        case -3:
            u_apply_func_to_nl_disp_list_type_a((struct NlDispList *)mesh->dispListStart, next, lbl_8004863C);
            break;
        default:
            u_apply_func_to_nl_disp_list_type_b((struct NlDispList *)mesh->dispListStart, next, lbl_8004853C);
            break;
        }
        mesh->flags &= 0xF8FFFFFE;
        mesh->flags |= 0x02000008;
        mesh->unk4 &= 0xFFBFFFFF;
        mesh->unk4 |= 0x02000000;
        mesh->texFlags = r30;
        mesh->texObj = r29;
        mesh->type = -3;
        mesh = next;
    }
}

static void lbl_8004853C(struct NlVtxTypeB *arg0)
{
    u8 dummy[8];
    Vec spC;
    u32 color;
    s32 phi_r4;
    struct NlVtxTypeA *arg0_ = (void *)arg0;

    spC.x = arg0->nx;
    spC.y = arg0->ny;
    spC.z = arg0->nz;
    mathutil_mtxA_tf_vec(&spC, &spC);
    if (spC.y < 0.0)
        color = 0;
    else
    {
        mathutil_vec_normalize_len(&spC);
        phi_r4 = (float)(255.0 * spC.y) * lbl_802F1F60;
        if (phi_r4 > 255)
            phi_r4 = 255;
        color = RGBA(phi_r4, phi_r4, phi_r4, 0);
    }
    spC.x = arg0->x;
    spC.y = arg0->y;
    spC.z = arg0->z;
    mathutil_mtxA_tf_point(&spC, &spC);
    arg0_->s = spC.x;
    arg0_->t = spC.z;
    *(u32 *)&arg0_->t |= 1;
    arg0_->color = color;
    arg0_->unk14 = 0;
}

static void lbl_8004863C(struct NlVtxTypeA *arg0)
{
	u8 dummy[8];
	Vec spC;
    u32 color;
    s32 phi_r4;

    spC.x = 0.0078125 * (s8)(u8)(arg0->unkC >> 16);
    spC.y = 0.0078125 * (s8)(u8)(arg0->unkC >> 8);
    spC.z = 0.0078125 * (s8)(u8)(arg0->unkC);
    mathutil_mtxA_tf_vec(&spC, &spC);
    if (spC.y < 0.0)
        color = 0;
    else
    {
        mathutil_vec_normalize_len(&spC);
        phi_r4 = (float)(255.0 * spC.y) * lbl_802F1F60;
        if (phi_r4 > 255)
            phi_r4 = 255;
        color = RGBA(phi_r4, phi_r4, phi_r4, 0);
    }
    spC.x = arg0->x;
    spC.y = arg0->y;
    spC.z = arg0->z;
    mathutil_mtxA_tf_point(&spC, &spC);
    arg0->s = spC.x;
    arg0->t = spC.z;
    *(u32 *)&arg0->t |= 1;
    arg0->color = color;
    arg0->unk14 = 0;
}
