#ifndef _SRC_TYPES_H_
#define _SRC_TYPES_H_

#include <dolphin/types.h>
#include <dolphin/GXStruct.h>
#include <dolphin/GXEnum.h>
#include <dolphin/GXFifo.h>
#include <dolphin/mtx.h>

typedef struct {
    f32 x, y;
} Vec2d, *Vec2dPtr, Point2d, *Point2dPtr;

// DIP switches
enum
{
    DIP_DEBUG        = 1 << 0,
    DIP_DISP         = 1 << 1,
    DIP_STCOLI       = 1 << 2,
    DIP_TRIANGLE     = 1 << 3,
    DIP_BALL_TGT     = 1 << 4,
    DIP_JOINT_OFF    = 1 << 5,
    DIP_APE_COLOR    = 1 << 6,
    DIP_TIME_STOP    = 1 << 7,
    DIP_KARAKUCHI    = 1 << 8,
    DIP_NAMEENTRY    = 1 << 9,
    DIP_SHADOW_TEST  = 1 << 10,
    DIP_FALL_DISP    = 1 << 11,
    DIP_TEST_CAM     = 1 << 12,
    DIP_NO_INTR      = 1 << 13,
    DIP_CAPTURE      = 1 << 14,
    DIP_OLD_BALL     = 1 << 15,
    DIP_NO_KARI      = 1 << 16,
    DIP_PLAY_STG_ALL = 1 << 17,
    DIP_PLAY_PNT_X10 = 1 << 18,
    DIP_SARU_0       = 1 << 19,
    DIP_SWITCH20     = 1 << 20,
    DIP_SWITCH21     = 1 << 21,
    DIP_SWITCH22     = 1 << 22,
    DIP_SWITCH23     = 1 << 23,
    DIP_SWITCH24     = 1 << 24,
    DIP_SWITCH25     = 1 << 25,
    DIP_SWITCH26     = 1 << 26,
    DIP_SWITCH27     = 1 << 27,
    DIP_SWITCH28     = 1 << 28,
    DIP_SWITCH29     = 1 << 29,
    DIP_SWITCH30     = 1 << 30,
    DIP_SWITCH31     = 1 << 31,
};

struct Color3f { float r, g, b; };

// sprite alignment
// When setting the position of a sprite (x and y fields), this determines which corner or edge
// of the sprite lies at that point.
enum Alignment
{
    ALIGN_LT,
    ALIGN_LC,
    ALIGN_LB,
    ALIGN_CT,
    ALIGN_CC,
    ALIGN_CB,
    ALIGN_RT,
    ALIGN_RC,
    ALIGN_RB,
    ALIGN_PIC,
};

// avdisp.c
struct GMAShape;
struct GMATevLayer;
struct DrawShapeDeferredNode;
struct GMATevLayer;
struct TevStageInfo;

struct TPLTextureHeader
{
    /*0x00*/ u32 format;
    /*0x04*/ u32 imageOffset;
    /*0x08*/ u16 width;
    /*0x0A*/ u16 height;
    /*0x0C*/ u16 unkC;
};  // size = 0x10

struct TPL
{
    /*0x00*/ u32 numTextures;
    /*0x04*/ struct TPLTextureHeader *texHeaders;
    /*0x08*/ u8 *fileData;  // raw file data
    /*0x0C*/ GXTexObj *texObjs;  // only used by bitmap.c? avdisp.c seems to think TPL struct is only 12 bytes.
};
// maybe bitmap.c has a different struct that "contains" TPL?

struct GFXBufferInfo
{
    /*0x00*/ void *currFrameBuf;
    /*0x04*/ void *frameBufs[2];
    /*0x0C*/ u32 fbNum;
    /*0x10*/ GXFifoObj *fifos[2];
};

