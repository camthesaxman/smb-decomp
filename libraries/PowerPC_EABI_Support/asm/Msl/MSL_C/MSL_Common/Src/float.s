
.section .data

.global __float_nan
__float_nan:
	# ROM: 0x1EA2F8
	.4byte 0x7FFFFFFF

.global __float_huge
__float_huge:
	# ROM: 0x1EA2FC
	.4byte 0x7F800000
