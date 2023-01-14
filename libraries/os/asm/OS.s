.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global OSGetConsoleType
OSGetConsoleType:
/* 800C17AC 000BD6CC  80 6D A0 F0 */	lwz r3, BootInfo@sda21(r13)
/* 800C17B0 000BD6D0  28 03 00 00 */	cmplwi r3, 0
/* 800C17B4 000BD6D4  41 82 00 10 */	beq lbl_800C17C4
/* 800C17B8 000BD6D8  80 63 00 2C */	lwz r3, 0x2c(r3)
/* 800C17BC 000BD6DC  28 03 00 00 */	cmplwi r3, 0
/* 800C17C0 000BD6E0  40 82 00 10 */	bne lbl_800C17D0
lbl_800C17C4:
/* 800C17C4 000BD6E4  3C 60 10 00 */	lis r3, 0x10000002@ha
/* 800C17C8 000BD6E8  38 63 00 02 */	addi r3, r3, 0x10000002@l
/* 800C17CC 000BD6EC  48 00 00 04 */	b lbl_800C17D0
lbl_800C17D0:
/* 800C17D0 000BD6F0  4E 80 00 20 */	blr

.global OSInit
OSInit:
/* 800C17D4 000BD6F4  7C 08 02 A6 */	mflr r0
/* 800C17D8 000BD6F8  90 01 00 04 */	stw r0, 4(r1)
/* 800C17DC 000BD6FC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800C17E0 000BD700  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800C17E4 000BD704  93 C1 00 08 */	stw r30, 8(r1)
/* 800C17E8 000BD708  80 0D A0 F8 */	lwz r0, AreWeInitialized@sda21(r13)
/* 800C17EC 000BD70C  3C 60 80 1E */	lis r3, lbl_801E5CF0@ha
/* 800C17F0 000BD710  3B E3 5C F0 */	addi r31, r3, lbl_801E5CF0@l
/* 800C17F4 000BD714  2C 00 00 00 */	cmpwi r0, 0
/* 800C17F8 000BD718  40 82 02 A0 */	bne lbl_800C1A98
/* 800C17FC 000BD71C  38 00 00 01 */	li r0, 1
/* 800C1800 000BD720  90 0D A0 F8 */	stw r0, AreWeInitialized@sda21(r13)
/* 800C1804 000BD724  48 00 48 B9 */	bl OSDisableInterrupts
/* 800C1808 000BD728  38 00 00 00 */	li r0, 0
/* 800C180C 000BD72C  3C 60 80 00 */	lis r3, 0x800000F4@ha
/* 800C1810 000BD730  90 0D A0 F4 */	stw r0, BI2DebugFlag@sda21(r13)
/* 800C1814 000BD734  90 6D A0 F0 */	stw r3, BootInfo@sda21(r13)
/* 800C1818 000BD738  90 0D A1 E4 */	stw r0, __DVDLongFileNameFlag@sda21(r13)
/* 800C181C 000BD73C  80 63 00 F4 */	lwz r3, 0x800000F4@l(r3)
/* 800C1820 000BD740  28 03 00 00 */	cmplwi r3, 0
/* 800C1824 000BD744  41 82 00 1C */	beq lbl_800C1840
/* 800C1828 000BD748  38 03 00 0C */	addi r0, r3, 0xc
/* 800C182C 000BD74C  90 0D A0 F4 */	stw r0, BI2DebugFlag@sda21(r13)
/* 800C1830 000BD750  80 03 00 20 */	lwz r0, 0x20(r3)
/* 800C1834 000BD754  90 0D A1 E4 */	stw r0, __DVDLongFileNameFlag@sda21(r13)
/* 800C1838 000BD758  80 03 00 24 */	lwz r0, 0x24(r3)
/* 800C183C 000BD75C  90 0D A2 AC */	stw r0, __PADSpec@sda21(r13)
lbl_800C1840:
/* 800C1840 000BD760  3C 60 80 00 */	lis r3, 0x80000030@ha
/* 800C1844 000BD764  80 63 00 30 */	lwz r3, 0x80000030@l(r3)
/* 800C1848 000BD768  28 03 00 00 */	cmplwi r3, 0
/* 800C184C 000BD76C  40 82 00 10 */	bne lbl_800C185C
/* 800C1850 000BD770  3C 60 80 31 */	lis r3, __ArenaLo@ha
/* 800C1854 000BD774  38 63 8C 80 */	addi r3, r3, __ArenaLo@l
/* 800C1858 000BD778  48 00 00 04 */	b lbl_800C185C
lbl_800C185C:
/* 800C185C 000BD77C  48 00 14 4D */	bl OSSetArenaLo
/* 800C1860 000BD780  80 6D A0 F0 */	lwz r3, BootInfo@sda21(r13)
/* 800C1864 000BD784  80 03 00 30 */	lwz r0, 0x30(r3)
/* 800C1868 000BD788  28 00 00 00 */	cmplwi r0, 0
/* 800C186C 000BD78C  40 82 00 30 */	bne lbl_800C189C
/* 800C1870 000BD790  80 6D A0 F4 */	lwz r3, BI2DebugFlag@sda21(r13)
/* 800C1874 000BD794  28 03 00 00 */	cmplwi r3, 0
/* 800C1878 000BD798  41 82 00 24 */	beq lbl_800C189C
/* 800C187C 000BD79C  80 03 00 00 */	lwz r0, 0(r3)
/* 800C1880 000BD7A0  28 00 00 02 */	cmplwi r0, 2
/* 800C1884 000BD7A4  40 80 00 18 */	bge lbl_800C189C
/* 800C1888 000BD7A8  3C 60 80 30 */	lis r3, _stack_addr@ha
/* 800C188C 000BD7AC  38 63 6C 80 */	addi r3, r3, _stack_addr@l
/* 800C1890 000BD7B0  38 03 00 1F */	addi r0, r3, 0x1f
/* 800C1894 000BD7B4  54 03 00 34 */	rlwinm r3, r0, 0, 0, 0x1a
/* 800C1898 000BD7B8  48 00 14 11 */	bl OSSetArenaLo
lbl_800C189C:
/* 800C189C 000BD7BC  80 6D A0 F0 */	lwz r3, BootInfo@sda21(r13)
/* 800C18A0 000BD7C0  80 63 00 34 */	lwz r3, 0x34(r3)
/* 800C18A4 000BD7C4  28 03 00 00 */	cmplwi r3, 0
/* 800C18A8 000BD7C8  40 82 00 10 */	bne lbl_800C18B8
/* 800C18AC 000BD7CC  3C 60 81 70 */	lis r3, __ArenaHi@ha
/* 800C18B0 000BD7D0  38 63 00 00 */	addi r3, r3, __ArenaHi@l
/* 800C18B4 000BD7D4  48 00 00 04 */	b lbl_800C18B8
lbl_800C18B8:
/* 800C18B8 000BD7D8  48 00 13 E9 */	bl OSSetArenaHi
/* 800C18BC 000BD7DC  48 00 01 F5 */	bl OSExceptionInit
/* 800C18C0 000BD7E0  48 00 72 5D */	bl __OSInitSystemCall
/* 800C18C4 000BD7E4  48 00 57 41 */	bl __OSModuleInit
/* 800C18C8 000BD7E8  48 00 48 71 */	bl __OSInterruptInit
/* 800C18CC 000BD7EC  3C 60 80 0C */	lis r3, __OSResetSWInterruptHandler@ha
/* 800C18D0 000BD7F0  38 83 75 88 */	addi r4, r3, __OSResetSWInterruptHandler@l
/* 800C18D4 000BD7F4  38 60 00 16 */	li r3, 0x16
/* 800C18D8 000BD7F8  48 00 48 31 */	bl __OSSetInterruptHandler
/* 800C18DC 000BD7FC  48 00 22 FD */	bl __OSContextInit
/* 800C18E0 000BD800  48 00 1A A1 */	bl __OSCacheInit
/* 800C18E4 000BD804  48 00 36 E5 */	bl EXIInit
/* 800C18E8 000BD808  48 00 6C 11 */	bl SIInit
/* 800C18EC 000BD80C  48 00 60 FD */	bl __OSInitSram
/* 800C18F0 000BD810  48 00 72 91 */	bl __OSThreadInit
/* 800C18F4 000BD814  48 00 13 BD */	bl __OSInitAudioSystem
/* 800C18F8 000BD818  80 6D A0 F0 */	lwz r3, BootInfo@sda21(r13)
/* 800C18FC 000BD81C  38 83 00 2C */	addi r4, r3, 0x2c
/* 800C1900 000BD820  80 04 00 00 */	lwz r0, 0(r4)
/* 800C1904 000BD824  54 00 00 C6 */	rlwinm r0, r0, 0, 3, 3
/* 800C1908 000BD828  28 00 00 00 */	cmplwi r0, 0
/* 800C190C 000BD82C  41 82 00 14 */	beq lbl_800C1920
/* 800C1910 000BD830  3C 60 10 00 */	lis r3, 0x10000004@ha
/* 800C1914 000BD834  38 03 00 04 */	addi r0, r3, 0x10000004@l
/* 800C1918 000BD838  90 04 00 00 */	stw r0, 0(r4)
/* 800C191C 000BD83C  48 00 00 0C */	b lbl_800C1928
lbl_800C1920:
/* 800C1920 000BD840  38 00 00 01 */	li r0, 1
/* 800C1924 000BD844  90 04 00 00 */	stw r0, 0(r4)
lbl_800C1928:
/* 800C1928 000BD848  3C 60 CC 00 */	lis r3, 0xCC003000@ha
/* 800C192C 000BD84C  80 AD A0 F0 */	lwz r5, BootInfo@sda21(r13)
/* 800C1930 000BD850  38 63 30 00 */	addi r3, r3, 0xCC003000@l
/* 800C1934 000BD854  4C C6 31 82 */	crclr 6
/* 800C1938 000BD858  80 03 00 2C */	lwz r0, 0x2c(r3)
/* 800C193C 000BD85C  7F E3 FB 78 */	mr r3, r31
/* 800C1940 000BD860  80 85 00 2C */	lwz r4, 0x2c(r5)
/* 800C1944 000BD864  54 00 00 06 */	rlwinm r0, r0, 0, 0, 3
/* 800C1948 000BD868  54 00 27 3E */	srwi r0, r0, 0x1c
/* 800C194C 000BD86C  7C 04 02 14 */	add r0, r4, r0
/* 800C1950 000BD870  90 05 00 2C */	stw r0, 0x2c(r5)
/* 800C1954 000BD874  48 00 22 CD */	bl OSReport
/* 800C1958 000BD878  38 7F 00 20 */	addi r3, r31, 0x20
/* 800C195C 000BD87C  4C C6 31 82 */	crclr 6
/* 800C1960 000BD880  38 9F 00 38 */	addi r4, r31, 0x38
/* 800C1964 000BD884  38 BF 00 44 */	addi r5, r31, 0x44
/* 800C1968 000BD888  48 00 22 B9 */	bl OSReport
/* 800C196C 000BD88C  38 7F 00 50 */	addi r3, r31, 0x50
/* 800C1970 000BD890  4C C6 31 82 */	crclr 6
/* 800C1974 000BD894  48 00 22 AD */	bl OSReport
/* 800C1978 000BD898  80 6D A0 F0 */	lwz r3, BootInfo@sda21(r13)
/* 800C197C 000BD89C  28 03 00 00 */	cmplwi r3, 0
/* 800C1980 000BD8A0  41 82 00 10 */	beq lbl_800C1990
/* 800C1984 000BD8A4  80 83 00 2C */	lwz r4, 0x2c(r3)
/* 800C1988 000BD8A8  28 04 00 00 */	cmplwi r4, 0
/* 800C198C 000BD8AC  40 82 00 10 */	bne lbl_800C199C
lbl_800C1990:
/* 800C1990 000BD8B0  3C 60 10 00 */	lis r3, 0x10000002@ha
/* 800C1994 000BD8B4  38 83 00 02 */	addi r4, r3, 0x10000002@l
/* 800C1998 000BD8B8  48 00 00 04 */	b lbl_800C199C
lbl_800C199C:
/* 800C199C 000BD8BC  54 80 00 C6 */	rlwinm r0, r4, 0, 3, 3
/* 800C19A0 000BD8C0  28 00 00 00 */	cmplwi r0, 0
/* 800C19A4 000BD8C4  40 82 00 14 */	bne lbl_800C19B8
/* 800C19A8 000BD8C8  4C C6 31 82 */	crclr 6
/* 800C19AC 000BD8CC  38 7F 00 60 */	addi r3, r31, 0x60
/* 800C19B0 000BD8D0  48 00 22 71 */	bl OSReport
/* 800C19B4 000BD8D4  48 00 00 8C */	b lbl_800C1A40
lbl_800C19B8:
/* 800C19B8 000BD8D8  3C 60 10 00 */	lis r3, 0x10000002@ha
/* 800C19BC 000BD8DC  38 03 00 02 */	addi r0, r3, 0x10000002@l
/* 800C19C0 000BD8E0  7C 04 00 00 */	cmpw r4, r0
/* 800C19C4 000BD8E4  41 82 00 48 */	beq lbl_800C1A0C
/* 800C19C8 000BD8E8  40 80 00 14 */	bge lbl_800C19DC
/* 800C19CC 000BD8EC  7C 04 18 00 */	cmpw r4, r3
/* 800C19D0 000BD8F0  41 82 00 1C */	beq lbl_800C19EC
/* 800C19D4 000BD8F4  40 80 00 28 */	bge lbl_800C19FC
/* 800C19D8 000BD8F8  48 00 00 54 */	b lbl_800C1A2C
lbl_800C19DC:
/* 800C19DC 000BD8FC  38 03 00 04 */	addi r0, r3, 4
/* 800C19E0 000BD900  7C 04 00 00 */	cmpw r4, r0
/* 800C19E4 000BD904  40 80 00 48 */	bge lbl_800C1A2C
/* 800C19E8 000BD908  48 00 00 34 */	b lbl_800C1A1C
lbl_800C19EC:
/* 800C19EC 000BD90C  38 7F 00 6C */	addi r3, r31, 0x6c
/* 800C19F0 000BD910  4C C6 31 82 */	crclr 6
/* 800C19F4 000BD914  48 00 22 2D */	bl OSReport
/* 800C19F8 000BD918  48 00 00 48 */	b lbl_800C1A40
lbl_800C19FC:
/* 800C19FC 000BD91C  38 7F 00 7C */	addi r3, r31, 0x7c
/* 800C1A00 000BD920  4C C6 31 82 */	crclr 6
/* 800C1A04 000BD924  48 00 22 1D */	bl OSReport
/* 800C1A08 000BD928  48 00 00 38 */	b lbl_800C1A40
lbl_800C1A0C:
/* 800C1A0C 000BD92C  38 7F 00 8C */	addi r3, r31, 0x8c
/* 800C1A10 000BD930  4C C6 31 82 */	crclr 6
/* 800C1A14 000BD934  48 00 22 0D */	bl OSReport
/* 800C1A18 000BD938  48 00 00 28 */	b lbl_800C1A40
lbl_800C1A1C:
/* 800C1A1C 000BD93C  38 7F 00 9C */	addi r3, r31, 0x9c
/* 800C1A20 000BD940  4C C6 31 82 */	crclr 6
/* 800C1A24 000BD944  48 00 21 FD */	bl OSReport
/* 800C1A28 000BD948  48 00 00 18 */	b lbl_800C1A40
lbl_800C1A2C:
/* 800C1A2C 000BD94C  3C 84 F0 00 */	addis r4, r4, 0xf000
/* 800C1A30 000BD950  4C C6 31 82 */	crclr 6
/* 800C1A34 000BD954  38 7F 00 AC */	addi r3, r31, 0xac
/* 800C1A38 000BD958  38 84 FF FD */	addi r4, r4, -3
/* 800C1A3C 000BD95C  48 00 21 E5 */	bl OSReport
lbl_800C1A40:
/* 800C1A40 000BD960  80 8D A0 F0 */	lwz r4, BootInfo@sda21(r13)
/* 800C1A44 000BD964  38 7F 00 C0 */	addi r3, r31, 0xc0
/* 800C1A48 000BD968  4C C6 31 82 */	crclr 6
/* 800C1A4C 000BD96C  80 04 00 28 */	lwz r0, 0x28(r4)
/* 800C1A50 000BD970  54 04 65 3E */	srwi r4, r0, 0x14
/* 800C1A54 000BD974  48 00 21 CD */	bl OSReport
/* 800C1A58 000BD978  48 00 12 39 */	bl OSGetArenaHi
/* 800C1A5C 000BD97C  7C 7E 1B 78 */	mr r30, r3
/* 800C1A60 000BD980  48 00 12 39 */	bl OSGetArenaLo
/* 800C1A64 000BD984  7C 64 1B 78 */	mr r4, r3
/* 800C1A68 000BD988  4C C6 31 82 */	crclr 6
/* 800C1A6C 000BD98C  7F C5 F3 78 */	mr r5, r30
/* 800C1A70 000BD990  38 7F 00 D0 */	addi r3, r31, 0xd0
/* 800C1A74 000BD994  48 00 21 AD */	bl OSReport
/* 800C1A78 000BD998  80 6D A0 F4 */	lwz r3, BI2DebugFlag@sda21(r13)
/* 800C1A7C 000BD99C  28 03 00 00 */	cmplwi r3, 0
/* 800C1A80 000BD9A0  41 82 00 14 */	beq lbl_800C1A94
/* 800C1A84 000BD9A4  80 03 00 00 */	lwz r0, 0(r3)
/* 800C1A88 000BD9A8  28 00 00 02 */	cmplwi r0, 2
/* 800C1A8C 000BD9AC  41 80 00 08 */	blt lbl_800C1A94
/* 800C1A90 000BD9B0  48 04 BD AD */	bl EnableMetroTRKInterrupts
lbl_800C1A94:
/* 800C1A94 000BD9B4  48 00 46 3D */	bl OSEnableInterrupts
lbl_800C1A98:
/* 800C1A98 000BD9B8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800C1A9C 000BD9BC  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800C1AA0 000BD9C0  83 C1 00 08 */	lwz r30, 8(r1)
/* 800C1AA4 000BD9C4  7C 08 03 A6 */	mtlr r0
/* 800C1AA8 000BD9C8  38 21 00 10 */	addi r1, r1, 0x10
/* 800C1AAC 000BD9CC  4E 80 00 20 */	blr

