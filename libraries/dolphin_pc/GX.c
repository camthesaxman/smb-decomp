#include <assert.h>
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <dolphin.h>

#ifdef __WIN32
#define GLEW_STATIC
#include <GL/glew.h>
#else
#include <GL/gl.h>
#include <GL/glext.h>
extern void glClearDepthf(float);
#endif

/*
static void pause(void)
{
    char *line = NULL;
    size_t len = 0;
    getline(&line, &len, stdin);
    free(line);
}
*/

/* Transform */

void GXSetProjection(f32 mtx[4][4], GXProjectionType type)
{
    //puts("GXSetProjection");
    glMatrixMode(GL_PROJECTION);
    glLoadTransposeMatrixf(mtx);
    glMatrixMode(GL_MODELVIEW);
}

void GXGetProjectionv(f32 *p)
{
    puts("GXGetProjectionv is a stub");
}

void GXSetViewportJitter(f32 left, f32 top, f32 wd, f32 ht, f32 nearz, f32 farz, u32 field)
{
    puts("GXSetViewportJitter is a stub");
}

void GXLoadPosMtxImm(f32 mtx[3][4], u32 id)
{
    Mtx44 m;

    puts("GXLoadPosMtxImm is a stub");
    memcpy(m, mtx, sizeof(Mtx));
    m[3][0] = m[3][1] = m[3][2] = 0.0f;
    m[3][3] = 1.0f;
    glLoadTransposeMatrixf(m);
}

void GXLoadNrmMtxImm(f32 mtx[3][4], u32 id)
{
    puts("GXLoadNrmMtxImm is a stub");
}

void GXSetCurrentMtx(u32 id)
{
    puts("GXSetCurrentMtx is a stub");
}

void GXLoadTexMtxImm(f32 mtx[][4], u32 id, GXTexMtxType type)
{
    puts("GXLoadTexMtxImm is a stub");
}

void GXSetViewport(f32 left, f32 top, f32 wd, f32 ht, f32 nearz, f32 farz)
{
    printf("GXSetViewport: %.2f, %.2f, %.2f, %.2f\n", left, top, wd, ht);
    glViewport(left, top, wd, ht);
}

void GXSetScissor(u32 left, u32 top, u32 wd, u32 ht)
{
    puts("GXSetScissor is a stub");
    //pause();
}

/* Tev */

void GXSetTevOp(GXTevStageID id, GXTevMode mode)
{
    puts("GXSetTevOp is a stub");
}

void GXSetAlphaCompare(GXCompare comp0, u8 ref0, GXAlphaOp op, GXCompare comp1, u8 ref1)
{
    puts("GXSetAlphaCompare is a stub");
}

void GXSetTevColorIn(GXTevStageID stage, GXTevColorArg a, GXTevColorArg b, GXTevColorArg c, GXTevColorArg d)
{
    puts("GXSetTevColorIn is a stub");
}

void GXSetTevAlphaIn(GXTevStageID stage, GXTevAlphaArg a, GXTevAlphaArg b, GXTevAlphaArg c, GXTevAlphaArg d)
{
    puts("GXSetTevAlphaIn is a stub");
}

void GXSetTevColorOp(GXTevStageID stage, GXTevOp op, GXTevBias bias, GXTevScale scale, GXBool clamp, GXTevRegID out_reg)
{
    puts("GXSetTevColorOp is a stub");
}

void GXSetTevAlphaOp(GXTevStageID stage, GXTevOp op, GXTevBias bias, GXTevScale scale, GXBool clamp, GXTevRegID out_reg)
{
    puts("GXSetTevAlphaOp is a stub");
}

void GXSetTevColor(GXTevRegID id, GXColor color)
{
    puts("GXSetTevColor is a stub");
}

void GXSetTevKColor(GXTevKColorID id, GXColor color)
{
    puts("GXSetTevKColor is a stub");
}

void GXSetTevKColorSel(GXTevStageID stage, GXTevKColorSel sel)
{
    puts("GXSetTevKColorSel is a stub");
}

void GXSetTevKAlphaSel(GXTevStageID stage, GXTevKAlphaSel sel)
{
    puts("GXSetTevKAlphaSel is a stub");
}

