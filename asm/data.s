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
