.section _extab, "wa"  # 0x800054C0 - 0x80005B80
	.incbin "baserom.dol", 0x10B780, 0x6C0

.section _extabindex, "wa"  # 0x80005B80 - 0x800065A0
	.incbin "baserom.dol", 0x10BE40, 0x9FC
.global TODO_eti_init_info
TODO_eti_init_info:
	.incbin "baserom.dol", 0x10C83C, 0x24

.section .ctors, "wa"  # 0x8010F860 - 0x8010F880
.global __init_cpp_exceptions_reference
__init_cpp_exceptions_reference:
	.incbin "baserom.dol", 0x10C860, 0x20

.section .dtors, "wa"  # 0x8010F880 - 0x8010F8A0
.global lbl_8010F880
lbl_8010F880:
	.incbin "baserom.dol", 0x10C880, 0x20