void GXSetTevSwapMode(GXTevStageID stage, GXTevSwapSel ras_sel, GXTevSwapSel tex_sel)
{
    puts("GXSetTevSwapMode is a stub");
}

void GXSetTevSwapModeTable(GXTevSwapSel table, GXTevColorChan red, GXTevColorChan green, GXTevColorChan blue, GXTevColorChan alpha)
{
    puts("GXSetTevSwapModeTable is a stub");
}

void GXSetTevOrder(GXTevStageID stage, GXTexCoordID coord, GXTexMapID map, GXChannelID color)
{
    puts("GXSetTevOrder is a stub");
}

void GXSetNumTevStages(u8 nStages)
{
    puts("GXSetNumTevStages is a stub");
}

/* Geometry */

void __GXSetDirtyState(void)
{
    puts("__GXSetDirtyState is a stub");
}

void GXBegin(GXPrimitive type, GXVtxFmt vtxfmt, u16 nverts)
{
    GLenum mode;

    //puts("GXBegin");
    switch (type)
    {
    case GX_POINTS:        mode = GL_POINTS;         break;
    case GX_LINES:         mode = GL_LINES;          break;
    case GX_LINESTRIP:     mode = GL_LINE_STRIP;     break;
    case GX_TRIANGLES:     mode = GL_TRIANGLES;      break;
    case GX_TRIANGLESTRIP: mode = GL_TRIANGLE_STRIP; break;
    case GX_TRIANGLEFAN:   mode = GL_TRIANGLE_FAN;   break;
    case GX_QUADS:         mode = GL_QUADS;          break;
    default: assert(0);
    }
    glBegin(mode);
}

void GXEnd(void)
{
    //puts("GXEnd");
    glEnd();

    /*
    glBegin(GL_TRIANGLES);
    glVertex3f(0, 0, 0);
    glVertex3f(0, 1, 0);
    glVertex3f(1, 1, 0);
    glEnd();
    */
    glFlush();  // TODO: remove
}

void GXSetLineWidth(u8 width, GXTexOffset texOffsets)
{
    puts("GXSetLineWidth is a stub");
}

void GXSetCullMode(GXCullMode mode)
{
    puts("GXSetCullMode is a stub");
}

/* DisplayList */

void GXBeginDisplayList(void *list, u32 size)
{
    puts("GXBeginDisplayList is a stub");
}

u32 GXEndDisplayList(void)
{
    puts("GXEndDisplayList is a stub");
    return 0;
}

void GXCallDisplayList(void *list, u32 nbytes)
{
    puts("GXCallDisplayList is a stub");
}

/* Fifo */

static GXFifoObj *GPFifo;
static GXFifoObj *CPUFifo;

void GXInitFifoBase(GXFifoObj *fifo, void *base, u32 size)
{
    puts("GXInitFifoBase is a stub");
}

void GXInitFifoPtrs(GXFifoObj *fifo, void *readPtr, void *writePtr)
{
    puts("GXInitFifoPtrs is a stub");
}

void GXSetCPUFifo(GXFifoObj *fifo)
{
    puts("GXSetCPUFifo is a stub");
    CPUFifo = fifo;
}

void GXSetGPFifo(GXFifoObj *fifo)
{
    puts("GXSetGPFifo is a stub");
    GPFifo = fifo;
}

void GXSaveCPUFifo(GXFifoObj *fifo)
{
    puts("GXSaveCPUFifo is a stub");
}

void GXGetGPStatus(u8 *overhi, u8 *underlow, u8 *readIdle, u8 *cmdIdle, u8 *brkpt)
{
    puts("GXGetGPStatus is a stub");
    *overhi = *underlow = *readIdle = *cmdIdle = *brkpt = 0;
    *readIdle = TRUE;
}

void GXGetFifoPtrs(GXFifoObj *fifo, void **readPtr, void **writePtr)
{
    puts("GXGetFifoPtrs is a stub");
    *readPtr = NULL;
    *writePtr = NULL;
}

GXFifoObj *GXGetCPUFifo(void)
{
    return CPUFifo;
}

GXFifoObj *GXGetGPFifo(void)
{
    return GPFifo;
}

/* Light */