struct StageBgAnim
{
    s32 loopStartSeconds;
    s32 loopEndSeconds;
    u32 scaleXKeyframeCount;
    struct Keyframe *scaleXKeyframes;
    u32 scaleYKeyframeCount;
    struct Keyframe *scaleYKeyframes;
    u32 scaleZKeyframeCount;
    struct Keyframe *scaleZKeyframes;
    u32 rotXKeyframeCount;
    struct Keyframe *rotXKeyframes;
    u32 rotYKeyframeCount;
    struct Keyframe *rotYKeyframes;
    u32 rotZKeyframeCount;
    struct Keyframe *rotZKeyframes;
    u32 posXKeyframeCount;
    struct Keyframe *posXKeyframes;
    u32 posYKeyframeCount;
    struct Keyframe *posYKeyframes;
    u32 posZKeyframeCount;
    struct Keyframe *posZKeyframes;
    u32 visibleKeyframeCount;
    struct Keyframe *visibleKeyframes;  // Model visible if value >= 0.5?
    u32 translucencyKeyframeCount;
    struct Keyframe *translucencyKeyframes;
};

struct NightWindowAnim
{
    Point3d pos;
    s16 rotX;
    s16 rotY;
    s16 rotZ;
    s8 id; // Which list of flipbook models to animate
};

struct StormFireAnim
{
    Point3d pos;
    s8 frameOffset;
};

struct StageFlipbookAnims
{
    s32 nightWindowAnimCount;
    struct NightWindowAnim *nightWindowAnims;
    s32 stormFireAnimCount;
    struct StormFireAnim *stormFireAnims;
};

struct StageBgObject;
struct Camera;
struct Sprite;
struct FontParams;
struct GMA;
struct TPL;
struct Ape;
struct Ball;

struct Struct80089CBC
{
    s32 unk0;
    s32 unk4;
    u32 unk8;
    u32 unkC;
    s32 unk10;
    s32 unk14;
    u8 filler18[0x20-0x18];
};  // size = 0x20

struct Struct802B39C0_B0_child
{
    u32 unk0;
    float unk4;
    s32 unk8;
    struct Struct80089CBC *unkC;
    float unk10;
    s32 unk14[4];
};  // size = 0x24

// Represents a joint's channel (x, y, z, rotX, rotY, rotZ) whose value changes during the animation
struct MotionChannel
{
    u8 keyframeCount;
    u8 currKeyframe;
    u16 *times;
    u8 *valueCounts;
    float *values;
};  // size = 0x10

struct AnimJoint
{
    u32 flags;
    Vec unk4;
    Vec unk10;
    Mtx unk1C;
    /*0x4C*/ u32 childCount;
    /*0x50*/ const u8 *childIndexes;  // indexes of joints that are attached to this one
    /*0x54*/ struct MotionChannel channels[6];  // x, y, z, rotX, rotY, rotZ
    u8 fillerB4[0x168-0xB4];
    Mtx unk168;
    float unk198;
    float unk19C;
    /*0x1A0*/ s32 parentIdx;  // index of this joint's parent, or -1 if this is the root
    Vec unk1A4;
    Quaternion unk1B0;
    Point3d unk1C0;
    Point3d unk1CC;
    /*0x1D8*/ Mtx rotateMtx;
    /*0x208*/ Mtx transformMtx;  // final transform matrix?
};  // size = 0x238

struct Struct8003699C_child_sub
{
    u32 unk0;
	u16 unk4;
    u16 unk6;
	u16 unk8;
	u16 unkA;
	u16 unkC;
	float unk10;
	float unk14;
    u32 unk18;
    float unk1C;
    float unk20;
    s32 unk24;
	u16 unk28;
    u16 unk2A;
    float unk2C;
    u8 filler30[4];
    struct AnimJoint *unk34;
    struct AnimJoint unk38[29];
};  // size = 0x4090

struct Struct8003699C_child_child
{
	u16 unk0;
	u16 unk2;
	u32 unk4;
	u32 unk8;
};  // size = 0xC

struct Struct8003699C_child
{
    u32 unk0;
    u8 filler4[0x28-0x4];
    u16 unk28;
    u16 unk2A;
    u16 unk2C;
    s16 unk2E;
    u8 filler30[2];
    u16 unk32;
    u16 unk34;
    u16 unk36;
    u16 unk38;
    u16 unk3A;
    float unk3C;
    float unk40;
    u8 filler44[0x54-0x44];
    Mtx unk54;
    struct Struct8003699C_child_sub unk84;
    struct Struct8003699C_child_sub unk4114;
    const struct Struct8003699C_child_child *unk81A4;
    /*0x81A8*/ struct AnimJoint joints[29];
};

