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

.section .bss, "wa"  # 0x801ED920 - 0x802F27F5

.section .sbss

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
.global currRenderMode
currRenderMode:
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
.global dvdReadBuffer
dvdReadBuffer:
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
.global perfEnabled
perfEnabled:
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
.global loadQueueTail
loadQueueTail:
	.skip 0x4
.global loadQueueHead
loadQueueHead:
	.skip 0x4
.global dvdReadStatus
dvdReadStatus:
	.skip 0x4
.global mramToAramInProgress
mramToAramInProgress:
	.skip 0x4
.global lbl_802F2144
lbl_802F2144:
	.skip 0x4
.global aramToMramInProgress
aramToMramInProgress:
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
.global fontShift
fontShift:
	.skip 0x4
.global lbl_802F21D4
lbl_802F21D4:
	.skip 0x4
.global LastSheet
LastSheet:
	.skip 0x4
.global FontSize
FontSize:
	.skip 0x2
.global FontSpace
FontSpace:
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