typedef struct
{
    u8 filler0[0xC];
    u32 color;
    f32 unk10;
    f32 unk14;
    f32 unk18;
    f32 k0;
    f32 k1;
    f32 k2;
    f32 posX;
    f32 posY;
    f32 posZ;
    f32 dirX;
    f32 dirY;
    f32 dirZ;
} __GXLightObj;

void GXInitLightAttnK(GXLightObj *lt_obj, f32 k0, f32 k1, f32 k2)
{
    __GXLightObj *__lt_obj = (__GXLightObj *)lt_obj;
    __lt_obj->k0 = k0;
    __lt_obj->k1 = k1;
    __lt_obj->k2 = k2;
}

void GXInitLightSpot(GXLightObj *lt_obj, f32 cutoff, GXSpotFn spot_func)
{
    __GXLightObj *__lt_obj = (__GXLightObj *)lt_obj;
    f32 temp_f1;
    f32 tempSq;
    f32 var_f5, var_f2, var_f3;

    if (cutoff <= 0.0f || cutoff > 90.0f)
        spot_func = GX_SP_OFF;

    temp_f1 = cosf((3.1415927f * cutoff) / 180.0f);

    switch (spot_func)
    {
    case GX_SP_FLAT:
        var_f5 = -1000.0f * temp_f1;
        var_f2 = 1000.0f;
        var_f3 = 0.0f;
        break;
    case GX_SP_COS:
        var_f5 = -temp_f1 / (1.0f - temp_f1);
        var_f2 = 1.0f / (1.0f - temp_f1);
        var_f3 = 0.0f;
        break;
    case GX_SP_COS2:
        var_f5 = 0.0f;
        var_f2 = -temp_f1 / (1.0f - temp_f1);
        var_f3 = 1.0f / (1.0f - temp_f1);
        break;
    case GX_SP_SHARP:
        tempSq = 1.0f - temp_f1;
        tempSq = tempSq * tempSq;
        var_f5 = (temp_f1 * (temp_f1 - 2.0f)) / tempSq;
        var_f2 = 2.0f / tempSq;
        var_f3 = -1.0f / tempSq;
        break;
    case GX_SP_RING1:
        tempSq = 1.0f - temp_f1;
        tempSq = tempSq * tempSq;
        var_f5 = (-4.0f * temp_f1) / tempSq;
        var_f2 = (4.0f * (1.0f + temp_f1)) / tempSq;
        var_f3 = -4.0f / tempSq;
        break;
    case GX_SP_RING2:
        tempSq = 1.0f - temp_f1;
        tempSq = tempSq * tempSq;
        var_f5 = 1.0f - ((2.0f * temp_f1 * temp_f1) / tempSq);
        var_f2 = (4.0f * temp_f1) / tempSq;
        var_f3 = -2.0f / tempSq;
        break;
    case GX_SP_OFF:
    default:
        var_f5 = 1.0f;
        var_f2 = 0.0f;
        var_f3 = 0.0f;
        break;
    }
    __lt_obj->unk10 = var_f5;
    __lt_obj->unk14 = var_f2;
    __lt_obj->unk18 = var_f3;
}

void GXInitLightDistAttn(GXLightObj *lt_obj, f32 ref_distance,
    f32 ref_brightness, GXDistAttnFn dist_func)
{
    f32 k0, k1, k2;

    if (ref_distance < 0.0f)
        dist_func = GX_DA_OFF;
    if (ref_brightness <= 0.0f || ref_brightness >= 1.0f)
        dist_func = GX_DA_OFF;

    switch (dist_func)
    {
    case GX_DA_GENTLE:
        k0 = 1.0f;
        k1 = (1.0f - ref_brightness) / (ref_brightness * ref_distance);
        k2 = 0.0f;
        break;
    case GX_DA_MEDIUM:
        k0 = 1.0f;
        k1 = (0.5f * (1.0f - ref_brightness)) / (ref_brightness * ref_distance);
        k2 = (0.5f * (1.0f - ref_brightness)) / (ref_brightness * ref_distance * ref_distance);
        break;
    case GX_DA_STEEP:
        k0 = 1.0f;
        k1 = 0.0f;
        k2 = (1.0f - ref_brightness) / (ref_brightness * ref_distance * ref_distance);
        break;
    case GX_DA_OFF:
    default:
        k0 = 1.0f;
        k1 = 0.0f;
        k2 = 0.0f;
        break;
    }

    GXInitLightAttnK(lt_obj, k0, k1, k2);
}

