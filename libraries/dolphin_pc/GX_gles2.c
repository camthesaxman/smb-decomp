#include <assert.h>
#include <limits.h>
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <dolphin.h>

#define ARRAY_COUNT(arr) ((int)(sizeof(arr)/sizeof(arr[0])))

#ifdef _WIN32
#define GLEW_STATIC
#include <GL/glew.h>
#include <windows.h>
#ifndef GL_APIENTRY
#define GL_APIENTRY APIENTRY
#endif
#else
#define GL_GLEXT_PROTOTYPES
#include <GLES2/gl2.h>
#include <GLES2/gl2ext.h>
#define glDebugMessageCallback glDebugMessageCallbackKHR
#define GL_DEBUG_OUTPUT GL_DEBUG_OUTPUT_KHR
#endif

#include "__dolphin_pc.h"

//#define puts(...)

/*
void pause(void)
{
    char *line = NULL;
    size_t len = 0;
    getline(&line, &len, stdin);
    free(line);
}
*/

static GLuint s_program;
static GLint s_shaderPositionIndex;
static GLint s_shaderNormalIndex;
static GLint s_shaderTexCoordIndex;
static GLint s_shaderColorIndex;

static struct
{
    int drawCalls;
    int shaderCompiles;
    int textureLoads;
} s_renderStats;

static Mtx44 s_projectionMtx;
static GXProjectionType s_projectionType;
static Mtx44 s_positionMatrices[10];
static Mtx44 s_normalMatrices[10];
static int s_currMtx;
static Mtx44 s_textureMatrices[11];
static int s_currTexMtx;

static u16 read_u16(const u8 *src)
{
    return (src[0] << 8) | src[1];
}

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

/* Debug */

#ifdef DEBUG

#define NAME(x) [x] = #x
static const char *GXBool_name(GXBool in)
{
    static const char *names[] =
    {
        NAME(GX_FALSE),
        NAME(GX_TRUE),
    };
    return names[in];
}
static const char *GXChannelID_name(GXChannelID in)
{
    static const char *names[] =
    {
        NAME(GX_COLOR0),
        NAME(GX_COLOR1),
        NAME(GX_ALPHA0),
        NAME(GX_ALPHA1),
        NAME(GX_COLOR0A0),
        NAME(GX_COLOR1A1),
        NAME(GX_COLOR_ZERO),
        NAME(GX_ALPHA_BUMP),
        NAME(GX_ALPHA_BUMPN),
        NAME(GX_COLOR_NULL),
    };
    return names[in];
}
static const char *GXTevColorArg_name(GXTevColorArg in)
{
    static const char *names[] =
    {
        NAME(GX_CC_CPREV),
        NAME(GX_CC_APREV),
        NAME(GX_CC_C0),
        NAME(GX_CC_A0),
        NAME(GX_CC_C1),
        NAME(GX_CC_A1),
        NAME(GX_CC_C2),
        NAME(GX_CC_A2),
        NAME(GX_CC_TEXC),
        NAME(GX_CC_TEXA),
        NAME(GX_CC_RASC),
        NAME(GX_CC_RASA),
        NAME(GX_CC_ONE),
        NAME(GX_CC_HALF),
        NAME(GX_CC_KONST),
        NAME(GX_CC_ZERO),
    };
    return names[in];
}
static const char *GXTevAlphaArg_name(GXTevAlphaArg in)
{
    static const char *names[] =
    {
        NAME(GX_CA_APREV),
        NAME(GX_CA_A0),
        NAME(GX_CA_A1),
        NAME(GX_CA_A2),
        NAME(GX_CA_TEXA),
        NAME(GX_CA_RASA),
        NAME(GX_CA_KONST),
        NAME(GX_CA_ZERO),
    };
    return names[in];
}
static const char *GXColorSrc_name(GXColorSrc in)
{
    static const char *names[] =
    {
        NAME(GX_SRC_REG),
        NAME(GX_SRC_VTX),
    };
    return names[in];
}
#undef NAME

#endif  // DEBUG

/* Attr */

struct VtxFmt
{
    GXCompCnt cnt;
    GXCompType type;
    u8 frac;
};

static struct VtxFmt s_vtxFmts[GX_MAX_VTXFMT][GX_VA_MAX_ATTR] = {0};
static GXAttrType s_attrTypes[GX_VA_MAX_ATTR];

void GXGetVtxAttrFmt(GXVtxFmt idx, GXAttr attr, GXCompCnt *compCnt, GXCompType *compType, u8 *shift)
{
    *compCnt = s_vtxFmts[idx][attr].cnt;
    *compType = s_vtxFmts[idx][attr].type;
    *shift = s_vtxFmts[idx][attr].frac;
}

void GXSetVtxAttrFmt(GXVtxFmt vtxfmt, GXAttr attr, GXCompCnt cnt,
    GXCompType type, u8 frac)
{
    assert(vtxfmt >= 0 && vtxfmt < GX_MAX_VTXFMT);
    assert(attr >= 0 && attr < GX_VA_MAX_ATTR);
    s_vtxFmts[vtxfmt][attr].cnt = cnt;
    s_vtxFmts[vtxfmt][attr].type = type;
    s_vtxFmts[vtxfmt][attr].frac = frac;
}

void GXSetVtxDesc(GXAttr attr, GXAttrType type)
{
    assert(attr >= 0 && attr < GX_VA_MAX_ATTR);
    s_attrTypes[attr] = type;
}

void GXClearVtxDesc(void)
{
    memset(s_attrTypes, 0, sizeof(s_attrTypes));
}

void GXSetTexCoordGen2(GXTexCoordID dst_coord, GXTexGenType func, GXTexGenSrc src_param, u32 mtx, GXBool normalize, u32 postmtx)
{
    debug_puts("GXSetTexCoordGen2 is a stub");
    if (dst_coord == GX_TEXCOORD0)
        s_currTexMtx = (mtx - 30) / 3;
}

/* Tev */

struct TevStageConfig
{
    u8 colorArgs[4];
    u8 alphaArgs[4];

    u8 colorOp:4;
    u8 colorBias:2;
    u8 colorScale:2;
    u8 colorOut;

    u8 alphaOp:4;
    u8 alphaBias:2;
    u8 alphaScale:2;
    u8 alphaOut;

    u8 channelId;
};

// All of the information that goes into generating shader code
// This does not include uniform values
struct TevConfig
{
    struct TevStageConfig stages[GX_MAX_TEVSTAGE];
    int numTevStages;
};

struct ChannelConfig
{
    u8 ambSrc:1;
    u8 matSrc:1;
    u8 lightEnabled:1;
    u8 lightMask;
};

struct LightConfig
{
    u8 spotFn[8];
    u8 distAttnFn[8];
    struct ChannelConfig channels[2];
    u8 numChans;
};

static struct TevConfig s_currTevConfig = {0};
static struct LightConfig s_currLightConfig = {0};

static GXColor s_konstColors[GX_MAX_KCOLOR];
static GXTevKColorSel s_konstColorSel[GX_MAX_TEVSTAGE];
static GXTevKAlphaSel s_konstAlphaSel[GX_MAX_TEVSTAGE];
static GXColor s_konstColor;
static GXColor s_tevRegs[4];
static GLint s_currTextureId;

static GXColor s_chanMatColors[2];
static GXColor s_chanAmbColors[2];
static __GXLightObj s_lightObjs[8];

struct ShaderInfo
{
    struct TevConfig tevConfig;  // fragment shader info
    struct LightConfig lightConfig;  // vertex shader info
    GLuint program;
    GLuint vtxShader;
    GLuint fragShader;
    int lastUsed;
};

static struct ShaderInfo s_shaderCache[64] = {0};
static int s_shaderLastUsed = 1;

static void gxcolor_to_float_arr(GXColor color, GLfloat *out)
{
    out[0] = color.r / 255.0f;
    out[1] = color.g / 255.0f;
    out[2] = color.b / 255.0f;
    out[3] = color.a / 255.0f;
}

