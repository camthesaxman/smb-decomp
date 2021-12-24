.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global DLInsert
DLInsert:
/* 800C2620 000BE540  38 E3 00 00 */	addi r7, r3, 0
/* 800C2624 000BE544  38 C0 00 00 */	li r6, 0
/* 800C2628 000BE548  48 00 00 14 */	b lbl_800C263C
lbl_800C262C:
/* 800C262C 000BE54C  7C 04 38 40 */	cmplw r4, r7
/* 800C2630 000BE550  40 81 00 14 */	ble lbl_800C2644
/* 800C2634 000BE554  7C E6 3B 78 */	mr r6, r7
/* 800C2638 000BE558  80 E7 00 04 */	lwz r7, 4(r7)
lbl_800C263C:
/* 800C263C 000BE55C  28 07 00 00 */	cmplwi r7, 0
/* 800C2640 000BE560  40 82 FF EC */	bne lbl_800C262C
lbl_800C2644:
/* 800C2644 000BE564  90 E4 00 04 */	stw r7, 4(r4)
/* 800C2648 000BE568  28 07 00 00 */	cmplwi r7, 0
/* 800C264C 000BE56C  90 C4 00 00 */	stw r6, 0(r4)
/* 800C2650 000BE570  41 82 00 38 */	beq lbl_800C2688
/* 800C2654 000BE574  90 87 00 00 */	stw r4, 0(r7)
/* 800C2658 000BE578  80 A4 00 08 */	lwz r5, 8(r4)
/* 800C265C 000BE57C  7C 04 2A 14 */	add r0, r4, r5
/* 800C2660 000BE580  7C 00 38 40 */	cmplw r0, r7
/* 800C2664 000BE584  40 82 00 24 */	bne lbl_800C2688
/* 800C2668 000BE588  80 07 00 08 */	lwz r0, 8(r7)
/* 800C266C 000BE58C  7C 05 02 14 */	add r0, r5, r0
/* 800C2670 000BE590  90 04 00 08 */	stw r0, 8(r4)
/* 800C2674 000BE594  80 E7 00 04 */	lwz r7, 4(r7)
/* 800C2678 000BE598  28 07 00 00 */	cmplwi r7, 0
/* 800C267C 000BE59C  90 E4 00 04 */	stw r7, 4(r4)
/* 800C2680 000BE5A0  41 82 00 08 */	beq lbl_800C2688
/* 800C2684 000BE5A4  90 87 00 00 */	stw r4, 0(r7)
lbl_800C2688:
/* 800C2688 000BE5A8  28 06 00 00 */	cmplwi r6, 0
/* 800C268C 000BE5AC  41 82 00 38 */	beq lbl_800C26C4
/* 800C2690 000BE5B0  90 86 00 04 */	stw r4, 4(r6)
/* 800C2694 000BE5B4  80 A6 00 08 */	lwz r5, 8(r6)
/* 800C2698 000BE5B8  7C 06 2A 14 */	add r0, r6, r5
/* 800C269C 000BE5BC  7C 00 20 40 */	cmplw r0, r4
/* 800C26A0 000BE5C0  4C 82 00 20 */	bnelr
/* 800C26A4 000BE5C4  80 04 00 08 */	lwz r0, 8(r4)
/* 800C26A8 000BE5C8  28 07 00 00 */	cmplwi r7, 0
/* 800C26AC 000BE5CC  7C 05 02 14 */	add r0, r5, r0
/* 800C26B0 000BE5D0  90 06 00 08 */	stw r0, 8(r6)
/* 800C26B4 000BE5D4  90 E6 00 04 */	stw r7, 4(r6)
/* 800C26B8 000BE5D8  4D 82 00 20 */	beqlr
/* 800C26BC 000BE5DC  90 C7 00 00 */	stw r6, 0(r7)
/* 800C26C0 000BE5E0  4E 80 00 20 */	blr
lbl_800C26C4:
/* 800C26C4 000BE5E4  7C 83 23 78 */	mr r3, r4
/* 800C26C8 000BE5E8  4E 80 00 20 */	blr