.global OSExceptionInit
OSExceptionInit:
/* 800C1AB0 000BD9D0  7C 08 02 A6 */	mflr r0
/* 800C1AB4 000BD9D4  90 01 00 04 */	stw r0, 4(r1)
/* 800C1AB8 000BD9D8  94 21 FF C8 */	stwu r1, -0x38(r1)
/* 800C1ABC 000BD9DC  BE 81 00 08 */	stmw r20, 8(r1)
/* 800C1AC0 000BD9E0  3C 60 80 00 */	lis r3, 0x80000060@ha
/* 800C1AC4 000BD9E4  80 03 00 60 */	lwz r0, 0x80000060@l(r3)
/* 800C1AC8 000BD9E8  3C 80 80 0C */	lis r4, lbl_800C1DF0@ha
/* 800C1ACC 000BD9EC  3B C4 1D F0 */	addi r30, r4, lbl_800C1DF0@l
/* 800C1AD0 000BD9F0  3C A0 80 0C */	lis r5, __OSEVStart@ha
/* 800C1AD4 000BD9F4  83 3E 00 00 */	lwz r25, 0(r30)
/* 800C1AD8 000BD9F8  3C 80 80 0C */	lis r4, __OSEVEnd@ha
/* 800C1ADC 000BD9FC  38 A5 1D 88 */	addi r5, r5, __OSEVStart@l
/* 800C1AE0 000BDA00  38 84 1E 20 */	addi r4, r4, __OSEVEnd@l
/* 800C1AE4 000BDA04  3C C0 80 1E */	lis r6, lbl_801E5CF0@ha
/* 800C1AE8 000BDA08  28 00 00 00 */	cmplwi r0, 0
/* 800C1AEC 000BDA0C  7C B8 2B 78 */	mr r24, r5
/* 800C1AF0 000BDA10  3B A6 5C F0 */	addi r29, r6, lbl_801E5CF0@l
/* 800C1AF4 000BDA14  7E E5 20 50 */	subf r23, r5, r4
/* 800C1AF8 000BDA18  3A 83 00 60 */	addi r20, r3, 0x60
/* 800C1AFC 000BDA1C  40 82 00 4C */	bne lbl_800C1B48
/* 800C1B00 000BDA20  38 7D 01 24 */	addi r3, r29, 0x124
/* 800C1B04 000BDA24  4C C6 31 82 */	crclr 6
/* 800C1B08 000BDA28  48 00 86 19 */	bl DBPrintf
/* 800C1B0C 000BDA2C  3C 80 80 0C */	lis r4, __OSDBINITSTART@ha
/* 800C1B10 000BDA30  3C 60 80 0C */	lis r3, __OSDBJUMPSTART@ha
/* 800C1B14 000BDA34  38 03 1D 54 */	addi r0, r3, __OSDBJUMPSTART@l
/* 800C1B18 000BDA38  38 84 1D 30 */	addi r4, r4, __OSDBINITSTART@l
/* 800C1B1C 000BDA3C  7E A4 00 50 */	subf r21, r4, r0
/* 800C1B20 000BDA40  7E 83 A3 78 */	mr r3, r20
/* 800C1B24 000BDA44  7E A5 AB 78 */	mr r5, r21
/* 800C1B28 000BDA48  4B F4 18 ED */	bl memcpy
/* 800C1B2C 000BDA4C  7E 83 A3 78 */	mr r3, r20
/* 800C1B30 000BDA50  7E A4 AB 78 */	mr r4, r21
/* 800C1B34 000BDA54  48 00 14 95 */	bl DCFlushRangeNoSync
/* 800C1B38 000BDA58  7C 00 04 AC */	sync 0
/* 800C1B3C 000BDA5C  7E 83 A3 78 */	mr r3, r20
/* 800C1B40 000BDA60  7E A4 AB 78 */	mr r4, r21
/* 800C1B44 000BDA64  48 00 14 E5 */	bl ICInvalidateRange
lbl_800C1B48:
/* 800C1B48 000BDA68  3C 80 80 0C */	lis r4, __OSDBJUMPSTART@ha
/* 800C1B4C 000BDA6C  3C 60 80 0C */	lis r3, __OSDBJUMPEND@ha
/* 800C1B50 000BDA70  3B E4 1D 54 */	addi r31, r4, __OSDBJUMPSTART@l
/* 800C1B54 000BDA74  38 03 1D 58 */	addi r0, r3, __OSDBJUMPEND@l
/* 800C1B58 000BDA78  3B 9D 00 E8 */	addi r28, r29, 0xe8
/* 800C1B5C 000BDA7C  7F 7F 00 50 */	subf r27, r31, r0
/* 800C1B60 000BDA80  3B 40 00 00 */	li r26, 0
/* 800C1B64 000BDA84  48 00 00 04 */	b lbl_800C1B68
lbl_800C1B68:
/* 800C1B68 000BDA88  3C 60 80 0C */	lis r3, lbl_800C1DE0@ha
/* 800C1B6C 000BDA8C  3A A3 1D E0 */	addi r21, r3, lbl_800C1DE0@l
/* 800C1B70 000BDA90  3E C0 60 00 */	lis r22, 0x6000
/* 800C1B74 000BDA94  48 00 00 04 */	b lbl_800C1B78
lbl_800C1B78:
/* 800C1B78 000BDA98  48 00 01 48 */	b lbl_800C1CC0
lbl_800C1B7C:
/* 800C1B7C 000BDA9C  80 6D A0 F4 */	lwz r3, BI2DebugFlag@sda21(r13)
/* 800C1B80 000BDAA0  28 03 00 00 */	cmplwi r3, 0
/* 800C1B84 000BDAA4  41 82 00 34 */	beq lbl_800C1BB8
/* 800C1B88 000BDAA8  80 03 00 00 */	lwz r0, 0(r3)
/* 800C1B8C 000BDAAC  28 00 00 02 */	cmplwi r0, 2
/* 800C1B90 000BDAB0  41 80 00 28 */	blt lbl_800C1BB8
/* 800C1B94 000BDAB4  7F 43 D3 78 */	mr r3, r26
/* 800C1B98 000BDAB8  48 00 85 6D */	bl __DBIsExceptionMarked
/* 800C1B9C 000BDABC  2C 03 00 00 */	cmpwi r3, 0
/* 800C1BA0 000BDAC0  41 82 00 18 */	beq lbl_800C1BB8
/* 800C1BA4 000BDAC4  38 7D 01 40 */	addi r3, r29, 0x140
/* 800C1BA8 000BDAC8  4C C6 31 82 */	crclr 6
/* 800C1BAC 000BDACC  57 44 06 3E */	clrlwi r4, r26, 0x18
/* 800C1BB0 000BDAD0  48 00 85 71 */	bl DBPrintf
/* 800C1BB4 000BDAD4  48 00 01 04 */	b lbl_800C1CB8
lbl_800C1BB8:
/* 800C1BB8 000BDAD8  57 54 06 3E */	clrlwi r20, r26, 0x18
/* 800C1BBC 000BDADC  7F 20 A3 78 */	or r0, r25, r20
/* 800C1BC0 000BDAE0  90 1E 00 00 */	stw r0, 0(r30)
/* 800C1BC4 000BDAE4  7F 43 D3 78 */	mr r3, r26
/* 800C1BC8 000BDAE8  48 00 85 3D */	bl __DBIsExceptionMarked
/* 800C1BCC 000BDAEC  2C 03 00 00 */	cmpwi r3, 0
/* 800C1BD0 000BDAF0  41 82 00 28 */	beq lbl_800C1BF8
/* 800C1BD4 000BDAF4  7E 84 A3 78 */	mr r4, r20
/* 800C1BD8 000BDAF8  4C C6 31 82 */	crclr 6
/* 800C1BDC 000BDAFC  38 7D 01 70 */	addi r3, r29, 0x170
/* 800C1BE0 000BDB00  48 00 85 41 */	bl DBPrintf
/* 800C1BE4 000BDB04  7E A3 AB 78 */	mr r3, r21
/* 800C1BE8 000BDB08  7F E4 FB 78 */	mr r4, r31
/* 800C1BEC 000BDB0C  7F 65 DB 78 */	mr r5, r27
/* 800C1BF0 000BDB10  4B F4 18 25 */	bl memcpy
/* 800C1BF4 000BDB14  48 00 00 90 */	b lbl_800C1C84
lbl_800C1BF8:
/* 800C1BF8 000BDB18  7E A4 AB 78 */	mr r4, r21
/* 800C1BFC 000BDB1C  48 00 00 04 */	b lbl_800C1C00
lbl_800C1C00:
/* 800C1C00 000BDB20  28 1B 00 00 */	cmplwi r27, 0
/* 800C1C04 000BDB24  38 7B 00 03 */	addi r3, r27, 3
/* 800C1C08 000BDB28  54 63 F0 BE */	srwi r3, r3, 2
/* 800C1C0C 000BDB2C  40 81 00 78 */	ble lbl_800C1C84
/* 800C1C10 000BDB30  54 60 E8 FE */	srwi r0, r3, 3
/* 800C1C14 000BDB34  28 00 00 00 */	cmplwi r0, 0
/* 800C1C18 000BDB38  7C 09 03 A6 */	mtctr r0
/* 800C1C1C 000BDB3C  41 82 00 54 */	beq lbl_800C1C70
/* 800C1C20 000BDB40  48 00 00 04 */	b lbl_800C1C24
lbl_800C1C24:
/* 800C1C24 000BDB44  92 C4 00 00 */	stw r22, 0(r4)
/* 800C1C28 000BDB48  38 84 00 04 */	addi r4, r4, 4
/* 800C1C2C 000BDB4C  92 C4 00 00 */	stw r22, 0(r4)
/* 800C1C30 000BDB50  38 84 00 04 */	addi r4, r4, 4
/* 800C1C34 000BDB54  92 C4 00 00 */	stw r22, 0(r4)
/* 800C1C38 000BDB58  38 84 00 04 */	addi r4, r4, 4
/* 800C1C3C 000BDB5C  92 C4 00 00 */	stw r22, 0(r4)
/* 800C1C40 000BDB60  38 84 00 04 */	addi r4, r4, 4
/* 800C1C44 000BDB64  92 C4 00 00 */	stw r22, 0(r4)
/* 800C1C48 000BDB68  38 84 00 04 */	addi r4, r4, 4
/* 800C1C4C 000BDB6C  92 C4 00 00 */	stw r22, 0(r4)
/* 800C1C50 000BDB70  38 84 00 04 */	addi r4, r4, 4
/* 800C1C54 000BDB74  92 C4 00 00 */	stw r22, 0(r4)
/* 800C1C58 000BDB78  38 84 00 04 */	addi r4, r4, 4
/* 800C1C5C 000BDB7C  92 C4 00 00 */	stw r22, 0(r4)
/* 800C1C60 000BDB80  38 84 00 04 */	addi r4, r4, 4
/* 800C1C64 000BDB84  42 00 FF C0 */	bdnz lbl_800C1C24
/* 800C1C68 000BDB88  70 63 00 07 */	andi. r3, r3, 7
/* 800C1C6C 000BDB8C  41 82 00 18 */	beq lbl_800C1C84
lbl_800C1C70:
/* 800C1C70 000BDB90  7C 69 03 A6 */	mtctr r3
/* 800C1C74 000BDB94  48 00 00 04 */	b lbl_800C1C78
lbl_800C1C78:
/* 800C1C78 000BDB98  92 C4 00 00 */	stw r22, 0(r4)
/* 800C1C7C 000BDB9C  38 84 00 04 */	addi r4, r4, 4
/* 800C1C80 000BDBA0  42 00 FF F8 */	bdnz lbl_800C1C78
lbl_800C1C84:
/* 800C1C84 000BDBA4  80 7C 00 00 */	lwz r3, 0(r28)
/* 800C1C88 000BDBA8  7F 04 C3 78 */	mr r4, r24
/* 800C1C8C 000BDBAC  7E E5 BB 78 */	mr r5, r23
/* 800C1C90 000BDBB0  3E 83 80 00 */	addis r20, r3, 0x8000
/* 800C1C94 000BDBB4  7E 83 A3 78 */	mr r3, r20
/* 800C1C98 000BDBB8  4B F4 17 7D */	bl memcpy
/* 800C1C9C 000BDBBC  7E 83 A3 78 */	mr r3, r20
/* 800C1CA0 000BDBC0  7E E4 BB 78 */	mr r4, r23
/* 800C1CA4 000BDBC4  48 00 13 25 */	bl DCFlushRangeNoSync
/* 800C1CA8 000BDBC8  7C 00 04 AC */	sync 0
/* 800C1CAC 000BDBCC  7E 83 A3 78 */	mr r3, r20
/* 800C1CB0 000BDBD0  7E E4 BB 78 */	mr r4, r23
/* 800C1CB4 000BDBD4  48 00 13 75 */	bl ICInvalidateRange
lbl_800C1CB8:
/* 800C1CB8 000BDBD8  3B 9C 00 04 */	addi r28, r28, 4
/* 800C1CBC 000BDBDC  3B 5A 00 01 */	addi r26, r26, 1
lbl_800C1CC0:
/* 800C1CC0 000BDBE0  57 40 06 3E */	clrlwi r0, r26, 0x18
/* 800C1CC4 000BDBE4  28 00 00 0F */	cmplwi r0, 0xf
/* 800C1CC8 000BDBE8  41 80 FE B4 */	blt lbl_800C1B7C
/* 800C1CCC 000BDBEC  3C 60 80 00 */	lis r3, 0x80003000@ha
/* 800C1CD0 000BDBF0  38 03 30 00 */	addi r0, r3, 0x80003000@l
/* 800C1CD4 000BDBF4  90 0D A0 FC */	stw r0, OSExceptionTable@sda21(r13)
/* 800C1CD8 000BDBF8  3A 80 00 00 */	li r20, 0
/* 800C1CDC 000BDBFC  48 00 00 04 */	b lbl_800C1CE0
lbl_800C1CE0:
/* 800C1CE0 000BDC00  3C 60 80 0C */	lis r3, OSDefaultExceptionHandler@ha
/* 800C1CE4 000BDC04  3A E3 1E 24 */	addi r23, r3, OSDefaultExceptionHandler@l
/* 800C1CE8 000BDC08  48 00 00 04 */	b lbl_800C1CEC
lbl_800C1CEC:
/* 800C1CEC 000BDC0C  48 00 00 14 */	b lbl_800C1D00
lbl_800C1CF0:
/* 800C1CF0 000BDC10  7E 83 A3 78 */	mr r3, r20
/* 800C1CF4 000BDC14  7E E4 BB 78 */	mr r4, r23
/* 800C1CF8 000BDC18  48 00 00 61 */	bl __OSSetExceptionHandler
/* 800C1CFC 000BDC1C  3A 94 00 01 */	addi r20, r20, 1
lbl_800C1D00:
/* 800C1D00 000BDC20  56 80 06 3E */	clrlwi r0, r20, 0x18
/* 800C1D04 000BDC24  28 00 00 0F */	cmplwi r0, 0xf
/* 800C1D08 000BDC28  41 80 FF E8 */	blt lbl_800C1CF0
/* 800C1D0C 000BDC2C  93 3E 00 00 */	stw r25, 0(r30)
/* 800C1D10 000BDC30  38 7D 01 A0 */	addi r3, r29, 0x1a0
/* 800C1D14 000BDC34  4C C6 31 82 */	crclr 6
/* 800C1D18 000BDC38  48 00 84 09 */	bl DBPrintf
/* 800C1D1C 000BDC3C  BA 81 00 08 */	lmw r20, 8(r1)
/* 800C1D20 000BDC40  80 01 00 3C */	lwz r0, 0x3c(r1)
/* 800C1D24 000BDC44  38 21 00 38 */	addi r1, r1, 0x38
/* 800C1D28 000BDC48  7C 08 03 A6 */	mtlr r0
/* 800C1D2C 000BDC4C  4E 80 00 20 */	blr