void GXInitLightPos(GXLightObj *lt_obj, f32 x, f32 y, f32 z)
{
    __GXLightObj *__lt_obj = (__GXLightObj *)lt_obj;

    __lt_obj->posX = x;
    __lt_obj->posY = y;
    __lt_obj->posZ = z;
}

void GXGetLightPos(GXLightObj *lt_obj, f32 *x, f32 *y, f32 *z)
{
    __GXLightObj *__lt_obj = (__GXLightObj *)lt_obj;

    *x = __lt_obj->posX;
    *y = __lt_obj->posY;
    *z = __lt_obj->posZ;
}

void GXInitLightDir(GXLightObj *lt_obj, f32 nx, f32 ny, f32 nz)
{
    __GXLightObj *__lt_obj = (__GXLightObj *)lt_obj;

    __lt_obj->dirX = -nx;
    __lt_obj->dirY = -ny;
    __lt_obj->dirZ = -nz;
}

void GXInitLightColor(GXLightObj *lt_obj, GXColor color)
{
    __GXLightObj *__lt_obj = (__GXLightObj *)lt_obj;

    __lt_obj->color = (color.r << 24)
                    | (color.g << 16)
                    | (color.b << 8)
                    | color.a;
}

void GXGetLightColor(GXLightObj *lt_obj, GXColor *color)
{
    __GXLightObj *__lt_obj = (__GXLightObj *)lt_obj;

    color->r = __lt_obj->color >> 24;
    color->g = __lt_obj->color >> 16;
    color->b = __lt_obj->color >> 8;
    color->a = __lt_obj->color;
}

void GXLoadLightObjImm(GXLightObj *lt_obj, GXLightID light)
{
    __GXLightObj *__lt_obj = (__GXLightObj *)lt_obj;
    GLenum lightId = light - GX_LIGHT0 + GL_LIGHT0;

    puts("GXLoadLightObjImm is a stub");
    /*
    printf("light %i\n", lightId);
    glEnable(lightId);
    glLightfv(lightId, GL_POSITION, (void *)&__lt_obj->posX);
    */
}

void GXSetChanAmbColor(GXChannelID chan, GXColor amb_color)
{
    puts("GXSetChanAmbColor is a stub");
}

void GXSetChanMatColor(GXChannelID chan, GXColor mat_color)
{
    puts("GXSetChanMatColor is a stub");
}

void GXSetNumChans(u8 nChans)
{
    puts("GXSetNumChans is a stub");
}

void GXSetChanCtrl(GXChannelID chan, GXBool enable, GXColorSrc amb_src,
    GXColorSrc mat_src, u32 light_mask, GXDiffuseFn diff_fn, GXAttnFn attn_fn)
{
    puts("GXSetChanCtrl is a stub");

    // ¯\_(ツ)_/¯
    if (enable)
        glEnable(GL_LIGHTING);
    else
        glDisable(GL_LIGHTING);
}

/* Texture */

typedef struct
{
    u16 width;
    u16 height;
    GXTexFmt format;
    u8 *uncompressed;
    GLuint textureId;
    void *data;
    u8 wrapS;
    u8 wrapT;
} __GXTexObj;

static_assert(sizeof(__GXTexObj) <= sizeof(GXTexObj));

GXTexFmt GXGetTexObjFmt(GXTexObj *tex_obj)
{
    return ((__GXTexObj *)tex_obj)->format;
}

u16 GXGetTexObjWidth(GXTexObj *tex_obj)
{
    return ((__GXTexObj *)tex_obj)->width;
}

u16 GXGetTexObjHeight(GXTexObj *tex_obj)
{
    return ((__GXTexObj *)tex_obj)->height;
}

void *GXGetTexObjData(GXTexObj *tex_obj)
{
    return ((__GXTexObj *)tex_obj)->data;
}

GXTexWrapMode GXGetTexObjWrapS(GXTexObj *tex_obj)
{
    return ((__GXTexObj *)tex_obj)->wrapS;
}

GXTexWrapMode GXGetTexObjWrapT(GXTexObj *tex_obj)
{
    return ((__GXTexObj *)tex_obj)->wrapT;
}