static void calc_konst_color(GXTevStageID stage, float *out)
{
    switch (s_konstColorSel[stage])
    {
    case GX_TEV_KCSEL_1:   out[0] = out[1] = out[2] = 1.0f;      break;
    case GX_TEV_KCSEL_7_8: out[0] = out[1] = out[2] = 7.0f/8.0f; break;
    case GX_TEV_KCSEL_3_4: out[0] = out[1] = out[2] = 3.0f/4.0f; break;
    case GX_TEV_KCSEL_5_8: out[0] = out[1] = out[2] = 5.0f/8.0f; break;
    case GX_TEV_KCSEL_1_2: out[0] = out[1] = out[2] = 1.0f/2.0f; break;
    case GX_TEV_KCSEL_3_8: out[0] = out[1] = out[2] = 3.0f/8.0f; break;
    case GX_TEV_KCSEL_1_4: out[0] = out[1] = out[2] = 1.0f/4.0f; break;
    case GX_TEV_KCSEL_1_8: out[0] = out[1] = out[2] = 1.0f/8.0f; break;

    case GX_TEV_KCSEL_K0: gxcolor_to_float_arr(s_konstColors[0], out); break;
    case GX_TEV_KCSEL_K1: gxcolor_to_float_arr(s_konstColors[1], out); break;
    case GX_TEV_KCSEL_K2: gxcolor_to_float_arr(s_konstColors[2], out); break;
    case GX_TEV_KCSEL_K3: gxcolor_to_float_arr(s_konstColors[3], out); break;

    case GX_TEV_KCSEL_K0_R: out[0] = out[1] = out[2] = s_konstColors[0].r / 255.0f; break;
    case GX_TEV_KCSEL_K1_R: out[0] = out[1] = out[2] = s_konstColors[1].r / 255.0f; break;
    case GX_TEV_KCSEL_K2_R: out[0] = out[1] = out[2] = s_konstColors[2].r / 255.0f; break;
    case GX_TEV_KCSEL_K3_R: out[0] = out[1] = out[2] = s_konstColors[3].r / 255.0f; break;

    case GX_TEV_KCSEL_K0_G: out[0] = out[1] = out[2] = s_konstColors[0].g / 255.0f; break;
    case GX_TEV_KCSEL_K1_G: out[0] = out[1] = out[2] = s_konstColors[1].g / 255.0f; break;
    case GX_TEV_KCSEL_K2_G: out[0] = out[1] = out[2] = s_konstColors[2].g / 255.0f; break;
    case GX_TEV_KCSEL_K3_G: out[0] = out[1] = out[2] = s_konstColors[3].g / 255.0f; break;

    case GX_TEV_KCSEL_K0_B: out[0] = out[1] = out[2] = s_konstColors[0].b / 255.0f; break;
    case GX_TEV_KCSEL_K1_B: out[0] = out[1] = out[2] = s_konstColors[1].b / 255.0f; break;
    case GX_TEV_KCSEL_K2_B: out[0] = out[1] = out[2] = s_konstColors[2].b / 255.0f; break;
    case GX_TEV_KCSEL_K3_B: out[0] = out[1] = out[2] = s_konstColors[3].b / 255.0f; break;

    case GX_TEV_KCSEL_K0_A: out[0] = out[1] = out[2] = s_konstColors[0].a / 255.0f; break;
    case GX_TEV_KCSEL_K1_A: out[0] = out[1] = out[2] = s_konstColors[1].a / 255.0f; break;
    case GX_TEV_KCSEL_K2_A: out[0] = out[1] = out[2] = s_konstColors[2].a / 255.0f; break;
    case GX_TEV_KCSEL_K3_A: out[0] = out[1] = out[2] = s_konstColors[3].a / 255.0f; break;

    default:
        assert(0);
    }

    switch (s_konstAlphaSel[stage])
    {
    case GX_TEV_KASEL_1:   out[3] = 1.0f;      break;
    case GX_TEV_KASEL_7_8: out[3] = 7.0f/8.0f; break;
    case GX_TEV_KASEL_3_4: out[3] = 3.0f/4.0f; break;
    case GX_TEV_KASEL_5_8: out[3] = 5.0f/8.0f; break;
    case GX_TEV_KASEL_1_2: out[3] = 1.0f/2.0f; break;
    case GX_TEV_KASEL_3_8: out[3] = 3.0f/8.0f; break;
    case GX_TEV_KASEL_1_4: out[3] = 1.0f/4.0f; break;
    case GX_TEV_KASEL_1_8: out[3] = 1.0f/8.0f; break;

    case GX_TEV_KASEL_K0_R: out[3] = s_konstColors[0].r / 255.0f; break;
    case GX_TEV_KASEL_K1_R: out[3] = s_konstColors[1].r / 255.0f; break;
    case GX_TEV_KASEL_K2_R: out[3] = s_konstColors[2].r / 255.0f; break;
    case GX_TEV_KASEL_K3_R: out[3] = s_konstColors[3].r / 255.0f; break;

    case GX_TEV_KASEL_K0_G: out[3] = s_konstColors[0].g / 255.0f; break;
    case GX_TEV_KASEL_K1_G: out[3] = s_konstColors[1].g / 255.0f; break;
    case GX_TEV_KASEL_K2_G: out[3] = s_konstColors[2].g / 255.0f; break;
    case GX_TEV_KASEL_K3_G: out[3] = s_konstColors[3].g / 255.0f; break;

    case GX_TEV_KASEL_K0_B: out[3] = s_konstColors[0].b / 255.0f; break;
    case GX_TEV_KASEL_K1_B: out[3] = s_konstColors[1].b / 255.0f; break;
    case GX_TEV_KASEL_K2_B: out[3] = s_konstColors[2].b / 255.0f; break;
    case GX_TEV_KASEL_K3_B: out[3] = s_konstColors[3].b / 255.0f; break;

    case GX_TEV_KASEL_K0_A: out[3] = s_konstColors[0].a / 255.0f; break;
    case GX_TEV_KASEL_K1_A: out[3] = s_konstColors[1].a / 255.0f; break;
    case GX_TEV_KASEL_K2_A: out[3] = s_konstColors[2].a / 255.0f; break;
    case GX_TEV_KASEL_K3_A: out[3] = s_konstColors[3].a / 255.0f; break;

    default:
        assert(0);
    }
}

static const char *shader_tev_reg(GXTevRegID reg)
{
    static const char *const shaderRegs[] =
    {
        [GX_TEVPREV] = "tevRegPrev",
        [GX_TEVREG0] = "tevReg0",
        [GX_TEVREG1] = "tevReg1",
        [GX_TEVREG2] = "tevReg2",
    };
    assert(reg >= 0 && reg < GX_MAX_TEVREG);
    return shaderRegs[reg];
}

static const char *shader_tev_color_arg(GXTevColorArg arg)
{
    static const char *const shaderColorArgs[] =
    {
        [GX_CC_CPREV] = "tevRegPrev.xyz",
        [GX_CC_APREV] = "tevRegPrev.www",
        [GX_CC_C0]    = "tevReg0.xyz",
        [GX_CC_A0]    = "tevReg0.www",
        [GX_CC_C1]    = "tevReg1.xyz",
        [GX_CC_A1]    = "tevReg1.www",
        [GX_CC_C2]    = "tevReg2.xyz",
        [GX_CC_A2]    = "tevReg2.www",
        [GX_CC_TEXC]  = "texture2D(u_texture0,v_texCoord).xyz",
        [GX_CC_TEXA]  = "texture2D(u_texture0,v_texCoord).www",
        [GX_CC_RASC]  = "rasColor.xyz",
        [GX_CC_RASA]  = "rasColor.www",
        [GX_CC_ONE]   = "vec3(1.0,1.0,1.0)",
        [GX_CC_HALF]  = "vec3(0.5,0.5,0.5)",
        [GX_CC_KONST] = "konst.xyz",
        [GX_CC_ZERO]  = "vec3(0.0,0.0,0.0)",
    };
    assert(arg >= 0 && arg < 16);
    return shaderColorArgs[arg];
}

static const char *shader_tev_alpha_arg(GXTevAlphaArg arg)
{
    static const char *const shaderAlphaArgs[] =
    {
        [GX_CA_APREV] = "tevRegPrev.w",
        [GX_CA_A0]    = "tevReg0.w",
        [GX_CA_A1]    = "tevReg1.w",
        [GX_CA_A2]    = "tevReg2.w",
        [GX_CA_TEXA]  = "texture2D(u_texture0,v_texCoord).w",
        [GX_CA_RASA]  = "rasColor.w",
        [GX_CA_KONST] = "konst.w",
        [GX_CA_ZERO]  = "0.0",
    };
    assert(arg >= 0 && arg < 8);
    return shaderAlphaArgs[arg];
}

static const char *shader_tev_op(GXTevOp op)
{
    switch (op)
    {
    case GX_TEV_ADD: return "+";
    case GX_TEV_SUB: return "-";
    default:
        printf("op %i\n", op);
        assert(0);
        return NULL;
    }
}

static const char *shader_channel(GXChannelID chan)
{
    switch (chan)
    {
    case GX_COLOR0A0:   return "v_channel0";
    case GX_COLOR1A1:   return "v_channel1";
    case GX_COLOR_NULL: return "vec4(1.0,0.0,1.0,1.0)";
    default:
        printf("chan %i\n", chan);
        assert(0);
        return NULL;
    }
}

#ifdef DEBUG
static void dump_shaders(const struct ShaderInfo *shader)
{
    GLchar src[5000];
    static const char *uniformNames[] =
    {
        "u_tevRegPrev",
        "u_tevReg0",
        "u_tevReg1",
        "u_tevReg2",
        "u_konstColors",
        "u_modelViewMatrix",
        "u_projectionMatrix",
        "u_chanAmbColors",
        "u_chanMatColors",
        "u_lightPos",
        "u_lightDir",
    };
    static const char *attributeNames[] =
    {
        "a_position",
        "a_normal",
        "a_texCoord",
        "a_color",
    };
    int i;

    puts("Vertex Shader:");
    glGetShaderSource(shader->vtxShader, sizeof(src), NULL, src);
    puts(src);
    puts("Fragment Shader:");
    glGetShaderSource(shader->fragShader, sizeof(src), NULL, src);
    puts(src);
    puts("Uniforms:");
    for (i = 0; i < ARRAY_COUNT(uniformNames); i++)
        printf("\t%-18s %i\n", uniformNames[i], glGetUniformLocation(shader->program, uniformNames[i]));
    puts("Attributes:");
    for (i = 0; i < ARRAY_COUNT(attributeNames); i++)
        printf("\t%-18s %i\n", attributeNames[i], glGetAttribLocation(shader->program, attributeNames[i]));
}
#endif