.global __OSDBINITSTART
__OSDBINITSTART:
/* 800C1D30 000BDC50  38 A0 00 40 */	li r5, 0x40
/* 800C1D34 000BDC54  7C 68 02 A6 */	mflr r3
/* 800C1D38 000BDC58  90 65 00 0C */	stw r3, 0xc(r5)
/* 800C1D3C 000BDC5C  80 65 00 08 */	lwz r3, 8(r5)
/* 800C1D40 000BDC60  64 63 80 00 */	oris r3, r3, 0x8000
/* 800C1D44 000BDC64  7C 68 03 A6 */	mtlr r3
/* 800C1D48 000BDC68  38 60 00 30 */	li r3, 0x30
/* 800C1D4C 000BDC6C  7C 60 01 24 */	mtmsr r3
/* 800C1D50 000BDC70  4E 80 00 20 */	blr

.global __OSDBJUMPSTART
__OSDBJUMPSTART:
/* 800C1D54 000BDC74  48 00 00 63 */	bla 0x60
__OSDBJUMPEND:

.global __OSSetExceptionHandler
__OSSetExceptionHandler:
/* 800C1D58 000BDC78  54 60 06 3E */	clrlwi r0, r3, 0x18
/* 800C1D5C 000BDC7C  80 6D A0 FC */	lwz r3, OSExceptionTable@sda21(r13)
/* 800C1D60 000BDC80  54 00 10 3A */	slwi r0, r0, 2
/* 800C1D64 000BDC84  7C A3 02 14 */	add r5, r3, r0
/* 800C1D68 000BDC88  80 65 00 00 */	lwz r3, 0(r5)
/* 800C1D6C 000BDC8C  90 85 00 00 */	stw r4, 0(r5)
/* 800C1D70 000BDC90  4E 80 00 20 */	blr