u32 GXGetTexBufferSize(u16 width, u16 height, u32 format, GXBool mipmap,
    u8 max_lod)
{
    puts("GXGetTexBufferSize is a stub");
    switch (format)
    {
    case GX_TF_CMPR:
        return width * height * 4;
        break;
    default:
        assert(0);  // TODO
        break;
    }
}

static u16 read_u16(const u8 *src)
{
    return (src[0] << 8) | src[1];
}

static u32 read_u32(const u8 *src)
{
    return (src[0] << 24) | (src[1] << 16) | (src[2] << 8) | src[3];
}

static GXColor rgb565_to_color(u16 color)
{
    GXColor out;

    out.r = ((color >> 11) & 0x1F) << 3;
    out.g = ((color >>  5) & 0x3F) << 2;
    out.b = ((color >>  0) & 0x1F) << 3;
    out.a = 255;
    return out;
}

static u8 s3tc_blend(u32 a, u32 b)
{
    return ((((a << 1) + a) + ((b << 2) + b)) >> 3);
}

static u8 half_blend(u32 a, u32 b)
{
    return (a + b) >> 1;
}

static void decode_tile(const u8 *restrict src, u8 *restrict dest, int x, int y, int width, int height)
{
    u16 c1 = read_u16(src + 0);
    u16 c2 = read_u16(src + 2);
    GXColor colors[4] = {0};
    int tx, ty;

    src += 4;
    colors[0] = rgb565_to_color(c1);
    colors[1] = rgb565_to_color(c2);
    if (c1 > c2)
    {
        colors[2].r = s3tc_blend(colors[1].r, colors[0].r);
        colors[2].g = s3tc_blend(colors[1].g, colors[0].g);
        colors[2].b = s3tc_blend(colors[1].b, colors[0].b);
        colors[2].a = 255;
        colors[3].r = s3tc_blend(colors[0].r, colors[1].r);
        colors[3].g = s3tc_blend(colors[0].g, colors[1].g);
        colors[3].b = s3tc_blend(colors[0].b, colors[1].b);
        colors[3].a = 255;
    }
    else
    {
        colors[2].r = half_blend(colors[0].r, colors[1].r);
        colors[2].g = half_blend(colors[0].g, colors[1].g);
        colors[2].b = half_blend(colors[0].b, colors[1].b);
        colors[2].a = 255;
        colors[3] = colors[2];
        colors[3].a = 0;
    }

    for (ty = 0; ty < 4; ty++)
    {
        u32 val = *src++;
        for (tx = 0; tx < 4; tx++)
        {
            GXColor color = colors[(val >> 6) & 3];
            int index = (y + ty) * width + (x + tx);
            dest[index*4 + 0] = color.r;
            dest[index*4 + 1] = color.g;
            dest[index*4 + 2] = color.b;
            dest[index*4 + 3] = color.a;
            val <<= 2;
        }
    }
}

static void decompress_cmpr_texture(u8 *restrict src, u8 *restrict dest, int width, int height)
{
    int x, y;

    for (y = 0; y < height / 8; y++)
    {
        for (x = 0; x < width / 8; x++)
        {
            // decode block
            decode_tile(src, dest, x*8 + 0, y*8 + 0, width, height);
            src += 8;
            decode_tile(src, dest, x*8 + 4, y*8 + 0, width, height);
            src += 8;
            decode_tile(src, dest, x*8 + 0, y*8 + 4, width, height);
            src += 8;
            decode_tile(src, dest, x*8 + 4, y*8 + 4, width, height);
            src += 8;
        }
    }
}