.global OSAllocFromHeap
OSAllocFromHeap:
/* 800C26CC 000BE5EC  1C 03 00 0C */	mulli r0, r3, 0xc
/* 800C26D0 000BE5F0  80 6D A1 08 */	lwz r3, HeapArray@sda21(r13)
/* 800C26D4 000BE5F4  7C A3 02 14 */	add r5, r3, r0
/* 800C26D8 000BE5F8  38 04 00 3F */	addi r0, r4, 0x3f
/* 800C26DC 000BE5FC  80 C5 00 04 */	lwz r6, 4(r5)
/* 800C26E0 000BE600  54 03 00 34 */	rlwinm r3, r0, 0, 0, 0x1a
/* 800C26E4 000BE604  48 00 00 14 */	b lbl_800C26F8
lbl_800C26E8:
/* 800C26E8 000BE608  80 06 00 08 */	lwz r0, 8(r6)
/* 800C26EC 000BE60C  7C 03 00 00 */	cmpw r3, r0
/* 800C26F0 000BE610  40 81 00 10 */	ble lbl_800C2700
/* 800C26F4 000BE614  80 C6 00 04 */	lwz r6, 4(r6)
lbl_800C26F8:
/* 800C26F8 000BE618  28 06 00 00 */	cmplwi r6, 0
/* 800C26FC 000BE61C  40 82 FF EC */	bne lbl_800C26E8
lbl_800C2700:
/* 800C2700 000BE620  28 06 00 00 */	cmplwi r6, 0
/* 800C2704 000BE624  40 82 00 0C */	bne lbl_800C2710
/* 800C2708 000BE628  38 60 00 00 */	li r3, 0
/* 800C270C 000BE62C  4E 80 00 20 */	blr
lbl_800C2710:
/* 800C2710 000BE630  80 06 00 08 */	lwz r0, 8(r6)
/* 800C2714 000BE634  7C 03 00 50 */	subf r0, r3, r0
/* 800C2718 000BE638  28 00 00 40 */	cmplwi r0, 0x40
/* 800C271C 000BE63C  40 80 00 40 */	bge lbl_800C275C
/* 800C2720 000BE640  80 86 00 04 */	lwz r4, 4(r6)
/* 800C2724 000BE644  80 65 00 04 */	lwz r3, 4(r5)
/* 800C2728 000BE648  28 04 00 00 */	cmplwi r4, 0
/* 800C272C 000BE64C  41 82 00 0C */	beq lbl_800C2738
/* 800C2730 000BE650  80 06 00 00 */	lwz r0, 0(r6)
/* 800C2734 000BE654  90 04 00 00 */	stw r0, 0(r4)
lbl_800C2738:
/* 800C2738 000BE658  80 86 00 00 */	lwz r4, 0(r6)
/* 800C273C 000BE65C  28 04 00 00 */	cmplwi r4, 0
/* 800C2740 000BE660  40 82 00 0C */	bne lbl_800C274C
/* 800C2744 000BE664  80 66 00 04 */	lwz r3, 4(r6)
/* 800C2748 000BE668  48 00 00 0C */	b lbl_800C2754
lbl_800C274C:
/* 800C274C 000BE66C  80 06 00 04 */	lwz r0, 4(r6)
/* 800C2750 000BE670  90 04 00 04 */	stw r0, 4(r4)
lbl_800C2754:
/* 800C2754 000BE674  90 65 00 04 */	stw r3, 4(r5)
/* 800C2758 000BE678  48 00 00 48 */	b lbl_800C27A0
lbl_800C275C:
/* 800C275C 000BE67C  90 66 00 08 */	stw r3, 8(r6)
/* 800C2760 000BE680  7C 86 1A 14 */	add r4, r6, r3
/* 800C2764 000BE684  90 04 00 08 */	stw r0, 8(r4)
/* 800C2768 000BE688  80 06 00 00 */	lwz r0, 0(r6)
/* 800C276C 000BE68C  90 04 00 00 */	stw r0, 0(r4)
/* 800C2770 000BE690  80 06 00 04 */	lwz r0, 4(r6)
/* 800C2774 000BE694  90 04 00 04 */	stw r0, 4(r4)
/* 800C2778 000BE698  80 64 00 04 */	lwz r3, 4(r4)
/* 800C277C 000BE69C  28 03 00 00 */	cmplwi r3, 0
/* 800C2780 000BE6A0  41 82 00 08 */	beq lbl_800C2788
/* 800C2784 000BE6A4  90 83 00 00 */	stw r4, 0(r3)
lbl_800C2788:
/* 800C2788 000BE6A8  80 64 00 00 */	lwz r3, 0(r4)
/* 800C278C 000BE6AC  28 03 00 00 */	cmplwi r3, 0
/* 800C2790 000BE6B0  41 82 00 0C */	beq lbl_800C279C
/* 800C2794 000BE6B4  90 83 00 04 */	stw r4, 4(r3)
/* 800C2798 000BE6B8  48 00 00 08 */	b lbl_800C27A0
lbl_800C279C:
/* 800C279C 000BE6BC  90 85 00 04 */	stw r4, 4(r5)
lbl_800C27A0:
/* 800C27A0 000BE6C0  80 65 00 08 */	lwz r3, 8(r5)
/* 800C27A4 000BE6C4  38 00 00 00 */	li r0, 0
/* 800C27A8 000BE6C8  90 66 00 04 */	stw r3, 4(r6)
/* 800C27AC 000BE6CC  28 03 00 00 */	cmplwi r3, 0
/* 800C27B0 000BE6D0  90 06 00 00 */	stw r0, 0(r6)
/* 800C27B4 000BE6D4  41 82 00 08 */	beq lbl_800C27BC
/* 800C27B8 000BE6D8  90 C3 00 00 */	stw r6, 0(r3)
lbl_800C27BC:
/* 800C27BC 000BE6DC  90 C5 00 08 */	stw r6, 8(r5)
/* 800C27C0 000BE6E0  38 66 00 20 */	addi r3, r6, 0x20
/* 800C27C4 000BE6E4  4E 80 00 20 */	blr