struct MotRotation
{
    float rotX;
    float rotY;
    float rotZ;
};

struct Ape_child
{
    float unk0;
    s32 unk4;
    u32 unk8;
    u32 unkC;
    s32 unk10;
    s32 unk14;
    float unk18;
    u32 unk1C;
};  // size = 0x20

struct Ape
{
    struct Struct8003699C_child *unk0;
    struct Struct8003699C_child *unk4;
    float unk8;
    float unkC;
    /*0x010*/ s32 charaId;
    /*0x014*/ u32 flags;
    s32 unk18;
    struct Ape_child *unk1C;
    struct Ape_child *unk20;
    s32 unk24;
    s32 unk28;
    struct MotSkeletonEntry1 *skel;  // skeleton?
    Vec unk30;  // position?
    Vec unk3C;
    Vec unk48;
    s32 unk54;
    /*0x58*/ float modelScale;  // model scale?
    u32 unk5C;
    Quaternion unk60;  // orientation?
    u32 unk70;
    u32 unk74;
    u8 filler78[0x90-0x78];
    s32 unk90;  // some model ID?
    u32 unk94;
    struct Struct802B39C0_B0_child *unk98;
    u32 unk9C;
    // Sometimes treated as a Vec, sometimes treated as a Quaternion
    Vec unkA0;
    float unkAC;
    u32 unkB0;
    /*0x0B4*/ int colorId;
    void *unkB8;
    void *unkBC;
    /*0xC0*/ s8 ballId;
    u8 unkC1;
    s16 unkC2;
};  // size = 0xC4

struct Struct80176434
{
    s32 unk0;
    float unk4;
    float unk8;
    float unkC;
};  // size=0x10

struct AnimGroupInfo
{
    /*0x00*/ Point3d pos;
    /*0x0C*/ Point3d prevPos;
    /*0x18*/ S16Vec rot;
    /*0x1E*/ S16Vec prevRot;
    /*0x24*/ Mtx transform;     // Transform from anim group space to world space
    /*0x54*/ Mtx prevTransform; // Previous frame transform from animGroup space to world space
};

struct RaycastHit
{
    u32 flags;
    Point3d pos;
    Vec normal;
};

typedef u32 (*Func802F20F0)();
typedef void (*CameraCallback)(struct Camera *, struct Ball *);
typedef void (*BallCallback)(struct Ball *);

struct NlModel;
struct NlObj;

struct Struct80092B98
{
    float unk0;
    float unk4;
    float unk8;
    float unkC;
    Vec unk10;
    float unk1C;
    Vec unk20;
    s16 unk2C;
    u16 unk2E;
    float unk30;
    float unk34;
    GXColor unk38;
    void *unk3C;
};  // size = 0x40

struct Struct8009492C
{
    Vec unk0;
    S16Vec unkC;
    Vec unk14;
    float unk20;
    float unk24;
    struct GMAModel *unk28;
    GXColor unk2C;
    u8 filler30[0x38-0x30];
};

enum
{
    COLI_FLAG_OCCURRED = 1 << 0, // If at least one ball collision occurred on the current frame
};

struct ColiPlane
{
    Point3d point; // A point on the plane
    Vec normal;    // Normal of plane
};

struct PhysicsBall
{
    /*0x00*/ u32 flags;

    // Current center position in animGroupId's local space
    /*0x04*/ Point3d pos;

    // Center position at end of previous frame in animGroupId's previous frame local space
    /*0x10*/ Point3d prevPos;

    // Current velocity in animGroupId's local space
    /*0x1C*/ Vec vel;

    /*0x28*/ float radius;
    /*0x2C*/ float gravityAccel;
    /*0x30*/ float restitution;

    // The ball may collide with more than one surface during a frame. The "hardest" collision is
    // recorded, which is used to draw visual collision effects for example.

    // Largest (in magnitude) animGroup-relative ball velocity along the collision normal. It's
    // always negative because when a collision occurs, the ball's animGroup-relative velocity is
    // pointing away from the normal.
    /*0x34*/ float hardestColiSpeed;

    // Collision plane of the hardest collision, in hardestColiAnimGroupId's local space
    /*0x38*/ struct ColiPlane hardestColiPlane;

    // animGroup ID of the hardest collision
    /*0x50*/ s32 hardestColiAnimGroupId;

