.section _extab, "wa"  # 0x800054C0 - 0x80005B80
	.incbin "baserom.dol", 0x10B780, 0x6C0

.section _extabindex, "wa"  # 0x80005B80 - 0x800065A0
	.incbin "baserom.dol", 0x10BE40, 0x9FC
.global lbl_8000657C
lbl_8000657C:
	.incbin "baserom.dol", 0x10C83C, 0x24

.section .ctors, "wa"  # 0x8010F860 - 0x8010F880
.global __init_cpp_exceptions_reference
__init_cpp_exceptions_reference:
	.incbin "baserom.dol", 0x10C860, 0x20

.section .dtors, "wa"  # 0x8010F880 - 0x8010F8A0
.global lbl_8010F880
lbl_8010F880:
	.incbin "baserom.dol", 0x10C880, 0x20

.section .rodata, "wa"  # 0x8010F8A0 - 0x80172380
.global lbl_8010F8A0
lbl_8010F8A0:
	.incbin "baserom.dol", 0x10C8A0, 0xC
.global lbl_8010F8AC
lbl_8010F8AC:
	.incbin "baserom.dol", 0x10C8AC, 0x204
.global lbl_8010FAB0
lbl_8010FAB0:
	.incbin "baserom.dol", 0x10CAB0, 0x4D4
.global lbl_8010FF84
lbl_8010FF84:
	.incbin "baserom.dol", 0x10CF84, 0xC
.global lbl_8010FF90
lbl_8010FF90:
	.incbin "baserom.dol", 0x10CF90, 0x74
.global lbl_80110004
lbl_80110004:
	.incbin "baserom.dol", 0x10D004, 0x1C4
.global lbl_801101C8
lbl_801101C8:
	.incbin "baserom.dol", 0x10D1C8, 0x14
.global lbl_801101DC
lbl_801101DC:
	.incbin "baserom.dol", 0x10D1DC, 0x40
.global lbl_8011021C
lbl_8011021C:
	.incbin "baserom.dol", 0x10D21C, 0x14
.global lbl_80110230
lbl_80110230:
	.incbin "baserom.dol", 0x10D230, 0xC
.global lbl_8011023C
lbl_8011023C:
	.incbin "baserom.dol", 0x10D23C, 0xC
.global lbl_80110248
lbl_80110248:
	.incbin "baserom.dol", 0x10D248, 0x18
.global lbl_80110260
lbl_80110260:
	.incbin "baserom.dol", 0x10D260, 0xB0
.global lbl_80110310
lbl_80110310:
	.incbin "baserom.dol", 0x10D310, 0x10
.global lbl_80110320
lbl_80110320:
	.incbin "baserom.dol", 0x10D320, 0xB8
.global lbl_801103D8
lbl_801103D8:
	.incbin "baserom.dol", 0x10D3D8, 0x28
.global lbl_80110400
lbl_80110400:
	.incbin "baserom.dol", 0x10D400, 0x17C
.global lbl_8011057C
lbl_8011057C:
	.incbin "baserom.dol", 0x10D57C, 0x4250
.global lbl_801147CC
lbl_801147CC:
	.incbin "baserom.dol", 0x1117CC, 0x604
.global lbl_80114DD0
lbl_80114DD0:
	.incbin "baserom.dol", 0x111DD0, 0x10
.global lbl_80114DE0
lbl_80114DE0:
	.incbin "baserom.dol", 0x111DE0, 0x188
.global lbl_80114F68
lbl_80114F68:
	.incbin "baserom.dol", 0x111F68, 0x10
.global lbl_80114F78
lbl_80114F78:
	.incbin "baserom.dol", 0x111F78, 0x16BC
.global lbl_80116634
lbl_80116634:
	.incbin "baserom.dol", 0x113634, 0x119C
.global lbl_801177D0
lbl_801177D0:
	.incbin "baserom.dol", 0x1147D0, 0x90
.global lbl_80117860
lbl_80117860:
	.incbin "baserom.dol", 0x114860, 0xC
.global lbl_8011786C
lbl_8011786C:
	.incbin "baserom.dol", 0x11486C, 0xC
.global lbl_80117878
lbl_80117878:
	.incbin "baserom.dol", 0x114878, 0x18
.global lbl_80117890
lbl_80117890:
	.incbin "baserom.dol", 0x114890, 0x10
.global lbl_801178A0
lbl_801178A0:
	.incbin "baserom.dol", 0x1148A0, 0xC
.global lbl_801178AC
lbl_801178AC:
	.incbin "baserom.dol", 0x1148AC, 0x10
.global lbl_801178BC
lbl_801178BC:
	.incbin "baserom.dol", 0x1148BC, 0xC
.global lbl_801178C8
lbl_801178C8:
	.incbin "baserom.dol", 0x1148C8, 0x10
.global lbl_801178D8
lbl_801178D8:
	.incbin "baserom.dol", 0x1148D8, 0xC
.global lbl_801178E4
lbl_801178E4:
	.incbin "baserom.dol", 0x1148E4, 0x10
.global lbl_801178F4
lbl_801178F4:
	.incbin "baserom.dol", 0x1148F4, 0xC
.global lbl_80117900
lbl_80117900:
	.incbin "baserom.dol", 0x114900, 0x10
.global lbl_80117910
lbl_80117910:
	.incbin "baserom.dol", 0x114910, 0xC
.global lbl_8011791C
lbl_8011791C:
	.incbin "baserom.dol", 0x11491C, 0x10
.global lbl_8011792C
lbl_8011792C:
	.incbin "baserom.dol", 0x11492C, 0xC
.global lbl_80117938
lbl_80117938:
	.incbin "baserom.dol", 0x114938, 0x10
.global lbl_80117948
lbl_80117948:
	.incbin "baserom.dol", 0x114948, 0xC
.global lbl_80117954
lbl_80117954:
	.incbin "baserom.dol", 0x114954, 0x10
.global lbl_80117964
lbl_80117964:
	.incbin "baserom.dol", 0x114964, 0xC
.global lbl_80117970
lbl_80117970:
	.incbin "baserom.dol", 0x114970, 0x10
.global lbl_80117980
lbl_80117980:
	.incbin "baserom.dol", 0x114980, 0xC
.global lbl_8011798C
lbl_8011798C:
	.incbin "baserom.dol", 0x11498C, 0x10
.global lbl_8011799C
lbl_8011799C:
	.incbin "baserom.dol", 0x11499C, 0xC
.global lbl_801179A8
lbl_801179A8:
	.incbin "baserom.dol", 0x1149A8, 0x10
.global lbl_801179B8
lbl_801179B8:
	.incbin "baserom.dol", 0x1149B8, 0xC
.global lbl_801179C4
lbl_801179C4:
	.incbin "baserom.dol", 0x1149C4, 0x24
.global lbl_801179E8
lbl_801179E8:
	.incbin "baserom.dol", 0x1149E8, 0x1C
.global lbl_80117A04
lbl_80117A04:
	.incbin "baserom.dol", 0x114A04, 0x34
.global lbl_80117A38
lbl_80117A38:
	.incbin "baserom.dol", 0x114A38, 0x10
.global lbl_80117A48
lbl_80117A48:
	.incbin "baserom.dol", 0x114A48, 0x10
.global lbl_80117A58
lbl_80117A58:
	.incbin "baserom.dol", 0x114A58, 0xC
.global lbl_80117A64
lbl_80117A64:
	.incbin "baserom.dol", 0x114A64, 0xC
.global lbl_80117A70
lbl_80117A70:
	.incbin "baserom.dol", 0x114A70, 0x10
.global lbl_80117A80
lbl_80117A80:
	.incbin "baserom.dol", 0x114A80, 0xDF0
.global lbl_80118870
lbl_80118870:
	.incbin "baserom.dol", 0x115870, 0x78
.global lbl_801188E8
lbl_801188E8:
	.incbin "baserom.dol", 0x1158E8, 0x20
.global lbl_80118908
lbl_80118908:
	.incbin "baserom.dol", 0x115908, 0x30
.global lbl_80118938
lbl_80118938:
	.incbin "baserom.dol", 0x115938, 0x190
.global lbl_80118AC8
lbl_80118AC8:
	.incbin "baserom.dol", 0x115AC8, 0x58E88
.global lbl_80171950
lbl_80171950:
	.incbin "baserom.dol", 0x16E950, 0x20
.global lbl_80171970
lbl_80171970:
	.incbin "baserom.dol", 0x16E970, 0x60
.global lbl_801719D0
lbl_801719D0:
	.incbin "baserom.dol", 0x16E9D0, 0x10
.global lbl_801719E0
lbl_801719E0:
	.incbin "baserom.dol", 0x16E9E0, 0xC
.global lbl_801719EC
lbl_801719EC:
	.incbin "baserom.dol", 0x16E9EC, 0xC
.global lbl_801719F8
lbl_801719F8:
	.incbin "baserom.dol", 0x16E9F8, 0x10
.global lbl_80171A08
lbl_80171A08:
	.incbin "baserom.dol", 0x16EA08, 0x9C
.global lbl_80171AA4
lbl_80171AA4:
	.incbin "baserom.dol", 0x16EAA4, 0xC
.global lbl_80171AB0
lbl_80171AB0:
	.incbin "baserom.dol", 0x16EAB0, 0x60
.global lbl_80171B10
lbl_80171B10:
	.incbin "baserom.dol", 0x16EB10, 0x30
.global lbl_80171B40
lbl_80171B40:
	.incbin "baserom.dol", 0x16EB40, 0x20
.global lbl_80171B60
lbl_80171B60:
	.incbin "baserom.dol", 0x16EB60, 0x10
.global lbl_80171B70
lbl_80171B70:
	.incbin "baserom.dol", 0x16EB70, 0x40
.global lbl_80171BB0
lbl_80171BB0:
	.incbin "baserom.dol", 0x16EBB0, 0x88
.global lbl_80171C38
lbl_80171C38:
	.incbin "baserom.dol", 0x16EC38, 0x88
.global lbl_80171CC0
lbl_80171CC0:
	.incbin "baserom.dol", 0x16ECC0, 0x100
.global lbl_80171DC0
lbl_80171DC0:
	.incbin "baserom.dol", 0x16EDC0, 0x18
.global lbl_80171DD8
lbl_80171DD8:
	.incbin "baserom.dol", 0x16EDD8, 0x48
.global lbl_80171E20
lbl_80171E20:
	.incbin "baserom.dol", 0x16EE20, 0x40
.global lbl_80171E60
lbl_80171E60:
	.incbin "baserom.dol", 0x16EE60, 0x100
.global lbl_80171F60
lbl_80171F60:
	.incbin "baserom.dol", 0x16EF60, 0x100
.global lbl_80172060
lbl_80172060:
	.incbin "baserom.dol", 0x16F060, 0x10
.global lbl_80172070
lbl_80172070:
	.incbin "baserom.dol", 0x16F070, 0x108
.global lbl_80172178
lbl_80172178:
	.incbin "baserom.dol", 0x16F178, 0x80
.global lbl_801721F8
lbl_801721F8:
	.incbin "baserom.dol", 0x16F1F8, 0x10
.global lbl_80172208
lbl_80172208:
	.incbin "baserom.dol", 0x16F208, 0x40
.global lbl_80172248
lbl_80172248:
	.incbin "baserom.dol", 0x16F248, 0xB8
.global lbl_80172300
lbl_80172300:
	.incbin "baserom.dol", 0x16F300, 0x10
.global lbl_80172310
lbl_80172310:
	.incbin "baserom.dol", 0x16F310, 0x20
.global lbl_80172330
lbl_80172330:
	.incbin "baserom.dol", 0x16F330, 0x10
.global lbl_80172340
lbl_80172340:
	.incbin "baserom.dol", 0x16F340, 0x14
.global lbl_80172354
lbl_80172354:
	.incbin "baserom.dol", 0x16F354, 0x14
.global lbl_80172368
lbl_80172368:
	.incbin "baserom.dol", 0x16F368, 0x18

.section .data, "wa"  # 0x80172380 - 0x801ED920
.global lbl_80172380
lbl_80172380:
	.incbin "baserom.dol", 0x16F380, 0x40
.global lbl_801723C0
lbl_801723C0:
	.incbin "baserom.dol", 0x16F3C0, 0x20
.global lbl_801723E0
lbl_801723E0:
	.incbin "baserom.dol", 0x16F3E0, 0xCC
.global lbl_801724AC
lbl_801724AC:
	.incbin "baserom.dol", 0x16F4AC, 0xC
.global lbl_801724B8
lbl_801724B8:
	.incbin "baserom.dol", 0x16F4B8, 0x18
.global lbl_801724D0
lbl_801724D0:
	.incbin "baserom.dol", 0x16F4D0, 0x58
.global lbl_80172528
lbl_80172528:
	.incbin "baserom.dol", 0x16F528, 0x13E0
.global lbl_80173908
lbl_80173908:
	.incbin "baserom.dol", 0x170908, 0x354
.global lbl_80173C5C
lbl_80173C5C:
	.incbin "baserom.dol", 0x170C5C, 0x14
.global lbl_80173C70
lbl_80173C70:
	.incbin "baserom.dol", 0x170C70, 0x18
.global lbl_80173C88
lbl_80173C88:
	.incbin "baserom.dol", 0x170C88, 0x40
.global lbl_80173CC8
lbl_80173CC8:
	.incbin "baserom.dol", 0x170CC8, 0x220
.global lbl_80173EE8
lbl_80173EE8:
	.incbin "baserom.dol", 0x170EE8, 0xC
.global lbl_80173EF4
lbl_80173EF4:
	.incbin "baserom.dol", 0x170EF4, 0x68
.global lbl_80173F5C
lbl_80173F5C:
	.incbin "baserom.dol", 0x170F5C, 0x4C
.global lbl_80173FA8
lbl_80173FA8:
	.incbin "baserom.dol", 0x170FA8, 0x28
.global lbl_80173FD0
lbl_80173FD0:
	.incbin "baserom.dol", 0x170FD0, 0x10
.global lbl_80173FE0
lbl_80173FE0:
	.incbin "baserom.dol", 0x170FE0, 0xC8
.global lbl_801740A8
lbl_801740A8:
	.incbin "baserom.dol", 0x1710A8, 0x108
.global lbl_801741B0
lbl_801741B0:
	.incbin "baserom.dol", 0x1711B0, 0x1C
.global lbl_801741CC
lbl_801741CC:
	.incbin "baserom.dol", 0x1711CC, 0xC
.global lbl_801741D8
lbl_801741D8:
	.incbin "baserom.dol", 0x1711D8, 0xC3C
.global lbl_80174E14
lbl_80174E14:
	.incbin "baserom.dol", 0x171E14, 0x24
.global lbl_80174E38
lbl_80174E38:
	.incbin "baserom.dol", 0x171E38, 0x10
.global lbl_80174E48
lbl_80174E48:
	.incbin "baserom.dol", 0x171E48, 0x680
.global lbl_801754C8
lbl_801754C8:
	.incbin "baserom.dol", 0x1724C8, 0x48
.global lbl_80175510
lbl_80175510:
	.incbin "baserom.dol", 0x172510, 0x34
.global lbl_80175544
lbl_80175544:
	.incbin "baserom.dol", 0x172544, 0x24
.global lbl_80175568
lbl_80175568:
	.incbin "baserom.dol", 0x172568, 0x44
.global lbl_801755AC
lbl_801755AC:
	.incbin "baserom.dol", 0x1725AC, 0x4C
.global lbl_801755F8
lbl_801755F8:
	.incbin "baserom.dol", 0x1725F8, 0x1C
.global lbl_80175614
lbl_80175614:
	.incbin "baserom.dol", 0x172614, 0xA8
.global lbl_801756BC
lbl_801756BC:
	.incbin "baserom.dol", 0x1726BC, 0xB34
.global lbl_801761F0
lbl_801761F0:
	.incbin "baserom.dol", 0x1731F0, 0x10
.global lbl_80176200
lbl_80176200:
	.incbin "baserom.dol", 0x173200, 0x12C
.global lbl_8017632C
lbl_8017632C:
	.incbin "baserom.dol", 0x17332C, 0xEE8
.global lbl_80177214
lbl_80177214:
	.incbin "baserom.dol", 0x174214, 0x98
.global lbl_801772AC
lbl_801772AC:
	.incbin "baserom.dol", 0x1742AC, 0xAC
.global lbl_80177358
lbl_80177358:
	.incbin "baserom.dol", 0x174358, 0x134
.global lbl_8017748C
lbl_8017748C:
	.incbin "baserom.dol", 0x17448C, 0x987C
.global lbl_80180D08
lbl_80180D08:
	.incbin "baserom.dol", 0x17DD08, 0x24
.global lbl_80180D2C
lbl_80180D2C:
	.incbin "baserom.dol", 0x17DD2C, 0x24
.global lbl_80180D50
lbl_80180D50:
	.incbin "baserom.dol", 0x17DD50, 0x24
.global lbl_80180D74
lbl_80180D74:
	.incbin "baserom.dol", 0x17DD74, 0x3C
.global lbl_80180DB0
lbl_80180DB0:
	.incbin "baserom.dol", 0x17DDB0, 0x30
.global lbl_80180DE0
lbl_80180DE0:
	.incbin "baserom.dol", 0x17DDE0, 0x2C
.global lbl_80180E0C
lbl_80180E0C:
	.incbin "baserom.dol", 0x17DE0C, 0x108
.global lbl_80180F14
lbl_80180F14:
	.incbin "baserom.dol", 0x17DF14, 0x50
.global lbl_80180F64
lbl_80180F64:
	.incbin "baserom.dol", 0x17DF64, 0x94C
.global lbl_801818B0
lbl_801818B0:
	.incbin "baserom.dol", 0x17E8B0, 0x20
.global lbl_801818D0
lbl_801818D0:
	.incbin "baserom.dol", 0x17E8D0, 0xA0
.global lbl_80181970
lbl_80181970:
	.incbin "baserom.dol", 0x17E970, 0x110
.global lbl_80181A80
lbl_80181A80:
	.incbin "baserom.dol", 0x17EA80, 0x100
.global lbl_80181B80
lbl_80181B80:
	.incbin "baserom.dol", 0x17EB80, 0x40
.global lbl_80181BC0
lbl_80181BC0:
	.incbin "baserom.dol", 0x17EBC0, 0x10
.global lbl_80181BD0
lbl_80181BD0:
	.incbin "baserom.dol", 0x17EBD0, 0xE4
.global lbl_80181CB4
lbl_80181CB4:
	.incbin "baserom.dol", 0x17ECB4, 0x150
.global lbl_80181E04
lbl_80181E04:
	.incbin "baserom.dol", 0x17EE04, 0xB0
.global lbl_80181EB4
lbl_80181EB4:
	.incbin "baserom.dol", 0x17EEB4, 0x24
.global lbl_80181ED8
lbl_80181ED8:
	.incbin "baserom.dol", 0x17EED8, 0x2A48
.global lbl_80184920
lbl_80184920:
	.incbin "baserom.dol", 0x181920, 0x10020
.global lbl_80194940
lbl_80194940:
	.incbin "baserom.dol", 0x191940, 0x18020
.global lbl_801AC960
lbl_801AC960:
	.incbin "baserom.dol", 0x1A9960, 0x60FC
.global lbl_801B2A5C
lbl_801B2A5C:
	.incbin "baserom.dol", 0x1AFA5C, 0x940
.global lbl_801B339C
lbl_801B339C:
	.incbin "baserom.dol", 0x1B039C, 0xB0
.global lbl_801B344C
lbl_801B344C:
	.incbin "baserom.dol", 0x1B044C, 0x1A4
.global lbl_801B35F0
lbl_801B35F0:
	.incbin "baserom.dol", 0x1B05F0, 0x40
.global lbl_801B3630
lbl_801B3630:
	.incbin "baserom.dol", 0x1B0630, 0x40
.global lbl_801B3670
lbl_801B3670:
	.incbin "baserom.dol", 0x1B0670, 0x24
.global lbl_801B3694
lbl_801B3694:
	.incbin "baserom.dol", 0x1B0694, 0x50
.global lbl_801B36E4
lbl_801B36E4:
	.incbin "baserom.dol", 0x1B06E4, 0x50
.global lbl_801B3734
lbl_801B3734:
	.incbin "baserom.dol", 0x1B0734, 0x50
.global lbl_801B3784
lbl_801B3784:
	.incbin "baserom.dol", 0x1B0784, 0x2C
.global lbl_801B37B0
lbl_801B37B0:
	.incbin "baserom.dol", 0x1B07B0, 0x24
.global lbl_801B37D4
lbl_801B37D4:
	.incbin "baserom.dol", 0x1B07D4, 0x2C
.global lbl_801B3800
lbl_801B3800:
	.incbin "baserom.dol", 0x1B0800, 0x28
.global lbl_801B3828
lbl_801B3828:
	.incbin "baserom.dol", 0x1B0828, 0x24
.global lbl_801B384C
lbl_801B384C:
	.incbin "baserom.dol", 0x1B084C, 0xC
.global lbl_801B3858
lbl_801B3858:
	.incbin "baserom.dol", 0x1B0858, 0xC
.global lbl_801B3864
lbl_801B3864:
	.incbin "baserom.dol", 0x1B0864, 0xC
.global lbl_801B3870
lbl_801B3870:
	.incbin "baserom.dol", 0x1B0870, 0xC
.global lbl_801B387C
lbl_801B387C:
	.incbin "baserom.dol", 0x1B087C, 0x18
.global lbl_801B3894
lbl_801B3894:
	.incbin "baserom.dol", 0x1B0894, 0xC
.global lbl_801B38A0
lbl_801B38A0:
	.incbin "baserom.dol", 0x1B08A0, 0xC
.global lbl_801B38AC
lbl_801B38AC:
	.incbin "baserom.dol", 0x1B08AC, 0x28
.global lbl_801B38D4
lbl_801B38D4:
	.incbin "baserom.dol", 0x1B08D4, 0x4C
.global lbl_801B3920
lbl_801B3920:
	.incbin "baserom.dol", 0x1B0920, 0xC
.global lbl_801B392C
lbl_801B392C:
	.incbin "baserom.dol", 0x1B092C, 0xF8
.global lbl_801B3A24
lbl_801B3A24:
	.incbin "baserom.dol", 0x1B0A24, 0x30
.global lbl_801B3A54
lbl_801B3A54:
	.incbin "baserom.dol", 0x1B0A54, 0xC4
.global lbl_801B3B18
lbl_801B3B18:
	.incbin "baserom.dol", 0x1B0B18, 0x395C
.global lbl_801B7474
lbl_801B7474:
	.incbin "baserom.dol", 0x1B4474, 0x2C
.global lbl_801B74A0
lbl_801B74A0:
	.incbin "baserom.dol", 0x1B44A0, 0xDC
.global lbl_801B757C
lbl_801B757C:
	.incbin "baserom.dol", 0x1B457C, 0x7C
.global lbl_801B75F8
lbl_801B75F8:
	.incbin "baserom.dol", 0x1B45F8, 0x28C
.global lbl_801B7884
lbl_801B7884:
	.incbin "baserom.dol", 0x1B4884, 0xC4
.global lbl_801B7948
lbl_801B7948:
	.incbin "baserom.dol", 0x1B4948, 0x30
.global lbl_801B7978
lbl_801B7978:
	.incbin "baserom.dol", 0x1B4978, 0x20
.global lbl_801B7998
lbl_801B7998:
	.incbin "baserom.dol", 0x1B4998, 0xC
.global lbl_801B79A4
lbl_801B79A4:
	.incbin "baserom.dol", 0x1B49A4, 0x10
.global lbl_801B79B4
lbl_801B79B4:
	.incbin "baserom.dol", 0x1B49B4, 0x160
.global lbl_801B7B14
lbl_801B7B14:
	.incbin "baserom.dol", 0x1B4B14, 0x14
.global lbl_801B7B28
lbl_801B7B28:
	.incbin "baserom.dol", 0x1B4B28, 0x50
.global lbl_801B7B78
lbl_801B7B78:
	.incbin "baserom.dol", 0x1B4B78, 0x20
.global lbl_801B7B98
lbl_801B7B98:
	.incbin "baserom.dol", 0x1B4B98, 0x8
.global lbl_801B7BA0
lbl_801B7BA0:
	.incbin "baserom.dol", 0x1B4BA0, 0x8
.global lbl_801B7BA8
lbl_801B7BA8:
	.incbin "baserom.dol", 0x1B4BA8, 0xB4
.global lbl_801B7C5C
lbl_801B7C5C:
	.incbin "baserom.dol", 0x1B4C5C, 0x28
.global lbl_801B7C84
lbl_801B7C84:
	.incbin "baserom.dol", 0x1B4C84, 0x74
.global lbl_801B7CF8
lbl_801B7CF8:
	.incbin "baserom.dol", 0x1B4CF8, 0x1F0
.global lbl_801B7EE8
lbl_801B7EE8:
	.incbin "baserom.dol", 0x1B4EE8, 0xA0
.global lbl_801B7F88
lbl_801B7F88:
	.incbin "baserom.dol", 0x1B4F88, 0x20
.global lbl_801B7FA8
lbl_801B7FA8:
	.incbin "baserom.dol", 0x1B4FA8, 0x700
.global lbl_801B86A8
lbl_801B86A8:
	.incbin "baserom.dol", 0x1B56A8, 0x30
.global lbl_801B86D8
lbl_801B86D8:
	.incbin "baserom.dol", 0x1B56D8, 0xC
.global lbl_801B86E4
lbl_801B86E4:
	.incbin "baserom.dol", 0x1B56E4, 0x14
.global lbl_801B86F8
lbl_801B86F8:
	.incbin "baserom.dol", 0x1B56F8, 0x14
.global lbl_801B870C
lbl_801B870C:
	.incbin "baserom.dol", 0x1B570C, 0x10
.global lbl_801B871C
lbl_801B871C:
	.incbin "baserom.dol", 0x1B571C, 0x78
.global lbl_801B8794
lbl_801B8794:
	.incbin "baserom.dol", 0x1B5794, 0xC
.global lbl_801B87A0
lbl_801B87A0:
	.incbin "baserom.dol", 0x1B57A0, 0xB8
.global lbl_801B8858
lbl_801B8858:
	.incbin "baserom.dol", 0x1B5858, 0x190
.global lbl_801B89E8
lbl_801B89E8:
	.incbin "baserom.dol", 0x1B59E8, 0x450
.global lbl_801B8E38
lbl_801B8E38:
	.incbin "baserom.dol", 0x1B5E38, 0xC8
.global lbl_801B8F00
lbl_801B8F00:
	.incbin "baserom.dol", 0x1B5F00, 0x190
.global lbl_801B9090
lbl_801B9090:
	.incbin "baserom.dol", 0x1B6090, 0xD8
.global lbl_801B9168
lbl_801B9168:
	.incbin "baserom.dol", 0x1B6168, 0x10
.global lbl_801B9178
lbl_801B9178:
	.incbin "baserom.dol", 0x1B6178, 0x46C
.global lbl_801B95E4
lbl_801B95E4:
	.incbin "baserom.dol", 0x1B65E4, 0x74
.global lbl_801B9658
lbl_801B9658:
	.incbin "baserom.dol", 0x1B6658, 0x2C4
.global lbl_801B991C
lbl_801B991C:
	.incbin "baserom.dol", 0x1B691C, 0x20C
.global lbl_801B9B28
lbl_801B9B28:
	.incbin "baserom.dol", 0x1B6B28, 0x20
.global lbl_801B9B48
lbl_801B9B48:
	.incbin "baserom.dol", 0x1B6B48, 0x10
.global lbl_801B9B58
lbl_801B9B58:
	.incbin "baserom.dol", 0x1B6B58, 0x10
.global lbl_801B9B68
lbl_801B9B68:
	.incbin "baserom.dol", 0x1B6B68, 0x38
.global lbl_801B9BA0
lbl_801B9BA0:
	.incbin "baserom.dol", 0x1B6BA0, 0x10
.global lbl_801B9BB0
lbl_801B9BB0:
	.incbin "baserom.dol", 0x1B6BB0, 0x198
.global lbl_801B9D48
lbl_801B9D48:
	.incbin "baserom.dol", 0x1B6D48, 0x30
.global lbl_801B9D78
lbl_801B9D78:
	.incbin "baserom.dol", 0x1B6D78, 0x160
.global lbl_801B9ED8
lbl_801B9ED8:
	.incbin "baserom.dol", 0x1B6ED8, 0x20
.global lbl_801B9EF8
lbl_801B9EF8:
	.incbin "baserom.dol", 0x1B6EF8, 0x6C
.global lbl_801B9F64
lbl_801B9F64:
	.incbin "baserom.dol", 0x1B6F64, 0x4C
.global lbl_801B9FB0
lbl_801B9FB0:
	.incbin "baserom.dol", 0x1B6FB0, 0x18
.global lbl_801B9FC8
lbl_801B9FC8:
	.incbin "baserom.dol", 0x1B6FC8, 0xBC
.global lbl_801BA084
lbl_801BA084:
	.incbin "baserom.dol", 0x1B7084, 0x20
.global lbl_801BA0A4
lbl_801BA0A4:
	.incbin "baserom.dol", 0x1B70A4, 0x54
.global lbl_801BA0F8
lbl_801BA0F8:
	.incbin "baserom.dol", 0x1B70F8, 0x118
.global lbl_801BA210
lbl_801BA210:
	.incbin "baserom.dol", 0x1B7210, 0x130
.global lbl_801BA340
lbl_801BA340:
	.incbin "baserom.dol", 0x1B7340, 0x98
.global lbl_801BA3D8
lbl_801BA3D8:
	.incbin "baserom.dol", 0x1B73D8, 0x3494
.global lbl_801BD86C
lbl_801BD86C:
	.incbin "baserom.dol", 0x1BA86C, 0x1C0
.global lbl_801BDA2C
lbl_801BDA2C:
	.incbin "baserom.dol", 0x1BAA2C, 0x208
.global lbl_801BDC34
lbl_801BDC34:
	.incbin "baserom.dol", 0x1BAC34, 0xC
.global lbl_801BDC40
lbl_801BDC40:
	.incbin "baserom.dol", 0x1BAC40, 0x64
.global lbl_801BDCA4
lbl_801BDCA4:
	.incbin "baserom.dol", 0x1BACA4, 0x1C
.global lbl_801BDCC0
lbl_801BDCC0:
	.incbin "baserom.dol", 0x1BACC0, 0x1C
.global lbl_801BDCDC
lbl_801BDCDC:
	.incbin "baserom.dol", 0x1BACDC, 0x1C
.global lbl_801BDCF8
lbl_801BDCF8:
	.incbin "baserom.dol", 0x1BACF8, 0x1C
.global lbl_801BDD14
lbl_801BDD14:
	.incbin "baserom.dol", 0x1BAD14, 0x1C
.global lbl_801BDD30
lbl_801BDD30:
	.incbin "baserom.dol", 0x1BAD30, 0x170
.global lbl_801BDEA0
lbl_801BDEA0:
	.incbin "baserom.dol", 0x1BAEA0, 0xC0
.global lbl_801BDF60
lbl_801BDF60:
	.incbin "baserom.dol", 0x1BAF60, 0x40
.global lbl_801BDFA0
lbl_801BDFA0:
	.incbin "baserom.dol", 0x1BAFA0, 0xA8
.global lbl_801BE048
lbl_801BE048:
	.incbin "baserom.dol", 0x1BB048, 0xE8
.global lbl_801BE130
lbl_801BE130:
	.incbin "baserom.dol", 0x1BB130, 0x30
.global lbl_801BE160
lbl_801BE160:
	.incbin "baserom.dol", 0x1BB160, 0x30
.global lbl_801BE190
lbl_801BE190:
	.incbin "baserom.dol", 0x1BB190, 0x30
.global lbl_801BE1C0
lbl_801BE1C0:
	.incbin "baserom.dol", 0x1BB1C0, 0x30
.global lbl_801BE1F0
lbl_801BE1F0:
	.incbin "baserom.dol", 0x1BB1F0, 0x1A4
.global lbl_801BE394
lbl_801BE394:
	.incbin "baserom.dol", 0x1BB394, 0x8C
.global lbl_801BE420
lbl_801BE420:
	.incbin "baserom.dol", 0x1BB420, 0x14
.global lbl_801BE434
lbl_801BE434:
	.incbin "baserom.dol", 0x1BB434, 0x14
.global lbl_801BE448
lbl_801BE448:
	.incbin "baserom.dol", 0x1BB448, 0x28
.global lbl_801BE470
lbl_801BE470:
	.incbin "baserom.dol", 0x1BB470, 0x40
.global lbl_801BE4B0
lbl_801BE4B0:
	.incbin "baserom.dol", 0x1BB4B0, 0x2DB4
.global lbl_801C1264
lbl_801C1264:
	.incbin "baserom.dol", 0x1BE264, 0x30
.global lbl_801C1294
lbl_801C1294:
	.incbin "baserom.dol", 0x1BE294, 0x28
.global lbl_801C12BC
lbl_801C12BC:
	.incbin "baserom.dol", 0x1BE2BC, 0x28
.global lbl_801C12E4
lbl_801C12E4:
	.incbin "baserom.dol", 0x1BE2E4, 0x108
.global lbl_801C13EC
lbl_801C13EC:
	.incbin "baserom.dol", 0x1BE3EC, 0x34
.global lbl_801C1420
lbl_801C1420:
	.incbin "baserom.dol", 0x1BE420, 0x5C
.global lbl_801C147C
lbl_801C147C:
	.incbin "baserom.dol", 0x1BE47C, 0x38
.global lbl_801C14B4
lbl_801C14B4:
	.incbin "baserom.dol", 0x1BE4B4, 0x3C
.global lbl_801C14F0
lbl_801C14F0:
	.incbin "baserom.dol", 0x1BE4F0, 0xC
.global lbl_801C14FC
lbl_801C14FC:
	.incbin "baserom.dol", 0x1BE4FC, 0x1C
.global lbl_801C1518
lbl_801C1518:
	.incbin "baserom.dol", 0x1BE518, 0xC
.global lbl_801C1524
lbl_801C1524:
	.incbin "baserom.dol", 0x1BE524, 0xE4
.global lbl_801C1608
lbl_801C1608:
	.incbin "baserom.dol", 0x1BE608, 0x28
.global lbl_801C1630
lbl_801C1630:
	.incbin "baserom.dol", 0x1BE630, 0x40
.global lbl_801C1670
lbl_801C1670:
	.incbin "baserom.dol", 0x1BE670, 0x10
.global lbl_801C1680
lbl_801C1680:
	.incbin "baserom.dol", 0x1BE680, 0xC
.global lbl_801C168C
lbl_801C168C:
	.incbin "baserom.dol", 0x1BE68C, 0x20
.global lbl_801C16AC
lbl_801C16AC:
	.incbin "baserom.dol", 0x1BE6AC, 0x3C
.global lbl_801C16E8
lbl_801C16E8:
	.incbin "baserom.dol", 0x1BE6E8, 0x78
.global lbl_801C1760
lbl_801C1760:
	.incbin "baserom.dol", 0x1BE760, 0x2C
.global lbl_801C178C
lbl_801C178C:
	.incbin "baserom.dol", 0x1BE78C, 0x10
.global lbl_801C179C
lbl_801C179C:
	.incbin "baserom.dol", 0x1BE79C, 0x28
.global lbl_801C17C4
lbl_801C17C4:
	.incbin "baserom.dol", 0x1BE7C4, 0xC
.global lbl_801C17D0
lbl_801C17D0:
	.incbin "baserom.dol", 0x1BE7D0, 0x22C
.global lbl_801C19FC
lbl_801C19FC:
	.incbin "baserom.dol", 0x1BE9FC, 0x1C
.global lbl_801C1A18
lbl_801C1A18:
	.incbin "baserom.dol", 0x1BEA18, 0xC
.global lbl_801C1A24
lbl_801C1A24:
	.incbin "baserom.dol", 0x1BEA24, 0x14
.global lbl_801C1A38
lbl_801C1A38:
	.incbin "baserom.dol", 0x1BEA38, 0x14
.global lbl_801C1A4C
lbl_801C1A4C:
	.incbin "baserom.dol", 0x1BEA4C, 0xC
.global lbl_801C1A58
lbl_801C1A58:
	.incbin "baserom.dol", 0x1BEA58, 0xC
.global lbl_801C1A64
lbl_801C1A64:
	.incbin "baserom.dol", 0x1BEA64, 0x28
.global lbl_801C1A8C
lbl_801C1A8C:
	.incbin "baserom.dol", 0x1BEA8C, 0x14
.global lbl_801C1AA0
lbl_801C1AA0:
	.incbin "baserom.dol", 0x1BEAA0, 0x20
.global lbl_801C1AC0
lbl_801C1AC0:
	.incbin "baserom.dol", 0x1BEAC0, 0x60
.global lbl_801C1B20
lbl_801C1B20:
	.incbin "baserom.dol", 0x1BEB20, 0x5B8
.global lbl_801C20D8
lbl_801C20D8:
	.incbin "baserom.dol", 0x1BF0D8, 0x14
.global lbl_801C20EC
lbl_801C20EC:
	.incbin "baserom.dol", 0x1BF0EC, 0x98
.global lbl_801C2184
lbl_801C2184:
	.incbin "baserom.dol", 0x1BF184, 0x10
.global lbl_801C2194
lbl_801C2194:
	.incbin "baserom.dol", 0x1BF194, 0x10
.global lbl_801C21A4
lbl_801C21A4:
	.incbin "baserom.dol", 0x1BF1A4, 0x10
.global lbl_801C21B4
lbl_801C21B4:
	.incbin "baserom.dol", 0x1BF1B4, 0x10
.global lbl_801C21C4
lbl_801C21C4:
	.incbin "baserom.dol", 0x1BF1C4, 0x80
.global lbl_801C2244
lbl_801C2244:
	.incbin "baserom.dol", 0x1BF244, 0xC
.global lbl_801C2250
lbl_801C2250:
	.incbin "baserom.dol", 0x1BF250, 0x38
.global lbl_801C2288
lbl_801C2288:
	.incbin "baserom.dol", 0x1BF288, 0x44
.global lbl_801C22CC
lbl_801C22CC:
	.incbin "baserom.dol", 0x1BF2CC, 0x4C
.global lbl_801C2318
lbl_801C2318:
	.incbin "baserom.dol", 0x1BF318, 0x3440
.global lbl_801C5758
lbl_801C5758:
	.incbin "baserom.dol", 0x1C2758, 0x60
.global lbl_801C57B8
lbl_801C57B8:
	.incbin "baserom.dol", 0x1C27B8, 0xC
.global lbl_801C57C4
lbl_801C57C4:
	.incbin "baserom.dol", 0x1C27C4, 0x1C
.global lbl_801C57E0
lbl_801C57E0:
	.incbin "baserom.dol", 0x1C27E0, 0xBD0
.global lbl_801C63B0
lbl_801C63B0:
	.incbin "baserom.dol", 0x1C33B0, 0x10
.global lbl_801C63C0
lbl_801C63C0:
	.incbin "baserom.dol", 0x1C33C0, 0x288
.global lbl_801C6648
lbl_801C6648:
	.incbin "baserom.dol", 0x1C3648, 0x200
.global lbl_801C6848
lbl_801C6848:
	.incbin "baserom.dol", 0x1C3848, 0xB4
.global lbl_801C68FC
lbl_801C68FC:
	.incbin "baserom.dol", 0x1C38FC, 0x8
.global lbl_801C6904
lbl_801C6904:
	.incbin "baserom.dol", 0x1C3904, 0x28
.global lbl_801C692C
lbl_801C692C:
	.incbin "baserom.dol", 0x1C392C, 0xEF8
.global lbl_801C7824
lbl_801C7824:
	.incbin "baserom.dol", 0x1C4824, 0x124
.global lbl_801C7948
lbl_801C7948:
	.incbin "baserom.dol", 0x1C4948, 0x70
.global lbl_801C79B8
lbl_801C79B8:
	.incbin "baserom.dol", 0x1C49B8, 0x10
.global lbl_801C79C8
lbl_801C79C8:
	.incbin "baserom.dol", 0x1C49C8, 0x54
.global lbl_801C7A1C
lbl_801C7A1C:
	.incbin "baserom.dol", 0x1C4A1C, 0x24
.global lbl_801C7A40
lbl_801C7A40:
	.incbin "baserom.dol", 0x1C4A40, 0x30
.global lbl_801C7A70
lbl_801C7A70:
	.incbin "baserom.dol", 0x1C4A70, 0x20
.global lbl_801C7A90
lbl_801C7A90:
	.incbin "baserom.dol", 0x1C4A90, 0x3C
.global lbl_801C7ACC
lbl_801C7ACC:
	.incbin "baserom.dol", 0x1C4ACC, 0x10
.global lbl_801C7ADC
lbl_801C7ADC:
	.incbin "baserom.dol", 0x1C4ADC, 0x40
.global lbl_801C7B1C
lbl_801C7B1C:
	.incbin "baserom.dol", 0x1C4B1C, 0x18
.global lbl_801C7B34
lbl_801C7B34:
	.incbin "baserom.dol", 0x1C4B34, 0x58
.global lbl_801C7B8C
lbl_801C7B8C:
	.incbin "baserom.dol", 0x1C4B8C, 0x14C
.global lbl_801C7CD8
lbl_801C7CD8:
	.incbin "baserom.dol", 0x1C4CD8, 0x18
.global lbl_801C7CF0
lbl_801C7CF0:
	.incbin "baserom.dol", 0x1C4CF0, 0x18
.global lbl_801C7D08
lbl_801C7D08:
	.incbin "baserom.dol", 0x1C4D08, 0x20
.global lbl_801C7D28
lbl_801C7D28:
	.incbin "baserom.dol", 0x1C4D28, 0x1C
.global lbl_801C7D44
lbl_801C7D44:
	.incbin "baserom.dol", 0x1C4D44, 0x10
.global lbl_801C7D54
lbl_801C7D54:
	.incbin "baserom.dol", 0x1C4D54, 0xC
.global lbl_801C7D60
lbl_801C7D60:
	.incbin "baserom.dol", 0x1C4D60, 0x50
.global lbl_801C7DB0
lbl_801C7DB0:
	.incbin "baserom.dol", 0x1C4DB0, 0x20
.global lbl_801C7DD0
lbl_801C7DD0:
	.incbin "baserom.dol", 0x1C4DD0, 0x10
.global lbl_801C7DE0
lbl_801C7DE0:
	.incbin "baserom.dol", 0x1C4DE0, 0xC
.global lbl_801C7DEC
lbl_801C7DEC:
	.incbin "baserom.dol", 0x1C4DEC, 0x6C
.global lbl_801C7E58
lbl_801C7E58:
	.incbin "baserom.dol", 0x1C4E58, 0x18
.global lbl_801C7E70
lbl_801C7E70:
	.incbin "baserom.dol", 0x1C4E70, 0x20
.global lbl_801C7E90
lbl_801C7E90:
	.incbin "baserom.dol", 0x1C4E90, 0x28
.global lbl_801C7EB8
lbl_801C7EB8:
	.incbin "baserom.dol", 0x1C4EB8, 0x20
.global lbl_801C7ED8
lbl_801C7ED8:
	.incbin "baserom.dol", 0x1C4ED8, 0xBC30
.global lbl_801D3B08
lbl_801D3B08:
	.incbin "baserom.dol", 0x1D0B08, 0xC8
.global lbl_801D3BD0
lbl_801D3BD0:
	.incbin "baserom.dol", 0x1D0BD0, 0x118
.global lbl_801D3CE8
lbl_801D3CE8:
	.incbin "baserom.dol", 0x1D0CE8, 0x70
.global lbl_801D3D58
lbl_801D3D58:
	.incbin "baserom.dol", 0x1D0D58, 0x20
.global lbl_801D3D78
lbl_801D3D78:
	.incbin "baserom.dol", 0x1D0D78, 0x10
.global lbl_801D3D88
lbl_801D3D88:
	.incbin "baserom.dol", 0x1D0D88, 0x168
.global lbl_801D3EF0
lbl_801D3EF0:
	.incbin "baserom.dol", 0x1D0EF0, 0x20
.global lbl_801D3F10
lbl_801D3F10:
	.incbin "baserom.dol", 0x1D0F10, 0x2C
.global lbl_801D3F3C
lbl_801D3F3C:
	.incbin "baserom.dol", 0x1D0F3C, 0x10
.global lbl_801D3F4C
lbl_801D3F4C:
	.incbin "baserom.dol", 0x1D0F4C, 0x10
.global lbl_801D3F5C
lbl_801D3F5C:
	.incbin "baserom.dol", 0x1D0F5C, 0xF0
.global lbl_801D404C
lbl_801D404C:
	.incbin "baserom.dol", 0x1D104C, 0x23C
.global lbl_801D4288
lbl_801D4288:
	.incbin "baserom.dol", 0x1D1288, 0x1220
.global lbl_801D54A8
lbl_801D54A8:
	.incbin "baserom.dol", 0x1D24A8, 0xC
.global lbl_801D54B4
lbl_801D54B4:
	.incbin "baserom.dol", 0x1D24B4, 0x158
.global lbl_801D560C
lbl_801D560C:
	.incbin "baserom.dol", 0x1D260C, 0xC
.global lbl_801D5618
lbl_801D5618:
	.incbin "baserom.dol", 0x1D2618, 0x18
.global lbl_801D5630
lbl_801D5630:
	.incbin "baserom.dol", 0x1D2630, 0xD4
.global lbl_801D5704
lbl_801D5704:
	.incbin "baserom.dol", 0x1D2704, 0x74
.global lbl_801D5778
lbl_801D5778:
	.incbin "baserom.dol", 0x1D2778, 0x88
.global lbl_801D5800
lbl_801D5800:
	.incbin "baserom.dol", 0x1D2800, 0x54
.global lbl_801D5854
lbl_801D5854:
	.incbin "baserom.dol", 0x1D2854, 0x14
.global lbl_801D5868
lbl_801D5868:
	.incbin "baserom.dol", 0x1D2868, 0x24
.global lbl_801D588C
lbl_801D588C:
	.incbin "baserom.dol", 0x1D288C, 0x1C
.global lbl_801D58A8
lbl_801D58A8:
	.incbin "baserom.dol", 0x1D28A8, 0xB8
.global lbl_801D5960
lbl_801D5960:
	.incbin "baserom.dol", 0x1D2960, 0xC0
.global lbl_801D5A20
lbl_801D5A20:
	.incbin "baserom.dol", 0x1D2A20, 0x1FC
.global lbl_801D5C1C
lbl_801D5C1C:
	.incbin "baserom.dol", 0x1D2C1C, 0x438
.global lbl_801D6054
lbl_801D6054:
	.incbin "baserom.dol", 0x1D3054, 0x190
.global lbl_801D61E4
lbl_801D61E4:
	.incbin "baserom.dol", 0x1D31E4, 0x330
.global lbl_801D6514
lbl_801D6514:
	.incbin "baserom.dol", 0x1D3514, 0xF4
.global lbl_801D6608
lbl_801D6608:
	.incbin "baserom.dol", 0x1D3608, 0x3C
.global lbl_801D6644
lbl_801D6644:
	.incbin "baserom.dol", 0x1D3644, 0x10
.global lbl_801D6654
lbl_801D6654:
	.incbin "baserom.dol", 0x1D3654, 0x10
.global lbl_801D6664
lbl_801D6664:
	.incbin "baserom.dol", 0x1D3664, 0x10
.global lbl_801D6674
lbl_801D6674:
	.incbin "baserom.dol", 0x1D3674, 0x10
.global lbl_801D6684
lbl_801D6684:
	.incbin "baserom.dol", 0x1D3684, 0x20
.global lbl_801D66A4
lbl_801D66A4:
	.incbin "baserom.dol", 0x1D36A4, 0x10
.global lbl_801D66B4
lbl_801D66B4:
	.incbin "baserom.dol", 0x1D36B4, 0x10
.global lbl_801D66C4
lbl_801D66C4:
	.incbin "baserom.dol", 0x1D36C4, 0x10
.global lbl_801D66D4
lbl_801D66D4:
	.incbin "baserom.dol", 0x1D36D4, 0x1C0
.global lbl_801D6894
lbl_801D6894:
	.incbin "baserom.dol", 0x1D3894, 0x1BC
.global lbl_801D6A50
lbl_801D6A50:
	.incbin "baserom.dol", 0x1D3A50, 0x28
.global lbl_801D6A78
lbl_801D6A78:
	.incbin "baserom.dol", 0x1D3A78, 0x34
.global lbl_801D6AAC
lbl_801D6AAC:
	.incbin "baserom.dol", 0x1D3AAC, 0x34
.global lbl_801D6AE0
lbl_801D6AE0:
	.incbin "baserom.dol", 0x1D3AE0, 0x10
.global lbl_801D6AF0
lbl_801D6AF0:
	.incbin "baserom.dol", 0x1D3AF0, 0x28
.global lbl_801D6B18
lbl_801D6B18:
	.incbin "baserom.dol", 0x1D3B18, 0x1C
.global lbl_801D6B34
lbl_801D6B34:
	.incbin "baserom.dol", 0x1D3B34, 0x14
.global lbl_801D6B48
lbl_801D6B48:
	.incbin "baserom.dol", 0x1D3B48, 0x10
.global lbl_801D6B58
lbl_801D6B58:
	.incbin "baserom.dol", 0x1D3B58, 0x118
.global lbl_801D6C70
lbl_801D6C70:
	.incbin "baserom.dol", 0x1D3C70, 0xC0
.global lbl_801D6D30
lbl_801D6D30:
	.incbin "baserom.dol", 0x1D3D30, 0x18
.global lbl_801D6D48
lbl_801D6D48:
	.incbin "baserom.dol", 0x1D3D48, 0x18
.global lbl_801D6D60
lbl_801D6D60:
	.incbin "baserom.dol", 0x1D3D60, 0x60
.global lbl_801D6DC0
lbl_801D6DC0:
	.incbin "baserom.dol", 0x1D3DC0, 0x40
.global lbl_801D6E00
lbl_801D6E00:
	.incbin "baserom.dol", 0x1D3E00, 0x724
.global lbl_801D7524
lbl_801D7524:
	.incbin "baserom.dol", 0x1D4524, 0xE8C
.global lbl_801D83B0
lbl_801D83B0:
	.incbin "baserom.dol", 0x1D53B0, 0x6B94
.global lbl_801DEF44
lbl_801DEF44:
	.incbin "baserom.dol", 0x1DBF44, 0x3B54
.global lbl_801E2A98
lbl_801E2A98:
	.incbin "baserom.dol", 0x1DFA98, 0x3C
.global lbl_801E2AD4
lbl_801E2AD4:
	.incbin "baserom.dol", 0x1DFAD4, 0x54
.global lbl_801E2B28
lbl_801E2B28:
	.incbin "baserom.dol", 0x1DFB28, 0x10
.global lbl_801E2B38
lbl_801E2B38:
	.incbin "baserom.dol", 0x1DFB38, 0x84
.global lbl_801E2BBC
lbl_801E2BBC:
	.incbin "baserom.dol", 0x1DFBBC, 0x30
.global lbl_801E2BEC
lbl_801E2BEC:
	.incbin "baserom.dol", 0x1DFBEC, 0x5F8
.global lbl_801E31E4
lbl_801E31E4:
	.incbin "baserom.dol", 0x1E01E4, 0x10
.global lbl_801E31F4
lbl_801E31F4:
	.incbin "baserom.dol", 0x1E01F4, 0x28
.global lbl_801E321C
lbl_801E321C:
	.incbin "baserom.dol", 0x1E021C, 0x2C
.global lbl_801E3248
lbl_801E3248:
	.incbin "baserom.dol", 0x1E0248, 0x10
.global lbl_801E3258
lbl_801E3258:
	.incbin "baserom.dol", 0x1E0258, 0x29B8
.global lbl_801E5C10
lbl_801E5C10:
	.incbin "baserom.dol", 0x1E2C10, 0x10
.global lbl_801E5C20
lbl_801E5C20:
	.incbin "baserom.dol", 0x1E2C20, 0x80
.global lbl_801E5CA0
lbl_801E5CA0:
	.incbin "baserom.dol", 0x1E2CA0, 0x50
.global lbl_801E5CF0
lbl_801E5CF0:
	.incbin "baserom.dol", 0x1E2CF0, 0x1C0
.global lbl_801E5EB0
lbl_801E5EB0:
	.incbin "baserom.dol", 0x1E2EB0, 0x398
.global lbl_801E6248
lbl_801E6248:
	.incbin "baserom.dol", 0x1E3248, 0x80
.global lbl_801E62C8
lbl_801E62C8:
	.incbin "baserom.dol", 0x1E32C8, 0x230
.global lbl_801E64F8
lbl_801E64F8:
	.incbin "baserom.dol", 0x1E34F8, 0x1B4
.global lbl_801E66AC
lbl_801E66AC:
	.incbin "baserom.dol", 0x1E36AC, 0x24
.global lbl_801E66D0
lbl_801E66D0:
	.incbin "baserom.dol", 0x1E36D0, 0x238
.global lbl_801E6908
lbl_801E6908:
	.incbin "baserom.dol", 0x1E3908, 0x180
.global lbl_801E6A88
lbl_801E6A88:
	.incbin "baserom.dol", 0x1E3A88, 0x990
.global lbl_801E7418
lbl_801E7418:
	.incbin "baserom.dol", 0x1E4418, 0x2C
.global lbl_801E7444
lbl_801E7444:
	.incbin "baserom.dol", 0x1E4444, 0x6C
.global lbl_801E74B0
lbl_801E74B0:
	.incbin "baserom.dol", 0x1E44B0, 0x28
.global lbl_801E74D8
lbl_801E74D8:
	.incbin "baserom.dol", 0x1E44D8, 0x28
.global lbl_801E7500
lbl_801E7500:
	.incbin "baserom.dol", 0x1E4500, 0x18
.global lbl_801E7518
lbl_801E7518:
	.incbin "baserom.dol", 0x1E4518, 0x30
.global lbl_801E7548
lbl_801E7548:
	.incbin "baserom.dol", 0x1E4548, 0x30
.global lbl_801E7578
lbl_801E7578:
	.incbin "baserom.dol", 0x1E4578, 0x18
.global lbl_801E7590
lbl_801E7590:
	.incbin "baserom.dol", 0x1E4590, 0xC8
.global lbl_801E7658
lbl_801E7658:
	.incbin "baserom.dol", 0x1E4658, 0x38
.global lbl_801E7690
lbl_801E7690:
	.incbin "baserom.dol", 0x1E4690, 0x2B8
.global lbl_801E7948
lbl_801E7948:
	.incbin "baserom.dol", 0x1E4948, 0x4C
.global lbl_801E7994
lbl_801E7994:
	.incbin "baserom.dol", 0x1E4994, 0x20
.global lbl_801E79B4
lbl_801E79B4:
	.incbin "baserom.dol", 0x1E49B4, 0x40
.global lbl_801E79F4
lbl_801E79F4:
	.incbin "baserom.dol", 0x1E49F4, 0x34
.global lbl_801E7A28
lbl_801E7A28:
	.incbin "baserom.dol", 0x1E4A28, 0x38
.global lbl_801E7A60
lbl_801E7A60:
	.incbin "baserom.dol", 0x1E4A60, 0x40
.global lbl_801E7AA0
lbl_801E7AA0:
	.incbin "baserom.dol", 0x1E4AA0, 0x70
.global lbl_801E7B10
lbl_801E7B10:
	.incbin "baserom.dol", 0x1E4B10, 0x140
.global lbl_801E7C50
lbl_801E7C50:
	.incbin "baserom.dol", 0x1E4C50, 0x30
.global lbl_801E7C80
lbl_801E7C80:
	.incbin "baserom.dol", 0x1E4C80, 0xC00
.global lbl_801E8880
lbl_801E8880:
	.incbin "baserom.dol", 0x1E5880, 0x68
.global lbl_801E88E8
lbl_801E88E8:
	.incbin "baserom.dol", 0x1E58E8, 0x38
.global lbl_801E8920
lbl_801E8920:
	.incbin "baserom.dol", 0x1E5920, 0x140
.global lbl_801E8A60
lbl_801E8A60:
	.incbin "baserom.dol", 0x1E5A60, 0x20
.global lbl_801E8A80
lbl_801E8A80:
	.incbin "baserom.dol", 0x1E5A80, 0x160
.global lbl_801E8BE0
lbl_801E8BE0:
	.incbin "baserom.dol", 0x1E5BE0, 0x20
.global lbl_801E8C00
lbl_801E8C00:
	.incbin "baserom.dol", 0x1E5C00, 0x20
.global lbl_801E8C20
lbl_801E8C20:
	.incbin "baserom.dol", 0x1E5C20, 0x68
.global lbl_801E8C88
lbl_801E8C88:
	.incbin "baserom.dol", 0x1E5C88, 0x68
.global lbl_801E8CF0
lbl_801E8CF0:
	.incbin "baserom.dol", 0x1E5CF0, 0x68
.global lbl_801E8D58
lbl_801E8D58:
	.incbin "baserom.dol", 0x1E5D58, 0x44
.global lbl_801E8D9C
lbl_801E8D9C:
	.incbin "baserom.dol", 0x1E5D9C, 0x44
.global lbl_801E8DE0
lbl_801E8DE0:
	.incbin "baserom.dol", 0x1E5DE0, 0x44
.global lbl_801E8E24
lbl_801E8E24:
	.incbin "baserom.dol", 0x1E5E24, 0x1C
.global lbl_801E8E40
lbl_801E8E40:
	.incbin "baserom.dol", 0x1E5E40, 0x58
.global lbl_801E8E98
lbl_801E8E98:
	.incbin "baserom.dol", 0x1E5E98, 0x3C
.global lbl_801E8ED4
lbl_801E8ED4:
	.incbin "baserom.dol", 0x1E5ED4, 0x3C
.global lbl_801E8F10
lbl_801E8F10:
	.incbin "baserom.dol", 0x1E5F10, 0x40
.global lbl_801E8F50
lbl_801E8F50:
	.incbin "baserom.dol", 0x1E5F50, 0x20
.global lbl_801E8F70
lbl_801E8F70:
	.incbin "baserom.dol", 0x1E5F70, 0xF4
.global lbl_801E9064
lbl_801E9064:
	.incbin "baserom.dol", 0x1E6064, 0xF4
.global lbl_801E9158
lbl_801E9158:
	.incbin "baserom.dol", 0x1E6158, 0x40
.global lbl_801E9198
lbl_801E9198:
	.incbin "baserom.dol", 0x1E6198, 0x28
.global lbl_801E91C0
lbl_801E91C0:
	.incbin "baserom.dol", 0x1E61C0, 0x20
.global lbl_801E91E0
lbl_801E91E0:
	.incbin "baserom.dol", 0x1E61E0, 0x40
.global lbl_801E9220
lbl_801E9220:
	.incbin "baserom.dol", 0x1E6220, 0x28
.global lbl_801E9248
lbl_801E9248:
	.incbin "baserom.dol", 0x1E6248, 0x2C
.global lbl_801E9274
lbl_801E9274:
	.incbin "baserom.dol", 0x1E6274, 0x34
.global lbl_801E92A8
lbl_801E92A8:
	.incbin "baserom.dol", 0x1E62A8, 0x90
.global lbl_801E9338
lbl_801E9338:
	.incbin "baserom.dol", 0x1E6338, 0x50
.global lbl_801E9388
lbl_801E9388:
	.incbin "baserom.dol", 0x1E6388, 0x280
.global lbl_801E9608
lbl_801E9608:
	.incbin "baserom.dol", 0x1E6608, 0x1C8
.global lbl_801E97D0
lbl_801E97D0:
	.incbin "baserom.dol", 0x1E67D0, 0x200
.global lbl_801E99D0
lbl_801E99D0:
	.incbin "baserom.dol", 0x1E69D0, 0x200
.global lbl_801E9BD0
lbl_801E9BD0:
	.incbin "baserom.dol", 0x1E6BD0, 0x184
.global lbl_801E9D54
lbl_801E9D54:
	.incbin "baserom.dol", 0x1E6D54, 0x400
.global lbl_801EA154
lbl_801EA154:
	.incbin "baserom.dol", 0x1E7154, 0x204
.global lbl_801EA358
lbl_801EA358:
	.incbin "baserom.dol", 0x1E7358, 0x38
.global lbl_801EA390
lbl_801EA390:
	.incbin "baserom.dol", 0x1E7390, 0x228
.global lbl_801EA5B8
lbl_801EA5B8:
	.incbin "baserom.dol", 0x1E75B8, 0x10
.global lbl_801EA5C8
lbl_801EA5C8:
	.incbin "baserom.dol", 0x1E75C8, 0x10
.global lbl_801EA5D8
lbl_801EA5D8:
	.incbin "baserom.dol", 0x1E75D8, 0x28
.global lbl_801EA600
lbl_801EA600:
	.incbin "baserom.dol", 0x1E7600, 0x800
.global lbl_801EAE00
lbl_801EAE00:
	.incbin "baserom.dol", 0x1E7E00, 0x19E0
.global lbl_801EC7E0
lbl_801EC7E0:
	.incbin "baserom.dol", 0x1E97E0, 0x20
.global lbl_801EC800
lbl_801EC800:
	.incbin "baserom.dol", 0x1E9800, 0x800
.global lbl_801ED000
lbl_801ED000:
	.incbin "baserom.dol", 0x1EA000, 0xD8
.global lbl_801ED0D8
lbl_801ED0D8:
	.incbin "baserom.dol", 0x1EA0D8, 0x84
.global lbl_801ED15C
lbl_801ED15C:
	.incbin "baserom.dol", 0x1EA15C, 0x84
.global lbl_801ED1E0
lbl_801ED1E0:
	.incbin "baserom.dol", 0x1EA1E0, 0xD0
.global lbl_801ED2B0
lbl_801ED2B0:
	.incbin "baserom.dol", 0x1EA2B0, 0x48
.global lbl_801ED2F8
lbl_801ED2F8:
	.incbin "baserom.dol", 0x1EA2F8, 0x4
.global lbl_801ED2FC
lbl_801ED2FC:
	.incbin "baserom.dol", 0x1EA2FC, 0x4
.global lbl_801ED300
lbl_801ED300:
	.incbin "baserom.dol", 0x1EA300, 0x10
.global lbl_801ED310
lbl_801ED310:
	.incbin "baserom.dol", 0x1EA310, 0x204
.global lbl_801ED514
lbl_801ED514:
	.incbin "baserom.dol", 0x1EA514, 0x20
.global lbl_801ED534
lbl_801ED534:
	.incbin "baserom.dol", 0x1EA534, 0x2C
.global lbl_801ED560
lbl_801ED560:
	.incbin "baserom.dol", 0x1EA560, 0x248
.global lbl_801ED7A8
lbl_801ED7A8:
	.incbin "baserom.dol", 0x1EA7A8, 0x88
.global lbl_801ED830
lbl_801ED830:
	.incbin "baserom.dol", 0x1EA830, 0x1C
.global lbl_801ED84C
lbl_801ED84C:
	.incbin "baserom.dol", 0x1EA84C, 0x1C
.global lbl_801ED868
lbl_801ED868:
	.incbin "baserom.dol", 0x1EA868, 0xC
.global lbl_801ED874
lbl_801ED874:
	.incbin "baserom.dol", 0x1EA874, 0x10
.global lbl_801ED884
lbl_801ED884:
	.incbin "baserom.dol", 0x1EA884, 0x14
.global lbl_801ED898
lbl_801ED898:
	.incbin "baserom.dol", 0x1EA898, 0x40
.global lbl_801ED8D8
lbl_801ED8D8:
	.incbin "baserom.dol", 0x1EA8D8, 0x20
.global lbl_801ED8F8
lbl_801ED8F8:
	.incbin "baserom.dol", 0x1EA8F8, 0x28

.section .sdata, "wa"  # 0x802F01E0 - 0x802F1AE0
.global lbl_802F01E0
lbl_802F01E0:
	.incbin "baserom.dol", 0x1EA920, 0x8
.global lbl_802F01E8
lbl_802F01E8:
	.incbin "baserom.dol", 0x1EA928, 0x34
.global lbl_802F021C
lbl_802F021C:
	.incbin "baserom.dol", 0x1EA95C, 0x10
.global lbl_802F022C
lbl_802F022C:
	.incbin "baserom.dol", 0x1EA96C, 0x4
.global lbl_802F0230
lbl_802F0230:
	.incbin "baserom.dol", 0x1EA970, 0x4
.global lbl_802F0234
lbl_802F0234:
	.incbin "baserom.dol", 0x1EA974, 0x4
.global lbl_802F0238
lbl_802F0238:
	.incbin "baserom.dol", 0x1EA978, 0x4
.global lbl_802F023C
lbl_802F023C:
	.incbin "baserom.dol", 0x1EA97C, 0x4
.global lbl_802F0240
lbl_802F0240:
	.incbin "baserom.dol", 0x1EA980, 0x4
.global lbl_802F0244
lbl_802F0244:
	.incbin "baserom.dol", 0x1EA984, 0x4
.global lbl_802F0248
lbl_802F0248:
	.incbin "baserom.dol", 0x1EA988, 0x88
.global lbl_802F02D0
lbl_802F02D0:
	.incbin "baserom.dol", 0x1EAA10, 0x4
.global lbl_802F02D4
lbl_802F02D4:
	.incbin "baserom.dol", 0x1EAA14, 0x8
.global lbl_802F02DC
lbl_802F02DC:
	.incbin "baserom.dol", 0x1EAA1C, 0x4
.global lbl_802F02E0
lbl_802F02E0:
	.incbin "baserom.dol", 0x1EAA20, 0x8
.global lbl_802F02E8
lbl_802F02E8:
	.incbin "baserom.dol", 0x1EAA28, 0x4
.global lbl_802F02EC
lbl_802F02EC:
	.incbin "baserom.dol", 0x1EAA2C, 0x4
.global lbl_802F02F0
lbl_802F02F0:
	.incbin "baserom.dol", 0x1EAA30, 0x8
.global lbl_802F02F8
lbl_802F02F8:
	.incbin "baserom.dol", 0x1EAA38, 0x18
.global lbl_802F0310
lbl_802F0310:
	.incbin "baserom.dol", 0x1EAA50, 0xDC
.global lbl_802F03EC
lbl_802F03EC:
	.incbin "baserom.dol", 0x1EAB2C, 0x4
.global lbl_802F03F0
lbl_802F03F0:
	.incbin "baserom.dol", 0x1EAB30, 0x28
.global lbl_802F0418
lbl_802F0418:
	.incbin "baserom.dol", 0x1EAB58, 0x8
.global lbl_802F0420
lbl_802F0420:
	.incbin "baserom.dol", 0x1EAB60, 0x8
.global lbl_802F0428
lbl_802F0428:
	.incbin "baserom.dol", 0x1EAB68, 0x8
.global lbl_802F0430
lbl_802F0430:
	.incbin "baserom.dol", 0x1EAB70, 0x78
.global lbl_802F04A8
lbl_802F04A8:
	.incbin "baserom.dol", 0x1EABE8, 0x4
.global lbl_802F04AC
lbl_802F04AC:
	.incbin "baserom.dol", 0x1EABEC, 0x64
.global lbl_802F0510
lbl_802F0510:
	.incbin "baserom.dol", 0x1EAC50, 0x8
.global lbl_802F0518
lbl_802F0518:
	.incbin "baserom.dol", 0x1EAC58, 0x8
.global lbl_802F0520
lbl_802F0520:
	.incbin "baserom.dol", 0x1EAC60, 0x294
.global lbl_802F07B4
lbl_802F07B4:
	.incbin "baserom.dol", 0x1EAEF4, 0x8
.global lbl_802F07BC
lbl_802F07BC:
	.incbin "baserom.dol", 0x1EAEFC, 0x8
.global lbl_802F07C4
lbl_802F07C4:
	.incbin "baserom.dol", 0x1EAF04, 0x8
.global lbl_802F07CC
lbl_802F07CC:
	.incbin "baserom.dol", 0x1EAF0C, 0x8
.global lbl_802F07D4
lbl_802F07D4:
	.incbin "baserom.dol", 0x1EAF14, 0x8
.global lbl_802F07DC
lbl_802F07DC:
	.incbin "baserom.dol", 0x1EAF1C, 0x40
.global lbl_802F081C
lbl_802F081C:
	.incbin "baserom.dol", 0x1EAF5C, 0x4
.global lbl_802F0820
lbl_802F0820:
	.incbin "baserom.dol", 0x1EAF60, 0x140
.global lbl_802F0960
lbl_802F0960:
	.incbin "baserom.dol", 0x1EB0A0, 0x4
.global lbl_802F0964
lbl_802F0964:
	.incbin "baserom.dol", 0x1EB0A4, 0x4
.global lbl_802F0968
lbl_802F0968:
	.incbin "baserom.dol", 0x1EB0A8, 0x4
.global lbl_802F096C
lbl_802F096C:
	.incbin "baserom.dol", 0x1EB0AC, 0x4
.global lbl_802F0970
lbl_802F0970:
	.incbin "baserom.dol", 0x1EB0B0, 0x4
.global lbl_802F0974
lbl_802F0974:
	.incbin "baserom.dol", 0x1EB0B4, 0x4
.global lbl_802F0978
lbl_802F0978:
	.incbin "baserom.dol", 0x1EB0B8, 0x4
.global lbl_802F097C
lbl_802F097C:
	.incbin "baserom.dol", 0x1EB0BC, 0xC
.global lbl_802F0988
lbl_802F0988:
	.incbin "baserom.dol", 0x1EB0C8, 0x8
.global lbl_802F0990
lbl_802F0990:
	.incbin "baserom.dol", 0x1EB0D0, 0x8
.global lbl_802F0998
lbl_802F0998:
	.incbin "baserom.dol", 0x1EB0D8, 0x4
.global lbl_802F099C
lbl_802F099C:
	.incbin "baserom.dol", 0x1EB0DC, 0x1C
.global lbl_802F09B8
lbl_802F09B8:
	.incbin "baserom.dol", 0x1EB0F8, 0x8
.global lbl_802F09C0
lbl_802F09C0:
	.incbin "baserom.dol", 0x1EB100, 0x8
.global lbl_802F09C8
lbl_802F09C8:
	.incbin "baserom.dol", 0x1EB108, 0x8
.global lbl_802F09D0
lbl_802F09D0:
	.incbin "baserom.dol", 0x1EB110, 0x4
.global lbl_802F09D4
lbl_802F09D4:
	.incbin "baserom.dol", 0x1EB114, 0xC
.global lbl_802F09E0
lbl_802F09E0:
	.incbin "baserom.dol", 0x1EB120, 0x4
.global lbl_802F09E4
lbl_802F09E4:
	.incbin "baserom.dol", 0x1EB124, 0x8
.global lbl_802F09EC
lbl_802F09EC:
	.incbin "baserom.dol", 0x1EB12C, 0x8
.global lbl_802F09F4
lbl_802F09F4:
	.incbin "baserom.dol", 0x1EB134, 0x8
.global lbl_802F09FC
lbl_802F09FC:
	.incbin "baserom.dol", 0x1EB13C, 0x4
.global lbl_802F0A00
lbl_802F0A00:
	.incbin "baserom.dol", 0x1EB140, 0xC8
.global lbl_802F0AC8
lbl_802F0AC8:
	.incbin "baserom.dol", 0x1EB208, 0x4
.global lbl_802F0ACC
lbl_802F0ACC:
	.incbin "baserom.dol", 0x1EB20C, 0x8
.global lbl_802F0AD4
lbl_802F0AD4:
	.incbin "baserom.dol", 0x1EB214, 0x8
.global lbl_802F0ADC
lbl_802F0ADC:
	.incbin "baserom.dol", 0x1EB21C, 0x8
.global lbl_802F0AE4
lbl_802F0AE4:
	.incbin "baserom.dol", 0x1EB224, 0x8
.global lbl_802F0AEC
lbl_802F0AEC:
	.incbin "baserom.dol", 0x1EB22C, 0x14
.global lbl_802F0B00
lbl_802F0B00:
	.incbin "baserom.dol", 0x1EB240, 0x8
.global lbl_802F0B08
lbl_802F0B08:
	.incbin "baserom.dol", 0x1EB248, 0x4
.global lbl_802F0B0C
lbl_802F0B0C:
	.incbin "baserom.dol", 0x1EB24C, 0x4
.global lbl_802F0B10
lbl_802F0B10:
	.incbin "baserom.dol", 0x1EB250, 0x4
.global lbl_802F0B14
lbl_802F0B14:
	.incbin "baserom.dol", 0x1EB254, 0x4
.global lbl_802F0B18
lbl_802F0B18:
	.incbin "baserom.dol", 0x1EB258, 0x8
.global lbl_802F0B20
lbl_802F0B20:
	.incbin "baserom.dol", 0x1EB260, 0x20
.global lbl_802F0B40
lbl_802F0B40:
	.incbin "baserom.dol", 0x1EB280, 0x4
.global lbl_802F0B44
lbl_802F0B44:
	.incbin "baserom.dol", 0x1EB284, 0x46C
.global lbl_802F0FB0
lbl_802F0FB0:
	.incbin "baserom.dol", 0x1EB6F0, 0x4
.global lbl_802F0FB4
lbl_802F0FB4:
	.incbin "baserom.dol", 0x1EB6F4, 0x4
.global lbl_802F0FB8
lbl_802F0FB8:
	.incbin "baserom.dol", 0x1EB6F8, 0x4
.global lbl_802F0FBC
lbl_802F0FBC:
	.incbin "baserom.dol", 0x1EB6FC, 0x4
.global lbl_802F0FC0
lbl_802F0FC0:
	.incbin "baserom.dol", 0x1EB700, 0x4
.global lbl_802F0FC4
lbl_802F0FC4:
	.incbin "baserom.dol", 0x1EB704, 0x4
.global lbl_802F0FC8
lbl_802F0FC8:
	.incbin "baserom.dol", 0x1EB708, 0x4
.global lbl_802F0FCC
lbl_802F0FCC:
	.incbin "baserom.dol", 0x1EB70C, 0x4
.global lbl_802F0FD0
lbl_802F0FD0:
	.incbin "baserom.dol", 0x1EB710, 0x4
.global lbl_802F0FD4
lbl_802F0FD4:
	.incbin "baserom.dol", 0x1EB714, 0x4
.global lbl_802F0FD8
lbl_802F0FD8:
	.incbin "baserom.dol", 0x1EB718, 0x4
.global lbl_802F0FDC
lbl_802F0FDC:
	.incbin "baserom.dol", 0x1EB71C, 0x4
.global lbl_802F0FE0
lbl_802F0FE0:
	.incbin "baserom.dol", 0x1EB720, 0x4
.global lbl_802F0FE4
lbl_802F0FE4:
	.incbin "baserom.dol", 0x1EB724, 0x4
.global lbl_802F0FE8
lbl_802F0FE8:
	.incbin "baserom.dol", 0x1EB728, 0x18
.global lbl_802F1000
lbl_802F1000:
	.incbin "baserom.dol", 0x1EB740, 0x4
.global lbl_802F1004
lbl_802F1004:
	.incbin "baserom.dol", 0x1EB744, 0x4
.global lbl_802F1008
lbl_802F1008:
	.incbin "baserom.dol", 0x1EB748, 0x8
.global lbl_802F1010
lbl_802F1010:
	.incbin "baserom.dol", 0x1EB750, 0x4
.global lbl_802F1014
lbl_802F1014:
	.incbin "baserom.dol", 0x1EB754, 0x8
.global lbl_802F101C
lbl_802F101C:
	.incbin "baserom.dol", 0x1EB75C, 0x8
.global lbl_802F1024
lbl_802F1024:
	.incbin "baserom.dol", 0x1EB764, 0x8
.global lbl_802F102C
lbl_802F102C:
	.incbin "baserom.dol", 0x1EB76C, 0x4
.global lbl_802F1030
lbl_802F1030:
	.incbin "baserom.dol", 0x1EB770, 0x4
.global lbl_802F1034
lbl_802F1034:
	.incbin "baserom.dol", 0x1EB774, 0x4
.global lbl_802F1038
lbl_802F1038:
	.incbin "baserom.dol", 0x1EB778, 0x8
.global lbl_802F1040
lbl_802F1040:
	.incbin "baserom.dol", 0x1EB780, 0x8
.global lbl_802F1048
lbl_802F1048:
	.incbin "baserom.dol", 0x1EB788, 0x8
.global lbl_802F1050
lbl_802F1050:
	.incbin "baserom.dol", 0x1EB790, 0x4
.global lbl_802F1054
lbl_802F1054:
	.incbin "baserom.dol", 0x1EB794, 0x8
.global lbl_802F105C
lbl_802F105C:
	.incbin "baserom.dol", 0x1EB79C, 0x4
.global lbl_802F1060
lbl_802F1060:
	.incbin "baserom.dol", 0x1EB7A0, 0x8
.global lbl_802F1068
lbl_802F1068:
	.incbin "baserom.dol", 0x1EB7A8, 0x8
.global lbl_802F1070
lbl_802F1070:
	.incbin "baserom.dol", 0x1EB7B0, 0x8
.global lbl_802F1078
lbl_802F1078:
	.incbin "baserom.dol", 0x1EB7B8, 0x8
.global lbl_802F1080
lbl_802F1080:
	.incbin "baserom.dol", 0x1EB7C0, 0x4
.global lbl_802F1084
lbl_802F1084:
	.incbin "baserom.dol", 0x1EB7C4, 0x14
.global lbl_802F1098
lbl_802F1098:
	.incbin "baserom.dol", 0x1EB7D8, 0x8
.global lbl_802F10A0
lbl_802F10A0:
	.incbin "baserom.dol", 0x1EB7E0, 0x8
.global lbl_802F10A8
lbl_802F10A8:
	.incbin "baserom.dol", 0x1EB7E8, 0x8
.global lbl_802F10B0
lbl_802F10B0:
	.incbin "baserom.dol", 0x1EB7F0, 0x4
.global lbl_802F10B4
lbl_802F10B4:
	.incbin "baserom.dol", 0x1EB7F4, 0x8
.global lbl_802F10BC
lbl_802F10BC:
	.incbin "baserom.dol", 0x1EB7FC, 0x4
.global lbl_802F10C0
lbl_802F10C0:
	.incbin "baserom.dol", 0x1EB800, 0x4
.global lbl_802F10C4
lbl_802F10C4:
	.incbin "baserom.dol", 0x1EB804, 0x4
.global lbl_802F10C8
lbl_802F10C8:
	.incbin "baserom.dol", 0x1EB808, 0x8
.global lbl_802F10D0
lbl_802F10D0:
	.incbin "baserom.dol", 0x1EB810, 0x8
.global lbl_802F10D8
lbl_802F10D8:
	.incbin "baserom.dol", 0x1EB818, 0x4
.global lbl_802F10DC
lbl_802F10DC:
	.incbin "baserom.dol", 0x1EB81C, 0x4
.global lbl_802F10E0
lbl_802F10E0:
	.incbin "baserom.dol", 0x1EB820, 0x4
.global lbl_802F10E4
lbl_802F10E4:
	.incbin "baserom.dol", 0x1EB824, 0x8
.global lbl_802F10EC
lbl_802F10EC:
	.incbin "baserom.dol", 0x1EB82C, 0x8
.global lbl_802F10F4
lbl_802F10F4:
	.incbin "baserom.dol", 0x1EB834, 0x20
.global lbl_802F1114
lbl_802F1114:
	.incbin "baserom.dol", 0x1EB854, 0x8
.global lbl_802F111C
lbl_802F111C:
	.incbin "baserom.dol", 0x1EB85C, 0x8
.global lbl_802F1124
lbl_802F1124:
	.incbin "baserom.dol", 0x1EB864, 0x8
.global lbl_802F112C
lbl_802F112C:
	.incbin "baserom.dol", 0x1EB86C, 0x8
.global lbl_802F1134
lbl_802F1134:
	.incbin "baserom.dol", 0x1EB874, 0x8
.global lbl_802F113C
lbl_802F113C:
	.incbin "baserom.dol", 0x1EB87C, 0x8
.global lbl_802F1144
lbl_802F1144:
	.incbin "baserom.dol", 0x1EB884, 0x4
.global lbl_802F1148
lbl_802F1148:
	.incbin "baserom.dol", 0x1EB888, 0x4
.global lbl_802F114C
lbl_802F114C:
	.incbin "baserom.dol", 0x1EB88C, 0xC
.global lbl_802F1158
lbl_802F1158:
	.incbin "baserom.dol", 0x1EB898, 0x8
.global lbl_802F1160
lbl_802F1160:
	.incbin "baserom.dol", 0x1EB8A0, 0x74
.global lbl_802F11D4
lbl_802F11D4:
	.incbin "baserom.dol", 0x1EB914, 0x4
.global lbl_802F11D8
lbl_802F11D8:
	.incbin "baserom.dol", 0x1EB918, 0x8
.global lbl_802F11E0
lbl_802F11E0:
	.incbin "baserom.dol", 0x1EB920, 0x78
.global lbl_802F1258
lbl_802F1258:
	.incbin "baserom.dol", 0x1EB998, 0x8
.global lbl_802F1260
lbl_802F1260:
	.incbin "baserom.dol", 0x1EB9A0, 0x4
.global lbl_802F1264
lbl_802F1264:
	.incbin "baserom.dol", 0x1EB9A4, 0x4
.global lbl_802F1268
lbl_802F1268:
	.incbin "baserom.dol", 0x1EB9A8, 0x8
.global lbl_802F1270
lbl_802F1270:
	.incbin "baserom.dol", 0x1EB9B0, 0x4
.global lbl_802F1274
lbl_802F1274:
	.incbin "baserom.dol", 0x1EB9B4, 0x4
.global lbl_802F1278
lbl_802F1278:
	.incbin "baserom.dol", 0x1EB9B8, 0x48
.global lbl_802F12C0
lbl_802F12C0:
	.incbin "baserom.dol", 0x1EBA00, 0x4
.global lbl_802F12C4
lbl_802F12C4:
	.incbin "baserom.dol", 0x1EBA04, 0x8
.global lbl_802F12CC
lbl_802F12CC:
	.incbin "baserom.dol", 0x1EBA0C, 0x8
.global lbl_802F12D4
lbl_802F12D4:
	.incbin "baserom.dol", 0x1EBA14, 0x4
.global lbl_802F12D8
lbl_802F12D8:
	.incbin "baserom.dol", 0x1EBA18, 0x8
.global lbl_802F12E0
lbl_802F12E0:
	.incbin "baserom.dol", 0x1EBA20, 0x8
.global lbl_802F12E8
lbl_802F12E8:
	.incbin "baserom.dol", 0x1EBA28, 0x4
.global lbl_802F12EC
lbl_802F12EC:
	.incbin "baserom.dol", 0x1EBA2C, 0x4
.global lbl_802F12F0
lbl_802F12F0:
	.incbin "baserom.dol", 0x1EBA30, 0x4
.global lbl_802F12F4
lbl_802F12F4:
	.incbin "baserom.dol", 0x1EBA34, 0x60
.global lbl_802F1354
lbl_802F1354:
	.incbin "baserom.dol", 0x1EBA94, 0x4
.global lbl_802F1358
lbl_802F1358:
	.incbin "baserom.dol", 0x1EBA98, 0x8
.global lbl_802F1360
lbl_802F1360:
	.incbin "baserom.dol", 0x1EBAA0, 0x5C
.global lbl_802F13BC
lbl_802F13BC:
	.incbin "baserom.dol", 0x1EBAFC, 0x8
.global lbl_802F13C4
lbl_802F13C4:
	.incbin "baserom.dol", 0x1EBB04, 0xC
.global lbl_802F13D0
lbl_802F13D0:
	.incbin "baserom.dol", 0x1EBB10, 0x8
.global lbl_802F13D8
lbl_802F13D8:
	.incbin "baserom.dol", 0x1EBB18, 0x78
.global lbl_802F1450
lbl_802F1450:
	.incbin "baserom.dol", 0x1EBB90, 0x8
.global lbl_802F1458
lbl_802F1458:
	.incbin "baserom.dol", 0x1EBB98, 0x8
.global lbl_802F1460
lbl_802F1460:
	.incbin "baserom.dol", 0x1EBBA0, 0x8
.global lbl_802F1468
lbl_802F1468:
	.incbin "baserom.dol", 0x1EBBA8, 0x8
.global lbl_802F1470
lbl_802F1470:
	.incbin "baserom.dol", 0x1EBBB0, 0x8
.global lbl_802F1478
lbl_802F1478:
	.incbin "baserom.dol", 0x1EBBB8, 0x8
.global lbl_802F1480
lbl_802F1480:
	.incbin "baserom.dol", 0x1EBBC0, 0x8
.global lbl_802F1488
lbl_802F1488:
	.incbin "baserom.dol", 0x1EBBC8, 0x8
.global lbl_802F1490
lbl_802F1490:
	.incbin "baserom.dol", 0x1EBBD0, 0x8
.global lbl_802F1498
lbl_802F1498:
	.incbin "baserom.dol", 0x1EBBD8, 0x8
.global lbl_802F14A0
lbl_802F14A0:
	.incbin "baserom.dol", 0x1EBBE0, 0x8
.global lbl_802F14A8
lbl_802F14A8:
	.incbin "baserom.dol", 0x1EBBE8, 0x8
.global lbl_802F14B0
lbl_802F14B0:
	.incbin "baserom.dol", 0x1EBBF0, 0x8
.global lbl_802F14B8
lbl_802F14B8:
	.incbin "baserom.dol", 0x1EBBF8, 0x8
.global lbl_802F14C0
lbl_802F14C0:
	.incbin "baserom.dol", 0x1EBC00, 0x8
.global lbl_802F14C8
lbl_802F14C8:
	.incbin "baserom.dol", 0x1EBC08, 0x8
.global lbl_802F14D0
lbl_802F14D0:
	.incbin "baserom.dol", 0x1EBC10, 0x8
.global lbl_802F14D8
lbl_802F14D8:
	.incbin "baserom.dol", 0x1EBC18, 0x8
.global lbl_802F14E0
lbl_802F14E0:
	.incbin "baserom.dol", 0x1EBC20, 0x8
.global lbl_802F14E8
lbl_802F14E8:
	.incbin "baserom.dol", 0x1EBC28, 0x8
.global lbl_802F14F0
lbl_802F14F0:
	.incbin "baserom.dol", 0x1EBC30, 0x8
.global lbl_802F14F8
lbl_802F14F8:
	.incbin "baserom.dol", 0x1EBC38, 0x8
.global lbl_802F1500
lbl_802F1500:
	.incbin "baserom.dol", 0x1EBC40, 0x8
.global lbl_802F1508
lbl_802F1508:
	.incbin "baserom.dol", 0x1EBC48, 0x8
.global lbl_802F1510
lbl_802F1510:
	.incbin "baserom.dol", 0x1EBC50, 0x8
.global lbl_802F1518
lbl_802F1518:
	.incbin "baserom.dol", 0x1EBC58, 0x8
.global lbl_802F1520
lbl_802F1520:
	.incbin "baserom.dol", 0x1EBC60, 0x8
.global lbl_802F1528
lbl_802F1528:
	.incbin "baserom.dol", 0x1EBC68, 0x8
.global lbl_802F1530
lbl_802F1530:
	.incbin "baserom.dol", 0x1EBC70, 0x8
.global lbl_802F1538
lbl_802F1538:
	.incbin "baserom.dol", 0x1EBC78, 0x8
.global lbl_802F1540
lbl_802F1540:
	.incbin "baserom.dol", 0x1EBC80, 0x8
.global lbl_802F1548
lbl_802F1548:
	.incbin "baserom.dol", 0x1EBC88, 0x8
.global lbl_802F1550
lbl_802F1550:
	.incbin "baserom.dol", 0x1EBC90, 0x8
.global lbl_802F1558
lbl_802F1558:
	.incbin "baserom.dol", 0x1EBC98, 0x8
.global lbl_802F1560
lbl_802F1560:
	.incbin "baserom.dol", 0x1EBCA0, 0x8
.global lbl_802F1568
lbl_802F1568:
	.incbin "baserom.dol", 0x1EBCA8, 0x8
.global lbl_802F1570
lbl_802F1570:
	.incbin "baserom.dol", 0x1EBCB0, 0x8
.global lbl_802F1578
lbl_802F1578:
	.incbin "baserom.dol", 0x1EBCB8, 0x8
.global lbl_802F1580
lbl_802F1580:
	.incbin "baserom.dol", 0x1EBCC0, 0x8
.global lbl_802F1588
lbl_802F1588:
	.incbin "baserom.dol", 0x1EBCC8, 0x8
.global lbl_802F1590
lbl_802F1590:
	.incbin "baserom.dol", 0x1EBCD0, 0x8
.global lbl_802F1598
lbl_802F1598:
	.incbin "baserom.dol", 0x1EBCD8, 0x8
.global lbl_802F15A0
lbl_802F15A0:
	.incbin "baserom.dol", 0x1EBCE0, 0x3C
.global lbl_802F15DC
lbl_802F15DC:
	.incbin "baserom.dol", 0x1EBD1C, 0x8
.global lbl_802F15E4
lbl_802F15E4:
	.incbin "baserom.dol", 0x1EBD24, 0x8
.global lbl_802F15EC
lbl_802F15EC:
	.incbin "baserom.dol", 0x1EBD2C, 0x8
.global lbl_802F15F4
lbl_802F15F4:
	.incbin "baserom.dol", 0x1EBD34, 0x8
.global lbl_802F15FC
lbl_802F15FC:
	.incbin "baserom.dol", 0x1EBD3C, 0x8
.global lbl_802F1604
lbl_802F1604:
	.incbin "baserom.dol", 0x1EBD44, 0x8
.global lbl_802F160C
lbl_802F160C:
	.incbin "baserom.dol", 0x1EBD4C, 0x8
.global lbl_802F1614
lbl_802F1614:
	.incbin "baserom.dol", 0x1EBD54, 0x8
.global lbl_802F161C
lbl_802F161C:
	.incbin "baserom.dol", 0x1EBD5C, 0x8
.global lbl_802F1624
lbl_802F1624:
	.incbin "baserom.dol", 0x1EBD64, 0x8
.global lbl_802F162C
lbl_802F162C:
	.incbin "baserom.dol", 0x1EBD6C, 0x8
.global lbl_802F1634
lbl_802F1634:
	.incbin "baserom.dol", 0x1EBD74, 0x8
.global lbl_802F163C
lbl_802F163C:
	.incbin "baserom.dol", 0x1EBD7C, 0x8
.global lbl_802F1644
lbl_802F1644:
	.incbin "baserom.dol", 0x1EBD84, 0x8
.global lbl_802F164C
lbl_802F164C:
	.incbin "baserom.dol", 0x1EBD8C, 0x8
.global lbl_802F1654
lbl_802F1654:
	.incbin "baserom.dol", 0x1EBD94, 0x8
.global lbl_802F165C
lbl_802F165C:
	.incbin "baserom.dol", 0x1EBD9C, 0x8
.global lbl_802F1664
lbl_802F1664:
	.incbin "baserom.dol", 0x1EBDA4, 0x8
.global lbl_802F166C
lbl_802F166C:
	.incbin "baserom.dol", 0x1EBDAC, 0x8
.global lbl_802F1674
lbl_802F1674:
	.incbin "baserom.dol", 0x1EBDB4, 0x8
.global lbl_802F167C
lbl_802F167C:
	.incbin "baserom.dol", 0x1EBDBC, 0x8
.global lbl_802F1684
lbl_802F1684:
	.incbin "baserom.dol", 0x1EBDC4, 0x8
.global lbl_802F168C
lbl_802F168C:
	.incbin "baserom.dol", 0x1EBDCC, 0x4
.global lbl_802F1690
lbl_802F1690:
	.incbin "baserom.dol", 0x1EBDD0, 0x10
.global lbl_802F16A0
lbl_802F16A0:
	.incbin "baserom.dol", 0x1EBDE0, 0x8
.global lbl_802F16A8
lbl_802F16A8:
	.incbin "baserom.dol", 0x1EBDE8, 0x8
.global lbl_802F16B0
lbl_802F16B0:
	.incbin "baserom.dol", 0x1EBDF0, 0x8
.global lbl_802F16B8
lbl_802F16B8:
	.incbin "baserom.dol", 0x1EBDF8, 0x20
.global lbl_802F16D8
lbl_802F16D8:
	.incbin "baserom.dol", 0x1EBE18, 0x4
.global lbl_802F16DC
lbl_802F16DC:
	.incbin "baserom.dol", 0x1EBE1C, 0x4
.global lbl_802F16E0
lbl_802F16E0:
	.incbin "baserom.dol", 0x1EBE20, 0x4
.global lbl_802F16E4
lbl_802F16E4:
	.incbin "baserom.dol", 0x1EBE24, 0x4
.global lbl_802F16E8
lbl_802F16E8:
	.incbin "baserom.dol", 0x1EBE28, 0x4
.global lbl_802F16EC
lbl_802F16EC:
	.incbin "baserom.dol", 0x1EBE2C, 0x8
.global lbl_802F16F4
lbl_802F16F4:
	.incbin "baserom.dol", 0x1EBE34, 0x8
.global lbl_802F16FC
lbl_802F16FC:
	.incbin "baserom.dol", 0x1EBE3C, 0x8
.global lbl_802F1704
lbl_802F1704:
	.incbin "baserom.dol", 0x1EBE44, 0x114
.global lbl_802F1818
lbl_802F1818:
	.incbin "baserom.dol", 0x1EBF58, 0x8
.global lbl_802F1820
lbl_802F1820:
	.incbin "baserom.dol", 0x1EBF60, 0x4
.global lbl_802F1824
lbl_802F1824:
	.incbin "baserom.dol", 0x1EBF64, 0x4
.global lbl_802F1828
lbl_802F1828:
	.incbin "baserom.dol", 0x1EBF68, 0x68
.global lbl_802F1890
lbl_802F1890:
	.incbin "baserom.dol", 0x1EBFD0, 0x8
.global lbl_802F1898
lbl_802F1898:
	.incbin "baserom.dol", 0x1EBFD8, 0x8
.global lbl_802F18A0
lbl_802F18A0:
	.incbin "baserom.dol", 0x1EBFE0, 0x8
.global lbl_802F18A8
lbl_802F18A8:
	.incbin "baserom.dol", 0x1EBFE8, 0x8
.global lbl_802F18B0
lbl_802F18B0:
	.incbin "baserom.dol", 0x1EBFF0, 0x4
.global lbl_802F18B4
lbl_802F18B4:
	.incbin "baserom.dol", 0x1EBFF4, 0x4
.global lbl_802F18B8
lbl_802F18B8:
	.incbin "baserom.dol", 0x1EBFF8, 0x8
.global lbl_802F18C0
lbl_802F18C0:
	.incbin "baserom.dol", 0x1EC000, 0x8
.global lbl_802F18C8
lbl_802F18C8:
	.incbin "baserom.dol", 0x1EC008, 0x8
.global lbl_802F18D0
lbl_802F18D0:
	.incbin "baserom.dol", 0x1EC010, 0x8
.global lbl_802F18D8
lbl_802F18D8:
	.incbin "baserom.dol", 0x1EC018, 0x8
.global lbl_802F18E0
lbl_802F18E0:
	.incbin "baserom.dol", 0x1EC020, 0x8
.global lbl_802F18E8
lbl_802F18E8:
	.incbin "baserom.dol", 0x1EC028, 0x8
.global lbl_802F18F0
lbl_802F18F0:
	.incbin "baserom.dol", 0x1EC030, 0x8
.global lbl_802F18F8
lbl_802F18F8:
	.incbin "baserom.dol", 0x1EC038, 0x30
.global __OSCurrHeap
__OSCurrHeap:
	.incbin "baserom.dol", 0x1EC068, 0x8
.global __OSArenaLo
__OSArenaLo:
	.incbin "baserom.dol", 0x1EC070, 0x8
.global lbl_802F1938
lbl_802F1938:
	.incbin "baserom.dol", 0x1EC078, 0x8
.global lbl_802F1940
lbl_802F1940:
	.incbin "baserom.dol", 0x1EC080, 0x8
.global lbl_802F1948
lbl_802F1948:
	.incbin "baserom.dol", 0x1EC088, 0x8
.global FirstRead
FirstRead:
	.incbin "baserom.dol", 0x1EC090, 0x8
.global lbl_802F1958
lbl_802F1958:
	.incbin "baserom.dol", 0x1EC098, 0x8
.global autoInvalidation
autoInvalidation:
	.incbin "baserom.dol", 0x1EC0A0, 0x8
.global lbl_802F1968
lbl_802F1968:
	.incbin "baserom.dol", 0x1EC0A8, 0x4
.global lbl_802F196C
lbl_802F196C:
	.incbin "baserom.dol", 0x1EC0AC, 0x4
.global lbl_802F1970
lbl_802F1970:
	.incbin "baserom.dol", 0x1EC0B0, 0x8
.global ResettingChan
ResettingChan:
	.incbin "baserom.dol", 0x1EC0B8, 0x4
.global XPatchBits
XPatchBits:
	.incbin "baserom.dol", 0x1EC0BC, 0x4
.global AnalogMode
AnalogMode:
	.incbin "baserom.dol", 0x1EC0C0, 0x4
.global MakeStatus
MakeStatus:
	.incbin "baserom.dol", 0x1EC0C4, 0x4
.global lbl_802F1988
lbl_802F1988:
	.incbin "baserom.dol", 0x1EC0C8, 0x4
.global cmdReadOrigin
cmdReadOrigin:
	.incbin "baserom.dol", 0x1EC0CC, 0x4
.global cmdCalibrate
cmdCalibrate:
	.incbin "baserom.dol", 0x1EC0D0, 0x4
.global lbl_802F1994
lbl_802F1994:
	.incbin "baserom.dol", 0x1EC0D4, 0xC
.global Chan
Chan:
	.incbin "baserom.dol", 0x1EC0E0, 0x8
.global gx
gx:
	.incbin "baserom.dol", 0x1EC0E8, 0x8
.global tbl1
tbl1:
	.incbin "baserom.dol", 0x1EC0F0, 0x4
.global tbl2
tbl2:
	.incbin "baserom.dol", 0x1EC0F4, 0x4
.global tbl3
tbl3:
	.incbin "baserom.dol", 0x1EC0F8, 0x8
.global GXTexMode0Ids
GXTexMode0Ids:
	.incbin "baserom.dol", 0x1EC100, 0x8
.global GXTexMode1Ids
GXTexMode1Ids:
	.incbin "baserom.dol", 0x1EC108, 0x8
.global GXTexImage0Ids
GXTexImage0Ids:
	.incbin "baserom.dol", 0x1EC110, 0x8
.global GXTexImage1Ids
GXTexImage1Ids:
	.incbin "baserom.dol", 0x1EC118, 0x8
.global GXTexImage2Ids
GXTexImage2Ids:
	.incbin "baserom.dol", 0x1EC120, 0x8
.global GXTexImage3Ids
GXTexImage3Ids:
	.incbin "baserom.dol", 0x1EC128, 0x8
.global GXTexTlutIds
GXTexTlutIds:
	.incbin "baserom.dol", 0x1EC130, 0x8
.global GX2HWFiltConv
GX2HWFiltConv:
	.incbin "baserom.dol", 0x1EC138, 0x8
.global CurrAutoSample
CurrAutoSample:
	.incbin "baserom.dol", 0x1EC140, 0x4
.global CurrToken
CurrToken:
	.incbin "baserom.dol", 0x1EC144, 0x4
.global DrawNumFrames
DrawNumFrames:
	.incbin "baserom.dol", 0x1EC148, 0x4
.global DrawFrameW
DrawFrameW:
	.incbin "baserom.dol", 0x1EC14C, 0x4
.global DrawFrameBGColor
DrawFrameBGColor:
	.incbin "baserom.dol", 0x1EC150, 0x4
.global DrawFrameColor
DrawFrameColor:
	.incbin "baserom.dol", 0x1EC154, 0x4
.global DrawFullColor
DrawFullColor:
	.incbin "baserom.dol", 0x1EC158, 0x4
.global DrawGPColor
DrawGPColor:
	.incbin "baserom.dol", 0x1EC15C, 0x4
.global DrawCPUCacheColor
DrawCPUCacheColor:
	.incbin "baserom.dol", 0x1EC160, 0x4
.global DrawConnectColor
DrawConnectColor:
	.incbin "baserom.dol", 0x1EC164, 0x4
.global DrawBWBarColor
DrawBWBarColor:
	.incbin "baserom.dol", 0x1EC168, 0x4
.global DrawIPCBarColor
DrawIPCBarColor:
	.incbin "baserom.dol", 0x1EC16C, 0x4
.global DrawGPUBarColor
DrawGPUBarColor:
	.incbin "baserom.dol", 0x1EC170, 0x4
.global DrawIPCColor
DrawIPCColor:
	.incbin "baserom.dol", 0x1EC174, 0x4
.global DrawCPColor
DrawCPColor:
	.incbin "baserom.dol", 0x1EC178, 0x4
.global DrawTCColor
DrawTCColor:
	.incbin "baserom.dol", 0x1EC17C, 0x4
.global DrawCPURDColor
DrawCPURDColor:
	.incbin "baserom.dol", 0x1EC180, 0x4
.global DrawCPUWRColor
DrawCPUWRColor:
	.incbin "baserom.dol", 0x1EC184, 0x4
.global DrawDSPColor
DrawDSPColor:
	.incbin "baserom.dol", 0x1EC188, 0x4
.global DrawIOColor
DrawIOColor:
	.incbin "baserom.dol", 0x1EC18C, 0x4
.global DrawVIColor
DrawVIColor:
	.incbin "baserom.dol", 0x1EC190, 0x4
.global DrawPEColor
DrawPEColor:
	.incbin "baserom.dol", 0x1EC194, 0x4
.global DrawRFColor
DrawRFColor:
	.incbin "baserom.dol", 0x1EC198, 0x4
.global DrawFIColor
DrawFIColor:
	.incbin "baserom.dol", 0x1EC19C, 0x4
.global DrawGPXFIColor
DrawGPXFIColor:
	.incbin "baserom.dol", 0x1EC1A0, 0x4
.global DrawGPRASIDLEColor
DrawGPRASIDLEColor:
	.incbin "baserom.dol", 0x1EC1A4, 0x4
.global bDrawBWBar
bDrawBWBar:
	.incbin "baserom.dol", 0x1EC1A8, 0x4
.global bDrawCPUBar
bDrawCPUBar:
	.incbin "baserom.dol", 0x1EC1AC, 0x4
.global bDrawXFBars
bDrawXFBars:
	.incbin "baserom.dol", 0x1EC1B0, 0x4
.global bDrawRASBar
bDrawRASBar:
	.incbin "baserom.dol", 0x1EC1B4, 0x4
.global last_rnd
last_rnd:
	.incbin "baserom.dol", 0x1EC1B8, 0x8
.global dspSRCType
dspSRCType:
	.incbin "baserom.dol", 0x1EC1C0, 0x8
.global dspCoefSel
dspCoefSel:
	.incbin "baserom.dol", 0x1EC1C8, 0x8
.global dspSlaveLength
dspSlaveLength:
	.incbin "baserom.dol", 0x1EC1D0, 0x8
.global fragmentID
fragmentID:
	.incbin "baserom.dol", 0x1EC1D8, 0x8
.global _wstringBase0
_wstringBase0:
	.incbin "baserom.dol", 0x1EC1E0, 0x8
.global next
next:
	.incbin "baserom.dol", 0x1EC1E8, 0x8
.global K1
K1:
	.incbin "baserom.dol", 0x1EC1F0, 0x4
.global K2
K2:
	.incbin "baserom.dol", 0x1EC1F4, 0x4
.global lbl_802F1AB8
lbl_802F1AB8:
	.incbin "baserom.dol", 0x1EC1F8, 0x8
.global lbl_802F1AC0
lbl_802F1AC0:
	.incbin "baserom.dol", 0x1EC200, 0x4
.global lbl_802F1AC4
lbl_802F1AC4:
	.incbin "baserom.dol", 0x1EC204, 0x4
.global exi
exi:
	.incbin "baserom.dol", 0x1EC208, 0x8
.global pucEXI2InputPending
pucEXI2InputPending:
	.incbin "baserom.dol", 0x1EC210, 0x8
.global SendCount
SendCount:
	.incbin "baserom.dol", 0x1EC218, 0x8

.section .data7, "wa"  # 0x802F2800 - 0x802F6C80
.global lbl_802F2800
lbl_802F2800:
	.incbin "baserom.dol", 0x1EC220, 0x4
.global lbl_802F2804
lbl_802F2804:
	.incbin "baserom.dol", 0x1EC224, 0x4
.global lbl_802F2808
lbl_802F2808:
	.incbin "baserom.dol", 0x1EC228, 0x4
.global lbl_802F280C
lbl_802F280C:
	.incbin "baserom.dol", 0x1EC22C, 0x4
.global lbl_802F2810
lbl_802F2810:
	.incbin "baserom.dol", 0x1EC230, 0x8
.global lbl_802F2818
lbl_802F2818:
	.incbin "baserom.dol", 0x1EC238, 0x4
.global lbl_802F281C
lbl_802F281C:
	.incbin "baserom.dol", 0x1EC23C, 0x4
.global lbl_802F2820
lbl_802F2820:
	.incbin "baserom.dol", 0x1EC240, 0x4
.global lbl_802F2824
lbl_802F2824:
	.incbin "baserom.dol", 0x1EC244, 0x4
.global lbl_802F2828
lbl_802F2828:
	.incbin "baserom.dol", 0x1EC248, 0x8
.global lbl_802F2830
lbl_802F2830:
	.incbin "baserom.dol", 0x1EC250, 0x4
.global lbl_802F2834
lbl_802F2834:
	.incbin "baserom.dol", 0x1EC254, 0x4
.global lbl_802F2838
lbl_802F2838:
	.incbin "baserom.dol", 0x1EC258, 0x4
.global lbl_802F283C
lbl_802F283C:
	.incbin "baserom.dol", 0x1EC25C, 0x4
.global lbl_802F2840
lbl_802F2840:
	.incbin "baserom.dol", 0x1EC260, 0x8
.global lbl_802F2848
lbl_802F2848:
	.incbin "baserom.dol", 0x1EC268, 0x4
.global lbl_802F284C
lbl_802F284C:
	.incbin "baserom.dol", 0x1EC26C, 0x4
.global lbl_802F2850
lbl_802F2850:
	.incbin "baserom.dol", 0x1EC270, 0x8
.global lbl_802F2858
lbl_802F2858:
	.incbin "baserom.dol", 0x1EC278, 0x8
.global lbl_802F2860
lbl_802F2860:
	.incbin "baserom.dol", 0x1EC280, 0x4
.global lbl_802F2864
lbl_802F2864:
	.incbin "baserom.dol", 0x1EC284, 0x4
.global lbl_802F2868
lbl_802F2868:
	.incbin "baserom.dol", 0x1EC288, 0x4
.global lbl_802F286C
lbl_802F286C:
	.incbin "baserom.dol", 0x1EC28C, 0x4
.global lbl_802F2870
lbl_802F2870:
	.incbin "baserom.dol", 0x1EC290, 0x8
.global lbl_802F2878
lbl_802F2878:
	.incbin "baserom.dol", 0x1EC298, 0x8
.global lbl_802F2880
lbl_802F2880:
	.incbin "baserom.dol", 0x1EC2A0, 0x4
.global lbl_802F2884
lbl_802F2884:
	.incbin "baserom.dol", 0x1EC2A4, 0x4
.global lbl_802F2888
lbl_802F2888:
	.incbin "baserom.dol", 0x1EC2A8, 0x8
.global lbl_802F2890
lbl_802F2890:
	.incbin "baserom.dol", 0x1EC2B0, 0x8
.global lbl_802F2898
lbl_802F2898:
	.incbin "baserom.dol", 0x1EC2B8, 0x4
.global lbl_802F289C
lbl_802F289C:
	.incbin "baserom.dol", 0x1EC2BC, 0x4
.global lbl_802F28A0
lbl_802F28A0:
	.incbin "baserom.dol", 0x1EC2C0, 0x4
.global lbl_802F28A4
lbl_802F28A4:
	.incbin "baserom.dol", 0x1EC2C4, 0x4
.global lbl_802F28A8
lbl_802F28A8:
	.incbin "baserom.dol", 0x1EC2C8, 0x8
.global lbl_802F28B0
lbl_802F28B0:
	.incbin "baserom.dol", 0x1EC2D0, 0x8
.global lbl_802F28B8
lbl_802F28B8:
	.incbin "baserom.dol", 0x1EC2D8, 0x8
.global lbl_802F28C0
lbl_802F28C0:
	.incbin "baserom.dol", 0x1EC2E0, 0x8
.global lbl_802F28C8
lbl_802F28C8:
	.incbin "baserom.dol", 0x1EC2E8, 0x4
.global lbl_802F28CC
lbl_802F28CC:
	.incbin "baserom.dol", 0x1EC2EC, 0x4
.global lbl_802F28D0
lbl_802F28D0:
	.incbin "baserom.dol", 0x1EC2F0, 0x4
.global lbl_802F28D4
lbl_802F28D4:
	.incbin "baserom.dol", 0x1EC2F4, 0x4
.global lbl_802F28D8
lbl_802F28D8:
	.incbin "baserom.dol", 0x1EC2F8, 0x8
.global lbl_802F28E0
lbl_802F28E0:
	.incbin "baserom.dol", 0x1EC300, 0x4
.global lbl_802F28E4
lbl_802F28E4:
	.incbin "baserom.dol", 0x1EC304, 0x4
.global lbl_802F28E8
lbl_802F28E8:
	.incbin "baserom.dol", 0x1EC308, 0x4
.global lbl_802F28EC
lbl_802F28EC:
	.incbin "baserom.dol", 0x1EC30C, 0x4
.global lbl_802F28F0
lbl_802F28F0:
	.incbin "baserom.dol", 0x1EC310, 0x4
.global lbl_802F28F4
lbl_802F28F4:
	.incbin "baserom.dol", 0x1EC314, 0x4
.global lbl_802F28F8
lbl_802F28F8:
	.incbin "baserom.dol", 0x1EC318, 0x4
.global lbl_802F28FC
lbl_802F28FC:
	.incbin "baserom.dol", 0x1EC31C, 0x4
.global lbl_802F2900
lbl_802F2900:
	.incbin "baserom.dol", 0x1EC320, 0x8
.global lbl_802F2908
lbl_802F2908:
	.incbin "baserom.dol", 0x1EC328, 0x8
.global lbl_802F2910
lbl_802F2910:
	.incbin "baserom.dol", 0x1EC330, 0x8
.global lbl_802F2918
lbl_802F2918:
	.incbin "baserom.dol", 0x1EC338, 0x8
.global lbl_802F2920
lbl_802F2920:
	.incbin "baserom.dol", 0x1EC340, 0x8
.global lbl_802F2928
lbl_802F2928:
	.incbin "baserom.dol", 0x1EC348, 0x8
.global lbl_802F2930
lbl_802F2930:
	.incbin "baserom.dol", 0x1EC350, 0x8
.global lbl_802F2938
lbl_802F2938:
	.incbin "baserom.dol", 0x1EC358, 0x8
.global lbl_802F2940
lbl_802F2940:
	.incbin "baserom.dol", 0x1EC360, 0x8
.global lbl_802F2948
lbl_802F2948:
	.incbin "baserom.dol", 0x1EC368, 0x4
.global lbl_802F294C
lbl_802F294C:
	.incbin "baserom.dol", 0x1EC36C, 0x4
.global lbl_802F2950
lbl_802F2950:
	.incbin "baserom.dol", 0x1EC370, 0x8
.global lbl_802F2958
lbl_802F2958:
	.incbin "baserom.dol", 0x1EC378, 0x8
.global lbl_802F2960
lbl_802F2960:
	.incbin "baserom.dol", 0x1EC380, 0x4
.global lbl_802F2964
lbl_802F2964:
	.incbin "baserom.dol", 0x1EC384, 0x4
.global lbl_802F2968
lbl_802F2968:
	.incbin "baserom.dol", 0x1EC388, 0x4
.global lbl_802F296C
lbl_802F296C:
	.incbin "baserom.dol", 0x1EC38C, 0x4
.global lbl_802F2970
lbl_802F2970:
	.incbin "baserom.dol", 0x1EC390, 0x8
.global lbl_802F2978
lbl_802F2978:
	.incbin "baserom.dol", 0x1EC398, 0x4
.global lbl_802F297C
lbl_802F297C:
	.incbin "baserom.dol", 0x1EC39C, 0x4
.global lbl_802F2980
lbl_802F2980:
	.incbin "baserom.dol", 0x1EC3A0, 0x4
.global lbl_802F2984
lbl_802F2984:
	.incbin "baserom.dol", 0x1EC3A4, 0x4
.global lbl_802F2988
lbl_802F2988:
	.incbin "baserom.dol", 0x1EC3A8, 0x8
.global lbl_802F2990
lbl_802F2990:
	.incbin "baserom.dol", 0x1EC3B0, 0x8
.global lbl_802F2998
lbl_802F2998:
	.incbin "baserom.dol", 0x1EC3B8, 0x8
.global lbl_802F29A0
lbl_802F29A0:
	.incbin "baserom.dol", 0x1EC3C0, 0x8
.global lbl_802F29A8
lbl_802F29A8:
	.incbin "baserom.dol", 0x1EC3C8, 0x8
.global lbl_802F29B0
lbl_802F29B0:
	.incbin "baserom.dol", 0x1EC3D0, 0x8
.global lbl_802F29B8
lbl_802F29B8:
	.incbin "baserom.dol", 0x1EC3D8, 0x8
.global lbl_802F29C0
lbl_802F29C0:
	.incbin "baserom.dol", 0x1EC3E0, 0x8
.global lbl_802F29C8
lbl_802F29C8:
	.incbin "baserom.dol", 0x1EC3E8, 0x4
.global lbl_802F29CC
lbl_802F29CC:
	.incbin "baserom.dol", 0x1EC3EC, 0x4
.global lbl_802F29D0
lbl_802F29D0:
	.incbin "baserom.dol", 0x1EC3F0, 0x8
.global lbl_802F29D8
lbl_802F29D8:
	.incbin "baserom.dol", 0x1EC3F8, 0x8
.global lbl_802F29E0
lbl_802F29E0:
	.incbin "baserom.dol", 0x1EC400, 0x8
.global lbl_802F29E8
lbl_802F29E8:
	.incbin "baserom.dol", 0x1EC408, 0x8
.global lbl_802F29F0
lbl_802F29F0:
	.incbin "baserom.dol", 0x1EC410, 0x4
.global lbl_802F29F4
lbl_802F29F4:
	.incbin "baserom.dol", 0x1EC414, 0x4
.global lbl_802F29F8
lbl_802F29F8:
	.incbin "baserom.dol", 0x1EC418, 0x4
.global lbl_802F29FC
lbl_802F29FC:
	.incbin "baserom.dol", 0x1EC41C, 0x4
.global lbl_802F2A00
lbl_802F2A00:
	.incbin "baserom.dol", 0x1EC420, 0x4
.global lbl_802F2A04
lbl_802F2A04:
	.incbin "baserom.dol", 0x1EC424, 0x4
.global lbl_802F2A08
lbl_802F2A08:
	.incbin "baserom.dol", 0x1EC428, 0x4
.global lbl_802F2A0C
lbl_802F2A0C:
	.incbin "baserom.dol", 0x1EC42C, 0x4
.global lbl_802F2A10
lbl_802F2A10:
	.incbin "baserom.dol", 0x1EC430, 0x4
.global lbl_802F2A14
lbl_802F2A14:
	.incbin "baserom.dol", 0x1EC434, 0x4
.global lbl_802F2A18
lbl_802F2A18:
	.incbin "baserom.dol", 0x1EC438, 0x4
.global lbl_802F2A1C
lbl_802F2A1C:
	.incbin "baserom.dol", 0x1EC43C, 0x4
.global lbl_802F2A20
lbl_802F2A20:
	.incbin "baserom.dol", 0x1EC440, 0x4
.global lbl_802F2A24
lbl_802F2A24:
	.incbin "baserom.dol", 0x1EC444, 0x4
.global lbl_802F2A28
lbl_802F2A28:
	.incbin "baserom.dol", 0x1EC448, 0x4
.global lbl_802F2A2C
lbl_802F2A2C:
	.incbin "baserom.dol", 0x1EC44C, 0x4
.global lbl_802F2A30
lbl_802F2A30:
	.incbin "baserom.dol", 0x1EC450, 0x4
.global lbl_802F2A34
lbl_802F2A34:
	.incbin "baserom.dol", 0x1EC454, 0x4
.global lbl_802F2A38
lbl_802F2A38:
	.incbin "baserom.dol", 0x1EC458, 0x4
.global lbl_802F2A3C
lbl_802F2A3C:
	.incbin "baserom.dol", 0x1EC45C, 0x4
.global lbl_802F2A40
lbl_802F2A40:
	.incbin "baserom.dol", 0x1EC460, 0x8
.global lbl_802F2A48
lbl_802F2A48:
	.incbin "baserom.dol", 0x1EC468, 0x8
.global lbl_802F2A50
lbl_802F2A50:
	.incbin "baserom.dol", 0x1EC470, 0x8
.global lbl_802F2A58
lbl_802F2A58:
	.incbin "baserom.dol", 0x1EC478, 0x4
.global lbl_802F2A5C
lbl_802F2A5C:
	.incbin "baserom.dol", 0x1EC47C, 0x4
.global lbl_802F2A60
lbl_802F2A60:
	.incbin "baserom.dol", 0x1EC480, 0x4
.global lbl_802F2A64
lbl_802F2A64:
	.incbin "baserom.dol", 0x1EC484, 0x4
.global lbl_802F2A68
lbl_802F2A68:
	.incbin "baserom.dol", 0x1EC488, 0x8
.global lbl_802F2A70
lbl_802F2A70:
	.incbin "baserom.dol", 0x1EC490, 0x4
.global lbl_802F2A74
lbl_802F2A74:
	.incbin "baserom.dol", 0x1EC494, 0x4
.global lbl_802F2A78
lbl_802F2A78:
	.incbin "baserom.dol", 0x1EC498, 0x4
.global lbl_802F2A7C
lbl_802F2A7C:
	.incbin "baserom.dol", 0x1EC49C, 0x4
.global lbl_802F2A80
lbl_802F2A80:
	.incbin "baserom.dol", 0x1EC4A0, 0x8
.global lbl_802F2A88
lbl_802F2A88:
	.incbin "baserom.dol", 0x1EC4A8, 0x8
.global lbl_802F2A90
lbl_802F2A90:
	.incbin "baserom.dol", 0x1EC4B0, 0x8
.global lbl_802F2A98
lbl_802F2A98:
	.incbin "baserom.dol", 0x1EC4B8, 0x8
.global lbl_802F2AA0
lbl_802F2AA0:
	.incbin "baserom.dol", 0x1EC4C0, 0x8
.global lbl_802F2AA8
lbl_802F2AA8:
	.incbin "baserom.dol", 0x1EC4C8, 0x8
.global lbl_802F2AB0
lbl_802F2AB0:
	.incbin "baserom.dol", 0x1EC4D0, 0x8
.global lbl_802F2AB8
lbl_802F2AB8:
	.incbin "baserom.dol", 0x1EC4D8, 0x8
.global lbl_802F2AC0
lbl_802F2AC0:
	.incbin "baserom.dol", 0x1EC4E0, 0x8
.global lbl_802F2AC8
lbl_802F2AC8:
	.incbin "baserom.dol", 0x1EC4E8, 0x8
.global lbl_802F2AD0
lbl_802F2AD0:
	.incbin "baserom.dol", 0x1EC4F0, 0x8
.global lbl_802F2AD8
lbl_802F2AD8:
	.incbin "baserom.dol", 0x1EC4F8, 0x8
.global lbl_802F2AE0
lbl_802F2AE0:
	.incbin "baserom.dol", 0x1EC500, 0x8
.global lbl_802F2AE8
lbl_802F2AE8:
	.incbin "baserom.dol", 0x1EC508, 0x8
.global lbl_802F2AF0
lbl_802F2AF0:
	.incbin "baserom.dol", 0x1EC510, 0x8
.global lbl_802F2AF8
lbl_802F2AF8:
	.incbin "baserom.dol", 0x1EC518, 0x8
.global lbl_802F2B00
lbl_802F2B00:
	.incbin "baserom.dol", 0x1EC520, 0x8
.global lbl_802F2B08
lbl_802F2B08:
	.incbin "baserom.dol", 0x1EC528, 0x8
.global lbl_802F2B10
lbl_802F2B10:
	.incbin "baserom.dol", 0x1EC530, 0x8
.global lbl_802F2B18
lbl_802F2B18:
	.incbin "baserom.dol", 0x1EC538, 0x8
.global lbl_802F2B20
lbl_802F2B20:
	.incbin "baserom.dol", 0x1EC540, 0x4
.global lbl_802F2B24
lbl_802F2B24:
	.incbin "baserom.dol", 0x1EC544, 0x4
.global lbl_802F2B28
lbl_802F2B28:
	.incbin "baserom.dol", 0x1EC548, 0x4
.global lbl_802F2B2C
lbl_802F2B2C:
	.incbin "baserom.dol", 0x1EC54C, 0x4
.global lbl_802F2B30
lbl_802F2B30:
	.incbin "baserom.dol", 0x1EC550, 0x4
.global lbl_802F2B34
lbl_802F2B34:
	.incbin "baserom.dol", 0x1EC554, 0x4
.global lbl_802F2B38
lbl_802F2B38:
	.incbin "baserom.dol", 0x1EC558, 0x4
.global lbl_802F2B3C
lbl_802F2B3C:
	.incbin "baserom.dol", 0x1EC55C, 0x4
.global lbl_802F2B40
lbl_802F2B40:
	.incbin "baserom.dol", 0x1EC560, 0x4
.global lbl_802F2B44
lbl_802F2B44:
	.incbin "baserom.dol", 0x1EC564, 0x4
.global lbl_802F2B48
lbl_802F2B48:
	.incbin "baserom.dol", 0x1EC568, 0x4
.global lbl_802F2B4C
lbl_802F2B4C:
	.incbin "baserom.dol", 0x1EC56C, 0x4
.global lbl_802F2B50
lbl_802F2B50:
	.incbin "baserom.dol", 0x1EC570, 0x4
.global lbl_802F2B54
lbl_802F2B54:
	.incbin "baserom.dol", 0x1EC574, 0x4
.global lbl_802F2B58
lbl_802F2B58:
	.incbin "baserom.dol", 0x1EC578, 0x4
.global lbl_802F2B5C
lbl_802F2B5C:
	.incbin "baserom.dol", 0x1EC57C, 0x4
.global lbl_802F2B60
lbl_802F2B60:
	.incbin "baserom.dol", 0x1EC580, 0x8
.global lbl_802F2B68
lbl_802F2B68:
	.incbin "baserom.dol", 0x1EC588, 0x8
.global lbl_802F2B70
lbl_802F2B70:
	.incbin "baserom.dol", 0x1EC590, 0x8
.global lbl_802F2B78
lbl_802F2B78:
	.incbin "baserom.dol", 0x1EC598, 0x8
.global lbl_802F2B80
lbl_802F2B80:
	.incbin "baserom.dol", 0x1EC5A0, 0x8
.global lbl_802F2B88
lbl_802F2B88:
	.incbin "baserom.dol", 0x1EC5A8, 0x8
.global lbl_802F2B90
lbl_802F2B90:
	.incbin "baserom.dol", 0x1EC5B0, 0x8
.global lbl_802F2B98
lbl_802F2B98:
	.incbin "baserom.dol", 0x1EC5B8, 0x8
.global lbl_802F2BA0
lbl_802F2BA0:
	.incbin "baserom.dol", 0x1EC5C0, 0x4
.global lbl_802F2BA4
lbl_802F2BA4:
	.incbin "baserom.dol", 0x1EC5C4, 0x4
.global lbl_802F2BA8
lbl_802F2BA8:
	.incbin "baserom.dol", 0x1EC5C8, 0x8
.global lbl_802F2BB0
lbl_802F2BB0:
	.incbin "baserom.dol", 0x1EC5D0, 0x8
.global lbl_802F2BB8
lbl_802F2BB8:
	.incbin "baserom.dol", 0x1EC5D8, 0x8
.global lbl_802F2BC0
lbl_802F2BC0:
	.incbin "baserom.dol", 0x1EC5E0, 0x8
.global lbl_802F2BC8
lbl_802F2BC8:
	.incbin "baserom.dol", 0x1EC5E8, 0x4
.global lbl_802F2BCC
lbl_802F2BCC:
	.incbin "baserom.dol", 0x1EC5EC, 0x4
.global lbl_802F2BD0
lbl_802F2BD0:
	.incbin "baserom.dol", 0x1EC5F0, 0x8
.global lbl_802F2BD8
lbl_802F2BD8:
	.incbin "baserom.dol", 0x1EC5F8, 0x8
.global lbl_802F2BE0
lbl_802F2BE0:
	.incbin "baserom.dol", 0x1EC600, 0x8
.global lbl_802F2BE8
lbl_802F2BE8:
	.incbin "baserom.dol", 0x1EC608, 0x8
.global lbl_802F2BF0
lbl_802F2BF0:
	.incbin "baserom.dol", 0x1EC610, 0x8
.global lbl_802F2BF8
lbl_802F2BF8:
	.incbin "baserom.dol", 0x1EC618, 0x8
.global lbl_802F2C00
lbl_802F2C00:
	.incbin "baserom.dol", 0x1EC620, 0x8
.global lbl_802F2C08
lbl_802F2C08:
	.incbin "baserom.dol", 0x1EC628, 0x4
.global lbl_802F2C0C
lbl_802F2C0C:
	.incbin "baserom.dol", 0x1EC62C, 0x4
.global lbl_802F2C10
lbl_802F2C10:
	.incbin "baserom.dol", 0x1EC630, 0x8
.global lbl_802F2C18
lbl_802F2C18:
	.incbin "baserom.dol", 0x1EC638, 0x4
.global lbl_802F2C1C
lbl_802F2C1C:
	.incbin "baserom.dol", 0x1EC63C, 0x4
.global lbl_802F2C20
lbl_802F2C20:
	.incbin "baserom.dol", 0x1EC640, 0x8
.global lbl_802F2C28
lbl_802F2C28:
	.incbin "baserom.dol", 0x1EC648, 0x8
.global lbl_802F2C30
lbl_802F2C30:
	.incbin "baserom.dol", 0x1EC650, 0x8
.global lbl_802F2C38
lbl_802F2C38:
	.incbin "baserom.dol", 0x1EC658, 0x8
.global lbl_802F2C40
lbl_802F2C40:
	.incbin "baserom.dol", 0x1EC660, 0x8
.global lbl_802F2C48
lbl_802F2C48:
	.incbin "baserom.dol", 0x1EC668, 0x8
.global lbl_802F2C50
lbl_802F2C50:
	.incbin "baserom.dol", 0x1EC670, 0x4
.global lbl_802F2C54
lbl_802F2C54:
	.incbin "baserom.dol", 0x1EC674, 0x4
.global lbl_802F2C58
lbl_802F2C58:
	.incbin "baserom.dol", 0x1EC678, 0x8
.global lbl_802F2C60
lbl_802F2C60:
	.incbin "baserom.dol", 0x1EC680, 0x8
.global lbl_802F2C68
lbl_802F2C68:
	.incbin "baserom.dol", 0x1EC688, 0x8
.global lbl_802F2C70
lbl_802F2C70:
	.incbin "baserom.dol", 0x1EC690, 0x4
.global lbl_802F2C74
lbl_802F2C74:
	.incbin "baserom.dol", 0x1EC694, 0x4
.global lbl_802F2C78
lbl_802F2C78:
	.incbin "baserom.dol", 0x1EC698, 0x4
.global lbl_802F2C7C
lbl_802F2C7C:
	.incbin "baserom.dol", 0x1EC69C, 0x4
.global lbl_802F2C80
lbl_802F2C80:
	.incbin "baserom.dol", 0x1EC6A0, 0x8
.global lbl_802F2C88
lbl_802F2C88:
	.incbin "baserom.dol", 0x1EC6A8, 0x8
.global lbl_802F2C90
lbl_802F2C90:
	.incbin "baserom.dol", 0x1EC6B0, 0x4
.global lbl_802F2C94
lbl_802F2C94:
	.incbin "baserom.dol", 0x1EC6B4, 0x4
.global lbl_802F2C98
lbl_802F2C98:
	.incbin "baserom.dol", 0x1EC6B8, 0x4
.global lbl_802F2C9C
lbl_802F2C9C:
	.incbin "baserom.dol", 0x1EC6BC, 0x4
.global lbl_802F2CA0
lbl_802F2CA0:
	.incbin "baserom.dol", 0x1EC6C0, 0x4
.global lbl_802F2CA4
lbl_802F2CA4:
	.incbin "baserom.dol", 0x1EC6C4, 0x4
.global lbl_802F2CA8
lbl_802F2CA8:
	.incbin "baserom.dol", 0x1EC6C8, 0x4
.global lbl_802F2CAC
lbl_802F2CAC:
	.incbin "baserom.dol", 0x1EC6CC, 0x4
.global lbl_802F2CB0
lbl_802F2CB0:
	.incbin "baserom.dol", 0x1EC6D0, 0x8
.global lbl_802F2CB8
lbl_802F2CB8:
	.incbin "baserom.dol", 0x1EC6D8, 0x8
.global lbl_802F2CC0
lbl_802F2CC0:
	.incbin "baserom.dol", 0x1EC6E0, 0x4
.global lbl_802F2CC4
lbl_802F2CC4:
	.incbin "baserom.dol", 0x1EC6E4, 0x4
.global lbl_802F2CC8
lbl_802F2CC8:
	.incbin "baserom.dol", 0x1EC6E8, 0x4
.global lbl_802F2CCC
lbl_802F2CCC:
	.incbin "baserom.dol", 0x1EC6EC, 0x4
.global lbl_802F2CD0
lbl_802F2CD0:
	.incbin "baserom.dol", 0x1EC6F0, 0x4
.global lbl_802F2CD4
lbl_802F2CD4:
	.incbin "baserom.dol", 0x1EC6F4, 0x4
.global lbl_802F2CD8
lbl_802F2CD8:
	.incbin "baserom.dol", 0x1EC6F8, 0x8
.global lbl_802F2CE0
lbl_802F2CE0:
	.incbin "baserom.dol", 0x1EC700, 0x8
.global lbl_802F2CE8
lbl_802F2CE8:
	.incbin "baserom.dol", 0x1EC708, 0x8
.global lbl_802F2CF0
lbl_802F2CF0:
	.incbin "baserom.dol", 0x1EC710, 0x8
.global lbl_802F2CF8
lbl_802F2CF8:
	.incbin "baserom.dol", 0x1EC718, 0x8
.global lbl_802F2D00
lbl_802F2D00:
	.incbin "baserom.dol", 0x1EC720, 0x8
.global lbl_802F2D08
lbl_802F2D08:
	.incbin "baserom.dol", 0x1EC728, 0x8
.global lbl_802F2D10
lbl_802F2D10:
	.incbin "baserom.dol", 0x1EC730, 0x8
.global lbl_802F2D18
lbl_802F2D18:
	.incbin "baserom.dol", 0x1EC738, 0x8
.global lbl_802F2D20
lbl_802F2D20:
	.incbin "baserom.dol", 0x1EC740, 0x8
.global lbl_802F2D28
lbl_802F2D28:
	.incbin "baserom.dol", 0x1EC748, 0x8
.global lbl_802F2D30
lbl_802F2D30:
	.incbin "baserom.dol", 0x1EC750, 0x8
.global lbl_802F2D38
lbl_802F2D38:
	.incbin "baserom.dol", 0x1EC758, 0x4
.global lbl_802F2D3C
lbl_802F2D3C:
	.incbin "baserom.dol", 0x1EC75C, 0x4
.global lbl_802F2D40
lbl_802F2D40:
	.incbin "baserom.dol", 0x1EC760, 0x8
.global lbl_802F2D48
lbl_802F2D48:
	.incbin "baserom.dol", 0x1EC768, 0x8
.global lbl_802F2D50
lbl_802F2D50:
	.incbin "baserom.dol", 0x1EC770, 0x8
.global lbl_802F2D58
lbl_802F2D58:
	.incbin "baserom.dol", 0x1EC778, 0x8
.global lbl_802F2D60
lbl_802F2D60:
	.incbin "baserom.dol", 0x1EC780, 0x8
.global lbl_802F2D68
lbl_802F2D68:
	.incbin "baserom.dol", 0x1EC788, 0x8
.global lbl_802F2D70
lbl_802F2D70:
	.incbin "baserom.dol", 0x1EC790, 0x8
.global lbl_802F2D78
lbl_802F2D78:
	.incbin "baserom.dol", 0x1EC798, 0x8
.global lbl_802F2D80
lbl_802F2D80:
	.incbin "baserom.dol", 0x1EC7A0, 0x8
.global lbl_802F2D88
lbl_802F2D88:
	.incbin "baserom.dol", 0x1EC7A8, 0x8
.global lbl_802F2D90
lbl_802F2D90:
	.incbin "baserom.dol", 0x1EC7B0, 0x8
.global lbl_802F2D98
lbl_802F2D98:
	.incbin "baserom.dol", 0x1EC7B8, 0x8
.global lbl_802F2DA0
lbl_802F2DA0:
	.incbin "baserom.dol", 0x1EC7C0, 0x8
.global lbl_802F2DA8
lbl_802F2DA8:
	.incbin "baserom.dol", 0x1EC7C8, 0x8
.global lbl_802F2DB0
lbl_802F2DB0:
	.incbin "baserom.dol", 0x1EC7D0, 0x8
.global lbl_802F2DB8
lbl_802F2DB8:
	.incbin "baserom.dol", 0x1EC7D8, 0x8
.global lbl_802F2DC0
lbl_802F2DC0:
	.incbin "baserom.dol", 0x1EC7E0, 0x8
.global lbl_802F2DC8
lbl_802F2DC8:
	.incbin "baserom.dol", 0x1EC7E8, 0x8
.global lbl_802F2DD0
lbl_802F2DD0:
	.incbin "baserom.dol", 0x1EC7F0, 0x8
.global lbl_802F2DD8
lbl_802F2DD8:
	.incbin "baserom.dol", 0x1EC7F8, 0x8
.global lbl_802F2DE0
lbl_802F2DE0:
	.incbin "baserom.dol", 0x1EC800, 0x8
.global lbl_802F2DE8
lbl_802F2DE8:
	.incbin "baserom.dol", 0x1EC808, 0x8
.global lbl_802F2DF0
lbl_802F2DF0:
	.incbin "baserom.dol", 0x1EC810, 0x8
.global lbl_802F2DF8
lbl_802F2DF8:
	.incbin "baserom.dol", 0x1EC818, 0x4
.global lbl_802F2DFC
lbl_802F2DFC:
	.incbin "baserom.dol", 0x1EC81C, 0x4
.global lbl_802F2E00
lbl_802F2E00:
	.incbin "baserom.dol", 0x1EC820, 0x8
.global lbl_802F2E08
lbl_802F2E08:
	.incbin "baserom.dol", 0x1EC828, 0x8
.global lbl_802F2E10
lbl_802F2E10:
	.incbin "baserom.dol", 0x1EC830, 0x8
.global lbl_802F2E18
lbl_802F2E18:
	.incbin "baserom.dol", 0x1EC838, 0x8
.global lbl_802F2E20
lbl_802F2E20:
	.incbin "baserom.dol", 0x1EC840, 0x8
.global lbl_802F2E28
lbl_802F2E28:
	.incbin "baserom.dol", 0x1EC848, 0x8
.global lbl_802F2E30
lbl_802F2E30:
	.incbin "baserom.dol", 0x1EC850, 0x8
.global lbl_802F2E38
lbl_802F2E38:
	.incbin "baserom.dol", 0x1EC858, 0x4
.global lbl_802F2E3C
lbl_802F2E3C:
	.incbin "baserom.dol", 0x1EC85C, 0x4
.global lbl_802F2E40
lbl_802F2E40:
	.incbin "baserom.dol", 0x1EC860, 0x8
.global lbl_802F2E48
lbl_802F2E48:
	.incbin "baserom.dol", 0x1EC868, 0x8
.global lbl_802F2E50
lbl_802F2E50:
	.incbin "baserom.dol", 0x1EC870, 0x8
.global lbl_802F2E58
lbl_802F2E58:
	.incbin "baserom.dol", 0x1EC878, 0x8
.global lbl_802F2E60
lbl_802F2E60:
	.incbin "baserom.dol", 0x1EC880, 0x8
.global lbl_802F2E68
lbl_802F2E68:
	.incbin "baserom.dol", 0x1EC888, 0x4
.global lbl_802F2E6C
lbl_802F2E6C:
	.incbin "baserom.dol", 0x1EC88C, 0x4
.global lbl_802F2E70
lbl_802F2E70:
	.incbin "baserom.dol", 0x1EC890, 0x4
.global lbl_802F2E74
lbl_802F2E74:
	.incbin "baserom.dol", 0x1EC894, 0x4
.global lbl_802F2E78
lbl_802F2E78:
	.incbin "baserom.dol", 0x1EC898, 0x8
.global lbl_802F2E80
lbl_802F2E80:
	.incbin "baserom.dol", 0x1EC8A0, 0x4
.global lbl_802F2E84
lbl_802F2E84:
	.incbin "baserom.dol", 0x1EC8A4, 0x4
.global lbl_802F2E88
lbl_802F2E88:
	.incbin "baserom.dol", 0x1EC8A8, 0x8
.global lbl_802F2E90
lbl_802F2E90:
	.incbin "baserom.dol", 0x1EC8B0, 0x8
.global lbl_802F2E98
lbl_802F2E98:
	.incbin "baserom.dol", 0x1EC8B8, 0x8
.global lbl_802F2EA0
lbl_802F2EA0:
	.incbin "baserom.dol", 0x1EC8C0, 0x8
.global lbl_802F2EA8
lbl_802F2EA8:
	.incbin "baserom.dol", 0x1EC8C8, 0x8
.global lbl_802F2EB0
lbl_802F2EB0:
	.incbin "baserom.dol", 0x1EC8D0, 0x8
.global lbl_802F2EB8
lbl_802F2EB8:
	.incbin "baserom.dol", 0x1EC8D8, 0x8
.global lbl_802F2EC0
lbl_802F2EC0:
	.incbin "baserom.dol", 0x1EC8E0, 0x8
.global lbl_802F2EC8
lbl_802F2EC8:
	.incbin "baserom.dol", 0x1EC8E8, 0x8
.global lbl_802F2ED0
lbl_802F2ED0:
	.incbin "baserom.dol", 0x1EC8F0, 0x8
.global lbl_802F2ED8
lbl_802F2ED8:
	.incbin "baserom.dol", 0x1EC8F8, 0x8
.global lbl_802F2EE0
lbl_802F2EE0:
	.incbin "baserom.dol", 0x1EC900, 0x8
.global lbl_802F2EE8
lbl_802F2EE8:
	.incbin "baserom.dol", 0x1EC908, 0x4
.global lbl_802F2EEC
lbl_802F2EEC:
	.incbin "baserom.dol", 0x1EC90C, 0x4
.global lbl_802F2EF0
lbl_802F2EF0:
	.incbin "baserom.dol", 0x1EC910, 0x4
.global lbl_802F2EF4
lbl_802F2EF4:
	.incbin "baserom.dol", 0x1EC914, 0x4
.global lbl_802F2EF8
lbl_802F2EF8:
	.incbin "baserom.dol", 0x1EC918, 0x4
.global lbl_802F2EFC
lbl_802F2EFC:
	.incbin "baserom.dol", 0x1EC91C, 0x4
.global lbl_802F2F00
lbl_802F2F00:
	.incbin "baserom.dol", 0x1EC920, 0x8
.global lbl_802F2F08
lbl_802F2F08:
	.incbin "baserom.dol", 0x1EC928, 0x8
.global lbl_802F2F10
lbl_802F2F10:
	.incbin "baserom.dol", 0x1EC930, 0x4
.global lbl_802F2F14
lbl_802F2F14:
	.incbin "baserom.dol", 0x1EC934, 0x4
.global lbl_802F2F18
lbl_802F2F18:
	.incbin "baserom.dol", 0x1EC938, 0x4
.global lbl_802F2F1C
lbl_802F2F1C:
	.incbin "baserom.dol", 0x1EC93C, 0x4
.global lbl_802F2F20
lbl_802F2F20:
	.incbin "baserom.dol", 0x1EC940, 0x8
.global lbl_802F2F28
lbl_802F2F28:
	.incbin "baserom.dol", 0x1EC948, 0x8
.global lbl_802F2F30
lbl_802F2F30:
	.incbin "baserom.dol", 0x1EC950, 0x8
.global lbl_802F2F38
lbl_802F2F38:
	.incbin "baserom.dol", 0x1EC958, 0x8
.global lbl_802F2F40
lbl_802F2F40:
	.incbin "baserom.dol", 0x1EC960, 0x8
.global lbl_802F2F48
lbl_802F2F48:
	.incbin "baserom.dol", 0x1EC968, 0x8
.global lbl_802F2F50
lbl_802F2F50:
	.incbin "baserom.dol", 0x1EC970, 0x8
.global lbl_802F2F58
lbl_802F2F58:
	.incbin "baserom.dol", 0x1EC978, 0x8
.global lbl_802F2F60
lbl_802F2F60:
	.incbin "baserom.dol", 0x1EC980, 0x4
.global lbl_802F2F64
lbl_802F2F64:
	.incbin "baserom.dol", 0x1EC984, 0x4
.global lbl_802F2F68
lbl_802F2F68:
	.incbin "baserom.dol", 0x1EC988, 0x8
.global lbl_802F2F70
lbl_802F2F70:
	.incbin "baserom.dol", 0x1EC990, 0x8
.global lbl_802F2F78
lbl_802F2F78:
	.incbin "baserom.dol", 0x1EC998, 0x4
.global lbl_802F2F7C
lbl_802F2F7C:
	.incbin "baserom.dol", 0x1EC99C, 0x4
.global lbl_802F2F80
lbl_802F2F80:
	.incbin "baserom.dol", 0x1EC9A0, 0x4
.global lbl_802F2F84
lbl_802F2F84:
	.incbin "baserom.dol", 0x1EC9A4, 0x4
.global lbl_802F2F88
lbl_802F2F88:
	.incbin "baserom.dol", 0x1EC9A8, 0x8
.global lbl_802F2F90
lbl_802F2F90:
	.incbin "baserom.dol", 0x1EC9B0, 0x4
.global lbl_802F2F94
lbl_802F2F94:
	.incbin "baserom.dol", 0x1EC9B4, 0x4
.global lbl_802F2F98
lbl_802F2F98:
	.incbin "baserom.dol", 0x1EC9B8, 0x4
.global lbl_802F2F9C
lbl_802F2F9C:
	.incbin "baserom.dol", 0x1EC9BC, 0x4
.global lbl_802F2FA0
lbl_802F2FA0:
	.incbin "baserom.dol", 0x1EC9C0, 0x8
.global lbl_802F2FA8
lbl_802F2FA8:
	.incbin "baserom.dol", 0x1EC9C8, 0x8
.global lbl_802F2FB0
lbl_802F2FB0:
	.incbin "baserom.dol", 0x1EC9D0, 0x4
.global lbl_802F2FB4
lbl_802F2FB4:
	.incbin "baserom.dol", 0x1EC9D4, 0x4
.global lbl_802F2FB8
lbl_802F2FB8:
	.incbin "baserom.dol", 0x1EC9D8, 0x4
.global lbl_802F2FBC
lbl_802F2FBC:
	.incbin "baserom.dol", 0x1EC9DC, 0x4
.global lbl_802F2FC0
lbl_802F2FC0:
	.incbin "baserom.dol", 0x1EC9E0, 0x4
.global lbl_802F2FC4
lbl_802F2FC4:
	.incbin "baserom.dol", 0x1EC9E4, 0x4
.global lbl_802F2FC8
lbl_802F2FC8:
	.incbin "baserom.dol", 0x1EC9E8, 0x4
.global lbl_802F2FCC
lbl_802F2FCC:
	.incbin "baserom.dol", 0x1EC9EC, 0x4
.global lbl_802F2FD0
lbl_802F2FD0:
	.incbin "baserom.dol", 0x1EC9F0, 0x8
.global lbl_802F2FD8
lbl_802F2FD8:
	.incbin "baserom.dol", 0x1EC9F8, 0x8
.global lbl_802F2FE0
lbl_802F2FE0:
	.incbin "baserom.dol", 0x1ECA00, 0x4
.global lbl_802F2FE4
lbl_802F2FE4:
	.incbin "baserom.dol", 0x1ECA04, 0x4
.global lbl_802F2FE8
lbl_802F2FE8:
	.incbin "baserom.dol", 0x1ECA08, 0x8
.global lbl_802F2FF0
lbl_802F2FF0:
	.incbin "baserom.dol", 0x1ECA10, 0x4
.global lbl_802F2FF4
lbl_802F2FF4:
	.incbin "baserom.dol", 0x1ECA14, 0x4
.global lbl_802F2FF8
lbl_802F2FF8:
	.incbin "baserom.dol", 0x1ECA18, 0x8
.global lbl_802F3000
lbl_802F3000:
	.incbin "baserom.dol", 0x1ECA20, 0x4
.global lbl_802F3004
lbl_802F3004:
	.incbin "baserom.dol", 0x1ECA24, 0x4
.global lbl_802F3008
lbl_802F3008:
	.incbin "baserom.dol", 0x1ECA28, 0x8
.global lbl_802F3010
lbl_802F3010:
	.incbin "baserom.dol", 0x1ECA30, 0x8
.global lbl_802F3018
lbl_802F3018:
	.incbin "baserom.dol", 0x1ECA38, 0x8
.global lbl_802F3020
lbl_802F3020:
	.incbin "baserom.dol", 0x1ECA40, 0x8
.global lbl_802F3028
lbl_802F3028:
	.incbin "baserom.dol", 0x1ECA48, 0x8
.global lbl_802F3030
lbl_802F3030:
	.incbin "baserom.dol", 0x1ECA50, 0x8
.global lbl_802F3038
lbl_802F3038:
	.incbin "baserom.dol", 0x1ECA58, 0x8
.global lbl_802F3040
lbl_802F3040:
	.incbin "baserom.dol", 0x1ECA60, 0x4
.global lbl_802F3044
lbl_802F3044:
	.incbin "baserom.dol", 0x1ECA64, 0x4
.global lbl_802F3048
lbl_802F3048:
	.incbin "baserom.dol", 0x1ECA68, 0x8
.global lbl_802F3050
lbl_802F3050:
	.incbin "baserom.dol", 0x1ECA70, 0x8
.global lbl_802F3058
lbl_802F3058:
	.incbin "baserom.dol", 0x1ECA78, 0x8
.global lbl_802F3060
lbl_802F3060:
	.incbin "baserom.dol", 0x1ECA80, 0x8
.global lbl_802F3068
lbl_802F3068:
	.incbin "baserom.dol", 0x1ECA88, 0x4
.global lbl_802F306C
lbl_802F306C:
	.incbin "baserom.dol", 0x1ECA8C, 0x4
.global lbl_802F3070
lbl_802F3070:
	.incbin "baserom.dol", 0x1ECA90, 0x4
.global lbl_802F3074
lbl_802F3074:
	.incbin "baserom.dol", 0x1ECA94, 0x4
.global lbl_802F3078
lbl_802F3078:
	.incbin "baserom.dol", 0x1ECA98, 0x8
.global lbl_802F3080
lbl_802F3080:
	.incbin "baserom.dol", 0x1ECAA0, 0x8
.global lbl_802F3088
lbl_802F3088:
	.incbin "baserom.dol", 0x1ECAA8, 0x8
.global lbl_802F3090
lbl_802F3090:
	.incbin "baserom.dol", 0x1ECAB0, 0x4
.global lbl_802F3094
lbl_802F3094:
	.incbin "baserom.dol", 0x1ECAB4, 0x4
.global lbl_802F3098
lbl_802F3098:
	.incbin "baserom.dol", 0x1ECAB8, 0x8
.global lbl_802F30A0
lbl_802F30A0:
	.incbin "baserom.dol", 0x1ECAC0, 0x8
.global lbl_802F30A8
lbl_802F30A8:
	.incbin "baserom.dol", 0x1ECAC8, 0x8
.global lbl_802F30B0
lbl_802F30B0:
	.incbin "baserom.dol", 0x1ECAD0, 0x8
.global lbl_802F30B8
lbl_802F30B8:
	.incbin "baserom.dol", 0x1ECAD8, 0x4
.global lbl_802F30BC
lbl_802F30BC:
	.incbin "baserom.dol", 0x1ECADC, 0x4
.global lbl_802F30C0
lbl_802F30C0:
	.incbin "baserom.dol", 0x1ECAE0, 0x8
.global lbl_802F30C8
lbl_802F30C8:
	.incbin "baserom.dol", 0x1ECAE8, 0x8
.global lbl_802F30D0
lbl_802F30D0:
	.incbin "baserom.dol", 0x1ECAF0, 0x8
.global lbl_802F30D8
lbl_802F30D8:
	.incbin "baserom.dol", 0x1ECAF8, 0x4
.global lbl_802F30DC
lbl_802F30DC:
	.incbin "baserom.dol", 0x1ECAFC, 0x4
.global lbl_802F30E0
lbl_802F30E0:
	.incbin "baserom.dol", 0x1ECB00, 0x4
.global lbl_802F30E4
lbl_802F30E4:
	.incbin "baserom.dol", 0x1ECB04, 0x4
.global lbl_802F30E8
lbl_802F30E8:
	.incbin "baserom.dol", 0x1ECB08, 0x4
.global lbl_802F30EC
lbl_802F30EC:
	.incbin "baserom.dol", 0x1ECB0C, 0x4
.global lbl_802F30F0
lbl_802F30F0:
	.incbin "baserom.dol", 0x1ECB10, 0x4
.global lbl_802F30F4
lbl_802F30F4:
	.incbin "baserom.dol", 0x1ECB14, 0x4
.global lbl_802F30F8
lbl_802F30F8:
	.incbin "baserom.dol", 0x1ECB18, 0x4
.global lbl_802F30FC
lbl_802F30FC:
	.incbin "baserom.dol", 0x1ECB1C, 0x4
.global lbl_802F3100
lbl_802F3100:
	.incbin "baserom.dol", 0x1ECB20, 0x4
.global lbl_802F3104
lbl_802F3104:
	.incbin "baserom.dol", 0x1ECB24, 0x4
.global lbl_802F3108
lbl_802F3108:
	.incbin "baserom.dol", 0x1ECB28, 0x8
.global lbl_802F3110
lbl_802F3110:
	.incbin "baserom.dol", 0x1ECB30, 0x8
.global lbl_802F3118
lbl_802F3118:
	.incbin "baserom.dol", 0x1ECB38, 0x4
.global lbl_802F311C
lbl_802F311C:
	.incbin "baserom.dol", 0x1ECB3C, 0x4
.global lbl_802F3120
lbl_802F3120:
	.incbin "baserom.dol", 0x1ECB40, 0x8
.global lbl_802F3128
lbl_802F3128:
	.incbin "baserom.dol", 0x1ECB48, 0x8
.global lbl_802F3130
lbl_802F3130:
	.incbin "baserom.dol", 0x1ECB50, 0x4
.global lbl_802F3134
lbl_802F3134:
	.incbin "baserom.dol", 0x1ECB54, 0x4
.global lbl_802F3138
lbl_802F3138:
	.incbin "baserom.dol", 0x1ECB58, 0x4
.global lbl_802F313C
lbl_802F313C:
	.incbin "baserom.dol", 0x1ECB5C, 0x4
.global lbl_802F3140
lbl_802F3140:
	.incbin "baserom.dol", 0x1ECB60, 0x4
.global lbl_802F3144
lbl_802F3144:
	.incbin "baserom.dol", 0x1ECB64, 0x4
.global lbl_802F3148
lbl_802F3148:
	.incbin "baserom.dol", 0x1ECB68, 0x8
.global lbl_802F3150
lbl_802F3150:
	.incbin "baserom.dol", 0x1ECB70, 0x8
.global lbl_802F3158
lbl_802F3158:
	.incbin "baserom.dol", 0x1ECB78, 0x8
.global lbl_802F3160
lbl_802F3160:
	.incbin "baserom.dol", 0x1ECB80, 0x4
.global lbl_802F3164
lbl_802F3164:
	.incbin "baserom.dol", 0x1ECB84, 0x4
.global lbl_802F3168
lbl_802F3168:
	.incbin "baserom.dol", 0x1ECB88, 0x8
.global lbl_802F3170
lbl_802F3170:
	.incbin "baserom.dol", 0x1ECB90, 0x4
.global lbl_802F3174
lbl_802F3174:
	.incbin "baserom.dol", 0x1ECB94, 0x4
.global lbl_802F3178
lbl_802F3178:
	.incbin "baserom.dol", 0x1ECB98, 0x4
.global lbl_802F317C
lbl_802F317C:
	.incbin "baserom.dol", 0x1ECB9C, 0x4
.global lbl_802F3180
lbl_802F3180:
	.incbin "baserom.dol", 0x1ECBA0, 0x8
.global lbl_802F3188
lbl_802F3188:
	.incbin "baserom.dol", 0x1ECBA8, 0x8
.global lbl_802F3190
lbl_802F3190:
	.incbin "baserom.dol", 0x1ECBB0, 0x4
.global lbl_802F3194
lbl_802F3194:
	.incbin "baserom.dol", 0x1ECBB4, 0x4
.global lbl_802F3198
lbl_802F3198:
	.incbin "baserom.dol", 0x1ECBB8, 0x4
.global lbl_802F319C
lbl_802F319C:
	.incbin "baserom.dol", 0x1ECBBC, 0x4
.global lbl_802F31A0
lbl_802F31A0:
	.incbin "baserom.dol", 0x1ECBC0, 0x4
.global lbl_802F31A4
lbl_802F31A4:
	.incbin "baserom.dol", 0x1ECBC4, 0x4
.global lbl_802F31A8
lbl_802F31A8:
	.incbin "baserom.dol", 0x1ECBC8, 0x8
.global lbl_802F31B0
lbl_802F31B0:
	.incbin "baserom.dol", 0x1ECBD0, 0x4
.global lbl_802F31B4
lbl_802F31B4:
	.incbin "baserom.dol", 0x1ECBD4, 0x4
.global lbl_802F31B8
lbl_802F31B8:
	.incbin "baserom.dol", 0x1ECBD8, 0x8
.global lbl_802F31C0
lbl_802F31C0:
	.incbin "baserom.dol", 0x1ECBE0, 0x8
.global lbl_802F31C8
lbl_802F31C8:
	.incbin "baserom.dol", 0x1ECBE8, 0x4
.global lbl_802F31CC
lbl_802F31CC:
	.incbin "baserom.dol", 0x1ECBEC, 0x4
.global lbl_802F31D0
lbl_802F31D0:
	.incbin "baserom.dol", 0x1ECBF0, 0x4
.global lbl_802F31D4
lbl_802F31D4:
	.incbin "baserom.dol", 0x1ECBF4, 0x4
.global lbl_802F31D8
lbl_802F31D8:
	.incbin "baserom.dol", 0x1ECBF8, 0x8
.global lbl_802F31E0
lbl_802F31E0:
	.incbin "baserom.dol", 0x1ECC00, 0x8
.global lbl_802F31E8
lbl_802F31E8:
	.incbin "baserom.dol", 0x1ECC08, 0x4
.global lbl_802F31EC
lbl_802F31EC:
	.incbin "baserom.dol", 0x1ECC0C, 0x4
.global lbl_802F31F0
lbl_802F31F0:
	.incbin "baserom.dol", 0x1ECC10, 0x4
.global lbl_802F31F4
lbl_802F31F4:
	.incbin "baserom.dol", 0x1ECC14, 0x4
.global lbl_802F31F8
lbl_802F31F8:
	.incbin "baserom.dol", 0x1ECC18, 0x4
.global lbl_802F31FC
lbl_802F31FC:
	.incbin "baserom.dol", 0x1ECC1C, 0x4
.global lbl_802F3200
lbl_802F3200:
	.incbin "baserom.dol", 0x1ECC20, 0x4
.global lbl_802F3204
lbl_802F3204:
	.incbin "baserom.dol", 0x1ECC24, 0x4
.global lbl_802F3208
lbl_802F3208:
	.incbin "baserom.dol", 0x1ECC28, 0x8
.global lbl_802F3210
lbl_802F3210:
	.incbin "baserom.dol", 0x1ECC30, 0x8
.global lbl_802F3218
lbl_802F3218:
	.incbin "baserom.dol", 0x1ECC38, 0x8
.global lbl_802F3220
lbl_802F3220:
	.incbin "baserom.dol", 0x1ECC40, 0x4
.global lbl_802F3224
lbl_802F3224:
	.incbin "baserom.dol", 0x1ECC44, 0x4
.global lbl_802F3228
lbl_802F3228:
	.incbin "baserom.dol", 0x1ECC48, 0x8
.global lbl_802F3230
lbl_802F3230:
	.incbin "baserom.dol", 0x1ECC50, 0x8
.global lbl_802F3238
lbl_802F3238:
	.incbin "baserom.dol", 0x1ECC58, 0x8
.global lbl_802F3240
lbl_802F3240:
	.incbin "baserom.dol", 0x1ECC60, 0x8
.global lbl_802F3248
lbl_802F3248:
	.incbin "baserom.dol", 0x1ECC68, 0x8
.global lbl_802F3250
lbl_802F3250:
	.incbin "baserom.dol", 0x1ECC70, 0x8
.global lbl_802F3258
lbl_802F3258:
	.incbin "baserom.dol", 0x1ECC78, 0x8
.global lbl_802F3260
lbl_802F3260:
	.incbin "baserom.dol", 0x1ECC80, 0x8
.global lbl_802F3268
lbl_802F3268:
	.incbin "baserom.dol", 0x1ECC88, 0x8
.global lbl_802F3270
lbl_802F3270:
	.incbin "baserom.dol", 0x1ECC90, 0x4
.global lbl_802F3274
lbl_802F3274:
	.incbin "baserom.dol", 0x1ECC94, 0x4
.global lbl_802F3278
lbl_802F3278:
	.incbin "baserom.dol", 0x1ECC98, 0x8
.global lbl_802F3280
lbl_802F3280:
	.incbin "baserom.dol", 0x1ECCA0, 0x8
.global lbl_802F3288
lbl_802F3288:
	.incbin "baserom.dol", 0x1ECCA8, 0x8
.global lbl_802F3290
lbl_802F3290:
	.incbin "baserom.dol", 0x1ECCB0, 0x8
.global lbl_802F3298
lbl_802F3298:
	.incbin "baserom.dol", 0x1ECCB8, 0x8
.global lbl_802F32A0
lbl_802F32A0:
	.incbin "baserom.dol", 0x1ECCC0, 0x8
.global lbl_802F32A8
lbl_802F32A8:
	.incbin "baserom.dol", 0x1ECCC8, 0x8
.global lbl_802F32B0
lbl_802F32B0:
	.incbin "baserom.dol", 0x1ECCD0, 0x8
.global lbl_802F32B8
lbl_802F32B8:
	.incbin "baserom.dol", 0x1ECCD8, 0x8
.global lbl_802F32C0
lbl_802F32C0:
	.incbin "baserom.dol", 0x1ECCE0, 0x8
.global lbl_802F32C8
lbl_802F32C8:
	.incbin "baserom.dol", 0x1ECCE8, 0x8
.global lbl_802F32D0
lbl_802F32D0:
	.incbin "baserom.dol", 0x1ECCF0, 0x4
.global lbl_802F32D4
lbl_802F32D4:
	.incbin "baserom.dol", 0x1ECCF4, 0x4
.global lbl_802F32D8
lbl_802F32D8:
	.incbin "baserom.dol", 0x1ECCF8, 0x8
.global lbl_802F32E0
lbl_802F32E0:
	.incbin "baserom.dol", 0x1ECD00, 0x4
.global lbl_802F32E4
lbl_802F32E4:
	.incbin "baserom.dol", 0x1ECD04, 0x4
.global lbl_802F32E8
lbl_802F32E8:
	.incbin "baserom.dol", 0x1ECD08, 0x4
.global lbl_802F32EC
lbl_802F32EC:
	.incbin "baserom.dol", 0x1ECD0C, 0x4
.global lbl_802F32F0
lbl_802F32F0:
	.incbin "baserom.dol", 0x1ECD10, 0x4
.global lbl_802F32F4
lbl_802F32F4:
	.incbin "baserom.dol", 0x1ECD14, 0x4
.global lbl_802F32F8
lbl_802F32F8:
	.incbin "baserom.dol", 0x1ECD18, 0x8
.global lbl_802F3300
lbl_802F3300:
	.incbin "baserom.dol", 0x1ECD20, 0x8
.global lbl_802F3308
lbl_802F3308:
	.incbin "baserom.dol", 0x1ECD28, 0x8
.global lbl_802F3310
lbl_802F3310:
	.incbin "baserom.dol", 0x1ECD30, 0x4
.global lbl_802F3314
lbl_802F3314:
	.incbin "baserom.dol", 0x1ECD34, 0x4
.global lbl_802F3318
lbl_802F3318:
	.incbin "baserom.dol", 0x1ECD38, 0x8
.global lbl_802F3320
lbl_802F3320:
	.incbin "baserom.dol", 0x1ECD40, 0x8
.global lbl_802F3328
lbl_802F3328:
	.incbin "baserom.dol", 0x1ECD48, 0x8
.global lbl_802F3330
lbl_802F3330:
	.incbin "baserom.dol", 0x1ECD50, 0x8
.global lbl_802F3338
lbl_802F3338:
	.incbin "baserom.dol", 0x1ECD58, 0x4
.global lbl_802F333C
lbl_802F333C:
	.incbin "baserom.dol", 0x1ECD5C, 0x38
.global lbl_802F3374
lbl_802F3374:
	.incbin "baserom.dol", 0x1ECD94, 0x4
.global lbl_802F3378
lbl_802F3378:
	.incbin "baserom.dol", 0x1ECD98, 0x4
.global lbl_802F337C
lbl_802F337C:
	.incbin "baserom.dol", 0x1ECD9C, 0x4
.global lbl_802F3380
lbl_802F3380:
	.incbin "baserom.dol", 0x1ECDA0, 0x8
.global lbl_802F3388
lbl_802F3388:
	.incbin "baserom.dol", 0x1ECDA8, 0x8
.global lbl_802F3390
lbl_802F3390:
	.incbin "baserom.dol", 0x1ECDB0, 0x4
.global lbl_802F3394
lbl_802F3394:
	.incbin "baserom.dol", 0x1ECDB4, 0x4
.global lbl_802F3398
lbl_802F3398:
	.incbin "baserom.dol", 0x1ECDB8, 0x4
.global lbl_802F339C
lbl_802F339C:
	.incbin "baserom.dol", 0x1ECDBC, 0x4
.global lbl_802F33A0
lbl_802F33A0:
	.incbin "baserom.dol", 0x1ECDC0, 0x4
.global lbl_802F33A4
lbl_802F33A4:
	.incbin "baserom.dol", 0x1ECDC4, 0x4
.global lbl_802F33A8
lbl_802F33A8:
	.incbin "baserom.dol", 0x1ECDC8, 0x4
.global lbl_802F33AC
lbl_802F33AC:
	.incbin "baserom.dol", 0x1ECDCC, 0x4
.global lbl_802F33B0
lbl_802F33B0:
	.incbin "baserom.dol", 0x1ECDD0, 0x4
.global lbl_802F33B4
lbl_802F33B4:
	.incbin "baserom.dol", 0x1ECDD4, 0x4
.global lbl_802F33B8
lbl_802F33B8:
	.incbin "baserom.dol", 0x1ECDD8, 0x4
.global lbl_802F33BC
lbl_802F33BC:
	.incbin "baserom.dol", 0x1ECDDC, 0x4
.global lbl_802F33C0
lbl_802F33C0:
	.incbin "baserom.dol", 0x1ECDE0, 0x4
.global lbl_802F33C4
lbl_802F33C4:
	.incbin "baserom.dol", 0x1ECDE4, 0x4
.global lbl_802F33C8
lbl_802F33C8:
	.incbin "baserom.dol", 0x1ECDE8, 0x8
.global lbl_802F33D0
lbl_802F33D0:
	.incbin "baserom.dol", 0x1ECDF0, 0x8
.global lbl_802F33D8
lbl_802F33D8:
	.incbin "baserom.dol", 0x1ECDF8, 0x4
.global lbl_802F33DC
lbl_802F33DC:
	.incbin "baserom.dol", 0x1ECDFC, 0x4
.global lbl_802F33E0
lbl_802F33E0:
	.incbin "baserom.dol", 0x1ECE00, 0x4
.global lbl_802F33E4
lbl_802F33E4:
	.incbin "baserom.dol", 0x1ECE04, 0x4
.global lbl_802F33E8
lbl_802F33E8:
	.incbin "baserom.dol", 0x1ECE08, 0x8
.global lbl_802F33F0
lbl_802F33F0:
	.incbin "baserom.dol", 0x1ECE10, 0x8
.global lbl_802F33F8
lbl_802F33F8:
	.incbin "baserom.dol", 0x1ECE18, 0x8
.global lbl_802F3400
lbl_802F3400:
	.incbin "baserom.dol", 0x1ECE20, 0x8
.global lbl_802F3408
lbl_802F3408:
	.incbin "baserom.dol", 0x1ECE28, 0x4
.global lbl_802F340C
lbl_802F340C:
	.incbin "baserom.dol", 0x1ECE2C, 0x4
.global lbl_802F3410
lbl_802F3410:
	.incbin "baserom.dol", 0x1ECE30, 0x4
.global lbl_802F3414
lbl_802F3414:
	.incbin "baserom.dol", 0x1ECE34, 0x4
.global lbl_802F3418
lbl_802F3418:
	.incbin "baserom.dol", 0x1ECE38, 0x4
.global lbl_802F341C
lbl_802F341C:
	.incbin "baserom.dol", 0x1ECE3C, 0x4
.global lbl_802F3420
lbl_802F3420:
	.incbin "baserom.dol", 0x1ECE40, 0x8
.global lbl_802F3428
lbl_802F3428:
	.incbin "baserom.dol", 0x1ECE48, 0x8
.global lbl_802F3430
lbl_802F3430:
	.incbin "baserom.dol", 0x1ECE50, 0x4
.global lbl_802F3434
lbl_802F3434:
	.incbin "baserom.dol", 0x1ECE54, 0x4
.global lbl_802F3438
lbl_802F3438:
	.incbin "baserom.dol", 0x1ECE58, 0x4
.global lbl_802F343C
lbl_802F343C:
	.incbin "baserom.dol", 0x1ECE5C, 0x4
.global lbl_802F3440
lbl_802F3440:
	.incbin "baserom.dol", 0x1ECE60, 0x4
.global lbl_802F3444
lbl_802F3444:
	.incbin "baserom.dol", 0x1ECE64, 0x4
.global lbl_802F3448
lbl_802F3448:
	.incbin "baserom.dol", 0x1ECE68, 0x4
.global lbl_802F344C
lbl_802F344C:
	.incbin "baserom.dol", 0x1ECE6C, 0x4
.global lbl_802F3450
lbl_802F3450:
	.incbin "baserom.dol", 0x1ECE70, 0x8
.global lbl_802F3458
lbl_802F3458:
	.incbin "baserom.dol", 0x1ECE78, 0x4
.global lbl_802F345C
lbl_802F345C:
	.incbin "baserom.dol", 0x1ECE7C, 0x4
.global lbl_802F3460
lbl_802F3460:
	.incbin "baserom.dol", 0x1ECE80, 0x8
.global lbl_802F3468
lbl_802F3468:
	.incbin "baserom.dol", 0x1ECE88, 0x8
.global lbl_802F3470
lbl_802F3470:
	.incbin "baserom.dol", 0x1ECE90, 0x4
.global lbl_802F3474
lbl_802F3474:
	.incbin "baserom.dol", 0x1ECE94, 0x4
.global lbl_802F3478
lbl_802F3478:
	.incbin "baserom.dol", 0x1ECE98, 0x8
.global lbl_802F3480
lbl_802F3480:
	.incbin "baserom.dol", 0x1ECEA0, 0x8
.global lbl_802F3488
lbl_802F3488:
	.incbin "baserom.dol", 0x1ECEA8, 0x8
.global lbl_802F3490
lbl_802F3490:
	.incbin "baserom.dol", 0x1ECEB0, 0x8
.global lbl_802F3498
lbl_802F3498:
	.incbin "baserom.dol", 0x1ECEB8, 0x8
.global lbl_802F34A0
lbl_802F34A0:
	.incbin "baserom.dol", 0x1ECEC0, 0x8
.global lbl_802F34A8
lbl_802F34A8:
	.incbin "baserom.dol", 0x1ECEC8, 0x4
.global lbl_802F34AC
lbl_802F34AC:
	.incbin "baserom.dol", 0x1ECECC, 0x4
.global lbl_802F34B0
lbl_802F34B0:
	.incbin "baserom.dol", 0x1ECED0, 0x4
.global lbl_802F34B4
lbl_802F34B4:
	.incbin "baserom.dol", 0x1ECED4, 0x4
.global lbl_802F34B8
lbl_802F34B8:
	.incbin "baserom.dol", 0x1ECED8, 0x4
.global lbl_802F34BC
lbl_802F34BC:
	.incbin "baserom.dol", 0x1ECEDC, 0x4
.global lbl_802F34C0
lbl_802F34C0:
	.incbin "baserom.dol", 0x1ECEE0, 0x4
.global lbl_802F34C4
lbl_802F34C4:
	.incbin "baserom.dol", 0x1ECEE4, 0x4
.global lbl_802F34C8
lbl_802F34C8:
	.incbin "baserom.dol", 0x1ECEE8, 0x4
.global lbl_802F34CC
lbl_802F34CC:
	.incbin "baserom.dol", 0x1ECEEC, 0x4
.global lbl_802F34D0
lbl_802F34D0:
	.incbin "baserom.dol", 0x1ECEF0, 0x4
.global lbl_802F34D4
lbl_802F34D4:
	.incbin "baserom.dol", 0x1ECEF4, 0x4
.global lbl_802F34D8
lbl_802F34D8:
	.incbin "baserom.dol", 0x1ECEF8, 0x4
.global lbl_802F34DC
lbl_802F34DC:
	.incbin "baserom.dol", 0x1ECEFC, 0x4
.global lbl_802F34E0
lbl_802F34E0:
	.incbin "baserom.dol", 0x1ECF00, 0x4
.global lbl_802F34E4
lbl_802F34E4:
	.incbin "baserom.dol", 0x1ECF04, 0x4
.global lbl_802F34E8
lbl_802F34E8:
	.incbin "baserom.dol", 0x1ECF08, 0x8
.global lbl_802F34F0
lbl_802F34F0:
	.incbin "baserom.dol", 0x1ECF10, 0x4
.global lbl_802F34F4
lbl_802F34F4:
	.incbin "baserom.dol", 0x1ECF14, 0x4
.global lbl_802F34F8
lbl_802F34F8:
	.incbin "baserom.dol", 0x1ECF18, 0x8
.global lbl_802F3500
lbl_802F3500:
	.incbin "baserom.dol", 0x1ECF20, 0x8
.global lbl_802F3508
lbl_802F3508:
	.incbin "baserom.dol", 0x1ECF28, 0x8
.global lbl_802F3510
lbl_802F3510:
	.incbin "baserom.dol", 0x1ECF30, 0x8
.global lbl_802F3518
lbl_802F3518:
	.incbin "baserom.dol", 0x1ECF38, 0x8
.global lbl_802F3520
lbl_802F3520:
	.incbin "baserom.dol", 0x1ECF40, 0x8
.global lbl_802F3528
lbl_802F3528:
	.incbin "baserom.dol", 0x1ECF48, 0x8
.global lbl_802F3530
lbl_802F3530:
	.incbin "baserom.dol", 0x1ECF50, 0x8
.global lbl_802F3538
lbl_802F3538:
	.incbin "baserom.dol", 0x1ECF58, 0x8
.global lbl_802F3540
lbl_802F3540:
	.incbin "baserom.dol", 0x1ECF60, 0x8
.global lbl_802F3548
lbl_802F3548:
	.incbin "baserom.dol", 0x1ECF68, 0x4
.global lbl_802F354C
lbl_802F354C:
	.incbin "baserom.dol", 0x1ECF6C, 0x4
.global lbl_802F3550
lbl_802F3550:
	.incbin "baserom.dol", 0x1ECF70, 0x8
.global lbl_802F3558
lbl_802F3558:
	.incbin "baserom.dol", 0x1ECF78, 0x8
.global lbl_802F3560
lbl_802F3560:
	.incbin "baserom.dol", 0x1ECF80, 0x8
.global lbl_802F3568
lbl_802F3568:
	.incbin "baserom.dol", 0x1ECF88, 0x8
.global lbl_802F3570
lbl_802F3570:
	.incbin "baserom.dol", 0x1ECF90, 0x4
.global lbl_802F3574
lbl_802F3574:
	.incbin "baserom.dol", 0x1ECF94, 0x4
.global lbl_802F3578
lbl_802F3578:
	.incbin "baserom.dol", 0x1ECF98, 0x4
.global lbl_802F357C
lbl_802F357C:
	.incbin "baserom.dol", 0x1ECF9C, 0x4
.global lbl_802F3580
lbl_802F3580:
	.incbin "baserom.dol", 0x1ECFA0, 0x8
.global lbl_802F3588
lbl_802F3588:
	.incbin "baserom.dol", 0x1ECFA8, 0x8
.global lbl_802F3590
lbl_802F3590:
	.incbin "baserom.dol", 0x1ECFB0, 0x8
.global lbl_802F3598
lbl_802F3598:
	.incbin "baserom.dol", 0x1ECFB8, 0x8
.global lbl_802F35A0
lbl_802F35A0:
	.incbin "baserom.dol", 0x1ECFC0, 0x8
.global lbl_802F35A8
lbl_802F35A8:
	.incbin "baserom.dol", 0x1ECFC8, 0x4
.global lbl_802F35AC
lbl_802F35AC:
	.incbin "baserom.dol", 0x1ECFCC, 0x4
.global lbl_802F35B0
lbl_802F35B0:
	.incbin "baserom.dol", 0x1ECFD0, 0x4
.global lbl_802F35B4
lbl_802F35B4:
	.incbin "baserom.dol", 0x1ECFD4, 0x4
.global lbl_802F35B8
lbl_802F35B8:
	.incbin "baserom.dol", 0x1ECFD8, 0x4
.global lbl_802F35BC
lbl_802F35BC:
	.incbin "baserom.dol", 0x1ECFDC, 0x4
.global lbl_802F35C0
lbl_802F35C0:
	.incbin "baserom.dol", 0x1ECFE0, 0x8
.global lbl_802F35C8
lbl_802F35C8:
	.incbin "baserom.dol", 0x1ECFE8, 0x8
.global lbl_802F35D0
lbl_802F35D0:
	.incbin "baserom.dol", 0x1ECFF0, 0x8
.global lbl_802F35D8
lbl_802F35D8:
	.incbin "baserom.dol", 0x1ECFF8, 0x8
.global lbl_802F35E0
lbl_802F35E0:
	.incbin "baserom.dol", 0x1ED000, 0x8
.global lbl_802F35E8
lbl_802F35E8:
	.incbin "baserom.dol", 0x1ED008, 0x8
.global lbl_802F35F0
lbl_802F35F0:
	.incbin "baserom.dol", 0x1ED010, 0x8
.global lbl_802F35F8
lbl_802F35F8:
	.incbin "baserom.dol", 0x1ED018, 0x4
.global lbl_802F35FC
lbl_802F35FC:
	.incbin "baserom.dol", 0x1ED01C, 0x4
.global lbl_802F3600
lbl_802F3600:
	.incbin "baserom.dol", 0x1ED020, 0x4
.global lbl_802F3604
lbl_802F3604:
	.incbin "baserom.dol", 0x1ED024, 0x4
.global lbl_802F3608
lbl_802F3608:
	.incbin "baserom.dol", 0x1ED028, 0x4
.global lbl_802F360C
lbl_802F360C:
	.incbin "baserom.dol", 0x1ED02C, 0x4
.global lbl_802F3610
lbl_802F3610:
	.incbin "baserom.dol", 0x1ED030, 0x4
.global lbl_802F3614
lbl_802F3614:
	.incbin "baserom.dol", 0x1ED034, 0x4
.global lbl_802F3618
lbl_802F3618:
	.incbin "baserom.dol", 0x1ED038, 0x8
.global lbl_802F3620
lbl_802F3620:
	.incbin "baserom.dol", 0x1ED040, 0x8
.global lbl_802F3628
lbl_802F3628:
	.incbin "baserom.dol", 0x1ED048, 0x4
.global lbl_802F362C
lbl_802F362C:
	.incbin "baserom.dol", 0x1ED04C, 0x4
.global lbl_802F3630
lbl_802F3630:
	.incbin "baserom.dol", 0x1ED050, 0x8
.global lbl_802F3638
lbl_802F3638:
	.incbin "baserom.dol", 0x1ED058, 0x8
.global lbl_802F3640
lbl_802F3640:
	.incbin "baserom.dol", 0x1ED060, 0x8
.global lbl_802F3648
lbl_802F3648:
	.incbin "baserom.dol", 0x1ED068, 0x8
.global lbl_802F3650
lbl_802F3650:
	.incbin "baserom.dol", 0x1ED070, 0x8
.global lbl_802F3658
lbl_802F3658:
	.incbin "baserom.dol", 0x1ED078, 0x8
.global lbl_802F3660
lbl_802F3660:
	.incbin "baserom.dol", 0x1ED080, 0x8
.global lbl_802F3668
lbl_802F3668:
	.incbin "baserom.dol", 0x1ED088, 0x8
.global lbl_802F3670
lbl_802F3670:
	.incbin "baserom.dol", 0x1ED090, 0x8
.global lbl_802F3678
lbl_802F3678:
	.incbin "baserom.dol", 0x1ED098, 0x4
.global lbl_802F367C
lbl_802F367C:
	.incbin "baserom.dol", 0x1ED09C, 0x4
.global lbl_802F3680
lbl_802F3680:
	.incbin "baserom.dol", 0x1ED0A0, 0x4
.global lbl_802F3684
lbl_802F3684:
	.incbin "baserom.dol", 0x1ED0A4, 0x4
.global lbl_802F3688
lbl_802F3688:
	.incbin "baserom.dol", 0x1ED0A8, 0x4
.global lbl_802F368C
lbl_802F368C:
	.incbin "baserom.dol", 0x1ED0AC, 0x4
.global lbl_802F3690
lbl_802F3690:
	.incbin "baserom.dol", 0x1ED0B0, 0x4
.global lbl_802F3694
lbl_802F3694:
	.incbin "baserom.dol", 0x1ED0B4, 0x4
.global lbl_802F3698
lbl_802F3698:
	.incbin "baserom.dol", 0x1ED0B8, 0x8
.global lbl_802F36A0
lbl_802F36A0:
	.incbin "baserom.dol", 0x1ED0C0, 0x8
.global lbl_802F36A8
lbl_802F36A8:
	.incbin "baserom.dol", 0x1ED0C8, 0x4
.global lbl_802F36AC
lbl_802F36AC:
	.incbin "baserom.dol", 0x1ED0CC, 0x4
.global lbl_802F36B0
lbl_802F36B0:
	.incbin "baserom.dol", 0x1ED0D0, 0x4
.global lbl_802F36B4
lbl_802F36B4:
	.incbin "baserom.dol", 0x1ED0D4, 0x4
.global lbl_802F36B8
lbl_802F36B8:
	.incbin "baserom.dol", 0x1ED0D8, 0x8
.global lbl_802F36C0
lbl_802F36C0:
	.incbin "baserom.dol", 0x1ED0E0, 0x8
.global lbl_802F36C8
lbl_802F36C8:
	.incbin "baserom.dol", 0x1ED0E8, 0x8
.global lbl_802F36D0
lbl_802F36D0:
	.incbin "baserom.dol", 0x1ED0F0, 0x8
.global lbl_802F36D8
lbl_802F36D8:
	.incbin "baserom.dol", 0x1ED0F8, 0x8
.global lbl_802F36E0
lbl_802F36E0:
	.incbin "baserom.dol", 0x1ED100, 0x8
.global lbl_802F36E8
lbl_802F36E8:
	.incbin "baserom.dol", 0x1ED108, 0x8
.global lbl_802F36F0
lbl_802F36F0:
	.incbin "baserom.dol", 0x1ED110, 0x8
.global lbl_802F36F8
lbl_802F36F8:
	.incbin "baserom.dol", 0x1ED118, 0x8
.global lbl_802F3700
lbl_802F3700:
	.incbin "baserom.dol", 0x1ED120, 0x8
.global lbl_802F3708
lbl_802F3708:
	.incbin "baserom.dol", 0x1ED128, 0x8
.global lbl_802F3710
lbl_802F3710:
	.incbin "baserom.dol", 0x1ED130, 0x8
.global lbl_802F3718
lbl_802F3718:
	.incbin "baserom.dol", 0x1ED138, 0x8
.global lbl_802F3720
lbl_802F3720:
	.incbin "baserom.dol", 0x1ED140, 0x8
.global lbl_802F3728
lbl_802F3728:
	.incbin "baserom.dol", 0x1ED148, 0x8
.global lbl_802F3730
lbl_802F3730:
	.incbin "baserom.dol", 0x1ED150, 0x8
.global lbl_802F3738
lbl_802F3738:
	.incbin "baserom.dol", 0x1ED158, 0x8
.global lbl_802F3740
lbl_802F3740:
	.incbin "baserom.dol", 0x1ED160, 0x8
.global lbl_802F3748
lbl_802F3748:
	.incbin "baserom.dol", 0x1ED168, 0x8
.global lbl_802F3750
lbl_802F3750:
	.incbin "baserom.dol", 0x1ED170, 0x8
.global lbl_802F3758
lbl_802F3758:
	.incbin "baserom.dol", 0x1ED178, 0x8
.global lbl_802F3760
lbl_802F3760:
	.incbin "baserom.dol", 0x1ED180, 0x8
.global lbl_802F3768
lbl_802F3768:
	.incbin "baserom.dol", 0x1ED188, 0x8
.global lbl_802F3770
lbl_802F3770:
	.incbin "baserom.dol", 0x1ED190, 0x8
.global lbl_802F3778
lbl_802F3778:
	.incbin "baserom.dol", 0x1ED198, 0x4
.global lbl_802F377C
lbl_802F377C:
	.incbin "baserom.dol", 0x1ED19C, 0x4
.global lbl_802F3780
lbl_802F3780:
	.incbin "baserom.dol", 0x1ED1A0, 0x8
.global lbl_802F3788
lbl_802F3788:
	.incbin "baserom.dol", 0x1ED1A8, 0x8
.global lbl_802F3790
lbl_802F3790:
	.incbin "baserom.dol", 0x1ED1B0, 0x8
.global lbl_802F3798
lbl_802F3798:
	.incbin "baserom.dol", 0x1ED1B8, 0x8
.global lbl_802F37A0
lbl_802F37A0:
	.incbin "baserom.dol", 0x1ED1C0, 0x4
.global lbl_802F37A4
lbl_802F37A4:
	.incbin "baserom.dol", 0x1ED1C4, 0x4
.global lbl_802F37A8
lbl_802F37A8:
	.incbin "baserom.dol", 0x1ED1C8, 0x4
.global lbl_802F37AC
lbl_802F37AC:
	.incbin "baserom.dol", 0x1ED1CC, 0x4
.global lbl_802F37B0
lbl_802F37B0:
	.incbin "baserom.dol", 0x1ED1D0, 0x8
.global lbl_802F37B8
lbl_802F37B8:
	.incbin "baserom.dol", 0x1ED1D8, 0x4
.global lbl_802F37BC
lbl_802F37BC:
	.incbin "baserom.dol", 0x1ED1DC, 0x4
.global lbl_802F37C0
lbl_802F37C0:
	.incbin "baserom.dol", 0x1ED1E0, 0x4
.global lbl_802F37C4
lbl_802F37C4:
	.incbin "baserom.dol", 0x1ED1E4, 0x4
.global lbl_802F37C8
lbl_802F37C8:
	.incbin "baserom.dol", 0x1ED1E8, 0x8
.global lbl_802F37D0
lbl_802F37D0:
	.incbin "baserom.dol", 0x1ED1F0, 0x8
.global lbl_802F37D8
lbl_802F37D8:
	.incbin "baserom.dol", 0x1ED1F8, 0x8
.global lbl_802F37E0
lbl_802F37E0:
	.incbin "baserom.dol", 0x1ED200, 0x4
.global lbl_802F37E4
lbl_802F37E4:
	.incbin "baserom.dol", 0x1ED204, 0x4
.global lbl_802F37E8
lbl_802F37E8:
	.incbin "baserom.dol", 0x1ED208, 0x8
.global lbl_802F37F0
lbl_802F37F0:
	.incbin "baserom.dol", 0x1ED210, 0x8
.global lbl_802F37F8
lbl_802F37F8:
	.incbin "baserom.dol", 0x1ED218, 0x8
.global lbl_802F3800
lbl_802F3800:
	.incbin "baserom.dol", 0x1ED220, 0x8
.global lbl_802F3808
lbl_802F3808:
	.incbin "baserom.dol", 0x1ED228, 0x8
.global lbl_802F3810
lbl_802F3810:
	.incbin "baserom.dol", 0x1ED230, 0x4
.global lbl_802F3814
lbl_802F3814:
	.incbin "baserom.dol", 0x1ED234, 0x4
.global lbl_802F3818
lbl_802F3818:
	.incbin "baserom.dol", 0x1ED238, 0x8
.global lbl_802F3820
lbl_802F3820:
	.incbin "baserom.dol", 0x1ED240, 0x8
.global lbl_802F3828
lbl_802F3828:
	.incbin "baserom.dol", 0x1ED248, 0x8
.global lbl_802F3830
lbl_802F3830:
	.incbin "baserom.dol", 0x1ED250, 0x8
.global lbl_802F3838
lbl_802F3838:
	.incbin "baserom.dol", 0x1ED258, 0x8
.global lbl_802F3840
lbl_802F3840:
	.incbin "baserom.dol", 0x1ED260, 0x8
.global lbl_802F3848
lbl_802F3848:
	.incbin "baserom.dol", 0x1ED268, 0x8
.global lbl_802F3850
lbl_802F3850:
	.incbin "baserom.dol", 0x1ED270, 0x8
.global lbl_802F3858
lbl_802F3858:
	.incbin "baserom.dol", 0x1ED278, 0x8
.global lbl_802F3860
lbl_802F3860:
	.incbin "baserom.dol", 0x1ED280, 0x8
.global lbl_802F3868
lbl_802F3868:
	.incbin "baserom.dol", 0x1ED288, 0x8
.global lbl_802F3870
lbl_802F3870:
	.incbin "baserom.dol", 0x1ED290, 0x8
.global lbl_802F3878
lbl_802F3878:
	.incbin "baserom.dol", 0x1ED298, 0x8
.global lbl_802F3880
lbl_802F3880:
	.incbin "baserom.dol", 0x1ED2A0, 0x4
.global lbl_802F3884
lbl_802F3884:
	.incbin "baserom.dol", 0x1ED2A4, 0x4
.global lbl_802F3888
lbl_802F3888:
	.incbin "baserom.dol", 0x1ED2A8, 0x4
.global lbl_802F388C
lbl_802F388C:
	.incbin "baserom.dol", 0x1ED2AC, 0x4
.global lbl_802F3890
lbl_802F3890:
	.incbin "baserom.dol", 0x1ED2B0, 0x8
.global lbl_802F3898
lbl_802F3898:
	.incbin "baserom.dol", 0x1ED2B8, 0x8
.global lbl_802F38A0
lbl_802F38A0:
	.incbin "baserom.dol", 0x1ED2C0, 0x8
.global lbl_802F38A8
lbl_802F38A8:
	.incbin "baserom.dol", 0x1ED2C8, 0x8
.global lbl_802F38B0
lbl_802F38B0:
	.incbin "baserom.dol", 0x1ED2D0, 0x4
.global lbl_802F38B4
lbl_802F38B4:
	.incbin "baserom.dol", 0x1ED2D4, 0x4
.global lbl_802F38B8
lbl_802F38B8:
	.incbin "baserom.dol", 0x1ED2D8, 0x8
.global lbl_802F38C0
lbl_802F38C0:
	.incbin "baserom.dol", 0x1ED2E0, 0x4
.global lbl_802F38C4
lbl_802F38C4:
	.incbin "baserom.dol", 0x1ED2E4, 0x4
.global lbl_802F38C8
lbl_802F38C8:
	.incbin "baserom.dol", 0x1ED2E8, 0x8
.global lbl_802F38D0
lbl_802F38D0:
	.incbin "baserom.dol", 0x1ED2F0, 0x8
.global lbl_802F38D8
lbl_802F38D8:
	.incbin "baserom.dol", 0x1ED2F8, 0x8
.global lbl_802F38E0
lbl_802F38E0:
	.incbin "baserom.dol", 0x1ED300, 0x8
.global lbl_802F38E8
lbl_802F38E8:
	.incbin "baserom.dol", 0x1ED308, 0x8
.global lbl_802F38F0
lbl_802F38F0:
	.incbin "baserom.dol", 0x1ED310, 0x8
.global lbl_802F38F8
lbl_802F38F8:
	.incbin "baserom.dol", 0x1ED318, 0x8
.global lbl_802F3900
lbl_802F3900:
	.incbin "baserom.dol", 0x1ED320, 0x8
.global lbl_802F3908
lbl_802F3908:
	.incbin "baserom.dol", 0x1ED328, 0x8
.global lbl_802F3910
lbl_802F3910:
	.incbin "baserom.dol", 0x1ED330, 0x8
.global lbl_802F3918
lbl_802F3918:
	.incbin "baserom.dol", 0x1ED338, 0x8
.global lbl_802F3920
lbl_802F3920:
	.incbin "baserom.dol", 0x1ED340, 0x8
.global lbl_802F3928
lbl_802F3928:
	.incbin "baserom.dol", 0x1ED348, 0x8
.global lbl_802F3930
lbl_802F3930:
	.incbin "baserom.dol", 0x1ED350, 0x8
.global lbl_802F3938
lbl_802F3938:
	.incbin "baserom.dol", 0x1ED358, 0x4
.global lbl_802F393C
lbl_802F393C:
	.incbin "baserom.dol", 0x1ED35C, 0x4
.global lbl_802F3940
lbl_802F3940:
	.incbin "baserom.dol", 0x1ED360, 0x4
.global lbl_802F3944
lbl_802F3944:
	.incbin "baserom.dol", 0x1ED364, 0x4
.global lbl_802F3948
lbl_802F3948:
	.incbin "baserom.dol", 0x1ED368, 0x8
.global lbl_802F3950
lbl_802F3950:
	.incbin "baserom.dol", 0x1ED370, 0x8
.global lbl_802F3958
lbl_802F3958:
	.incbin "baserom.dol", 0x1ED378, 0x8
.global lbl_802F3960
lbl_802F3960:
	.incbin "baserom.dol", 0x1ED380, 0x8
.global lbl_802F3968
lbl_802F3968:
	.incbin "baserom.dol", 0x1ED388, 0x8
.global lbl_802F3970
lbl_802F3970:
	.incbin "baserom.dol", 0x1ED390, 0x8
.global lbl_802F3978
lbl_802F3978:
	.incbin "baserom.dol", 0x1ED398, 0x8
.global lbl_802F3980
lbl_802F3980:
	.incbin "baserom.dol", 0x1ED3A0, 0x8
.global lbl_802F3988
lbl_802F3988:
	.incbin "baserom.dol", 0x1ED3A8, 0x4
.global lbl_802F398C
lbl_802F398C:
	.incbin "baserom.dol", 0x1ED3AC, 0x4
.global lbl_802F3990
lbl_802F3990:
	.incbin "baserom.dol", 0x1ED3B0, 0x4
.global lbl_802F3994
lbl_802F3994:
	.incbin "baserom.dol", 0x1ED3B4, 0x4
.global lbl_802F3998
lbl_802F3998:
	.incbin "baserom.dol", 0x1ED3B8, 0x8
.global lbl_802F39A0
lbl_802F39A0:
	.incbin "baserom.dol", 0x1ED3C0, 0x8
.global lbl_802F39A8
lbl_802F39A8:
	.incbin "baserom.dol", 0x1ED3C8, 0x8
.global lbl_802F39B0
lbl_802F39B0:
	.incbin "baserom.dol", 0x1ED3D0, 0x8
.global lbl_802F39B8
lbl_802F39B8:
	.incbin "baserom.dol", 0x1ED3D8, 0x8
.global lbl_802F39C0
lbl_802F39C0:
	.incbin "baserom.dol", 0x1ED3E0, 0x8
.global lbl_802F39C8
lbl_802F39C8:
	.incbin "baserom.dol", 0x1ED3E8, 0x8
.global lbl_802F39D0
lbl_802F39D0:
	.incbin "baserom.dol", 0x1ED3F0, 0x8
.global lbl_802F39D8
lbl_802F39D8:
	.incbin "baserom.dol", 0x1ED3F8, 0x8
.global lbl_802F39E0
lbl_802F39E0:
	.incbin "baserom.dol", 0x1ED400, 0x8
.global lbl_802F39E8
lbl_802F39E8:
	.incbin "baserom.dol", 0x1ED408, 0x4
.global lbl_802F39EC
lbl_802F39EC:
	.incbin "baserom.dol", 0x1ED40C, 0x4
.global lbl_802F39F0
lbl_802F39F0:
	.incbin "baserom.dol", 0x1ED410, 0x4
.global lbl_802F39F4
lbl_802F39F4:
	.incbin "baserom.dol", 0x1ED414, 0x4
.global lbl_802F39F8
lbl_802F39F8:
	.incbin "baserom.dol", 0x1ED418, 0x8
.global lbl_802F3A00
lbl_802F3A00:
	.incbin "baserom.dol", 0x1ED420, 0x8
.global lbl_802F3A08
lbl_802F3A08:
	.incbin "baserom.dol", 0x1ED428, 0x4
.global lbl_802F3A0C
lbl_802F3A0C:
	.incbin "baserom.dol", 0x1ED42C, 0x4
.global lbl_802F3A10
lbl_802F3A10:
	.incbin "baserom.dol", 0x1ED430, 0x8
.global lbl_802F3A18
lbl_802F3A18:
	.incbin "baserom.dol", 0x1ED438, 0x8
.global lbl_802F3A20
lbl_802F3A20:
	.incbin "baserom.dol", 0x1ED440, 0x8
.global lbl_802F3A28
lbl_802F3A28:
	.incbin "baserom.dol", 0x1ED448, 0x8
.global lbl_802F3A30
lbl_802F3A30:
	.incbin "baserom.dol", 0x1ED450, 0x8
.global lbl_802F3A38
lbl_802F3A38:
	.incbin "baserom.dol", 0x1ED458, 0x8
.global lbl_802F3A40
lbl_802F3A40:
	.incbin "baserom.dol", 0x1ED460, 0x8
.global lbl_802F3A48
lbl_802F3A48:
	.incbin "baserom.dol", 0x1ED468, 0x8
.global lbl_802F3A50
lbl_802F3A50:
	.incbin "baserom.dol", 0x1ED470, 0x8
.global lbl_802F3A58
lbl_802F3A58:
	.incbin "baserom.dol", 0x1ED478, 0x8
.global lbl_802F3A60
lbl_802F3A60:
	.incbin "baserom.dol", 0x1ED480, 0x8
.global lbl_802F3A68
lbl_802F3A68:
	.incbin "baserom.dol", 0x1ED488, 0x8
.global lbl_802F3A70
lbl_802F3A70:
	.incbin "baserom.dol", 0x1ED490, 0x8
.global lbl_802F3A78
lbl_802F3A78:
	.incbin "baserom.dol", 0x1ED498, 0x8
.global lbl_802F3A80
lbl_802F3A80:
	.incbin "baserom.dol", 0x1ED4A0, 0x8
.global lbl_802F3A88
lbl_802F3A88:
	.incbin "baserom.dol", 0x1ED4A8, 0x8
.global lbl_802F3A90
lbl_802F3A90:
	.incbin "baserom.dol", 0x1ED4B0, 0x8
.global lbl_802F3A98
lbl_802F3A98:
	.incbin "baserom.dol", 0x1ED4B8, 0x4
.global lbl_802F3A9C
lbl_802F3A9C:
	.incbin "baserom.dol", 0x1ED4BC, 0x4
.global lbl_802F3AA0
lbl_802F3AA0:
	.incbin "baserom.dol", 0x1ED4C0, 0x8
.global lbl_802F3AA8
lbl_802F3AA8:
	.incbin "baserom.dol", 0x1ED4C8, 0x8
.global lbl_802F3AB0
lbl_802F3AB0:
	.incbin "baserom.dol", 0x1ED4D0, 0x4
.global lbl_802F3AB4
lbl_802F3AB4:
	.incbin "baserom.dol", 0x1ED4D4, 0x4
.global lbl_802F3AB8
lbl_802F3AB8:
	.incbin "baserom.dol", 0x1ED4D8, 0x8
.global lbl_802F3AC0
lbl_802F3AC0:
	.incbin "baserom.dol", 0x1ED4E0, 0x8
.global lbl_802F3AC8
lbl_802F3AC8:
	.incbin "baserom.dol", 0x1ED4E8, 0x8
.global lbl_802F3AD0
lbl_802F3AD0:
	.incbin "baserom.dol", 0x1ED4F0, 0x8
.global lbl_802F3AD8
lbl_802F3AD8:
	.incbin "baserom.dol", 0x1ED4F8, 0x8
.global lbl_802F3AE0
lbl_802F3AE0:
	.incbin "baserom.dol", 0x1ED500, 0x8
.global lbl_802F3AE8
lbl_802F3AE8:
	.incbin "baserom.dol", 0x1ED508, 0x8
.global lbl_802F3AF0
lbl_802F3AF0:
	.incbin "baserom.dol", 0x1ED510, 0x8
.global lbl_802F3AF8
lbl_802F3AF8:
	.incbin "baserom.dol", 0x1ED518, 0x8
.global lbl_802F3B00
lbl_802F3B00:
	.incbin "baserom.dol", 0x1ED520, 0x8
.global lbl_802F3B08
lbl_802F3B08:
	.incbin "baserom.dol", 0x1ED528, 0x8
.global lbl_802F3B10
lbl_802F3B10:
	.incbin "baserom.dol", 0x1ED530, 0x8
.global lbl_802F3B18
lbl_802F3B18:
	.incbin "baserom.dol", 0x1ED538, 0x8
.global lbl_802F3B20
lbl_802F3B20:
	.incbin "baserom.dol", 0x1ED540, 0x8
.global lbl_802F3B28
lbl_802F3B28:
	.incbin "baserom.dol", 0x1ED548, 0x8
.global lbl_802F3B30
lbl_802F3B30:
	.incbin "baserom.dol", 0x1ED550, 0x8
.global lbl_802F3B38
lbl_802F3B38:
	.incbin "baserom.dol", 0x1ED558, 0x8
.global lbl_802F3B40
lbl_802F3B40:
	.incbin "baserom.dol", 0x1ED560, 0x8
.global lbl_802F3B48
lbl_802F3B48:
	.incbin "baserom.dol", 0x1ED568, 0x8
.global lbl_802F3B50
lbl_802F3B50:
	.incbin "baserom.dol", 0x1ED570, 0x8
.global lbl_802F3B58
lbl_802F3B58:
	.incbin "baserom.dol", 0x1ED578, 0x8
.global lbl_802F3B60
lbl_802F3B60:
	.incbin "baserom.dol", 0x1ED580, 0x8
.global lbl_802F3B68
lbl_802F3B68:
	.incbin "baserom.dol", 0x1ED588, 0x8
.global lbl_802F3B70
lbl_802F3B70:
	.incbin "baserom.dol", 0x1ED590, 0x8
.global lbl_802F3B78
lbl_802F3B78:
	.incbin "baserom.dol", 0x1ED598, 0x8
.global lbl_802F3B80
lbl_802F3B80:
	.incbin "baserom.dol", 0x1ED5A0, 0x8
.global lbl_802F3B88
lbl_802F3B88:
	.incbin "baserom.dol", 0x1ED5A8, 0x8
.global lbl_802F3B90
lbl_802F3B90:
	.incbin "baserom.dol", 0x1ED5B0, 0x8
.global lbl_802F3B98
lbl_802F3B98:
	.incbin "baserom.dol", 0x1ED5B8, 0x8
.global lbl_802F3BA0
lbl_802F3BA0:
	.incbin "baserom.dol", 0x1ED5C0, 0x8
.global lbl_802F3BA8
lbl_802F3BA8:
	.incbin "baserom.dol", 0x1ED5C8, 0x8
.global lbl_802F3BB0
lbl_802F3BB0:
	.incbin "baserom.dol", 0x1ED5D0, 0x8
.global lbl_802F3BB8
lbl_802F3BB8:
	.incbin "baserom.dol", 0x1ED5D8, 0x8
.global lbl_802F3BC0
lbl_802F3BC0:
	.incbin "baserom.dol", 0x1ED5E0, 0x4
.global lbl_802F3BC4
lbl_802F3BC4:
	.incbin "baserom.dol", 0x1ED5E4, 0x4
.global lbl_802F3BC8
lbl_802F3BC8:
	.incbin "baserom.dol", 0x1ED5E8, 0x8
.global lbl_802F3BD0
lbl_802F3BD0:
	.incbin "baserom.dol", 0x1ED5F0, 0x8
.global lbl_802F3BD8
lbl_802F3BD8:
	.incbin "baserom.dol", 0x1ED5F8, 0x8
.global lbl_802F3BE0
lbl_802F3BE0:
	.incbin "baserom.dol", 0x1ED600, 0x8
.global lbl_802F3BE8
lbl_802F3BE8:
	.incbin "baserom.dol", 0x1ED608, 0x4
.global lbl_802F3BEC
lbl_802F3BEC:
	.incbin "baserom.dol", 0x1ED60C, 0x4
.global lbl_802F3BF0
lbl_802F3BF0:
	.incbin "baserom.dol", 0x1ED610, 0x4
.global lbl_802F3BF4
lbl_802F3BF4:
	.incbin "baserom.dol", 0x1ED614, 0x4
.global lbl_802F3BF8
lbl_802F3BF8:
	.incbin "baserom.dol", 0x1ED618, 0x4
.global lbl_802F3BFC
lbl_802F3BFC:
	.incbin "baserom.dol", 0x1ED61C, 0x4
.global lbl_802F3C00
lbl_802F3C00:
	.incbin "baserom.dol", 0x1ED620, 0x4
.global lbl_802F3C04
lbl_802F3C04:
	.incbin "baserom.dol", 0x1ED624, 0x4
.global lbl_802F3C08
lbl_802F3C08:
	.incbin "baserom.dol", 0x1ED628, 0x4
.global lbl_802F3C0C
lbl_802F3C0C:
	.incbin "baserom.dol", 0x1ED62C, 0x4
.global lbl_802F3C10
lbl_802F3C10:
	.incbin "baserom.dol", 0x1ED630, 0x4
.global lbl_802F3C14
lbl_802F3C14:
	.incbin "baserom.dol", 0x1ED634, 0x4
.global lbl_802F3C18
lbl_802F3C18:
	.incbin "baserom.dol", 0x1ED638, 0x4
.global lbl_802F3C1C
lbl_802F3C1C:
	.incbin "baserom.dol", 0x1ED63C, 0x4
.global lbl_802F3C20
lbl_802F3C20:
	.incbin "baserom.dol", 0x1ED640, 0x4
.global lbl_802F3C24
lbl_802F3C24:
	.incbin "baserom.dol", 0x1ED644, 0x4
.global lbl_802F3C28
lbl_802F3C28:
	.incbin "baserom.dol", 0x1ED648, 0x4
.global lbl_802F3C2C
lbl_802F3C2C:
	.incbin "baserom.dol", 0x1ED64C, 0x4
.global lbl_802F3C30
lbl_802F3C30:
	.incbin "baserom.dol", 0x1ED650, 0x4
.global lbl_802F3C34
lbl_802F3C34:
	.incbin "baserom.dol", 0x1ED654, 0x4
.global lbl_802F3C38
lbl_802F3C38:
	.incbin "baserom.dol", 0x1ED658, 0x4
.global lbl_802F3C3C
lbl_802F3C3C:
	.incbin "baserom.dol", 0x1ED65C, 0x4
.global lbl_802F3C40
lbl_802F3C40:
	.incbin "baserom.dol", 0x1ED660, 0x4
.global lbl_802F3C44
lbl_802F3C44:
	.incbin "baserom.dol", 0x1ED664, 0x4
.global lbl_802F3C48
lbl_802F3C48:
	.incbin "baserom.dol", 0x1ED668, 0x4
.global lbl_802F3C4C
lbl_802F3C4C:
	.incbin "baserom.dol", 0x1ED66C, 0x4
.global lbl_802F3C50
lbl_802F3C50:
	.incbin "baserom.dol", 0x1ED670, 0x4
.global lbl_802F3C54
lbl_802F3C54:
	.incbin "baserom.dol", 0x1ED674, 0x4
.global lbl_802F3C58
lbl_802F3C58:
	.incbin "baserom.dol", 0x1ED678, 0x4
.global lbl_802F3C5C
lbl_802F3C5C:
	.incbin "baserom.dol", 0x1ED67C, 0x4
.global lbl_802F3C60
lbl_802F3C60:
	.incbin "baserom.dol", 0x1ED680, 0x8
.global lbl_802F3C68
lbl_802F3C68:
	.incbin "baserom.dol", 0x1ED688, 0x8
.global lbl_802F3C70
lbl_802F3C70:
	.incbin "baserom.dol", 0x1ED690, 0x4
.global lbl_802F3C74
lbl_802F3C74:
	.incbin "baserom.dol", 0x1ED694, 0x4
.global lbl_802F3C78
lbl_802F3C78:
	.incbin "baserom.dol", 0x1ED698, 0x4
.global lbl_802F3C7C
lbl_802F3C7C:
	.incbin "baserom.dol", 0x1ED69C, 0x4
.global lbl_802F3C80
lbl_802F3C80:
	.incbin "baserom.dol", 0x1ED6A0, 0x4
.global lbl_802F3C84
lbl_802F3C84:
	.incbin "baserom.dol", 0x1ED6A4, 0x4
.global lbl_802F3C88
lbl_802F3C88:
	.incbin "baserom.dol", 0x1ED6A8, 0x4
.global lbl_802F3C8C
lbl_802F3C8C:
	.incbin "baserom.dol", 0x1ED6AC, 0x4
.global lbl_802F3C90
lbl_802F3C90:
	.incbin "baserom.dol", 0x1ED6B0, 0x4
.global lbl_802F3C94
lbl_802F3C94:
	.incbin "baserom.dol", 0x1ED6B4, 0x4
.global lbl_802F3C98
lbl_802F3C98:
	.incbin "baserom.dol", 0x1ED6B8, 0x4
.global lbl_802F3C9C
lbl_802F3C9C:
	.incbin "baserom.dol", 0x1ED6BC, 0x4
.global lbl_802F3CA0
lbl_802F3CA0:
	.incbin "baserom.dol", 0x1ED6C0, 0x8
.global lbl_802F3CA8
lbl_802F3CA8:
	.incbin "baserom.dol", 0x1ED6C8, 0x8
.global lbl_802F3CB0
lbl_802F3CB0:
	.incbin "baserom.dol", 0x1ED6D0, 0x8
.global lbl_802F3CB8
lbl_802F3CB8:
	.incbin "baserom.dol", 0x1ED6D8, 0x8
.global lbl_802F3CC0
lbl_802F3CC0:
	.incbin "baserom.dol", 0x1ED6E0, 0x8
.global lbl_802F3CC8
lbl_802F3CC8:
	.incbin "baserom.dol", 0x1ED6E8, 0x8
.global lbl_802F3CD0
lbl_802F3CD0:
	.incbin "baserom.dol", 0x1ED6F0, 0x8
.global lbl_802F3CD8
lbl_802F3CD8:
	.incbin "baserom.dol", 0x1ED6F8, 0x8
.global lbl_802F3CE0
lbl_802F3CE0:
	.incbin "baserom.dol", 0x1ED700, 0x8
.global lbl_802F3CE8
lbl_802F3CE8:
	.incbin "baserom.dol", 0x1ED708, 0x4
.global lbl_802F3CEC
lbl_802F3CEC:
	.incbin "baserom.dol", 0x1ED70C, 0x4
.global lbl_802F3CF0
lbl_802F3CF0:
	.incbin "baserom.dol", 0x1ED710, 0x8
.global lbl_802F3CF8
lbl_802F3CF8:
	.incbin "baserom.dol", 0x1ED718, 0x4
.global lbl_802F3CFC
lbl_802F3CFC:
	.incbin "baserom.dol", 0x1ED71C, 0x4
.global lbl_802F3D00
lbl_802F3D00:
	.incbin "baserom.dol", 0x1ED720, 0x8
.global lbl_802F3D08
lbl_802F3D08:
	.incbin "baserom.dol", 0x1ED728, 0x8
.global lbl_802F3D10
lbl_802F3D10:
	.incbin "baserom.dol", 0x1ED730, 0x8
.global lbl_802F3D18
lbl_802F3D18:
	.incbin "baserom.dol", 0x1ED738, 0x8
.global lbl_802F3D20
lbl_802F3D20:
	.incbin "baserom.dol", 0x1ED740, 0x8
.global lbl_802F3D28
lbl_802F3D28:
	.incbin "baserom.dol", 0x1ED748, 0x8
.global lbl_802F3D30
lbl_802F3D30:
	.incbin "baserom.dol", 0x1ED750, 0x8
.global lbl_802F3D38
lbl_802F3D38:
	.incbin "baserom.dol", 0x1ED758, 0x8
.global lbl_802F3D40
lbl_802F3D40:
	.incbin "baserom.dol", 0x1ED760, 0x8
.global lbl_802F3D48
lbl_802F3D48:
	.incbin "baserom.dol", 0x1ED768, 0x8
.global lbl_802F3D50
lbl_802F3D50:
	.incbin "baserom.dol", 0x1ED770, 0x8
.global lbl_802F3D58
lbl_802F3D58:
	.incbin "baserom.dol", 0x1ED778, 0x4
.global lbl_802F3D5C
lbl_802F3D5C:
	.incbin "baserom.dol", 0x1ED77C, 0x4
.global lbl_802F3D60
lbl_802F3D60:
	.incbin "baserom.dol", 0x1ED780, 0x8
.global lbl_802F3D68
lbl_802F3D68:
	.incbin "baserom.dol", 0x1ED788, 0x8
.global lbl_802F3D70
lbl_802F3D70:
	.incbin "baserom.dol", 0x1ED790, 0x8
.global lbl_802F3D78
lbl_802F3D78:
	.incbin "baserom.dol", 0x1ED798, 0x8
.global lbl_802F3D80
lbl_802F3D80:
	.incbin "baserom.dol", 0x1ED7A0, 0x8
.global lbl_802F3D88
lbl_802F3D88:
	.incbin "baserom.dol", 0x1ED7A8, 0x8
.global lbl_802F3D90
lbl_802F3D90:
	.incbin "baserom.dol", 0x1ED7B0, 0x8
.global lbl_802F3D98
lbl_802F3D98:
	.incbin "baserom.dol", 0x1ED7B8, 0x8
.global lbl_802F3DA0
lbl_802F3DA0:
	.incbin "baserom.dol", 0x1ED7C0, 0x8
.global lbl_802F3DA8
lbl_802F3DA8:
	.incbin "baserom.dol", 0x1ED7C8, 0x8
.global lbl_802F3DB0
lbl_802F3DB0:
	.incbin "baserom.dol", 0x1ED7D0, 0x8
.global lbl_802F3DB8
lbl_802F3DB8:
	.incbin "baserom.dol", 0x1ED7D8, 0x8
.global lbl_802F3DC0
lbl_802F3DC0:
	.incbin "baserom.dol", 0x1ED7E0, 0x8
.global lbl_802F3DC8
lbl_802F3DC8:
	.incbin "baserom.dol", 0x1ED7E8, 0x8
.global lbl_802F3DD0
lbl_802F3DD0:
	.incbin "baserom.dol", 0x1ED7F0, 0x8
.global lbl_802F3DD8
lbl_802F3DD8:
	.incbin "baserom.dol", 0x1ED7F8, 0x8
.global lbl_802F3DE0
lbl_802F3DE0:
	.incbin "baserom.dol", 0x1ED800, 0x8
.global lbl_802F3DE8
lbl_802F3DE8:
	.incbin "baserom.dol", 0x1ED808, 0x8
.global lbl_802F3DF0
lbl_802F3DF0:
	.incbin "baserom.dol", 0x1ED810, 0x4
.global lbl_802F3DF4
lbl_802F3DF4:
	.incbin "baserom.dol", 0x1ED814, 0x4
.global lbl_802F3DF8
lbl_802F3DF8:
	.incbin "baserom.dol", 0x1ED818, 0x8
.global lbl_802F3E00
lbl_802F3E00:
	.incbin "baserom.dol", 0x1ED820, 0x8
.global lbl_802F3E08
lbl_802F3E08:
	.incbin "baserom.dol", 0x1ED828, 0x8
.global lbl_802F3E10
lbl_802F3E10:
	.incbin "baserom.dol", 0x1ED830, 0x8
.global lbl_802F3E18
lbl_802F3E18:
	.incbin "baserom.dol", 0x1ED838, 0x8
.global lbl_802F3E20
lbl_802F3E20:
	.incbin "baserom.dol", 0x1ED840, 0x8
.global lbl_802F3E28
lbl_802F3E28:
	.incbin "baserom.dol", 0x1ED848, 0x8
.global lbl_802F3E30
lbl_802F3E30:
	.incbin "baserom.dol", 0x1ED850, 0x8
.global lbl_802F3E38
lbl_802F3E38:
	.incbin "baserom.dol", 0x1ED858, 0x8
.global lbl_802F3E40
lbl_802F3E40:
	.incbin "baserom.dol", 0x1ED860, 0x8
.global lbl_802F3E48
lbl_802F3E48:
	.incbin "baserom.dol", 0x1ED868, 0x8
.global lbl_802F3E50
lbl_802F3E50:
	.incbin "baserom.dol", 0x1ED870, 0x8
.global lbl_802F3E58
lbl_802F3E58:
	.incbin "baserom.dol", 0x1ED878, 0x8
.global lbl_802F3E60
lbl_802F3E60:
	.incbin "baserom.dol", 0x1ED880, 0x8
.global lbl_802F3E68
lbl_802F3E68:
	.incbin "baserom.dol", 0x1ED888, 0x8
.global lbl_802F3E70
lbl_802F3E70:
	.incbin "baserom.dol", 0x1ED890, 0x8
.global lbl_802F3E78
lbl_802F3E78:
	.incbin "baserom.dol", 0x1ED898, 0x8
.global lbl_802F3E80
lbl_802F3E80:
	.incbin "baserom.dol", 0x1ED8A0, 0x8
.global lbl_802F3E88
lbl_802F3E88:
	.incbin "baserom.dol", 0x1ED8A8, 0x8
.global lbl_802F3E90
lbl_802F3E90:
	.incbin "baserom.dol", 0x1ED8B0, 0x8
.global lbl_802F3E98
lbl_802F3E98:
	.incbin "baserom.dol", 0x1ED8B8, 0x8
.global lbl_802F3EA0
lbl_802F3EA0:
	.incbin "baserom.dol", 0x1ED8C0, 0x8
.global lbl_802F3EA8
lbl_802F3EA8:
	.incbin "baserom.dol", 0x1ED8C8, 0x8
.global lbl_802F3EB0
lbl_802F3EB0:
	.incbin "baserom.dol", 0x1ED8D0, 0x8
.global lbl_802F3EB8
lbl_802F3EB8:
	.incbin "baserom.dol", 0x1ED8D8, 0x8
.global lbl_802F3EC0
lbl_802F3EC0:
	.incbin "baserom.dol", 0x1ED8E0, 0x8
.global lbl_802F3EC8
lbl_802F3EC8:
	.incbin "baserom.dol", 0x1ED8E8, 0x8
.global lbl_802F3ED0
lbl_802F3ED0:
	.incbin "baserom.dol", 0x1ED8F0, 0x8
.global lbl_802F3ED8
lbl_802F3ED8:
	.incbin "baserom.dol", 0x1ED8F8, 0x8
.global lbl_802F3EE0
lbl_802F3EE0:
	.incbin "baserom.dol", 0x1ED900, 0x8
.global lbl_802F3EE8
lbl_802F3EE8:
	.incbin "baserom.dol", 0x1ED908, 0x8
.global lbl_802F3EF0
lbl_802F3EF0:
	.incbin "baserom.dol", 0x1ED910, 0x8
.global lbl_802F3EF8
lbl_802F3EF8:
	.incbin "baserom.dol", 0x1ED918, 0x8
.global lbl_802F3F00
lbl_802F3F00:
	.incbin "baserom.dol", 0x1ED920, 0x4
.global lbl_802F3F04
lbl_802F3F04:
	.incbin "baserom.dol", 0x1ED924, 0x4
.global lbl_802F3F08
lbl_802F3F08:
	.incbin "baserom.dol", 0x1ED928, 0x8
.global lbl_802F3F10
lbl_802F3F10:
	.incbin "baserom.dol", 0x1ED930, 0x8
.global lbl_802F3F18
lbl_802F3F18:
	.incbin "baserom.dol", 0x1ED938, 0x8
.global lbl_802F3F20
lbl_802F3F20:
	.incbin "baserom.dol", 0x1ED940, 0x8
.global lbl_802F3F28
lbl_802F3F28:
	.incbin "baserom.dol", 0x1ED948, 0x8
.global lbl_802F3F30
lbl_802F3F30:
	.incbin "baserom.dol", 0x1ED950, 0x8
.global lbl_802F3F38
lbl_802F3F38:
	.incbin "baserom.dol", 0x1ED958, 0x8
.global lbl_802F3F40
lbl_802F3F40:
	.incbin "baserom.dol", 0x1ED960, 0x8
.global lbl_802F3F48
lbl_802F3F48:
	.incbin "baserom.dol", 0x1ED968, 0x8
.global lbl_802F3F50
lbl_802F3F50:
	.incbin "baserom.dol", 0x1ED970, 0x8
.global lbl_802F3F58
lbl_802F3F58:
	.incbin "baserom.dol", 0x1ED978, 0x8
.global lbl_802F3F60
lbl_802F3F60:
	.incbin "baserom.dol", 0x1ED980, 0x8
.global lbl_802F3F68
lbl_802F3F68:
	.incbin "baserom.dol", 0x1ED988, 0x8
.global lbl_802F3F70
lbl_802F3F70:
	.incbin "baserom.dol", 0x1ED990, 0x4
.global lbl_802F3F74
lbl_802F3F74:
	.incbin "baserom.dol", 0x1ED994, 0x4
.global lbl_802F3F78
lbl_802F3F78:
	.incbin "baserom.dol", 0x1ED998, 0x4
.global lbl_802F3F7C
lbl_802F3F7C:
	.incbin "baserom.dol", 0x1ED99C, 0x4
.global lbl_802F3F80
lbl_802F3F80:
	.incbin "baserom.dol", 0x1ED9A0, 0x8
.global lbl_802F3F88
lbl_802F3F88:
	.incbin "baserom.dol", 0x1ED9A8, 0x8
.global lbl_802F3F90
lbl_802F3F90:
	.incbin "baserom.dol", 0x1ED9B0, 0x8
.global lbl_802F3F98
lbl_802F3F98:
	.incbin "baserom.dol", 0x1ED9B8, 0x8
.global lbl_802F3FA0
lbl_802F3FA0:
	.incbin "baserom.dol", 0x1ED9C0, 0x8
.global lbl_802F3FA8
lbl_802F3FA8:
	.incbin "baserom.dol", 0x1ED9C8, 0x8
.global lbl_802F3FB0
lbl_802F3FB0:
	.incbin "baserom.dol", 0x1ED9D0, 0x8
.global lbl_802F3FB8
lbl_802F3FB8:
	.incbin "baserom.dol", 0x1ED9D8, 0x8
.global lbl_802F3FC0
lbl_802F3FC0:
	.incbin "baserom.dol", 0x1ED9E0, 0x4
.global lbl_802F3FC4
lbl_802F3FC4:
	.incbin "baserom.dol", 0x1ED9E4, 0x4
.global lbl_802F3FC8
lbl_802F3FC8:
	.incbin "baserom.dol", 0x1ED9E8, 0x8
.global lbl_802F3FD0
lbl_802F3FD0:
	.incbin "baserom.dol", 0x1ED9F0, 0x8
.global lbl_802F3FD8
lbl_802F3FD8:
	.incbin "baserom.dol", 0x1ED9F8, 0x8
.global lbl_802F3FE0
lbl_802F3FE0:
	.incbin "baserom.dol", 0x1EDA00, 0x8
.global lbl_802F3FE8
lbl_802F3FE8:
	.incbin "baserom.dol", 0x1EDA08, 0x8
.global lbl_802F3FF0
lbl_802F3FF0:
	.incbin "baserom.dol", 0x1EDA10, 0x8
.global lbl_802F3FF8
lbl_802F3FF8:
	.incbin "baserom.dol", 0x1EDA18, 0x8
.global lbl_802F4000
lbl_802F4000:
	.incbin "baserom.dol", 0x1EDA20, 0x4
.global lbl_802F4004
lbl_802F4004:
	.incbin "baserom.dol", 0x1EDA24, 0x4
.global lbl_802F4008
lbl_802F4008:
	.incbin "baserom.dol", 0x1EDA28, 0x8
.global lbl_802F4010
lbl_802F4010:
	.incbin "baserom.dol", 0x1EDA30, 0x8
.global lbl_802F4018
lbl_802F4018:
	.incbin "baserom.dol", 0x1EDA38, 0x8
.global lbl_802F4020
lbl_802F4020:
	.incbin "baserom.dol", 0x1EDA40, 0x8
.global lbl_802F4028
lbl_802F4028:
	.incbin "baserom.dol", 0x1EDA48, 0x8
.global lbl_802F4030
lbl_802F4030:
	.incbin "baserom.dol", 0x1EDA50, 0x8
.global lbl_802F4038
lbl_802F4038:
	.incbin "baserom.dol", 0x1EDA58, 0x8
.global lbl_802F4040
lbl_802F4040:
	.incbin "baserom.dol", 0x1EDA60, 0x8
.global lbl_802F4048
lbl_802F4048:
	.incbin "baserom.dol", 0x1EDA68, 0x4
.global lbl_802F404C
lbl_802F404C:
	.incbin "baserom.dol", 0x1EDA6C, 0x4
.global lbl_802F4050
lbl_802F4050:
	.incbin "baserom.dol", 0x1EDA70, 0x8
.global lbl_802F4058
lbl_802F4058:
	.incbin "baserom.dol", 0x1EDA78, 0x8
.global lbl_802F4060
lbl_802F4060:
	.incbin "baserom.dol", 0x1EDA80, 0x8
.global lbl_802F4068
lbl_802F4068:
	.incbin "baserom.dol", 0x1EDA88, 0x8
.global lbl_802F4070
lbl_802F4070:
	.incbin "baserom.dol", 0x1EDA90, 0x8
.global lbl_802F4078
lbl_802F4078:
	.incbin "baserom.dol", 0x1EDA98, 0x8
.global lbl_802F4080
lbl_802F4080:
	.incbin "baserom.dol", 0x1EDAA0, 0x8
.global lbl_802F4088
lbl_802F4088:
	.incbin "baserom.dol", 0x1EDAA8, 0x4
.global lbl_802F408C
lbl_802F408C:
	.incbin "baserom.dol", 0x1EDAAC, 0x4
.global lbl_802F4090
lbl_802F4090:
	.incbin "baserom.dol", 0x1EDAB0, 0x8
.global lbl_802F4098
lbl_802F4098:
	.incbin "baserom.dol", 0x1EDAB8, 0x8
.global lbl_802F40A0
lbl_802F40A0:
	.incbin "baserom.dol", 0x1EDAC0, 0x8
.global lbl_802F40A8
lbl_802F40A8:
	.incbin "baserom.dol", 0x1EDAC8, 0x8
.global lbl_802F40B0
lbl_802F40B0:
	.incbin "baserom.dol", 0x1EDAD0, 0x8
.global lbl_802F40B8
lbl_802F40B8:
	.incbin "baserom.dol", 0x1EDAD8, 0x8
.global lbl_802F40C0
lbl_802F40C0:
	.incbin "baserom.dol", 0x1EDAE0, 0x4
.global lbl_802F40C4
lbl_802F40C4:
	.incbin "baserom.dol", 0x1EDAE4, 0x4
.global lbl_802F40C8
lbl_802F40C8:
	.incbin "baserom.dol", 0x1EDAE8, 0x4
.global lbl_802F40CC
lbl_802F40CC:
	.incbin "baserom.dol", 0x1EDAEC, 0x4
.global lbl_802F40D0
lbl_802F40D0:
	.incbin "baserom.dol", 0x1EDAF0, 0x8
.global lbl_802F40D8
lbl_802F40D8:
	.incbin "baserom.dol", 0x1EDAF8, 0x8
.global lbl_802F40E0
lbl_802F40E0:
	.incbin "baserom.dol", 0x1EDB00, 0x8
.global lbl_802F40E8
lbl_802F40E8:
	.incbin "baserom.dol", 0x1EDB08, 0x8
.global lbl_802F40F0
lbl_802F40F0:
	.incbin "baserom.dol", 0x1EDB10, 0x4
.global lbl_802F40F4
lbl_802F40F4:
	.incbin "baserom.dol", 0x1EDB14, 0x4
.global lbl_802F40F8
lbl_802F40F8:
	.incbin "baserom.dol", 0x1EDB18, 0x4
.global lbl_802F40FC
lbl_802F40FC:
	.incbin "baserom.dol", 0x1EDB1C, 0x4
.global lbl_802F4100
lbl_802F4100:
	.incbin "baserom.dol", 0x1EDB20, 0x8
.global lbl_802F4108
lbl_802F4108:
	.incbin "baserom.dol", 0x1EDB28, 0x8
.global lbl_802F4110
lbl_802F4110:
	.incbin "baserom.dol", 0x1EDB30, 0x8
.global lbl_802F4118
lbl_802F4118:
	.incbin "baserom.dol", 0x1EDB38, 0x8
.global lbl_802F4120
lbl_802F4120:
	.incbin "baserom.dol", 0x1EDB40, 0x8
.global lbl_802F4128
lbl_802F4128:
	.incbin "baserom.dol", 0x1EDB48, 0x8
.global lbl_802F4130
lbl_802F4130:
	.incbin "baserom.dol", 0x1EDB50, 0x8
.global lbl_802F4138
lbl_802F4138:
	.incbin "baserom.dol", 0x1EDB58, 0x8
.global lbl_802F4140
lbl_802F4140:
	.incbin "baserom.dol", 0x1EDB60, 0x8
.global lbl_802F4148
lbl_802F4148:
	.incbin "baserom.dol", 0x1EDB68, 0x8
.global lbl_802F4150
lbl_802F4150:
	.incbin "baserom.dol", 0x1EDB70, 0x4
.global lbl_802F4154
lbl_802F4154:
	.incbin "baserom.dol", 0x1EDB74, 0x4
.global lbl_802F4158
lbl_802F4158:
	.incbin "baserom.dol", 0x1EDB78, 0x8
.global lbl_802F4160
lbl_802F4160:
	.incbin "baserom.dol", 0x1EDB80, 0x8
.global lbl_802F4168
lbl_802F4168:
	.incbin "baserom.dol", 0x1EDB88, 0x8
.global lbl_802F4170
lbl_802F4170:
	.incbin "baserom.dol", 0x1EDB90, 0x8
.global lbl_802F4178
lbl_802F4178:
	.incbin "baserom.dol", 0x1EDB98, 0x8
.global lbl_802F4180
lbl_802F4180:
	.incbin "baserom.dol", 0x1EDBA0, 0x8
.global lbl_802F4188
lbl_802F4188:
	.incbin "baserom.dol", 0x1EDBA8, 0x8
.global lbl_802F4190
lbl_802F4190:
	.incbin "baserom.dol", 0x1EDBB0, 0x8
.global lbl_802F4198
lbl_802F4198:
	.incbin "baserom.dol", 0x1EDBB8, 0x8
.global lbl_802F41A0
lbl_802F41A0:
	.incbin "baserom.dol", 0x1EDBC0, 0x8
.global lbl_802F41A8
lbl_802F41A8:
	.incbin "baserom.dol", 0x1EDBC8, 0x8
.global lbl_802F41B0
lbl_802F41B0:
	.incbin "baserom.dol", 0x1EDBD0, 0x8
.global lbl_802F41B8
lbl_802F41B8:
	.incbin "baserom.dol", 0x1EDBD8, 0x8
.global lbl_802F41C0
lbl_802F41C0:
	.incbin "baserom.dol", 0x1EDBE0, 0x8
.global lbl_802F41C8
lbl_802F41C8:
	.incbin "baserom.dol", 0x1EDBE8, 0x8
.global lbl_802F41D0
lbl_802F41D0:
	.incbin "baserom.dol", 0x1EDBF0, 0x8
.global lbl_802F41D8
lbl_802F41D8:
	.incbin "baserom.dol", 0x1EDBF8, 0x8
.global lbl_802F41E0
lbl_802F41E0:
	.incbin "baserom.dol", 0x1EDC00, 0x4
.global lbl_802F41E4
lbl_802F41E4:
	.incbin "baserom.dol", 0x1EDC04, 0x4
.global lbl_802F41E8
lbl_802F41E8:
	.incbin "baserom.dol", 0x1EDC08, 0x8
.global lbl_802F41F0
lbl_802F41F0:
	.incbin "baserom.dol", 0x1EDC10, 0x4
.global lbl_802F41F4
lbl_802F41F4:
	.incbin "baserom.dol", 0x1EDC14, 0x4
.global lbl_802F41F8
lbl_802F41F8:
	.incbin "baserom.dol", 0x1EDC18, 0x4
.global lbl_802F41FC
lbl_802F41FC:
	.incbin "baserom.dol", 0x1EDC1C, 0x4
.global lbl_802F4200
lbl_802F4200:
	.incbin "baserom.dol", 0x1EDC20, 0x4
.global lbl_802F4204
lbl_802F4204:
	.incbin "baserom.dol", 0x1EDC24, 0x4
.global lbl_802F4208
lbl_802F4208:
	.incbin "baserom.dol", 0x1EDC28, 0x4
.global lbl_802F420C
lbl_802F420C:
	.incbin "baserom.dol", 0x1EDC2C, 0x4
.global lbl_802F4210
lbl_802F4210:
	.incbin "baserom.dol", 0x1EDC30, 0x8
.global lbl_802F4218
lbl_802F4218:
	.incbin "baserom.dol", 0x1EDC38, 0x8
.global lbl_802F4220
lbl_802F4220:
	.incbin "baserom.dol", 0x1EDC40, 0x4
.global lbl_802F4224
lbl_802F4224:
	.incbin "baserom.dol", 0x1EDC44, 0x4
.global lbl_802F4228
lbl_802F4228:
	.incbin "baserom.dol", 0x1EDC48, 0x4
.global lbl_802F422C
lbl_802F422C:
	.incbin "baserom.dol", 0x1EDC4C, 0x4
.global lbl_802F4230
lbl_802F4230:
	.incbin "baserom.dol", 0x1EDC50, 0x4
.global lbl_802F4234
lbl_802F4234:
	.incbin "baserom.dol", 0x1EDC54, 0x4
.global lbl_802F4238
lbl_802F4238:
	.incbin "baserom.dol", 0x1EDC58, 0x4
.global lbl_802F423C
lbl_802F423C:
	.incbin "baserom.dol", 0x1EDC5C, 0x4
.global lbl_802F4240
lbl_802F4240:
	.incbin "baserom.dol", 0x1EDC60, 0x4
.global lbl_802F4244
lbl_802F4244:
	.incbin "baserom.dol", 0x1EDC64, 0x4
.global lbl_802F4248
lbl_802F4248:
	.incbin "baserom.dol", 0x1EDC68, 0x4
.global lbl_802F424C
lbl_802F424C:
	.incbin "baserom.dol", 0x1EDC6C, 0x4
.global lbl_802F4250
lbl_802F4250:
	.incbin "baserom.dol", 0x1EDC70, 0x4
.global lbl_802F4254
lbl_802F4254:
	.incbin "baserom.dol", 0x1EDC74, 0x4
.global lbl_802F4258
lbl_802F4258:
	.incbin "baserom.dol", 0x1EDC78, 0x4
.global lbl_802F425C
lbl_802F425C:
	.incbin "baserom.dol", 0x1EDC7C, 0x4
.global lbl_802F4260
lbl_802F4260:
	.incbin "baserom.dol", 0x1EDC80, 0x4
.global lbl_802F4264
lbl_802F4264:
	.incbin "baserom.dol", 0x1EDC84, 0x4
.global lbl_802F4268
lbl_802F4268:
	.incbin "baserom.dol", 0x1EDC88, 0x4
.global lbl_802F426C
lbl_802F426C:
	.incbin "baserom.dol", 0x1EDC8C, 0x4
.global lbl_802F4270
lbl_802F4270:
	.incbin "baserom.dol", 0x1EDC90, 0x8
.global lbl_802F4278
lbl_802F4278:
	.incbin "baserom.dol", 0x1EDC98, 0x4
.global lbl_802F427C
lbl_802F427C:
	.incbin "baserom.dol", 0x1EDC9C, 0x4
.global lbl_802F4280
lbl_802F4280:
	.incbin "baserom.dol", 0x1EDCA0, 0x4
.global lbl_802F4284
lbl_802F4284:
	.incbin "baserom.dol", 0x1EDCA4, 0x4
.global lbl_802F4288
lbl_802F4288:
	.incbin "baserom.dol", 0x1EDCA8, 0x4
.global lbl_802F428C
lbl_802F428C:
	.incbin "baserom.dol", 0x1EDCAC, 0x4
.global lbl_802F4290
lbl_802F4290:
	.incbin "baserom.dol", 0x1EDCB0, 0x8
.global lbl_802F4298
lbl_802F4298:
	.incbin "baserom.dol", 0x1EDCB8, 0x8
.global lbl_802F42A0
lbl_802F42A0:
	.incbin "baserom.dol", 0x1EDCC0, 0x4
.global lbl_802F42A4
lbl_802F42A4:
	.incbin "baserom.dol", 0x1EDCC4, 0x4
.global lbl_802F42A8
lbl_802F42A8:
	.incbin "baserom.dol", 0x1EDCC8, 0x4
.global lbl_802F42AC
lbl_802F42AC:
	.incbin "baserom.dol", 0x1EDCCC, 0x4
.global lbl_802F42B0
lbl_802F42B0:
	.incbin "baserom.dol", 0x1EDCD0, 0x4
.global lbl_802F42B4
lbl_802F42B4:
	.incbin "baserom.dol", 0x1EDCD4, 0x4
.global lbl_802F42B8
lbl_802F42B8:
	.incbin "baserom.dol", 0x1EDCD8, 0x4
.global lbl_802F42BC
lbl_802F42BC:
	.incbin "baserom.dol", 0x1EDCDC, 0x4
.global lbl_802F42C0
lbl_802F42C0:
	.incbin "baserom.dol", 0x1EDCE0, 0x8
.global lbl_802F42C8
lbl_802F42C8:
	.incbin "baserom.dol", 0x1EDCE8, 0x4
.global lbl_802F42CC
lbl_802F42CC:
	.incbin "baserom.dol", 0x1EDCEC, 0x4
.global lbl_802F42D0
lbl_802F42D0:
	.incbin "baserom.dol", 0x1EDCF0, 0x4
.global lbl_802F42D4
lbl_802F42D4:
	.incbin "baserom.dol", 0x1EDCF4, 0x4
.global lbl_802F42D8
lbl_802F42D8:
	.incbin "baserom.dol", 0x1EDCF8, 0x4
.global lbl_802F42DC
lbl_802F42DC:
	.incbin "baserom.dol", 0x1EDCFC, 0x4
.global lbl_802F42E0
lbl_802F42E0:
	.incbin "baserom.dol", 0x1EDD00, 0x8
.global lbl_802F42E8
lbl_802F42E8:
	.incbin "baserom.dol", 0x1EDD08, 0x4
.global lbl_802F42EC
lbl_802F42EC:
	.incbin "baserom.dol", 0x1EDD0C, 0x4
.global lbl_802F42F0
lbl_802F42F0:
	.incbin "baserom.dol", 0x1EDD10, 0x8
.global lbl_802F42F8
lbl_802F42F8:
	.incbin "baserom.dol", 0x1EDD18, 0x8
.global lbl_802F4300
lbl_802F4300:
	.incbin "baserom.dol", 0x1EDD20, 0x4
.global lbl_802F4304
lbl_802F4304:
	.incbin "baserom.dol", 0x1EDD24, 0x4
.global lbl_802F4308
lbl_802F4308:
	.incbin "baserom.dol", 0x1EDD28, 0x4
.global lbl_802F430C
lbl_802F430C:
	.incbin "baserom.dol", 0x1EDD2C, 0x4
.global lbl_802F4310
lbl_802F4310:
	.incbin "baserom.dol", 0x1EDD30, 0x4
.global lbl_802F4314
lbl_802F4314:
	.incbin "baserom.dol", 0x1EDD34, 0x4
.global lbl_802F4318
lbl_802F4318:
	.incbin "baserom.dol", 0x1EDD38, 0x4
.global lbl_802F431C
lbl_802F431C:
	.incbin "baserom.dol", 0x1EDD3C, 0x4
.global lbl_802F4320
lbl_802F4320:
	.incbin "baserom.dol", 0x1EDD40, 0x4
.global lbl_802F4324
lbl_802F4324:
	.incbin "baserom.dol", 0x1EDD44, 0x4
.global lbl_802F4328
lbl_802F4328:
	.incbin "baserom.dol", 0x1EDD48, 0x4
.global lbl_802F432C
lbl_802F432C:
	.incbin "baserom.dol", 0x1EDD4C, 0x4
.global lbl_802F4330
lbl_802F4330:
	.incbin "baserom.dol", 0x1EDD50, 0x8
.global lbl_802F4338
lbl_802F4338:
	.incbin "baserom.dol", 0x1EDD58, 0x4
.global lbl_802F433C
lbl_802F433C:
	.incbin "baserom.dol", 0x1EDD5C, 0x4
.global lbl_802F4340
lbl_802F4340:
	.incbin "baserom.dol", 0x1EDD60, 0x4
.global lbl_802F4344
lbl_802F4344:
	.incbin "baserom.dol", 0x1EDD64, 0x4
.global lbl_802F4348
lbl_802F4348:
	.incbin "baserom.dol", 0x1EDD68, 0x4
.global lbl_802F434C
lbl_802F434C:
	.incbin "baserom.dol", 0x1EDD6C, 0x4
.global lbl_802F4350
lbl_802F4350:
	.incbin "baserom.dol", 0x1EDD70, 0x4
.global lbl_802F4354
lbl_802F4354:
	.incbin "baserom.dol", 0x1EDD74, 0x4
.global lbl_802F4358
lbl_802F4358:
	.incbin "baserom.dol", 0x1EDD78, 0x4
.global lbl_802F435C
lbl_802F435C:
	.incbin "baserom.dol", 0x1EDD7C, 0x4
.global lbl_802F4360
lbl_802F4360:
	.incbin "baserom.dol", 0x1EDD80, 0x4
.global lbl_802F4364
lbl_802F4364:
	.incbin "baserom.dol", 0x1EDD84, 0x4
.global lbl_802F4368
lbl_802F4368:
	.incbin "baserom.dol", 0x1EDD88, 0x4
.global lbl_802F436C
lbl_802F436C:
	.incbin "baserom.dol", 0x1EDD8C, 0x4
.global lbl_802F4370
lbl_802F4370:
	.incbin "baserom.dol", 0x1EDD90, 0x4
.global lbl_802F4374
lbl_802F4374:
	.incbin "baserom.dol", 0x1EDD94, 0x4
.global lbl_802F4378
lbl_802F4378:
	.incbin "baserom.dol", 0x1EDD98, 0x4
.global lbl_802F437C
lbl_802F437C:
	.incbin "baserom.dol", 0x1EDD9C, 0x4
.global lbl_802F4380
lbl_802F4380:
	.incbin "baserom.dol", 0x1EDDA0, 0x4
.global lbl_802F4384
lbl_802F4384:
	.incbin "baserom.dol", 0x1EDDA4, 0x4
.global lbl_802F4388
lbl_802F4388:
	.incbin "baserom.dol", 0x1EDDA8, 0x4
.global lbl_802F438C
lbl_802F438C:
	.incbin "baserom.dol", 0x1EDDAC, 0x4
.global lbl_802F4390
lbl_802F4390:
	.incbin "baserom.dol", 0x1EDDB0, 0x4
.global lbl_802F4394
lbl_802F4394:
	.incbin "baserom.dol", 0x1EDDB4, 0x4
.global lbl_802F4398
lbl_802F4398:
	.incbin "baserom.dol", 0x1EDDB8, 0x4
.global lbl_802F439C
lbl_802F439C:
	.incbin "baserom.dol", 0x1EDDBC, 0x4
.global lbl_802F43A0
lbl_802F43A0:
	.incbin "baserom.dol", 0x1EDDC0, 0x4
.global lbl_802F43A4
lbl_802F43A4:
	.incbin "baserom.dol", 0x1EDDC4, 0x4
.global lbl_802F43A8
lbl_802F43A8:
	.incbin "baserom.dol", 0x1EDDC8, 0x4
.global lbl_802F43AC
lbl_802F43AC:
	.incbin "baserom.dol", 0x1EDDCC, 0x4
.global lbl_802F43B0
lbl_802F43B0:
	.incbin "baserom.dol", 0x1EDDD0, 0x4
.global lbl_802F43B4
lbl_802F43B4:
	.incbin "baserom.dol", 0x1EDDD4, 0x4
.global lbl_802F43B8
lbl_802F43B8:
	.incbin "baserom.dol", 0x1EDDD8, 0x8
.global lbl_802F43C0
lbl_802F43C0:
	.incbin "baserom.dol", 0x1EDDE0, 0x8
.global lbl_802F43C8
lbl_802F43C8:
	.incbin "baserom.dol", 0x1EDDE8, 0x8
.global lbl_802F43D0
lbl_802F43D0:
	.incbin "baserom.dol", 0x1EDDF0, 0x4
.global lbl_802F43D4
lbl_802F43D4:
	.incbin "baserom.dol", 0x1EDDF4, 0x4
.global lbl_802F43D8
lbl_802F43D8:
	.incbin "baserom.dol", 0x1EDDF8, 0x4
.global lbl_802F43DC
lbl_802F43DC:
	.incbin "baserom.dol", 0x1EDDFC, 0x4
.global lbl_802F43E0
lbl_802F43E0:
	.incbin "baserom.dol", 0x1EDE00, 0x4
.global lbl_802F43E4
lbl_802F43E4:
	.incbin "baserom.dol", 0x1EDE04, 0x4
.global lbl_802F43E8
lbl_802F43E8:
	.incbin "baserom.dol", 0x1EDE08, 0x8
.global lbl_802F43F0
lbl_802F43F0:
	.incbin "baserom.dol", 0x1EDE10, 0x4
.global lbl_802F43F4
lbl_802F43F4:
	.incbin "baserom.dol", 0x1EDE14, 0x4
.global lbl_802F43F8
lbl_802F43F8:
	.incbin "baserom.dol", 0x1EDE18, 0x8
.global lbl_802F4400
lbl_802F4400:
	.incbin "baserom.dol", 0x1EDE20, 0x4
.global lbl_802F4404
lbl_802F4404:
	.incbin "baserom.dol", 0x1EDE24, 0x4
.global lbl_802F4408
lbl_802F4408:
	.incbin "baserom.dol", 0x1EDE28, 0x4
.global lbl_802F440C
lbl_802F440C:
	.incbin "baserom.dol", 0x1EDE2C, 0x4
.global lbl_802F4410
lbl_802F4410:
	.incbin "baserom.dol", 0x1EDE30, 0x8
.global lbl_802F4418
lbl_802F4418:
	.incbin "baserom.dol", 0x1EDE38, 0x8
.global lbl_802F4420
lbl_802F4420:
	.incbin "baserom.dol", 0x1EDE40, 0x4
.global lbl_802F4424
lbl_802F4424:
	.incbin "baserom.dol", 0x1EDE44, 0x4
.global lbl_802F4428
lbl_802F4428:
	.incbin "baserom.dol", 0x1EDE48, 0x8
.global lbl_802F4430
lbl_802F4430:
	.incbin "baserom.dol", 0x1EDE50, 0x4
.global lbl_802F4434
lbl_802F4434:
	.incbin "baserom.dol", 0x1EDE54, 0x4
.global lbl_802F4438
lbl_802F4438:
	.incbin "baserom.dol", 0x1EDE58, 0x4
.global lbl_802F443C
lbl_802F443C:
	.incbin "baserom.dol", 0x1EDE5C, 0x4
.global lbl_802F4440
lbl_802F4440:
	.incbin "baserom.dol", 0x1EDE60, 0x8
.global lbl_802F4448
lbl_802F4448:
	.incbin "baserom.dol", 0x1EDE68, 0x8
.global lbl_802F4450
lbl_802F4450:
	.incbin "baserom.dol", 0x1EDE70, 0x4
.global lbl_802F4454
lbl_802F4454:
	.incbin "baserom.dol", 0x1EDE74, 0x4
.global lbl_802F4458
lbl_802F4458:
	.incbin "baserom.dol", 0x1EDE78, 0x4
.global lbl_802F445C
lbl_802F445C:
	.incbin "baserom.dol", 0x1EDE7C, 0x4
.global lbl_802F4460
lbl_802F4460:
	.incbin "baserom.dol", 0x1EDE80, 0x4
.global lbl_802F4464
lbl_802F4464:
	.incbin "baserom.dol", 0x1EDE84, 0x4
.global lbl_802F4468
lbl_802F4468:
	.incbin "baserom.dol", 0x1EDE88, 0x4
.global lbl_802F446C
lbl_802F446C:
	.incbin "baserom.dol", 0x1EDE8C, 0x4
.global lbl_802F4470
lbl_802F4470:
	.incbin "baserom.dol", 0x1EDE90, 0x4
.global lbl_802F4474
lbl_802F4474:
	.incbin "baserom.dol", 0x1EDE94, 0x4
.global lbl_802F4478
lbl_802F4478:
	.incbin "baserom.dol", 0x1EDE98, 0x4
.global lbl_802F447C
lbl_802F447C:
	.incbin "baserom.dol", 0x1EDE9C, 0x4
.global lbl_802F4480
lbl_802F4480:
	.incbin "baserom.dol", 0x1EDEA0, 0x4
.global lbl_802F4484
lbl_802F4484:
	.incbin "baserom.dol", 0x1EDEA4, 0x4
.global lbl_802F4488
lbl_802F4488:
	.incbin "baserom.dol", 0x1EDEA8, 0x4
.global lbl_802F448C
lbl_802F448C:
	.incbin "baserom.dol", 0x1EDEAC, 0x4
.global lbl_802F4490
lbl_802F4490:
	.incbin "baserom.dol", 0x1EDEB0, 0x4
.global lbl_802F4494
lbl_802F4494:
	.incbin "baserom.dol", 0x1EDEB4, 0x4
.global lbl_802F4498
lbl_802F4498:
	.incbin "baserom.dol", 0x1EDEB8, 0x4
.global lbl_802F449C
lbl_802F449C:
	.incbin "baserom.dol", 0x1EDEBC, 0x4
.global lbl_802F44A0
lbl_802F44A0:
	.incbin "baserom.dol", 0x1EDEC0, 0x4
.global lbl_802F44A4
lbl_802F44A4:
	.incbin "baserom.dol", 0x1EDEC4, 0x4
.global lbl_802F44A8
lbl_802F44A8:
	.incbin "baserom.dol", 0x1EDEC8, 0x4
.global lbl_802F44AC
lbl_802F44AC:
	.incbin "baserom.dol", 0x1EDECC, 0x4
.global lbl_802F44B0
lbl_802F44B0:
	.incbin "baserom.dol", 0x1EDED0, 0x8
.global lbl_802F44B8
lbl_802F44B8:
	.incbin "baserom.dol", 0x1EDED8, 0x4
.global lbl_802F44BC
lbl_802F44BC:
	.incbin "baserom.dol", 0x1EDEDC, 0x4
.global lbl_802F44C0
lbl_802F44C0:
	.incbin "baserom.dol", 0x1EDEE0, 0x4
.global lbl_802F44C4
lbl_802F44C4:
	.incbin "baserom.dol", 0x1EDEE4, 0x4
.global lbl_802F44C8
lbl_802F44C8:
	.incbin "baserom.dol", 0x1EDEE8, 0x4
.global lbl_802F44CC
lbl_802F44CC:
	.incbin "baserom.dol", 0x1EDEEC, 0x4
.global lbl_802F44D0
lbl_802F44D0:
	.incbin "baserom.dol", 0x1EDEF0, 0x4
.global lbl_802F44D4
lbl_802F44D4:
	.incbin "baserom.dol", 0x1EDEF4, 0x4
.global lbl_802F44D8
lbl_802F44D8:
	.incbin "baserom.dol", 0x1EDEF8, 0x4
.global lbl_802F44DC
lbl_802F44DC:
	.incbin "baserom.dol", 0x1EDEFC, 0x4
.global lbl_802F44E0
lbl_802F44E0:
	.incbin "baserom.dol", 0x1EDF00, 0x8
.global lbl_802F44E8
lbl_802F44E8:
	.incbin "baserom.dol", 0x1EDF08, 0x4
.global lbl_802F44EC
lbl_802F44EC:
	.incbin "baserom.dol", 0x1EDF0C, 0x4
.global lbl_802F44F0
lbl_802F44F0:
	.incbin "baserom.dol", 0x1EDF10, 0x4
.global lbl_802F44F4
lbl_802F44F4:
	.incbin "baserom.dol", 0x1EDF14, 0x4
.global lbl_802F44F8
lbl_802F44F8:
	.incbin "baserom.dol", 0x1EDF18, 0x4
.global lbl_802F44FC
lbl_802F44FC:
	.incbin "baserom.dol", 0x1EDF1C, 0x4
.global lbl_802F4500
lbl_802F4500:
	.incbin "baserom.dol", 0x1EDF20, 0x4
.global lbl_802F4504
lbl_802F4504:
	.incbin "baserom.dol", 0x1EDF24, 0x4
.global lbl_802F4508
lbl_802F4508:
	.incbin "baserom.dol", 0x1EDF28, 0x4
.global lbl_802F450C
lbl_802F450C:
	.incbin "baserom.dol", 0x1EDF2C, 0x4
.global lbl_802F4510
lbl_802F4510:
	.incbin "baserom.dol", 0x1EDF30, 0x4
.global lbl_802F4514
lbl_802F4514:
	.incbin "baserom.dol", 0x1EDF34, 0x4
.global lbl_802F4518
lbl_802F4518:
	.incbin "baserom.dol", 0x1EDF38, 0x8
.global lbl_802F4520
lbl_802F4520:
	.incbin "baserom.dol", 0x1EDF40, 0x4
.global lbl_802F4524
lbl_802F4524:
	.incbin "baserom.dol", 0x1EDF44, 0x4
.global lbl_802F4528
lbl_802F4528:
	.incbin "baserom.dol", 0x1EDF48, 0x8
.global lbl_802F4530
lbl_802F4530:
	.incbin "baserom.dol", 0x1EDF50, 0x8
.global lbl_802F4538
lbl_802F4538:
	.incbin "baserom.dol", 0x1EDF58, 0x8
.global lbl_802F4540
lbl_802F4540:
	.incbin "baserom.dol", 0x1EDF60, 0x4
.global lbl_802F4544
lbl_802F4544:
	.incbin "baserom.dol", 0x1EDF64, 0x4
.global lbl_802F4548
lbl_802F4548:
	.incbin "baserom.dol", 0x1EDF68, 0x4
.global lbl_802F454C
lbl_802F454C:
	.incbin "baserom.dol", 0x1EDF6C, 0x4
.global lbl_802F4550
lbl_802F4550:
	.incbin "baserom.dol", 0x1EDF70, 0x4
.global lbl_802F4554
lbl_802F4554:
	.incbin "baserom.dol", 0x1EDF74, 0x4
.global lbl_802F4558
lbl_802F4558:
	.incbin "baserom.dol", 0x1EDF78, 0x4
.global lbl_802F455C
lbl_802F455C:
	.incbin "baserom.dol", 0x1EDF7C, 0x4
.global lbl_802F4560
lbl_802F4560:
	.incbin "baserom.dol", 0x1EDF80, 0x4
.global lbl_802F4564
lbl_802F4564:
	.incbin "baserom.dol", 0x1EDF84, 0x4
.global lbl_802F4568
lbl_802F4568:
	.incbin "baserom.dol", 0x1EDF88, 0x4
.global lbl_802F456C
lbl_802F456C:
	.incbin "baserom.dol", 0x1EDF8C, 0x4
.global lbl_802F4570
lbl_802F4570:
	.incbin "baserom.dol", 0x1EDF90, 0x4
.global lbl_802F4574
lbl_802F4574:
	.incbin "baserom.dol", 0x1EDF94, 0x4
.global lbl_802F4578
lbl_802F4578:
	.incbin "baserom.dol", 0x1EDF98, 0x4
.global lbl_802F457C
lbl_802F457C:
	.incbin "baserom.dol", 0x1EDF9C, 0x4
.global lbl_802F4580
lbl_802F4580:
	.incbin "baserom.dol", 0x1EDFA0, 0x4
.global lbl_802F4584
lbl_802F4584:
	.incbin "baserom.dol", 0x1EDFA4, 0x4
.global lbl_802F4588
lbl_802F4588:
	.incbin "baserom.dol", 0x1EDFA8, 0x4
.global lbl_802F458C
lbl_802F458C:
	.incbin "baserom.dol", 0x1EDFAC, 0x4
.global lbl_802F4590
lbl_802F4590:
	.incbin "baserom.dol", 0x1EDFB0, 0x4
.global lbl_802F4594
lbl_802F4594:
	.incbin "baserom.dol", 0x1EDFB4, 0x4
.global lbl_802F4598
lbl_802F4598:
	.incbin "baserom.dol", 0x1EDFB8, 0x4
.global lbl_802F459C
lbl_802F459C:
	.incbin "baserom.dol", 0x1EDFBC, 0x4
.global lbl_802F45A0
lbl_802F45A0:
	.incbin "baserom.dol", 0x1EDFC0, 0x4
.global lbl_802F45A4
lbl_802F45A4:
	.incbin "baserom.dol", 0x1EDFC4, 0x4
.global lbl_802F45A8
lbl_802F45A8:
	.incbin "baserom.dol", 0x1EDFC8, 0x4
.global lbl_802F45AC
lbl_802F45AC:
	.incbin "baserom.dol", 0x1EDFCC, 0x4
.global lbl_802F45B0
lbl_802F45B0:
	.incbin "baserom.dol", 0x1EDFD0, 0x8
.global lbl_802F45B8
lbl_802F45B8:
	.incbin "baserom.dol", 0x1EDFD8, 0x8
.global lbl_802F45C0
lbl_802F45C0:
	.incbin "baserom.dol", 0x1EDFE0, 0x4
.global lbl_802F45C4
lbl_802F45C4:
	.incbin "baserom.dol", 0x1EDFE4, 0x4
.global lbl_802F45C8
lbl_802F45C8:
	.incbin "baserom.dol", 0x1EDFE8, 0x8
.global lbl_802F45D0
lbl_802F45D0:
	.incbin "baserom.dol", 0x1EDFF0, 0x4
.global lbl_802F45D4
lbl_802F45D4:
	.incbin "baserom.dol", 0x1EDFF4, 0x4
.global lbl_802F45D8
lbl_802F45D8:
	.incbin "baserom.dol", 0x1EDFF8, 0x4
.global lbl_802F45DC
lbl_802F45DC:
	.incbin "baserom.dol", 0x1EDFFC, 0x4
.global lbl_802F45E0
lbl_802F45E0:
	.incbin "baserom.dol", 0x1EE000, 0x4
.global lbl_802F45E4
lbl_802F45E4:
	.incbin "baserom.dol", 0x1EE004, 0x4
.global lbl_802F45E8
lbl_802F45E8:
	.incbin "baserom.dol", 0x1EE008, 0x8
.global lbl_802F45F0
lbl_802F45F0:
	.incbin "baserom.dol", 0x1EE010, 0x8
.global lbl_802F45F8
lbl_802F45F8:
	.incbin "baserom.dol", 0x1EE018, 0x4
.global lbl_802F45FC
lbl_802F45FC:
	.incbin "baserom.dol", 0x1EE01C, 0x4
.global lbl_802F4600
lbl_802F4600:
	.incbin "baserom.dol", 0x1EE020, 0x4
.global lbl_802F4604
lbl_802F4604:
	.incbin "baserom.dol", 0x1EE024, 0x4
.global lbl_802F4608
lbl_802F4608:
	.incbin "baserom.dol", 0x1EE028, 0x8
.global lbl_802F4610
lbl_802F4610:
	.incbin "baserom.dol", 0x1EE030, 0x8
.global lbl_802F4618
lbl_802F4618:
	.incbin "baserom.dol", 0x1EE038, 0x4
.global lbl_802F461C
lbl_802F461C:
	.incbin "baserom.dol", 0x1EE03C, 0x4
.global lbl_802F4620
lbl_802F4620:
	.incbin "baserom.dol", 0x1EE040, 0x8
.global lbl_802F4628
lbl_802F4628:
	.incbin "baserom.dol", 0x1EE048, 0x4
.global lbl_802F462C
lbl_802F462C:
	.incbin "baserom.dol", 0x1EE04C, 0x4
.global lbl_802F4630
lbl_802F4630:
	.incbin "baserom.dol", 0x1EE050, 0x4
.global lbl_802F4634
lbl_802F4634:
	.incbin "baserom.dol", 0x1EE054, 0x4
.global lbl_802F4638
lbl_802F4638:
	.incbin "baserom.dol", 0x1EE058, 0x4
.global lbl_802F463C
lbl_802F463C:
	.incbin "baserom.dol", 0x1EE05C, 0x4
.global lbl_802F4640
lbl_802F4640:
	.incbin "baserom.dol", 0x1EE060, 0x4
.global lbl_802F4644
lbl_802F4644:
	.incbin "baserom.dol", 0x1EE064, 0x4
.global lbl_802F4648
lbl_802F4648:
	.incbin "baserom.dol", 0x1EE068, 0x8
.global lbl_802F4650
lbl_802F4650:
	.incbin "baserom.dol", 0x1EE070, 0x8
.global lbl_802F4658
lbl_802F4658:
	.incbin "baserom.dol", 0x1EE078, 0x8
.global lbl_802F4660
lbl_802F4660:
	.incbin "baserom.dol", 0x1EE080, 0x8
.global lbl_802F4668
lbl_802F4668:
	.incbin "baserom.dol", 0x1EE088, 0x4
.global lbl_802F466C
lbl_802F466C:
	.incbin "baserom.dol", 0x1EE08C, 0x4
.global lbl_802F4670
lbl_802F4670:
	.incbin "baserom.dol", 0x1EE090, 0x8
.global lbl_802F4678
lbl_802F4678:
	.incbin "baserom.dol", 0x1EE098, 0x8
.global lbl_802F4680
lbl_802F4680:
	.incbin "baserom.dol", 0x1EE0A0, 0x4
.global lbl_802F4684
lbl_802F4684:
	.incbin "baserom.dol", 0x1EE0A4, 0x4
.global lbl_802F4688
lbl_802F4688:
	.incbin "baserom.dol", 0x1EE0A8, 0x4
.global lbl_802F468C
lbl_802F468C:
	.incbin "baserom.dol", 0x1EE0AC, 0x4
.global lbl_802F4690
lbl_802F4690:
	.incbin "baserom.dol", 0x1EE0B0, 0x4
.global lbl_802F4694
lbl_802F4694:
	.incbin "baserom.dol", 0x1EE0B4, 0x4
.global lbl_802F4698
lbl_802F4698:
	.incbin "baserom.dol", 0x1EE0B8, 0x8
.global lbl_802F46A0
lbl_802F46A0:
	.incbin "baserom.dol", 0x1EE0C0, 0x4
.global lbl_802F46A4
lbl_802F46A4:
	.incbin "baserom.dol", 0x1EE0C4, 0x4
.global lbl_802F46A8
lbl_802F46A8:
	.incbin "baserom.dol", 0x1EE0C8, 0x8
.global lbl_802F46B0
lbl_802F46B0:
	.incbin "baserom.dol", 0x1EE0D0, 0x4
.global lbl_802F46B4
lbl_802F46B4:
	.incbin "baserom.dol", 0x1EE0D4, 0x4
.global lbl_802F46B8
lbl_802F46B8:
	.incbin "baserom.dol", 0x1EE0D8, 0x8
.global lbl_802F46C0
lbl_802F46C0:
	.incbin "baserom.dol", 0x1EE0E0, 0x8
.global lbl_802F46C8
lbl_802F46C8:
	.incbin "baserom.dol", 0x1EE0E8, 0x8
.global lbl_802F46D0
lbl_802F46D0:
	.incbin "baserom.dol", 0x1EE0F0, 0x4
.global lbl_802F46D4
lbl_802F46D4:
	.incbin "baserom.dol", 0x1EE0F4, 0x4
.global lbl_802F46D8
lbl_802F46D8:
	.incbin "baserom.dol", 0x1EE0F8, 0x8
.global lbl_802F46E0
lbl_802F46E0:
	.incbin "baserom.dol", 0x1EE100, 0x8
.global lbl_802F46E8
lbl_802F46E8:
	.incbin "baserom.dol", 0x1EE108, 0x4
.global lbl_802F46EC
lbl_802F46EC:
	.incbin "baserom.dol", 0x1EE10C, 0x4
.global lbl_802F46F0
lbl_802F46F0:
	.incbin "baserom.dol", 0x1EE110, 0x4
.global lbl_802F46F4
lbl_802F46F4:
	.incbin "baserom.dol", 0x1EE114, 0x4
.global lbl_802F46F8
lbl_802F46F8:
	.incbin "baserom.dol", 0x1EE118, 0x8
.global lbl_802F4700
lbl_802F4700:
	.incbin "baserom.dol", 0x1EE120, 0x8
.global lbl_802F4708
lbl_802F4708:
	.incbin "baserom.dol", 0x1EE128, 0x8
.global lbl_802F4710
lbl_802F4710:
	.incbin "baserom.dol", 0x1EE130, 0x8
.global lbl_802F4718
lbl_802F4718:
	.incbin "baserom.dol", 0x1EE138, 0x8
.global lbl_802F4720
lbl_802F4720:
	.incbin "baserom.dol", 0x1EE140, 0x8
.global lbl_802F4728
lbl_802F4728:
	.incbin "baserom.dol", 0x1EE148, 0x8
.global lbl_802F4730
lbl_802F4730:
	.incbin "baserom.dol", 0x1EE150, 0x8
.global lbl_802F4738
lbl_802F4738:
	.incbin "baserom.dol", 0x1EE158, 0x8
.global lbl_802F4740
lbl_802F4740:
	.incbin "baserom.dol", 0x1EE160, 0x8
.global lbl_802F4748
lbl_802F4748:
	.incbin "baserom.dol", 0x1EE168, 0x8
.global lbl_802F4750
lbl_802F4750:
	.incbin "baserom.dol", 0x1EE170, 0x4
.global lbl_802F4754
lbl_802F4754:
	.incbin "baserom.dol", 0x1EE174, 0x4
.global lbl_802F4758
lbl_802F4758:
	.incbin "baserom.dol", 0x1EE178, 0x4
.global lbl_802F475C
lbl_802F475C:
	.incbin "baserom.dol", 0x1EE17C, 0x4
.global lbl_802F4760
lbl_802F4760:
	.incbin "baserom.dol", 0x1EE180, 0x8
.global lbl_802F4768
lbl_802F4768:
	.incbin "baserom.dol", 0x1EE188, 0x8
.global lbl_802F4770
lbl_802F4770:
	.incbin "baserom.dol", 0x1EE190, 0x8
.global lbl_802F4778
lbl_802F4778:
	.incbin "baserom.dol", 0x1EE198, 0x8
.global lbl_802F4780
lbl_802F4780:
	.incbin "baserom.dol", 0x1EE1A0, 0x8
.global lbl_802F4788
lbl_802F4788:
	.incbin "baserom.dol", 0x1EE1A8, 0x8
.global lbl_802F4790
lbl_802F4790:
	.incbin "baserom.dol", 0x1EE1B0, 0x8
.global lbl_802F4798
lbl_802F4798:
	.incbin "baserom.dol", 0x1EE1B8, 0x8
.global lbl_802F47A0
lbl_802F47A0:
	.incbin "baserom.dol", 0x1EE1C0, 0x8
.global lbl_802F47A8
lbl_802F47A8:
	.incbin "baserom.dol", 0x1EE1C8, 0x8
.global lbl_802F47B0
lbl_802F47B0:
	.incbin "baserom.dol", 0x1EE1D0, 0x8
.global lbl_802F47B8
lbl_802F47B8:
	.incbin "baserom.dol", 0x1EE1D8, 0x8
.global lbl_802F47C0
lbl_802F47C0:
	.incbin "baserom.dol", 0x1EE1E0, 0x8
.global lbl_802F47C8
lbl_802F47C8:
	.incbin "baserom.dol", 0x1EE1E8, 0x8
.global lbl_802F47D0
lbl_802F47D0:
	.incbin "baserom.dol", 0x1EE1F0, 0x8
.global lbl_802F47D8
lbl_802F47D8:
	.incbin "baserom.dol", 0x1EE1F8, 0x8
.global lbl_802F47E0
lbl_802F47E0:
	.incbin "baserom.dol", 0x1EE200, 0x8
.global lbl_802F47E8
lbl_802F47E8:
	.incbin "baserom.dol", 0x1EE208, 0x8
.global lbl_802F47F0
lbl_802F47F0:
	.incbin "baserom.dol", 0x1EE210, 0x8
.global lbl_802F47F8
lbl_802F47F8:
	.incbin "baserom.dol", 0x1EE218, 0x8
.global lbl_802F4800
lbl_802F4800:
	.incbin "baserom.dol", 0x1EE220, 0x8
.global lbl_802F4808
lbl_802F4808:
	.incbin "baserom.dol", 0x1EE228, 0x4
.global lbl_802F480C
lbl_802F480C:
	.incbin "baserom.dol", 0x1EE22C, 0x4
.global lbl_802F4810
lbl_802F4810:
	.incbin "baserom.dol", 0x1EE230, 0x8
.global lbl_802F4818
lbl_802F4818:
	.incbin "baserom.dol", 0x1EE238, 0x4
.global lbl_802F481C
lbl_802F481C:
	.incbin "baserom.dol", 0x1EE23C, 0x4
.global lbl_802F4820
lbl_802F4820:
	.incbin "baserom.dol", 0x1EE240, 0x4
.global lbl_802F4824
lbl_802F4824:
	.incbin "baserom.dol", 0x1EE244, 0x4
.global lbl_802F4828
lbl_802F4828:
	.incbin "baserom.dol", 0x1EE248, 0x4
.global lbl_802F482C
lbl_802F482C:
	.incbin "baserom.dol", 0x1EE24C, 0x4
.global lbl_802F4830
lbl_802F4830:
	.incbin "baserom.dol", 0x1EE250, 0x4
.global lbl_802F4834
lbl_802F4834:
	.incbin "baserom.dol", 0x1EE254, 0x4
.global lbl_802F4838
lbl_802F4838:
	.incbin "baserom.dol", 0x1EE258, 0x4
.global lbl_802F483C
lbl_802F483C:
	.incbin "baserom.dol", 0x1EE25C, 0x4
.global lbl_802F4840
lbl_802F4840:
	.incbin "baserom.dol", 0x1EE260, 0x4
.global lbl_802F4844
lbl_802F4844:
	.incbin "baserom.dol", 0x1EE264, 0x4
.global lbl_802F4848
lbl_802F4848:
	.incbin "baserom.dol", 0x1EE268, 0x4
.global lbl_802F484C
lbl_802F484C:
	.incbin "baserom.dol", 0x1EE26C, 0x4
.global lbl_802F4850
lbl_802F4850:
	.incbin "baserom.dol", 0x1EE270, 0x8
.global lbl_802F4858
lbl_802F4858:
	.incbin "baserom.dol", 0x1EE278, 0x8
.global lbl_802F4860
lbl_802F4860:
	.incbin "baserom.dol", 0x1EE280, 0x8
.global lbl_802F4868
lbl_802F4868:
	.incbin "baserom.dol", 0x1EE288, 0x8
.global lbl_802F4870
lbl_802F4870:
	.incbin "baserom.dol", 0x1EE290, 0x8
.global lbl_802F4878
lbl_802F4878:
	.incbin "baserom.dol", 0x1EE298, 0x8
.global lbl_802F4880
lbl_802F4880:
	.incbin "baserom.dol", 0x1EE2A0, 0x4
.global lbl_802F4884
lbl_802F4884:
	.incbin "baserom.dol", 0x1EE2A4, 0x4
.global lbl_802F4888
lbl_802F4888:
	.incbin "baserom.dol", 0x1EE2A8, 0x8
.global lbl_802F4890
lbl_802F4890:
	.incbin "baserom.dol", 0x1EE2B0, 0x8
.global lbl_802F4898
lbl_802F4898:
	.incbin "baserom.dol", 0x1EE2B8, 0x8
.global lbl_802F48A0
lbl_802F48A0:
	.incbin "baserom.dol", 0x1EE2C0, 0x8
.global lbl_802F48A8
lbl_802F48A8:
	.incbin "baserom.dol", 0x1EE2C8, 0x4
.global lbl_802F48AC
lbl_802F48AC:
	.incbin "baserom.dol", 0x1EE2CC, 0x4
.global lbl_802F48B0
lbl_802F48B0:
	.incbin "baserom.dol", 0x1EE2D0, 0x4
.global lbl_802F48B4
lbl_802F48B4:
	.incbin "baserom.dol", 0x1EE2D4, 0x4
.global lbl_802F48B8
lbl_802F48B8:
	.incbin "baserom.dol", 0x1EE2D8, 0x4
.global lbl_802F48BC
lbl_802F48BC:
	.incbin "baserom.dol", 0x1EE2DC, 0x4
.global lbl_802F48C0
lbl_802F48C0:
	.incbin "baserom.dol", 0x1EE2E0, 0x4
.global lbl_802F48C4
lbl_802F48C4:
	.incbin "baserom.dol", 0x1EE2E4, 0x4
.global lbl_802F48C8
lbl_802F48C8:
	.incbin "baserom.dol", 0x1EE2E8, 0x8
.global lbl_802F48D0
lbl_802F48D0:
	.incbin "baserom.dol", 0x1EE2F0, 0x8
.global lbl_802F48D8
lbl_802F48D8:
	.incbin "baserom.dol", 0x1EE2F8, 0x8
.global lbl_802F48E0
lbl_802F48E0:
	.incbin "baserom.dol", 0x1EE300, 0x8
.global lbl_802F48E8
lbl_802F48E8:
	.incbin "baserom.dol", 0x1EE308, 0x4
.global lbl_802F48EC
lbl_802F48EC:
	.incbin "baserom.dol", 0x1EE30C, 0x4
.global lbl_802F48F0
lbl_802F48F0:
	.incbin "baserom.dol", 0x1EE310, 0x8
.global lbl_802F48F8
lbl_802F48F8:
	.incbin "baserom.dol", 0x1EE318, 0x8
.global lbl_802F4900
lbl_802F4900:
	.incbin "baserom.dol", 0x1EE320, 0x4
.global lbl_802F4904
lbl_802F4904:
	.incbin "baserom.dol", 0x1EE324, 0x4
.global lbl_802F4908
lbl_802F4908:
	.incbin "baserom.dol", 0x1EE328, 0x8
.global lbl_802F4910
lbl_802F4910:
	.incbin "baserom.dol", 0x1EE330, 0x8
.global lbl_802F4918
lbl_802F4918:
	.incbin "baserom.dol", 0x1EE338, 0x4
.global lbl_802F491C
lbl_802F491C:
	.incbin "baserom.dol", 0x1EE33C, 0x4
.global lbl_802F4920
lbl_802F4920:
	.incbin "baserom.dol", 0x1EE340, 0x8
.global lbl_802F4928
lbl_802F4928:
	.incbin "baserom.dol", 0x1EE348, 0x8
.global lbl_802F4930
lbl_802F4930:
	.incbin "baserom.dol", 0x1EE350, 0x8
.global lbl_802F4938
lbl_802F4938:
	.incbin "baserom.dol", 0x1EE358, 0x8
.global lbl_802F4940
lbl_802F4940:
	.incbin "baserom.dol", 0x1EE360, 0x8
.global lbl_802F4948
lbl_802F4948:
	.incbin "baserom.dol", 0x1EE368, 0x8
.global lbl_802F4950
lbl_802F4950:
	.incbin "baserom.dol", 0x1EE370, 0x8
.global lbl_802F4958
lbl_802F4958:
	.incbin "baserom.dol", 0x1EE378, 0x8
.global lbl_802F4960
lbl_802F4960:
	.incbin "baserom.dol", 0x1EE380, 0x8
.global lbl_802F4968
lbl_802F4968:
	.incbin "baserom.dol", 0x1EE388, 0x8
.global lbl_802F4970
lbl_802F4970:
	.incbin "baserom.dol", 0x1EE390, 0x8
.global lbl_802F4978
lbl_802F4978:
	.incbin "baserom.dol", 0x1EE398, 0x8
.global lbl_802F4980
lbl_802F4980:
	.incbin "baserom.dol", 0x1EE3A0, 0x8
.global lbl_802F4988
lbl_802F4988:
	.incbin "baserom.dol", 0x1EE3A8, 0x8
.global lbl_802F4990
lbl_802F4990:
	.incbin "baserom.dol", 0x1EE3B0, 0x8
.global lbl_802F4998
lbl_802F4998:
	.incbin "baserom.dol", 0x1EE3B8, 0x8
.global lbl_802F49A0
lbl_802F49A0:
	.incbin "baserom.dol", 0x1EE3C0, 0x4
.global lbl_802F49A4
lbl_802F49A4:
	.incbin "baserom.dol", 0x1EE3C4, 0x4
.global lbl_802F49A8
lbl_802F49A8:
	.incbin "baserom.dol", 0x1EE3C8, 0x8
.global lbl_802F49B0
lbl_802F49B0:
	.incbin "baserom.dol", 0x1EE3D0, 0x8
.global lbl_802F49B8
lbl_802F49B8:
	.incbin "baserom.dol", 0x1EE3D8, 0x8
.global lbl_802F49C0
lbl_802F49C0:
	.incbin "baserom.dol", 0x1EE3E0, 0x4
.global lbl_802F49C4
lbl_802F49C4:
	.incbin "baserom.dol", 0x1EE3E4, 0x4
.global lbl_802F49C8
lbl_802F49C8:
	.incbin "baserom.dol", 0x1EE3E8, 0x8
.global lbl_802F49D0
lbl_802F49D0:
	.incbin "baserom.dol", 0x1EE3F0, 0x8
.global lbl_802F49D8
lbl_802F49D8:
	.incbin "baserom.dol", 0x1EE3F8, 0x8
.global lbl_802F49E0
lbl_802F49E0:
	.incbin "baserom.dol", 0x1EE400, 0x8
.global lbl_802F49E8
lbl_802F49E8:
	.incbin "baserom.dol", 0x1EE408, 0x8
.global lbl_802F49F0
lbl_802F49F0:
	.incbin "baserom.dol", 0x1EE410, 0x8
.global lbl_802F49F8
lbl_802F49F8:
	.incbin "baserom.dol", 0x1EE418, 0x8
.global lbl_802F4A00
lbl_802F4A00:
	.incbin "baserom.dol", 0x1EE420, 0x8
.global lbl_802F4A08
lbl_802F4A08:
	.incbin "baserom.dol", 0x1EE428, 0x8
.global lbl_802F4A10
lbl_802F4A10:
	.incbin "baserom.dol", 0x1EE430, 0x8
.global lbl_802F4A18
lbl_802F4A18:
	.incbin "baserom.dol", 0x1EE438, 0x8
.global lbl_802F4A20
lbl_802F4A20:
	.incbin "baserom.dol", 0x1EE440, 0x8
.global lbl_802F4A28
lbl_802F4A28:
	.incbin "baserom.dol", 0x1EE448, 0x8
.global lbl_802F4A30
lbl_802F4A30:
	.incbin "baserom.dol", 0x1EE450, 0x8
.global lbl_802F4A38
lbl_802F4A38:
	.incbin "baserom.dol", 0x1EE458, 0x4
.global lbl_802F4A3C
lbl_802F4A3C:
	.incbin "baserom.dol", 0x1EE45C, 0x4
.global lbl_802F4A40
lbl_802F4A40:
	.incbin "baserom.dol", 0x1EE460, 0x4
.global lbl_802F4A44
lbl_802F4A44:
	.incbin "baserom.dol", 0x1EE464, 0x4
.global lbl_802F4A48
lbl_802F4A48:
	.incbin "baserom.dol", 0x1EE468, 0x4
.global lbl_802F4A4C
lbl_802F4A4C:
	.incbin "baserom.dol", 0x1EE46C, 0x4
.global lbl_802F4A50
lbl_802F4A50:
	.incbin "baserom.dol", 0x1EE470, 0x4
.global lbl_802F4A54
lbl_802F4A54:
	.incbin "baserom.dol", 0x1EE474, 0x4
.global lbl_802F4A58
lbl_802F4A58:
	.incbin "baserom.dol", 0x1EE478, 0x8
.global lbl_802F4A60
lbl_802F4A60:
	.incbin "baserom.dol", 0x1EE480, 0x8
.global lbl_802F4A68
lbl_802F4A68:
	.incbin "baserom.dol", 0x1EE488, 0x4
.global lbl_802F4A6C
lbl_802F4A6C:
	.incbin "baserom.dol", 0x1EE48C, 0x4
.global lbl_802F4A70
lbl_802F4A70:
	.incbin "baserom.dol", 0x1EE490, 0x4
.global lbl_802F4A74
lbl_802F4A74:
	.incbin "baserom.dol", 0x1EE494, 0x4
.global lbl_802F4A78
lbl_802F4A78:
	.incbin "baserom.dol", 0x1EE498, 0x8
.global lbl_802F4A80
lbl_802F4A80:
	.incbin "baserom.dol", 0x1EE4A0, 0x8
.global lbl_802F4A88
lbl_802F4A88:
	.incbin "baserom.dol", 0x1EE4A8, 0x8
.global lbl_802F4A90
lbl_802F4A90:
	.incbin "baserom.dol", 0x1EE4B0, 0x8
.global lbl_802F4A98
lbl_802F4A98:
	.incbin "baserom.dol", 0x1EE4B8, 0x8
.global lbl_802F4AA0
lbl_802F4AA0:
	.incbin "baserom.dol", 0x1EE4C0, 0x4
.global lbl_802F4AA4
lbl_802F4AA4:
	.incbin "baserom.dol", 0x1EE4C4, 0x4
.global lbl_802F4AA8
lbl_802F4AA8:
	.incbin "baserom.dol", 0x1EE4C8, 0x4
.global lbl_802F4AAC
lbl_802F4AAC:
	.incbin "baserom.dol", 0x1EE4CC, 0x4
.global lbl_802F4AB0
lbl_802F4AB0:
	.incbin "baserom.dol", 0x1EE4D0, 0x4
.global lbl_802F4AB4
lbl_802F4AB4:
	.incbin "baserom.dol", 0x1EE4D4, 0x4
.global lbl_802F4AB8
lbl_802F4AB8:
	.incbin "baserom.dol", 0x1EE4D8, 0x4
.global lbl_802F4ABC
lbl_802F4ABC:
	.incbin "baserom.dol", 0x1EE4DC, 0x4
.global lbl_802F4AC0
lbl_802F4AC0:
	.incbin "baserom.dol", 0x1EE4E0, 0x8
.global lbl_802F4AC8
lbl_802F4AC8:
	.incbin "baserom.dol", 0x1EE4E8, 0x8
.global lbl_802F4AD0
lbl_802F4AD0:
	.incbin "baserom.dol", 0x1EE4F0, 0x4
.global lbl_802F4AD4
lbl_802F4AD4:
	.incbin "baserom.dol", 0x1EE4F4, 0x4
.global lbl_802F4AD8
lbl_802F4AD8:
	.incbin "baserom.dol", 0x1EE4F8, 0x8
.global lbl_802F4AE0
lbl_802F4AE0:
	.incbin "baserom.dol", 0x1EE500, 0x8
.global lbl_802F4AE8
lbl_802F4AE8:
	.incbin "baserom.dol", 0x1EE508, 0x8
.global lbl_802F4AF0
lbl_802F4AF0:
	.incbin "baserom.dol", 0x1EE510, 0x8
.global lbl_802F4AF8
lbl_802F4AF8:
	.incbin "baserom.dol", 0x1EE518, 0x4
.global lbl_802F4AFC
lbl_802F4AFC:
	.incbin "baserom.dol", 0x1EE51C, 0x4
.global lbl_802F4B00
lbl_802F4B00:
	.incbin "baserom.dol", 0x1EE520, 0x8
.global lbl_802F4B08
lbl_802F4B08:
	.incbin "baserom.dol", 0x1EE528, 0x8
.global lbl_802F4B10
lbl_802F4B10:
	.incbin "baserom.dol", 0x1EE530, 0x4
.global lbl_802F4B14
lbl_802F4B14:
	.incbin "baserom.dol", 0x1EE534, 0x4
.global lbl_802F4B18
lbl_802F4B18:
	.incbin "baserom.dol", 0x1EE538, 0x8
.global lbl_802F4B20
lbl_802F4B20:
	.incbin "baserom.dol", 0x1EE540, 0x8
.global lbl_802F4B28
lbl_802F4B28:
	.incbin "baserom.dol", 0x1EE548, 0x4
.global lbl_802F4B2C
lbl_802F4B2C:
	.incbin "baserom.dol", 0x1EE54C, 0x4
.global lbl_802F4B30
lbl_802F4B30:
	.incbin "baserom.dol", 0x1EE550, 0x8
.global lbl_802F4B38
lbl_802F4B38:
	.incbin "baserom.dol", 0x1EE558, 0x8
.global lbl_802F4B40
lbl_802F4B40:
	.incbin "baserom.dol", 0x1EE560, 0x8
.global lbl_802F4B48
lbl_802F4B48:
	.incbin "baserom.dol", 0x1EE568, 0x8
.global lbl_802F4B50
lbl_802F4B50:
	.incbin "baserom.dol", 0x1EE570, 0x8
.global lbl_802F4B58
lbl_802F4B58:
	.incbin "baserom.dol", 0x1EE578, 0x8
.global lbl_802F4B60
lbl_802F4B60:
	.incbin "baserom.dol", 0x1EE580, 0x8
.global lbl_802F4B68
lbl_802F4B68:
	.incbin "baserom.dol", 0x1EE588, 0x8
.global lbl_802F4B70
lbl_802F4B70:
	.incbin "baserom.dol", 0x1EE590, 0x8
.global lbl_802F4B78
lbl_802F4B78:
	.incbin "baserom.dol", 0x1EE598, 0x4
.global lbl_802F4B7C
lbl_802F4B7C:
	.incbin "baserom.dol", 0x1EE59C, 0x4
.global lbl_802F4B80
lbl_802F4B80:
	.incbin "baserom.dol", 0x1EE5A0, 0x8
.global lbl_802F4B88
lbl_802F4B88:
	.incbin "baserom.dol", 0x1EE5A8, 0x8
.global lbl_802F4B90
lbl_802F4B90:
	.incbin "baserom.dol", 0x1EE5B0, 0x8
.global lbl_802F4B98
lbl_802F4B98:
	.incbin "baserom.dol", 0x1EE5B8, 0x4
.global lbl_802F4B9C
lbl_802F4B9C:
	.incbin "baserom.dol", 0x1EE5BC, 0x4
.global lbl_802F4BA0
lbl_802F4BA0:
	.incbin "baserom.dol", 0x1EE5C0, 0x4
.global lbl_802F4BA4
lbl_802F4BA4:
	.incbin "baserom.dol", 0x1EE5C4, 0x4
.global lbl_802F4BA8
lbl_802F4BA8:
	.incbin "baserom.dol", 0x1EE5C8, 0x8
.global lbl_802F4BB0
lbl_802F4BB0:
	.incbin "baserom.dol", 0x1EE5D0, 0x8
.global lbl_802F4BB8
lbl_802F4BB8:
	.incbin "baserom.dol", 0x1EE5D8, 0x8
.global lbl_802F4BC0
lbl_802F4BC0:
	.incbin "baserom.dol", 0x1EE5E0, 0x8
.global lbl_802F4BC8
lbl_802F4BC8:
	.incbin "baserom.dol", 0x1EE5E8, 0x8
.global lbl_802F4BD0
lbl_802F4BD0:
	.incbin "baserom.dol", 0x1EE5F0, 0x4
.global lbl_802F4BD4
lbl_802F4BD4:
	.incbin "baserom.dol", 0x1EE5F4, 0x4
.global lbl_802F4BD8
lbl_802F4BD8:
	.incbin "baserom.dol", 0x1EE5F8, 0x4
.global lbl_802F4BDC
lbl_802F4BDC:
	.incbin "baserom.dol", 0x1EE5FC, 0x4
.global lbl_802F4BE0
lbl_802F4BE0:
	.incbin "baserom.dol", 0x1EE600, 0x4
.global lbl_802F4BE4
lbl_802F4BE4:
	.incbin "baserom.dol", 0x1EE604, 0x4
.global lbl_802F4BE8
lbl_802F4BE8:
	.incbin "baserom.dol", 0x1EE608, 0x8
.global lbl_802F4BF0
lbl_802F4BF0:
	.incbin "baserom.dol", 0x1EE610, 0x8
.global lbl_802F4BF8
lbl_802F4BF8:
	.incbin "baserom.dol", 0x1EE618, 0x8
.global lbl_802F4C00
lbl_802F4C00:
	.incbin "baserom.dol", 0x1EE620, 0x8
.global lbl_802F4C08
lbl_802F4C08:
	.incbin "baserom.dol", 0x1EE628, 0x8
.global lbl_802F4C10
lbl_802F4C10:
	.incbin "baserom.dol", 0x1EE630, 0x4
.global lbl_802F4C14
lbl_802F4C14:
	.incbin "baserom.dol", 0x1EE634, 0x4
.global lbl_802F4C18
lbl_802F4C18:
	.incbin "baserom.dol", 0x1EE638, 0x8
.global lbl_802F4C20
lbl_802F4C20:
	.incbin "baserom.dol", 0x1EE640, 0x8
.global lbl_802F4C28
lbl_802F4C28:
	.incbin "baserom.dol", 0x1EE648, 0x4
.global lbl_802F4C2C
lbl_802F4C2C:
	.incbin "baserom.dol", 0x1EE64C, 0x4
.global lbl_802F4C30
lbl_802F4C30:
	.incbin "baserom.dol", 0x1EE650, 0x4
.global lbl_802F4C34
lbl_802F4C34:
	.incbin "baserom.dol", 0x1EE654, 0x4
.global lbl_802F4C38
lbl_802F4C38:
	.incbin "baserom.dol", 0x1EE658, 0x4
.global lbl_802F4C3C
lbl_802F4C3C:
	.incbin "baserom.dol", 0x1EE65C, 0x4
.global lbl_802F4C40
lbl_802F4C40:
	.incbin "baserom.dol", 0x1EE660, 0x8
.global lbl_802F4C48
lbl_802F4C48:
	.incbin "baserom.dol", 0x1EE668, 0x8
.global lbl_802F4C50
lbl_802F4C50:
	.incbin "baserom.dol", 0x1EE670, 0x8
.global lbl_802F4C58
lbl_802F4C58:
	.incbin "baserom.dol", 0x1EE678, 0x4
.global lbl_802F4C5C
lbl_802F4C5C:
	.incbin "baserom.dol", 0x1EE67C, 0x4
.global lbl_802F4C60
lbl_802F4C60:
	.incbin "baserom.dol", 0x1EE680, 0x4
.global lbl_802F4C64
lbl_802F4C64:
	.incbin "baserom.dol", 0x1EE684, 0x4
.global lbl_802F4C68
lbl_802F4C68:
	.incbin "baserom.dol", 0x1EE688, 0x8
.global lbl_802F4C70
lbl_802F4C70:
	.incbin "baserom.dol", 0x1EE690, 0x4
.global lbl_802F4C74
lbl_802F4C74:
	.incbin "baserom.dol", 0x1EE694, 0x4
.global lbl_802F4C78
lbl_802F4C78:
	.incbin "baserom.dol", 0x1EE698, 0x8
.global lbl_802F4C80
lbl_802F4C80:
	.incbin "baserom.dol", 0x1EE6A0, 0x4
.global lbl_802F4C84
lbl_802F4C84:
	.incbin "baserom.dol", 0x1EE6A4, 0x4
.global lbl_802F4C88
lbl_802F4C88:
	.incbin "baserom.dol", 0x1EE6A8, 0x4
.global lbl_802F4C8C
lbl_802F4C8C:
	.incbin "baserom.dol", 0x1EE6AC, 0x4
.global lbl_802F4C90
lbl_802F4C90:
	.incbin "baserom.dol", 0x1EE6B0, 0x4
.global lbl_802F4C94
lbl_802F4C94:
	.incbin "baserom.dol", 0x1EE6B4, 0x4
.global lbl_802F4C98
lbl_802F4C98:
	.incbin "baserom.dol", 0x1EE6B8, 0x4
.global lbl_802F4C9C
lbl_802F4C9C:
	.incbin "baserom.dol", 0x1EE6BC, 0x4
.global lbl_802F4CA0
lbl_802F4CA0:
	.incbin "baserom.dol", 0x1EE6C0, 0x8
.global lbl_802F4CA8
lbl_802F4CA8:
	.incbin "baserom.dol", 0x1EE6C8, 0x8
.global lbl_802F4CB0
lbl_802F4CB0:
	.incbin "baserom.dol", 0x1EE6D0, 0x4
.global lbl_802F4CB4
lbl_802F4CB4:
	.incbin "baserom.dol", 0x1EE6D4, 0x4
.global lbl_802F4CB8
lbl_802F4CB8:
	.incbin "baserom.dol", 0x1EE6D8, 0x8
.global lbl_802F4CC0
lbl_802F4CC0:
	.incbin "baserom.dol", 0x1EE6E0, 0x8
.global lbl_802F4CC8
lbl_802F4CC8:
	.incbin "baserom.dol", 0x1EE6E8, 0x4
.global lbl_802F4CCC
lbl_802F4CCC:
	.incbin "baserom.dol", 0x1EE6EC, 0x4
.global lbl_802F4CD0
lbl_802F4CD0:
	.incbin "baserom.dol", 0x1EE6F0, 0x8
.global lbl_802F4CD8
lbl_802F4CD8:
	.incbin "baserom.dol", 0x1EE6F8, 0x8
.global lbl_802F4CE0
lbl_802F4CE0:
	.incbin "baserom.dol", 0x1EE700, 0x8
.global lbl_802F4CE8
lbl_802F4CE8:
	.incbin "baserom.dol", 0x1EE708, 0x8
.global lbl_802F4CF0
lbl_802F4CF0:
	.incbin "baserom.dol", 0x1EE710, 0x8
.global lbl_802F4CF8
lbl_802F4CF8:
	.incbin "baserom.dol", 0x1EE718, 0x8
.global lbl_802F4D00
lbl_802F4D00:
	.incbin "baserom.dol", 0x1EE720, 0x8
.global lbl_802F4D08
lbl_802F4D08:
	.incbin "baserom.dol", 0x1EE728, 0x8
.global lbl_802F4D10
lbl_802F4D10:
	.incbin "baserom.dol", 0x1EE730, 0x8
.global lbl_802F4D18
lbl_802F4D18:
	.incbin "baserom.dol", 0x1EE738, 0x8
.global lbl_802F4D20
lbl_802F4D20:
	.incbin "baserom.dol", 0x1EE740, 0x8
.global lbl_802F4D28
lbl_802F4D28:
	.incbin "baserom.dol", 0x1EE748, 0x8
.global lbl_802F4D30
lbl_802F4D30:
	.incbin "baserom.dol", 0x1EE750, 0x4
.global lbl_802F4D34
lbl_802F4D34:
	.incbin "baserom.dol", 0x1EE754, 0x4
.global lbl_802F4D38
lbl_802F4D38:
	.incbin "baserom.dol", 0x1EE758, 0x8
.global lbl_802F4D40
lbl_802F4D40:
	.incbin "baserom.dol", 0x1EE760, 0x8
.global lbl_802F4D48
lbl_802F4D48:
	.incbin "baserom.dol", 0x1EE768, 0x4
.global lbl_802F4D4C
lbl_802F4D4C:
	.incbin "baserom.dol", 0x1EE76C, 0x4
.global lbl_802F4D50
lbl_802F4D50:
	.incbin "baserom.dol", 0x1EE770, 0x8
.global lbl_802F4D58
lbl_802F4D58:
	.incbin "baserom.dol", 0x1EE778, 0x4
.global lbl_802F4D5C
lbl_802F4D5C:
	.incbin "baserom.dol", 0x1EE77C, 0x4
.global lbl_802F4D60
lbl_802F4D60:
	.incbin "baserom.dol", 0x1EE780, 0x4
.global lbl_802F4D64
lbl_802F4D64:
	.incbin "baserom.dol", 0x1EE784, 0x4
.global lbl_802F4D68
lbl_802F4D68:
	.incbin "baserom.dol", 0x1EE788, 0x4
.global lbl_802F4D6C
lbl_802F4D6C:
	.incbin "baserom.dol", 0x1EE78C, 0x4
.global lbl_802F4D70
lbl_802F4D70:
	.incbin "baserom.dol", 0x1EE790, 0x8
.global lbl_802F4D78
lbl_802F4D78:
	.incbin "baserom.dol", 0x1EE798, 0x8
.global lbl_802F4D80
lbl_802F4D80:
	.incbin "baserom.dol", 0x1EE7A0, 0x4
.global lbl_802F4D84
lbl_802F4D84:
	.incbin "baserom.dol", 0x1EE7A4, 0x4
.global lbl_802F4D88
lbl_802F4D88:
	.incbin "baserom.dol", 0x1EE7A8, 0x4
.global lbl_802F4D8C
lbl_802F4D8C:
	.incbin "baserom.dol", 0x1EE7AC, 0x4
.global lbl_802F4D90
lbl_802F4D90:
	.incbin "baserom.dol", 0x1EE7B0, 0x4
.global lbl_802F4D94
lbl_802F4D94:
	.incbin "baserom.dol", 0x1EE7B4, 0x4
.global lbl_802F4D98
lbl_802F4D98:
	.incbin "baserom.dol", 0x1EE7B8, 0x4
.global lbl_802F4D9C
lbl_802F4D9C:
	.incbin "baserom.dol", 0x1EE7BC, 0x4
.global lbl_802F4DA0
lbl_802F4DA0:
	.incbin "baserom.dol", 0x1EE7C0, 0x4
.global lbl_802F4DA4
lbl_802F4DA4:
	.incbin "baserom.dol", 0x1EE7C4, 0x4
.global lbl_802F4DA8
lbl_802F4DA8:
	.incbin "baserom.dol", 0x1EE7C8, 0x4
.global lbl_802F4DAC
lbl_802F4DAC:
	.incbin "baserom.dol", 0x1EE7CC, 0x4
.global lbl_802F4DB0
lbl_802F4DB0:
	.incbin "baserom.dol", 0x1EE7D0, 0x4
.global lbl_802F4DB4
lbl_802F4DB4:
	.incbin "baserom.dol", 0x1EE7D4, 0x4
.global lbl_802F4DB8
lbl_802F4DB8:
	.incbin "baserom.dol", 0x1EE7D8, 0x4
.global lbl_802F4DBC
lbl_802F4DBC:
	.incbin "baserom.dol", 0x1EE7DC, 0x4
.global lbl_802F4DC0
lbl_802F4DC0:
	.incbin "baserom.dol", 0x1EE7E0, 0x4
.global lbl_802F4DC4
lbl_802F4DC4:
	.incbin "baserom.dol", 0x1EE7E4, 0x4
.global lbl_802F4DC8
lbl_802F4DC8:
	.incbin "baserom.dol", 0x1EE7E8, 0x4
.global lbl_802F4DCC
lbl_802F4DCC:
	.incbin "baserom.dol", 0x1EE7EC, 0x4
.global lbl_802F4DD0
lbl_802F4DD0:
	.incbin "baserom.dol", 0x1EE7F0, 0x8
.global lbl_802F4DD8
lbl_802F4DD8:
	.incbin "baserom.dol", 0x1EE7F8, 0x8
.global lbl_802F4DE0
lbl_802F4DE0:
	.incbin "baserom.dol", 0x1EE800, 0x8
.global lbl_802F4DE8
lbl_802F4DE8:
	.incbin "baserom.dol", 0x1EE808, 0x4
.global lbl_802F4DEC
lbl_802F4DEC:
	.incbin "baserom.dol", 0x1EE80C, 0x4
.global lbl_802F4DF0
lbl_802F4DF0:
	.incbin "baserom.dol", 0x1EE810, 0x4
.global lbl_802F4DF4
lbl_802F4DF4:
	.incbin "baserom.dol", 0x1EE814, 0x4
.global lbl_802F4DF8
lbl_802F4DF8:
	.incbin "baserom.dol", 0x1EE818, 0x8
.global lbl_802F4E00
lbl_802F4E00:
	.incbin "baserom.dol", 0x1EE820, 0x8
.global lbl_802F4E08
lbl_802F4E08:
	.incbin "baserom.dol", 0x1EE828, 0x8
.global lbl_802F4E10
lbl_802F4E10:
	.incbin "baserom.dol", 0x1EE830, 0x8
.global lbl_802F4E18
lbl_802F4E18:
	.incbin "baserom.dol", 0x1EE838, 0x8
.global lbl_802F4E20
lbl_802F4E20:
	.incbin "baserom.dol", 0x1EE840, 0x8
.global lbl_802F4E28
lbl_802F4E28:
	.incbin "baserom.dol", 0x1EE848, 0x4
.global lbl_802F4E2C
lbl_802F4E2C:
	.incbin "baserom.dol", 0x1EE84C, 0x4
.global lbl_802F4E30
lbl_802F4E30:
	.incbin "baserom.dol", 0x1EE850, 0x8
.global lbl_802F4E38
lbl_802F4E38:
	.incbin "baserom.dol", 0x1EE858, 0x4
.global lbl_802F4E3C
lbl_802F4E3C:
	.incbin "baserom.dol", 0x1EE85C, 0x4
.global lbl_802F4E40
lbl_802F4E40:
	.incbin "baserom.dol", 0x1EE860, 0x4
.global lbl_802F4E44
lbl_802F4E44:
	.incbin "baserom.dol", 0x1EE864, 0x4
.global lbl_802F4E48
lbl_802F4E48:
	.incbin "baserom.dol", 0x1EE868, 0x4
.global lbl_802F4E4C
lbl_802F4E4C:
	.incbin "baserom.dol", 0x1EE86C, 0x4
.global lbl_802F4E50
lbl_802F4E50:
	.incbin "baserom.dol", 0x1EE870, 0x4
.global lbl_802F4E54
lbl_802F4E54:
	.incbin "baserom.dol", 0x1EE874, 0x4
.global lbl_802F4E58
lbl_802F4E58:
	.incbin "baserom.dol", 0x1EE878, 0x4
.global lbl_802F4E5C
lbl_802F4E5C:
	.incbin "baserom.dol", 0x1EE87C, 0x4
.global lbl_802F4E60
lbl_802F4E60:
	.incbin "baserom.dol", 0x1EE880, 0x4
.global lbl_802F4E64
lbl_802F4E64:
	.incbin "baserom.dol", 0x1EE884, 0x4
.global lbl_802F4E68
lbl_802F4E68:
	.incbin "baserom.dol", 0x1EE888, 0x4
.global lbl_802F4E6C
lbl_802F4E6C:
	.incbin "baserom.dol", 0x1EE88C, 0x4
.global lbl_802F4E70
lbl_802F4E70:
	.incbin "baserom.dol", 0x1EE890, 0x4
.global lbl_802F4E74
lbl_802F4E74:
	.incbin "baserom.dol", 0x1EE894, 0x4
.global lbl_802F4E78
lbl_802F4E78:
	.incbin "baserom.dol", 0x1EE898, 0x4
.global lbl_802F4E7C
lbl_802F4E7C:
	.incbin "baserom.dol", 0x1EE89C, 0x4
.global lbl_802F4E80
lbl_802F4E80:
	.incbin "baserom.dol", 0x1EE8A0, 0x4
.global lbl_802F4E84
lbl_802F4E84:
	.incbin "baserom.dol", 0x1EE8A4, 0x4
.global lbl_802F4E88
lbl_802F4E88:
	.incbin "baserom.dol", 0x1EE8A8, 0x4
.global lbl_802F4E8C
lbl_802F4E8C:
	.incbin "baserom.dol", 0x1EE8AC, 0x4
.global lbl_802F4E90
lbl_802F4E90:
	.incbin "baserom.dol", 0x1EE8B0, 0x4
.global lbl_802F4E94
lbl_802F4E94:
	.incbin "baserom.dol", 0x1EE8B4, 0x4
.global lbl_802F4E98
lbl_802F4E98:
	.incbin "baserom.dol", 0x1EE8B8, 0x4
.global lbl_802F4E9C
lbl_802F4E9C:
	.incbin "baserom.dol", 0x1EE8BC, 0x4
.global lbl_802F4EA0
lbl_802F4EA0:
	.incbin "baserom.dol", 0x1EE8C0, 0x4
.global lbl_802F4EA4
lbl_802F4EA4:
	.incbin "baserom.dol", 0x1EE8C4, 0x4
.global lbl_802F4EA8
lbl_802F4EA8:
	.incbin "baserom.dol", 0x1EE8C8, 0x4
.global lbl_802F4EAC
lbl_802F4EAC:
	.incbin "baserom.dol", 0x1EE8CC, 0x4
.global lbl_802F4EB0
lbl_802F4EB0:
	.incbin "baserom.dol", 0x1EE8D0, 0x4
.global lbl_802F4EB4
lbl_802F4EB4:
	.incbin "baserom.dol", 0x1EE8D4, 0x4
.global lbl_802F4EB8
lbl_802F4EB8:
	.incbin "baserom.dol", 0x1EE8D8, 0x8
.global lbl_802F4EC0
lbl_802F4EC0:
	.incbin "baserom.dol", 0x1EE8E0, 0x8
.global lbl_802F4EC8
lbl_802F4EC8:
	.incbin "baserom.dol", 0x1EE8E8, 0x8
.global lbl_802F4ED0
lbl_802F4ED0:
	.incbin "baserom.dol", 0x1EE8F0, 0x4
.global lbl_802F4ED4
lbl_802F4ED4:
	.incbin "baserom.dol", 0x1EE8F4, 0x4
.global lbl_802F4ED8
lbl_802F4ED8:
	.incbin "baserom.dol", 0x1EE8F8, 0x8
.global lbl_802F4EE0
lbl_802F4EE0:
	.incbin "baserom.dol", 0x1EE900, 0x8
.global lbl_802F4EE8
lbl_802F4EE8:
	.incbin "baserom.dol", 0x1EE908, 0x8
.global lbl_802F4EF0
lbl_802F4EF0:
	.incbin "baserom.dol", 0x1EE910, 0x8
.global lbl_802F4EF8
lbl_802F4EF8:
	.incbin "baserom.dol", 0x1EE918, 0x8
.global lbl_802F4F00
lbl_802F4F00:
	.incbin "baserom.dol", 0x1EE920, 0x8
.global lbl_802F4F08
lbl_802F4F08:
	.incbin "baserom.dol", 0x1EE928, 0x8
.global lbl_802F4F10
lbl_802F4F10:
	.incbin "baserom.dol", 0x1EE930, 0x4
.global lbl_802F4F14
lbl_802F4F14:
	.incbin "baserom.dol", 0x1EE934, 0x4
.global lbl_802F4F18
lbl_802F4F18:
	.incbin "baserom.dol", 0x1EE938, 0x8
.global lbl_802F4F20
lbl_802F4F20:
	.incbin "baserom.dol", 0x1EE940, 0x8
.global lbl_802F4F28
lbl_802F4F28:
	.incbin "baserom.dol", 0x1EE948, 0x8
.global lbl_802F4F30
lbl_802F4F30:
	.incbin "baserom.dol", 0x1EE950, 0x8
.global lbl_802F4F38
lbl_802F4F38:
	.incbin "baserom.dol", 0x1EE958, 0x4
.global lbl_802F4F3C
lbl_802F4F3C:
	.incbin "baserom.dol", 0x1EE95C, 0x4
.global lbl_802F4F40
lbl_802F4F40:
	.incbin "baserom.dol", 0x1EE960, 0x8
.global lbl_802F4F48
lbl_802F4F48:
	.incbin "baserom.dol", 0x1EE968, 0x8
.global lbl_802F4F50
lbl_802F4F50:
	.incbin "baserom.dol", 0x1EE970, 0x4
.global lbl_802F4F54
lbl_802F4F54:
	.incbin "baserom.dol", 0x1EE974, 0x4
.global lbl_802F4F58
lbl_802F4F58:
	.incbin "baserom.dol", 0x1EE978, 0x8
.global lbl_802F4F60
lbl_802F4F60:
	.incbin "baserom.dol", 0x1EE980, 0x8
.global lbl_802F4F68
lbl_802F4F68:
	.incbin "baserom.dol", 0x1EE988, 0x8
.global lbl_802F4F70
lbl_802F4F70:
	.incbin "baserom.dol", 0x1EE990, 0x8
.global lbl_802F4F78
lbl_802F4F78:
	.incbin "baserom.dol", 0x1EE998, 0x8
.global lbl_802F4F80
lbl_802F4F80:
	.incbin "baserom.dol", 0x1EE9A0, 0x4
.global lbl_802F4F84
lbl_802F4F84:
	.incbin "baserom.dol", 0x1EE9A4, 0x4
.global lbl_802F4F88
lbl_802F4F88:
	.incbin "baserom.dol", 0x1EE9A8, 0x4
.global lbl_802F4F8C
lbl_802F4F8C:
	.incbin "baserom.dol", 0x1EE9AC, 0x4
.global lbl_802F4F90
lbl_802F4F90:
	.incbin "baserom.dol", 0x1EE9B0, 0x8
.global lbl_802F4F98
lbl_802F4F98:
	.incbin "baserom.dol", 0x1EE9B8, 0x4
.global lbl_802F4F9C
lbl_802F4F9C:
	.incbin "baserom.dol", 0x1EE9BC, 0x4
.global lbl_802F4FA0
lbl_802F4FA0:
	.incbin "baserom.dol", 0x1EE9C0, 0x8
.global lbl_802F4FA8
lbl_802F4FA8:
	.incbin "baserom.dol", 0x1EE9C8, 0x8
.global lbl_802F4FB0
lbl_802F4FB0:
	.incbin "baserom.dol", 0x1EE9D0, 0x8
.global lbl_802F4FB8
lbl_802F4FB8:
	.incbin "baserom.dol", 0x1EE9D8, 0x8
.global lbl_802F4FC0
lbl_802F4FC0:
	.incbin "baserom.dol", 0x1EE9E0, 0x8
.global lbl_802F4FC8
lbl_802F4FC8:
	.incbin "baserom.dol", 0x1EE9E8, 0x4
.global lbl_802F4FCC
lbl_802F4FCC:
	.incbin "baserom.dol", 0x1EE9EC, 0x4
.global lbl_802F4FD0
lbl_802F4FD0:
	.incbin "baserom.dol", 0x1EE9F0, 0x8
.global lbl_802F4FD8
lbl_802F4FD8:
	.incbin "baserom.dol", 0x1EE9F8, 0x8
.global lbl_802F4FE0
lbl_802F4FE0:
	.incbin "baserom.dol", 0x1EEA00, 0x8
.global lbl_802F4FE8
lbl_802F4FE8:
	.incbin "baserom.dol", 0x1EEA08, 0x8
.global lbl_802F4FF0
lbl_802F4FF0:
	.incbin "baserom.dol", 0x1EEA10, 0x4
.global lbl_802F4FF4
lbl_802F4FF4:
	.incbin "baserom.dol", 0x1EEA14, 0x4
.global lbl_802F4FF8
lbl_802F4FF8:
	.incbin "baserom.dol", 0x1EEA18, 0x4
.global lbl_802F4FFC
lbl_802F4FFC:
	.incbin "baserom.dol", 0x1EEA1C, 0x4
.global lbl_802F5000
lbl_802F5000:
	.incbin "baserom.dol", 0x1EEA20, 0x4
.global lbl_802F5004
lbl_802F5004:
	.incbin "baserom.dol", 0x1EEA24, 0x4
.global lbl_802F5008
lbl_802F5008:
	.incbin "baserom.dol", 0x1EEA28, 0x4
.global lbl_802F500C
lbl_802F500C:
	.incbin "baserom.dol", 0x1EEA2C, 0x4
.global lbl_802F5010
lbl_802F5010:
	.incbin "baserom.dol", 0x1EEA30, 0x8
.global lbl_802F5018
lbl_802F5018:
	.incbin "baserom.dol", 0x1EEA38, 0x8
.global lbl_802F5020
lbl_802F5020:
	.incbin "baserom.dol", 0x1EEA40, 0x8
.global lbl_802F5028
lbl_802F5028:
	.incbin "baserom.dol", 0x1EEA48, 0x4
.global lbl_802F502C
lbl_802F502C:
	.incbin "baserom.dol", 0x1EEA4C, 0x4
.global lbl_802F5030
lbl_802F5030:
	.incbin "baserom.dol", 0x1EEA50, 0x4
.global lbl_802F5034
lbl_802F5034:
	.incbin "baserom.dol", 0x1EEA54, 0x4
.global lbl_802F5038
lbl_802F5038:
	.incbin "baserom.dol", 0x1EEA58, 0x4
.global lbl_802F503C
lbl_802F503C:
	.incbin "baserom.dol", 0x1EEA5C, 0x4
.global lbl_802F5040
lbl_802F5040:
	.incbin "baserom.dol", 0x1EEA60, 0x8
.global lbl_802F5048
lbl_802F5048:
	.incbin "baserom.dol", 0x1EEA68, 0x8
.global lbl_802F5050
lbl_802F5050:
	.incbin "baserom.dol", 0x1EEA70, 0x8
.global lbl_802F5058
lbl_802F5058:
	.incbin "baserom.dol", 0x1EEA78, 0x8
.global lbl_802F5060
lbl_802F5060:
	.incbin "baserom.dol", 0x1EEA80, 0x8
.global lbl_802F5068
lbl_802F5068:
	.incbin "baserom.dol", 0x1EEA88, 0x8
.global lbl_802F5070
lbl_802F5070:
	.incbin "baserom.dol", 0x1EEA90, 0x8
.global lbl_802F5078
lbl_802F5078:
	.incbin "baserom.dol", 0x1EEA98, 0x4
.global lbl_802F507C
lbl_802F507C:
	.incbin "baserom.dol", 0x1EEA9C, 0x4
.global lbl_802F5080
lbl_802F5080:
	.incbin "baserom.dol", 0x1EEAA0, 0x4
.global lbl_802F5084
lbl_802F5084:
	.incbin "baserom.dol", 0x1EEAA4, 0x4
.global lbl_802F5088
lbl_802F5088:
	.incbin "baserom.dol", 0x1EEAA8, 0x4
.global lbl_802F508C
lbl_802F508C:
	.incbin "baserom.dol", 0x1EEAAC, 0x4
.global lbl_802F5090
lbl_802F5090:
	.incbin "baserom.dol", 0x1EEAB0, 0x8
.global lbl_802F5098
lbl_802F5098:
	.incbin "baserom.dol", 0x1EEAB8, 0x8
.global lbl_802F50A0
lbl_802F50A0:
	.incbin "baserom.dol", 0x1EEAC0, 0x8
.global lbl_802F50A8
lbl_802F50A8:
	.incbin "baserom.dol", 0x1EEAC8, 0x8
.global lbl_802F50B0
lbl_802F50B0:
	.incbin "baserom.dol", 0x1EEAD0, 0x8
.global lbl_802F50B8
lbl_802F50B8:
	.incbin "baserom.dol", 0x1EEAD8, 0x4
.global lbl_802F50BC
lbl_802F50BC:
	.incbin "baserom.dol", 0x1EEADC, 0x4
.global lbl_802F50C0
lbl_802F50C0:
	.incbin "baserom.dol", 0x1EEAE0, 0x4
.global lbl_802F50C4
lbl_802F50C4:
	.incbin "baserom.dol", 0x1EEAE4, 0x4
.global lbl_802F50C8
lbl_802F50C8:
	.incbin "baserom.dol", 0x1EEAE8, 0x4
.global lbl_802F50CC
lbl_802F50CC:
	.incbin "baserom.dol", 0x1EEAEC, 0x4
.global lbl_802F50D0
lbl_802F50D0:
	.incbin "baserom.dol", 0x1EEAF0, 0x8
.global lbl_802F50D8
lbl_802F50D8:
	.incbin "baserom.dol", 0x1EEAF8, 0x4
.global lbl_802F50DC
lbl_802F50DC:
	.incbin "baserom.dol", 0x1EEAFC, 0x4
.global lbl_802F50E0
lbl_802F50E0:
	.incbin "baserom.dol", 0x1EEB00, 0x8
.global lbl_802F50E8
lbl_802F50E8:
	.incbin "baserom.dol", 0x1EEB08, 0x8
.global lbl_802F50F0
lbl_802F50F0:
	.incbin "baserom.dol", 0x1EEB10, 0x8
.global lbl_802F50F8
lbl_802F50F8:
	.incbin "baserom.dol", 0x1EEB18, 0x8
.global lbl_802F5100
lbl_802F5100:
	.incbin "baserom.dol", 0x1EEB20, 0x8
.global lbl_802F5108
lbl_802F5108:
	.incbin "baserom.dol", 0x1EEB28, 0x8
.global lbl_802F5110
lbl_802F5110:
	.incbin "baserom.dol", 0x1EEB30, 0x8
.global lbl_802F5118
lbl_802F5118:
	.incbin "baserom.dol", 0x1EEB38, 0x8
.global lbl_802F5120
lbl_802F5120:
	.incbin "baserom.dol", 0x1EEB40, 0x8
.global lbl_802F5128
lbl_802F5128:
	.incbin "baserom.dol", 0x1EEB48, 0x8
.global lbl_802F5130
lbl_802F5130:
	.incbin "baserom.dol", 0x1EEB50, 0x8
.global lbl_802F5138
lbl_802F5138:
	.incbin "baserom.dol", 0x1EEB58, 0x4
.global lbl_802F513C
lbl_802F513C:
	.incbin "baserom.dol", 0x1EEB5C, 0x4
.global lbl_802F5140
lbl_802F5140:
	.incbin "baserom.dol", 0x1EEB60, 0x8
.global lbl_802F5148
lbl_802F5148:
	.incbin "baserom.dol", 0x1EEB68, 0x8
.global lbl_802F5150
lbl_802F5150:
	.incbin "baserom.dol", 0x1EEB70, 0x8
.global lbl_802F5158
lbl_802F5158:
	.incbin "baserom.dol", 0x1EEB78, 0x8
.global lbl_802F5160
lbl_802F5160:
	.incbin "baserom.dol", 0x1EEB80, 0x8
.global lbl_802F5168
lbl_802F5168:
	.incbin "baserom.dol", 0x1EEB88, 0x8
.global lbl_802F5170
lbl_802F5170:
	.incbin "baserom.dol", 0x1EEB90, 0x8
.global lbl_802F5178
lbl_802F5178:
	.incbin "baserom.dol", 0x1EEB98, 0x4
.global lbl_802F517C
lbl_802F517C:
	.incbin "baserom.dol", 0x1EEB9C, 0x4
.global lbl_802F5180
lbl_802F5180:
	.incbin "baserom.dol", 0x1EEBA0, 0x4
.global lbl_802F5184
lbl_802F5184:
	.incbin "baserom.dol", 0x1EEBA4, 0x4
.global lbl_802F5188
lbl_802F5188:
	.incbin "baserom.dol", 0x1EEBA8, 0x8
.global lbl_802F5190
lbl_802F5190:
	.incbin "baserom.dol", 0x1EEBB0, 0x8
.global lbl_802F5198
lbl_802F5198:
	.incbin "baserom.dol", 0x1EEBB8, 0x4
.global lbl_802F519C
lbl_802F519C:
	.incbin "baserom.dol", 0x1EEBBC, 0x4
.global lbl_802F51A0
lbl_802F51A0:
	.incbin "baserom.dol", 0x1EEBC0, 0x4
.global lbl_802F51A4
lbl_802F51A4:
	.incbin "baserom.dol", 0x1EEBC4, 0x4
.global lbl_802F51A8
lbl_802F51A8:
	.incbin "baserom.dol", 0x1EEBC8, 0x8
.global lbl_802F51B0
lbl_802F51B0:
	.incbin "baserom.dol", 0x1EEBD0, 0x8
.global lbl_802F51B8
lbl_802F51B8:
	.incbin "baserom.dol", 0x1EEBD8, 0x8
.global lbl_802F51C0
lbl_802F51C0:
	.incbin "baserom.dol", 0x1EEBE0, 0x8
.global lbl_802F51C8
lbl_802F51C8:
	.incbin "baserom.dol", 0x1EEBE8, 0x8
.global lbl_802F51D0
lbl_802F51D0:
	.incbin "baserom.dol", 0x1EEBF0, 0x8
.global lbl_802F51D8
lbl_802F51D8:
	.incbin "baserom.dol", 0x1EEBF8, 0x8
.global lbl_802F51E0
lbl_802F51E0:
	.incbin "baserom.dol", 0x1EEC00, 0x8
.global lbl_802F51E8
lbl_802F51E8:
	.incbin "baserom.dol", 0x1EEC08, 0x8
.global lbl_802F51F0
lbl_802F51F0:
	.incbin "baserom.dol", 0x1EEC10, 0x8
.global lbl_802F51F8
lbl_802F51F8:
	.incbin "baserom.dol", 0x1EEC18, 0x8
.global lbl_802F5200
lbl_802F5200:
	.incbin "baserom.dol", 0x1EEC20, 0x8
.global lbl_802F5208
lbl_802F5208:
	.incbin "baserom.dol", 0x1EEC28, 0x8
.global lbl_802F5210
lbl_802F5210:
	.incbin "baserom.dol", 0x1EEC30, 0x8
.global lbl_802F5218
lbl_802F5218:
	.incbin "baserom.dol", 0x1EEC38, 0x8
.global lbl_802F5220
lbl_802F5220:
	.incbin "baserom.dol", 0x1EEC40, 0x8
.global lbl_802F5228
lbl_802F5228:
	.incbin "baserom.dol", 0x1EEC48, 0x8
.global lbl_802F5230
lbl_802F5230:
	.incbin "baserom.dol", 0x1EEC50, 0x8
.global lbl_802F5238
lbl_802F5238:
	.incbin "baserom.dol", 0x1EEC58, 0x8
.global lbl_802F5240
lbl_802F5240:
	.incbin "baserom.dol", 0x1EEC60, 0x8
.global lbl_802F5248
lbl_802F5248:
	.incbin "baserom.dol", 0x1EEC68, 0x8
.global lbl_802F5250
lbl_802F5250:
	.incbin "baserom.dol", 0x1EEC70, 0x8
.global lbl_802F5258
lbl_802F5258:
	.incbin "baserom.dol", 0x1EEC78, 0x4
.global lbl_802F525C
lbl_802F525C:
	.incbin "baserom.dol", 0x1EEC7C, 0x4
.global lbl_802F5260
lbl_802F5260:
	.incbin "baserom.dol", 0x1EEC80, 0x8
.global lbl_802F5268
lbl_802F5268:
	.incbin "baserom.dol", 0x1EEC88, 0x8
.global lbl_802F5270
lbl_802F5270:
	.incbin "baserom.dol", 0x1EEC90, 0x4
.global lbl_802F5274
lbl_802F5274:
	.incbin "baserom.dol", 0x1EEC94, 0x4
.global lbl_802F5278
lbl_802F5278:
	.incbin "baserom.dol", 0x1EEC98, 0x8
.global lbl_802F5280
lbl_802F5280:
	.incbin "baserom.dol", 0x1EECA0, 0x8
.global lbl_802F5288
lbl_802F5288:
	.incbin "baserom.dol", 0x1EECA8, 0x4
.global lbl_802F528C
lbl_802F528C:
	.incbin "baserom.dol", 0x1EECAC, 0x4
.global lbl_802F5290
lbl_802F5290:
	.incbin "baserom.dol", 0x1EECB0, 0x4
.global lbl_802F5294
lbl_802F5294:
	.incbin "baserom.dol", 0x1EECB4, 0x4
.global lbl_802F5298
lbl_802F5298:
	.incbin "baserom.dol", 0x1EECB8, 0x8
.global lbl_802F52A0
lbl_802F52A0:
	.incbin "baserom.dol", 0x1EECC0, 0x4
.global lbl_802F52A4
lbl_802F52A4:
	.incbin "baserom.dol", 0x1EECC4, 0x4
.global lbl_802F52A8
lbl_802F52A8:
	.incbin "baserom.dol", 0x1EECC8, 0x4
.global lbl_802F52AC
lbl_802F52AC:
	.incbin "baserom.dol", 0x1EECCC, 0x4
.global lbl_802F52B0
lbl_802F52B0:
	.incbin "baserom.dol", 0x1EECD0, 0x8
.global lbl_802F52B8
lbl_802F52B8:
	.incbin "baserom.dol", 0x1EECD8, 0x8
.global lbl_802F52C0
lbl_802F52C0:
	.incbin "baserom.dol", 0x1EECE0, 0x8
.global lbl_802F52C8
lbl_802F52C8:
	.incbin "baserom.dol", 0x1EECE8, 0x4
.global lbl_802F52CC
lbl_802F52CC:
	.incbin "baserom.dol", 0x1EECEC, 0x4
.global lbl_802F52D0
lbl_802F52D0:
	.incbin "baserom.dol", 0x1EECF0, 0x4
.global lbl_802F52D4
lbl_802F52D4:
	.incbin "baserom.dol", 0x1EECF4, 0x4
.global lbl_802F52D8
lbl_802F52D8:
	.incbin "baserom.dol", 0x1EECF8, 0x4
.global lbl_802F52DC
lbl_802F52DC:
	.incbin "baserom.dol", 0x1EECFC, 0x4
.global lbl_802F52E0
lbl_802F52E0:
	.incbin "baserom.dol", 0x1EED00, 0x4
.global lbl_802F52E4
lbl_802F52E4:
	.incbin "baserom.dol", 0x1EED04, 0x4
.global lbl_802F52E8
lbl_802F52E8:
	.incbin "baserom.dol", 0x1EED08, 0x8
.global lbl_802F52F0
lbl_802F52F0:
	.incbin "baserom.dol", 0x1EED10, 0x8
.global lbl_802F52F8
lbl_802F52F8:
	.incbin "baserom.dol", 0x1EED18, 0x4
.global lbl_802F52FC
lbl_802F52FC:
	.incbin "baserom.dol", 0x1EED1C, 0x4
.global lbl_802F5300
lbl_802F5300:
	.incbin "baserom.dol", 0x1EED20, 0x4
.global lbl_802F5304
lbl_802F5304:
	.incbin "baserom.dol", 0x1EED24, 0x4
.global lbl_802F5308
lbl_802F5308:
	.incbin "baserom.dol", 0x1EED28, 0x4
.global lbl_802F530C
lbl_802F530C:
	.incbin "baserom.dol", 0x1EED2C, 0x4
.global lbl_802F5310
lbl_802F5310:
	.incbin "baserom.dol", 0x1EED30, 0x8
.global lbl_802F5318
lbl_802F5318:
	.incbin "baserom.dol", 0x1EED38, 0x8
.global lbl_802F5320
lbl_802F5320:
	.incbin "baserom.dol", 0x1EED40, 0x4
.global lbl_802F5324
lbl_802F5324:
	.incbin "baserom.dol", 0x1EED44, 0x4
.global lbl_802F5328
lbl_802F5328:
	.incbin "baserom.dol", 0x1EED48, 0x4
.global lbl_802F532C
lbl_802F532C:
	.incbin "baserom.dol", 0x1EED4C, 0x4
.global lbl_802F5330
lbl_802F5330:
	.incbin "baserom.dol", 0x1EED50, 0x8
.global lbl_802F5338
lbl_802F5338:
	.incbin "baserom.dol", 0x1EED58, 0x4
.global lbl_802F533C
lbl_802F533C:
	.incbin "baserom.dol", 0x1EED5C, 0x4
.global lbl_802F5340
lbl_802F5340:
	.incbin "baserom.dol", 0x1EED60, 0x4
.global lbl_802F5344
lbl_802F5344:
	.incbin "baserom.dol", 0x1EED64, 0x4
.global lbl_802F5348
lbl_802F5348:
	.incbin "baserom.dol", 0x1EED68, 0x8
.global lbl_802F5350
lbl_802F5350:
	.incbin "baserom.dol", 0x1EED70, 0x8
.global lbl_802F5358
lbl_802F5358:
	.incbin "baserom.dol", 0x1EED78, 0x4
.global lbl_802F535C
lbl_802F535C:
	.incbin "baserom.dol", 0x1EED7C, 0x4
.global lbl_802F5360
lbl_802F5360:
	.incbin "baserom.dol", 0x1EED80, 0x8
.global lbl_802F5368
lbl_802F5368:
	.incbin "baserom.dol", 0x1EED88, 0x8
.global lbl_802F5370
lbl_802F5370:
	.incbin "baserom.dol", 0x1EED90, 0x8
.global lbl_802F5378
lbl_802F5378:
	.incbin "baserom.dol", 0x1EED98, 0x4
.global lbl_802F537C
lbl_802F537C:
	.incbin "baserom.dol", 0x1EED9C, 0x4
.global lbl_802F5380
lbl_802F5380:
	.incbin "baserom.dol", 0x1EEDA0, 0x8
.global lbl_802F5388
lbl_802F5388:
	.incbin "baserom.dol", 0x1EEDA8, 0x4
.global lbl_802F538C
lbl_802F538C:
	.incbin "baserom.dol", 0x1EEDAC, 0x4
.global lbl_802F5390
lbl_802F5390:
	.incbin "baserom.dol", 0x1EEDB0, 0x8
.global lbl_802F5398
lbl_802F5398:
	.incbin "baserom.dol", 0x1EEDB8, 0x8
.global lbl_802F53A0
lbl_802F53A0:
	.incbin "baserom.dol", 0x1EEDC0, 0x8
.global lbl_802F53A8
lbl_802F53A8:
	.incbin "baserom.dol", 0x1EEDC8, 0x8
.global lbl_802F53B0
lbl_802F53B0:
	.incbin "baserom.dol", 0x1EEDD0, 0x4
.global lbl_802F53B4
lbl_802F53B4:
	.incbin "baserom.dol", 0x1EEDD4, 0x4
.global lbl_802F53B8
lbl_802F53B8:
	.incbin "baserom.dol", 0x1EEDD8, 0x4
.global lbl_802F53BC
lbl_802F53BC:
	.incbin "baserom.dol", 0x1EEDDC, 0x4
.global lbl_802F53C0
lbl_802F53C0:
	.incbin "baserom.dol", 0x1EEDE0, 0x4
.global lbl_802F53C4
lbl_802F53C4:
	.incbin "baserom.dol", 0x1EEDE4, 0x4
.global lbl_802F53C8
lbl_802F53C8:
	.incbin "baserom.dol", 0x1EEDE8, 0x4
.global lbl_802F53CC
lbl_802F53CC:
	.incbin "baserom.dol", 0x1EEDEC, 0x4
.global lbl_802F53D0
lbl_802F53D0:
	.incbin "baserom.dol", 0x1EEDF0, 0x4
.global lbl_802F53D4
lbl_802F53D4:
	.incbin "baserom.dol", 0x1EEDF4, 0x4
.global lbl_802F53D8
lbl_802F53D8:
	.incbin "baserom.dol", 0x1EEDF8, 0x8
.global lbl_802F53E0
lbl_802F53E0:
	.incbin "baserom.dol", 0x1EEE00, 0x8
.global lbl_802F53E8
lbl_802F53E8:
	.incbin "baserom.dol", 0x1EEE08, 0x8
.global lbl_802F53F0
lbl_802F53F0:
	.incbin "baserom.dol", 0x1EEE10, 0x8
.global lbl_802F53F8
lbl_802F53F8:
	.incbin "baserom.dol", 0x1EEE18, 0x4
.global lbl_802F53FC
lbl_802F53FC:
	.incbin "baserom.dol", 0x1EEE1C, 0x4
.global lbl_802F5400
lbl_802F5400:
	.incbin "baserom.dol", 0x1EEE20, 0x4
.global lbl_802F5404
lbl_802F5404:
	.incbin "baserom.dol", 0x1EEE24, 0x4
.global lbl_802F5408
lbl_802F5408:
	.incbin "baserom.dol", 0x1EEE28, 0x4
.global lbl_802F540C
lbl_802F540C:
	.incbin "baserom.dol", 0x1EEE2C, 0x4
.global lbl_802F5410
lbl_802F5410:
	.incbin "baserom.dol", 0x1EEE30, 0x8
.global lbl_802F5418
lbl_802F5418:
	.incbin "baserom.dol", 0x1EEE38, 0x8
.global lbl_802F5420
lbl_802F5420:
	.incbin "baserom.dol", 0x1EEE40, 0x8
.global lbl_802F5428
lbl_802F5428:
	.incbin "baserom.dol", 0x1EEE48, 0x8
.global lbl_802F5430
lbl_802F5430:
	.incbin "baserom.dol", 0x1EEE50, 0x8
.global lbl_802F5438
lbl_802F5438:
	.incbin "baserom.dol", 0x1EEE58, 0x8
.global lbl_802F5440
lbl_802F5440:
	.incbin "baserom.dol", 0x1EEE60, 0x8
.global lbl_802F5448
lbl_802F5448:
	.incbin "baserom.dol", 0x1EEE68, 0x8
.global lbl_802F5450
lbl_802F5450:
	.incbin "baserom.dol", 0x1EEE70, 0x8
.global lbl_802F5458
lbl_802F5458:
	.incbin "baserom.dol", 0x1EEE78, 0x8
.global lbl_802F5460
lbl_802F5460:
	.incbin "baserom.dol", 0x1EEE80, 0x8
.global lbl_802F5468
lbl_802F5468:
	.incbin "baserom.dol", 0x1EEE88, 0x4
.global lbl_802F546C
lbl_802F546C:
	.incbin "baserom.dol", 0x1EEE8C, 0x4
.global lbl_802F5470
lbl_802F5470:
	.incbin "baserom.dol", 0x1EEE90, 0x8
.global lbl_802F5478
lbl_802F5478:
	.incbin "baserom.dol", 0x1EEE98, 0x4
.global lbl_802F547C
lbl_802F547C:
	.incbin "baserom.dol", 0x1EEE9C, 0x4
.global lbl_802F5480
lbl_802F5480:
	.incbin "baserom.dol", 0x1EEEA0, 0x8
.global lbl_802F5488
lbl_802F5488:
	.incbin "baserom.dol", 0x1EEEA8, 0x8
.global lbl_802F5490
lbl_802F5490:
	.incbin "baserom.dol", 0x1EEEB0, 0x8
.global lbl_802F5498
lbl_802F5498:
	.incbin "baserom.dol", 0x1EEEB8, 0x8
.global lbl_802F54A0
lbl_802F54A0:
	.incbin "baserom.dol", 0x1EEEC0, 0x4
.global lbl_802F54A4
lbl_802F54A4:
	.incbin "baserom.dol", 0x1EEEC4, 0x4
.global lbl_802F54A8
lbl_802F54A8:
	.incbin "baserom.dol", 0x1EEEC8, 0x4
.global lbl_802F54AC
lbl_802F54AC:
	.incbin "baserom.dol", 0x1EEECC, 0x4
.global lbl_802F54B0
lbl_802F54B0:
	.incbin "baserom.dol", 0x1EEED0, 0x8
.global lbl_802F54B8
lbl_802F54B8:
	.incbin "baserom.dol", 0x1EEED8, 0x4
.global lbl_802F54BC
lbl_802F54BC:
	.incbin "baserom.dol", 0x1EEEDC, 0x4
.global lbl_802F54C0
lbl_802F54C0:
	.incbin "baserom.dol", 0x1EEEE0, 0x8
.global lbl_802F54C8
lbl_802F54C8:
	.incbin "baserom.dol", 0x1EEEE8, 0x4
.global lbl_802F54CC
lbl_802F54CC:
	.incbin "baserom.dol", 0x1EEEEC, 0x4
.global lbl_802F54D0
lbl_802F54D0:
	.incbin "baserom.dol", 0x1EEEF0, 0x4
.global lbl_802F54D4
lbl_802F54D4:
	.incbin "baserom.dol", 0x1EEEF4, 0x4
.global lbl_802F54D8
lbl_802F54D8:
	.incbin "baserom.dol", 0x1EEEF8, 0x8
.global lbl_802F54E0
lbl_802F54E0:
	.incbin "baserom.dol", 0x1EEF00, 0x8
.global lbl_802F54E8
lbl_802F54E8:
	.incbin "baserom.dol", 0x1EEF08, 0x8
.global lbl_802F54F0
lbl_802F54F0:
	.incbin "baserom.dol", 0x1EEF10, 0x4
.global lbl_802F54F4
lbl_802F54F4:
	.incbin "baserom.dol", 0x1EEF14, 0x4
.global lbl_802F54F8
lbl_802F54F8:
	.incbin "baserom.dol", 0x1EEF18, 0x4
.global lbl_802F54FC
lbl_802F54FC:
	.incbin "baserom.dol", 0x1EEF1C, 0x4
.global lbl_802F5500
lbl_802F5500:
	.incbin "baserom.dol", 0x1EEF20, 0x8
.global lbl_802F5508
lbl_802F5508:
	.incbin "baserom.dol", 0x1EEF28, 0x8
.global lbl_802F5510
lbl_802F5510:
	.incbin "baserom.dol", 0x1EEF30, 0x8
.global lbl_802F5518
lbl_802F5518:
	.incbin "baserom.dol", 0x1EEF38, 0x8
.global lbl_802F5520
lbl_802F5520:
	.incbin "baserom.dol", 0x1EEF40, 0x8
.global lbl_802F5528
lbl_802F5528:
	.incbin "baserom.dol", 0x1EEF48, 0x8
.global lbl_802F5530
lbl_802F5530:
	.incbin "baserom.dol", 0x1EEF50, 0x4
.global lbl_802F5534
lbl_802F5534:
	.incbin "baserom.dol", 0x1EEF54, 0x4
.global lbl_802F5538
lbl_802F5538:
	.incbin "baserom.dol", 0x1EEF58, 0x8
.global lbl_802F5540
lbl_802F5540:
	.incbin "baserom.dol", 0x1EEF60, 0x8
.global lbl_802F5548
lbl_802F5548:
	.incbin "baserom.dol", 0x1EEF68, 0x8
.global lbl_802F5550
lbl_802F5550:
	.incbin "baserom.dol", 0x1EEF70, 0x8
.global lbl_802F5558
lbl_802F5558:
	.incbin "baserom.dol", 0x1EEF78, 0x8
.global lbl_802F5560
lbl_802F5560:
	.incbin "baserom.dol", 0x1EEF80, 0x8
.global lbl_802F5568
lbl_802F5568:
	.incbin "baserom.dol", 0x1EEF88, 0x8
.global lbl_802F5570
lbl_802F5570:
	.incbin "baserom.dol", 0x1EEF90, 0x8
.global lbl_802F5578
lbl_802F5578:
	.incbin "baserom.dol", 0x1EEF98, 0x4
.global lbl_802F557C
lbl_802F557C:
	.incbin "baserom.dol", 0x1EEF9C, 0x4
.global lbl_802F5580
lbl_802F5580:
	.incbin "baserom.dol", 0x1EEFA0, 0x4
.global lbl_802F5584
lbl_802F5584:
	.incbin "baserom.dol", 0x1EEFA4, 0x4
.global lbl_802F5588
lbl_802F5588:
	.incbin "baserom.dol", 0x1EEFA8, 0x4
.global lbl_802F558C
lbl_802F558C:
	.incbin "baserom.dol", 0x1EEFAC, 0x4
.global lbl_802F5590
lbl_802F5590:
	.incbin "baserom.dol", 0x1EEFB0, 0x4
.global lbl_802F5594
lbl_802F5594:
	.incbin "baserom.dol", 0x1EEFB4, 0x4
.global lbl_802F5598
lbl_802F5598:
	.incbin "baserom.dol", 0x1EEFB8, 0x4
.global lbl_802F559C
lbl_802F559C:
	.incbin "baserom.dol", 0x1EEFBC, 0x4
.global lbl_802F55A0
lbl_802F55A0:
	.incbin "baserom.dol", 0x1EEFC0, 0x4
.global lbl_802F55A4
lbl_802F55A4:
	.incbin "baserom.dol", 0x1EEFC4, 0x4
.global lbl_802F55A8
lbl_802F55A8:
	.incbin "baserom.dol", 0x1EEFC8, 0x4
.global lbl_802F55AC
lbl_802F55AC:
	.incbin "baserom.dol", 0x1EEFCC, 0x4
.global lbl_802F55B0
lbl_802F55B0:
	.incbin "baserom.dol", 0x1EEFD0, 0x4
.global lbl_802F55B4
lbl_802F55B4:
	.incbin "baserom.dol", 0x1EEFD4, 0x4
.global lbl_802F55B8
lbl_802F55B8:
	.incbin "baserom.dol", 0x1EEFD8, 0x4
.global lbl_802F55BC
lbl_802F55BC:
	.incbin "baserom.dol", 0x1EEFDC, 0x4
.global lbl_802F55C0
lbl_802F55C0:
	.incbin "baserom.dol", 0x1EEFE0, 0x4
.global lbl_802F55C4
lbl_802F55C4:
	.incbin "baserom.dol", 0x1EEFE4, 0x4
.global lbl_802F55C8
lbl_802F55C8:
	.incbin "baserom.dol", 0x1EEFE8, 0x4
.global lbl_802F55CC
lbl_802F55CC:
	.incbin "baserom.dol", 0x1EEFEC, 0x4
.global lbl_802F55D0
lbl_802F55D0:
	.incbin "baserom.dol", 0x1EEFF0, 0x4
.global lbl_802F55D4
lbl_802F55D4:
	.incbin "baserom.dol", 0x1EEFF4, 0x4
.global lbl_802F55D8
lbl_802F55D8:
	.incbin "baserom.dol", 0x1EEFF8, 0x4
.global lbl_802F55DC
lbl_802F55DC:
	.incbin "baserom.dol", 0x1EEFFC, 0x4
.global lbl_802F55E0
lbl_802F55E0:
	.incbin "baserom.dol", 0x1EF000, 0x4
.global lbl_802F55E4
lbl_802F55E4:
	.incbin "baserom.dol", 0x1EF004, 0x4
.global lbl_802F55E8
lbl_802F55E8:
	.incbin "baserom.dol", 0x1EF008, 0x4
.global lbl_802F55EC
lbl_802F55EC:
	.incbin "baserom.dol", 0x1EF00C, 0x4
.global lbl_802F55F0
lbl_802F55F0:
	.incbin "baserom.dol", 0x1EF010, 0x4
.global lbl_802F55F4
lbl_802F55F4:
	.incbin "baserom.dol", 0x1EF014, 0x4
.global lbl_802F55F8
lbl_802F55F8:
	.incbin "baserom.dol", 0x1EF018, 0x8
.global lbl_802F5600
lbl_802F5600:
	.incbin "baserom.dol", 0x1EF020, 0x8
.global lbl_802F5608
lbl_802F5608:
	.incbin "baserom.dol", 0x1EF028, 0x8
.global lbl_802F5610
lbl_802F5610:
	.incbin "baserom.dol", 0x1EF030, 0x8
.global lbl_802F5618
lbl_802F5618:
	.incbin "baserom.dol", 0x1EF038, 0x8
.global lbl_802F5620
lbl_802F5620:
	.incbin "baserom.dol", 0x1EF040, 0x8
.global lbl_802F5628
lbl_802F5628:
	.incbin "baserom.dol", 0x1EF048, 0x8
.global lbl_802F5630
lbl_802F5630:
	.incbin "baserom.dol", 0x1EF050, 0x8
.global lbl_802F5638
lbl_802F5638:
	.incbin "baserom.dol", 0x1EF058, 0x8
.global lbl_802F5640
lbl_802F5640:
	.incbin "baserom.dol", 0x1EF060, 0x8
.global lbl_802F5648
lbl_802F5648:
	.incbin "baserom.dol", 0x1EF068, 0x8
.global lbl_802F5650
lbl_802F5650:
	.incbin "baserom.dol", 0x1EF070, 0x4
.global lbl_802F5654
lbl_802F5654:
	.incbin "baserom.dol", 0x1EF074, 0x4
.global lbl_802F5658
lbl_802F5658:
	.incbin "baserom.dol", 0x1EF078, 0x4
.global lbl_802F565C
lbl_802F565C:
	.incbin "baserom.dol", 0x1EF07C, 0x4
.global lbl_802F5660
lbl_802F5660:
	.incbin "baserom.dol", 0x1EF080, 0x4
.global lbl_802F5664
lbl_802F5664:
	.incbin "baserom.dol", 0x1EF084, 0x4
.global lbl_802F5668
lbl_802F5668:
	.incbin "baserom.dol", 0x1EF088, 0x8
.global lbl_802F5670
lbl_802F5670:
	.incbin "baserom.dol", 0x1EF090, 0x8
.global lbl_802F5678
lbl_802F5678:
	.incbin "baserom.dol", 0x1EF098, 0x8
.global lbl_802F5680
lbl_802F5680:
	.incbin "baserom.dol", 0x1EF0A0, 0x8
.global lbl_802F5688
lbl_802F5688:
	.incbin "baserom.dol", 0x1EF0A8, 0x8
.global lbl_802F5690
lbl_802F5690:
	.incbin "baserom.dol", 0x1EF0B0, 0x8
.global lbl_802F5698
lbl_802F5698:
	.incbin "baserom.dol", 0x1EF0B8, 0x4
.global lbl_802F569C
lbl_802F569C:
	.incbin "baserom.dol", 0x1EF0BC, 0x4
.global lbl_802F56A0
lbl_802F56A0:
	.incbin "baserom.dol", 0x1EF0C0, 0x8
.global lbl_802F56A8
lbl_802F56A8:
	.incbin "baserom.dol", 0x1EF0C8, 0x4
.global lbl_802F56AC
lbl_802F56AC:
	.incbin "baserom.dol", 0x1EF0CC, 0x4
.global lbl_802F56B0
lbl_802F56B0:
	.incbin "baserom.dol", 0x1EF0D0, 0x4
.global lbl_802F56B4
lbl_802F56B4:
	.incbin "baserom.dol", 0x1EF0D4, 0x4
.global lbl_802F56B8
lbl_802F56B8:
	.incbin "baserom.dol", 0x1EF0D8, 0x8
.global lbl_802F56C0
lbl_802F56C0:
	.incbin "baserom.dol", 0x1EF0E0, 0x8
.global lbl_802F56C8
lbl_802F56C8:
	.incbin "baserom.dol", 0x1EF0E8, 0x8
.global lbl_802F56D0
lbl_802F56D0:
	.incbin "baserom.dol", 0x1EF0F0, 0x4
.global lbl_802F56D4
lbl_802F56D4:
	.incbin "baserom.dol", 0x1EF0F4, 0x4
.global lbl_802F56D8
lbl_802F56D8:
	.incbin "baserom.dol", 0x1EF0F8, 0x8
.global lbl_802F56E0
lbl_802F56E0:
	.incbin "baserom.dol", 0x1EF100, 0x4
.global lbl_802F56E4
lbl_802F56E4:
	.incbin "baserom.dol", 0x1EF104, 0x4
.global lbl_802F56E8
lbl_802F56E8:
	.incbin "baserom.dol", 0x1EF108, 0x4
.global lbl_802F56EC
lbl_802F56EC:
	.incbin "baserom.dol", 0x1EF10C, 0x4
.global lbl_802F56F0
lbl_802F56F0:
	.incbin "baserom.dol", 0x1EF110, 0x4
.global lbl_802F56F4
lbl_802F56F4:
	.incbin "baserom.dol", 0x1EF114, 0x4
.global lbl_802F56F8
lbl_802F56F8:
	.incbin "baserom.dol", 0x1EF118, 0x4
.global lbl_802F56FC
lbl_802F56FC:
	.incbin "baserom.dol", 0x1EF11C, 0x4
.global lbl_802F5700
lbl_802F5700:
	.incbin "baserom.dol", 0x1EF120, 0x4
.global lbl_802F5704
lbl_802F5704:
	.incbin "baserom.dol", 0x1EF124, 0x4
.global lbl_802F5708
lbl_802F5708:
	.incbin "baserom.dol", 0x1EF128, 0x4
.global lbl_802F570C
lbl_802F570C:
	.incbin "baserom.dol", 0x1EF12C, 0x4
.global lbl_802F5710
lbl_802F5710:
	.incbin "baserom.dol", 0x1EF130, 0x8
.global lbl_802F5718
lbl_802F5718:
	.incbin "baserom.dol", 0x1EF138, 0x8
.global lbl_802F5720
lbl_802F5720:
	.incbin "baserom.dol", 0x1EF140, 0x8
.global lbl_802F5728
lbl_802F5728:
	.incbin "baserom.dol", 0x1EF148, 0x8
.global lbl_802F5730
lbl_802F5730:
	.incbin "baserom.dol", 0x1EF150, 0x8
.global lbl_802F5738
lbl_802F5738:
	.incbin "baserom.dol", 0x1EF158, 0x8
.global lbl_802F5740
lbl_802F5740:
	.incbin "baserom.dol", 0x1EF160, 0x4
.global lbl_802F5744
lbl_802F5744:
	.incbin "baserom.dol", 0x1EF164, 0x4
.global lbl_802F5748
lbl_802F5748:
	.incbin "baserom.dol", 0x1EF168, 0x8
.global lbl_802F5750
lbl_802F5750:
	.incbin "baserom.dol", 0x1EF170, 0x8
.global lbl_802F5758
lbl_802F5758:
	.incbin "baserom.dol", 0x1EF178, 0x8
.global lbl_802F5760
lbl_802F5760:
	.incbin "baserom.dol", 0x1EF180, 0x8
.global lbl_802F5768
lbl_802F5768:
	.incbin "baserom.dol", 0x1EF188, 0x4
.global lbl_802F576C
lbl_802F576C:
	.incbin "baserom.dol", 0x1EF18C, 0x4
.global lbl_802F5770
lbl_802F5770:
	.incbin "baserom.dol", 0x1EF190, 0x4
.global lbl_802F5774
lbl_802F5774:
	.incbin "baserom.dol", 0x1EF194, 0x4
.global lbl_802F5778
lbl_802F5778:
	.incbin "baserom.dol", 0x1EF198, 0x4
.global lbl_802F577C
lbl_802F577C:
	.incbin "baserom.dol", 0x1EF19C, 0x4
.global lbl_802F5780
lbl_802F5780:
	.incbin "baserom.dol", 0x1EF1A0, 0x4
.global lbl_802F5784
lbl_802F5784:
	.incbin "baserom.dol", 0x1EF1A4, 0x4
.global lbl_802F5788
lbl_802F5788:
	.incbin "baserom.dol", 0x1EF1A8, 0x4
.global lbl_802F578C
lbl_802F578C:
	.incbin "baserom.dol", 0x1EF1AC, 0x4
.global lbl_802F5790
lbl_802F5790:
	.incbin "baserom.dol", 0x1EF1B0, 0x8
.global lbl_802F5798
lbl_802F5798:
	.incbin "baserom.dol", 0x1EF1B8, 0x4
.global lbl_802F579C
lbl_802F579C:
	.incbin "baserom.dol", 0x1EF1BC, 0x4
.global lbl_802F57A0
lbl_802F57A0:
	.incbin "baserom.dol", 0x1EF1C0, 0x4
.global lbl_802F57A4
lbl_802F57A4:
	.incbin "baserom.dol", 0x1EF1C4, 0x4
.global lbl_802F57A8
lbl_802F57A8:
	.incbin "baserom.dol", 0x1EF1C8, 0x8
.global lbl_802F57B0
lbl_802F57B0:
	.incbin "baserom.dol", 0x1EF1D0, 0x8
.global lbl_802F57B8
lbl_802F57B8:
	.incbin "baserom.dol", 0x1EF1D8, 0x4
.global lbl_802F57BC
lbl_802F57BC:
	.incbin "baserom.dol", 0x1EF1DC, 0x4
.global lbl_802F57C0
lbl_802F57C0:
	.incbin "baserom.dol", 0x1EF1E0, 0x4
.global lbl_802F57C4
lbl_802F57C4:
	.incbin "baserom.dol", 0x1EF1E4, 0x4
.global lbl_802F57C8
lbl_802F57C8:
	.incbin "baserom.dol", 0x1EF1E8, 0x4
.global lbl_802F57CC
lbl_802F57CC:
	.incbin "baserom.dol", 0x1EF1EC, 0x4
.global lbl_802F57D0
lbl_802F57D0:
	.incbin "baserom.dol", 0x1EF1F0, 0x4
.global lbl_802F57D4
lbl_802F57D4:
	.incbin "baserom.dol", 0x1EF1F4, 0x4
.global lbl_802F57D8
lbl_802F57D8:
	.incbin "baserom.dol", 0x1EF1F8, 0x8
.global lbl_802F57E0
lbl_802F57E0:
	.incbin "baserom.dol", 0x1EF200, 0x8
.global lbl_802F57E8
lbl_802F57E8:
	.incbin "baserom.dol", 0x1EF208, 0x8
.global lbl_802F57F0
lbl_802F57F0:
	.incbin "baserom.dol", 0x1EF210, 0x8
.global lbl_802F57F8
lbl_802F57F8:
	.incbin "baserom.dol", 0x1EF218, 0x8
.global lbl_802F5800
lbl_802F5800:
	.incbin "baserom.dol", 0x1EF220, 0x8
.global lbl_802F5808
lbl_802F5808:
	.incbin "baserom.dol", 0x1EF228, 0x8
.global lbl_802F5810
lbl_802F5810:
	.incbin "baserom.dol", 0x1EF230, 0x8
.global lbl_802F5818
lbl_802F5818:
	.incbin "baserom.dol", 0x1EF238, 0x8
.global lbl_802F5820
lbl_802F5820:
	.incbin "baserom.dol", 0x1EF240, 0x4
.global lbl_802F5824
lbl_802F5824:
	.incbin "baserom.dol", 0x1EF244, 0x4
.global lbl_802F5828
lbl_802F5828:
	.incbin "baserom.dol", 0x1EF248, 0x8
.global lbl_802F5830
lbl_802F5830:
	.incbin "baserom.dol", 0x1EF250, 0x4
.global lbl_802F5834
lbl_802F5834:
	.incbin "baserom.dol", 0x1EF254, 0x4
.global lbl_802F5838
lbl_802F5838:
	.incbin "baserom.dol", 0x1EF258, 0x4
.global lbl_802F583C
lbl_802F583C:
	.incbin "baserom.dol", 0x1EF25C, 0x4
.global lbl_802F5840
lbl_802F5840:
	.incbin "baserom.dol", 0x1EF260, 0x8
.global lbl_802F5848
lbl_802F5848:
	.incbin "baserom.dol", 0x1EF268, 0x8
.global lbl_802F5850
lbl_802F5850:
	.incbin "baserom.dol", 0x1EF270, 0x8
.global lbl_802F5858
lbl_802F5858:
	.incbin "baserom.dol", 0x1EF278, 0x4
.global lbl_802F585C
lbl_802F585C:
	.incbin "baserom.dol", 0x1EF27C, 0x4
.global lbl_802F5860
lbl_802F5860:
	.incbin "baserom.dol", 0x1EF280, 0x8
.global lbl_802F5868
lbl_802F5868:
	.incbin "baserom.dol", 0x1EF288, 0x4
.global lbl_802F586C
lbl_802F586C:
	.incbin "baserom.dol", 0x1EF28C, 0x4
.global lbl_802F5870
lbl_802F5870:
	.incbin "baserom.dol", 0x1EF290, 0x4
.global lbl_802F5874
lbl_802F5874:
	.incbin "baserom.dol", 0x1EF294, 0x4
.global lbl_802F5878
lbl_802F5878:
	.incbin "baserom.dol", 0x1EF298, 0x8
.global lbl_802F5880
lbl_802F5880:
	.incbin "baserom.dol", 0x1EF2A0, 0x4
.global lbl_802F5884
lbl_802F5884:
	.incbin "baserom.dol", 0x1EF2A4, 0x4
.global lbl_802F5888
lbl_802F5888:
	.incbin "baserom.dol", 0x1EF2A8, 0x4
.global lbl_802F588C
lbl_802F588C:
	.incbin "baserom.dol", 0x1EF2AC, 0x4
.global lbl_802F5890
lbl_802F5890:
	.incbin "baserom.dol", 0x1EF2B0, 0x8
.global lbl_802F5898
lbl_802F5898:
	.incbin "baserom.dol", 0x1EF2B8, 0x8
.global lbl_802F58A0
lbl_802F58A0:
	.incbin "baserom.dol", 0x1EF2C0, 0x4
.global lbl_802F58A4
lbl_802F58A4:
	.incbin "baserom.dol", 0x1EF2C4, 0x4
.global lbl_802F58A8
lbl_802F58A8:
	.incbin "baserom.dol", 0x1EF2C8, 0x4
.global lbl_802F58AC
lbl_802F58AC:
	.incbin "baserom.dol", 0x1EF2CC, 0x4
.global lbl_802F58B0
lbl_802F58B0:
	.incbin "baserom.dol", 0x1EF2D0, 0x8
.global lbl_802F58B8
lbl_802F58B8:
	.incbin "baserom.dol", 0x1EF2D8, 0x8
.global lbl_802F58C0
lbl_802F58C0:
	.incbin "baserom.dol", 0x1EF2E0, 0x8
.global lbl_802F58C8
lbl_802F58C8:
	.incbin "baserom.dol", 0x1EF2E8, 0x8
.global lbl_802F58D0
lbl_802F58D0:
	.incbin "baserom.dol", 0x1EF2F0, 0x4
.global lbl_802F58D4
lbl_802F58D4:
	.incbin "baserom.dol", 0x1EF2F4, 0x4
.global lbl_802F58D8
lbl_802F58D8:
	.incbin "baserom.dol", 0x1EF2F8, 0x4
.global lbl_802F58DC
lbl_802F58DC:
	.incbin "baserom.dol", 0x1EF2FC, 0x4
.global lbl_802F58E0
lbl_802F58E0:
	.incbin "baserom.dol", 0x1EF300, 0x4
.global lbl_802F58E4
lbl_802F58E4:
	.incbin "baserom.dol", 0x1EF304, 0x4
.global lbl_802F58E8
lbl_802F58E8:
	.incbin "baserom.dol", 0x1EF308, 0x4
.global lbl_802F58EC
lbl_802F58EC:
	.incbin "baserom.dol", 0x1EF30C, 0x4
.global lbl_802F58F0
lbl_802F58F0:
	.incbin "baserom.dol", 0x1EF310, 0x8
.global lbl_802F58F8
lbl_802F58F8:
	.incbin "baserom.dol", 0x1EF318, 0x8
.global lbl_802F5900
lbl_802F5900:
	.incbin "baserom.dol", 0x1EF320, 0x8
.global lbl_802F5908
lbl_802F5908:
	.incbin "baserom.dol", 0x1EF328, 0x4
.global lbl_802F590C
lbl_802F590C:
	.incbin "baserom.dol", 0x1EF32C, 0x4
.global lbl_802F5910
lbl_802F5910:
	.incbin "baserom.dol", 0x1EF330, 0x4
.global lbl_802F5914
lbl_802F5914:
	.incbin "baserom.dol", 0x1EF334, 0x4
.global lbl_802F5918
lbl_802F5918:
	.incbin "baserom.dol", 0x1EF338, 0x4
.global lbl_802F591C
lbl_802F591C:
	.incbin "baserom.dol", 0x1EF33C, 0x4
.global lbl_802F5920
lbl_802F5920:
	.incbin "baserom.dol", 0x1EF340, 0x8
.global lbl_802F5928
lbl_802F5928:
	.incbin "baserom.dol", 0x1EF348, 0x8
.global lbl_802F5930
lbl_802F5930:
	.incbin "baserom.dol", 0x1EF350, 0x4
.global lbl_802F5934
lbl_802F5934:
	.incbin "baserom.dol", 0x1EF354, 0x4
.global lbl_802F5938
lbl_802F5938:
	.incbin "baserom.dol", 0x1EF358, 0x4
.global lbl_802F593C
lbl_802F593C:
	.incbin "baserom.dol", 0x1EF35C, 0x4
.global lbl_802F5940
lbl_802F5940:
	.incbin "baserom.dol", 0x1EF360, 0x4
.global lbl_802F5944
lbl_802F5944:
	.incbin "baserom.dol", 0x1EF364, 0x4
.global lbl_802F5948
lbl_802F5948:
	.incbin "baserom.dol", 0x1EF368, 0x4
.global lbl_802F594C
lbl_802F594C:
	.incbin "baserom.dol", 0x1EF36C, 0x4
.global lbl_802F5950
lbl_802F5950:
	.incbin "baserom.dol", 0x1EF370, 0x4
.global lbl_802F5954
lbl_802F5954:
	.incbin "baserom.dol", 0x1EF374, 0x4
.global lbl_802F5958
lbl_802F5958:
	.incbin "baserom.dol", 0x1EF378, 0x4
.global lbl_802F595C
lbl_802F595C:
	.incbin "baserom.dol", 0x1EF37C, 0x4
.global lbl_802F5960
lbl_802F5960:
	.incbin "baserom.dol", 0x1EF380, 0x4
.global lbl_802F5964
lbl_802F5964:
	.incbin "baserom.dol", 0x1EF384, 0x4
.global lbl_802F5968
lbl_802F5968:
	.incbin "baserom.dol", 0x1EF388, 0x8
.global lbl_802F5970
lbl_802F5970:
	.incbin "baserom.dol", 0x1EF390, 0x8
.global lbl_802F5978
lbl_802F5978:
	.incbin "baserom.dol", 0x1EF398, 0x4
.global lbl_802F597C
lbl_802F597C:
	.incbin "baserom.dol", 0x1EF39C, 0x4
.global lbl_802F5980
lbl_802F5980:
	.incbin "baserom.dol", 0x1EF3A0, 0x8
.global lbl_802F5988
lbl_802F5988:
	.incbin "baserom.dol", 0x1EF3A8, 0x8
.global lbl_802F5990
lbl_802F5990:
	.incbin "baserom.dol", 0x1EF3B0, 0x8
.global lbl_802F5998
lbl_802F5998:
	.incbin "baserom.dol", 0x1EF3B8, 0x8
.global lbl_802F59A0
lbl_802F59A0:
	.incbin "baserom.dol", 0x1EF3C0, 0x4
.global lbl_802F59A4
lbl_802F59A4:
	.incbin "baserom.dol", 0x1EF3C4, 0x4
.global lbl_802F59A8
lbl_802F59A8:
	.incbin "baserom.dol", 0x1EF3C8, 0x8
.global lbl_802F59B0
lbl_802F59B0:
	.incbin "baserom.dol", 0x1EF3D0, 0x4
.global lbl_802F59B4
lbl_802F59B4:
	.incbin "baserom.dol", 0x1EF3D4, 0x4
.global lbl_802F59B8
lbl_802F59B8:
	.incbin "baserom.dol", 0x1EF3D8, 0x4
.global lbl_802F59BC
lbl_802F59BC:
	.incbin "baserom.dol", 0x1EF3DC, 0x4
.global lbl_802F59C0
lbl_802F59C0:
	.incbin "baserom.dol", 0x1EF3E0, 0x4
.global lbl_802F59C4
lbl_802F59C4:
	.incbin "baserom.dol", 0x1EF3E4, 0x4
.global lbl_802F59C8
lbl_802F59C8:
	.incbin "baserom.dol", 0x1EF3E8, 0x4
.global lbl_802F59CC
lbl_802F59CC:
	.incbin "baserom.dol", 0x1EF3EC, 0x4
.global lbl_802F59D0
lbl_802F59D0:
	.incbin "baserom.dol", 0x1EF3F0, 0x4
.global lbl_802F59D4
lbl_802F59D4:
	.incbin "baserom.dol", 0x1EF3F4, 0x4
.global lbl_802F59D8
lbl_802F59D8:
	.incbin "baserom.dol", 0x1EF3F8, 0x8
.global lbl_802F59E0
lbl_802F59E0:
	.incbin "baserom.dol", 0x1EF400, 0x8
.global lbl_802F59E8
lbl_802F59E8:
	.incbin "baserom.dol", 0x1EF408, 0x8
.global lbl_802F59F0
lbl_802F59F0:
	.incbin "baserom.dol", 0x1EF410, 0x8
.global lbl_802F59F8
lbl_802F59F8:
	.incbin "baserom.dol", 0x1EF418, 0x8
.global lbl_802F5A00
lbl_802F5A00:
	.incbin "baserom.dol", 0x1EF420, 0x8
.global lbl_802F5A08
lbl_802F5A08:
	.incbin "baserom.dol", 0x1EF428, 0x8
.global lbl_802F5A10
lbl_802F5A10:
	.incbin "baserom.dol", 0x1EF430, 0x8
.global lbl_802F5A18
lbl_802F5A18:
	.incbin "baserom.dol", 0x1EF438, 0x8
.global lbl_802F5A20
lbl_802F5A20:
	.incbin "baserom.dol", 0x1EF440, 0x4
.global lbl_802F5A24
lbl_802F5A24:
	.incbin "baserom.dol", 0x1EF444, 0x4
.global lbl_802F5A28
lbl_802F5A28:
	.incbin "baserom.dol", 0x1EF448, 0x4
.global lbl_802F5A2C
lbl_802F5A2C:
	.incbin "baserom.dol", 0x1EF44C, 0x4
.global lbl_802F5A30
lbl_802F5A30:
	.incbin "baserom.dol", 0x1EF450, 0x4
.global lbl_802F5A34
lbl_802F5A34:
	.incbin "baserom.dol", 0x1EF454, 0x4
.global lbl_802F5A38
lbl_802F5A38:
	.incbin "baserom.dol", 0x1EF458, 0x4
.global lbl_802F5A3C
lbl_802F5A3C:
	.incbin "baserom.dol", 0x1EF45C, 0x4
.global lbl_802F5A40
lbl_802F5A40:
	.incbin "baserom.dol", 0x1EF460, 0x4
.global lbl_802F5A44
lbl_802F5A44:
	.incbin "baserom.dol", 0x1EF464, 0x4
.global lbl_802F5A48
lbl_802F5A48:
	.incbin "baserom.dol", 0x1EF468, 0x4
.global lbl_802F5A4C
lbl_802F5A4C:
	.incbin "baserom.dol", 0x1EF46C, 0x4
.global lbl_802F5A50
lbl_802F5A50:
	.incbin "baserom.dol", 0x1EF470, 0x4
.global lbl_802F5A54
lbl_802F5A54:
	.incbin "baserom.dol", 0x1EF474, 0x4
.global lbl_802F5A58
lbl_802F5A58:
	.incbin "baserom.dol", 0x1EF478, 0x4
.global lbl_802F5A5C
lbl_802F5A5C:
	.incbin "baserom.dol", 0x1EF47C, 0x4
.global lbl_802F5A60
lbl_802F5A60:
	.incbin "baserom.dol", 0x1EF480, 0x8
.global lbl_802F5A68
lbl_802F5A68:
	.incbin "baserom.dol", 0x1EF488, 0x8
.global lbl_802F5A70
lbl_802F5A70:
	.incbin "baserom.dol", 0x1EF490, 0x8
.global lbl_802F5A78
lbl_802F5A78:
	.incbin "baserom.dol", 0x1EF498, 0x8
.global lbl_802F5A80
lbl_802F5A80:
	.incbin "baserom.dol", 0x1EF4A0, 0x8
.global lbl_802F5A88
lbl_802F5A88:
	.incbin "baserom.dol", 0x1EF4A8, 0x4
.global lbl_802F5A8C
lbl_802F5A8C:
	.incbin "baserom.dol", 0x1EF4AC, 0x4
.global lbl_802F5A90
lbl_802F5A90:
	.incbin "baserom.dol", 0x1EF4B0, 0x4
.global lbl_802F5A94
lbl_802F5A94:
	.incbin "baserom.dol", 0x1EF4B4, 0x4
.global lbl_802F5A98
lbl_802F5A98:
	.incbin "baserom.dol", 0x1EF4B8, 0x8
.global lbl_802F5AA0
lbl_802F5AA0:
	.incbin "baserom.dol", 0x1EF4C0, 0x4
.global lbl_802F5AA4
lbl_802F5AA4:
	.incbin "baserom.dol", 0x1EF4C4, 0x4
.global lbl_802F5AA8
lbl_802F5AA8:
	.incbin "baserom.dol", 0x1EF4C8, 0x8
.global lbl_802F5AB0
lbl_802F5AB0:
	.incbin "baserom.dol", 0x1EF4D0, 0x8
.global lbl_802F5AB8
lbl_802F5AB8:
	.incbin "baserom.dol", 0x1EF4D8, 0x8
.global lbl_802F5AC0
lbl_802F5AC0:
	.incbin "baserom.dol", 0x1EF4E0, 0x8
.global lbl_802F5AC8
lbl_802F5AC8:
	.incbin "baserom.dol", 0x1EF4E8, 0x8
.global lbl_802F5AD0
lbl_802F5AD0:
	.incbin "baserom.dol", 0x1EF4F0, 0x8
.global lbl_802F5AD8
lbl_802F5AD8:
	.incbin "baserom.dol", 0x1EF4F8, 0x8
.global lbl_802F5AE0
lbl_802F5AE0:
	.incbin "baserom.dol", 0x1EF500, 0x8
.global lbl_802F5AE8
lbl_802F5AE8:
	.incbin "baserom.dol", 0x1EF508, 0x8
.global lbl_802F5AF0
lbl_802F5AF0:
	.incbin "baserom.dol", 0x1EF510, 0x8
.global lbl_802F5AF8
lbl_802F5AF8:
	.incbin "baserom.dol", 0x1EF518, 0x8
.global lbl_802F5B00
lbl_802F5B00:
	.incbin "baserom.dol", 0x1EF520, 0x8
.global lbl_802F5B08
lbl_802F5B08:
	.incbin "baserom.dol", 0x1EF528, 0x8
.global lbl_802F5B10
lbl_802F5B10:
	.incbin "baserom.dol", 0x1EF530, 0x8
.global lbl_802F5B18
lbl_802F5B18:
	.incbin "baserom.dol", 0x1EF538, 0x8
.global lbl_802F5B20
lbl_802F5B20:
	.incbin "baserom.dol", 0x1EF540, 0x4
.global lbl_802F5B24
lbl_802F5B24:
	.incbin "baserom.dol", 0x1EF544, 0x4
.global lbl_802F5B28
lbl_802F5B28:
	.incbin "baserom.dol", 0x1EF548, 0x4
.global lbl_802F5B2C
lbl_802F5B2C:
	.incbin "baserom.dol", 0x1EF54C, 0x4
.global lbl_802F5B30
lbl_802F5B30:
	.incbin "baserom.dol", 0x1EF550, 0x4
.global lbl_802F5B34
lbl_802F5B34:
	.incbin "baserom.dol", 0x1EF554, 0x4
.global lbl_802F5B38
lbl_802F5B38:
	.incbin "baserom.dol", 0x1EF558, 0x4
.global lbl_802F5B3C
lbl_802F5B3C:
	.incbin "baserom.dol", 0x1EF55C, 0x4
.global lbl_802F5B40
lbl_802F5B40:
	.incbin "baserom.dol", 0x1EF560, 0x8
.global lbl_802F5B48
lbl_802F5B48:
	.incbin "baserom.dol", 0x1EF568, 0x8
.global lbl_802F5B50
lbl_802F5B50:
	.incbin "baserom.dol", 0x1EF570, 0x4
.global lbl_802F5B54
lbl_802F5B54:
	.incbin "baserom.dol", 0x1EF574, 0x4
.global lbl_802F5B58
lbl_802F5B58:
	.incbin "baserom.dol", 0x1EF578, 0x8
.global lbl_802F5B60
lbl_802F5B60:
	.incbin "baserom.dol", 0x1EF580, 0x4
.global lbl_802F5B64
lbl_802F5B64:
	.incbin "baserom.dol", 0x1EF584, 0x4
.global lbl_802F5B68
lbl_802F5B68:
	.incbin "baserom.dol", 0x1EF588, 0x8
.global lbl_802F5B70
lbl_802F5B70:
	.incbin "baserom.dol", 0x1EF590, 0x8
.global lbl_802F5B78
lbl_802F5B78:
	.incbin "baserom.dol", 0x1EF598, 0x8
.global lbl_802F5B80
lbl_802F5B80:
	.incbin "baserom.dol", 0x1EF5A0, 0x8
.global lbl_802F5B88
lbl_802F5B88:
	.incbin "baserom.dol", 0x1EF5A8, 0x8
.global lbl_802F5B90
lbl_802F5B90:
	.incbin "baserom.dol", 0x1EF5B0, 0x8
.global lbl_802F5B98
lbl_802F5B98:
	.incbin "baserom.dol", 0x1EF5B8, 0x8
.global lbl_802F5BA0
lbl_802F5BA0:
	.incbin "baserom.dol", 0x1EF5C0, 0x8
.global lbl_802F5BA8
lbl_802F5BA8:
	.incbin "baserom.dol", 0x1EF5C8, 0x8
.global lbl_802F5BB0
lbl_802F5BB0:
	.incbin "baserom.dol", 0x1EF5D0, 0x4
.global lbl_802F5BB4
lbl_802F5BB4:
	.incbin "baserom.dol", 0x1EF5D4, 0x4
.global lbl_802F5BB8
lbl_802F5BB8:
	.incbin "baserom.dol", 0x1EF5D8, 0x8
.global lbl_802F5BC0
lbl_802F5BC0:
	.incbin "baserom.dol", 0x1EF5E0, 0x8
.global lbl_802F5BC8
lbl_802F5BC8:
	.incbin "baserom.dol", 0x1EF5E8, 0x4
.global lbl_802F5BCC
lbl_802F5BCC:
	.incbin "baserom.dol", 0x1EF5EC, 0x4
.global lbl_802F5BD0
lbl_802F5BD0:
	.incbin "baserom.dol", 0x1EF5F0, 0x4
.global lbl_802F5BD4
lbl_802F5BD4:
	.incbin "baserom.dol", 0x1EF5F4, 0x4
.global lbl_802F5BD8
lbl_802F5BD8:
	.incbin "baserom.dol", 0x1EF5F8, 0x4
.global lbl_802F5BDC
lbl_802F5BDC:
	.incbin "baserom.dol", 0x1EF5FC, 0x4
.global lbl_802F5BE0
lbl_802F5BE0:
	.incbin "baserom.dol", 0x1EF600, 0x8
.global lbl_802F5BE8
lbl_802F5BE8:
	.incbin "baserom.dol", 0x1EF608, 0x8
.global lbl_802F5BF0
lbl_802F5BF0:
	.incbin "baserom.dol", 0x1EF610, 0x8
.global lbl_802F5BF8
lbl_802F5BF8:
	.incbin "baserom.dol", 0x1EF618, 0x4
.global lbl_802F5BFC
lbl_802F5BFC:
	.incbin "baserom.dol", 0x1EF61C, 0x4
.global lbl_802F5C00
lbl_802F5C00:
	.incbin "baserom.dol", 0x1EF620, 0x4
.global lbl_802F5C04
lbl_802F5C04:
	.incbin "baserom.dol", 0x1EF624, 0x4
.global lbl_802F5C08
lbl_802F5C08:
	.incbin "baserom.dol", 0x1EF628, 0x8
.global lbl_802F5C10
lbl_802F5C10:
	.incbin "baserom.dol", 0x1EF630, 0x4
.global lbl_802F5C14
lbl_802F5C14:
	.incbin "baserom.dol", 0x1EF634, 0x4
.global lbl_802F5C18
lbl_802F5C18:
	.incbin "baserom.dol", 0x1EF638, 0x4
.global lbl_802F5C1C
lbl_802F5C1C:
	.incbin "baserom.dol", 0x1EF63C, 0x4
.global lbl_802F5C20
lbl_802F5C20:
	.incbin "baserom.dol", 0x1EF640, 0x8
.global lbl_802F5C28
lbl_802F5C28:
	.incbin "baserom.dol", 0x1EF648, 0x4
.global lbl_802F5C2C
lbl_802F5C2C:
	.incbin "baserom.dol", 0x1EF64C, 0x4
.global lbl_802F5C30
lbl_802F5C30:
	.incbin "baserom.dol", 0x1EF650, 0x4
.global lbl_802F5C34
lbl_802F5C34:
	.incbin "baserom.dol", 0x1EF654, 0x4
.global lbl_802F5C38
lbl_802F5C38:
	.incbin "baserom.dol", 0x1EF658, 0x8
.global lbl_802F5C40
lbl_802F5C40:
	.incbin "baserom.dol", 0x1EF660, 0x10
.global lbl_802F5C50
lbl_802F5C50:
	.incbin "baserom.dol", 0x1EF670, 0x4
.global lbl_802F5C54
lbl_802F5C54:
	.incbin "baserom.dol", 0x1EF674, 0x4
.global lbl_802F5C58
lbl_802F5C58:
	.incbin "baserom.dol", 0x1EF678, 0x4
.global lbl_802F5C5C
lbl_802F5C5C:
	.incbin "baserom.dol", 0x1EF67C, 0x4
.global lbl_802F5C60
lbl_802F5C60:
	.incbin "baserom.dol", 0x1EF680, 0x4
.global lbl_802F5C64
lbl_802F5C64:
	.incbin "baserom.dol", 0x1EF684, 0x4
.global lbl_802F5C68
lbl_802F5C68:
	.incbin "baserom.dol", 0x1EF688, 0x8
.global lbl_802F5C70
lbl_802F5C70:
	.incbin "baserom.dol", 0x1EF690, 0x8
.global lbl_802F5C78
lbl_802F5C78:
	.incbin "baserom.dol", 0x1EF698, 0x8
.global lbl_802F5C80
lbl_802F5C80:
	.incbin "baserom.dol", 0x1EF6A0, 0x8
.global lbl_802F5C88
lbl_802F5C88:
	.incbin "baserom.dol", 0x1EF6A8, 0x8
.global lbl_802F5C90
lbl_802F5C90:
	.incbin "baserom.dol", 0x1EF6B0, 0x8
.global lbl_802F5C98
lbl_802F5C98:
	.incbin "baserom.dol", 0x1EF6B8, 0x8
.global lbl_802F5CA0
lbl_802F5CA0:
	.incbin "baserom.dol", 0x1EF6C0, 0x8
.global lbl_802F5CA8
lbl_802F5CA8:
	.incbin "baserom.dol", 0x1EF6C8, 0x8
.global lbl_802F5CB0
lbl_802F5CB0:
	.incbin "baserom.dol", 0x1EF6D0, 0x4
.global lbl_802F5CB4
lbl_802F5CB4:
	.incbin "baserom.dol", 0x1EF6D4, 0x4
.global lbl_802F5CB8
lbl_802F5CB8:
	.incbin "baserom.dol", 0x1EF6D8, 0x8
.global lbl_802F5CC0
lbl_802F5CC0:
	.incbin "baserom.dol", 0x1EF6E0, 0x4
.global lbl_802F5CC4
lbl_802F5CC4:
	.incbin "baserom.dol", 0x1EF6E4, 0x4
.global lbl_802F5CC8
lbl_802F5CC8:
	.incbin "baserom.dol", 0x1EF6E8, 0x4
.global lbl_802F5CCC
lbl_802F5CCC:
	.incbin "baserom.dol", 0x1EF6EC, 0x4
.global lbl_802F5CD0
lbl_802F5CD0:
	.incbin "baserom.dol", 0x1EF6F0, 0x4
.global lbl_802F5CD4
lbl_802F5CD4:
	.incbin "baserom.dol", 0x1EF6F4, 0x4
.global lbl_802F5CD8
lbl_802F5CD8:
	.incbin "baserom.dol", 0x1EF6F8, 0x8
.global lbl_802F5CE0
lbl_802F5CE0:
	.incbin "baserom.dol", 0x1EF700, 0x8
.global lbl_802F5CE8
lbl_802F5CE8:
	.incbin "baserom.dol", 0x1EF708, 0x8
.global lbl_802F5CF0
lbl_802F5CF0:
	.incbin "baserom.dol", 0x1EF710, 0x8
.global lbl_802F5CF8
lbl_802F5CF8:
	.incbin "baserom.dol", 0x1EF718, 0x8
.global lbl_802F5D00
lbl_802F5D00:
	.incbin "baserom.dol", 0x1EF720, 0x8
.global lbl_802F5D08
lbl_802F5D08:
	.incbin "baserom.dol", 0x1EF728, 0x8
.global lbl_802F5D10
lbl_802F5D10:
	.incbin "baserom.dol", 0x1EF730, 0x8
.global lbl_802F5D18
lbl_802F5D18:
	.incbin "baserom.dol", 0x1EF738, 0x8
.global lbl_802F5D20
lbl_802F5D20:
	.incbin "baserom.dol", 0x1EF740, 0x8
.global lbl_802F5D28
lbl_802F5D28:
	.incbin "baserom.dol", 0x1EF748, 0x8
.global lbl_802F5D30
lbl_802F5D30:
	.incbin "baserom.dol", 0x1EF750, 0x8
.global lbl_802F5D38
lbl_802F5D38:
	.incbin "baserom.dol", 0x1EF758, 0x8
.global lbl_802F5D40
lbl_802F5D40:
	.incbin "baserom.dol", 0x1EF760, 0x8
.global lbl_802F5D48
lbl_802F5D48:
	.incbin "baserom.dol", 0x1EF768, 0x8
.global lbl_802F5D50
lbl_802F5D50:
	.incbin "baserom.dol", 0x1EF770, 0x8
.global lbl_802F5D58
lbl_802F5D58:
	.incbin "baserom.dol", 0x1EF778, 0x4
.global lbl_802F5D5C
lbl_802F5D5C:
	.incbin "baserom.dol", 0x1EF77C, 0x4
.global lbl_802F5D60
lbl_802F5D60:
	.incbin "baserom.dol", 0x1EF780, 0x8
.global lbl_802F5D68
lbl_802F5D68:
	.incbin "baserom.dol", 0x1EF788, 0x8
.global lbl_802F5D70
lbl_802F5D70:
	.incbin "baserom.dol", 0x1EF790, 0x8
.global lbl_802F5D78
lbl_802F5D78:
	.incbin "baserom.dol", 0x1EF798, 0x4
.global lbl_802F5D7C
lbl_802F5D7C:
	.incbin "baserom.dol", 0x1EF79C, 0x4
.global lbl_802F5D80
lbl_802F5D80:
	.incbin "baserom.dol", 0x1EF7A0, 0x8
.global lbl_802F5D88
lbl_802F5D88:
	.incbin "baserom.dol", 0x1EF7A8, 0x8
.global lbl_802F5D90
lbl_802F5D90:
	.incbin "baserom.dol", 0x1EF7B0, 0x8
.global lbl_802F5D98
lbl_802F5D98:
	.incbin "baserom.dol", 0x1EF7B8, 0x8
.global lbl_802F5DA0
lbl_802F5DA0:
	.incbin "baserom.dol", 0x1EF7C0, 0x8
.global lbl_802F5DA8
lbl_802F5DA8:
	.incbin "baserom.dol", 0x1EF7C8, 0x8
.global lbl_802F5DB0
lbl_802F5DB0:
	.incbin "baserom.dol", 0x1EF7D0, 0x4
.global lbl_802F5DB4
lbl_802F5DB4:
	.incbin "baserom.dol", 0x1EF7D4, 0x4
.global lbl_802F5DB8
lbl_802F5DB8:
	.incbin "baserom.dol", 0x1EF7D8, 0x4
.global lbl_802F5DBC
lbl_802F5DBC:
	.incbin "baserom.dol", 0x1EF7DC, 0x4
.global lbl_802F5DC0
lbl_802F5DC0:
	.incbin "baserom.dol", 0x1EF7E0, 0x8
.global lbl_802F5DC8
lbl_802F5DC8:
	.incbin "baserom.dol", 0x1EF7E8, 0x4
.global lbl_802F5DCC
lbl_802F5DCC:
	.incbin "baserom.dol", 0x1EF7EC, 0x4
.global lbl_802F5DD0
lbl_802F5DD0:
	.incbin "baserom.dol", 0x1EF7F0, 0x8
.global lbl_802F5DD8
lbl_802F5DD8:
	.incbin "baserom.dol", 0x1EF7F8, 0x8
.global lbl_802F5DE0
lbl_802F5DE0:
	.incbin "baserom.dol", 0x1EF800, 0x8
.global lbl_802F5DE8
lbl_802F5DE8:
	.incbin "baserom.dol", 0x1EF808, 0x8
.global lbl_802F5DF0
lbl_802F5DF0:
	.incbin "baserom.dol", 0x1EF810, 0x8
.global lbl_802F5DF8
lbl_802F5DF8:
	.incbin "baserom.dol", 0x1EF818, 0x4
.global lbl_802F5DFC
lbl_802F5DFC:
	.incbin "baserom.dol", 0x1EF81C, 0x4
.global lbl_802F5E00
lbl_802F5E00:
	.incbin "baserom.dol", 0x1EF820, 0x8
.global lbl_802F5E08
lbl_802F5E08:
	.incbin "baserom.dol", 0x1EF828, 0x8
.global lbl_802F5E10
lbl_802F5E10:
	.incbin "baserom.dol", 0x1EF830, 0x8
.global lbl_802F5E18
lbl_802F5E18:
	.incbin "baserom.dol", 0x1EF838, 0x4
.global lbl_802F5E1C
lbl_802F5E1C:
	.incbin "baserom.dol", 0x1EF83C, 0x4
.global lbl_802F5E20
lbl_802F5E20:
	.incbin "baserom.dol", 0x1EF840, 0x4
.global lbl_802F5E24
lbl_802F5E24:
	.incbin "baserom.dol", 0x1EF844, 0x4
.global lbl_802F5E28
lbl_802F5E28:
	.incbin "baserom.dol", 0x1EF848, 0x4
.global lbl_802F5E2C
lbl_802F5E2C:
	.incbin "baserom.dol", 0x1EF84C, 0x4
.global lbl_802F5E30
lbl_802F5E30:
	.incbin "baserom.dol", 0x1EF850, 0x4
.global lbl_802F5E34
lbl_802F5E34:
	.incbin "baserom.dol", 0x1EF854, 0x4
.global lbl_802F5E38
lbl_802F5E38:
	.incbin "baserom.dol", 0x1EF858, 0x4
.global lbl_802F5E3C
lbl_802F5E3C:
	.incbin "baserom.dol", 0x1EF85C, 0x4
.global lbl_802F5E40
lbl_802F5E40:
	.incbin "baserom.dol", 0x1EF860, 0x4
.global lbl_802F5E44
lbl_802F5E44:
	.incbin "baserom.dol", 0x1EF864, 0x4
.global lbl_802F5E48
lbl_802F5E48:
	.incbin "baserom.dol", 0x1EF868, 0x4
.global lbl_802F5E4C
lbl_802F5E4C:
	.incbin "baserom.dol", 0x1EF86C, 0x4
.global lbl_802F5E50
lbl_802F5E50:
	.incbin "baserom.dol", 0x1EF870, 0x8
.global lbl_802F5E58
lbl_802F5E58:
	.incbin "baserom.dol", 0x1EF878, 0x8
.global lbl_802F5E60
lbl_802F5E60:
	.incbin "baserom.dol", 0x1EF880, 0x4
.global lbl_802F5E64
lbl_802F5E64:
	.incbin "baserom.dol", 0x1EF884, 0x4
.global lbl_802F5E68
lbl_802F5E68:
	.incbin "baserom.dol", 0x1EF888, 0x4
.global lbl_802F5E6C
lbl_802F5E6C:
	.incbin "baserom.dol", 0x1EF88C, 0x4
.global lbl_802F5E70
lbl_802F5E70:
	.incbin "baserom.dol", 0x1EF890, 0x8
.global lbl_802F5E78
lbl_802F5E78:
	.incbin "baserom.dol", 0x1EF898, 0x4
.global lbl_802F5E7C
lbl_802F5E7C:
	.incbin "baserom.dol", 0x1EF89C, 0x4
.global lbl_802F5E80
lbl_802F5E80:
	.incbin "baserom.dol", 0x1EF8A0, 0x4
.global lbl_802F5E84
lbl_802F5E84:
	.incbin "baserom.dol", 0x1EF8A4, 0x4
.global lbl_802F5E88
lbl_802F5E88:
	.incbin "baserom.dol", 0x1EF8A8, 0x4
.global lbl_802F5E8C
lbl_802F5E8C:
	.incbin "baserom.dol", 0x1EF8AC, 0x4
.global lbl_802F5E90
lbl_802F5E90:
	.incbin "baserom.dol", 0x1EF8B0, 0x8
.global lbl_802F5E98
lbl_802F5E98:
	.incbin "baserom.dol", 0x1EF8B8, 0x8
.global lbl_802F5EA0
lbl_802F5EA0:
	.incbin "baserom.dol", 0x1EF8C0, 0x8
.global lbl_802F5EA8
lbl_802F5EA8:
	.incbin "baserom.dol", 0x1EF8C8, 0x8
.global lbl_802F5EB0
lbl_802F5EB0:
	.incbin "baserom.dol", 0x1EF8D0, 0x8
.global lbl_802F5EB8
lbl_802F5EB8:
	.incbin "baserom.dol", 0x1EF8D8, 0x8
.global lbl_802F5EC0
lbl_802F5EC0:
	.incbin "baserom.dol", 0x1EF8E0, 0x8
.global lbl_802F5EC8
lbl_802F5EC8:
	.incbin "baserom.dol", 0x1EF8E8, 0x4
.global lbl_802F5ECC
lbl_802F5ECC:
	.incbin "baserom.dol", 0x1EF8EC, 0x4
.global lbl_802F5ED0
lbl_802F5ED0:
	.incbin "baserom.dol", 0x1EF8F0, 0x8
.global lbl_802F5ED8
lbl_802F5ED8:
	.incbin "baserom.dol", 0x1EF8F8, 0x8
.global lbl_802F5EE0
lbl_802F5EE0:
	.incbin "baserom.dol", 0x1EF900, 0x8
.global lbl_802F5EE8
lbl_802F5EE8:
	.incbin "baserom.dol", 0x1EF908, 0x4
.global lbl_802F5EEC
lbl_802F5EEC:
	.incbin "baserom.dol", 0x1EF90C, 0x4
.global lbl_802F5EF0
lbl_802F5EF0:
	.incbin "baserom.dol", 0x1EF910, 0x8
.global lbl_802F5EF8
lbl_802F5EF8:
	.incbin "baserom.dol", 0x1EF918, 0x8
.global lbl_802F5F00
lbl_802F5F00:
	.incbin "baserom.dol", 0x1EF920, 0x4
.global lbl_802F5F04
lbl_802F5F04:
	.incbin "baserom.dol", 0x1EF924, 0x4
.global lbl_802F5F08
lbl_802F5F08:
	.incbin "baserom.dol", 0x1EF928, 0x4
.global lbl_802F5F0C
lbl_802F5F0C:
	.incbin "baserom.dol", 0x1EF92C, 0x4
.global lbl_802F5F10
lbl_802F5F10:
	.incbin "baserom.dol", 0x1EF930, 0x4
.global lbl_802F5F14
lbl_802F5F14:
	.incbin "baserom.dol", 0x1EF934, 0x4
.global lbl_802F5F18
lbl_802F5F18:
	.incbin "baserom.dol", 0x1EF938, 0x4
.global lbl_802F5F1C
lbl_802F5F1C:
	.incbin "baserom.dol", 0x1EF93C, 0x4
.global lbl_802F5F20
lbl_802F5F20:
	.incbin "baserom.dol", 0x1EF940, 0x4
.global lbl_802F5F24
lbl_802F5F24:
	.incbin "baserom.dol", 0x1EF944, 0x4
.global lbl_802F5F28
lbl_802F5F28:
	.incbin "baserom.dol", 0x1EF948, 0x8
.global lbl_802F5F30
lbl_802F5F30:
	.incbin "baserom.dol", 0x1EF950, 0x8
.global lbl_802F5F38
lbl_802F5F38:
	.incbin "baserom.dol", 0x1EF958, 0x8
.global lbl_802F5F40
lbl_802F5F40:
	.incbin "baserom.dol", 0x1EF960, 0x4
.global lbl_802F5F44
lbl_802F5F44:
	.incbin "baserom.dol", 0x1EF964, 0x4
.global lbl_802F5F48
lbl_802F5F48:
	.incbin "baserom.dol", 0x1EF968, 0x8
.global lbl_802F5F50
lbl_802F5F50:
	.incbin "baserom.dol", 0x1EF970, 0x8
.global lbl_802F5F58
lbl_802F5F58:
	.incbin "baserom.dol", 0x1EF978, 0x4
.global lbl_802F5F5C
lbl_802F5F5C:
	.incbin "baserom.dol", 0x1EF97C, 0x4
.global lbl_802F5F60
lbl_802F5F60:
	.incbin "baserom.dol", 0x1EF980, 0x8
.global lbl_802F5F68
lbl_802F5F68:
	.incbin "baserom.dol", 0x1EF988, 0x8
.global lbl_802F5F70
lbl_802F5F70:
	.incbin "baserom.dol", 0x1EF990, 0x8
.global lbl_802F5F78
lbl_802F5F78:
	.incbin "baserom.dol", 0x1EF998, 0x8
.global lbl_802F5F80
lbl_802F5F80:
	.incbin "baserom.dol", 0x1EF9A0, 0x8
.global lbl_802F5F88
lbl_802F5F88:
	.incbin "baserom.dol", 0x1EF9A8, 0x8
.global lbl_802F5F90
lbl_802F5F90:
	.incbin "baserom.dol", 0x1EF9B0, 0x8
.global lbl_802F5F98
lbl_802F5F98:
	.incbin "baserom.dol", 0x1EF9B8, 0x8
.global lbl_802F5FA0
lbl_802F5FA0:
	.incbin "baserom.dol", 0x1EF9C0, 0x8
.global lbl_802F5FA8
lbl_802F5FA8:
	.incbin "baserom.dol", 0x1EF9C8, 0x8
.global lbl_802F5FB0
lbl_802F5FB0:
	.incbin "baserom.dol", 0x1EF9D0, 0x8
.global lbl_802F5FB8
lbl_802F5FB8:
	.incbin "baserom.dol", 0x1EF9D8, 0x8
.global lbl_802F5FC0
lbl_802F5FC0:
	.incbin "baserom.dol", 0x1EF9E0, 0x8
.global lbl_802F5FC8
lbl_802F5FC8:
	.incbin "baserom.dol", 0x1EF9E8, 0x8
.global lbl_802F5FD0
lbl_802F5FD0:
	.incbin "baserom.dol", 0x1EF9F0, 0x4
.global lbl_802F5FD4
lbl_802F5FD4:
	.incbin "baserom.dol", 0x1EF9F4, 0x4
.global lbl_802F5FD8
lbl_802F5FD8:
	.incbin "baserom.dol", 0x1EF9F8, 0x4
.global lbl_802F5FDC
lbl_802F5FDC:
	.incbin "baserom.dol", 0x1EF9FC, 0x4
.global lbl_802F5FE0
lbl_802F5FE0:
	.incbin "baserom.dol", 0x1EFA00, 0x8
.global lbl_802F5FE8
lbl_802F5FE8:
	.incbin "baserom.dol", 0x1EFA08, 0x8
.global lbl_802F5FF0
lbl_802F5FF0:
	.incbin "baserom.dol", 0x1EFA10, 0x8
.global lbl_802F5FF8
lbl_802F5FF8:
	.incbin "baserom.dol", 0x1EFA18, 0x8
.global lbl_802F6000
lbl_802F6000:
	.incbin "baserom.dol", 0x1EFA20, 0x8
.global lbl_802F6008
lbl_802F6008:
	.incbin "baserom.dol", 0x1EFA28, 0x4
.global lbl_802F600C
lbl_802F600C:
	.incbin "baserom.dol", 0x1EFA2C, 0x4
.global lbl_802F6010
lbl_802F6010:
	.incbin "baserom.dol", 0x1EFA30, 0x8
.global lbl_802F6018
lbl_802F6018:
	.incbin "baserom.dol", 0x1EFA38, 0x4
.global lbl_802F601C
lbl_802F601C:
	.incbin "baserom.dol", 0x1EFA3C, 0x4
.global lbl_802F6020
lbl_802F6020:
	.incbin "baserom.dol", 0x1EFA40, 0x4
.global lbl_802F6024
lbl_802F6024:
	.incbin "baserom.dol", 0x1EFA44, 0x4
.global lbl_802F6028
lbl_802F6028:
	.incbin "baserom.dol", 0x1EFA48, 0x4
.global lbl_802F602C
lbl_802F602C:
	.incbin "baserom.dol", 0x1EFA4C, 0x4
.global lbl_802F6030
lbl_802F6030:
	.incbin "baserom.dol", 0x1EFA50, 0x4
.global lbl_802F6034
lbl_802F6034:
	.incbin "baserom.dol", 0x1EFA54, 0x4
.global lbl_802F6038
lbl_802F6038:
	.incbin "baserom.dol", 0x1EFA58, 0x8
.global lbl_802F6040
lbl_802F6040:
	.incbin "baserom.dol", 0x1EFA60, 0x4
.global lbl_802F6044
lbl_802F6044:
	.incbin "baserom.dol", 0x1EFA64, 0x4
.global lbl_802F6048
lbl_802F6048:
	.incbin "baserom.dol", 0x1EFA68, 0x4
.global lbl_802F604C
lbl_802F604C:
	.incbin "baserom.dol", 0x1EFA6C, 0x4
.global lbl_802F6050
lbl_802F6050:
	.incbin "baserom.dol", 0x1EFA70, 0x8
.global lbl_802F6058
lbl_802F6058:
	.incbin "baserom.dol", 0x1EFA78, 0x8
.global lbl_802F6060
lbl_802F6060:
	.incbin "baserom.dol", 0x1EFA80, 0x8
.global lbl_802F6068
lbl_802F6068:
	.incbin "baserom.dol", 0x1EFA88, 0x8
.global lbl_802F6070
lbl_802F6070:
	.incbin "baserom.dol", 0x1EFA90, 0x8
.global lbl_802F6078
lbl_802F6078:
	.incbin "baserom.dol", 0x1EFA98, 0x8
.global lbl_802F6080
lbl_802F6080:
	.incbin "baserom.dol", 0x1EFAA0, 0x8
.global lbl_802F6088
lbl_802F6088:
	.incbin "baserom.dol", 0x1EFAA8, 0x8
.global lbl_802F6090
lbl_802F6090:
	.incbin "baserom.dol", 0x1EFAB0, 0x8
.global lbl_802F6098
lbl_802F6098:
	.incbin "baserom.dol", 0x1EFAB8, 0x8
.global lbl_802F60A0
lbl_802F60A0:
	.incbin "baserom.dol", 0x1EFAC0, 0x8
.global lbl_802F60A8
lbl_802F60A8:
	.incbin "baserom.dol", 0x1EFAC8, 0x8
.global lbl_802F60B0
lbl_802F60B0:
	.incbin "baserom.dol", 0x1EFAD0, 0x8
.global lbl_802F60B8
lbl_802F60B8:
	.incbin "baserom.dol", 0x1EFAD8, 0x4
.global lbl_802F60BC
lbl_802F60BC:
	.incbin "baserom.dol", 0x1EFADC, 0x4
.global lbl_802F60C0
lbl_802F60C0:
	.incbin "baserom.dol", 0x1EFAE0, 0x4
.global lbl_802F60C4
lbl_802F60C4:
	.incbin "baserom.dol", 0x1EFAE4, 0x4
.global lbl_802F60C8
lbl_802F60C8:
	.incbin "baserom.dol", 0x1EFAE8, 0x4
.global lbl_802F60CC
lbl_802F60CC:
	.incbin "baserom.dol", 0x1EFAEC, 0x4
.global lbl_802F60D0
lbl_802F60D0:
	.incbin "baserom.dol", 0x1EFAF0, 0x4
.global lbl_802F60D4
lbl_802F60D4:
	.incbin "baserom.dol", 0x1EFAF4, 0x4
.global lbl_802F60D8
lbl_802F60D8:
	.incbin "baserom.dol", 0x1EFAF8, 0x8
.global lbl_802F60E0
lbl_802F60E0:
	.incbin "baserom.dol", 0x1EFB00, 0x8
.global lbl_802F60E8
lbl_802F60E8:
	.incbin "baserom.dol", 0x1EFB08, 0x8
.global lbl_802F60F0
lbl_802F60F0:
	.incbin "baserom.dol", 0x1EFB10, 0x8
.global lbl_802F60F8
lbl_802F60F8:
	.incbin "baserom.dol", 0x1EFB18, 0x8
.global lbl_802F6100
lbl_802F6100:
	.incbin "baserom.dol", 0x1EFB20, 0x8
.global lbl_802F6108
lbl_802F6108:
	.incbin "baserom.dol", 0x1EFB28, 0x8
.global lbl_802F6110
lbl_802F6110:
	.incbin "baserom.dol", 0x1EFB30, 0x8
.global lbl_802F6118
lbl_802F6118:
	.incbin "baserom.dol", 0x1EFB38, 0x8
.global lbl_802F6120
lbl_802F6120:
	.incbin "baserom.dol", 0x1EFB40, 0x8
.global lbl_802F6128
lbl_802F6128:
	.incbin "baserom.dol", 0x1EFB48, 0x4
.global lbl_802F612C
lbl_802F612C:
	.incbin "baserom.dol", 0x1EFB4C, 0x4
.global lbl_802F6130
lbl_802F6130:
	.incbin "baserom.dol", 0x1EFB50, 0x8
.global lbl_802F6138
lbl_802F6138:
	.incbin "baserom.dol", 0x1EFB58, 0x8
.global lbl_802F6140
lbl_802F6140:
	.incbin "baserom.dol", 0x1EFB60, 0x8
.global lbl_802F6148
lbl_802F6148:
	.incbin "baserom.dol", 0x1EFB68, 0x8
.global lbl_802F6150
lbl_802F6150:
	.incbin "baserom.dol", 0x1EFB70, 0x8
.global lbl_802F6158
lbl_802F6158:
	.incbin "baserom.dol", 0x1EFB78, 0x8
.global lbl_802F6160
lbl_802F6160:
	.incbin "baserom.dol", 0x1EFB80, 0x8
.global lbl_802F6168
lbl_802F6168:
	.incbin "baserom.dol", 0x1EFB88, 0x8
.global lbl_802F6170
lbl_802F6170:
	.incbin "baserom.dol", 0x1EFB90, 0x8
.global lbl_802F6178
lbl_802F6178:
	.incbin "baserom.dol", 0x1EFB98, 0x8
.global lbl_802F6180
lbl_802F6180:
	.incbin "baserom.dol", 0x1EFBA0, 0x8
.global lbl_802F6188
lbl_802F6188:
	.incbin "baserom.dol", 0x1EFBA8, 0x8
.global lbl_802F6190
lbl_802F6190:
	.incbin "baserom.dol", 0x1EFBB0, 0x8
.global lbl_802F6198
lbl_802F6198:
	.incbin "baserom.dol", 0x1EFBB8, 0x8
.global lbl_802F61A0
lbl_802F61A0:
	.incbin "baserom.dol", 0x1EFBC0, 0x4
.global lbl_802F61A4
lbl_802F61A4:
	.incbin "baserom.dol", 0x1EFBC4, 0x4
.global lbl_802F61A8
lbl_802F61A8:
	.incbin "baserom.dol", 0x1EFBC8, 0x8
.global lbl_802F61B0
lbl_802F61B0:
	.incbin "baserom.dol", 0x1EFBD0, 0x4
.global lbl_802F61B4
lbl_802F61B4:
	.incbin "baserom.dol", 0x1EFBD4, 0x4
.global lbl_802F61B8
lbl_802F61B8:
	.incbin "baserom.dol", 0x1EFBD8, 0x8
.global lbl_802F61C0
lbl_802F61C0:
	.incbin "baserom.dol", 0x1EFBE0, 0x8
.global lbl_802F61C8
lbl_802F61C8:
	.incbin "baserom.dol", 0x1EFBE8, 0x8
.global lbl_802F61D0
lbl_802F61D0:
	.incbin "baserom.dol", 0x1EFBF0, 0x8
.global lbl_802F61D8
lbl_802F61D8:
	.incbin "baserom.dol", 0x1EFBF8, 0x8
.global lbl_802F61E0
lbl_802F61E0:
	.incbin "baserom.dol", 0x1EFC00, 0x8
.global lbl_802F61E8
lbl_802F61E8:
	.incbin "baserom.dol", 0x1EFC08, 0x8
.global lbl_802F61F0
lbl_802F61F0:
	.incbin "baserom.dol", 0x1EFC10, 0x8
.global lbl_802F61F8
lbl_802F61F8:
	.incbin "baserom.dol", 0x1EFC18, 0x8
.global lbl_802F6200
lbl_802F6200:
	.incbin "baserom.dol", 0x1EFC20, 0x8
.global lbl_802F6208
lbl_802F6208:
	.incbin "baserom.dol", 0x1EFC28, 0x8
.global lbl_802F6210
lbl_802F6210:
	.incbin "baserom.dol", 0x1EFC30, 0x8
.global lbl_802F6218
lbl_802F6218:
	.incbin "baserom.dol", 0x1EFC38, 0x8
.global lbl_802F6220
lbl_802F6220:
	.incbin "baserom.dol", 0x1EFC40, 0x4
.global lbl_802F6224
lbl_802F6224:
	.incbin "baserom.dol", 0x1EFC44, 0x4
.global lbl_802F6228
lbl_802F6228:
	.incbin "baserom.dol", 0x1EFC48, 0x8
.global lbl_802F6230
lbl_802F6230:
	.incbin "baserom.dol", 0x1EFC50, 0x8
.global lbl_802F6238
lbl_802F6238:
	.incbin "baserom.dol", 0x1EFC58, 0x4
.global lbl_802F623C
lbl_802F623C:
	.incbin "baserom.dol", 0x1EFC5C, 0x4
.global lbl_802F6240
lbl_802F6240:
	.incbin "baserom.dol", 0x1EFC60, 0x4
.global lbl_802F6244
lbl_802F6244:
	.incbin "baserom.dol", 0x1EFC64, 0x4
.global lbl_802F6248
lbl_802F6248:
	.incbin "baserom.dol", 0x1EFC68, 0x4
.global lbl_802F624C
lbl_802F624C:
	.incbin "baserom.dol", 0x1EFC6C, 0x4
.global lbl_802F6250
lbl_802F6250:
	.incbin "baserom.dol", 0x1EFC70, 0x4
.global lbl_802F6254
lbl_802F6254:
	.incbin "baserom.dol", 0x1EFC74, 0x4
.global lbl_802F6258
lbl_802F6258:
	.incbin "baserom.dol", 0x1EFC78, 0x4
.global lbl_802F625C
lbl_802F625C:
	.incbin "baserom.dol", 0x1EFC7C, 0x4
.global lbl_802F6260
lbl_802F6260:
	.incbin "baserom.dol", 0x1EFC80, 0x4
.global lbl_802F6264
lbl_802F6264:
	.incbin "baserom.dol", 0x1EFC84, 0x4
.global lbl_802F6268
lbl_802F6268:
	.incbin "baserom.dol", 0x1EFC88, 0x4
.global lbl_802F626C
lbl_802F626C:
	.incbin "baserom.dol", 0x1EFC8C, 0x4
.global lbl_802F6270
lbl_802F6270:
	.incbin "baserom.dol", 0x1EFC90, 0x4
.global lbl_802F6274
lbl_802F6274:
	.incbin "baserom.dol", 0x1EFC94, 0x4
.global lbl_802F6278
lbl_802F6278:
	.incbin "baserom.dol", 0x1EFC98, 0x4
.global lbl_802F627C
lbl_802F627C:
	.incbin "baserom.dol", 0x1EFC9C, 0x4
.global lbl_802F6280
lbl_802F6280:
	.incbin "baserom.dol", 0x1EFCA0, 0x4
.global lbl_802F6284
lbl_802F6284:
	.incbin "baserom.dol", 0x1EFCA4, 0x4
.global lbl_802F6288
lbl_802F6288:
	.incbin "baserom.dol", 0x1EFCA8, 0x8
.global lbl_802F6290
lbl_802F6290:
	.incbin "baserom.dol", 0x1EFCB0, 0x8
.global lbl_802F6298
lbl_802F6298:
	.incbin "baserom.dol", 0x1EFCB8, 0x8
.global lbl_802F62A0
lbl_802F62A0:
	.incbin "baserom.dol", 0x1EFCC0, 0x8
.global lbl_802F62A8
lbl_802F62A8:
	.incbin "baserom.dol", 0x1EFCC8, 0x4
.global lbl_802F62AC
lbl_802F62AC:
	.incbin "baserom.dol", 0x1EFCCC, 0x4
.global lbl_802F62B0
lbl_802F62B0:
	.incbin "baserom.dol", 0x1EFCD0, 0x4
.global lbl_802F62B4
lbl_802F62B4:
	.incbin "baserom.dol", 0x1EFCD4, 0x4
.global lbl_802F62B8
lbl_802F62B8:
	.incbin "baserom.dol", 0x1EFCD8, 0x8
.global lbl_802F62C0
lbl_802F62C0:
	.incbin "baserom.dol", 0x1EFCE0, 0x8
.global lbl_802F62C8
lbl_802F62C8:
	.incbin "baserom.dol", 0x1EFCE8, 0x8
.global lbl_802F62D0
lbl_802F62D0:
	.incbin "baserom.dol", 0x1EFCF0, 0x8
.global lbl_802F62D8
lbl_802F62D8:
	.incbin "baserom.dol", 0x1EFCF8, 0x8
.global lbl_802F62E0
lbl_802F62E0:
	.incbin "baserom.dol", 0x1EFD00, 0x8
.global lbl_802F62E8
lbl_802F62E8:
	.incbin "baserom.dol", 0x1EFD08, 0x8
.global lbl_802F62F0
lbl_802F62F0:
	.incbin "baserom.dol", 0x1EFD10, 0x8
.global lbl_802F62F8
lbl_802F62F8:
	.incbin "baserom.dol", 0x1EFD18, 0x8
.global lbl_802F6300
lbl_802F6300:
	.incbin "baserom.dol", 0x1EFD20, 0x8
.global lbl_802F6308
lbl_802F6308:
	.incbin "baserom.dol", 0x1EFD28, 0x4
.global lbl_802F630C
lbl_802F630C:
	.incbin "baserom.dol", 0x1EFD2C, 0x4
.global lbl_802F6310
lbl_802F6310:
	.incbin "baserom.dol", 0x1EFD30, 0x4
.global lbl_802F6314
lbl_802F6314:
	.incbin "baserom.dol", 0x1EFD34, 0x4
.global lbl_802F6318
lbl_802F6318:
	.incbin "baserom.dol", 0x1EFD38, 0x8
.global lbl_802F6320
lbl_802F6320:
	.incbin "baserom.dol", 0x1EFD40, 0x8
.global lbl_802F6328
lbl_802F6328:
	.incbin "baserom.dol", 0x1EFD48, 0x8
.global lbl_802F6330
lbl_802F6330:
	.incbin "baserom.dol", 0x1EFD50, 0x8
.global lbl_802F6338
lbl_802F6338:
	.incbin "baserom.dol", 0x1EFD58, 0x8
.global lbl_802F6340
lbl_802F6340:
	.incbin "baserom.dol", 0x1EFD60, 0x4
.global lbl_802F6344
lbl_802F6344:
	.incbin "baserom.dol", 0x1EFD64, 0x4
.global lbl_802F6348
lbl_802F6348:
	.incbin "baserom.dol", 0x1EFD68, 0x8
.global lbl_802F6350
lbl_802F6350:
	.incbin "baserom.dol", 0x1EFD70, 0x8
.global lbl_802F6358
lbl_802F6358:
	.incbin "baserom.dol", 0x1EFD78, 0x8
.global lbl_802F6360
lbl_802F6360:
	.incbin "baserom.dol", 0x1EFD80, 0x8
.global lbl_802F6368
lbl_802F6368:
	.incbin "baserom.dol", 0x1EFD88, 0x4
.global lbl_802F636C
lbl_802F636C:
	.incbin "baserom.dol", 0x1EFD8C, 0x4
.global lbl_802F6370
lbl_802F6370:
	.incbin "baserom.dol", 0x1EFD90, 0x8
.global lbl_802F6378
lbl_802F6378:
	.incbin "baserom.dol", 0x1EFD98, 0x8
.global lbl_802F6380
lbl_802F6380:
	.incbin "baserom.dol", 0x1EFDA0, 0x8
.global lbl_802F6388
lbl_802F6388:
	.incbin "baserom.dol", 0x1EFDA8, 0x8
.global lbl_802F6390
lbl_802F6390:
	.incbin "baserom.dol", 0x1EFDB0, 0x8
.global lbl_802F6398
lbl_802F6398:
	.incbin "baserom.dol", 0x1EFDB8, 0x4
.global lbl_802F639C
lbl_802F639C:
	.incbin "baserom.dol", 0x1EFDBC, 0x4
.global lbl_802F63A0
lbl_802F63A0:
	.incbin "baserom.dol", 0x1EFDC0, 0x8
.global lbl_802F63A8
lbl_802F63A8:
	.incbin "baserom.dol", 0x1EFDC8, 0x8
.global lbl_802F63B0
lbl_802F63B0:
	.incbin "baserom.dol", 0x1EFDD0, 0x8
.global lbl_802F63B8
lbl_802F63B8:
	.incbin "baserom.dol", 0x1EFDD8, 0x8
.global lbl_802F63C0
lbl_802F63C0:
	.incbin "baserom.dol", 0x1EFDE0, 0x8
.global lbl_802F63C8
lbl_802F63C8:
	.incbin "baserom.dol", 0x1EFDE8, 0x8
.global lbl_802F63D0
lbl_802F63D0:
	.incbin "baserom.dol", 0x1EFDF0, 0x4
.global lbl_802F63D4
lbl_802F63D4:
	.incbin "baserom.dol", 0x1EFDF4, 0x4
.global lbl_802F63D8
lbl_802F63D8:
	.incbin "baserom.dol", 0x1EFDF8, 0x8
.global lbl_802F63E0
lbl_802F63E0:
	.incbin "baserom.dol", 0x1EFE00, 0x8
.global lbl_802F63E8
lbl_802F63E8:
	.incbin "baserom.dol", 0x1EFE08, 0x8
.global lbl_802F63F0
lbl_802F63F0:
	.incbin "baserom.dol", 0x1EFE10, 0x8
.global lbl_802F63F8
lbl_802F63F8:
	.incbin "baserom.dol", 0x1EFE18, 0x4
.global lbl_802F63FC
lbl_802F63FC:
	.incbin "baserom.dol", 0x1EFE1C, 0x4
.global lbl_802F6400
lbl_802F6400:
	.incbin "baserom.dol", 0x1EFE20, 0x4
.global lbl_802F6404
lbl_802F6404:
	.incbin "baserom.dol", 0x1EFE24, 0x4
.global lbl_802F6408
lbl_802F6408:
	.incbin "baserom.dol", 0x1EFE28, 0x8
.global lbl_802F6410
lbl_802F6410:
	.incbin "baserom.dol", 0x1EFE30, 0x8
.global lbl_802F6418
lbl_802F6418:
	.incbin "baserom.dol", 0x1EFE38, 0x8
.global lbl_802F6420
lbl_802F6420:
	.incbin "baserom.dol", 0x1EFE40, 0x8
.global lbl_802F6428
lbl_802F6428:
	.incbin "baserom.dol", 0x1EFE48, 0x8
.global lbl_802F6430
lbl_802F6430:
	.incbin "baserom.dol", 0x1EFE50, 0x8
.global lbl_802F6438
lbl_802F6438:
	.incbin "baserom.dol", 0x1EFE58, 0x4
.global lbl_802F643C
lbl_802F643C:
	.incbin "baserom.dol", 0x1EFE5C, 0x4
.global lbl_802F6440
lbl_802F6440:
	.incbin "baserom.dol", 0x1EFE60, 0x8
.global lbl_802F6448
lbl_802F6448:
	.incbin "baserom.dol", 0x1EFE68, 0x8
.global lbl_802F6450
lbl_802F6450:
	.incbin "baserom.dol", 0x1EFE70, 0x8
.global lbl_802F6458
lbl_802F6458:
	.incbin "baserom.dol", 0x1EFE78, 0x8
.global lbl_802F6460
lbl_802F6460:
	.incbin "baserom.dol", 0x1EFE80, 0x4
.global lbl_802F6464
lbl_802F6464:
	.incbin "baserom.dol", 0x1EFE84, 0x4
.global lbl_802F6468
lbl_802F6468:
	.incbin "baserom.dol", 0x1EFE88, 0x8
.global lbl_802F6470
lbl_802F6470:
	.incbin "baserom.dol", 0x1EFE90, 0x8
.global lbl_802F6478
lbl_802F6478:
	.incbin "baserom.dol", 0x1EFE98, 0x8
.global lbl_802F6480
lbl_802F6480:
	.incbin "baserom.dol", 0x1EFEA0, 0x8
.global lbl_802F6488
lbl_802F6488:
	.incbin "baserom.dol", 0x1EFEA8, 0x8
.global lbl_802F6490
lbl_802F6490:
	.incbin "baserom.dol", 0x1EFEB0, 0x8
.global lbl_802F6498
lbl_802F6498:
	.incbin "baserom.dol", 0x1EFEB8, 0x8
.global lbl_802F64A0
lbl_802F64A0:
	.incbin "baserom.dol", 0x1EFEC0, 0x4
.global lbl_802F64A4
lbl_802F64A4:
	.incbin "baserom.dol", 0x1EFEC4, 0x4
.global lbl_802F64A8
lbl_802F64A8:
	.incbin "baserom.dol", 0x1EFEC8, 0x8
.global lbl_802F64B0
lbl_802F64B0:
	.incbin "baserom.dol", 0x1EFED0, 0x8
.global lbl_802F64B8
lbl_802F64B8:
	.incbin "baserom.dol", 0x1EFED8, 0x8
.global lbl_802F64C0
lbl_802F64C0:
	.incbin "baserom.dol", 0x1EFEE0, 0x8
.global lbl_802F64C8
lbl_802F64C8:
	.incbin "baserom.dol", 0x1EFEE8, 0x4
.global lbl_802F64CC
lbl_802F64CC:
	.incbin "baserom.dol", 0x1EFEEC, 0x4
.global lbl_802F64D0
lbl_802F64D0:
	.incbin "baserom.dol", 0x1EFEF0, 0x4
.global lbl_802F64D4
lbl_802F64D4:
	.incbin "baserom.dol", 0x1EFEF4, 0x4
.global lbl_802F64D8
lbl_802F64D8:
	.incbin "baserom.dol", 0x1EFEF8, 0x4
.global lbl_802F64DC
lbl_802F64DC:
	.incbin "baserom.dol", 0x1EFEFC, 0x4
.global lbl_802F64E0
lbl_802F64E0:
	.incbin "baserom.dol", 0x1EFF00, 0x4
.global lbl_802F64E4
lbl_802F64E4:
	.incbin "baserom.dol", 0x1EFF04, 0x4
.global lbl_802F64E8
lbl_802F64E8:
	.incbin "baserom.dol", 0x1EFF08, 0x8
.global lbl_802F64F0
lbl_802F64F0:
	.incbin "baserom.dol", 0x1EFF10, 0x8
.global lbl_802F64F8
lbl_802F64F8:
	.incbin "baserom.dol", 0x1EFF18, 0x4
.global lbl_802F64FC
lbl_802F64FC:
	.incbin "baserom.dol", 0x1EFF1C, 0x4
.global lbl_802F6500
lbl_802F6500:
	.incbin "baserom.dol", 0x1EFF20, 0x4
.global lbl_802F6504
lbl_802F6504:
	.incbin "baserom.dol", 0x1EFF24, 0x4
.global lbl_802F6508
lbl_802F6508:
	.incbin "baserom.dol", 0x1EFF28, 0x4
.global lbl_802F650C
lbl_802F650C:
	.incbin "baserom.dol", 0x1EFF2C, 0x4
.global lbl_802F6510
lbl_802F6510:
	.incbin "baserom.dol", 0x1EFF30, 0x4
.global lbl_802F6514
lbl_802F6514:
	.incbin "baserom.dol", 0x1EFF34, 0x4
.global lbl_802F6518
lbl_802F6518:
	.incbin "baserom.dol", 0x1EFF38, 0x4
.global lbl_802F651C
lbl_802F651C:
	.incbin "baserom.dol", 0x1EFF3C, 0x4
.global lbl_802F6520
lbl_802F6520:
	.incbin "baserom.dol", 0x1EFF40, 0x4
.global lbl_802F6524
lbl_802F6524:
	.incbin "baserom.dol", 0x1EFF44, 0x4
.global lbl_802F6528
lbl_802F6528:
	.incbin "baserom.dol", 0x1EFF48, 0x4
.global lbl_802F652C
lbl_802F652C:
	.incbin "baserom.dol", 0x1EFF4C, 0x4
.global lbl_802F6530
lbl_802F6530:
	.incbin "baserom.dol", 0x1EFF50, 0x4
.global lbl_802F6534
lbl_802F6534:
	.incbin "baserom.dol", 0x1EFF54, 0x4
.global lbl_802F6538
lbl_802F6538:
	.incbin "baserom.dol", 0x1EFF58, 0x4
.global lbl_802F653C
lbl_802F653C:
	.incbin "baserom.dol", 0x1EFF5C, 0x4
.global lbl_802F6540
lbl_802F6540:
	.incbin "baserom.dol", 0x1EFF60, 0x4
.global lbl_802F6544
lbl_802F6544:
	.incbin "baserom.dol", 0x1EFF64, 0x4
.global lbl_802F6548
lbl_802F6548:
	.incbin "baserom.dol", 0x1EFF68, 0x4
.global lbl_802F654C
lbl_802F654C:
	.incbin "baserom.dol", 0x1EFF6C, 0x4
.global lbl_802F6550
lbl_802F6550:
	.incbin "baserom.dol", 0x1EFF70, 0x4
.global lbl_802F6554
lbl_802F6554:
	.incbin "baserom.dol", 0x1EFF74, 0x4
.global lbl_802F6558
lbl_802F6558:
	.incbin "baserom.dol", 0x1EFF78, 0x4
.global lbl_802F655C
lbl_802F655C:
	.incbin "baserom.dol", 0x1EFF7C, 0x4
.global lbl_802F6560
lbl_802F6560:
	.incbin "baserom.dol", 0x1EFF80, 0x4
.global lbl_802F6564
lbl_802F6564:
	.incbin "baserom.dol", 0x1EFF84, 0x4
.global lbl_802F6568
lbl_802F6568:
	.incbin "baserom.dol", 0x1EFF88, 0x4
.global lbl_802F656C
lbl_802F656C:
	.incbin "baserom.dol", 0x1EFF8C, 0x4
.global lbl_802F6570
lbl_802F6570:
	.incbin "baserom.dol", 0x1EFF90, 0x4
.global lbl_802F6574
lbl_802F6574:
	.incbin "baserom.dol", 0x1EFF94, 0x4
.global lbl_802F6578
lbl_802F6578:
	.incbin "baserom.dol", 0x1EFF98, 0x4
.global lbl_802F657C
lbl_802F657C:
	.incbin "baserom.dol", 0x1EFF9C, 0x4
.global lbl_802F6580
lbl_802F6580:
	.incbin "baserom.dol", 0x1EFFA0, 0x4
.global lbl_802F6584
lbl_802F6584:
	.incbin "baserom.dol", 0x1EFFA4, 0x4
.global lbl_802F6588
lbl_802F6588:
	.incbin "baserom.dol", 0x1EFFA8, 0x4
.global lbl_802F658C
lbl_802F658C:
	.incbin "baserom.dol", 0x1EFFAC, 0x4
.global lbl_802F6590
lbl_802F6590:
	.incbin "baserom.dol", 0x1EFFB0, 0x4
.global lbl_802F6594
lbl_802F6594:
	.incbin "baserom.dol", 0x1EFFB4, 0x4
.global lbl_802F6598
lbl_802F6598:
	.incbin "baserom.dol", 0x1EFFB8, 0x4
.global lbl_802F659C
lbl_802F659C:
	.incbin "baserom.dol", 0x1EFFBC, 0x4
.global lbl_802F65A0
lbl_802F65A0:
	.incbin "baserom.dol", 0x1EFFC0, 0x4
.global lbl_802F65A4
lbl_802F65A4:
	.incbin "baserom.dol", 0x1EFFC4, 0x4
.global lbl_802F65A8
lbl_802F65A8:
	.incbin "baserom.dol", 0x1EFFC8, 0x4
.global lbl_802F65AC
lbl_802F65AC:
	.incbin "baserom.dol", 0x1EFFCC, 0x4
.global lbl_802F65B0
lbl_802F65B0:
	.incbin "baserom.dol", 0x1EFFD0, 0x4
.global lbl_802F65B4
lbl_802F65B4:
	.incbin "baserom.dol", 0x1EFFD4, 0x4
.global lbl_802F65B8
lbl_802F65B8:
	.incbin "baserom.dol", 0x1EFFD8, 0x4
.global lbl_802F65BC
lbl_802F65BC:
	.incbin "baserom.dol", 0x1EFFDC, 0x4
.global lbl_802F65C0
lbl_802F65C0:
	.incbin "baserom.dol", 0x1EFFE0, 0x4
.global lbl_802F65C4
lbl_802F65C4:
	.incbin "baserom.dol", 0x1EFFE4, 0x4
.global lbl_802F65C8
lbl_802F65C8:
	.incbin "baserom.dol", 0x1EFFE8, 0x4
.global lbl_802F65CC
lbl_802F65CC:
	.incbin "baserom.dol", 0x1EFFEC, 0x4
.global lbl_802F65D0
lbl_802F65D0:
	.incbin "baserom.dol", 0x1EFFF0, 0x4
.global lbl_802F65D4
lbl_802F65D4:
	.incbin "baserom.dol", 0x1EFFF4, 0x4
.global lbl_802F65D8
lbl_802F65D8:
	.incbin "baserom.dol", 0x1EFFF8, 0x4
.global lbl_802F65DC
lbl_802F65DC:
	.incbin "baserom.dol", 0x1EFFFC, 0x4
.global lbl_802F65E0
lbl_802F65E0:
	.incbin "baserom.dol", 0x1F0000, 0x4
.global lbl_802F65E4
lbl_802F65E4:
	.incbin "baserom.dol", 0x1F0004, 0x4
.global lbl_802F65E8
lbl_802F65E8:
	.incbin "baserom.dol", 0x1F0008, 0x4
.global lbl_802F65EC
lbl_802F65EC:
	.incbin "baserom.dol", 0x1F000C, 0x4
.global lbl_802F65F0
lbl_802F65F0:
	.incbin "baserom.dol", 0x1F0010, 0x4
.global lbl_802F65F4
lbl_802F65F4:
	.incbin "baserom.dol", 0x1F0014, 0x4
.global lbl_802F65F8
lbl_802F65F8:
	.incbin "baserom.dol", 0x1F0018, 0x4
.global lbl_802F65FC
lbl_802F65FC:
	.incbin "baserom.dol", 0x1F001C, 0x4
.global lbl_802F6600
lbl_802F6600:
	.incbin "baserom.dol", 0x1F0020, 0x4
.global lbl_802F6604
lbl_802F6604:
	.incbin "baserom.dol", 0x1F0024, 0x4
.global lbl_802F6608
lbl_802F6608:
	.incbin "baserom.dol", 0x1F0028, 0x4
.global lbl_802F660C
lbl_802F660C:
	.incbin "baserom.dol", 0x1F002C, 0x4
.global lbl_802F6610
lbl_802F6610:
	.incbin "baserom.dol", 0x1F0030, 0x4
.global lbl_802F6614
lbl_802F6614:
	.incbin "baserom.dol", 0x1F0034, 0x4
.global lbl_802F6618
lbl_802F6618:
	.incbin "baserom.dol", 0x1F0038, 0x4
.global lbl_802F661C
lbl_802F661C:
	.incbin "baserom.dol", 0x1F003C, 0x4
.global lbl_802F6620
lbl_802F6620:
	.incbin "baserom.dol", 0x1F0040, 0x8
.global lbl_802F6628
lbl_802F6628:
	.incbin "baserom.dol", 0x1F0048, 0x8
.global lbl_802F6630
lbl_802F6630:
	.incbin "baserom.dol", 0x1F0050, 0x4
.global lbl_802F6634
lbl_802F6634:
	.incbin "baserom.dol", 0x1F0054, 0x4
.global lbl_802F6638
lbl_802F6638:
	.incbin "baserom.dol", 0x1F0058, 0x4
.global lbl_802F663C
lbl_802F663C:
	.incbin "baserom.dol", 0x1F005C, 0x4
.global lbl_802F6640
lbl_802F6640:
	.incbin "baserom.dol", 0x1F0060, 0x4
.global lbl_802F6644
lbl_802F6644:
	.incbin "baserom.dol", 0x1F0064, 0x4
.global lbl_802F6648
lbl_802F6648:
	.incbin "baserom.dol", 0x1F0068, 0x4
.global lbl_802F664C
lbl_802F664C:
	.incbin "baserom.dol", 0x1F006C, 0x4
.global lbl_802F6650
lbl_802F6650:
	.incbin "baserom.dol", 0x1F0070, 0x4
.global lbl_802F6654
lbl_802F6654:
	.incbin "baserom.dol", 0x1F0074, 0x4
.global lbl_802F6658
lbl_802F6658:
	.incbin "baserom.dol", 0x1F0078, 0x4
.global lbl_802F665C
lbl_802F665C:
	.incbin "baserom.dol", 0x1F007C, 0x4
.global lbl_802F6660
lbl_802F6660:
	.incbin "baserom.dol", 0x1F0080, 0x4
.global lbl_802F6664
lbl_802F6664:
	.incbin "baserom.dol", 0x1F0084, 0x4
.global lbl_802F6668
lbl_802F6668:
	.incbin "baserom.dol", 0x1F0088, 0x8
.global lbl_802F6670
lbl_802F6670:
	.incbin "baserom.dol", 0x1F0090, 0x4
.global lbl_802F6674
lbl_802F6674:
	.incbin "baserom.dol", 0x1F0094, 0x4
.global lbl_802F6678
lbl_802F6678:
	.incbin "baserom.dol", 0x1F0098, 0x4
.global lbl_802F667C
lbl_802F667C:
	.incbin "baserom.dol", 0x1F009C, 0x4
.global lbl_802F6680
lbl_802F6680:
	.incbin "baserom.dol", 0x1F00A0, 0x4
.global lbl_802F6684
lbl_802F6684:
	.incbin "baserom.dol", 0x1F00A4, 0x4
.global lbl_802F6688
lbl_802F6688:
	.incbin "baserom.dol", 0x1F00A8, 0x4
.global lbl_802F668C
lbl_802F668C:
	.incbin "baserom.dol", 0x1F00AC, 0x4
.global lbl_802F6690
lbl_802F6690:
	.incbin "baserom.dol", 0x1F00B0, 0x4
.global lbl_802F6694
lbl_802F6694:
	.incbin "baserom.dol", 0x1F00B4, 0x4
.global lbl_802F6698
lbl_802F6698:
	.incbin "baserom.dol", 0x1F00B8, 0x4
.global lbl_802F669C
lbl_802F669C:
	.incbin "baserom.dol", 0x1F00BC, 0x4
.global lbl_802F66A0
lbl_802F66A0:
	.incbin "baserom.dol", 0x1F00C0, 0x4
.global lbl_802F66A4
lbl_802F66A4:
	.incbin "baserom.dol", 0x1F00C4, 0x4
.global lbl_802F66A8
lbl_802F66A8:
	.incbin "baserom.dol", 0x1F00C8, 0x4
.global lbl_802F66AC
lbl_802F66AC:
	.incbin "baserom.dol", 0x1F00CC, 0x4
.global lbl_802F66B0
lbl_802F66B0:
	.incbin "baserom.dol", 0x1F00D0, 0x4
.global lbl_802F66B4
lbl_802F66B4:
	.incbin "baserom.dol", 0x1F00D4, 0x4
.global lbl_802F66B8
lbl_802F66B8:
	.incbin "baserom.dol", 0x1F00D8, 0x8
.global lbl_802F66C0
lbl_802F66C0:
	.incbin "baserom.dol", 0x1F00E0, 0x8
.global lbl_802F66C8
lbl_802F66C8:
	.incbin "baserom.dol", 0x1F00E8, 0x8
.global lbl_802F66D0
lbl_802F66D0:
	.incbin "baserom.dol", 0x1F00F0, 0x8
.global lbl_802F66D8
lbl_802F66D8:
	.incbin "baserom.dol", 0x1F00F8, 0x4
.global lbl_802F66DC
lbl_802F66DC:
	.incbin "baserom.dol", 0x1F00FC, 0x4
.global lbl_802F66E0
lbl_802F66E0:
	.incbin "baserom.dol", 0x1F0100, 0x4
.global lbl_802F66E4
lbl_802F66E4:
	.incbin "baserom.dol", 0x1F0104, 0x4
.global lbl_802F66E8
lbl_802F66E8:
	.incbin "baserom.dol", 0x1F0108, 0x8
.global lbl_802F66F0
lbl_802F66F0:
	.incbin "baserom.dol", 0x1F0110, 0x4
.global lbl_802F66F4
lbl_802F66F4:
	.incbin "baserom.dol", 0x1F0114, 0x4
.global lbl_802F66F8
lbl_802F66F8:
	.incbin "baserom.dol", 0x1F0118, 0x4
.global lbl_802F66FC
lbl_802F66FC:
	.incbin "baserom.dol", 0x1F011C, 0x4
.global lbl_802F6700
lbl_802F6700:
	.incbin "baserom.dol", 0x1F0120, 0x8
.global lbl_802F6708
lbl_802F6708:
	.incbin "baserom.dol", 0x1F0128, 0x4
.global lbl_802F670C
lbl_802F670C:
	.incbin "baserom.dol", 0x1F012C, 0x4
.global lbl_802F6710
lbl_802F6710:
	.incbin "baserom.dol", 0x1F0130, 0x4
.global lbl_802F6714
lbl_802F6714:
	.incbin "baserom.dol", 0x1F0134, 0x4
.global lbl_802F6718
lbl_802F6718:
	.incbin "baserom.dol", 0x1F0138, 0x4
.global lbl_802F671C
lbl_802F671C:
	.incbin "baserom.dol", 0x1F013C, 0x4
.global lbl_802F6720
lbl_802F6720:
	.incbin "baserom.dol", 0x1F0140, 0x8
.global lbl_802F6728
lbl_802F6728:
	.incbin "baserom.dol", 0x1F0148, 0x8
.global lbl_802F6730
lbl_802F6730:
	.incbin "baserom.dol", 0x1F0150, 0x4
.global lbl_802F6734
lbl_802F6734:
	.incbin "baserom.dol", 0x1F0154, 0x4
.global lbl_802F6738
lbl_802F6738:
	.incbin "baserom.dol", 0x1F0158, 0x8
.global lbl_802F6740
lbl_802F6740:
	.incbin "baserom.dol", 0x1F0160, 0x4
.global lbl_802F6744
lbl_802F6744:
	.incbin "baserom.dol", 0x1F0164, 0x4
.global lbl_802F6748
lbl_802F6748:
	.incbin "baserom.dol", 0x1F0168, 0x4
.global lbl_802F674C
lbl_802F674C:
	.incbin "baserom.dol", 0x1F016C, 0x4
.global lbl_802F6750
lbl_802F6750:
	.incbin "baserom.dol", 0x1F0170, 0x4
.global lbl_802F6754
lbl_802F6754:
	.incbin "baserom.dol", 0x1F0174, 0x4
.global lbl_802F6758
lbl_802F6758:
	.incbin "baserom.dol", 0x1F0178, 0x4
.global lbl_802F675C
lbl_802F675C:
	.incbin "baserom.dol", 0x1F017C, 0x4
.global lbl_802F6760
lbl_802F6760:
	.incbin "baserom.dol", 0x1F0180, 0x4
.global lbl_802F6764
lbl_802F6764:
	.incbin "baserom.dol", 0x1F0184, 0x4
.global lbl_802F6768
lbl_802F6768:
	.incbin "baserom.dol", 0x1F0188, 0x8
.global lbl_802F6770
lbl_802F6770:
	.incbin "baserom.dol", 0x1F0190, 0x4
.global lbl_802F6774
lbl_802F6774:
	.incbin "baserom.dol", 0x1F0194, 0x4
.global lbl_802F6778
lbl_802F6778:
	.incbin "baserom.dol", 0x1F0198, 0x4
.global lbl_802F677C
lbl_802F677C:
	.incbin "baserom.dol", 0x1F019C, 0x4
.global lbl_802F6780
lbl_802F6780:
	.incbin "baserom.dol", 0x1F01A0, 0x4
.global lbl_802F6784
lbl_802F6784:
	.incbin "baserom.dol", 0x1F01A4, 0x4
.global lbl_802F6788
lbl_802F6788:
	.incbin "baserom.dol", 0x1F01A8, 0x8
.global lbl_802F6790
lbl_802F6790:
	.incbin "baserom.dol", 0x1F01B0, 0x8
.global lbl_802F6798
lbl_802F6798:
	.incbin "baserom.dol", 0x1F01B8, 0x8
.global lbl_802F67A0
lbl_802F67A0:
	.incbin "baserom.dol", 0x1F01C0, 0x4
.global lbl_802F67A4
lbl_802F67A4:
	.incbin "baserom.dol", 0x1F01C4, 0x4
.global lbl_802F67A8
lbl_802F67A8:
	.incbin "baserom.dol", 0x1F01C8, 0x4
.global lbl_802F67AC
lbl_802F67AC:
	.incbin "baserom.dol", 0x1F01CC, 0x4
.global lbl_802F67B0
lbl_802F67B0:
	.incbin "baserom.dol", 0x1F01D0, 0x4
.global lbl_802F67B4
lbl_802F67B4:
	.incbin "baserom.dol", 0x1F01D4, 0x4
.global lbl_802F67B8
lbl_802F67B8:
	.incbin "baserom.dol", 0x1F01D8, 0x4
.global lbl_802F67BC
lbl_802F67BC:
	.incbin "baserom.dol", 0x1F01DC, 0x4
.global lbl_802F67C0
lbl_802F67C0:
	.incbin "baserom.dol", 0x1F01E0, 0x4
.global lbl_802F67C4
lbl_802F67C4:
	.incbin "baserom.dol", 0x1F01E4, 0x4
.global lbl_802F67C8
lbl_802F67C8:
	.incbin "baserom.dol", 0x1F01E8, 0x4
.global lbl_802F67CC
lbl_802F67CC:
	.incbin "baserom.dol", 0x1F01EC, 0x4
.global lbl_802F67D0
lbl_802F67D0:
	.incbin "baserom.dol", 0x1F01F0, 0x8
.global lbl_802F67D8
lbl_802F67D8:
	.incbin "baserom.dol", 0x1F01F8, 0x8
.global lbl_802F67E0
lbl_802F67E0:
	.incbin "baserom.dol", 0x1F0200, 0x8
.global lbl_802F67E8
lbl_802F67E8:
	.incbin "baserom.dol", 0x1F0208, 0x4
.global lbl_802F67EC
lbl_802F67EC:
	.incbin "baserom.dol", 0x1F020C, 0x4
.global lbl_802F67F0
lbl_802F67F0:
	.incbin "baserom.dol", 0x1F0210, 0x4
.global lbl_802F67F4
lbl_802F67F4:
	.incbin "baserom.dol", 0x1F0214, 0x4
.global lbl_802F67F8
lbl_802F67F8:
	.incbin "baserom.dol", 0x1F0218, 0x4
.global lbl_802F67FC
lbl_802F67FC:
	.incbin "baserom.dol", 0x1F021C, 0x4
.global lbl_802F6800
lbl_802F6800:
	.incbin "baserom.dol", 0x1F0220, 0x8
.global lbl_802F6808
lbl_802F6808:
	.incbin "baserom.dol", 0x1F0228, 0x4
.global lbl_802F680C
lbl_802F680C:
	.incbin "baserom.dol", 0x1F022C, 0x4
.global lbl_802F6810
lbl_802F6810:
	.incbin "baserom.dol", 0x1F0230, 0x8
.global lbl_802F6818
lbl_802F6818:
	.incbin "baserom.dol", 0x1F0238, 0x8
.global lbl_802F6820
lbl_802F6820:
	.incbin "baserom.dol", 0x1F0240, 0x8
.global lbl_802F6828
lbl_802F6828:
	.incbin "baserom.dol", 0x1F0248, 0x8
.global lbl_802F6830
lbl_802F6830:
	.incbin "baserom.dol", 0x1F0250, 0x8
.global lbl_802F6838
lbl_802F6838:
	.incbin "baserom.dol", 0x1F0258, 0x4
.global lbl_802F683C
lbl_802F683C:
	.incbin "baserom.dol", 0x1F025C, 0x4
.global lbl_802F6840
lbl_802F6840:
	.incbin "baserom.dol", 0x1F0260, 0x4
.global lbl_802F6844
lbl_802F6844:
	.incbin "baserom.dol", 0x1F0264, 0x4
.global lbl_802F6848
lbl_802F6848:
	.incbin "baserom.dol", 0x1F0268, 0x8
.global lbl_802F6850
lbl_802F6850:
	.incbin "baserom.dol", 0x1F0270, 0x8
.global lbl_802F6858
lbl_802F6858:
	.incbin "baserom.dol", 0x1F0278, 0x8
.global lbl_802F6860
lbl_802F6860:
	.incbin "baserom.dol", 0x1F0280, 0x4
.global lbl_802F6864
lbl_802F6864:
	.incbin "baserom.dol", 0x1F0284, 0x4
.global lbl_802F6868
lbl_802F6868:
	.incbin "baserom.dol", 0x1F0288, 0x8
.global lbl_802F6870
lbl_802F6870:
	.incbin "baserom.dol", 0x1F0290, 0x8
.global lbl_802F6878
lbl_802F6878:
	.incbin "baserom.dol", 0x1F0298, 0x4
.global lbl_802F687C
lbl_802F687C:
	.incbin "baserom.dol", 0x1F029C, 0x4
.global lbl_802F6880
lbl_802F6880:
	.incbin "baserom.dol", 0x1F02A0, 0x8
.global lbl_802F6888
lbl_802F6888:
	.incbin "baserom.dol", 0x1F02A8, 0x8
.global lbl_802F6890
lbl_802F6890:
	.incbin "baserom.dol", 0x1F02B0, 0x8
.global lbl_802F6898
lbl_802F6898:
	.incbin "baserom.dol", 0x1F02B8, 0x8
.global lbl_802F68A0
lbl_802F68A0:
	.incbin "baserom.dol", 0x1F02C0, 0x4
.global lbl_802F68A4
lbl_802F68A4:
	.incbin "baserom.dol", 0x1F02C4, 0x4
.global lbl_802F68A8
lbl_802F68A8:
	.incbin "baserom.dol", 0x1F02C8, 0x4
.global lbl_802F68AC
lbl_802F68AC:
	.incbin "baserom.dol", 0x1F02CC, 0x4
.global lbl_802F68B0
lbl_802F68B0:
	.incbin "baserom.dol", 0x1F02D0, 0x4
.global lbl_802F68B4
lbl_802F68B4:
	.incbin "baserom.dol", 0x1F02D4, 0x4
.global lbl_802F68B8
lbl_802F68B8:
	.incbin "baserom.dol", 0x1F02D8, 0x4
.global lbl_802F68BC
lbl_802F68BC:
	.incbin "baserom.dol", 0x1F02DC, 0x4
.global lbl_802F68C0
lbl_802F68C0:
	.incbin "baserom.dol", 0x1F02E0, 0x4
.global lbl_802F68C4
lbl_802F68C4:
	.incbin "baserom.dol", 0x1F02E4, 0x4
.global lbl_802F68C8
lbl_802F68C8:
	.incbin "baserom.dol", 0x1F02E8, 0x4
.global lbl_802F68CC
lbl_802F68CC:
	.incbin "baserom.dol", 0x1F02EC, 0x4
.global lbl_802F68D0
lbl_802F68D0:
	.incbin "baserom.dol", 0x1F02F0, 0x4
.global lbl_802F68D4
lbl_802F68D4:
	.incbin "baserom.dol", 0x1F02F4, 0x4
.global lbl_802F68D8
lbl_802F68D8:
	.incbin "baserom.dol", 0x1F02F8, 0x8
.global lbl_802F68E0
lbl_802F68E0:
	.incbin "baserom.dol", 0x1F0300, 0x4
.global lbl_802F68E4
lbl_802F68E4:
	.incbin "baserom.dol", 0x1F0304, 0x4
.global lbl_802F68E8
lbl_802F68E8:
	.incbin "baserom.dol", 0x1F0308, 0x4
.global lbl_802F68EC
lbl_802F68EC:
	.incbin "baserom.dol", 0x1F030C, 0x4
.global lbl_802F68F0
lbl_802F68F0:
	.incbin "baserom.dol", 0x1F0310, 0x4
.global lbl_802F68F4
lbl_802F68F4:
	.incbin "baserom.dol", 0x1F0314, 0x4
.global lbl_802F68F8
lbl_802F68F8:
	.incbin "baserom.dol", 0x1F0318, 0x4
.global lbl_802F68FC
lbl_802F68FC:
	.incbin "baserom.dol", 0x1F031C, 0x4
.global lbl_802F6900
lbl_802F6900:
	.incbin "baserom.dol", 0x1F0320, 0x8
.global lbl_802F6908
lbl_802F6908:
	.incbin "baserom.dol", 0x1F0328, 0x8
.global lbl_802F6910
lbl_802F6910:
	.incbin "baserom.dol", 0x1F0330, 0x8
.global lbl_802F6918
lbl_802F6918:
	.incbin "baserom.dol", 0x1F0338, 0x4
.global lbl_802F691C
lbl_802F691C:
	.incbin "baserom.dol", 0x1F033C, 0x4
.global lbl_802F6920
lbl_802F6920:
	.incbin "baserom.dol", 0x1F0340, 0x4
.global lbl_802F6924
lbl_802F6924:
	.incbin "baserom.dol", 0x1F0344, 0x4
.global lbl_802F6928
lbl_802F6928:
	.incbin "baserom.dol", 0x1F0348, 0x8
.global lbl_802F6930
lbl_802F6930:
	.incbin "baserom.dol", 0x1F0350, 0x4
.global lbl_802F6934
lbl_802F6934:
	.incbin "baserom.dol", 0x1F0354, 0x4
.global lbl_802F6938
lbl_802F6938:
	.incbin "baserom.dol", 0x1F0358, 0x8
.global lbl_802F6940
lbl_802F6940:
	.incbin "baserom.dol", 0x1F0360, 0x8
.global lbl_802F6948
lbl_802F6948:
	.incbin "baserom.dol", 0x1F0368, 0x8
.global lbl_802F6950
lbl_802F6950:
	.incbin "baserom.dol", 0x1F0370, 0x4
.global lbl_802F6954
lbl_802F6954:
	.incbin "baserom.dol", 0x1F0374, 0x4
.global lbl_802F6958
lbl_802F6958:
	.incbin "baserom.dol", 0x1F0378, 0x8
.global lbl_802F6960
lbl_802F6960:
	.incbin "baserom.dol", 0x1F0380, 0x8
.global lbl_802F6968
lbl_802F6968:
	.incbin "baserom.dol", 0x1F0388, 0x8
.global lbl_802F6970
lbl_802F6970:
	.incbin "baserom.dol", 0x1F0390, 0x4
.global lbl_802F6974
lbl_802F6974:
	.incbin "baserom.dol", 0x1F0394, 0x4
.global lbl_802F6978
lbl_802F6978:
	.incbin "baserom.dol", 0x1F0398, 0x8
.global lbl_802F6980
lbl_802F6980:
	.incbin "baserom.dol", 0x1F03A0, 0x8
.global lbl_802F6988
lbl_802F6988:
	.incbin "baserom.dol", 0x1F03A8, 0x8
.global lbl_802F6990
lbl_802F6990:
	.incbin "baserom.dol", 0x1F03B0, 0x8
.global lbl_802F6998
lbl_802F6998:
	.incbin "baserom.dol", 0x1F03B8, 0x4
.global lbl_802F699C
lbl_802F699C:
	.incbin "baserom.dol", 0x1F03BC, 0x4
.global lbl_802F69A0
lbl_802F69A0:
	.incbin "baserom.dol", 0x1F03C0, 0x8
.global lbl_802F69A8
lbl_802F69A8:
	.incbin "baserom.dol", 0x1F03C8, 0x8
.global lbl_802F69B0
lbl_802F69B0:
	.incbin "baserom.dol", 0x1F03D0, 0x4
.global lbl_802F69B4
lbl_802F69B4:
	.incbin "baserom.dol", 0x1F03D4, 0x4
.global lbl_802F69B8
lbl_802F69B8:
	.incbin "baserom.dol", 0x1F03D8, 0x4
.global lbl_802F69BC
lbl_802F69BC:
	.incbin "baserom.dol", 0x1F03DC, 0x4
.global lbl_802F69C0
lbl_802F69C0:
	.incbin "baserom.dol", 0x1F03E0, 0x8
.global lbl_802F69C8
lbl_802F69C8:
	.incbin "baserom.dol", 0x1F03E8, 0x8
.global lbl_802F69D0
lbl_802F69D0:
	.incbin "baserom.dol", 0x1F03F0, 0x4
.global lbl_802F69D4
lbl_802F69D4:
	.incbin "baserom.dol", 0x1F03F4, 0x4
.global lbl_802F69D8
lbl_802F69D8:
	.incbin "baserom.dol", 0x1F03F8, 0x8
.global lbl_802F69E0
lbl_802F69E0:
	.incbin "baserom.dol", 0x1F0400, 0x4
.global lbl_802F69E4
lbl_802F69E4:
	.incbin "baserom.dol", 0x1F0404, 0x4
.global lbl_802F69E8
lbl_802F69E8:
	.incbin "baserom.dol", 0x1F0408, 0x8
.global lbl_802F69F0
lbl_802F69F0:
	.incbin "baserom.dol", 0x1F0410, 0x4
.global lbl_802F69F4
lbl_802F69F4:
	.incbin "baserom.dol", 0x1F0414, 0x4
.global lbl_802F69F8
lbl_802F69F8:
	.incbin "baserom.dol", 0x1F0418, 0x4
.global lbl_802F69FC
lbl_802F69FC:
	.incbin "baserom.dol", 0x1F041C, 0x4
.global lbl_802F6A00
lbl_802F6A00:
	.incbin "baserom.dol", 0x1F0420, 0x4
.global lbl_802F6A04
lbl_802F6A04:
	.incbin "baserom.dol", 0x1F0424, 0x4
.global lbl_802F6A08
lbl_802F6A08:
	.incbin "baserom.dol", 0x1F0428, 0x8
.global lbl_802F6A10
lbl_802F6A10:
	.incbin "baserom.dol", 0x1F0430, 0x8
.global lbl_802F6A18
lbl_802F6A18:
	.incbin "baserom.dol", 0x1F0438, 0x8
.global lbl_802F6A20
lbl_802F6A20:
	.incbin "baserom.dol", 0x1F0440, 0x4
.global lbl_802F6A24
lbl_802F6A24:
	.incbin "baserom.dol", 0x1F0444, 0x4
.global lbl_802F6A28
lbl_802F6A28:
	.incbin "baserom.dol", 0x1F0448, 0x8
.global lbl_802F6A30
lbl_802F6A30:
	.incbin "baserom.dol", 0x1F0450, 0x8
.global lbl_802F6A38
lbl_802F6A38:
	.incbin "baserom.dol", 0x1F0458, 0x4
.global lbl_802F6A3C
lbl_802F6A3C:
	.incbin "baserom.dol", 0x1F045C, 0x4
.global lbl_802F6A40
lbl_802F6A40:
	.incbin "baserom.dol", 0x1F0460, 0x4
.global lbl_802F6A44
lbl_802F6A44:
	.incbin "baserom.dol", 0x1F0464, 0x4
.global lbl_802F6A48
lbl_802F6A48:
	.incbin "baserom.dol", 0x1F0468, 0x4
.global lbl_802F6A4C
lbl_802F6A4C:
	.incbin "baserom.dol", 0x1F046C, 0x4
.global lbl_802F6A50
lbl_802F6A50:
	.incbin "baserom.dol", 0x1F0470, 0x4
.global lbl_802F6A54
lbl_802F6A54:
	.incbin "baserom.dol", 0x1F0474, 0x4
.global lbl_802F6A58
lbl_802F6A58:
	.incbin "baserom.dol", 0x1F0478, 0x8
.global lbl_802F6A60
lbl_802F6A60:
	.incbin "baserom.dol", 0x1F0480, 0x8
.global lbl_802F6A68
lbl_802F6A68:
	.incbin "baserom.dol", 0x1F0488, 0x4
.global lbl_802F6A6C
lbl_802F6A6C:
	.incbin "baserom.dol", 0x1F048C, 0x4
.global lbl_802F6A70
lbl_802F6A70:
	.incbin "baserom.dol", 0x1F0490, 0x8
.global lbl_802F6A78
lbl_802F6A78:
	.incbin "baserom.dol", 0x1F0498, 0x8
.global lbl_802F6A80
lbl_802F6A80:
	.incbin "baserom.dol", 0x1F04A0, 0x8
.global lbl_802F6A88
lbl_802F6A88:
	.incbin "baserom.dol", 0x1F04A8, 0x8
.global lbl_802F6A90
lbl_802F6A90:
	.incbin "baserom.dol", 0x1F04B0, 0x8
.global lbl_802F6A98
lbl_802F6A98:
	.incbin "baserom.dol", 0x1F04B8, 0x8
.global lbl_802F6AA0
lbl_802F6AA0:
	.incbin "baserom.dol", 0x1F04C0, 0x8
.global lbl_802F6AA8
lbl_802F6AA8:
	.incbin "baserom.dol", 0x1F04C8, 0x8
.global lbl_802F6AB0
lbl_802F6AB0:
	.incbin "baserom.dol", 0x1F04D0, 0x8
.global lbl_802F6AB8
lbl_802F6AB8:
	.incbin "baserom.dol", 0x1F04D8, 0x8
.global lbl_802F6AC0
lbl_802F6AC0:
	.incbin "baserom.dol", 0x1F04E0, 0x8
.global lbl_802F6AC8
lbl_802F6AC8:
	.incbin "baserom.dol", 0x1F04E8, 0x8
.global lbl_802F6AD0
lbl_802F6AD0:
	.incbin "baserom.dol", 0x1F04F0, 0x8
.global lbl_802F6AD8
lbl_802F6AD8:
	.incbin "baserom.dol", 0x1F04F8, 0x8
.global lbl_802F6AE0
lbl_802F6AE0:
	.incbin "baserom.dol", 0x1F0500, 0x8
.global lbl_802F6AE8
lbl_802F6AE8:
	.incbin "baserom.dol", 0x1F0508, 0x8
.global lbl_802F6AF0
lbl_802F6AF0:
	.incbin "baserom.dol", 0x1F0510, 0x8
.global lbl_802F6AF8
lbl_802F6AF8:
	.incbin "baserom.dol", 0x1F0518, 0x8
.global lbl_802F6B00
lbl_802F6B00:
	.incbin "baserom.dol", 0x1F0520, 0x8
.global lbl_802F6B08
lbl_802F6B08:
	.incbin "baserom.dol", 0x1F0528, 0x8
.global lbl_802F6B10
lbl_802F6B10:
	.incbin "baserom.dol", 0x1F0530, 0x8
.global lbl_802F6B18
lbl_802F6B18:
	.incbin "baserom.dol", 0x1F0538, 0x8
.global lbl_802F6B20
lbl_802F6B20:
	.incbin "baserom.dol", 0x1F0540, 0x8
.global lbl_802F6B28
lbl_802F6B28:
	.incbin "baserom.dol", 0x1F0548, 0x8
.global lbl_802F6B30
lbl_802F6B30:
	.incbin "baserom.dol", 0x1F0550, 0x8
.global lbl_802F6B38
lbl_802F6B38:
	.incbin "baserom.dol", 0x1F0558, 0x8
.global lbl_802F6B40
lbl_802F6B40:
	.incbin "baserom.dol", 0x1F0560, 0x8
.global lbl_802F6B48
lbl_802F6B48:
	.incbin "baserom.dol", 0x1F0568, 0x8
.global lbl_802F6B50
lbl_802F6B50:
	.incbin "baserom.dol", 0x1F0570, 0x8
.global lbl_802F6B58
lbl_802F6B58:
	.incbin "baserom.dol", 0x1F0578, 0x8
.global lbl_802F6B60
lbl_802F6B60:
	.incbin "baserom.dol", 0x1F0580, 0x8
.global lbl_802F6B68
lbl_802F6B68:
	.incbin "baserom.dol", 0x1F0588, 0x8
.global lbl_802F6B70
lbl_802F6B70:
	.incbin "baserom.dol", 0x1F0590, 0x8
.global lbl_802F6B78
lbl_802F6B78:
	.incbin "baserom.dol", 0x1F0598, 0x8
.global lbl_802F6B80
lbl_802F6B80:
	.incbin "baserom.dol", 0x1F05A0, 0x8
.global lbl_802F6B88
lbl_802F6B88:
	.incbin "baserom.dol", 0x1F05A8, 0x8
.global lbl_802F6B90
lbl_802F6B90:
	.incbin "baserom.dol", 0x1F05B0, 0x8
.global lbl_802F6B98
lbl_802F6B98:
	.incbin "baserom.dol", 0x1F05B8, 0x8
.global lbl_802F6BA0
lbl_802F6BA0:
	.incbin "baserom.dol", 0x1F05C0, 0x8
.global lbl_802F6BA8
lbl_802F6BA8:
	.incbin "baserom.dol", 0x1F05C8, 0x8
.global lbl_802F6BB0
lbl_802F6BB0:
	.incbin "baserom.dol", 0x1F05D0, 0x8
.global lbl_802F6BB8
lbl_802F6BB8:
	.incbin "baserom.dol", 0x1F05D8, 0x8
.global lbl_802F6BC0
lbl_802F6BC0:
	.incbin "baserom.dol", 0x1F05E0, 0x8
.global lbl_802F6BC8
lbl_802F6BC8:
	.incbin "baserom.dol", 0x1F05E8, 0x8
.global lbl_802F6BD0
lbl_802F6BD0:
	.incbin "baserom.dol", 0x1F05F0, 0x8
.global lbl_802F6BD8
lbl_802F6BD8:
	.incbin "baserom.dol", 0x1F05F8, 0x8
.global lbl_802F6BE0
lbl_802F6BE0:
	.incbin "baserom.dol", 0x1F0600, 0x8
.global lbl_802F6BE8
lbl_802F6BE8:
	.incbin "baserom.dol", 0x1F0608, 0x8
.global lbl_802F6BF0
lbl_802F6BF0:
	.incbin "baserom.dol", 0x1F0610, 0x8
.global lbl_802F6BF8
lbl_802F6BF8:
	.incbin "baserom.dol", 0x1F0618, 0x8
.global lbl_802F6C00
lbl_802F6C00:
	.incbin "baserom.dol", 0x1F0620, 0x8
.global lbl_802F6C08
lbl_802F6C08:
	.incbin "baserom.dol", 0x1F0628, 0x8
.global lbl_802F6C10
lbl_802F6C10:
	.incbin "baserom.dol", 0x1F0630, 0x8
.global lbl_802F6C18
lbl_802F6C18:
	.incbin "baserom.dol", 0x1F0638, 0x4
.global lbl_802F6C1C
lbl_802F6C1C:
	.incbin "baserom.dol", 0x1F063C, 0x4
.global lbl_802F6C20
lbl_802F6C20:
	.incbin "baserom.dol", 0x1F0640, 0x4
.global lbl_802F6C24
lbl_802F6C24:
	.incbin "baserom.dol", 0x1F0644, 0x4
.global lbl_802F6C28
lbl_802F6C28:
	.incbin "baserom.dol", 0x1F0648, 0x4
.global lbl_802F6C2C
lbl_802F6C2C:
	.incbin "baserom.dol", 0x1F064C, 0x4
.global lbl_802F6C30
lbl_802F6C30:
	.incbin "baserom.dol", 0x1F0650, 0x8
.global lbl_802F6C38
lbl_802F6C38:
	.incbin "baserom.dol", 0x1F0658, 0x4
.global lbl_802F6C3C
lbl_802F6C3C:
	.incbin "baserom.dol", 0x1F065C, 0x4
.global lbl_802F6C40
lbl_802F6C40:
	.incbin "baserom.dol", 0x1F0660, 0x8
.global lbl_802F6C48
lbl_802F6C48:
	.incbin "baserom.dol", 0x1F0668, 0x8
.global lbl_802F6C50
lbl_802F6C50:
	.incbin "baserom.dol", 0x1F0670, 0x8
.global lbl_802F6C58
lbl_802F6C58:
	.incbin "baserom.dol", 0x1F0678, 0x8
.global lbl_802F6C60
lbl_802F6C60:
	.incbin "baserom.dol", 0x1F0680, 0x8
.global lbl_802F6C68
lbl_802F6C68:
	.incbin "baserom.dol", 0x1F0688, 0x4
.global lbl_802F6C6C
lbl_802F6C6C:
	.incbin "baserom.dol", 0x1F068C, 0x4
.global lbl_802F6C70
lbl_802F6C70:
	.incbin "baserom.dol", 0x1F0690, 0x8
.global lbl_802F6C78
lbl_802F6C78:
	.incbin "baserom.dol", 0x1F0698, 0x8

.section .bss, "wa"  # 0x801ED920 - 0x802F27F5
.global lbl_801ED920
lbl_801ED920:
	.skip 0x1240
.global lbl_801EEB60
lbl_801EEB60:
	.skip 0x40
.global lbl_801EEBA0
lbl_801EEBA0:
	.skip 0x80
.global modeCtrl
modeCtrl:
	.skip 0x48
.global lbl_801EEC68
lbl_801EEC68:
	.skip 0x18
.global lbl_801EEC80
lbl_801EEC80:
	.skip 0x10
.global lbl_801EEC90
lbl_801EEC90:
	.skip 0x68
.global lbl_801EECF8
lbl_801EECF8:
	.skip 0xC
.global lbl_801EED04
lbl_801EED04:
	.skip 0x28
.global lbl_801EED2C
lbl_801EED2C:
	.skip 0x10
.global lbl_801EED3C
lbl_801EED3C:
	.skip 0x14
.global lbl_801EED50
lbl_801EED50:
	.skip 0x38
.global lbl_801EED88
lbl_801EED88:
	.skip 0x20
.global lbl_801EEDA8
lbl_801EEDA8:
	.skip 0x118
.global lbl_801EEEC0
lbl_801EEEC0:
	.skip 0x40
.global cameraInfo
cameraInfo:
	.skip 0xC94
.global lbl_801EFB94
lbl_801EFB94:
	.skip 0x84
.global lbl_801EFC18
lbl_801EFC18:
	.skip 0x3C
.global lbl_801EFC54
lbl_801EFC54:
	.skip 0x34
.global lbl_801EFC88
lbl_801EFC88:
	.skip 0xC
.global lbl_801EFC94
lbl_801EFC94:
	.skip 0x36C
.global lbl_801F0000
lbl_801F0000:
	.skip 0x3C
.global lbl_801F003C
lbl_801F003C:
	.skip 0x5D8
.global lbl_801F0614
lbl_801F0614:
	.skip 0x48
.global lbl_801F065C
lbl_801F065C:
	.skip 0x33A0
.global lbl_801F39FC
lbl_801F39FC:
	.skip 0xC
.global lbl_801F3A08
lbl_801F3A08:
	.skip 0x50
.global lbl_801F3A58
lbl_801F3A58:
	.skip 0x34
.global lbl_801F3A8C
lbl_801F3A8C:
	.skip 0x10
.global lbl_801F3A9C
lbl_801F3A9C:
	.skip 0xD4
.global lbl_801F3B70
lbl_801F3B70:
	.skip 0xF0
.global lbl_801F3C60
lbl_801F3C60:
	.skip 0xF0
.global lbl_801F3D50
lbl_801F3D50:
	.skip 0x38
.global lbl_801F3D88
lbl_801F3D88:
	.skip 0xC
.global lbl_801F3D94
lbl_801F3D94:
	.skip 0xC
.global lbl_801F3DA0
lbl_801F3DA0:
	.skip 0x20
.global lbl_801F3DC0
lbl_801F3DC0:
	.skip 0x5000
.global lbl_801F8DC0
lbl_801F8DC0:
	.skip 0x20
.global lbl_801F8DE0
lbl_801F8DE0:
	.skip 0x38
.global lbl_801F8E18
lbl_801F8E18:
	.skip 0x39C
.global lbl_801F91B4
lbl_801F91B4:
	.skip 0x4250
.global lbl_801FD404
lbl_801FD404:
	.skip 0x1094
.global lbl_801FE498
lbl_801FE498:
	.skip 0xC0
.global lbl_801FE558
lbl_801FE558:
	.skip 0x70
.global lbl_801FE5C8
lbl_801FE5C8:
	.skip 0x2E50
.global lbl_80201418
lbl_80201418:
	.skip 0x3C
.global lbl_80201454
lbl_80201454:
	.skip 0x8C
.global lbl_802014E0
lbl_802014E0:
	.skip 0x20
.global lbl_80201500
lbl_80201500:
	.skip 0x428
.global lbl_80201928
lbl_80201928:
	.skip 0x7AC
.global lbl_802020D4
lbl_802020D4:
	.skip 0x7AC
.global lbl_80202880
lbl_80202880:
	.skip 0xF58
.global lbl_802037D8
lbl_802037D8:
	.skip 0x7AC
.global lbl_80203F84
lbl_80203F84:
	.skip 0x1704
.global lbl_80205688
lbl_80205688:
	.skip 0x300
.global lbl_80205988
lbl_80205988:
	.skip 0x418
.global lbl_80205DA0
lbl_80205DA0:
	.skip 0xC
.global lbl_80205DAC
lbl_80205DAC:
	.skip 0x54
.global lbl_80205E00
lbl_80205E00:
	.skip 0x20
.global ballInfo
ballInfo:
	.skip 0x10
.global lbl_80205E30
lbl_80205E30:
	.skip 0x30
.global lbl_80205E60
lbl_80205E60:
	.skip 0xD20
.global lbl_80206B80
lbl_80206B80:
	.skip 0x40
.global lbl_80206BC0
lbl_80206BC0:
	.skip 0x10
.global lbl_80206BD0
lbl_80206BD0:
	.skip 0x20
.global lbl_80206BF0
lbl_80206BF0:
	.skip 0x100
.global lbl_80206CF0
lbl_80206CF0:
	.skip 0x10
.global lbl_80206D00
lbl_80206D00:
	.skip 0x78
.global lbl_80206D78
lbl_80206D78:
	.skip 0x74
.global lbl_80206DEC
lbl_80206DEC:
	.skip 0x5C
.global lbl_80206E48
lbl_80206E48:
	.skip 0x2520
.global lbl_80209368
lbl_80209368:
	.skip 0x680
.global lbl_802099E8
lbl_802099E8:
	.skip 0x960
.global lbl_8020A348
lbl_8020A348:
	.skip 0x840
.global lbl_8020AB88
lbl_8020AB88:
	.skip 0x240
.global lbl_8020ADC8
lbl_8020ADC8:
	.skip 0xC
.global lbl_8020ADD4
lbl_8020ADD4:
	.skip 0x4C
.global lbl_8020AE20
lbl_8020AE20:
	.skip 0x20
.global lbl_8020AE40
lbl_8020AE40:
	.skip 0x45C28
.global lbl_80250A68
lbl_80250A68:
	.skip 0x18
.global lbl_80250A80
lbl_80250A80:
	.skip 0x20
.global lbl_80250AA0
lbl_80250AA0:
	.skip 0xB8
.global lbl_80250B58
lbl_80250B58:
	.skip 0x18
.global lbl_80250B70
lbl_80250B70:
	.skip 0x10
.global lbl_80250B80
lbl_80250B80:
	.skip 0x16848
.global lbl_802673C8
lbl_802673C8:
	.skip 0x15800
.global lbl_8027CBC8
lbl_8027CBC8:
	.skip 0x30
.global lbl_8027CBF8
lbl_8027CBF8:
	.skip 0x30
.global lbl_8027CC28
lbl_8027CC28:
	.skip 0x30
.global lbl_8027CC58
lbl_8027CC58:
	.skip 0x1B0
.global lbl_8027CE08
lbl_8027CE08:
	.skip 0x10
.global lbl_8027CE18
lbl_8027CE18:
	.skip 0xC
.global lbl_8027CE24
lbl_8027CE24:
	.skip 0x34
.global lbl_8027CE58
lbl_8027CE58:
	.skip 0x8C00
.global lbl_80285A58
lbl_80285A58:
	.skip 0x58
.global lbl_80285AB0
lbl_80285AB0:
	.skip 0x6600
.global lbl_8028C0B0
lbl_8028C0B0:
	.skip 0x28
.global lbl_8028C0D8
lbl_8028C0D8:
	.skip 0xCC0
.global lbl_8028CD98
lbl_8028CD98:
	.skip 0x140
.global lbl_8028CED8
lbl_8028CED8:
	.skip 0x28
.global lbl_8028CF00
lbl_8028CF00:
	.skip 0x28
.global lbl_8028CF28
lbl_8028CF28:
	.skip 0x30
.global lbl_8028CF58
lbl_8028CF58:
	.skip 0x3218
.global lbl_80290170
lbl_80290170:
	.skip 0x10
.global lbl_80290180
lbl_80290180:
	.skip 0x2940
.global lbl_80292AC0
lbl_80292AC0:
	.skip 0xA0
.global lbl_80292B60
lbl_80292B60:
	.skip 0xA0
.global lbl_80292C00
lbl_80292C00:
	.skip 0x60
.global lbl_80292C60
lbl_80292C60:
	.skip 0x30
.global lbl_80292C90
lbl_80292C90:
	.skip 0x28
.global lbl_80292CB8
lbl_80292CB8:
	.skip 0x60
.global lbl_80292D18
lbl_80292D18:
	.skip 0x18
.global lbl_80292D30
lbl_80292D30:
	.skip 0x130
.global lbl_80292E60
lbl_80292E60:
	.skip 0x10
.global lbl_80292E70
lbl_80292E70:
	.skip 0x20000
.global lbl_802B2E70
lbl_802B2E70:
	.skip 0x940
.global lbl_802B37B0
lbl_802B37B0:
	.skip 0x40
.global lbl_802B37F0
lbl_802B37F0:
	.skip 0x16C
.global lbl_802B395C
lbl_802B395C:
	.skip 0x64
.global lbl_802B39C0
lbl_802B39C0:
	.skip 0xCF0
.global lbl_802B46B0
lbl_802B46B0:
	.skip 0x40
.global lbl_802B46F0
lbl_802B46F0:
	.skip 0xF0
.global lbl_802B47E0
lbl_802B47E0:
	.skip 0x20
.global lbl_802B4800
lbl_802B4800:
	.skip 0x5F0
.global lbl_802B4DF0
lbl_802B4DF0:
	.skip 0x20
.global lbl_802B4E10
lbl_802B4E10:
	.skip 0x50
.global lbl_802B4E60
lbl_802B4E60:
	.skip 0xC
.global lbl_802B4E6C
lbl_802B4E6C:
	.skip 0x30
.global lbl_802B4E9C
lbl_802B4E9C:
	.skip 0x30
.global lbl_802B4ECC
lbl_802B4ECC:
	.skip 0xF4
.global lbl_802B4FC0
lbl_802B4FC0:
	.skip 0x5C0
.global lbl_802B5580
lbl_802B5580:
	.skip 0x200
.global lbl_802B5780
lbl_802B5780:
	.skip 0x20
.global lbl_802B57A0
lbl_802B57A0:
	.skip 0x3800
.global lbl_802B8FA0
lbl_802B8FA0:
	.skip 0x150
.global lbl_802B90F0
lbl_802B90F0:
	.skip 0x270
.global lbl_802B9360
lbl_802B9360:
	.skip 0x10
.global lbl_802B9370
lbl_802B9370:
	.skip 0x20
.global lbl_802B9390
lbl_802B9390:
	.skip 0xE00
.global lbl_802BA190
lbl_802BA190:
	.skip 0x10
.global lbl_802BA1A0
lbl_802BA1A0:
	.skip 0x60
.global lbl_802BA200
lbl_802BA200:
	.skip 0x10
.global lbl_802BA210
lbl_802BA210:
	.skip 0x90
.global lbl_802BA2A0
lbl_802BA2A0:
	.skip 0x70
.global lbl_802BA310
lbl_802BA310:
	.skip 0x70
.global lbl_802BA380
lbl_802BA380:
	.skip 0xA100
.global lbl_802C4480
lbl_802C4480:
	.skip 0x4C0
.global lbl_802C4940
lbl_802C4940:
	.skip 0x1420
.global lbl_802C5D60
lbl_802C5D60:
	.skip 0x420
.global lbl_802C6180
lbl_802C6180:
	.skip 0xA0
.global lbl_802C6220
lbl_802C6220:
	.skip 0xF4
.global lbl_802C6314
lbl_802C6314:
	.skip 0xC0
.global lbl_802C63D4
lbl_802C63D4:
	.skip 0x3C0
.global lbl_802C6794
lbl_802C6794:
	.skip 0x40
.global lbl_802C67D4
lbl_802C67D4:
	.skip 0x144
.global lbl_802C6918
lbl_802C6918:
	.skip 0x2A0
.global lbl_802C6BB8
lbl_802C6BB8:
	.skip 0x10
.global lbl_802C6BC8
lbl_802C6BC8:
	.skip 0x10
.global lbl_802C6BD8
lbl_802C6BD8:
	.skip 0x10
.global OSErrorTable
OSErrorTable:
	.skip 0x40
.global Ecb
Ecb:
	.skip 0xB8
.global Header
Header:
	.skip 0x20
.global Scb
Scb:
	.skip 0x58
.global Packet
Packet:
	.skip 0x80
.global Alarm
Alarm:
	.skip 0xA0
.global lbl_802C6E78
lbl_802C6E78:
	.skip 0x9E8
.global CommandList
CommandList:
	.skip 0x68
.global AlarmForTimeout
AlarmForTimeout:
	.skip 0x78
.global tmpBuffer
tmpBuffer:
	.skip 0x80
.global DummyCommandBlock
DummyCommandBlock:
	.skip 0x58
.global WaitingQueue
WaitingQueue:
	.skip 0x20
.global bb2Buf
bb2Buf:
	.skip 0x40
.global block
block:
	.skip 0x30
.global regs
regs:
	.skip 0x78
.global shdwRegs
shdwRegs:
	.skip 0x78
.global HorVer
HorVer:
	.skip 0x58
.global PADType
PADType:
	.skip 0x10
.global Type
Type:
	.skip 0x10
.global Origin
Origin:
	.skip 0x50
.global __CARDBlock
__CARDBlock:
	.skip 0x210
.global __CARDDiskNone
__CARDDiskNone:
	.skip 0x20
.global gxData
gxData:
	.skip 0x578
.global lbl_802C8408
lbl_802C8408:
	.skip 0x288
.global lbl_802C8690
lbl_802C8690:
	.skip 0x518
.global PERFAlarm
PERFAlarm:
	.skip 0x28
.global mId
mId:
	.skip 0x90
.global seqNote
seqNote:
	.skip 0x1400
.global lbl_802CA060
lbl_802CA060:
	.skip 0xBD20
.global lbl_802D5D80
lbl_802D5D80:
	.skip 0x100
.global lbl_802D5E80
lbl_802D5E80:
	.skip 0x3C0
.global lbl_802D6240
lbl_802D6240:
	.skip 0x214
.global lbl_802D6454
lbl_802D6454:
	.skip 0x600
.global lbl_802D6A54
lbl_802D6A54:
	.skip 0x40
.global lbl_802D6A94
lbl_802D6A94:
	.skip 0x10
.global lbl_802D6AA4
lbl_802D6AA4:
	.skip 0x10
.global lbl_802D6AB4
lbl_802D6AB4:
	.skip 0x10
.global lbl_802D6AC4
lbl_802D6AC4:
	.skip 0x10
.global lbl_802D6AD4
lbl_802D6AD4:
	.skip 0x40
.global lbl_802D6B14
lbl_802D6B14:
	.skip 0x240
.global lbl_802D6D54
lbl_802D6D54:
	.skip 0x244
.global lbl_802D6F98
lbl_802D6F98:
	.skip 0x1800
.global lbl_802D8798
lbl_802D8798:
	.skip 0x600
.global lbl_802D8D98
lbl_802D8D98:
	.skip 0x4000
.global lbl_802DCD98
lbl_802DCD98:
	.skip 0x1400
.global lbl_802DE198
lbl_802DE198:
	.skip 0x4800
.global lbl_802E2998
lbl_802E2998:
	.skip 0x438
.global lbl_802E2DD0
lbl_802E2DD0:
	.skip 0x20
.global lbl_802E2DF0
lbl_802E2DF0:
	.skip 0x800
.global lbl_802E35F0
lbl_802E35F0:
	.skip 0x80
.global lbl_802E3670
lbl_802E3670:
	.skip 0x640
.global lbl_802E3CB0
lbl_802E3CB0:
	.skip 0x100
.global lbl_802E3DB0
lbl_802E3DB0:
	.skip 0x400
.global lbl_802E41B0
lbl_802E41B0:
	.skip 0x6E0
.global lbl_802E4890
lbl_802E4890:
	.skip 0x50
.global lbl_802E48E0
lbl_802E48E0:
	.skip 0x6D0
.global lbl_802E4FB0
lbl_802E4FB0:
	.skip 0x80
.global lbl_802E5030
lbl_802E5030:
	.skip 0x40
.global lbl_802E5070
lbl_802E5070:
	.skip 0x4300
.global lbl_802E9370
lbl_802E9370:
	.skip 0x2180
.global lbl_802EB4F0
lbl_802EB4F0:
	.skip 0x80
.global lbl_802EB570
lbl_802EB570:
	.skip 0x40
.global lbl_802EB5B0
lbl_802EB5B0:
	.skip 0x200
.global lbl_802EB7B0
lbl_802EB7B0:
	.skip 0x80
.global lbl_802EB830
lbl_802EB830:
	.skip 0x40
.global lbl_802EB870
lbl_802EB870:
	.skip 0x200
.global lbl_802EBA70
lbl_802EBA70:
	.skip 0x410
.global lbl_802EBE80
lbl_802EBE80:
	.skip 0x2060
.global __block_for_run_callback
__block_for_run_callback:
	.skip 0x30
.global __block_for_prep_callback
__block_for_prep_callback:
	.skip 0x30
.global __block_for_stream_status
__block_for_stream_status:
	.skip 0x30
.global __block_for_ais_isr
__block_for_ais_isr:
	.skip 0x30
.global __block_for_set_state
__block_for_set_state:
	.skip 0x30
.global __block_for_next_track
__block_for_next_track:
	.skip 0x30
.global __block_for_prev_track
__block_for_prev_track:
	.skip 0x30
.global lbl_802EE030
lbl_802EE030:
	.skip 0x10
.global lbl_802EE040
lbl_802EE040:
	.skip 0x100
.global lbl_802EE140
lbl_802EE140:
	.skip 0x100
.global lbl_802EE240
lbl_802EE240:
	.skip 0x28
.global lbl_802EE268
lbl_802EE268:
	.skip 0x8
.global lbl_802EE270
lbl_802EE270:
	.skip 0x19B0
.global lbl_802EFC20
lbl_802EFC20:
	.skip 0x14
.global lbl_802EFC34
lbl_802EFC34:
	.skip 0x4
.global lbl_802EFC38
lbl_802EFC38:
	.skip 0x8
.global lbl_802EFC40
lbl_802EFC40:
	.skip 0x4
.global lbl_802EFC44
lbl_802EFC44:
	.skip 0x94
.global lbl_802EFCD8
lbl_802EFCD8:
	.skip 0x10
.global lbl_802EFCE8
lbl_802EFCE8:
	.skip 0xA8
.global lbl_802EFD90
lbl_802EFD90:
	.skip 0x430
.global lbl_802F01C0
lbl_802F01C0:
	.skip 0x8
.global lbl_802F01C8
lbl_802F01C8:
	.skip 0x1918
.global lbl_802F1AE0
lbl_802F1AE0:
	.skip 0x4
.global lbl_802F1AE4
lbl_802F1AE4:
	.skip 0x4
.global lbl_802F1AE8
lbl_802F1AE8:
	.skip 0x4
.global lbl_802F1AEC
lbl_802F1AEC:
	.skip 0x4
.global lbl_802F1AF0
lbl_802F1AF0:
	.skip 0x4
.global lbl_802F1AF4
lbl_802F1AF4:
	.skip 0x4
.global lbl_802F1AF8
lbl_802F1AF8:
	.skip 0x4
.global lbl_802F1AFC
lbl_802F1AFC:
	.skip 0x4
.global lbl_802F1B00
lbl_802F1B00:
	.skip 0x4
.global lbl_802F1B04
lbl_802F1B04:
	.skip 0x4
.global lbl_802F1B08
lbl_802F1B08:
	.skip 0x4
.global lbl_802F1B0C
lbl_802F1B0C:
	.skip 0x4
.global lbl_802F1B10
lbl_802F1B10:
	.skip 0x4
.global lbl_802F1B14
lbl_802F1B14:
	.skip 0x4
.global lbl_802F1B18
lbl_802F1B18:
	.skip 0x4
.global lbl_802F1B1C
lbl_802F1B1C:
	.skip 0x4
.global lbl_802F1B20
lbl_802F1B20:
	.skip 0x4
.global lbl_802F1B24
lbl_802F1B24:
	.skip 0x4
.global lbl_802F1B28
lbl_802F1B28:
	.skip 0x4
.global lbl_802F1B2C
lbl_802F1B2C:
	.skip 0x4
.global lbl_802F1B30
lbl_802F1B30:
	.skip 0x4
.global lbl_802F1B34
lbl_802F1B34:
	.skip 0x4
.global lbl_802F1B38
lbl_802F1B38:
	.skip 0x4
.global lbl_802F1B3C
lbl_802F1B3C:
	.skip 0x4
.global lbl_802F1B40
lbl_802F1B40:
	.skip 0x4
.global lbl_802F1B44
lbl_802F1B44:
	.skip 0x4
.global lbl_802F1B48
lbl_802F1B48:
	.skip 0x4
.global lbl_802F1B4C
lbl_802F1B4C:
	.skip 0x4
.global lbl_802F1B50
lbl_802F1B50:
	.skip 0x4
.global lbl_802F1B54
lbl_802F1B54:
	.skip 0x4
.global lbl_802F1B58
lbl_802F1B58:
	.skip 0x8
.global lbl_802F1B60
lbl_802F1B60:
	.skip 0x8
.global lbl_802F1B68
lbl_802F1B68:
	.skip 0x4
.global lbl_802F1B6C
lbl_802F1B6C:
	.skip 0x4
.global lbl_802F1B70
lbl_802F1B70:
	.skip 0x4
.global lbl_802F1B74
lbl_802F1B74:
	.skip 0x4
.global lbl_802F1B78
lbl_802F1B78:
	.skip 0x4
.global lbl_802F1B7C
lbl_802F1B7C:
	.skip 0x4
.global lbl_802F1B80
lbl_802F1B80:
	.skip 0x4
.global submodeStringPtr
submodeStringPtr:
	.skip 0x4
.global modeStringPtr
modeStringPtr:
	.skip 0x4
.global gameSubmodeRequest
gameSubmodeRequest:
	.skip 0x2
.global gameSubmode
gameSubmode:
	.skip 0x2
.global gameModeRequest
gameModeRequest:
	.skip 0x2
.global gameMode
gameMode:
	.skip 0x6
.global lbl_802F1B98
lbl_802F1B98:
	.skip 0x4
.global lbl_802F1B9C
lbl_802F1B9C:
	.skip 0x4
.global lbl_802F1BA0
lbl_802F1BA0:
	.skip 0x1
.global lbl_802F1BA1
lbl_802F1BA1:
	.skip 0x7
.global lbl_802F1BA8
lbl_802F1BA8:
	.skip 0x4
.global lbl_802F1BAC
lbl_802F1BAC:
	.skip 0x4
.global lbl_802F1BB0
lbl_802F1BB0:
	.skip 0x4
.global lbl_802F1BB4
lbl_802F1BB4:
	.skip 0x8
.global lbl_802F1BBC
lbl_802F1BBC:
	.skip 0x8
.global lbl_802F1BC4
lbl_802F1BC4:
	.skip 0x4
.global lbl_802F1BC8
lbl_802F1BC8:
	.skip 0x4
.global lbl_802F1BCC
lbl_802F1BCC:
	.skip 0x4
.global lbl_802F1BD0
lbl_802F1BD0:
	.skip 0x4
.global lbl_802F1BD4
lbl_802F1BD4:
	.skip 0x4
.global lbl_802F1BD8
lbl_802F1BD8:
	.skip 0x8
.global lbl_802F1BE0
lbl_802F1BE0:
	.skip 0x8
.global lbl_802F1BE8
lbl_802F1BE8:
	.skip 0x8
.global lbl_802F1BF0
lbl_802F1BF0:
	.skip 0x4
.global lbl_802F1BF4
lbl_802F1BF4:
	.skip 0x8
.global lbl_802F1BFC
lbl_802F1BFC:
	.skip 0x8
.global lbl_802F1C04
lbl_802F1C04:
	.skip 0x8
.global lbl_802F1C0C
lbl_802F1C0C:
	.skip 0x1
.global lbl_802F1C0D
lbl_802F1C0D:
	.skip 0x3
.global lbl_802F1C10
lbl_802F1C10:
	.skip 0x8
.global lbl_802F1C18
lbl_802F1C18:
	.skip 0x4
.global lbl_802F1C1C
lbl_802F1C1C:
	.skip 0x4
.global lbl_802F1C20
lbl_802F1C20:
	.skip 0x4
.global lbl_802F1C24
lbl_802F1C24:
	.skip 0x1
.global lbl_802F1C25
lbl_802F1C25:
	.skip 0x3
.global lbl_802F1C28
lbl_802F1C28:
	.skip 0x8
.global lbl_802F1C30
lbl_802F1C30:
	.skip 0x2
.global lbl_802F1C32
lbl_802F1C32:
	.skip 0x2
.global lbl_802F1C34
lbl_802F1C34:
	.skip 0x4
.global minigameRelCameraCallback
minigameRelCameraCallback:
	.skip 0x4
.global currentCameraStructPtr
currentCameraStructPtr:
	.skip 0x4
.global lbl_802F1C40
lbl_802F1C40:
	.skip 0x8
.global lbl_802F1C48
lbl_802F1C48:
	.skip 0x4
.global lbl_802F1C4C
lbl_802F1C4C:
	.skip 0x4
.global lbl_802F1C50
lbl_802F1C50:
	.skip 0x4
.global lbl_802F1C54
lbl_802F1C54:
	.skip 0x4
.global lbl_802F1C58
lbl_802F1C58:
	.skip 0x4
.global lbl_802F1C5C
lbl_802F1C5C:
	.skip 0x4
.global lbl_802F1C60
lbl_802F1C60:
	.skip 0x4
.global lbl_802F1C64
lbl_802F1C64:
	.skip 0x4
.global lbl_802F1C68
lbl_802F1C68:
	.skip 0x4
.global lbl_802F1C6C
lbl_802F1C6C:
	.skip 0x8
.global lbl_802F1C74
lbl_802F1C74:
	.skip 0x1
.global lbl_802F1C75
lbl_802F1C75:
	.skip 0x3
.global lbl_802F1C78
lbl_802F1C78:
	.skip 0x4
.global lbl_802F1C7C
lbl_802F1C7C:
	.skip 0x4
.global lbl_802F1C80
lbl_802F1C80:
	.skip 0x4
.global lbl_802F1C84
lbl_802F1C84:
	.skip 0x4
.global lbl_802F1C88
lbl_802F1C88:
	.skip 0x4
.global lbl_802F1C8C
lbl_802F1C8C:
	.skip 0x4
.global lbl_802F1C90
lbl_802F1C90:
	.skip 0x4
.global lbl_802F1C94
lbl_802F1C94:
	.skip 0x4
.global lbl_802F1C98
lbl_802F1C98:
	.skip 0x8
.global lbl_802F1CA0
lbl_802F1CA0:
	.skip 0x4
.global lbl_802F1CA4
lbl_802F1CA4:
	.skip 0x4
.global lbl_802F1CA8
lbl_802F1CA8:
	.skip 0x4
.global lbl_802F1CAC
lbl_802F1CAC:
	.skip 0x4
.global lbl_802F1CB0
lbl_802F1CB0:
	.skip 0x8
.global lbl_802F1CB8
lbl_802F1CB8:
	.skip 0x4
.global lbl_802F1CBC
lbl_802F1CBC:
	.skip 0x4
.global decodedBgGma
decodedBgGma:
	.skip 0x4
.global decodedBgTpl
decodedBgTpl:
	.skip 0x4
.global lbl_802F1CC8
lbl_802F1CC8:
	.skip 0x4
.global lbl_802F1CCC
lbl_802F1CCC:
	.skip 0x4
.global lbl_802F1CD0
lbl_802F1CD0:
	.skip 0x1
.global lbl_802F1CD1
lbl_802F1CD1:
	.skip 0x1
.global lbl_802F1CD2
lbl_802F1CD2:
	.skip 0x2
.global lbl_802F1CD4
lbl_802F1CD4:
	.skip 0x4
.global lbl_802F1CD8
lbl_802F1CD8:
	.skip 0x8
.global lbl_802F1CE0
lbl_802F1CE0:
	.skip 0x2
.global lbl_802F1CE2
lbl_802F1CE2:
	.skip 0x2
.global lbl_802F1CE4
lbl_802F1CE4:
	.skip 0x4
.global lbl_802F1CE8
lbl_802F1CE8:
	.skip 0x4
.global lbl_802F1CEC
lbl_802F1CEC:
	.skip 0x4
.global lbl_802F1CF0
lbl_802F1CF0:
	.skip 0x4
.global lbl_802F1CF4
lbl_802F1CF4:
	.skip 0x4
.global lbl_802F1CF8
lbl_802F1CF8:
	.skip 0x4
.global lbl_802F1CFC
lbl_802F1CFC:
	.skip 0x4
.global lbl_802F1D00
lbl_802F1D00:
	.skip 0x4
.global lbl_802F1D04
lbl_802F1D04:
	.skip 0x4
.global lbl_802F1D08
lbl_802F1D08:
	.skip 0x8
.global lbl_802F1D10
lbl_802F1D10:
	.skip 0x8
.global lbl_802F1D18
lbl_802F1D18:
	.skip 0x8
.global lbl_802F1D20
lbl_802F1D20:
	.skip 0x4
.global lbl_802F1D24
lbl_802F1D24:
	.skip 0x4
.global lbl_802F1D28
lbl_802F1D28:
	.skip 0x8
.global lbl_802F1D30
lbl_802F1D30:
	.skip 0x8
.global lbl_802F1D38
lbl_802F1D38:
	.skip 0x1
.global lbl_802F1D39
lbl_802F1D39:
	.skip 0x1
.global lbl_802F1D3A
lbl_802F1D3A:
	.skip 0x2
.global lbl_802F1D3C
lbl_802F1D3C:
	.skip 0x4
.global lbl_802F1D40
lbl_802F1D40:
	.skip 0x4
.global lbl_802F1D44
lbl_802F1D44:
	.skip 0x4
.global lbl_802F1D48
lbl_802F1D48:
	.skip 0x4
.global lbl_802F1D4C
lbl_802F1D4C:
	.skip 0x4
.global lbl_802F1D50
lbl_802F1D50:
	.skip 0x4
.global lbl_802F1D54
lbl_802F1D54:
	.skip 0x4
.global lbl_802F1D58
lbl_802F1D58:
	.skip 0x4
.global lbl_802F1D5C
lbl_802F1D5C:
	.skip 0x4
.global lbl_802F1D60
lbl_802F1D60:
	.skip 0x4
.global lbl_802F1D64
lbl_802F1D64:
	.skip 0x4
.global lbl_802F1D68
lbl_802F1D68:
	.skip 0x4
.global lbl_802F1D6C
lbl_802F1D6C:
	.skip 0x4
.global lbl_802F1D70
lbl_802F1D70:
	.skip 0x4
.global lbl_802F1D74
lbl_802F1D74:
	.skip 0x4
.global lbl_802F1D78
lbl_802F1D78:
	.skip 0x4
.global lbl_802F1D7C
lbl_802F1D7C:
	.skip 0x4
.global lbl_802F1D80
lbl_802F1D80:
	.skip 0x4
.global lbl_802F1D84
lbl_802F1D84:
	.skip 0x4
.global lbl_802F1D88
lbl_802F1D88:
	.skip 0x4
.global lbl_802F1D8C
lbl_802F1D8C:
	.skip 0x4
.global lbl_802F1D90
lbl_802F1D90:
	.skip 0x4
.global lbl_802F1D94
lbl_802F1D94:
	.skip 0x4
.global lbl_802F1D98
lbl_802F1D98:
	.skip 0x4
.global lbl_802F1D9C
lbl_802F1D9C:
	.skip 0x4
.global lbl_802F1DA0
lbl_802F1DA0:
	.skip 0x4
.global lbl_802F1DA4
lbl_802F1DA4:
	.skip 0x4
.global lbl_802F1DA8
lbl_802F1DA8:
	.skip 0x4
.global lbl_802F1DAC
lbl_802F1DAC:
	.skip 0x4
.global lbl_802F1DB0
lbl_802F1DB0:
	.skip 0x4
.global lbl_802F1DB4
lbl_802F1DB4:
	.skip 0x4
.global lbl_802F1DB8
lbl_802F1DB8:
	.skip 0x4
.global lbl_802F1DBC
lbl_802F1DBC:
	.skip 0x4
.global lbl_802F1DC0
lbl_802F1DC0:
	.skip 0x4
.global lbl_802F1DC4
lbl_802F1DC4:
	.skip 0x4
.global lbl_802F1DC8
lbl_802F1DC8:
	.skip 0x4
.global lbl_802F1DCC
lbl_802F1DCC:
	.skip 0x4
.global lbl_802F1DD0
lbl_802F1DD0:
	.skip 0x4
.global lbl_802F1DD4
lbl_802F1DD4:
	.skip 0x4
.global lbl_802F1DD8
lbl_802F1DD8:
	.skip 0x1
.global lbl_802F1DD9
lbl_802F1DD9:
	.skip 0x3
.global lbl_802F1DDC
lbl_802F1DDC:
	.skip 0x4
.global lbl_802F1DE0
lbl_802F1DE0:
	.skip 0x4
.global lbl_802F1DE4
lbl_802F1DE4:
	.skip 0x4
.global lbl_802F1DE8
lbl_802F1DE8:
	.skip 0x4
.global lbl_802F1DEC
lbl_802F1DEC:
	.skip 0x4
.global lbl_802F1DF0
lbl_802F1DF0:
	.skip 0x4
.global lbl_802F1DF4
lbl_802F1DF4:
	.skip 0x1
.global lbl_802F1DF5
lbl_802F1DF5:
	.skip 0x3
.global lbl_802F1DF8
lbl_802F1DF8:
	.skip 0x4
.global lbl_802F1DFC
lbl_802F1DFC:
	.skip 0x4
.global lbl_802F1E00
lbl_802F1E00:
	.skip 0x8
.global lbl_802F1E08
lbl_802F1E08:
	.skip 0x4
.global lbl_802F1E0C
lbl_802F1E0C:
	.skip 0x4
.global lbl_802F1E10
lbl_802F1E10:
	.skip 0x4
.global lbl_802F1E14
lbl_802F1E14:
	.skip 0x4
.global lbl_802F1E18
lbl_802F1E18:
	.skip 0x1
.global lbl_802F1E19
lbl_802F1E19:
	.skip 0x3
.global lbl_802F1E1C
lbl_802F1E1C:
	.skip 0x4
.global lbl_802F1E20
lbl_802F1E20:
	.skip 0x4
.global lbl_802F1E24
lbl_802F1E24:
	.skip 0x4
.global lbl_802F1E28
lbl_802F1E28:
	.skip 0x4
.global lbl_802F1E2C
lbl_802F1E2C:
	.skip 0x4
.global lbl_802F1E30
lbl_802F1E30:
	.skip 0x4
.global lbl_802F1E34
lbl_802F1E34:
	.skip 0x4
.global lbl_802F1E38
lbl_802F1E38:
	.skip 0x4
.global lbl_802F1E3C
lbl_802F1E3C:
	.skip 0x4
.global lbl_802F1E40
lbl_802F1E40:
	.skip 0x4
.global lbl_802F1E44
lbl_802F1E44:
	.skip 0x4
.global lbl_802F1E48
lbl_802F1E48:
	.skip 0x4
.global lbl_802F1E4C
lbl_802F1E4C:
	.skip 0x4
.global lbl_802F1E50
lbl_802F1E50:
	.skip 0x1
.global lbl_802F1E51
lbl_802F1E51:
	.skip 0x3
.global lbl_802F1E54
lbl_802F1E54:
	.skip 0x4
.global lbl_802F1E58
lbl_802F1E58:
	.skip 0x50
.global lbl_802F1EA8
lbl_802F1EA8:
	.skip 0x8
.global lbl_802F1EB0
lbl_802F1EB0:
	.skip 0x4
.global lbl_802F1EB4
lbl_802F1EB4:
	.skip 0x10
.global lbl_802F1EC4
lbl_802F1EC4:
	.skip 0x4
.global lbl_802F1EC8
lbl_802F1EC8:
	.skip 0x4
.global lbl_802F1ECC
lbl_802F1ECC:
	.skip 0x4
.global lbl_802F1ED0
lbl_802F1ED0:
	.skip 0x2
.global lbl_802F1ED2
lbl_802F1ED2:
	.skip 0x2
.global lbl_802F1ED4
lbl_802F1ED4:
	.skip 0x4
.global lbl_802F1ED8
lbl_802F1ED8:
	.skip 0x4
.global dipSwitches
dipSwitches:
	.skip 0x4
.global lbl_802F1EE0
lbl_802F1EE0:
	.skip 0x8
.global lbl_802F1EE8
lbl_802F1EE8:
	.skip 0x4
.global lbl_802F1EEC
lbl_802F1EEC:
	.skip 0x4
.global lbl_802F1EF0
lbl_802F1EF0:
	.skip 0x4
.global lbl_802F1EF4
lbl_802F1EF4:
	.skip 0x4
.global lbl_802F1EF8
lbl_802F1EF8:
	.skip 0x4
.global lbl_802F1EFC
lbl_802F1EFC:
	.skip 0x4
.global lbl_802F1F00
lbl_802F1F00:
	.skip 0x8
.global lbl_802F1F08
lbl_802F1F08:
	.skip 0x4
.global lbl_802F1F0C
lbl_802F1F0C:
	.skip 0x4
.global lbl_802F1F10
lbl_802F1F10:
	.skip 0x4
.global minigameRelBallCallback
minigameRelBallCallback:
	.skip 0x4
.global currentBallStructPtr
currentBallStructPtr:
	.skip 0x8
.global currentWorldStructPtr
currentWorldStructPtr:
	.skip 0x8
.global lbl_802F1F28
lbl_802F1F28:
	.skip 0x4
.global lbl_802F1F2C
lbl_802F1F2C:
	.skip 0x4
.global decodedStageLzPtr
decodedStageLzPtr:
	.skip 0x4
.global lbl_802F1F34
lbl_802F1F34:
	.skip 0x4
.global decodedStageGmaPtr
decodedStageGmaPtr:
	.skip 0x4
.global decodedStageTplPtr
decodedStageTplPtr:
	.skip 0x4
.global lbl_802F1F40
lbl_802F1F40:
	.skip 0x4
.global lbl_802F1F44
lbl_802F1F44:
	.skip 0x4
.global lbl_802F1F48
lbl_802F1F48:
	.skip 0x4
.global lbl_802F1F4C
lbl_802F1F4C:
	.skip 0x4
.global lbl_802F1F50
lbl_802F1F50:
	.skip 0x4
.global loadingStageIdRequest
loadingStageIdRequest:
	.skip 0x2
.global loadingStageId
loadingStageId:
	.skip 0x2
.global stageId
stageId:
	.skip 0x8
.global lbl_802F1F60
lbl_802F1F60:
	.skip 0x8
.global lbl_802F1F68
lbl_802F1F68:
	.skip 0x4
.global lbl_802F1F6C
lbl_802F1F6C:
	.skip 0x4
.global lbl_802F1F70
lbl_802F1F70:
	.skip 0x4
.global lbl_802F1F74
lbl_802F1F74:
	.skip 0x4
.global lbl_802F1F78
lbl_802F1F78:
	.skip 0x8
.global lbl_802F1F80
lbl_802F1F80:
	.skip 0x8
.global lbl_802F1F88
lbl_802F1F88:
	.skip 0x8
.global lbl_802F1F90
lbl_802F1F90:
	.skip 0x8
.global lbl_802F1F98
lbl_802F1F98:
	.skip 0x4
.global lbl_802F1F9C
lbl_802F1F9C:
	.skip 0x4
.global lbl_802F1FA0
lbl_802F1FA0:
	.skip 0x4
.global lbl_802F1FA4
lbl_802F1FA4:
	.skip 0xC
.global lbl_802F1FB0
lbl_802F1FB0:
	.skip 0x8
.global lbl_802F1FB8
lbl_802F1FB8:
	.skip 0x4
.global lbl_802F1FBC
lbl_802F1FBC:
	.skip 0x4
.global lbl_802F1FC0
lbl_802F1FC0:
	.skip 0x4
.global lbl_802F1FC4
lbl_802F1FC4:
	.skip 0x4
.global lbl_802F1FC8
lbl_802F1FC8:
	.skip 0x8
.global lbl_802F1FD0
lbl_802F1FD0:
	.skip 0x4
.global lbl_802F1FD4
lbl_802F1FD4:
	.skip 0x4
.global lbl_802F1FD8
lbl_802F1FD8:
	.skip 0x4
.global lbl_802F1FDC
lbl_802F1FDC:
	.skip 0x4
.global lbl_802F1FE0
lbl_802F1FE0:
	.skip 0x4
.global lbl_802F1FE4
lbl_802F1FE4:
	.skip 0xC
.global lbl_802F1FF0
lbl_802F1FF0:
	.skip 0x4
.global lbl_802F1FF4
lbl_802F1FF4:
	.skip 0x2
.global lbl_802F1FF6
lbl_802F1FF6:
	.skip 0x2
.global lbl_802F1FF8
lbl_802F1FF8:
	.skip 0x4
.global lbl_802F1FFC
lbl_802F1FFC:
	.skip 0x4
.global lbl_802F2000
lbl_802F2000:
	.skip 0x8
.global lbl_802F2008
lbl_802F2008:
	.skip 0x4
.global lbl_802F200C
lbl_802F200C:
	.skip 0x4
.global lbl_802F2010
lbl_802F2010:
	.skip 0x4
.global lbl_802F2014
lbl_802F2014:
	.skip 0x4
.global lbl_802F2018
lbl_802F2018:
	.skip 0x4
.global lbl_802F201C
lbl_802F201C:
	.skip 0x4
.global lbl_802F2020
lbl_802F2020:
	.skip 0x1
.global lbl_802F2021
lbl_802F2021:
	.skip 0x1
.global lbl_802F2022
lbl_802F2022:
	.skip 0x1
.global lbl_802F2023
lbl_802F2023:
	.skip 0x1
.global lbl_802F2024
lbl_802F2024:
	.skip 0x1
.global lbl_802F2025
lbl_802F2025:
	.skip 0x3
.global lbl_802F2028
lbl_802F2028:
	.skip 0x4
.global lbl_802F202C
lbl_802F202C:
	.skip 0x4
.global lbl_802F2030
lbl_802F2030:
	.skip 0x4
.global lbl_802F2034
lbl_802F2034:
	.skip 0x4
.global lbl_802F2038
lbl_802F2038:
	.skip 0x4
.global lbl_802F203C
lbl_802F203C:
	.skip 0x4
.global lbl_802F2040
lbl_802F2040:
	.skip 0x4
.global lbl_802F2044
lbl_802F2044:
	.skip 0x4
.global lbl_802F2048
lbl_802F2048:
	.skip 0x4
.global lbl_802F204C
lbl_802F204C:
	.skip 0x4
.global lbl_802F2050
lbl_802F2050:
	.skip 0x4
.global lbl_802F2054
lbl_802F2054:
	.skip 0x4
.global lbl_802F2058
lbl_802F2058:
	.skip 0x8
.global lbl_802F2060
lbl_802F2060:
	.skip 0x8
.global lbl_802F2068
lbl_802F2068:
	.skip 0x4
.global lbl_802F206C
lbl_802F206C:
	.skip 0x4
.global lbl_802F2070
lbl_802F2070:
	.skip 0x4
.global lbl_802F2074
lbl_802F2074:
	.skip 0x4
.global lbl_802F2078
lbl_802F2078:
	.skip 0x4
.global lbl_802F207C
lbl_802F207C:
	.skip 0x4
.global lbl_802F2080
lbl_802F2080:
	.skip 0x4
.global lbl_802F2084
lbl_802F2084:
	.skip 0x4
.global lbl_802F2088
lbl_802F2088:
	.skip 0x4
.global lbl_802F208C
lbl_802F208C:
	.skip 0x4
.global lbl_802F2090
lbl_802F2090:
	.skip 0x4
.global lbl_802F2094
lbl_802F2094:
	.skip 0x8
.global lbl_802F209C
lbl_802F209C:
	.skip 0x8
.global lbl_802F20A4
lbl_802F20A4:
	.skip 0x4
.global lbl_802F20A8
lbl_802F20A8:
	.skip 0x4
.global lbl_802F20AC
lbl_802F20AC:
	.skip 0x4
.global lbl_802F20B0
lbl_802F20B0:
	.skip 0x8
.global lbl_802F20B8
lbl_802F20B8:
	.skip 0x4
.global lbl_802F20BC
lbl_802F20BC:
	.skip 0x4
.global lbl_802F20C0
lbl_802F20C0:
	.skip 0x4
.global lbl_802F20C4
lbl_802F20C4:
	.skip 0x4
.global lbl_802F20C8
lbl_802F20C8:
	.skip 0x4
.global lbl_802F20CC
lbl_802F20CC:
	.skip 0x4
.global lbl_802F20D0
lbl_802F20D0:
	.skip 0x4
.global lbl_802F20D4
lbl_802F20D4:
	.skip 0x4
.global lbl_802F20D8
lbl_802F20D8:
	.skip 0x4
.global lbl_802F20DC
lbl_802F20DC:
	.skip 0x4
.global lbl_802F20E0
lbl_802F20E0:
	.skip 0x4
.global lbl_802F20E4
lbl_802F20E4:
	.skip 0x4
.global lbl_802F20E8
lbl_802F20E8:
	.skip 0x4
.global lbl_802F20EC
lbl_802F20EC:
	.skip 0x4
.global lbl_802F20F0
lbl_802F20F0:
	.skip 0x4
.global lbl_802F20F4
lbl_802F20F4:
	.skip 0x4
.global lbl_802F20F8
lbl_802F20F8:
	.skip 0x4
.global lbl_802F20FC
lbl_802F20FC:
	.skip 0x4
.global lbl_802F2100
lbl_802F2100:
	.skip 0x1
.global lbl_802F2101
lbl_802F2101:
	.skip 0x3
.global lbl_802F2104
lbl_802F2104:
	.skip 0x4
.global lbl_802F2108
lbl_802F2108:
	.skip 0x4
.global lbl_802F210C
lbl_802F210C:
	.skip 0x4
.global lbl_802F2110
lbl_802F2110:
	.skip 0x4
.global lbl_802F2114
lbl_802F2114:
	.skip 0x4
.global lbl_802F2118
lbl_802F2118:
	.skip 0x4
.global lbl_802F211C
lbl_802F211C:
	.skip 0x4
.global lbl_802F2120
lbl_802F2120:
	.skip 0x4
.global lbl_802F2124
lbl_802F2124:
	.skip 0x4
.global lbl_802F2128
lbl_802F2128:
	.skip 0x4
.global lbl_802F212C
lbl_802F212C:
	.skip 0x8
.global lbl_802F2134
lbl_802F2134:
	.skip 0x4
.global lbl_802F2138
lbl_802F2138:
	.skip 0x4
.global lbl_802F213C
lbl_802F213C:
	.skip 0x4
.global lbl_802F2140
lbl_802F2140:
	.skip 0x4
.global lbl_802F2144
lbl_802F2144:
	.skip 0x4
.global lbl_802F2148
lbl_802F2148:
	.skip 0x8
.global lbl_802F2150
lbl_802F2150:
	.skip 0x4
.global lbl_802F2154
lbl_802F2154:
	.skip 0x4
.global lbl_802F2158
lbl_802F2158:
	.skip 0x4
.global lbl_802F215C
lbl_802F215C:
	.skip 0x4
.global lbl_802F2160
lbl_802F2160:
	.skip 0x4
.global lbl_802F2164
lbl_802F2164:
	.skip 0x4
.global lbl_802F2168
lbl_802F2168:
	.skip 0x8
.global lbl_802F2170
lbl_802F2170:
	.skip 0x8
.global lbl_802F2178
lbl_802F2178:
	.skip 0x8
.global lbl_802F2180
lbl_802F2180:
	.skip 0x4
.global lbl_802F2184
lbl_802F2184:
	.skip 0x4
.global lbl_802F2188
lbl_802F2188:
	.skip 0x8
.global lbl_802F2190
lbl_802F2190:
	.skip 0x4
.global lbl_802F2194
lbl_802F2194:
	.skip 0x4
.global lbl_802F2198
lbl_802F2198:
	.skip 0x8
.global lbl_802F21A0
lbl_802F21A0:
	.skip 0x8
.global lbl_802F21A8
lbl_802F21A8:
	.skip 0x4
.global lbl_802F21AC
lbl_802F21AC:
	.skip 0x4
.global lbl_802F21B0
lbl_802F21B0:
	.skip 0x1
.global lbl_802F21B1
lbl_802F21B1:
	.skip 0x1
.global lbl_802F21B2
lbl_802F21B2:
	.skip 0x2
.global lbl_802F21B4
lbl_802F21B4:
	.skip 0x4
.global lbl_802F21B8
lbl_802F21B8:
	.skip 0x1
.global lbl_802F21B9
lbl_802F21B9:
	.skip 0x3
.global lbl_802F21BC
lbl_802F21BC:
	.skip 0x4
.global lbl_802F21C0
lbl_802F21C0:
	.skip 0x4
.global lbl_802F21C4
lbl_802F21C4:
	.skip 0x4
.global lbl_802F21C8
lbl_802F21C8:
	.skip 0x8
.global lbl_802F21D0
lbl_802F21D0:
	.skip 0x4
.global lbl_802F21D4
lbl_802F21D4:
	.skip 0x4
.global lbl_802F21D8
lbl_802F21D8:
	.skip 0x4
.global lbl_802F21DC
lbl_802F21DC:
	.skip 0x2
.global lbl_802F21DE
lbl_802F21DE:
	.skip 0x2
.global lbl_802F21E0
lbl_802F21E0:
	.skip 0x8
.global lbl_802F21E8
lbl_802F21E8:
	.skip 0x4
.global lbl_802F21EC
lbl_802F21EC:
	.skip 0x4
.global lbl_802F21F0
lbl_802F21F0:
	.skip 0x8
.global lbl_802F21F8
lbl_802F21F8:
	.skip 0x4
.global lbl_802F21FC
lbl_802F21FC:
	.skip 0x4
.global lbl_802F2200
lbl_802F2200:
	.skip 0x4
.global lbl_802F2204
lbl_802F2204:
	.skip 0x4
.global lbl_802F2208
lbl_802F2208:
	.skip 0x8
.global lbl_802F2210
lbl_802F2210:
	.skip 0x4
.global lbl_802F2214
lbl_802F2214:
	.skip 0x4
.global lbl_802F2218
lbl_802F2218:
	.skip 0x4
.global lbl_802F221C
lbl_802F221C:
	.skip 0x4
.global lbl_802F2220
lbl_802F2220:
	.skip 0x4
.global lbl_802F2224
lbl_802F2224:
	.skip 0x4
.global lbl_802F2228
lbl_802F2228:
	.skip 0x4
.global lbl_802F222C
lbl_802F222C:
	.skip 0x4
.global lbl_802F2230
lbl_802F2230:
	.skip 0x4
.global lbl_802F2234
lbl_802F2234:
	.skip 0x4
.global lbl_802F2238
lbl_802F2238:
	.skip 0x4
.global lbl_802F223C
lbl_802F223C:
	.skip 0x4
.global lbl_802F2240
lbl_802F2240:
	.skip 0x4
.global lbl_802F2244
lbl_802F2244:
	.skip 0x4
.global lbl_802F2248
lbl_802F2248:
	.skip 0x4
.global lbl_802F224C
lbl_802F224C:
	.skip 0x4
.global lbl_802F2250
lbl_802F2250:
	.skip 0x4
.global lbl_802F2254
lbl_802F2254:
	.skip 0x4
.global lbl_802F2258
lbl_802F2258:
	.skip 0x4
.global lbl_802F225C
lbl_802F225C:
	.skip 0x4
.global lbl_802F2260
lbl_802F2260:
	.skip 0x4
.global lbl_802F2264
lbl_802F2264:
	.skip 0x4
.global lbl_802F2268
lbl_802F2268:
	.skip 0x4
.global lbl_802F226C
lbl_802F226C:
	.skip 0x4
.global lbl_802F2270
lbl_802F2270:
	.skip 0x4
.global lbl_802F2274
lbl_802F2274:
	.skip 0x4
.global lbl_802F2278
lbl_802F2278:
	.skip 0x4
.global lbl_802F227C
lbl_802F227C:
	.skip 0x4
.global lbl_802F2280
lbl_802F2280:
	.skip 0x4
.global lbl_802F2284
lbl_802F2284:
	.skip 0x4
.global lbl_802F2288
lbl_802F2288:
	.skip 0x4
.global lbl_802F228C
lbl_802F228C:
	.skip 0x4
.global lbl_802F2290
lbl_802F2290:
	.skip 0x4
.global lbl_802F2294
lbl_802F2294:
	.skip 0x4
.global lbl_802F2298
lbl_802F2298:
	.skip 0x4
.global lbl_802F229C
lbl_802F229C:
	.skip 0x4
.global lbl_802F22A0
lbl_802F22A0:
	.skip 0x4
.global lbl_802F22A4
lbl_802F22A4:
	.skip 0x4
.global lbl_802F22A8
lbl_802F22A8:
	.skip 0x4
.global lbl_802F22AC
lbl_802F22AC:
	.skip 0x4
.global lbl_802F22B0
lbl_802F22B0:
	.skip 0x4
.global lbl_802F22B4
lbl_802F22B4:
	.skip 0x4
.global lbl_802F22B8
lbl_802F22B8:
	.skip 0x4
.global lbl_802F22BC
lbl_802F22BC:
	.skip 0x4
.global lbl_802F22C0
lbl_802F22C0:
	.skip 0x8
.global lbl_802F22C8
lbl_802F22C8:
	.skip 0x8
.global BootInfo
BootInfo:
	.skip 0x4
.global BI2DebugFlag
BI2DebugFlag:
	.skip 0x4
.global AreWeInitialized
AreWeInitialized:
	.skip 0x4
.global OSExceptionTable
OSExceptionTable:
	.skip 0x4
.global AlarmQueue
AlarmQueue:
	.skip 0x8
.global HeapArray
HeapArray:
	.skip 0x4
.global NumHeaps
NumHeaps:
	.skip 0x4
.global ArenaStart
ArenaStart:
	.skip 0x4
.global ArenaEnd
ArenaEnd:
	.skip 0x4
.global __OSArenaHi
__OSArenaHi:
	.skip 0x8
.global FontData
FontData:
	.skip 0x4
.global SheetImage
SheetImage:
	.skip 0x4
.global WidthTable
WidthTable:
	.skip 0x4
.global CharsInSheet
CharsInSheet:
	.skip 0x4
.global InterruptHandlerTable
InterruptHandlerTable:
	.skip 0x8
.global Prepared
Prepared:
	.skip 0x8
.global ResetFunctionQueue
ResetFunctionQueue:
	.skip 0x8
.global ResetCallback
ResetCallback:
	.skip 0x4
.global Down
Down:
	.skip 0x4
.global LastState
LastState:
	.skip 0x8
.global HoldUp
HoldUp:
	.skip 0x4
.global lbl_802F233C
lbl_802F233C:
	.skip 0x4
.global HoldDown
HoldDown:
	.skip 0x4
.global lbl_802F2344
lbl_802F2344:
	.skip 0x4
.global RunQueueBits
RunQueueBits:
	.skip 0x4
.global RunQueueHint
RunQueueHint:
	.skip 0x4
.global Reschedule
Reschedule:
	.skip 0x8
.global serEnabled
serEnabled:
	.skip 0x8
.global __DBInterface
__DBInterface:
	.skip 0x4
.global DBVerbose
DBVerbose:
	.skip 0x4
.global StopAtNextInt
StopAtNextInt:
	.skip 0x4
.global LastLength
LastLength:
	.skip 0x4
.global _DVDLow_Callback
_DVDLow_Callback:
	.skip 0x4
.global ResetCoverCallback
ResetCoverCallback:
	.skip 0x4
.global LastResetEnd
LastResetEnd:
	.skip 0x4
.global lbl_802F237C
lbl_802F237C:
	.skip 0x4
.global ResetOccurred
ResetOccurred:
	.skip 0x4
.global WaitingCoverClose
WaitingCoverClose:
	.skip 0x4
.global Breaking
Breaking:
	.skip 0x4
.global WorkAroundType
WorkAroundType:
	.skip 0x4
.global WorkAroundSeekLocation
WorkAroundSeekLocation:
	.skip 0x8
.global LastReadFinished
LastReadFinished:
	.skip 0x4
.global lbl_802F239C
lbl_802F239C:
	.skip 0x4
.global LastReadIssued
LastReadIssued:
	.skip 0x4
.global lbl_802F23A4
lbl_802F23A4:
	.skip 0x4
.global LastCommandWasRead
LastCommandWasRead:
	.skip 0x4
.global NextCommandNumber
NextCommandNumber:
	.skip 0x4
.global _DVDFS_BootInfo
_DVDFS_BootInfo:
	.skip 0x4
.global FstStart
FstStart:
	.skip 0x4
.global FstStringStart
FstStringStart:
	.skip 0x4
.global MaxEntryNum
MaxEntryNum:
	.skip 0x4
.global currentDirectory
currentDirectory:
	.skip 0x4
.global __DVDLongFileNameFlag
__DVDLongFileNameFlag:
	.skip 0x4
.global __DVDThreadQueue
__DVDThreadQueue:
	.skip 0x8
.global executing
executing:
	.skip 0x4
.global currID
currID:
	.skip 0x4
.global bootInfo
bootInfo:
	.skip 0x4
.global PauseFlag
PauseFlag:
	.skip 0x4
.global PausingFlag
PausingFlag:
	.skip 0x4
.global AutoFinishing
AutoFinishing:
	.skip 0x4
.global FatalErrorFlag
FatalErrorFlag:
	.skip 0x4
.global CurrCommand
CurrCommand:
	.skip 0x4
.global Canceling
Canceling:
	.skip 0x4
.global CancelCallback
CancelCallback:
	.skip 0x4
.global ResumeFromHere
ResumeFromHere:
	.skip 0x4
.global CancelLastError
CancelLastError:
	.skip 0x4
.global LastError
LastError:
	.skip 0x4
.global NumInternalRetry
NumInternalRetry:
	.skip 0x4
.global ResetRequired
ResetRequired:
	.skip 0x4
.global FirstTimeInBootrom
FirstTimeInBootrom:
	.skip 0x4
.global DVDInitialized
DVDInitialized:
	.skip 0x4
.global _DVD_LastState
_DVD_LastState:
	.skip 0x4
.global status
status:
	.skip 0x4
.global bb2
bb2:
	.skip 0x4
.global idTmp
idTmp:
	.skip 0x8
.global retraceCount
retraceCount:
	.skip 0x4
.global shdwChangeMode
shdwChangeMode:
	.skip 0x4
.global flushFlag
flushFlag:
	.skip 0x4
.global retraceQueue
retraceQueue:
	.skip 0x8
.global PreCB
PreCB:
	.skip 0x4
.global PostCB
PostCB:
	.skip 0x4
.global encoderType
encoderType:
	.skip 0x4
.global displayOffsetH
displayOffsetH:
	.skip 0x2
.global displayOffsetV
displayOffsetV:
	.skip 0x6
.global changeMode
changeMode:
	.skip 0x4
.global changed
changed:
	.skip 0x4
.global shdwChanged
shdwChanged:
	.skip 0x4
.global lbl_802F245C
lbl_802F245C:
	.skip 0x4
.global Initialized
Initialized:
	.skip 0x8
.global lbl_802F2468
lbl_802F2468:
	.skip 0x4
.global EnabledBits
EnabledBits:
	.skip 0x4
.global ResettingBits
ResettingBits:
	.skip 0x4
.global ProbingBits
ProbingBits:
	.skip 0x4
.global RecalibrateBits
RecalibrateBits:
	.skip 0x4
.global WaitingBits
WaitingBits:
	.skip 0x4
.global CheckingBits
CheckingBits:
	.skip 0x4
.global cmdTypeAndStatus
cmdTypeAndStatus:
	.skip 0x4
.global recalibrated
recalibrated:
	.skip 0x4
.global __PADSpec
__PADSpec:
	.skip 0x4
.global __PADFixBits
__PADFixBits:
	.skip 0x8
.global __AIS_Callback
__AIS_Callback:
	.skip 0x4
.global __AID_Callback
__AID_Callback:
	.skip 0x4
.global __CallbackStack
__CallbackStack:
	.skip 0x4
.global __OldStack
__OldStack:
	.skip 0x4
.global __AI_init_flag
__AI_init_flag:
	.skip 0x8
.global bound_32KHz
bound_32KHz:
	.skip 0x4
.global lbl_802F24B4
lbl_802F24B4:
	.skip 0x4
.global bound_48KHz
bound_48KHz:
	.skip 0x4
.global lbl_802F24BC
lbl_802F24BC:
	.skip 0x4
.global min_wait
min_wait:
	.skip 0x4
.global lbl_802F24C4
lbl_802F24C4:
	.skip 0x4
.global max_wait
max_wait:
	.skip 0x4
.global lbl_802F24CC
lbl_802F24CC:
	.skip 0x4
.global buffer
buffer:
	.skip 0x4
.global lbl_802F24D4
lbl_802F24D4:
	.skip 0x4
.global __AR_Callback
__AR_Callback:
	.skip 0x4
.global __AR_Size
__AR_Size:
	.skip 0x4
.global __AR_StackPointer
__AR_StackPointer:
	.skip 0x4
.global __AR_FreeBlocks
__AR_FreeBlocks:
	.skip 0x4
.global __AR_BlockLength
__AR_BlockLength:
	.skip 0x4
.global __AR_init_flag
__AR_init_flag:
	.skip 0x4
.global __ARQRequestQueueHi
__ARQRequestQueueHi:
	.skip 0x4
.global __ARQRequestTailHi
__ARQRequestTailHi:
	.skip 0x4
.global __ARQRequestQueueLo
__ARQRequestQueueLo:
	.skip 0x4
.global __ARQRequestTailLo
__ARQRequestTailLo:
	.skip 0x4
.global __ARQRequestPendingHi
__ARQRequestPendingHi:
	.skip 0x4
.global __ARQRequestPendingLo
__ARQRequestPendingLo:
	.skip 0x4
.global __ARQCallbackHi
__ARQCallbackHi:
	.skip 0x4
.global __ARQCallbackLo
__ARQCallbackLo:
	.skip 0x4
.global __ARQChunkSize
__ARQChunkSize:
	.skip 0x4
.global __ARQ_init_flag
__ARQ_init_flag:
	.skip 0x4
.global __DSP_init_flag
__DSP_init_flag:
	.skip 0x4
.global __DSP_tmp_task
__DSP_tmp_task:
	.skip 0x4
.global __DSP_curr_task
__DSP_curr_task:
	.skip 0x4
.global __DSP_last_task
__DSP_last_task:
	.skip 0x4
.global __DSP_first_task
__DSP_first_task:
	.skip 0x8
.global __DSP_rude_task_pending
__DSP_rude_task_pending:
	.skip 0x4
.global __DSP_rude_task
__DSP_rude_task:
	.skip 0x4
.global __CARDDiskID
__CARDDiskID:
	.skip 0x8
.global __piReg
__piReg:
	.skip 0x4
.global __cpReg
__cpReg:
	.skip 0x4
.global __peReg
__peReg:
	.skip 0x4
.global __memReg
__memReg:
	.skip 0x4
.global __GXCurrentThread
__GXCurrentThread:
	.skip 0x4
.global CPGPLinked
CPGPLinked:
	.skip 0x4
.global GXOverflowSuspendInProgress
GXOverflowSuspendInProgress:
	.skip 0x4
.global BreakPointCB
BreakPointCB:
	.skip 0x4
.global __GXOverflowCount
__GXOverflowCount:
	.skip 0x4
.global GPFifo
GPFifo:
	.skip 0x4
.global CPUFifo
CPUFifo:
	.skip 0x8
.global TokenCB
TokenCB:
	.skip 0x4
.global DrawDoneCB
DrawDoneCB:
	.skip 0x4
.global DrawDone
DrawDone:
	.skip 0x4
.global FinishQueue
FinishQueue:
	.skip 0xC
.global OldCPUFifo
OldCPUFifo:
	.skip 0x8
.global magic
magic:
	.skip 0x4
.global PerfAlloc
PerfAlloc:
	.skip 0x4
.global PerfFree
PerfFree:
	.skip 0x4
.global DSCB
DSCB:
	.skip 0x4
.global PERFCurrSample
PERFCurrSample:
	.skip 0x4
.global PERFCurrFrame
PERFCurrFrame:
	.skip 0x4
.global PERFEvents
PERFEvents:
	.skip 0x4
.global PERFFrames
PERFFrames:
	.skip 0x4
.global PERFNumSamples
PERFNumSamples:
	.skip 0x4
.global PERFNumEvents
PERFNumEvents:
	.skip 0x4
.global PERFNumFrames
PERFNumFrames:
	.skip 0x8
.global DrawFrameMax
DrawFrameMax:
	.skip 0x4
.global DrawFrameH
DrawFrameH:
	.skip 0x4
.global MaxBusTransactions
MaxBusTransactions:
	.skip 0x4
.global bDrawBWBarKey
bDrawBWBarKey:
	.skip 0x4
.global lastx
lastx:
	.skip 0x4
.global GameDrawInit
GameDrawInit:
	.skip 0x4
.global cseq
cseq:
	.skip 0x4
.global noteFree
noteFree:
	.skip 0x4
.global curSeqId
curSeqId:
	.skip 0x4
.global curFadeOutState
curFadeOutState:
	.skip 0x4
.global seq_next_id
seq_next_id:
	.skip 0x4
.global seqFreeRoot
seqFreeRoot:
	.skip 0x4
.global seqPausedRoot
seqPausedRoot:
	.skip 0x4
.global seqActiveRoot
seqActiveRoot:
	.skip 0x4
.global sndActive_2
sndActive_2:
	.skip 0x1
.global synthJobTableIndex
synthJobTableIndex:
	.skip 0x3
.global synthITDDefault
synthITDDefault:
	.skip 0x8
.global synthAuxBMIDISet
synthAuxBMIDISet:
	.skip 0x4
.global synthAuxBMIDI
synthAuxBMIDI:
	.skip 0x4
.global synthAuxAMIDISet
synthAuxAMIDISet:
	.skip 0x4
.global synthAuxAMIDI
synthAuxAMIDI:
	.skip 0x4
.global synthMasterFaderPauseActiveFlags
synthMasterFaderPauseActiveFlags:
	.skip 0x4
.global synthMasterFaderActiveFlags
synthMasterFaderActiveFlags:
	.skip 0x4
.global synthFlags
synthFlags:
	.skip 0x1
.global lbl_802F261D
lbl_802F261D:
	.skip 0x3
.global synthVoice
synthVoice:
	.skip 0x4
.global synthMessageCallback
synthMessageCallback:
	.skip 0x4
.global synthIdleWaitActive
synthIdleWaitActive:
	.skip 0x8
.global synthRealTime
synthRealTime:
	.skip 0x4
.global lbl_802F2634
lbl_802F2634:
	.skip 0x4
.global streamCallCnt
streamCallCnt:
	.skip 0x1
.global streamCallDelay
streamCallDelay:
	.skip 0x3
.global nextPublicID
nextPublicID:
	.skip 0x4
.global dataSmpSDirNum
dataSmpSDirNum:
	.skip 0x2
.global dataCurveNum
dataCurveNum:
	.skip 0x2
.global dataKeymapNum
dataKeymapNum:
	.skip 0x2
.global dataLayerNum
dataLayerNum:
	.skip 0x2
.global dataMacTotal
dataMacTotal:
	.skip 0x2
.global dataFXGroupNum
dataFXGroupNum:
	.skip 0x2
.global lbl_802F264C
lbl_802F264C:
	.skip 0x4
.global lbl_802F2650
lbl_802F2650:
	.skip 0x4
.global lbl_802F2654
lbl_802F2654:
	.skip 0x8
.global lbl_802F265C
lbl_802F265C:
	.skip 0x4
.global lbl_802F2660
lbl_802F2660:
	.skip 0x4
.global lbl_802F2664
lbl_802F2664:
	.skip 0x4
.global lbl_802F2668
lbl_802F2668:
	.skip 0x8
.global lbl_802F2670
lbl_802F2670:
	.skip 0x4
.global lbl_802F2674
lbl_802F2674:
	.skip 0x8
.global lbl_802F267C
lbl_802F267C:
	.skip 0x4
.global lbl_802F2680
lbl_802F2680:
	.skip 0x8
.global DebugMacroSteps
DebugMacroSteps:
	.skip 0x4
.global macActiveMacroRoot
macActiveMacroRoot:
	.skip 0x4
.global macTimeQueueRoot
macTimeQueueRoot:
	.skip 0x8
.global macRealTime
macRealTime:
	.skip 0x4
.global lbl_802F269C
lbl_802F269C:
	.skip 0x4
.global cstep
cstep:
	.skip 0x8
.global vidCurrentId
vidCurrentId:
	.skip 0x4
.global vidRoot
vidRoot:
	.skip 0x4
.global vidFree
vidFree:
	.skip 0x4
.global voicePrioSortRootListRoot
voicePrioSortRootListRoot:
	.skip 0x2
.global voiceMusicRunning
voiceMusicRunning:
	.skip 0x1
.global voiceFxRunning
voiceFxRunning:
	.skip 0x1
.global voiceListInsert
voiceListInsert:
	.skip 0x1
.global voiceListRoot
voiceListRoot:
	.skip 0x7
.global lbl_802F26C0
lbl_802F26C0:
	.skip 0x8
.global dspARAMZeroBuffer
dspARAMZeroBuffer:
	.skip 0x4
.global dspCmdLastLoad
dspCmdLastLoad:
	.skip 0x4
.global dspCmdLastBase
dspCmdLastBase:
	.skip 0x4
.global dspCmdLastSize
dspCmdLastSize:
	.skip 0x4
.global dspCmdCurBase
dspCmdCurBase:
	.skip 0x4
.global dspCmdMaxPtr
dspCmdMaxPtr:
	.skip 0x4
.global dspCmdPtr
dspCmdPtr:
	.skip 0x4
.global dspCmdFirstSize
dspCmdFirstSize:
	.skip 0x4
.global dspCmdList
dspCmdList:
	.skip 0x4
.global dspHRTFOn
dspHRTFOn:
	.skip 0x4
.global dspHrtfHistoryBuffer
dspHrtfHistoryBuffer:
	.skip 0x4
.global dspSurround
dspSurround:
	.skip 0x4
.global dspITDBuffer
dspITDBuffer:
	.skip 0x4
.global dspVoice
dspVoice:
	.skip 0x4
.global salMessageCallback
salMessageCallback:
	.skip 0x8
.global s3dCallCnt
s3dCallCnt:
	.skip 0x4
.global s3dEmitterRoot
s3dEmitterRoot:
	.skip 0x4
.global s3dListenerRoot
s3dListenerRoot:
	.skip 0x4
.global s3dRoomRoot
s3dRoomRoot:
	.skip 0x4
.global s3dDoorRoot
s3dDoorRoot:
	.skip 0x4
.global snd_used_studios
snd_used_studios:
	.skip 0x4
.global snd_base_studio
snd_base_studio:
	.skip 0x1
.global snd_max_studios
snd_max_studios:
	.skip 0x1
.global startGroupNum
startGroupNum:
	.skip 0x1
.global startListNumnum
startListNumnum:
	.skip 0x1
.global runListNum
runListNum:
	.skip 0x4
.global salTimeOffset
salTimeOffset:
	.skip 0x4
.global salHooks
salHooks:
	.skip 0x4
.global lbl_802F2730
lbl_802F2730:
	.skip 0x4
.global salNumVoices
salNumVoices:
	.skip 0x1
.global salAuxFrame
salAuxFrame:
	.skip 0x1
.global salFrame
salFrame:
	.skip 0x2
.global aramTop
aramTop:
	.skip 0x4
.global aramWrite
aramWrite:
	.skip 0x4
.global aramStream
aramStream:
	.skip 0x4
.global aramQueueWrite
aramQueueWrite:
	.skip 0x1
.global aramQueueValid
aramQueueValid:
	.skip 0x3
.global aramUsedStreamBuffers
aramUsedStreamBuffers:
	.skip 0x4
.global aramFreeStreamBuffers
aramFreeStreamBuffers:
	.skip 0x4
.global aramIdleStreamBuffers
aramIdleStreamBuffers:
	.skip 0x8
.global userCallback
userCallback:
	.skip 0x4
.global salAIBufferBase
salAIBufferBase:
	.skip 0x4
.global salDspIsDone
salDspIsDone:
	.skip 0x4
.global salLogicIsWaiting
salLogicIsWaiting:
	.skip 0x4
.global salLogicActive
salLogicActive:
	.skip 0x4
.global salLastTick
salLastTick:
	.skip 0x4
.global salDspInitIsDone
salDspInitIsDone:
	.skip 0x4
.global hwIrqLevel
hwIrqLevel:
	.skip 0x4
.global oldState
oldState:
	.skip 0x4
.global salAIBufferIndex
salAIBufferIndex:
	.skip 0x4
.global __DTKCurrentTrack
__DTKCurrentTrack:
	.skip 0x4
.global __DTKPlayListHead
__DTKPlayListHead:
	.skip 0x4
.global __DTKPlayListTail
__DTKPlayListTail:
	.skip 0x4
.global __DTKState
__DTKState:
	.skip 0x4
.global __DTKTempState
__DTKTempState:
	.skip 0x4
.global __DTKRepeatMode
__DTKRepeatMode:
	.skip 0x4
.global __DTKPosition
__DTKPosition:
	.skip 0x4
.global __DTKInterruptFrequency
__DTKInterruptFrequency:
	.skip 0x4
.global __DTKVolumeL
__DTKVolumeL:
	.skip 0x1
.global __DTKVolumeR
__DTKVolumeR:
	.skip 0x3
.global __DTKTrackEnded
__DTKTrackEnded:
	.skip 0x4
.global __global_destructor_chain
__global_destructor_chain:
	.skip 0x8
.global __aborting
__aborting:
	.skip 0x4
.global atexit_curr_func
atexit_curr_func:
	.skip 0x4
.global __atexit_curr_func
__atexit_curr_func:
	.skip 0x4
.global __stdio_exit
__stdio_exit:
	.skip 0x4
.global __console_exit
__console_exit:
	.skip 0x8
.global initialized_60
initialized_60:
	.skip 0xC
.global fExi2Selected
fExi2Selected:
	.skip 0x4
.global TRK_Callback
TRK_Callback:
	.skip 0x8
.global MTRCallback
MTRCallback:
	.skip 0x4
.global DBGCallback
DBGCallback:
	.skip 0x4
.global SendMailData
SendMailData:
	.skip 0x4
.global RecvDataLeng
RecvDataLeng:
	.skip 0x4
.global pEXIInputFlag
pEXIInputFlag:
	.skip 0x4
.global EXIInputFlag
EXIInputFlag:
	.skip 0x1