static void decompress_i4_texture(const u8 *restrict src, u8 *restrict dest, int width, int height)
{
    int x, y;

    for (y = 0; y < height / 8; y++)
    {
        for (x = 0; x < width / 8; x++)
        {
            // decode block
            int tx, ty;

            for (ty = 0; ty < 8; ty++)
            {
                /*
                int index = (y*8 + ty) * width + x*8;
                dest[index++] = ((*src >> 4) & 0xF) << 4;
                dest[index++] = (*src & 0xF) << 4;
                src++;
                dest[index++] = ((*src >> 4) & 0xF) << 4;
                dest[index++] = (*src & 0xF) << 4;
                src++;
                dest[index++] = ((*src >> 4) & 0xF) << 4;
                dest[index++] = (*src & 0xF) << 4;
                src++;
                dest[index++] = ((*src >> 4) & 0xF) << 4;
                dest[index++] = (*src & 0xF) << 4;
                src++;
                */
                for (tx = 0; tx < 8; tx++)
                {
                    int index = (y*8 + ty) * width + x*8 + tx;
                    u8 intensity = (src[tx / 2] >> ((tx & 1) ? 0 : 4)) & 0xF;
                    dest[index] = intensity << 4;
                }
                src += 4;
            }
        }
    }
}

static void decompress_ia4_texture(const u8 *restrict src, u8 *restrict dest, int width, int height)
{
    int x, y;

    for (y = 0; y < height / 4; y++)
    {
        for (x = 0; x < width / 8; x++)
        {
            // decode block
            int tx, ty;

            for (ty = 0; ty < 4; ty++)
            {
                for (tx = 0; tx < 8; tx++)
                {
                    int index = (y*4 + ty) * width + (x*8 + tx);
                    dest[index*2 + 0] = (*src & 0xFF) << 4;
                    dest[index*2 + 1] = ((*src >> 4) & 0xFF) << 4;
                    src++;
                }
            }
        }
    }
}

static void decompress_rgb5a3_texture(const u8 *restrict src, u8 *restrict dest, int width, int height)
{
    int x, y;

    for (y = 0; y < height / 4; y++)
    {
        for (x = 0; x < width / 4; x++)
        {
            // decode block
            int tx, ty;

            for (ty = 0; ty < 4; ty++)
            {
                for (tx = 0; tx < 4; tx++)
                {
                    int index = (y*4 + ty) * width + (x*4 + tx);
                    u16 color = read_u16(src);
                    u8 r, g, b, a;

                    src += 2;
                    if (color & (1 << 15))
                    {
                        a = 255;
                        r = ((color >> 10) & 0x1F) << 3;
                        g = ((color >> 5) & 0x1F) << 3;
                        b = ((color >> 0) & 0x1F) << 3;
                    }
                    else
                    {
                        a = ((color >> 12) & 0x7) << 5;
                        r = ((color >> 8) & 0xF) << 4;
                        g = ((color >> 4) & 0xF) << 4;
                        b = ((color >> 0) & 0xF) << 4;
                    }
                    dest[index*4 + 0] = r;
                    dest[index*4 + 1] = g;
                    dest[index*4 + 2] = b;
                    dest[index*4 + 3] = a;
                }
            }
        }
    }
}

static GLenum gx_wrap_to_gl_wrap(GXTexWrapMode wrap)
{
    static const GLenum wrapModes[] =
    {
        GL_CLAMP_TO_EDGE,
        GL_REPEAT,
        GL_MIRRORED_REPEAT,
    };

    assert(wrap >= 0 && wrap < GX_MAX_TEXWRAPMODE);
    return wrapModes[wrap];
}