.global OSFreeToHeap
OSFreeToHeap:
/* 800C27C8 000BE6E8  7C 08 02 A6 */	mflr r0
/* 800C27CC 000BE6EC  38 C4 FF E0 */	addi r6, r4, -32
/* 800C27D0 000BE6F0  90 01 00 04 */	stw r0, 4(r1)
/* 800C27D4 000BE6F4  1C 03 00 0C */	mulli r0, r3, 0xc
/* 800C27D8 000BE6F8  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800C27DC 000BE6FC  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800C27E0 000BE700  80 8D A1 08 */	lwz r4, HeapArray@sda21(r13)
/* 800C27E4 000BE704  80 66 00 04 */	lwz r3, 4(r6)
/* 800C27E8 000BE708  7F E4 02 14 */	add r31, r4, r0
/* 800C27EC 000BE70C  28 03 00 00 */	cmplwi r3, 0
/* 800C27F0 000BE710  80 BF 00 08 */	lwz r5, 8(r31)
/* 800C27F4 000BE714  7C C4 33 78 */	mr r4, r6
/* 800C27F8 000BE718  41 82 00 0C */	beq lbl_800C2804
/* 800C27FC 000BE71C  80 04 00 00 */	lwz r0, 0(r4)
/* 800C2800 000BE720  90 03 00 00 */	stw r0, 0(r3)
lbl_800C2804:
/* 800C2804 000BE724  80 64 00 00 */	lwz r3, 0(r4)
/* 800C2808 000BE728  28 03 00 00 */	cmplwi r3, 0
/* 800C280C 000BE72C  40 82 00 0C */	bne lbl_800C2818
/* 800C2810 000BE730  80 A4 00 04 */	lwz r5, 4(r4)
/* 800C2814 000BE734  48 00 00 0C */	b lbl_800C2820
lbl_800C2818:
/* 800C2818 000BE738  80 04 00 04 */	lwz r0, 4(r4)
/* 800C281C 000BE73C  90 03 00 04 */	stw r0, 4(r3)
lbl_800C2820:
/* 800C2820 000BE740  90 BF 00 08 */	stw r5, 8(r31)
/* 800C2824 000BE744  80 7F 00 04 */	lwz r3, 4(r31)
/* 800C2828 000BE748  4B FF FD F9 */	bl DLInsert
/* 800C282C 000BE74C  90 7F 00 04 */	stw r3, 4(r31)
/* 800C2830 000BE750  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800C2834 000BE754  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800C2838 000BE758  38 21 00 18 */	addi r1, r1, 0x18
/* 800C283C 000BE75C  7C 08 03 A6 */	mtlr r0
/* 800C2840 000BE760  4E 80 00 20 */	blr

.global OSSetCurrentHeap
OSSetCurrentHeap:
/* 800C2844 000BE764  80 0D 97 48 */	lwz r0, __OSCurrHeap@sda21(r13)
/* 800C2848 000BE768  90 6D 97 48 */	stw r3, __OSCurrHeap@sda21(r13)
/* 800C284C 000BE76C  7C 03 03 78 */	mr r3, r0
/* 800C2850 000BE770  4E 80 00 20 */	blr

.global OSInitAlloc
OSInitAlloc:
/* 800C2854 000BE774  1C E5 00 0C */	mulli r7, r5, 0xc
/* 800C2858 000BE778  90 6D A1 08 */	stw r3, HeapArray@sda21(r13)
/* 800C285C 000BE77C  90 AD A1 0C */	stw r5, NumHeaps@sda21(r13)
/* 800C2860 000BE780  38 C0 00 00 */	li r6, 0
/* 800C2864 000BE784  38 66 00 00 */	addi r3, r6, 0
/* 800C2868 000BE788  39 00 00 00 */	li r8, 0
/* 800C286C 000BE78C  38 A0 FF FF */	li r5, -1
/* 800C2870 000BE790  48 00 00 20 */	b lbl_800C2890
lbl_800C2874:
/* 800C2874 000BE794  80 0D A1 08 */	lwz r0, HeapArray@sda21(r13)
/* 800C2878 000BE798  39 08 00 01 */	addi r8, r8, 1
/* 800C287C 000BE79C  7D 20 32 14 */	add r9, r0, r6
/* 800C2880 000BE7A0  90 A9 00 00 */	stw r5, 0(r9)
/* 800C2884 000BE7A4  38 C6 00 0C */	addi r6, r6, 0xc
/* 800C2888 000BE7A8  90 69 00 08 */	stw r3, 8(r9)
/* 800C288C 000BE7AC  90 69 00 04 */	stw r3, 4(r9)
lbl_800C2890:
/* 800C2890 000BE7B0  80 0D A1 0C */	lwz r0, NumHeaps@sda21(r13)
/* 800C2894 000BE7B4  7C 08 00 00 */	cmpw r8, r0
/* 800C2898 000BE7B8  41 80 FF DC */	blt lbl_800C2874
/* 800C289C 000BE7BC  80 6D A1 08 */	lwz r3, HeapArray@sda21(r13)
/* 800C28A0 000BE7C0  54 80 00 34 */	rlwinm r0, r4, 0, 0, 0x1a
/* 800C28A4 000BE7C4  38 80 FF FF */	li r4, -1
/* 800C28A8 000BE7C8  90 0D A1 14 */	stw r0, ArenaEnd@sda21(r13)
/* 800C28AC 000BE7CC  7C 63 3A 14 */	add r3, r3, r7
/* 800C28B0 000BE7D0  38 03 00 1F */	addi r0, r3, 0x1f
/* 800C28B4 000BE7D4  90 8D 97 48 */	stw r4, __OSCurrHeap@sda21(r13)
/* 800C28B8 000BE7D8  54 03 00 34 */	rlwinm r3, r0, 0, 0, 0x1a
/* 800C28BC 000BE7DC  90 6D A1 10 */	stw r3, ArenaStart@sda21(r13)
/* 800C28C0 000BE7E0  4E 80 00 20 */	blr