    // Friction applied to the ball's velocity on each contact with a surface.
    //
    // Specifically, it is the fraction of the ball's velocity parallel to the contact surface which
    // is thrown away upon contact. The ball's velocity in this context is relative to the contact
    // surface's velocity. For example, the relative velocity of a motionless ball on a platform
    // with velocity (1, 0, 0) would be (-1, 0, 0).
    /*0x54*/ float friction;

    // animGroup whose local space we are in.
    // As a reminder, ID 0 is world space.
    /*0x58*/ s32 animGroupId;
};

struct ColiEdge
{
    // Winds counterclockwise around tri up normal
    Point2d start;
    Point2d end;

    // Coplanar with triangle, points inside triangle
    Vec2d normal;
};

typedef void (*Struct80206DEC_Func)(void);

struct Struct80206DEC
{
    s32 unk0;
    float u_stageTimer;
    Struct80206DEC_Func unk8;
    u32 unkC;
    float unk10[3];
    u32 unk1C;
    u8 filler20[0x5C-0x20];
};

struct Stage;

// motload

struct MotDatJoint
{
    u8 jointIdx;
    u16 chanFlags;  // specifies which channels are present in the animation
};  // size = 0x4

// struct containing all transformation values for all joints in an animation
struct MotDat
{
    u16 unk0;
    struct MotDatJoint *jointInfo; // ptr to array of structs
    u8 *keyframeCounts;  // number of keyframes per channel
    u16 *times;  // times for each keyframe
    u8 *valueCounts;  // number of values for each keyframe
    float *values;
};  // size = 0x18

struct ChildJointList
{
    u32 count;
    const u8 *children;
};

struct MotSkeletonEntry1
{
    void *unk0;
    /*0x04*/ struct ChildJointList *childLists;
    /*0x08*/ struct MotRotation *rotations;
    Vec *unkC;
    Vec *unk10;
    /*0x14*/ char *name;  // skeleton name?
};  // size = 0x18

struct Struct80034B50_child2_child
{
    void *unk0;
    u8 filler4[0x18-0x4];
};

struct MotSkeletonEntry2
{
    void *unk0;
    struct Struct80034B50_child2_child *unk4[3];
    s32 unk10[3];
};

struct MotSkeleton
{
    struct MotSkeletonEntry1 *unk0;
    u32 unk4;
    struct MotSkeletonEntry2 *unk8;  // not used?
    u32 unkC;  // not used?
};

struct MotInfo
{
    /*0x00*/ char skelName[24];
    /*0x10*/ char modelName[24];
    u8 *unk30[16];
    u32 unk70[16];
    u8 *unkB0;
};  // size = 0xB4

struct Struct80034F5C_2
{
    u16 unk0;
    u16 unk2;
};  // size = 4

struct Struct80034F5C_3
{
    u16 filler0;
    u16 unk2;
    float unk4;
    float unk8;
    float unkC;
    float unk10;
    float unk14;
    float unk18;
};  // size = 0x1C

struct CoordsS8
{
    s8 x;
    s8 y;
};

struct Struct8020A348_child
{
    u32 flags;
    struct GMAModel *model;  // GMAModel
    float unk8;
};  // size = 0xC

struct Struct8020A348
{
    struct Struct8020A348_child *unk0;
    s32 unk4;
};

struct StageSelection
{
    s32 difficulty;
    s32 levelNum;
};

// Parameters for drawing a sprite to the screen
struct NaomiSpriteParams
{
    /*0x00*/ s32 bmpId;  // ID of bitmap image to use as texture

    // Position
    /*0x04*/ float x;  // position of sprite (0-640) from left edge of screen
    /*0x08*/ float y;  // position of sprite (0-480) from top edge of screen
    /*0x0C*/ float z;

    // Scale. The size of the sprite is this scale multiplied by the dimensions of the sprite's texture.
    /*0x10*/ float scaleX;
    /*0x14*/ float scaleY;

    // Texture coordinates
    /*0x18*/ float u1;  // x texture coordinate of left edge
    /*0x1C*/ float v1;  // y texture coordinate of top edge
    /*0x20*/ float u2;  // x texture coordinate of right edge
    /*0x24*/ float v2;  // y texture coordinate of bottom edge