static void prepare_shaders(void)
{
    static const char vtxShaderHeader[] =
        "#version 100\n"
        "precision mediump float;\n"
        "uniform   mat4 u_modelViewMatrix;\n"
        "uniform   mat4 u_projectionMatrix;\n"
        "uniform   mat4 u_textureMatrix;\n"
        "uniform   vec4 u_chanAmbColors[2];\n"  // ambient colors, per channel
        "uniform   vec4 u_chanMatColors[2];\n"  // material colors, per channel
        "uniform   vec3 u_lightPos[8];\n"
        "uniform   vec3 u_lightDir[8];\n"
        "attribute vec4 a_position;\n"
        "attribute vec3 a_normal;\n"
        "attribute vec2 a_texCoord;\n"
        "attribute vec4 a_color;\n"
        "varying   vec3 v_normal;\n"
        "varying   vec2 v_texCoord;\n"
        "varying   vec4 v_channel0;\n"
        "varying   vec4 v_channel1;\n"

        // Function to apply light to channel
        "vec4 dir_light(int light, vec4 channel, vec3 vertex, vec3 normal)\n"
        "{\n"
        // Get light vector to vertex
        "    vec3 lightVec = normalize(u_lightPos[light] - vertex);\n"
        // Calc dot product
        "    float diffuse = max(dot(normal, lightVec), 0.5);\n"
        // apply light to channel
        "    channel.xyz *= diffuse;\n"
        "    return channel;\n"
        "}\n"

        "void main()\n"
        "{\n"
        "    v_normal   = a_normal;\n"
        "    v_texCoord = vec2(u_textureMatrix * vec4(a_texCoord, 0.0, 1.0));\n"
        // Transform vertex into eye space
        "    vec3 mvVertex = vec3(u_modelViewMatrix * a_position);\n"
        // Transform the into eye space
        "    vec3 mvNormal = vec3(u_modelViewMatrix * vec4(a_normal, 0.0));\n"
        ;
    static const char vtxShaderFooter[] =
        "    gl_Position = u_projectionMatrix * u_modelViewMatrix * a_position;\n"
        "}\n";
    char vtxSrc[2][500];
    const GLchar *vtxSrcPtrs[2 + 2 + 8];

    static const char fragShaderHeader[] =
        "#version 100\n"
        "precision mediump float;\n"
        "uniform sampler2D u_texture0;\n"
        "uniform vec4 u_tevRegPrev;\n"
        "uniform vec4 u_tevReg0;\n"
        "uniform vec4 u_tevReg1;\n"
        "uniform vec4 u_tevReg2;\n"
        "uniform vec4 u_konstColors[16];\n"  // one for each stage
        "varying vec2 v_texCoord;\n"
        "varying vec4 v_channel0;\n"
        "varying vec4 v_channel1;\n"
        "void main()\n"
        "{\n"
        "    vec4 tevRegPrev = u_tevRegPrev;\n"
        "    vec4 tevReg0    = u_tevReg0;\n"
        "    vec4 tevReg1    = u_tevReg1;\n"
        "    vec4 tevReg2    = u_tevReg2;\n"
        "    vec4 konst;\n"
        "    vec4 rasColor;\n";
    static const char fragShaderFooter[] =
        "    gl_FragColor = tevRegPrev;\n"
        "}\n";
    char tevSrc[GX_MAX_TEVSTAGE][500];
    const GLchar *fragSrcPtrs[2 + GX_MAX_TEVSTAGE];

    int line;
    int i;
    int shaderToEvict = 0;
    int lastUsed = INT_MAX;
    struct ShaderInfo *shader;
    struct TevStageConfig *stage;
    struct ChannelConfig *channel;

    // check to see if a suitable shader exists
    shader = s_shaderCache;
    for (i = 0; i < ARRAY_COUNT(s_shaderCache); i++, shader++)
    {
        if (shader->lastUsed > 0)  // shader is in use
        {
            if (memcmp(&shader->tevConfig, &s_currTevConfig, sizeof(shader->tevConfig)) == 0
             && memcmp(&shader->lightConfig, &s_currLightConfig, sizeof(shader->lightConfig)) == 0)
                goto got_shader;
        }
        // shader with the earliest use time will be evicted
        if (lastUsed > shader->lastUsed)
        {
            lastUsed = shader->lastUsed;
            shaderToEvict = i;
        }
    }

    printf("evicting %i, last used at %i\n", shaderToEvict, s_shaderCache[shaderToEvict].lastUsed);
    shader = &s_shaderCache[shaderToEvict];
    if (shader->lastUsed > 0)
    {
        glDeleteShader(shader->fragShader);
        glDeleteShader(shader->vtxShader);
        glDeleteProgram(shader->program);
    }

    shader->tevConfig = s_currTevConfig;
    shader->lightConfig = s_currLightConfig;

    // Generate vtx shader code
    channel = shader->lightConfig.channels;
    line = 0;
    vtxSrcPtrs[line++] = vtxShaderHeader;
    for (i = 0; i < shader->lightConfig.numChans; i++, channel++)
    {
        if (channel->matSrc == GX_SRC_REG)
            sprintf(vtxSrc[i], "    v_channel%i = u_chanMatColors[%i];\n", i, i);
        else
            sprintf(vtxSrc[i], "    v_channel%i = a_color;\n", i);
        if (channel->lightEnabled)
        {
            int j;
            for (j = 0; j < 8; j++)
            {
                if (channel->lightMask & (1 << j))
                {
                    char buf[100];
                    sprintf(buf, "    v_channel%i = dir_light(%i, v_channel%i, mvVertex, mvNormal);\n",
                        i, j, i);
                    strcat(vtxSrc[i], buf);
                }
            }
        }
        vtxSrcPtrs[line++] = vtxSrc[i];
    }
    vtxSrcPtrs[line++] = vtxShaderFooter;

    // Generate frag shader code
    stage = shader->tevConfig.stages;
    fragSrcPtrs[0] = fragShaderHeader;
    for (i = 0; i < shader->tevConfig.numTevStages; i++, stage++)
    {
        size_t len = sprintf(tevSrc[i],
            "    konst = u_konstColors[%i];\n"
            "    rasColor = %s;\n"
            "    %s.xyz = %s * (1.0 - %s) + %s * %s %s %s;\n"  // color
            "    %s.w = %s * (1.0 - %s) + %s * %s %s %s;\n",  // alpha
            // konst
            i,
            // rasterized color
            shader_channel(stage->channelId),
            // color
            shader_tev_reg(stage->colorOut),
            shader_tev_color_arg(stage->colorArgs[0]),
            shader_tev_color_arg(stage->colorArgs[2]),
            shader_tev_color_arg(stage->colorArgs[1]),
            shader_tev_color_arg(stage->colorArgs[2]),
            shader_tev_op(stage->colorOp),
            shader_tev_color_arg(stage->colorArgs[3]),
            // alpha
            shader_tev_reg(stage->alphaOut),
            shader_tev_alpha_arg(stage->alphaArgs[0]),
            shader_tev_alpha_arg(stage->alphaArgs[2]),
            shader_tev_alpha_arg(stage->alphaArgs[1]),
            shader_tev_alpha_arg(stage->alphaArgs[2]),
            shader_tev_op(stage->alphaOp),
            shader_tev_alpha_arg(stage->alphaArgs[3]));
        assert(len < sizeof(tevSrc[i]));
        fragSrcPtrs[1 + i] = tevSrc[i];
    }
    fragSrcPtrs[1 + i] = fragShaderFooter;

    // Compile vertex shader
    puts("Compiling vtx shader:");
    printf("%i chans\n", shader->lightConfig.numChans);
    shader->vtxShader = glCreateShader(GL_VERTEX_SHADER);
    glShaderSource(shader->vtxShader, 2 + shader->lightConfig.numChans, vtxSrcPtrs, NULL);
    glCompileShader(shader->vtxShader);

    // Compile fragment shader

    puts("Compiling frag shader:");
    printf("%i stages\n", shader->tevConfig.numTevStages);
    shader->fragShader = glCreateShader(GL_FRAGMENT_SHADER);
    glShaderSource(shader->fragShader, 2 + shader->tevConfig.numTevStages, fragSrcPtrs, NULL);
    glCompileShader(shader->fragShader);

    shader->program = glCreateProgram();
    glAttachShader(shader->program, shader->fragShader);
    glAttachShader(shader->program, shader->vtxShader);

    glLinkProgram(shader->program);
    GLint status;
    glGetProgramiv(shader->program, GL_LINK_STATUS, &status);
    if (!status)
    {
        GLchar log[500];
        glGetProgramInfoLog(shader->program, sizeof(log), NULL, log);
        fprintf(stderr, "failed to link shader program: %s\n", log);
        exit(1);
    }

    s_renderStats.shaderCompiles++;

got_shader:
    shader->lastUsed = s_shaderLastUsed++;
    s_program = shader->program;
    glUseProgram(shader->program);

    s_shaderPositionIndex = glGetAttribLocation(s_program, "a_position");
    s_shaderNormalIndex   = glGetAttribLocation(s_program, "a_normal");
    s_shaderTexCoordIndex = glGetAttribLocation(s_program, "a_texCoord");
    s_shaderColorIndex    = glGetAttribLocation(s_program, "a_color");

    float color[4];
    GLint location;

    // vertex shader uniforms

    if ((location = glGetUniformLocation(shader->program, "u_chanAmbColors")) >= 0)
    {
        float ambColors[2 * 4];
        for (i = 0; i < 2; i++)
            gxcolor_to_float_arr(s_chanAmbColors[i], ambColors + i * 4);
        glUniform4fv(location, shader->tevConfig.numTevStages, ambColors);
    }
    if ((location = glGetUniformLocation(shader->program, "u_chanMatColors")) >= 0)
    {
        float matColors[2 * 4];
        for (i = 0; i < 2; i++)
            gxcolor_to_float_arr(s_chanMatColors[i], matColors + i * 4);
        glUniform4fv(location, shader->tevConfig.numTevStages, matColors);
    }
    if ((location = glGetUniformLocation(shader->program, "u_lightPos")) >= 0)
    {
        float buf[8 * 3];
        for (i = 0; i < 8; i++)
        {
            buf[i * 3 + 0] = s_lightObjs[i].posX;
            buf[i * 3 + 1] = s_lightObjs[i].posY;
            buf[i * 3 + 2] = s_lightObjs[i].posZ;
        }
        glUniform3fv(location, 8, buf);
    }
    if ((location = glGetUniformLocation(shader->program, "u_lightDir")) >= 0)
    {
        float buf[8 * 3];
        for (i = 0; i < 8; i++)
        {
            buf[i * 3 + 0] = s_lightObjs[i].dirX;
            buf[i * 3 + 1] = s_lightObjs[i].dirY;
            buf[i * 3 + 2] = s_lightObjs[i].dirZ;
        }
        glUniform3fv(location, 8, buf);
    }

    // fragment shader uniforms

    if ((location = glGetUniformLocation(shader->program, "u_konstColors")) >= 0)
    {
        float kcolors[16 * 4];
        for (i = 0; i < shader->tevConfig.numTevStages; i++)
            calc_konst_color(i, kcolors + i * 4);
        glUniform4fv(location, shader->tevConfig.numTevStages, kcolors);
    }
    if ((location = glGetUniformLocation(shader->program, "u_tevRegPrev")) >= 0)
    {
        gxcolor_to_float_arr(s_tevRegs[0], color);
        glUniform4fv(location, 1, color);
    }
    if ((location = glGetUniformLocation(shader->program, "u_tevReg0")) >= 0)
    {
        gxcolor_to_float_arr(s_tevRegs[1], color);
        glUniform4fv(location, 1, color);
    }
    if ((location = glGetUniformLocation(shader->program, "u_tevReg1")) >= 0)
    {
        gxcolor_to_float_arr(s_tevRegs[2], color);
        glUniform4fv(location, 1, color);
    }
    if ((location = glGetUniformLocation(shader->program, "u_tevReg2")) >= 0)
    {
        gxcolor_to_float_arr(s_tevRegs[3], color);
        glUniform4fv(location, 1, color);
    }

    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_2D, s_currTextureId);
    if ((location = glGetUniformLocation(shader->program, "u_texture0")) >= 0)
    {
        glUniform1i(location, 0);
    }
    if ((location = glGetUniformLocation(shader->program, "u_projectionMatrix")) >= 0)
        glUniformMatrix4fv(location, 1, TRUE, (GLfloat *)s_projectionMtx);
    if ((location = glGetUniformLocation(shader->program, "u_modelViewMatrix")) >= 0)
        glUniformMatrix4fv(location, 1, TRUE, (GLfloat *)s_positionMatrices[s_currMtx]);
    if ((location = glGetUniformLocation(shader->program, "u_textureMatrix")) >= 0)
        glUniformMatrix4fv(location, 1, TRUE, (GLfloat *)s_textureMatrices[s_currTexMtx]);