.global OSCreateHeap
OSCreateHeap:
/* 800C28C4 000BE7E4  80 CD A1 0C */	lwz r6, NumHeaps@sda21(r13)
/* 800C28C8 000BE7E8  38 03 00 1F */	addi r0, r3, 0x1f
/* 800C28CC 000BE7EC  80 AD A1 08 */	lwz r5, HeapArray@sda21(r13)
/* 800C28D0 000BE7F0  54 07 00 34 */	rlwinm r7, r0, 0, 0, 0x1a
/* 800C28D4 000BE7F4  2C 06 00 00 */	cmpwi r6, 0
/* 800C28D8 000BE7F8  7C C9 03 A6 */	mtctr r6
/* 800C28DC 000BE7FC  54 84 00 34 */	rlwinm r4, r4, 0, 0, 0x1a
/* 800C28E0 000BE800  38 60 00 00 */	li r3, 0
/* 800C28E4 000BE804  40 81 00 44 */	ble lbl_800C2928
lbl_800C28E8:
/* 800C28E8 000BE808  80 05 00 00 */	lwz r0, 0(r5)
/* 800C28EC 000BE80C  2C 00 00 00 */	cmpwi r0, 0
/* 800C28F0 000BE810  40 80 00 2C */	bge lbl_800C291C
/* 800C28F4 000BE814  7C 07 20 50 */	subf r0, r7, r4
/* 800C28F8 000BE818  90 05 00 00 */	stw r0, 0(r5)
/* 800C28FC 000BE81C  38 80 00 00 */	li r4, 0
/* 800C2900 000BE820  90 87 00 00 */	stw r4, 0(r7)
/* 800C2904 000BE824  90 87 00 04 */	stw r4, 4(r7)
/* 800C2908 000BE828  80 05 00 00 */	lwz r0, 0(r5)
/* 800C290C 000BE82C  90 07 00 08 */	stw r0, 8(r7)
/* 800C2910 000BE830  90 E5 00 04 */	stw r7, 4(r5)
/* 800C2914 000BE834  90 85 00 08 */	stw r4, 8(r5)
/* 800C2918 000BE838  4E 80 00 20 */	blr
lbl_800C291C:
/* 800C291C 000BE83C  38 A5 00 0C */	addi r5, r5, 0xc
/* 800C2920 000BE840  38 63 00 01 */	addi r3, r3, 1
/* 800C2924 000BE844  42 00 FF C4 */	bdnz lbl_800C28E8
lbl_800C2928:
/* 800C2928 000BE848  38 60 FF FF */	li r3, -1
/* 800C292C 000BE84C  4E 80 00 20 */	blr