.global __OSGetExceptionHandler
__OSGetExceptionHandler:
/* 800C1D74 000BDC94  54 60 06 3E */	clrlwi r0, r3, 0x18
/* 800C1D78 000BDC98  80 6D A0 FC */	lwz r3, OSExceptionTable@sda21(r13)
/* 800C1D7C 000BDC9C  54 00 10 3A */	slwi r0, r0, 2
/* 800C1D80 000BDCA0  7C 63 00 2E */	lwzx r3, r3, r0
/* 800C1D84 000BDCA4  4E 80 00 20 */	blr

.global __OSEVStart
__OSEVStart:
/* 800C1D88 000BDCA8  7C 90 43 A6 */	mtspr 0x110, r4
/* 800C1D8C 000BDCAC  80 80 00 C0 */	lwz r4, 0xc0(0)
/* 800C1D90 000BDCB0  90 64 00 0C */	stw r3, 0xc(r4)
/* 800C1D94 000BDCB4  7C 70 42 A6 */	mfspr r3, 0x110
/* 800C1D98 000BDCB8  90 64 00 10 */	stw r3, 0x10(r4)
/* 800C1D9C 000BDCBC  90 A4 00 14 */	stw r5, 0x14(r4)
/* 800C1DA0 000BDCC0  A0 64 01 A2 */	lhz r3, 0x1a2(r4)
/* 800C1DA4 000BDCC4  60 63 00 02 */	ori r3, r3, 2
/* 800C1DA8 000BDCC8  B0 64 01 A2 */	sth r3, 0x1a2(r4)
/* 800C1DAC 000BDCCC  7C 60 00 26 */	mfcr r3
/* 800C1DB0 000BDCD0  90 64 00 80 */	stw r3, 0x80(r4)
/* 800C1DB4 000BDCD4  7C 68 02 A6 */	mflr r3
/* 800C1DB8 000BDCD8  90 64 00 84 */	stw r3, 0x84(r4)
/* 800C1DBC 000BDCDC  7C 69 02 A6 */	mfctr r3
/* 800C1DC0 000BDCE0  90 64 00 88 */	stw r3, 0x88(r4)
/* 800C1DC4 000BDCE4  7C 61 02 A6 */	mfxer r3
/* 800C1DC8 000BDCE8  90 64 00 8C */	stw r3, 0x8c(r4)
/* 800C1DCC 000BDCEC  7C 7A 02 A6 */	mfspr r3, 0x1a
/* 800C1DD0 000BDCF0  90 64 01 98 */	stw r3, 0x198(r4)
/* 800C1DD4 000BDCF4  7C 7B 02 A6 */	mfspr r3, 0x1b
/* 800C1DD8 000BDCF8  90 64 01 9C */	stw r3, 0x19c(r4)
/* 800C1DDC 000BDCFC  7C 65 1B 78 */	mr r5, r3
lbl_800C1DE0:
/* 800C1DE0 000BDD00  60 00 00 00 */	nop
/* 800C1DE4 000BDD04  7C 60 00 A6 */	mfmsr r3
/* 800C1DE8 000BDD08  60 63 00 30 */	ori r3, r3, 0x30
/* 800C1DEC 000BDD0C  7C 7B 03 A6 */	mtspr 0x1b, r3
lbl_800C1DF0:
/* 800C1DF0 000BDD10  38 60 00 00 */	li r3, 0
/* 800C1DF4 000BDD14  80 80 00 D4 */	lwz r4, 0xd4(0)
/* 800C1DF8 000BDD18  54 A5 07 BD */	rlwinm. r5, r5, 0, 0x1e, 0x1e
/* 800C1DFC 000BDD1C  40 82 00 14 */	bne lbl_800C1E10
/* 800C1E00 000BDD20  3C A0 80 0C */	lis r5, OSDefaultExceptionHandler@ha
/* 800C1E04 000BDD24  38 A5 1E 24 */	addi r5, r5, OSDefaultExceptionHandler@l
/* 800C1E08 000BDD28  7C BA 03 A6 */	mtspr 0x1a, r5
/* 800C1E0C 000BDD2C  4C 00 00 64 */	rfi
lbl_800C1E10:
/* 800C1E10 000BDD30  54 65 15 BA */	rlwinm r5, r3, 2, 0x16, 0x1d
/* 800C1E14 000BDD34  80 A5 30 00 */	lwz r5, 0x3000(r5)
/* 800C1E18 000BDD38  7C BA 03 A6 */	mtspr 0x1a, r5
/* 800C1E1C 000BDD3C  4C 00 00 64 */	rfi