void GXInitTexObj(GXTexObj *obj, void *image_ptr, u16 width, u16 height,
    GXTexFmt format, GXTexWrapMode wrap_s, GXTexWrapMode wrap_t, GXBool mipmap)
{
    __GXTexObj *__obj = (__GXTexObj *)obj;
    int type = -1;
    int glFmt = -1;
    void *img = image_ptr;

    printf("GXInitTexObj: fmt %i, %i x %i\n", format, width, height);
    memset(__obj, 0, sizeof(*__obj));
    __obj->width = width;
    __obj->height = height;
    __obj->format = format;
    __obj->data = image_ptr;
    __obj->wrapS = wrap_s;
    __obj->wrapT = wrap_t;
    switch (format)
    {
    case GX_TF_CMPR:
        __obj->uncompressed = calloc(width * height * 4, 1);
        decompress_cmpr_texture(image_ptr, __obj->uncompressed, width, height);
        type = GL_UNSIGNED_BYTE;
        glFmt = GL_RGBA;
        img = __obj->uncompressed;
        break;
    case GX_TF_I4:
        __obj->uncompressed = calloc(width * height, 1);
        decompress_i4_texture(image_ptr, __obj->uncompressed, width, height);
        type = GL_UNSIGNED_BYTE;
        glFmt = GL_LUMINANCE;
        img = __obj->uncompressed;
        break;
    case GX_TF_IA4:
        __obj->uncompressed = calloc(width * height * 2, 1);
        decompress_ia4_texture(image_ptr, __obj->uncompressed, width, height);
        type = GL_UNSIGNED_BYTE;
        glFmt = GL_LUMINANCE_ALPHA;
        img = __obj->uncompressed;
        break;
    case GX_TF_RGB5A3:
        __obj->uncompressed = calloc(width * height * 4, 1);
        decompress_rgb5a3_texture(image_ptr, __obj->uncompressed, width, height);
        type = GL_UNSIGNED_BYTE;
        glFmt = GL_RGBA;
        img = __obj->uncompressed;
        break;
    case GX_TF_I8:
        type = GL_UNSIGNED_BYTE;
        glFmt = GL_LUMINANCE;
        break;
    case GX_TF_RGB565:
        type = GL_UNSIGNED_SHORT_5_6_5;
        glFmt = GL_RGB;
        break;
    case GX_TF_RGBA8:
        type = GL_UNSIGNED_BYTE;
        glFmt = GL_RGBA;
        break;
    default:
        assert(0);
    }

    assert(type != -1);
    assert(glFmt != -1);
    glGenTextures(1, &__obj->textureId);
    glBindTexture(GL_TEXTURE_2D, __obj->textureId);
    glTexImage2D(GL_TEXTURE_2D, 0, glFmt, width, height, 0, glFmt, type, img);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, gx_wrap_to_gl_wrap(wrap_s));
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, gx_wrap_to_gl_wrap(wrap_t));
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glBindTexture(GL_TEXTURE_2D, 0);

    /*
    //printf("using texture %i\n", __obj->textureId);
    glEnable(GL_TEXTURE_2D);
    glBindTexture(GL_TEXTURE_2D, __obj->textureId);
    glBegin(GL_QUADS);
    width = 640;
    height = 480;
    glTexCoord2f(0.0f, 0.0f); glVertex2f(0.0f, 0.0f);
    glTexCoord2f(1.0f, 0.0f); glVertex2f(width, 0.0f);
    glTexCoord2f(1.0f, 1.0f); glVertex2f(width, height);
    glTexCoord2f(0.0f, 1.0f); glVertex2f(0.0f, height);
    glEnd();
    glFlush();
    VIFlush();
    pause();
    */
}

void GXLoadTexObj(GXTexObj *obj, GXTexMapID id)
{
    __GXTexObj *__obj = (__GXTexObj *)obj;

    puts("GXLoadTexObj is a stub");
    printf("id %i\n", id);
    glActiveTexture(id);
    glBindTexture(GL_TEXTURE_2D, __obj->textureId);
}

/* Vert */

// TODO: use vertex arrays
static float savedX, savedY, savedZ;

void GXPosition2f32(const f32 x, const f32 y)
{
    glVertex2f(x, y);
}

void GXPosition3s16(const s16 x, const s16 y, const s16 z)
{
    glVertex3s(x, y, z);
}

void GXPosition3f32(const f32 x, const f32 y, const f32 z)
{
    //glVertex3f(x, y, z);
    savedX = x;
    savedY = y;
    savedZ = z;
}

void GXNormal3f32(const f32 x, const f32 y, const f32 z)
{
    glNormal3f(x, y, z);
}

void GXColor4u8(const u8 r, const u8 g, const u8 b, const u8 a)
{
    glColor4ub(r, g, b, a);
}

void GXTexCoord2s16(const s16 u, const s16 v)
{
    glTexCoord2s(u, v);
}

void GXTexCoord2f32(const f32 u, const f32 v)
{
    glTexCoord2f(u, v);

    glVertex3f(savedX, savedY, savedZ);
}

/* Pixel */