.global OSCheckHeap
OSCheckHeap:
/* 800C2930 000BE850  7C 08 02 A6 */	mflr r0
/* 800C2934 000BE854  3C 80 80 1E */	lis r4, lbl_801E5EB0@ha
/* 800C2938 000BE858  90 01 00 04 */	stw r0, 4(r1)
/* 800C293C 000BE85C  38 C4 5E B0 */	addi r6, r4, lbl_801E5EB0@l
/* 800C2940 000BE860  38 00 00 00 */	li r0, 0
/* 800C2944 000BE864  94 21 FF F8 */	stwu r1, -8(r1)
/* 800C2948 000BE868  38 80 00 00 */	li r4, 0
/* 800C294C 000BE86C  80 ED A1 08 */	lwz r7, HeapArray@sda21(r13)
/* 800C2950 000BE870  28 07 00 00 */	cmplwi r7, 0
/* 800C2954 000BE874  40 82 00 1C */	bne lbl_800C2970
/* 800C2958 000BE878  38 66 00 00 */	addi r3, r6, 0
/* 800C295C 000BE87C  4C C6 31 82 */	crclr 6
/* 800C2960 000BE880  38 80 03 7D */	li r4, 0x37d
/* 800C2964 000BE884  48 00 12 BD */	bl OSReport
/* 800C2968 000BE888  38 60 FF FF */	li r3, -1
/* 800C296C 000BE88C  48 00 03 14 */	b lbl_800C2C80
lbl_800C2970:
/* 800C2970 000BE890  2C 03 00 00 */	cmpwi r3, 0
/* 800C2974 000BE894  41 80 00 10 */	blt lbl_800C2984
/* 800C2978 000BE898  80 AD A1 0C */	lwz r5, NumHeaps@sda21(r13)
/* 800C297C 000BE89C  7C 03 28 00 */	cmpw r3, r5
/* 800C2980 000BE8A0  41 80 00 1C */	blt lbl_800C299C
lbl_800C2984:
/* 800C2984 000BE8A4  38 66 00 24 */	addi r3, r6, 0x24
/* 800C2988 000BE8A8  4C C6 31 82 */	crclr 6
/* 800C298C 000BE8AC  38 80 03 7E */	li r4, 0x37e
/* 800C2990 000BE8B0  48 00 12 91 */	bl OSReport
/* 800C2994 000BE8B4  38 60 FF FF */	li r3, -1
/* 800C2998 000BE8B8  48 00 02 E8 */	b lbl_800C2C80
lbl_800C299C:
/* 800C299C 000BE8BC  1C 63 00 0C */	mulli r3, r3, 0xc
/* 800C29A0 000BE8C0  7C A7 1A 14 */	add r5, r7, r3
/* 800C29A4 000BE8C4  80 65 00 00 */	lwz r3, 0(r5)
/* 800C29A8 000BE8C8  2C 03 00 00 */	cmpwi r3, 0
/* 800C29AC 000BE8CC  40 80 00 1C */	bge lbl_800C29C8
/* 800C29B0 000BE8D0  38 66 00 5C */	addi r3, r6, 0x5c
/* 800C29B4 000BE8D4  4C C6 31 82 */	crclr 6
/* 800C29B8 000BE8D8  38 80 03 81 */	li r4, 0x381
/* 800C29BC 000BE8DC  48 00 12 65 */	bl OSReport
/* 800C29C0 000BE8E0  38 60 FF FF */	li r3, -1
/* 800C29C4 000BE8E4  48 00 02 BC */	b lbl_800C2C80
lbl_800C29C8:
/* 800C29C8 000BE8E8  80 E5 00 08 */	lwz r7, 8(r5)
/* 800C29CC 000BE8EC  28 07 00 00 */	cmplwi r7, 0
/* 800C29D0 000BE8F0  41 82 00 28 */	beq lbl_800C29F8
/* 800C29D4 000BE8F4  80 67 00 00 */	lwz r3, 0(r7)
/* 800C29D8 000BE8F8  28 03 00 00 */	cmplwi r3, 0
/* 800C29DC 000BE8FC  41 82 00 1C */	beq lbl_800C29F8
/* 800C29E0 000BE900  38 66 00 84 */	addi r3, r6, 0x84
/* 800C29E4 000BE904  4C C6 31 82 */	crclr 6
/* 800C29E8 000BE908  38 80 03 83 */	li r4, 0x383
/* 800C29EC 000BE90C  48 00 12 35 */	bl OSReport
/* 800C29F0 000BE910  38 60 FF FF */	li r3, -1
/* 800C29F4 000BE914  48 00 02 8C */	b lbl_800C2C80
lbl_800C29F8:
/* 800C29F8 000BE918  81 2D A1 10 */	lwz r9, ArenaStart@sda21(r13)
/* 800C29FC 000BE91C  7C E8 3B 78 */	mr r8, r7
/* 800C2A00 000BE920  81 4D A1 14 */	lwz r10, ArenaEnd@sda21(r13)
/* 800C2A04 000BE924  48 00 00 F0 */	b lbl_800C2AF4
lbl_800C2A08:
/* 800C2A08 000BE928  7C 09 40 40 */	cmplw r9, r8
/* 800C2A0C 000BE92C  41 81 00 0C */	bgt lbl_800C2A18
/* 800C2A10 000BE930  7C 08 50 40 */	cmplw r8, r10
/* 800C2A14 000BE934  41 80 00 1C */	blt lbl_800C2A30
lbl_800C2A18:
/* 800C2A18 000BE938  38 66 00 D4 */	addi r3, r6, 0xd4
/* 800C2A1C 000BE93C  4C C6 31 82 */	crclr 6
/* 800C2A20 000BE940  38 80 03 86 */	li r4, 0x386
/* 800C2A24 000BE944  48 00 11 FD */	bl OSReport
/* 800C2A28 000BE948  38 60 FF FF */	li r3, -1
/* 800C2A2C 000BE94C  48 00 02 54 */	b lbl_800C2C80
lbl_800C2A30:
/* 800C2A30 000BE950  55 03 06 FF */	clrlwi. r3, r8, 0x1b
/* 800C2A34 000BE954  41 82 00 1C */	beq lbl_800C2A50
/* 800C2A38 000BE958  38 66 01 14 */	addi r3, r6, 0x114
/* 800C2A3C 000BE95C  4C C6 31 82 */	crclr 6
/* 800C2A40 000BE960  38 80 03 87 */	li r4, 0x387
/* 800C2A44 000BE964  48 00 11 DD */	bl OSReport
/* 800C2A48 000BE968  38 60 FF FF */	li r3, -1
/* 800C2A4C 000BE96C  48 00 02 34 */	b lbl_800C2C80
lbl_800C2A50:
/* 800C2A50 000BE970  80 E8 00 04 */	lwz r7, 4(r8)
/* 800C2A54 000BE974  28 07 00 00 */	cmplwi r7, 0
/* 800C2A58 000BE978  41 82 00 28 */	beq lbl_800C2A80
/* 800C2A5C 000BE97C  80 67 00 00 */	lwz r3, 0(r7)
/* 800C2A60 000BE980  7C 03 40 40 */	cmplw r3, r8
/* 800C2A64 000BE984  41 82 00 1C */	beq lbl_800C2A80
/* 800C2A68 000BE988  38 66 01 4C */	addi r3, r6, 0x14c
/* 800C2A6C 000BE98C  4C C6 31 82 */	crclr 6
/* 800C2A70 000BE990  38 80 03 88 */	li r4, 0x388
/* 800C2A74 000BE994  48 00 11 AD */	bl OSReport
/* 800C2A78 000BE998  38 60 FF FF */	li r3, -1
/* 800C2A7C 000BE99C  48 00 02 04 */	b lbl_800C2C80
lbl_800C2A80:
/* 800C2A80 000BE9A0  81 08 00 08 */	lwz r8, 8(r8)
/* 800C2A84 000BE9A4  28 08 00 40 */	cmplwi r8, 0x40
/* 800C2A88 000BE9A8  40 80 00 1C */	bge lbl_800C2AA4
/* 800C2A8C 000BE9AC  38 66 01 98 */	addi r3, r6, 0x198
/* 800C2A90 000BE9B0  4C C6 31 82 */	crclr 6
/* 800C2A94 000BE9B4  38 80 03 89 */	li r4, 0x389
/* 800C2A98 000BE9B8  48 00 11 89 */	bl OSReport
/* 800C2A9C 000BE9BC  38 60 FF FF */	li r3, -1
/* 800C2AA0 000BE9C0  48 00 01 E0 */	b lbl_800C2C80
lbl_800C2AA4:
/* 800C2AA4 000BE9C4  55 03 06 FF */	clrlwi. r3, r8, 0x1b
/* 800C2AA8 000BE9C8  41 82 00 1C */	beq lbl_800C2AC4
/* 800C2AAC 000BE9CC  38 66 01 CC */	addi r3, r6, 0x1cc
/* 800C2AB0 000BE9D0  4C C6 31 82 */	crclr 6
/* 800C2AB4 000BE9D4  38 80 03 8A */	li r4, 0x38a
/* 800C2AB8 000BE9D8  48 00 11 69 */	bl OSReport
/* 800C2ABC 000BE9DC  38 60 FF FF */	li r3, -1
/* 800C2AC0 000BE9E0  48 00 01 C0 */	b lbl_800C2C80
lbl_800C2AC4:
/* 800C2AC4 000BE9E4  7C 00 42 15 */	add. r0, r0, r8
/* 800C2AC8 000BE9E8  40 81 00 10 */	ble lbl_800C2AD8
/* 800C2ACC 000BE9EC  80 65 00 00 */	lwz r3, 0(r5)
/* 800C2AD0 000BE9F0  7C 00 18 00 */	cmpw r0, r3
/* 800C2AD4 000BE9F4  40 81 00 1C */	ble lbl_800C2AF0
lbl_800C2AD8:
/* 800C2AD8 000BE9F8  38 66 02 0C */	addi r3, r6, 0x20c
/* 800C2ADC 000BE9FC  4C C6 31 82 */	crclr 6
/* 800C2AE0 000BEA00  38 80 03 8D */	li r4, 0x38d
/* 800C2AE4 000BEA04  48 00 11 3D */	bl OSReport
/* 800C2AE8 000BEA08  38 60 FF FF */	li r3, -1
/* 800C2AEC 000BEA0C  48 00 01 94 */	b lbl_800C2C80
lbl_800C2AF0:
/* 800C2AF0 000BEA10  7C E8 3B 78 */	mr r8, r7
lbl_800C2AF4:
/* 800C2AF4 000BEA14  28 08 00 00 */	cmplwi r8, 0
/* 800C2AF8 000BEA18  40 82 FF 10 */	bne lbl_800C2A08
/* 800C2AFC 000BEA1C  81 65 00 04 */	lwz r11, 4(r5)
/* 800C2B00 000BEA20  28 0B 00 00 */	cmplwi r11, 0
/* 800C2B04 000BEA24  41 82 01 4C */	beq lbl_800C2C50
/* 800C2B08 000BEA28  80 6B 00 00 */	lwz r3, 0(r11)
/* 800C2B0C 000BEA2C  28 03 00 00 */	cmplwi r3, 0
/* 800C2B10 000BEA30  41 82 01 40 */	beq lbl_800C2C50
/* 800C2B14 000BEA34  38 66 02 48 */	addi r3, r6, 0x248
/* 800C2B18 000BEA38  4C C6 31 82 */	crclr 6
/* 800C2B1C 000BEA3C  38 80 03 95 */	li r4, 0x395
/* 800C2B20 000BEA40  48 00 11 01 */	bl OSReport
/* 800C2B24 000BEA44  38 60 FF FF */	li r3, -1
/* 800C2B28 000BEA48  48 00 01 58 */	b lbl_800C2C80
/* 800C2B2C 000BEA4C  48 00 01 24 */	b lbl_800C2C50
lbl_800C2B30:
/* 800C2B30 000BEA50  7C 09 58 40 */	cmplw r9, r11
/* 800C2B34 000BEA54  41 81 00 0C */	bgt lbl_800C2B40
/* 800C2B38 000BEA58  7C 0B 50 40 */	cmplw r11, r10
/* 800C2B3C 000BEA5C  41 80 00 1C */	blt lbl_800C2B58
lbl_800C2B40:
/* 800C2B40 000BEA60  38 66 00 D4 */	addi r3, r6, 0xd4
/* 800C2B44 000BEA64  4C C6 31 82 */	crclr 6
/* 800C2B48 000BEA68  38 80 03 98 */	li r4, 0x398
/* 800C2B4C 000BEA6C  48 00 10 D5 */	bl OSReport
/* 800C2B50 000BEA70  38 60 FF FF */	li r3, -1
/* 800C2B54 000BEA74  48 00 01 2C */	b lbl_800C2C80
lbl_800C2B58:
/* 800C2B58 000BEA78  55 63 06 FF */	clrlwi. r3, r11, 0x1b
/* 800C2B5C 000BEA7C  41 82 00 1C */	beq lbl_800C2B78
/* 800C2B60 000BEA80  38 66 01 14 */	addi r3, r6, 0x114
/* 800C2B64 000BEA84  4C C6 31 82 */	crclr 6
/* 800C2B68 000BEA88  38 80 03 99 */	li r4, 0x399
/* 800C2B6C 000BEA8C  48 00 10 B5 */	bl OSReport
/* 800C2B70 000BEA90  38 60 FF FF */	li r3, -1
/* 800C2B74 000BEA94  48 00 01 0C */	b lbl_800C2C80
lbl_800C2B78:
/* 800C2B78 000BEA98  80 EB 00 04 */	lwz r7, 4(r11)
/* 800C2B7C 000BEA9C  28 07 00 00 */	cmplwi r7, 0
/* 800C2B80 000BEAA0  41 82 00 28 */	beq lbl_800C2BA8
/* 800C2B84 000BEAA4  80 67 00 00 */	lwz r3, 0(r7)
/* 800C2B88 000BEAA8  7C 03 58 40 */	cmplw r3, r11
/* 800C2B8C 000BEAAC  41 82 00 1C */	beq lbl_800C2BA8
/* 800C2B90 000BEAB0  38 66 01 4C */	addi r3, r6, 0x14c
/* 800C2B94 000BEAB4  4C C6 31 82 */	crclr 6
/* 800C2B98 000BEAB8  38 80 03 9A */	li r4, 0x39a
/* 800C2B9C 000BEABC  48 00 10 85 */	bl OSReport
/* 800C2BA0 000BEAC0  38 60 FF FF */	li r3, -1
/* 800C2BA4 000BEAC4  48 00 00 DC */	b lbl_800C2C80
lbl_800C2BA8:
/* 800C2BA8 000BEAC8  81 0B 00 08 */	lwz r8, 8(r11)
/* 800C2BAC 000BEACC  28 08 00 40 */	cmplwi r8, 0x40
/* 800C2BB0 000BEAD0  40 80 00 1C */	bge lbl_800C2BCC
/* 800C2BB4 000BEAD4  38 66 01 98 */	addi r3, r6, 0x198
/* 800C2BB8 000BEAD8  4C C6 31 82 */	crclr 6
/* 800C2BBC 000BEADC  38 80 03 9B */	li r4, 0x39b
/* 800C2BC0 000BEAE0  48 00 10 61 */	bl OSReport
/* 800C2BC4 000BEAE4  38 60 FF FF */	li r3, -1
/* 800C2BC8 000BEAE8  48 00 00 B8 */	b lbl_800C2C80
lbl_800C2BCC:
/* 800C2BCC 000BEAEC  55 03 06 FF */	clrlwi. r3, r8, 0x1b
/* 800C2BD0 000BEAF0  41 82 00 1C */	beq lbl_800C2BEC
/* 800C2BD4 000BEAF4  38 66 01 CC */	addi r3, r6, 0x1cc
/* 800C2BD8 000BEAF8  4C C6 31 82 */	crclr 6
/* 800C2BDC 000BEAFC  38 80 03 9C */	li r4, 0x39c
/* 800C2BE0 000BEB00  48 00 10 41 */	bl OSReport
/* 800C2BE4 000BEB04  38 60 FF FF */	li r3, -1
/* 800C2BE8 000BEB08  48 00 00 98 */	b lbl_800C2C80
lbl_800C2BEC:
/* 800C2BEC 000BEB0C  28 07 00 00 */	cmplwi r7, 0
/* 800C2BF0 000BEB10  41 82 00 28 */	beq lbl_800C2C18
/* 800C2BF4 000BEB14  7C 6B 42 14 */	add r3, r11, r8
/* 800C2BF8 000BEB18  7C 03 38 40 */	cmplw r3, r7
/* 800C2BFC 000BEB1C  41 80 00 1C */	blt lbl_800C2C18
/* 800C2C00 000BEB20  38 66 02 90 */	addi r3, r6, 0x290
/* 800C2C04 000BEB24  4C C6 31 82 */	crclr 6
/* 800C2C08 000BEB28  38 80 03 9D */	li r4, 0x39d
/* 800C2C0C 000BEB2C  48 00 10 15 */	bl OSReport
/* 800C2C10 000BEB30  38 60 FF FF */	li r3, -1
/* 800C2C14 000BEB34  48 00 00 6C */	b lbl_800C2C80
lbl_800C2C18:
/* 800C2C18 000BEB38  7C 00 42 15 */	add. r0, r0, r8
/* 800C2C1C 000BEB3C  7C 88 22 14 */	add r4, r8, r4
/* 800C2C20 000BEB40  38 84 FF E0 */	addi r4, r4, -32
/* 800C2C24 000BEB44  40 81 00 10 */	ble lbl_800C2C34
/* 800C2C28 000BEB48  80 65 00 00 */	lwz r3, 0(r5)
/* 800C2C2C 000BEB4C  7C 00 18 00 */	cmpw r0, r3
/* 800C2C30 000BEB50  40 81 00 1C */	ble lbl_800C2C4C
lbl_800C2C34:
/* 800C2C34 000BEB54  38 66 02 0C */	addi r3, r6, 0x20c
/* 800C2C38 000BEB58  4C C6 31 82 */	crclr 6
/* 800C2C3C 000BEB5C  38 80 03 A1 */	li r4, 0x3a1
/* 800C2C40 000BEB60  48 00 0F E1 */	bl OSReport
/* 800C2C44 000BEB64  38 60 FF FF */	li r3, -1
/* 800C2C48 000BEB68  48 00 00 38 */	b lbl_800C2C80
lbl_800C2C4C:
/* 800C2C4C 000BEB6C  7C EB 3B 78 */	mr r11, r7
lbl_800C2C50:
/* 800C2C50 000BEB70  28 0B 00 00 */	cmplwi r11, 0
/* 800C2C54 000BEB74  40 82 FE DC */	bne lbl_800C2B30
/* 800C2C58 000BEB78  80 65 00 00 */	lwz r3, 0(r5)
/* 800C2C5C 000BEB7C  7C 00 18 00 */	cmpw r0, r3
/* 800C2C60 000BEB80  41 82 00 1C */	beq lbl_800C2C7C
/* 800C2C64 000BEB84  38 66 02 F0 */	addi r3, r6, 0x2f0
/* 800C2C68 000BEB88  4C C6 31 82 */	crclr 6
/* 800C2C6C 000BEB8C  38 80 03 A8 */	li r4, 0x3a8
/* 800C2C70 000BEB90  48 00 0F B1 */	bl OSReport
/* 800C2C74 000BEB94  38 60 FF FF */	li r3, -1
/* 800C2C78 000BEB98  48 00 00 08 */	b lbl_800C2C80
lbl_800C2C7C:
/* 800C2C7C 000BEB9C  7C 83 23 78 */	mr r3, r4
lbl_800C2C80:
/* 800C2C80 000BEBA0  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800C2C84 000BEBA4  38 21 00 08 */	addi r1, r1, 8
/* 800C2C88 000BEBA8  7C 08 03 A6 */	mtlr r0
/* 800C2C8C 000BEBAC  4E 80 00 20 */	blr