.global __OSEVEnd
__OSEVEnd:
/* 800C1E20 000BDD40  60 00 00 00 */	nop

.global OSDefaultExceptionHandler
OSDefaultExceptionHandler:
/* 800C1E24 000BDD44  90 04 00 00 */	stw r0, 0(r4)
/* 800C1E28 000BDD48  90 24 00 04 */	stw r1, 4(r4)
/* 800C1E2C 000BDD4C  90 44 00 08 */	stw r2, 8(r4)
/* 800C1E30 000BDD50  BC C4 00 18 */	stmw r6, 0x18(r4)
/* 800C1E34 000BDD54  7C 11 E2 A6 */	mfspr r0, 0x391
/* 800C1E38 000BDD58  90 04 01 A8 */	stw r0, 0x1a8(r4)
/* 800C1E3C 000BDD5C  7C 12 E2 A6 */	mfspr r0, 0x392
/* 800C1E40 000BDD60  90 04 01 AC */	stw r0, 0x1ac(r4)
/* 800C1E44 000BDD64  7C 13 E2 A6 */	mfspr r0, 0x393
/* 800C1E48 000BDD68  90 04 01 B0 */	stw r0, 0x1b0(r4)
/* 800C1E4C 000BDD6C  7C 14 E2 A6 */	mfspr r0, 0x394
/* 800C1E50 000BDD70  90 04 01 B4 */	stw r0, 0x1b4(r4)
/* 800C1E54 000BDD74  7C 15 E2 A6 */	mfspr r0, 0x395
/* 800C1E58 000BDD78  90 04 01 B8 */	stw r0, 0x1b8(r4)
/* 800C1E5C 000BDD7C  7C 16 E2 A6 */	mfspr r0, 0x396
/* 800C1E60 000BDD80  90 04 01 BC */	stw r0, 0x1bc(r4)
/* 800C1E64 000BDD84  7C 17 E2 A6 */	mfspr r0, 0x397
/* 800C1E68 000BDD88  90 04 01 C0 */	stw r0, 0x1c0(r4)
/* 800C1E6C 000BDD8C  7C B2 02 A6 */	mfdsisr r5
/* 800C1E70 000BDD90  7C D3 02 A6 */	mfdar r6
/* 800C1E74 000BDD94  48 00 1F 74 */	b __OSUnhandledException