#ifdef DEBUG
    if (dumpShaders)
        dump_shaders(shader);
#endif
}

void GXSetTevOp(GXTevStageID id, GXTevMode mode)
{
    GXTevColorArg inputColor = GX_CC_RASC;
    GXTevAlphaArg inputAlpha = GX_CA_RASA;

    if (id != GX_TEVSTAGE0)
    {
        inputColor = GX_CC_CPREV;
        inputAlpha = GX_CA_APREV;
    }
    switch (mode)
    {
    case GX_MODULATE:
        GXSetTevColorIn(id, GX_CC_ZERO, GX_CC_TEXC, inputColor, GX_CC_ZERO);
        GXSetTevAlphaIn(id, GX_CA_ZERO, GX_CA_TEXA, inputAlpha, GX_CA_ZERO);
        break;
    case GX_DECAL:
        GXSetTevColorIn(id, inputColor, GX_CC_TEXC, GX_CC_TEXA, GX_CC_ZERO);
        GXSetTevAlphaIn(id, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, inputAlpha);
        break;
    case GX_BLEND:
        GXSetTevColorIn(id, inputColor, GX_CC_ONE, GX_CC_TEXC, GX_CC_ZERO);
        GXSetTevAlphaIn(id, GX_CA_ZERO, GX_CA_TEXA, inputAlpha, GX_CA_ZERO);
        break;
    case GX_REPLACE:
        GXSetTevColorIn(id, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_TEXC);
        GXSetTevAlphaIn(id, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_TEXA);
        break;
    case GX_PASSCLR:
        GXSetTevColorIn(id, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, inputColor);
        GXSetTevAlphaIn(id, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, inputAlpha);
        break;
    }
    GXSetTevColorOp(id, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
    GXSetTevAlphaOp(id, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
}

void GXSetAlphaCompare(GXCompare comp0, u8 ref0, GXAlphaOp op, GXCompare comp1, u8 ref1)
{
    puts("GXSetAlphaCompare is a stub");
}

void GXSetTevColorIn(GXTevStageID stage, GXTevColorArg a, GXTevColorArg b, GXTevColorArg c, GXTevColorArg d)
{
    debug_printf("GXSetTevColorIn(GX_TEVSTAGE%i, %s, %s, %s, %s)\n",
        stage, GXTevColorArg_name(a), GXTevColorArg_name(b), GXTevColorArg_name(c), GXTevColorArg_name(d));

    s_currTevConfig.stages[stage].colorArgs[0] = a;
    s_currTevConfig.stages[stage].colorArgs[1] = b;
    s_currTevConfig.stages[stage].colorArgs[2] = c;
    s_currTevConfig.stages[stage].colorArgs[3] = d;
}

void GXSetTevAlphaIn(GXTevStageID stage, GXTevAlphaArg a, GXTevAlphaArg b, GXTevAlphaArg c, GXTevAlphaArg d)
{
    debug_printf("GXSetTevAlphaIn(GX_TEVSTAGE%i, %s, %s, %s, %s)\n",
        stage, GXTevAlphaArg_name(a), GXTevAlphaArg_name(b), GXTevAlphaArg_name(c), GXTevAlphaArg_name(d));

    s_currTevConfig.stages[stage].alphaArgs[0] = a;
    s_currTevConfig.stages[stage].alphaArgs[1] = b;
    s_currTevConfig.stages[stage].alphaArgs[2] = c;
    s_currTevConfig.stages[stage].alphaArgs[3] = d;
}

void GXSetTevColorOp(GXTevStageID stage, GXTevOp op, GXTevBias bias, GXTevScale scale, GXBool clamp, GXTevRegID out_reg)
{
    //puts("GXSetTevColorOp is a stub");
    s_currTevConfig.stages[stage].colorOp = op;
    s_currTevConfig.stages[stage].colorBias = bias;
    s_currTevConfig.stages[stage].colorScale = scale;
    s_currTevConfig.stages[stage].colorOut = out_reg;
}

void GXSetTevAlphaOp(GXTevStageID stage, GXTevOp op, GXTevBias bias, GXTevScale scale, GXBool clamp, GXTevRegID out_reg)
{
    //puts("GXSetTevAlphaOp is a stub");
    s_currTevConfig.stages[stage].alphaOp = op;
    s_currTevConfig.stages[stage].alphaBias = bias;
    s_currTevConfig.stages[stage].alphaScale = scale;
    s_currTevConfig.stages[stage].alphaOut = out_reg;
}

void GXSetTevColor(GXTevRegID id, GXColor color)
{
    //puts("GXSetTevColor");
    assert(id >= 0 && id < GX_MAX_TEVREG);
    s_tevRegs[id] = color;
}

void GXSetTevKColor(GXTevKColorID id, GXColor color)
{
    //puts("GXSetTevKColor is a stub");
    assert(id >= 0 && id < GX_MAX_KCOLOR);
    s_konstColors[id] = color;
}

void GXSetTevKColorSel(GXTevStageID stage, GXTevKColorSel sel)
{
    //puts("GXSetTevKColorSel is a stub");
    s_konstColorSel[stage] = sel;
}

void GXSetTevKAlphaSel(GXTevStageID stage, GXTevKAlphaSel sel)
{
    //puts("GXSetTevKAlphaSel is a stub");
    s_konstAlphaSel[stage] = sel;
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
    debug_printf("GXSetTevOrder(GX_TEVSTAGE%i, ?, ?, %s)\n",
        stage, GXChannelID_name(color));

    s_currTevConfig.stages[stage].channelId = color;
}

void GXSetNumTevStages(u8 nStages)
{
    debug_printf("GXSetNumTevStages(%i)\n", nStages);

    s_currTevConfig.numTevStages = nStages;
}

/* Transform */

void GXSetProjection(f32 mtx[4][4], GXProjectionType type)
{
    //GLint location = glGetUniformLocation(s_program, "u_projectionMatrix");
    //glUniformMatrix4fv(location, 1, TRUE, (GLfloat *)mtx);
    memcpy(s_projectionMtx, mtx, sizeof(s_projectionMtx));
}

void GXGetProjectionv(f32 *p)
{
    debug_puts("GXGetProjectionv");
    p[0] = s_projectionType;
    p[1] = s_projectionMtx[0][0];
    p[2] = (s_projectionType == GX_ORTHOGRAPHIC) ? s_projectionMtx[0][3] : s_projectionMtx[0][2];
    p[3] = s_projectionMtx[1][1];
    p[4] = (s_projectionType == GX_ORTHOGRAPHIC) ? s_projectionMtx[1][3] : s_projectionMtx[1][2];
    p[5] = s_projectionMtx[2][2];
    p[6] = s_projectionMtx[2][3];
}

void GXSetViewportJitter(f32 left, f32 top, f32 wd, f32 ht, f32 nearz, f32 farz, u32 field)
{
    puts("GXSetViewportJitter is a stub");
}

void GXLoadPosMtxImm(f32 mtx[3][4], u32 id)
{
    Mtx44 *m = &s_positionMatrices[id / 3];

    memcpy(m, mtx, sizeof(Mtx44));
    (*m)[3][0] = (*m)[3][1] = (*m)[3][2] = 0.0f;
    (*m)[3][3] = 1.0f;
}

void GXLoadNrmMtxImm(f32 mtx[3][4], u32 id)
{
    Mtx44 *m = &s_normalMatrices[id / 3];

    memcpy(m, mtx, sizeof(Mtx44));
    (*m)[3][0] = (*m)[3][1] = (*m)[3][2] = 0.0f;
    (*m)[3][3] = 1.0f;
}

void GXSetCurrentMtx(u32 id)
{
    s_currMtx = id / 3;
}

void GXLoadTexMtxImm(f32 mtx[][4], u32 id, GXTexMtxType type)
{
    Mtx44 *m = &s_textureMatrices[(id - 30) / 3];
    debug_printf("GXLoadTexMtxImm(0x%08X, %u, %s)\n",
        (u32)mtx, id, (type == GX_MTX3x4) ? "GX_MTX3x4" : "GX_MTX2x4");

    if (id >= GX_TEXMTX0 && id <= GX_IDENTITY)
    {
        switch (type)
        {
        case GX_MTX2x4:
            memcpy(m, mtx, 2 * 4 * sizeof(f32));
            break;
        case GX_MTX3x4:
            memcpy(m, mtx, 3 * 4 * sizeof(f32));
            break;
        default:
            assert(0);
        }
    }
}

void GXSetViewport(f32 left, f32 top, f32 wd, f32 ht, f32 nearz, f32 farz)
{
    debug_printf("GXSetViewport: %.2f, %.2f, %.2f, %.2f\n", left, top, wd, ht);
    glViewport(left, top, wd, ht);
}

void GXSetScissor(u32 left, u32 top, u32 wd, u32 ht)
{
    debug_puts("GXSetScissor is a stub");
}

/* Geometry */

static u32 prepare_vertex_arrays(GXPrimitive prim, GXVtxFmt vtxfmt, const u8 *ptr)
{
    struct
    {
        GLint size;
        GLenum type;
        const void *ptr;
    } attrArrays[GX_VA_MAX_ATTR] = {0};
    u32 vtxSize = 0;
    int attr;
    int i;

    // Calculate attribute offsets and vertex size
    for (attr = 0; attr < GX_VA_MAX_ATTR; attr++)
    {
        GXCompCnt compCnt = s_vtxFmts[vtxfmt][attr].cnt;
        GXCompType compType = s_vtxFmts[vtxfmt][attr].type;
        switch (s_attrTypes[attr])
        {
        case GX_NONE:
            break;
        case GX_DIRECT:
            attrArrays[attr].ptr = ptr + vtxSize;
            #define COMBINE(val1, val2, val3) (((val1)<<16)|((val2)<<8)|(val3))
            switch (COMBINE(attr, compCnt, compType))
            {
            case COMBINE(GX_VA_POS, GX_POS_XYZ, GX_F32):
            case COMBINE(GX_VA_NRM, GX_NRM_XYZ, GX_F32):
                attrArrays[attr].size = 3;
                attrArrays[attr].type = GL_FLOAT;
                vtxSize += 12;
                break;
            case COMBINE(GX_VA_POS, GX_POS_XYZ, GX_S16):
            case COMBINE(GX_VA_NRM, GX_NRM_XYZ, GX_S16):
                attrArrays[attr].size = 3;
                attrArrays[attr].type = GL_SHORT;
                vtxSize += 6;
                break;
            case COMBINE(GX_VA_TEX0, GX_TEX_ST, GX_F32):
            case COMBINE(GX_VA_TEX1, GX_TEX_ST, GX_F32):
            case COMBINE(GX_VA_TEX2, GX_TEX_ST, GX_F32):
                attrArrays[attr].size = 2;
                attrArrays[attr].type = GL_FLOAT;
                vtxSize += 8;
                break;
            case COMBINE(GX_VA_TEX0, GX_TEX_ST, GX_S16):
            case COMBINE(GX_VA_TEX1, GX_TEX_ST, GX_S16):
            case COMBINE(GX_VA_TEX2, GX_TEX_ST, GX_S16):
                attrArrays[attr].size = 2;
                attrArrays[attr].type = GL_SHORT;
                vtxSize += 4;
                break;
            case COMBINE(GX_VA_CLR0, GX_CLR_RGBA, GX_RGBA8):
                attrArrays[attr].size = 4;
                attrArrays[attr].type = GL_UNSIGNED_BYTE;
                vtxSize += 4;
                break;
            default:
                printf("not handled: attr %i, cnt %i, type %i\n", attr, compCnt, compType);
                assert(0);
                break;
            }
            #undef COMBINE
            break;
        default:
            assert(0);  // TODO
        }
    }

    if (attrArrays[GX_VA_POS].ptr != NULL
     && s_shaderPositionIndex >= 0)
    {
        glEnableVertexAttribArray(s_shaderPositionIndex);
        glVertexAttribPointer(
            s_shaderPositionIndex,
            attrArrays[GX_VA_POS].size,
            attrArrays[GX_VA_POS].type,
            (attrArrays[GX_VA_POS].type != GL_FLOAT),
            vtxSize,
            attrArrays[GX_VA_POS].ptr);
    }
    if (attrArrays[GX_VA_NRM].ptr != NULL
     && s_shaderNormalIndex >= 0)
    {
        glEnableVertexAttribArray(s_shaderNormalIndex);
        glVertexAttribPointer(
            s_shaderNormalIndex,
            attrArrays[GX_VA_NRM].size,
            attrArrays[GX_VA_NRM].type,
            (attrArrays[GX_VA_NRM].type != GL_FLOAT),
            vtxSize,
            attrArrays[GX_VA_NRM].ptr);
    }
    /*
    for (i = 0; i <= 2; i++)
    {
        if (attrArrays[GX_VA_TEX0 + i].ptr != NULL)
        {
            glActiveTexture(GL_TEXTURE0 + i);
            glEnableClientState(GL_TEXTURE_COORD_ARRAY);
            glTexCoordPointer(
                attrArrays[GX_VA_TEX0 + i].size,
                attrArrays[GX_VA_TEX0 + i].type,
                vtxSize,
                attrArrays[GX_VA_TEX0 + i].ptr);
        }
    }
    */
    if (attrArrays[GX_VA_TEX0].ptr != NULL
     && s_shaderTexCoordIndex >= 0)
    {
        glEnableVertexAttribArray(s_shaderTexCoordIndex);
        glVertexAttribPointer(
            s_shaderTexCoordIndex,
            attrArrays[GX_VA_TEX0].size,
            attrArrays[GX_VA_TEX0].type,
            (attrArrays[GX_VA_TEX0].type != GL_FLOAT),
            vtxSize,
            attrArrays[GX_VA_TEX0].ptr);
    }
    glActiveTexture(GL_TEXTURE0);
    if (attrArrays[GX_VA_CLR0].ptr != NULL
     && s_shaderColorIndex >= 0)
    {
        glEnableVertexAttribArray(s_shaderColorIndex);
        glVertexAttribPointer(
            s_shaderColorIndex,
            attrArrays[GX_VA_CLR0].size,
            attrArrays[GX_VA_CLR0].type,
            (attrArrays[GX_VA_CLR0].type != GL_FLOAT),
            vtxSize,
            attrArrays[GX_VA_CLR0].ptr);
    }

    return vtxSize;
}

void __GXSetDirtyState(void)
{
    puts("__GXSetDirtyState is a stub");
}

static GLenum gx_prim_to_gl_prim(GXPrimitive in)
{
    switch (in)
    {
    case GX_POINTS:        return GL_POINTS;
    case GX_LINES:         return GL_LINES;
    case GX_LINESTRIP:     return GL_LINE_STRIP;
    case GX_TRIANGLES:     return GL_TRIANGLES;
    case GX_TRIANGLESTRIP: return GL_TRIANGLE_STRIP;
    case GX_TRIANGLEFAN:   return GL_TRIANGLE_FAN;
    case GX_QUADS:         return GL_TRIANGLES;  // OpenGL ES lacks quads, so we emulate them with triangles
    default: assert(0);
    }
    return 0;
}

static u8 s_vertexBuffer[8192];
size_t s_vertexBufferPos;
static int s_currPrim;
static int s_vertexCount;
size_t s_vtxSize;
static int s_quadVtx0Pos;

void GXBegin(GXPrimitive type, GXVtxFmt vtxfmt, u16 nverts)
{
    prepare_shaders();
    s_vtxSize = prepare_vertex_arrays(type, vtxfmt, s_vertexBuffer);
    s_currPrim = type;
    s_vertexBufferPos = 0;
    s_vertexCount = nverts;
    s_quadVtx0Pos = 0;
    assert(nverts * s_vtxSize <= sizeof(s_vertexBuffer));
}

void GXEnd(void)
{
    int count = s_vertexCount;

    if (s_currPrim == GX_QUADS)
        count *= 2;
    glDrawArrays(gx_prim_to_gl_prim(s_currPrim), 0, count);
    s_renderStats.drawCalls++;
    if (s_shaderPositionIndex >= 0)
        glDisableVertexAttribArray(s_shaderPositionIndex);
    if (s_shaderNormalIndex >= 0)
        glDisableVertexAttribArray(s_shaderNormalIndex);
    if (s_shaderTexCoordIndex >= 0)
        glDisableVertexAttribArray(s_shaderTexCoordIndex);
    if (s_shaderColorIndex >= 0)
        glDisableVertexAttribArray(s_shaderColorIndex);
}

void GXSetLineWidth(u8 width, GXTexOffset texOffsets)
{
    puts("GXSetLineWidth is a stub");
}

static GLenum gx_cull_mode_to_gl_cull_mode(GXCullMode in)
{
    static const GLenum cullModes[] =
    {
        0,
        GL_FRONT,
        GL_BACK,
        GL_FRONT_AND_BACK,
    };

    assert(in >= 0 && in <= 3);
    return cullModes[in];
}

void GXSetCullMode(GXCullMode mode)
{
    if (mode == GX_CULL_NONE)
    {
        glDisable(GL_CULL_FACE);
        return;
    }
    glEnable(GL_CULL_FACE);
    glCullFace(gx_cull_mode_to_gl_cull_mode(mode));
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
    u8 *data = list;
    u32 pos = 0;
    GXPrimitive prim;
    GXVtxFmt fmt;
    int vtxCount;
    u32 vtxSize;
    u8 *ptr;

    debug_puts("GXCallDisplayList");
    prepare_shaders();
    while (pos < nbytes)
    {
        u8 opcode = data[pos++];

        if (opcode == GX_NOP)
            continue;
        if (opcode == GX_LOAD_BP_REG)
            pos += 4;

        prim = opcode & ~3;
        switch (prim)
        {
        case GX_DRAW_QUADS:
        case GX_DRAW_TRIANGLES:
        case GX_DRAW_TRIANGLE_STRIP:
        case GX_DRAW_TRIANGLE_FAN:
        case GX_DRAW_LINES:
        case GX_DRAW_LINE_STRIP:
        case GX_DRAW_POINTS:
            assert(prim != GX_DRAW_QUADS);  // Quads not implemented yet
            fmt = opcode & 3;
            vtxCount = (data[pos + 1] << 8) | data[pos];
            pos += 2;

            vtxSize = prepare_vertex_arrays(prim, fmt, data + pos);

            glDrawArrays(gx_prim_to_gl_prim(prim), 0, vtxCount);
            s_renderStats.drawCalls++;

            if (s_shaderPositionIndex >= 0)
                glDisableVertexAttribArray(s_shaderPositionIndex);
            if (s_shaderNormalIndex >= 0)
                glDisableVertexAttribArray(s_shaderNormalIndex);
            if (s_shaderTexCoordIndex >= 0)
                glDisableVertexAttribArray(s_shaderTexCoordIndex);
            if (s_shaderColorIndex >= 0)
                glDisableVertexAttribArray(s_shaderColorIndex);

            pos += vtxCount * vtxSize;
        }
    }
}

/* Fifo */

static GXFifoObj *GPFifo;
static GXFifoObj *CPUFifo;

void GXInitFifoBase(GXFifoObj *fifo, void *base, u32 size)
{
    debug_puts("GXInitFifoBase is a stub");
}

void GXInitFifoPtrs(GXFifoObj *fifo, void *readPtr, void *writePtr)
{
    debug_puts("GXInitFifoPtrs is a stub");
}

void GXSetCPUFifo(GXFifoObj *fifo)
{
    debug_puts("GXSetCPUFifo is a stub");
    CPUFifo = fifo;
}

void GXSetGPFifo(GXFifoObj *fifo)
{
    debug_puts("GXSetGPFifo is a stub");
    GPFifo = fifo;
}

void GXSaveCPUFifo(GXFifoObj *fifo)
{
    debug_puts("GXSaveCPUFifo is a stub");
}

void GXGetGPStatus(GXBool *overhi, GXBool *underlow, GXBool *readIdle, GXBool *cmdIdle, GXBool *brkpt)
{
    debug_puts("GXGetGPStatus is a stub");
    *overhi = *underlow = *readIdle = *cmdIdle = *brkpt = 0;
    *readIdle = TRUE;
}

void GXGetFifoPtrs(GXFifoObj *fifo, void **readPtr, void **writePtr)
{
    debug_puts("GXGetFifoPtrs is a stub");
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
    int index = 0;

    debug_printf("GXLoadLightObjImm(0x%X, %i)\n", (unsigned int)lt_obj, light);

    switch (light)
    {
    case GX_LIGHT0: index = 0; break;
    case GX_LIGHT1: index = 1; break;
    case GX_LIGHT2: index = 2; break;
    case GX_LIGHT3: index = 3; break;
    case GX_LIGHT4: index = 4; break;
    case GX_LIGHT5: index = 5; break;
    case GX_LIGHT6: index = 6; break;
    case GX_LIGHT7: index = 7; break;
    default:
        printf("light %i\n", light);
        assert(0);
    }
    s_lightObjs[index] = *__lt_obj;
}

void GXSetChanAmbColor(GXChannelID chan, GXColor amb_color)
{
    debug_printf("GXSetChanAmbColor(%s, (%i,%i,%i,%i))\n",
        GXChannelID_name(chan), amb_color.r, amb_color.g, amb_color.b, amb_color.a);

    switch (chan)
    {
    case GX_COLOR0:
        s_chanAmbColors[0].r = amb_color.r;
        s_chanAmbColors[0].g = amb_color.g;
        s_chanAmbColors[0].b = amb_color.b;
        break;
    case GX_COLOR1:
        s_chanAmbColors[1].r = amb_color.r;
        s_chanAmbColors[1].g = amb_color.g;
        s_chanAmbColors[1].b = amb_color.b;
        break;
    case GX_ALPHA0:
        s_chanAmbColors[0].a = amb_color.a;
        break;
    case GX_ALPHA1:
        s_chanAmbColors[1].a = amb_color.a;
        break;
    case GX_COLOR0A0:
        s_chanAmbColors[0] = amb_color;
        break;
    case GX_COLOR1A1:
        s_chanAmbColors[1] = amb_color;
        break;
    default:
        printf("chan %i\n", chan);
        assert(0);
    }
}

void GXSetChanMatColor(GXChannelID chan, GXColor mat_color)
{
    debug_printf("GXSetChanMatColor(%s, (%i,%i,%i,%i))\n",
        GXChannelID_name(chan), mat_color.r, mat_color.g, mat_color.b, mat_color.a);

    switch (chan)
    {
    case GX_COLOR0:
        s_chanMatColors[0].r = mat_color.r;
        s_chanMatColors[0].g = mat_color.g;
        s_chanMatColors[0].b = mat_color.b;
        break;
    case GX_COLOR1:
        s_chanMatColors[1].r = mat_color.r;
        s_chanMatColors[1].g = mat_color.g;
        s_chanMatColors[1].b = mat_color.b;
        break;
    case GX_ALPHA0:
        s_chanMatColors[0].a = mat_color.a;
        break;
    case GX_ALPHA1:
        s_chanMatColors[1].a = mat_color.a;
        break;
    case GX_COLOR0A0:
        s_chanMatColors[0] = mat_color;
        break;
    case GX_COLOR1A1:
        s_chanMatColors[1] = mat_color;
        break;
    default:
        printf("chan %i\n", chan);
        assert(0);
    }
}

void GXSetNumChans(u8 nChans)
{
    s_currLightConfig.numChans = nChans;
}

void GXSetChanCtrl(GXChannelID chan, GXBool enable, GXColorSrc amb_src,
    GXColorSrc mat_src, u32 light_mask, GXDiffuseFn diff_fn, GXAttnFn attn_fn)
{
    int channelId = 0;

    debug_printf("GXSetChanCtrl(%s, enable:%s, amb_src:%s, mat_src:%s, 0x%08X, ?, ?)\n",
        GXChannelID_name(chan), GXBool_name(enable), GXColorSrc_name(amb_src), GXColorSrc_name(mat_src), light_mask);

    // TODO: split color and alpha
    switch (chan)
    {
    case GX_COLOR0:
    case GX_ALPHA0:
    case GX_COLOR0A0:
        channelId = 0;
        break;
    case GX_COLOR1:
    case GX_ALPHA1:
    case GX_COLOR1A1:
        channelId = 1;
        break;
    default:
        printf("chan %i\n", chan);
        assert(0);
    }

    s_currLightConfig.channels[channelId].ambSrc = amb_src;
    s_currLightConfig.channels[channelId].matSrc = mat_src;

    // TODO: support alpha lighting
    s_currLightConfig.channels[channelId].lightEnabled = enable;
    s_currLightConfig.channels[channelId].lightMask = light_mask;
}

/* Texture */

struct TextureEntry
{
    u32 uid;
    u32 lastUsed;
    u8 *decoded;  // texture image converted into a GL compatible format
    GLuint textureId;
};

typedef struct
{
    u16 width;
    u16 height;
    GXTexFmt format;
    //u8 *uncompressed;
    //GLuint textureId;
    void *data;
    u8 wrapS;
    u8 wrapT;
    //u8 isLoaded;
    //int lastUsed;
    u32 uid;  // must match up with uid in cacheEntry if still in cache
    struct TextureEntry *entry;
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
        printf("fmt %lu\n", format);
        //assert(0);  // TODO
        return width * height * 4;
        break;
    }
}

static inline u8 expand_to_8(u8 v, u8 n)
{
    if (v == 3)
    {
        return (n << (8 - 3)) | (n << (8 - 6)) | (n >> (9 - 8));
    }
    else
    {
        return (n << (8 - v)) | (n >> ((v * 2) - 8));
    }
}

static GXColor rgb565_to_color(u16 color)
{
    GXColor out;

    out.r = expand_to_8(5, (color >> 11) & 0x1F);
    out.g = expand_to_8(6, (color >>  5) & 0x3F);
    out.b = expand_to_8(5, (color >>  0) & 0x1F);
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

static void decode_cmpr_tile(const u8 *restrict src, u8 *restrict dest, int x, int y, int width, int height)
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

static void *cmpr_to_gl_rgba8(const u8 *src, int width, int height)
{
    u8 *dest = malloc(width * height * 4);
    int x, y;

    for (y = 0; y < height / 8; y++)
    {
        for (x = 0; x < width / 8; x++)
        {
            // decode block
            decode_cmpr_tile(src, dest, x*8 + 0, y*8 + 0, width, height);
            src += 8;
            decode_cmpr_tile(src, dest, x*8 + 4, y*8 + 0, width, height);
            src += 8;
            decode_cmpr_tile(src, dest, x*8 + 0, y*8 + 4, width, height);
            src += 8;
            decode_cmpr_tile(src, dest, x*8 + 4, y*8 + 4, width, height);
            src += 8;
        }
    }
    return dest;
}

static void *i4_to_gl_i8(const u8 *src, int width, int height)
{
    u8 *dest = malloc(width * height);
    int x, y;

    for (y = 0; y < height / 8; y++)
    {
        for (x = 0; x < width / 8; x++)
        {
            // decode block
            int tx, ty;

            for (ty = 0; ty < 8; ty++)
            {
                for (tx = 0; tx < 8; tx++)
                {
                    int index = (y*8 + ty) * width + x*8 + tx;
                    u8 intensity = (src[tx / 2] >> ((tx & 1) ? 0 : 4)) & 0xF;
                    dest[index] = expand_to_8(4, intensity);
                }
                src += 4;
            }
        }
    }
    return dest;
}

static void *ia4_to_gl_i8a8(const u8 *src, int width, int height)
{
    u8 *dest = malloc(width * height * 2);
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
                    dest[index*2 + 0] = expand_to_8(4, *src & 0xFF);
                    dest[index*2 + 1] = expand_to_8(4, (*src >> 4) & 0xFF);
                    src++;
                }
            }
        }
    }
    return dest;
}