.section .data

.global lbl_801E5EB0
lbl_801E5EB0:
	# ROM: 0x1E2EB0
glabel string_OSCheckHeap__Failed_HeapArray_in__d
	.asciz "OSCheckHeap: Failed HeapArray in %d"
glabel string_OSCheckHeap__Failed_0____heap____heap___NumHeaps_in__d
	.asciz "OSCheckHeap: Failed 0 <= heap && heap < NumHeaps in %d"
	.balign 4
glabel string_OSCheckHeap__Failed_0____hd__size_in__d
	.asciz "OSCheckHeap: Failed 0 <= hd->size in %d"
glabel string_OSCheckHeap__Failed_hd__allocated____NULL____hd__allocated__prev____NULL_in__d
	.asciz "OSCheckHeap: Failed hd->allocated == NULL || hd->allocated->prev == NULL in %d"
	.balign 4
glabel string_OSCheckHeap__Failed_InRange_cell__ArenaStart__ArenaEnd__in__d
	.asciz "OSCheckHeap: Failed InRange(cell, ArenaStart, ArenaEnd) in %d"
	.balign 4
glabel string_OSCheckHeap__Failed_OFFSET_cell__ALIGNMENT_____0_in__d
	.asciz "OSCheckHeap: Failed OFFSET(cell, ALIGNMENT) == 0 in %d"
	.balign 4