.global __OSPSInit
__OSPSInit:
/* 800C1E78 000BDD98  7C 08 02 A6 */	mflr r0
/* 800C1E7C 000BDD9C  90 01 00 04 */	stw r0, 4(r1)
/* 800C1E80 000BDDA0  94 21 FF F8 */	stwu r1, -8(r1)
/* 800C1E84 000BDDA4  4B FF F9 11 */	bl PPCMfhid2
/* 800C1E88 000BDDA8  64 63 A0 00 */	oris r3, r3, 0xa000
/* 800C1E8C 000BDDAC  4B FF F9 11 */	bl PPCMthid2
/* 800C1E90 000BDDB0  48 00 11 D1 */	bl ICFlashInvalidate
/* 800C1E94 000BDDB4  7C 00 04 AC */	sync 0
/* 800C1E98 000BDDB8  38 60 00 00 */	li r3, 0
/* 800C1E9C 000BDDBC  7C 70 E3 A6 */	mtspr 0x390, r3
/* 800C1EA0 000BDDC0  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800C1EA4 000BDDC4  38 21 00 08 */	addi r1, r1, 8
/* 800C1EA8 000BDDC8  7C 08 03 A6 */	mtlr r0
/* 800C1EAC 000BDDCC  4E 80 00 20 */	blr