static void *rgb5a3_to_gl_rgba8(const u8 *src, int width, int height)
{
    u8 *dest = malloc(width * height * 4);
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
                        r = expand_to_8(5, (color >> 10) & 0x1F);
                        g = expand_to_8(5, (color >> 5) & 0x1F);
                        b = expand_to_8(5, (color >> 0) & 0x1F);
                    }
                    else
                    {
                        a = expand_to_8(3, (color >> 12) & 0x7);
                        r = expand_to_8(4, (color >> 8) & 0xF);
                        g = expand_to_8(4, (color >> 4) & 0xF);
                        b = expand_to_8(4, (color >> 0) & 0xF);
                    }
                    dest[index*4 + 0] = r;
                    dest[index*4 + 1] = g;
                    dest[index*4 + 2] = b;
                    dest[index*4 + 3] = a;
                }
            }
        }
    }
    return dest;
}

static void *i8_to_gl_i8a8(const u8 *src, int width, int height)
{
    u8 *dest = malloc(width * height * 2);
    int x, y;

    for (y = 0; y < height / 4; y++)
    {
        for (x = 0; x < width / 8; x++)
        {
            int tx, ty;

            for (ty = 0; ty < 4; ty++)
            {
                for (tx = 0; tx < 8; tx++)
                {
                    int index = (y*4 + ty) * width + (x*8 + tx);
                    dest[index*2 + 0] = dest[index*2 + 1] = *src++;
                }
            }
        }
    }
    return dest;
}