glabel string_OSCheckHeap__Failed_cell__next____NULL____cell__next__prev____cell_in__d
	.asciz "OSCheckHeap: Failed cell->next == NULL || cell->next->prev == cell in %d"
	.balign 4
glabel string_OSCheckHeap__Failed_MINOBJSIZE____cell__size_in__d
	.asciz "OSCheckHeap: Failed MINOBJSIZE <= cell->size in %d"
	.balign 4
glabel string_OSCheckHeap__Failed_OFFSET_cell__size__ALIGNMENT_____0_in__d
	.asciz "OSCheckHeap: Failed OFFSET(cell->size, ALIGNMENT) == 0 in %d"
	.balign 4
glabel string_OSCheckHeap__Failed_0___total____total____hd__size_in__d
	.asciz "OSCheckHeap: Failed 0 < total && total <= hd->size in %d"
	.balign 4
glabel string_OSCheckHeap__Failed_hd__free____NULL____hd__free__prev____NULL_in__d
	.asciz "OSCheckHeap: Failed hd->free == NULL || hd->free->prev == NULL in %d"
	.balign 4
glabel string_OSCheckHeap__Failed_cell__next____NULL_____char___cell___cell__size____char___cell__next_in__d
	.asciz "OSCheckHeap: Failed cell->next == NULL || (char*) cell + cell->size < (char*) cell->next in %d"
	.balign 4
glabel string_OSCheckHeap__Failed_total____hd__size_in__d
	.asciz "OSCheckHeap: Failed total == hd->size in %d"
glabel string__nOSDumpHeap__d___n
	.asciz "\nOSDumpHeap(%d):\n"
	.balign 4
glabel string_________Inactive_n
	.asciz "--------Inactive\n"
	.balign 4
glabel string_addr_tsize_t_tend_tprev_tnext_n
	.asciz "addr\tsize\t\tend\tprev\tnext\n"
	.balign 4
glabel string_________Allocated_n
	.asciz "--------Allocated\n"
	.balign 4
glabel string__x_t_d_t_x_t_x_t_x_n
	.asciz "%x\t%d\t%x\t%x\t%x\n"
glabel string_________Free_n
	.asciz "--------Free\n"
	.balign 4
	.4byte 0

.section .sdata

.global __OSCurrHeap
__OSCurrHeap:
	# ROM: 0x1EC068
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	.4byte 0