.global __OSGetDIConfig
__OSGetDIConfig:
/* 800C1EB0 000BDDD0  3C 60 CC 00 */	lis r3, 0xCC006000@ha
/* 800C1EB4 000BDDD4  38 63 60 00 */	addi r3, r3, 0xCC006000@l
/* 800C1EB8 000BDDD8  80 03 00 24 */	lwz r0, 0x24(r3)
/* 800C1EBC 000BDDDC  54 03 06 3E */	clrlwi r3, r0, 0x18
/* 800C1EC0 000BDDE0  4E 80 00 20 */	blr

.section .data

.global lbl_801E5CF0
lbl_801E5CF0:
	# ROM: 0x1E2CF0
glabel string__nDolphin_OS__Revision__37____n
	.asciz "\nDolphin OS $Revision: 37 $.\n"
	.balign 4
glabel string_Kernel_built____s__s_n
	.asciz "Kernel built : %s %s\n"
	.balign 4
glabel string_Jul_19_2001
	.asciz "Jul 19 2001"
glabel string_05_43_42
	.asciz "05:43:42"
	.balign 4
glabel string_Console_Type___
	.asciz "Console Type : "
glabel string_Retail__d_n
	.asciz "Retail %d\n"
	.balign 4
glabel string_Mac_Emulator_n
	.asciz "Mac Emulator\n"
	.balign 4
