/*
Code sections:
	.text0:	0x00000100	0x80003100	0x800054C0
	.text1:	0x000024C0	0x800065A0	0x8010F860
Data sections:
	.data0:	0x0010B780	0x800054C0	0x80005B80
	.data1:	0x0010BE40	0x80005B80	0x800065A0
	.data2:	0x0010C860	0x8010F860	0x8010F880
	.data3:	0x0010C880	0x8010F880	0x8010F8A0
	.data4:	0x0010C8A0	0x8010F8A0	0x80172380
	.data5:	0x0016F380	0x80172380	0x801ED920
	.data6:	0x001EA920	0x802F01E0	0x802F1AE0
	.data7:	0x001EC220	0x802F2800	0x802F6C80
BSS section:
	.bss:	0x00000000	0x801ED920	0x802F27F5
Entry Point: 0x80003100
*/
# PowerPC Register Constants
.set r0, 0
.set r1, 1
.set r2, 2
.set r3, 3
.set r4, 4
.set r5, 5
.set r6, 6
.set r7, 7
.set r8, 8
.set r9, 9
.set r10, 10
.set r11, 11
.set r12, 12
.set r13, 13
.set r14, 14
.set r15, 15
.set r16, 16
.set r17, 17
.set r18, 18
.set r19, 19
.set r20, 20
.set r21, 21
.set r22, 22
.set r23, 23
.set r24, 24
.set r25, 25
.set r26, 26
.set r27, 27
.set r28, 28
.set r29, 29
.set r30, 30
.set r31, 31
.set f0, 0
.set f1, 1
.set f2, 2
.set f3, 3
.set f4, 4
.set f5, 5
.set f6, 6
.set f7, 7
.set f8, 8
.set f9, 9
.set f10, 10
.set f11, 11
.set f12, 12
.set f13, 13
.set f14, 14
.set f15, 15
.set f16, 16
.set f17, 17
.set f18, 18
.set f19, 19
.set f20, 20
.set f21, 21
.set f22, 22
.set f23, 23
.set f24, 24
.set f25, 25
.set f26, 26
.set f27, 27
.set f28, 28
.set f29, 29
.set f30, 30
.set f31, 31
.set qr0, 0
.set qr1, 1
.set qr2, 2
.set qr3, 3
.set qr4, 4
.set qr5, 5
.set qr6, 6
.set qr7, 7
# Small Data Area (read only) Base
.set _SDA2_BASE_, 0x802FA800

.macro glabel name
    .global \name
    \name:
.endm