static void *rgba8_to_gl_rgba8(const u8 *src, int width, int height)
{
    u8 *dest = malloc(width * height * 4);
    int x, y;

    for (y = 0; y < height / 4; y++)
    {
        for (x = 0; x < width / 4; x++)
        {
            int tx, ty;

            for (ty = 0; ty < 4; ty++)
            {
                for (tx = 0; tx < 4; tx++)
                {
                    int index = (y*4 + ty) * width + (x*4 + tx);
                    int srcIdx = ty*4 + tx;
                    dest[index*4 + 3] = src[0  + srcIdx*2 + 0];  // a
                    dest[index*4 + 0] = src[0  + srcIdx*2 + 1];  // r
                    dest[index*4 + 1] = src[32 + srcIdx*2 + 0];  // g
                    dest[index*4 + 2] = src[32 + srcIdx*2 + 1];  // b
                }
            }
            src += 64;
        }
    }
    return dest;
}

static void *rgb565_to_gl_rgb565(const u8 *src, int width, int height)
{
    u8 *dest = malloc(width * height * 2);
    int x, y;

    for (y = 0; y < height / 4; y++)
    {
        for (x = 0; x < width / 4; x++)
        {
            int tx, ty;

            for (ty = 0; ty < 4; ty++)
            {
                for (tx = 0; tx < 4; tx++)
                {
                    int index = (y*4 + ty) * width + (x*4 + tx);
                    dest[index*2 + 0] = *src++;
                    dest[index*2 + 1] = *src++;
                }
            }
        }
    }
    return dest;
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

static struct TextureEntry s_textureCache[300];
static u32 s_textureLastUsed = 1;
static u32 s_textureUid = 1;

static void load_gl_texture(__GXTexObj *__obj)
{
    const struct
    {
        GLenum glformat;
        GLenum gltype;
        void *(*convert)(const u8 *, int, int);
    } textureFormats[] =
    {
        [GX_TF_I4]     = {GL_LUMINANCE,       GL_UNSIGNED_BYTE,        i4_to_gl_i8},
        [GX_TF_I8]     = {GL_LUMINANCE_ALPHA, GL_UNSIGNED_BYTE,        i8_to_gl_i8a8},
        [GX_TF_IA4]    = {GL_LUMINANCE_ALPHA, GL_UNSIGNED_BYTE,        ia4_to_gl_i8a8},
        [GX_TF_RGB565] = {GL_RGB,             GL_UNSIGNED_SHORT_5_6_5, rgb565_to_gl_rgb565},
        [GX_TF_RGB5A3] = {GL_RGBA,            GL_UNSIGNED_BYTE,        rgb5a3_to_gl_rgba8},
        [GX_TF_RGBA8]  = {GL_RGBA,            GL_UNSIGNED_BYTE,        rgba8_to_gl_rgba8},
        [GX_TF_CMPR]   = {GL_RGBA,            GL_UNSIGNED_BYTE,        cmpr_to_gl_rgba8},
    };
    struct TextureEntry *entry = __obj->entry;
    GLenum glformat = textureFormats[__obj->format].glformat;
    GLenum gltype   = textureFormats[__obj->format].gltype;

    assert(textureFormats[__obj->format].convert != NULL);
    entry->decoded = textureFormats[__obj->format].convert(__obj->data, __obj->width, __obj->height);

    glGenTextures(1, &entry->textureId);
    glBindTexture(GL_TEXTURE_2D, entry->textureId);
    glTexImage2D(GL_TEXTURE_2D, 0, glformat, __obj->width, __obj->height, 0, glformat, gltype, entry->decoded);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, gx_wrap_to_gl_wrap(__obj->wrapS));
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, gx_wrap_to_gl_wrap(__obj->wrapT));
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glBindTexture(GL_TEXTURE_2D, 0);

    s_renderStats.textureLoads++;
}