glabel string_PC_Emulator_n
	.asciz "PC Emulator\n"
	.balign 4
glabel string_EPPC_Arthur_n
	.asciz "EPPC Arthur\n"
	.balign 4
glabel string_EPPC_Minnow_n
	.asciz "EPPC Minnow\n"
	.balign 4
glabel string_Development_HW_d_n
	.asciz "Development HW%d\n"
	.balign 4
glabel string_Memory__d_MB_n
	.asciz "Memory %d MB\n"
	.balign 4
glabel string_Arena___0x_x___0x_x_n
	.asciz "Arena : 0x%x - 0x%x\n"
	.balign 4
	.4byte 0x00000100
	.4byte 0x00000200
	.4byte 0x00000300
	.4byte 0x00000400
	.4byte 0x00000500
	.4byte 0x00000600
	.4byte 0x00000700
	.4byte 0x00000800
	.4byte 0x00000900
	.4byte 0x00000C00
	.4byte 0x00000D00
	.4byte 0x00000F00
	.4byte 0x00001300
	.4byte 0x00001400
	.4byte 0x00001700
glabel string_Installing_OSDBIntegrator_n
	.asciz "Installing OSDBIntegrator\n"
	.balign 4
glabel string_____OSINIT__exception__d_commandeered_by_TRK_n
	.asciz ">>> OSINIT: exception %d commandeered by TRK\n"
	.balign 4
glabel string_____OSINIT__exception__d_vectored_to_debugger_n
	.asciz ">>> OSINIT: exception %d vectored to debugger\n"
	.balign 4
glabel string_Exceptions_initialized____n
	.asciz "Exceptions initialized...\n"
	.balign 4
	.4byte 0

.section .sbss

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
