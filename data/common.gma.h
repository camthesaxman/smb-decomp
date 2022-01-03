/* Model IDs for common.gma */
enum
{
    /*0x0000*/ BALL_TARGET_L,
    /*0x0001*/ BALL_TARGET_R,
    /*0x0002*/ BLU_HEMI_INSIDE,
    /*0x0003*/ BLU_HEMI_OUTSIDE,
    /*0x0004*/ _DUMMY_4,
    /*0x0005*/ BPU_HEMI_INSIDE,
    /*0x0006*/ BPU_HEMI_OUTSIDE,
    /*0x0007*/ old_button,
    /*0x0008*/ CAPSULE_BLU,
    /*0x0009*/ CAPSULE_BPU,
    /*0x000A*/ CAPSULE_GRE,
    /*0x000B*/ CAPSULE_ORA,
    /*0x000C*/ CAPSULE_PUR,
    /*0x000D*/ CAPSULE_RPU,
    /*0x000E*/ CAPSULE_SKY,
    /*0x000F*/ CAPSULE_YEL,
    /*0x0010*/ CAPSULE_YG,
    /*0x0011*/ CLEAR_HEMI_INSIDE,
    /*0x0012*/ CLEAR_HEMI_OUTSIDE,
    /*0x0013*/ CRASH_STAR,
    /*0x0014*/ ENV_ABSORBER,
    /*0x0015*/ GRE_HEMI_INSIDE,
    /*0x0016*/ GRE_HEMI_OUTSIDE,
    /*0x0017*/ LENSFLARE_1_NEW,
    /*0x0018*/ LENSFLARE_2_NEW,
    /*0x0019*/ LENSFLARE_3_NEW,
    /*0x001A*/ LENSFLARE_4_NEW,
    /*0x001B*/ LENSFLARE_5_NEW,
    /*0x001C*/ LENSFLARE_6_NEW,
    /*0x001D*/ LENSFLARE_7_NEW,
    /*0x001E*/ NEW_SCENT_BAG_A,
    /*0x001F*/ NEW_SCENT_BAG_B,
    /*0x0020*/ NEW_SCENT_BAG_WHOLE,
    /*0x0021*/ OBJ_BANANA_01_LOD0,
    /*0x0022*/ OBJ_BANANA_01_LOD100,
    /*0x0023*/ OBJ_BANANA_01_LOD150,
    /*0x0024*/ OBJ_BANANA_01_LOD50,
    /*0x0025*/ OBJ_BANANA_02_LOD0,
    /*0x0026*/ OBJ_BANANA_02_LOD100,
    /*0x0027*/ ORA_HEMI_INSIDE,
    /*0x0028*/ ORA_HEMI_OUTSIDE,
    /*0x0029*/ PAPER_PIECE_DEEPGREEN,
    /*0x002A*/ PAPER_PIECE_GREEN,
    /*0x002B*/ PAPER_PIECE_ORANGE,
    /*0x002C*/ PAPER_PIECE_RED,
    /*0x002D*/ PAPER_PIECE_YELLOW,
    /*0x002E*/ PUR_HEMI_INSIDE,
    /*0x002F*/ PUR_HEMI_OUTSIDE,
    /*0x0030*/ BLACK_SCREEN,
    /*0x0031*/ RED_HEMI_INSIDE,
    /*0x0032*/ RED_HEMI_OUTSIDE,
    /*0x0033*/ RPU_HEMI_INSIDE,
    /*0x0034*/ RPU_HEMI_OUTSIDE,
    /*0x0035*/ SAMPLE,
    /*0x0036*/ SKY_HEMI_INSIDE,
    /*0x0037*/ SKY_HEMI_OUTSIDE,
    /*0x0038*/ SPHERE_EDGE,
    /*0x0039*/ SPHERE_EDGE_01_RED,
    /*0x003A*/ SPHERE_EDGE_02_ORA,
    /*0x003B*/ SPHERE_EDGE_03_YEL,
    /*0x003C*/ SPHERE_EDGE_04_YG,
    /*0x003D*/ SPHERE_EDGE_05_GRE,
    /*0x003E*/ SPHERE_EDGE_06_SKY,
    /*0x003F*/ SPHERE_EDGE_07_BLU,
    /*0x0040*/ SPHERE_EDGE_08_BPU,
    /*0x0041*/ SPHERE_EDGE_09_PUR,
    /*0x0042*/ SPHERE_EDGE_10_RPU,
    /*0x0043*/ old_button_base,
    /*0x0044*/ old_lever_analogue,
    /*0x0045*/ YEL_HEMI_INSIDE,
    /*0x0046*/ YEL_HEMI_OUTSIDE,
    /*0x0047*/ YG_HEMI_INSIDE,
    /*0x0048*/ YG_HEMI_OUTSIDE,
    /*0x0049*/ button,
    /*0x004A*/ button_base,
    /*0x004B*/ lever_analogue,
    /*0x004C*/ lever_analogue_base,
    /*0x004D*/ null1,
    /*0x004E*/ polyshadow01,
    /*0x004F*/ CRASH_FLASH,
    /*0x0050*/ BOMB_FUSE,
    /*0x0051*/ mb_bumper,
    /*0x0052*/ mb_bumper_low,
    /*0x0053*/ mb_jamabar,
    /*0x0054*/ ARROW_1P,
    /*0x0055*/ ARROW_2P,
    /*0x0056*/ ARROW_3P,
    /*0x0057*/ ARROW_4P,
    /*0x0058*/ ARROW_COM,
    /*0x0059*/ gb_grad,
    /*0x005A*/ circle_white,
    /*0x005B*/ circle_white2,
    /*0x005C*/ circle_white2_half,
    /*0x005D*/ CLEAR_HEMI_OUTSIDE_L2,
    /*0x005E*/ CLEAR_HEMI_OUTSIDE_L3,
    /*0x005F*/ RED_HEMI_OUTSIDE_L3,
    /*0x0060*/ SPHERE_EDGE_01_RED_L3,
    /*0x0061*/ SPHERE_EDGE_03_YEL_L2,
    /*0x0062*/ YEL_HEMI_OUTSIDE_L2,
    /*0x0063*/ old_lever_analogue_base,
    /*0x0064*/ NOCOLI_NODISP,
    /*0x0065*/ CLEAR_HEMI_INSIDE_L2,
    /*0x0066*/ CLEAR_HEMI_INSIDE_L3,
    /*0x0067*/ GRE_HEMI_INSIDE_L2,
    /*0x0068*/ GRE_HEMI_INSIDE_L3,
    /*0x0069*/ GRE_HEMI_OUTSIDE_L2,
    /*0x006A*/ GRE_HEMI_OUTSIDE_L3,
    /*0x006B*/ SPHERE_EDGE_05_GRE_L2,
    /*0x006C*/ SPHERE_EDGE_05_GRE_L3,
    /*0x006D*/ _DUMMY_109,
    /*0x006E*/ _DUMMY_110,
    /*0x006F*/ MOT_SPARK_POS,
    /*0x0070*/ _DUMMY_112,
    /*0x0071*/ _DUMMY_113,
    /*0x0072*/ _DUMMY_114,
    /*0x0073*/ _DUMMY_115,
    /*0x0074*/ _DUMMY_116,
    /*0x0075*/ _DUMMY_117,
    /*0x0076*/ _DUMMY_118,
    /*0x0077*/ _DUMMY_119,
    /*0x0078*/ _DUMMY_120,
    /*0x0079*/ _DUMMY_121,
    /*0x007A*/ _DUMMY_122,
    /*0x007B*/ _DUMMY_123,
    /*0x007C*/ _DUMMY_124,
    /*0x007D*/ _DUMMY_125,
    /*0x007E*/ _DUMMY_126,
    /*0x007F*/ _DUMMY_127,
    /*0x0080*/ _DUMMY_128,
    /*0x0081*/ _DUMMY_129,
    /*0x0082*/ _DUMMY_130,
    /*0x0083*/ _DUMMY_131,
    /*0x0084*/ _DUMMY_132,
    /*0x0085*/ _DUMMY_133,
    /*0x0086*/ _DUMMY_134,
    /*0x0087*/ _DUMMY_135,
    /*0x0088*/ _DUMMY_136,
    /*0x0089*/ _DUMMY_137,
    /*0x008A*/ _DUMMY_138,
    /*0x008B*/ _DUMMY_139,
    /*0x008C*/ _DUMMY_140,
    /*0x008D*/ _DUMMY_141,
    /*0x008E*/ _DUMMY_142,
    /*0x008F*/ _DUMMY_143,
    /*0x0090*/ _DUMMY_144,
    /*0x0091*/ _DUMMY_145,
    /*0x0092*/ _DUMMY_146,
    /*0x0093*/ _DUMMY_147,
    /*0x0094*/ _DUMMY_148,
    /*0x0095*/ _DUMMY_149,
    /*0x0096*/ _DUMMY_150,
    /*0x0097*/ _DUMMY_151,
    /*0x0098*/ _DUMMY_152,
    /*0x0099*/ _DUMMY_153,
    /*0x009A*/ _DUMMY_154,
    /*0x009B*/ _DUMMY_155,
    /*0x009C*/ _DUMMY_156,
    /*0x009D*/ _DUMMY_157,
    /*0x009E*/ _DUMMY_158,
    /*0x009F*/ _DUMMY_159,
    /*0x00A0*/ _DUMMY_160,
    /*0x00A1*/ _DUMMY_161,
    /*0x00A2*/ _DUMMY_162,
    /*0x00A3*/ _DUMMY_163,
    /*0x00A4*/ _DUMMY_164,
    /*0x00A5*/ _DUMMY_165,
    /*0x00A6*/ _DUMMY_166,
    /*0x00A7*/ _DUMMY_167,
    /*0x00A8*/ _DUMMY_168,
    /*0x00A9*/ _DUMMY_169,
    /*0x00AA*/ _DUMMY_170,
    /*0x00AB*/ _DUMMY_171,
    /*0x00AC*/ _DUMMY_172,
    /*0x00AD*/ _DUMMY_173,
    /*0x00AE*/ _DUMMY_174,
    /*0x00AF*/ _DUMMY_175,
    /*0x00B0*/ _DUMMY_176,
    /*0x00B1*/ _DUMMY_177,
    /*0x00B2*/ BLU_HEMI_INSIDE_L2,
    /*0x00B3*/ BLU_HEMI_INSIDE_L3,
    /*0x00B4*/ BLU_HEMI_OUTSIDE_L2,
    /*0x00B5*/ BLU_HEMI_OUTSIDE_L3,
    /*0x00B6*/ RED_HEMI_INSIDE_L2,
    /*0x00B7*/ RED_HEMI_INSIDE_L3,
    /*0x00B8*/ RED_HEMI_OUTSIDE_L2,
    /*0x00B9*/ SPHERE_EDGE_01_RED_L2,
    /*0x00BA*/ SPHERE_EDGE_03_YEL_L3,
    /*0x00BB*/ SPHERE_EDGE_07_BLU_L2,
    /*0x00BC*/ SPHERE_EDGE_07_BLU_L3,
    /*0x00BD*/ YEL_HEMI_INSIDE_L2,
    /*0x00BE*/ YEL_HEMI_INSIDE_L3,
    /*0x00BF*/ YEL_HEMI_OUTSIDE_L3,
};