static void free_texture_entry(struct TextureEntry *entry)
{
    assert(glIsTexture(entry->textureId));
    glDeleteTextures(1, &entry->textureId);
    free(entry->decoded);
    memset(entry, 0, sizeof(*entry));
}

static void ensure_texture_loaded(__GXTexObj *__obj)
{
    int i;
    struct TextureEntry *entry;
    u32 lastUsed = UINT_MAX;
    int textureToEvict = 0;

    if (__obj->entry != NULL && __obj->uid == __obj->entry->uid)
        return;

    entry = s_textureCache;
    for (i = 0; i < ARRAY_COUNT(s_textureCache); i++, entry++)
    {
        // texture with the earliest use time may be evicted
        if (lastUsed > entry->lastUsed)
        {
            lastUsed = entry->lastUsed;
            textureToEvict = i;
        }
    }

    entry = &s_textureCache[textureToEvict];
    if (entry->lastUsed != 0)
    {
        // Evict existing texture
        free_texture_entry(entry);
    }

    // assign unique ID
    entry->uid = s_textureUid++;

    __obj->entry = entry;
    __obj->uid = entry->uid;

    // prepare the texture
    load_gl_texture(__obj);

    // mark used
    entry->lastUsed = s_textureLastUsed++;
}

void GXInitTexObj(GXTexObj *obj, void *image_ptr, u16 width, u16 height,
    GXTexFmt format, GXTexWrapMode wrap_s, GXTexWrapMode wrap_t, GXBool mipmap)
{
    __GXTexObj *__obj = (__GXTexObj *)obj;

    memset(__obj, 0, sizeof(*__obj));
    __obj->width = width;
    __obj->height = height;
    __obj->format = format;
    __obj->data = image_ptr;
    __obj->wrapS = wrap_s;
    __obj->wrapT = wrap_t;
    ensure_texture_loaded(__obj);
}