    /*0x28*/ s32 rotation;  // counterclockwise rotation in units of 1/65536 turn
    /*0x2C*/ float opacity;
    s32 unk30;
    /*0x34*/ u32 flags;

    // Color of sprite. The final color is computed by texColor * mulColor + addColor
    /*0x38*/ u32 mulColor;  // RGBA color. Note: The alpha component of this color is ignored.
                            // The above "opacity" field is used instead.
    /*0x3C*/ u32 addColor;  // RGBA color

    u8 filler40[0x50-0x40];
};

struct NlVtxTypeB;
struct NlVtxTypeA;

// Part of the stage whose vertices are manipulated by functions
struct DynamicStagePart
{
    void *modelName;
    struct NlModel *origModel;  // original model
    void (*posNrmTexFunc)(struct NlVtxTypeB *);
    void (*posColorTexFunc)(struct NlVtxTypeA *);
    u32 (*raycastDownFunc)(Point3d *rayOrigin, Point3d *outHitPos, Vec *outHitNormal);
    struct NlModel *tempModel;  // modified copy of the model
};

struct Struct801EEC80
{
    float unk0;
    float unk4;
    float unk8;
    float unkC;
};

struct Struct801EEC90
{
    u32 unk0;
    Vec unk4;
    Vec unk10;
    Vec unk1C;
    Vec unk28;
    Vec unk34;
    Vec unk40;
    s32 unk4C;  // 5C
    u8 filler50[4];
    u32 unk54;
    s32 unk58;
    float unk5C;
    float unk60;
    u8 filler64[4];
};

struct Struct802F1B4C
{
    u32 unk6C;
};

struct PauseMenuState
{
    s32 unk0;
    u32 unk4;
    /*0x08*/ s32 selection;
    /*0x0C*/ s32 itemCount;
    /*0x10*/ s32 menuType;
    /*0x14*/ s8 padId;  // controller that pressed start
    /*0x15*/ s8 playerId;  // player who paused the game?
    s16 unk16;
};

struct FogInfo
{
    s8 unk0;
    u8 filler1[3];
    float unk4;
    float unk8;
    u8 r, g, b;
    s8 enabled;
};

struct Struct80209488;

struct OrdTblNode;

struct Struct802F1B3C
{
    Mtx matrices[5];
    struct OrdTblNode *entries;
    s32 maxEntries;
    float depthOffset;
    float minDepth;
    float maxDepth;
    struct OrdTblNode *lastEntry;  // the last node in 'entries'
    struct OrdTblNode *firstEntry;  // the first node in 'entries'
    float depthRange;
};

struct Sphere
{
    Point3d pos;
    float radius;
};

struct Preview;
struct NlDispList;

struct Struct801EED88
{
    u8 unk0;
    u8 unk1[6];
    u32 unk8;
    u32 unkC;
};  // size = 0x10