static GLenum gx_blend_to_gl_blend(GXBlendFactor in, BOOL isDest)
{
    static const GLenum blendFactors[] =
    {
        GL_ZERO,
        GL_ONE,
        GL_SRC_COLOR,
        GL_ONE_MINUS_SRC_COLOR,
        GL_SRC_ALPHA,
        GL_ONE_MINUS_SRC_ALPHA,
        GL_DST_ALPHA,
        GL_ONE_MINUS_DST_ALPHA,
    };

    assert(in >= 0 && in <= 7);
    // GX_BL_DSTCLR and GX_BL_SRCCLR are the same value, as well as GX_BL_INVDSTCLR and GX_BL_INVSRCCLR,
    // so we must correctly convert these based on whether this is the source or destination.
    if (isDest)
    {
        if (in == GX_BL_DSTCLR)
            return GL_DST_COLOR;
        if (in == GX_BL_INVDSTCLR)
            return GL_ONE_MINUS_DST_COLOR;
    }
    return blendFactors[in];
}

void GXSetBlendMode(GXBlendMode type, GXBlendFactor src_factor, GXBlendFactor dst_factor, GXLogicOp op)
{
    puts("GXSetBlendMode");
    switch (type)
    {
    case GX_BM_NONE:
        glDisable(GL_BLEND);
        break;
    case GX_BM_BLEND:
        glEnable(GL_BLEND);
        glBlendFunc(
            gx_blend_to_gl_blend(src_factor, FALSE),
            gx_blend_to_gl_blend(dst_factor, TRUE));
        break;
    default:
        assert(0);
    }
}

static GLenum gx_compare_to_gl_compare(GXCompare in)
{
    static const GLenum compares[] =
    {
        GL_NEVER,
        GL_LESS,
        GL_EQUAL,
        GL_LEQUAL,
        GL_GREATER,
        GL_NOTEQUAL,
        GL_GEQUAL,
        GL_ALWAYS,
    };

    assert(in >= 0 && in <= 7);
    return compares[in];
}

void GXSetZMode(GXBool compare_enable, GXCompare func, GXBool update_enable)
{
    glDepthFunc(gx_compare_to_gl_compare(func));

    if (compare_enable)
        glEnable(GL_DEPTH_TEST);
    else
        glDisable(GL_DEPTH_TEST);
    glDepthMask(update_enable);
}

/* FrameBuf */

GXRenderModeObj GXNtsc480IntDf =
{
    VI_TVMODE_NTSC_INT,
    640,
    480,
    480,
    40,
    0,
    640,
    480,
    VI_XFBMODE_DF,
    0,
    0,
};

void GXSetCopyClear(GXColor clear_clr, u32 clear_z)
{
    puts("GXSetCopyClear");
    glClearColor(clear_clr.r / 255.0f,
                 clear_clr.g / 255.0f,
                 clear_clr.b / 255.0f,
                 clear_clr.a / 255.0f);
    assert(clear_z == GX_MAX_Z24);  // TODO: handle other values
    glClearDepthf(1.0f);
}

void GXAdjustForOverscan(GXRenderModeObj *rmin, GXRenderModeObj *rmout,
    u16 hor, u16 ver)
{
    puts("GXAdjustForOverscan is a stub");
    *rmout = *rmin;
}

/* Init */

GXFifoObj *GXInit(void *base, u32 size)
{
    puts("GXInit is a stub");
#ifdef _WIN32
    if (glewInit() != GLEW_OK)
    {
        fputs("failed to initialize glew\n", stderr);
        exit(1);
    }
#endif
    glDisable(GL_CULL_FACE);
    glEnable(GL_TEXTURE_2D);
    glEnable(GL_DEPTH_TEST);

    // set up interpolation formula?
    /*
    glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_COMBINE);
    glTexEnvi(GL_TEXTURE_ENV, GL_COMBINE_RGB, GL_INTERPOLATE);
    glTexEnvi(GL_TEXTURE_ENV, GL_COMBINE_ALPHA, GL_INTERPOLATE);
    */
    return NULL;
}

/* Misc */

GXDrawDoneCallback DrawDoneCB = NULL;

GXDrawDoneCallback GXSetDrawDoneCallback(GXDrawDoneCallback cb)
{
    GXDrawDoneCallback old = DrawDoneCB;
    DrawDoneCB = cb;
    return old;
}

void GXDrawDone(void)
{
    puts("GXDrawDone is a stub");
    DrawDoneCB();
}

void GXSetDrawDone(void)
{
    puts("GXSetDrawDone is a stub");
    DrawDoneCB();
}