void GXLoadTexObj(GXTexObj *obj, GXTexMapID id)
{
    __GXTexObj *__obj = (__GXTexObj *)obj;

    //puts("GXLoadTexObj is a stub");
    //printf("id %i\n", id);
    /*
    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_2D, __obj->textureId);
    glUniform1i(glGetUniformLocation(s_program, "u_texture0"), 0);
    */
    ensure_texture_loaded(__obj);
    s_currTextureId = __obj->entry->textureId;
    __obj->entry->lastUsed = s_textureLastUsed++;
}

/* Vert */

static void handle_quad_emulation(void)
{
    if (s_currPrim != GX_QUADS)
        return;
    // Reset first quad vertex pos
    if (s_vertexBufferPos == s_quadVtx0Pos + 6 * s_vtxSize)
        s_quadVtx0Pos = s_vertexBufferPos;
    // If we're on the last vertex, insert vtx 0 and 2 before it
    else if (s_vertexBufferPos >= s_quadVtx0Pos + 3 * s_vtxSize)
    {
        memcpy(s_vertexBuffer + s_vertexBufferPos, s_vertexBuffer + s_quadVtx0Pos, s_vtxSize);
        s_vertexBufferPos += s_vtxSize;
        memcpy(s_vertexBuffer + s_vertexBufferPos, s_vertexBuffer + s_quadVtx0Pos + 2 * s_vtxSize, s_vtxSize);
        s_vertexBufferPos += s_vtxSize;
    }
}

void GXPosition2f32(const f32 x, const f32 y)
{
    f32 buf[2] = {x, y};

    handle_quad_emulation();
    memcpy(s_vertexBuffer + s_vertexBufferPos, buf, sizeof(buf));
    s_vertexBufferPos += sizeof(buf);
}

void GXPosition3s16(const s16 x, const s16 y, const s16 z)
{
    s16 buf[3] = {x, y, z};

    handle_quad_emulation();
    memcpy(s_vertexBuffer + s_vertexBufferPos, buf, sizeof(buf));
    s_vertexBufferPos += sizeof(buf);
}

void GXPosition3f32(const f32 x, const f32 y, const f32 z)
{
    f32 buf[3] = {x, y, z};

    handle_quad_emulation();
    memcpy(s_vertexBuffer + s_vertexBufferPos, buf, sizeof(buf));
    s_vertexBufferPos += sizeof(buf);
}

void GXNormal3f32(const f32 x, const f32 y, const f32 z)
{
    f32 buf[3] = {x, y, z};

    memcpy(s_vertexBuffer + s_vertexBufferPos, buf, sizeof(buf));
    s_vertexBufferPos += sizeof(buf);
}

void GXNormal3s16(const s16 x, const s16 y, const s16 z)
{
    s16 buf[3] = {x, y, z};

    memcpy(s_vertexBuffer + s_vertexBufferPos, buf, sizeof(buf));
    s_vertexBufferPos += sizeof(buf);
}

void GXColor4u8(const u8 r, const u8 g, const u8 b, const u8 a)
{
    u8 buf[4] = {r, g, b, a};

    memcpy(s_vertexBuffer + s_vertexBufferPos, buf, sizeof(buf));
    s_vertexBufferPos += sizeof(buf);
}

void GXTexCoord2s16(const s16 u, const s16 v)
{
    s16 buf[2] = {u, v};

    memcpy(s_vertexBuffer + s_vertexBufferPos, buf, sizeof(buf));
    s_vertexBufferPos += sizeof(buf);
}

void GXTexCoord2f32(const f32 u, const f32 v)
{
    f32 buf[2] = {u, v};

    memcpy(s_vertexBuffer + s_vertexBufferPos, buf, sizeof(buf));
    s_vertexBufferPos += sizeof(buf);
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
    debug_puts("GXSetBlendMode");
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
    debug_puts("GXSetCopyClear");
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

static void GL_APIENTRY debug_proc(GLenum source, GLenum type, GLuint id, GLenum severity, GLsizei length, const GLchar *message, const void *userParam)
{
    fprintf(stderr, "GL error: %i, %s\n", severity, message);
    fflush(stdout);
    if (severity == GL_DEBUG_SEVERITY_HIGH_KHR)
    {
        *(int *)0 = 0;
        exit(1);
    }
}

GXFifoObj *GXInit(void *base, u32 size)
{
    f32 identity[][4] =
    {
        {1, 0, 0, 0},
        {0, 1, 0, 0},
        {0, 0, 1, 0},
        {0, 0, 0, 1},
    };
    int i;

    debug_puts("GXInit");
#ifdef _WIN32
    if (glewInit() != GLEW_OK)
    {
        fputs("failed to initialize glew\n", stderr);
        exit(1);
    }
#endif
    glEnable(GL_DEBUG_OUTPUT);
    glDebugMessageCallback(debug_proc, NULL);
    glDisable(GL_CULL_FACE);
    glEnable(GL_DEPTH_TEST);
    glFrontFace(GL_CW);

    //GXLoadTexMtxImm(identity, GX_IDENTITY, GX_MTX3x4);
    for (i = 0; i < ARRAY_COUNT(s_textureMatrices); i++)
    {
        memcpy(s_textureMatrices[i], identity, sizeof(Mtx44));
    }

    return NULL;  // FIFOs aren't supported
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
    debug_puts("GXDrawDone is a stub");
    DrawDoneCB();
}

void GXSetDrawDone(void)
{
    debug_puts("GXSetDrawDone is a stub");
    DrawDoneCB();
}

void print_render_stats(void)
{
    printf(
        "Render Statistics:\n"
        "  draw calls: %i\n"
        "  shader compiles:%i\n"
        "  texture loads:%i\n",
        s_renderStats.drawCalls,
        s_renderStats.shaderCompiles,
        s_renderStats.textureLoads);
    memset(&s_renderStats, 0, sizeof(s_renderStats));
}

/* Stubs */

void GXCopyDisp(void* dest, GXBool clear)
{
    debug_puts("GXCopyDisp is a stub");
}

void GXCopyTex(void* dest, GXBool clear){puts("GXCopyTex is a stub");}
void GXDrawSphere(u8 numMajor, u8 numMinor){puts("GXDrawSphere is a stub");}
void GXFlush(void){puts("GXFlush is a stub");}
GXBool GXGetTexObjMipMap(GXTexObj* tex_obj){puts("GXGetTexObjMipMap is a stub");}
void GXInitTexObjLOD(GXTexObj* obj, GXTexFilter min_filt, GXTexFilter mag_filt, f32 min_lod, f32 max_lod, f32 lod_bias, GXBool bias_clamp, GXBool do_edge_lod, GXAnisotropy max_aniso){debug_puts("GXInitTexObjLOD is a stub");}
void GXInitTexObjWrapMode(GXTexObj* obj, GXTexWrapMode s, GXTexWrapMode t){puts("GXInitTexObjWrapMode is a stub");}
void GXInvalidateTexAll(void){puts("GXInvalidateTexAll is a stub");}
GXRenderModeObj GXMpal480IntDf;
GXRenderModeObj GXPal528IntDf;
void GXSetAlphaUpdate(GXBool update_enable){puts("GXSetAlphaUpdate is a stub");}
void GXSetColorUpdate(GXBool update_enable){puts("GXSetColorUpdate is a stub");}
void GXSetCopyFilter(GXBool aa, u8 sample_pattern[12][2], GXBool vf, u8 vfilter[7]){puts("GXSetCopyFilter is a stub");}
void GXSetDispCopyDst(u16 wd, u16 ht){puts("GXSetDispCopyDst is a stub");}
void GXSetDispCopyGamma(GXGamma gamma){puts("GXSetDispCopyGamma is a stub");}
void GXSetDispCopySrc(u16 left, u16 top, u16 wd, u16 ht){puts("GXSetDispCopySrc is a stub");}
u32 GXSetDispCopyYScale(f32 vscale){puts("GXSetDispCopyYScale is a stub");}
void GXSetDither(GXBool dither){puts("GXSetDither is a stub");}
void GXSetFog(GXFogType type, f32 startz, f32 endz, f32 nearz, f32 farz, GXColor color){puts("GXSetFog is a stub");}
void GXSetIndTexMtx(GXIndTexMtxID mtx_sel, f32 offset[2][3], s8 scale_exp){puts("GXSetIndTexMtx is a stub");}
void GXSetIndTexOrder(GXIndTexStageID ind_stage, GXTexCoordID tex_coord, GXTexMapID tex_map){puts("GXSetIndTexOrder is a stub");}
void GXSetNumIndStages(u8 nIndStages){debug_puts("GXSetNumIndStages is a stub");}
void GXSetNumTexGens(u8 nTexGens){debug_puts("GXSetNumTexGens is a stub");}
void GXSetPixelFmt(GXPixelFmt pix_fmt, GXZFmt16 z_fmt){puts("GXSetPixelFmt is a stub");}
void GXSetTevDirect(GXTevStageID tev_stage){debug_puts("GXSetTevDirect is a stub");}
void GXSetTevIndirect(GXTevStageID tev_stage, GXIndTexStageID ind_stage, GXIndTexFormat format, GXIndTexBiasSel bias_sel, GXIndTexMtxID matrix_sel, GXIndTexWrap wrap_s, GXIndTexWrap wrap_t, GXBool add_prev, GXBool ind_lod, GXIndTexAlphaSel alpha_sel){puts("GXSetTevIndirect is a stub");}
void GXSetTexCopyDst(u16 wd, u16 ht, GXTexFmt fmt, GXBool mipmap){puts("GXSetTexCopyDst is a stub");}
void GXSetTexCopySrc(u16 left, u16 top, u16 wd, u16 ht){puts("GXSetTexCopySrc is a stub");}
void GXSetZCompLoc(GXBool before_tex){puts("GXSetZCompLoc is a stub");}