struct MemcardGameData_sub
{
    /*0x5844*/ u8 filler0[0x44-0x00];
    /*0x5888*/ u8 unk44;
    /*0x5889*/ u8 unk45;
    /*0x588A*/ u8 unk46;
    /*0x588B*/ u8 unk47;
    /*0x588C*/ u8 unk48;
    /*0x588D*/ u8 unk49;
    /*0x588E*/ u8 unk4A;
    /*0x588F*/ u8 unk4B;
    /*0x5890*/ u8 unk4C;
    /*0x5891*/ u8 unk4D;
    /*0x5892*/ u8 unk4E;
    /*0x5893*/ u8 unk4F;
    /*0x5894*/ u8 unk50;
    /*0x5895*/ u8 unk51;
    /*0x5896*/ u8 unk52;
    /*0x5897*/ u8 unk53;
    /*0x5898*/ u8 unk54;
    /*0x5899*/ u8 unk55;
    /*0x589A*/ u8 filler56[2];
    /*0x589C*/ s16 unk58;
    /*0x589E*/ s16 unk5A;
    /*0x58A0*/ s16 unk5C;
    /*0x58A2*/ s16 unk5E;
    /*0x58A4*/ s16 unk60;
    /*0x58A6*/ s16 unk62;
    /*0x58A8*/ s16 unk64;
    /*0x58AA*/ s16 unk66;
    /*0x58AC*/ s16 unk68;
    /*0x58AE*/ s16 unk6A;
    /*0x58B0*/ u8 filler6C[4];
    /*0x58B4*/ u32 unk70;
    /*0x58B8*/ u32 unk74;
    /*0x58BC*/ u32 unk78;
    /*0x58C0*/ u32 unk7C;
    /*0x58C4*/ u32 unk80;
    /*0x58C8*/ u32 unk84;
    /*0x58CC*/ s16 unk88;
    /*0x58CE*/ s16 unk8A;
    /*0x58D0*/ u32 unk8C;
    /*0x58D4*/ u32 unk90;
    /*0x58D8*/ u32 unk94;
    /*0x58DC*/ u32 unk98;
    /*0x58E0*/ u32 unk9C;
    /*0x58E4*/ u32 unkA0;
    /*0x58E8*/ u8 unkA4[6];
    /*0x58EE*/ u8 unkAA;
    /*0x58EF*/ s8 unkAB;
    /*0x58F0*/ u8 unkAC;
    /*0x58F1*/ u8 unkAD;
    /*0x58F2*/ u8 unkAE;
    /*0x58F3*/ s8 unkAF;
    /*0x58F4*/ u8 unkB0[0x1FC];  // size = 0x1FC
    /*0x5AF0*/ u32 unk2AC;
    /*0x5AF4*/ u8 unk2B0;
    /*0x5AF5*/ u8 unk2B1;
    /*0x5AF6*/ u8 unk2B2;
    /*0x5AF7*/ u8 unk2B3;
    /*0x5AF8*/ u8 unk2B4;
    /*0x5AF9*/ u8 unk2B5;
    /*0x5AFA*/ u8 unk2B6;
    /*0x5AFB*/ s8 unk2B7;
    /*0x5AFC*/ u32 unk2B8;
    /*0x5B00*/ s8 unk2BC;
    /*0x5B01*/ u8 unk2BD;
    /*0x5B02*/ u8 filler2BE[1];
    /*0x5B03*/ u8 unk2BF;
    /*0x5B04*/ u32 unk2C0;
    /*0x5B08*/ u32 unk2C4;
    /*0x5B0C*/ u8 filler2C8[0x3BC-0x2C8];
    /*0x5C00*/ u32 unk3BC;
};  // size = 0x3C0

struct MemcardGameData
{
    /*0x0000*/ u16 crc;
    /*0x0002*/ u16 version;
    /*0x0004*/ u8 bannerAndIcon[0x5800];
    /*0x5804*/ char comment[32];
    /*0x5824*/ char title[32];
    /*0x5844*/ struct MemcardGameData_sub unk5844;
};

struct Keyframe
{
    s32 easeType;
    float timeSeconds;
    float value;
    float tangentIn;
    float tangentOut;
};

struct StageAnimGroup;
struct StageBanana;

struct Item;

struct ModelLOD
{
    s32 modelId;
    float distance;
};

struct Struct802C67D4
{
    u8 filler0[4];
    u32 unk4;
    u8 filler8[0x50-0x8];
};

struct ApeFacePart
{
    s16 modelId;
    s16 jointIdx;
    Vec unk4;
    void (*draw)(struct Ape *, struct ApeFacePart *, struct Struct802B39C0_B0_child *);
    char *name;
    u8 filler18[0x20-0x18];
};

struct ApeGfxFileInfo
{
    char *basename;  // base name of the file (without suffix)
    struct ApeFacePart *facePartInfo[4];  // face part info per LOD?
    /*0x14*/ s16 partCounts[4];  // counts?
    s16 unk1C[2];
    u8 filler20[4];
};  // size = 0x24

struct Struct80061BC4_sub
{
    s32 unk0;
    int unk4;
    s32 unk8;
    /*0x0C*/ GXTexMapID u_texMapId;
    s32 unk10;
    s32 unk14;
    u32 unk18;
    s32 unk1C;
    u32 unk20;
    u8 filler20[0x2C-0x24];
};

struct EnvMapSomething
{
    s32 unk0;
    u8 filler4[0xC-0x4];
    struct Struct80061BC4_sub unkC;
    u32 unk2C;
};

typedef void (*BallEnvFunc)(struct EnvMapSomething *);

struct BgLightInfo
{
	float unk0;
    struct Color3f ambient;
    float unk10;
    float unk14;
    float unk18;
    float unk1C;
    float unk20;
    float unk24;
    float unk28;
    float unk2C;
    float unk30;

    // Global directional light ("infinite" light)
    struct Color3f infLightColor;
	s16 infLightRotX;
	s16 infLightRotY;

    s8 **bgLightGroups;
};

struct Light;

struct Struct802F1BE8
{
    u32 unk0;
    u8 unk4;
};

struct Struct802F1BF4
{
    u8 unk0;
    u8 unk1;
    u8 filler2[2];
    u32 unk4;
};

struct Struct802F1BFC
{
    u8 unk0;
    u8 filler1[3];
    u32 unk4;
};

struct Struct802F1C04
{
    s16 unk0;
    s16 unk2;
    u32 unk4;
};

struct Struct802F1C10
{
    u8 unk0;
    u8 unk1;
    s8 unk2;
    u8 unk3;
    s8 unk4[4];
};

struct GBilLightGroup
{
    char *name;
    s8 u_bgLightGroupId;
};

enum
{
    PAUSEMENU_CONT_HOW_EXIT,
    PAUSEMENU_CONT_VIEW_HOW_EXIT,
    PAUSEMENU_CONT_RETRY_VIEW_HOW_SELECT_EXIT,
    PAUSEMENU_CONT_RETRY_HOW_EXIT,
    PAUSEMENU_CONT_GUIDE_HOW_EXIT,
};

struct Struct8008CF00
{
	void (*unk0)(struct Ape *, int);
	struct Ape *unk4;
	struct Struct8008CF00 *prev;
	struct Struct8008CF00 *next;
	u32 unk10;
	u32 unk14;
	u32 unk18;
	u32 unk1C;
};

struct Stobj;

struct Struct80089A04
{
    char *unk0;
    char *names[4];
    u32 unk14;
    u32 filler18[6];
    s32 unk30[4];
};

struct ScoreRecord
{
    char initials[4];
    u32 score;
    u8 filler8[4];
    u8 floorNum;
    s8 unkD;  // 0 = normal, 1 = extra, 2 = master
};

struct Struct80250A68
{
    s32 unk0[4];
    float unk10;
    s32 unk14;
};

struct Struct801EEDA8
{
    s32 unk0;
    s32 unk4;
    s32 unk8;
    s16 unkC;
    s16 unkE;
    u32 unk10[1];
    u8 filler14[0x3C-0x14];
    s32 unk3C;
    s32 unk40;
    s32 unk44;
    s32 unk48[4];
    u32 unk58[4];
    u32 unk68;
    s32 unk6C[10];
    s32 unk94[10];
    u32 unkBC;
    u32 unkC0;
    u8 fillerC4[0xF4-0xC4];
    s32 unkF4;
    u8 fillerF8[0x100-0xF8];
    float unk100;
    u8 filler104[4];
    s32 unk108;
    u8 filler10C[0x110-0x10C];
    u32 unk110;
    s8 unk114;
    u8 filler115[3];
};

struct Struct8009DBB0
{
    int unk0;
    Vec unk4;
    Vec unk10;
};

struct Struct801EED98
{
    /*0x00*/ u32 unk48;
    /*0x04*/ u8 unk4C;
    u8 unk4D;
    u8 unk4E;
    u8 unk4F;
    /*0x08*/ u8 unk50;
    u8 filler9[0xC-0x9];
    u32 unkC;
};

struct Struct801EED50
{
    s8 unk0;
    u8 filler1[3];
    s16 unk4;
    s16 unk6;
    u32 unk8;
    s16 unkC;
    s16 unkE;
    u32 unk10;
    s16 unk14;
    s16 unk16;
    u32 unk18;
    s16 unk1C;
    s16 unk1E;
    u32 unk20;
    s16 unk24;
    s16 unk26;
    u32 unk28;
    u32 unk2C;
    u8 unk30;
    u8 unk31;
    u8 unk32;
    u8 unk33;
    u8 unk34;
    u8 filler35[3];
};

struct Struct802F1FB4
{
    s16 unk0;
    s16 unk2;
    u32 unk4;
};

#endif
