
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	MAX
	.type	MAX, %function
MAX:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-20]
	cmp	r9, r8
	beq	.L2
	b	.L3

.L2:
	mov	r0, r9
	b	.L1
	b	.L4

.L3:
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-20]
	cmp	r9, r8
	bgt	.L113
	ldr	r10, =1
	cmp	r10, #0
	b	.L9

.L113:
	ldr	r10, =0
	cmp	r10, #0
	b	.L8
	b	.L9

.L8:
	mov	r0, r9
	b	.L1
	b	.L10

.L9:
	ldr	r9, [fp, #-20]
	mov	r0, r9
	b	.L1

.L10:

.L4:

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	MAX, .-MAX

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	max_sum_no
	.type	max_sum_no, %function
max_sum_no:
	@ args = 0, pretend = 0, frame = 196
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #200
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r10, =-84
	add	r10, r10, fp
	mov	r12, #0
	str	r12, [r10, #0]
	str	r12, [r10, #4]
	str	r12, [r10, #8]
	str	r12, [r10, #12]
	str	r12, [r10, #16]
	str	r12, [r10, #20]
	str	r12, [r10, #24]
	str	r12, [r10, #28]
	str	r12, [r10, #32]
	str	r12, [r10, #36]
	str	r12, [r10, #40]
	str	r12, [r10, #44]
	str	r12, [r10, #48]
	str	r12, [r10, #52]
	str	r12, [r10, #56]
	str	r12, [r10, #60]

	ldr	r9, =0
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	ldr	r8, =0
	ldr	r10, =-84
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =0
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	ldr	r8, =1
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	mov	r0, r9
	mov	r1, r8
	bl	MAX
	mov	r9, r0
	ldr	r8, =1
	ldr	r10, =-84
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =2
	str	r9, [fp, #-88]

.L21:
	ldr	r9, [fp, #-88]
	ldr	r8, [fp, #-20]
	cmp	r9, r8
	blt	.L114
	ldr	r10, =1
	cmp	r10, #0
	b	.L23

.L114:
	ldr	r10, =0
	cmp	r10, #0
	b	.L22
	b	.L23

.L22:
	ldr	r9, [fp, #-88]
	ldr	r8, =2
	sub	r9, r9, r8
	ldr	r10, =-84
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, [fp, #-88]
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	add	r9, r8, r9
	ldr	r8, [fp, #-88]
	ldr	r7, =1
	sub	r8, r8, r7
	ldr	r10, =-84
	add	r10, r10, fp
	ldr	r8,	[r10, r8,LSL#2]
	mov	r0, r9
	mov	r1, r8
	bl	MAX
	mov	r9, r0
	ldr	r8, [fp, #-88]
	ldr	r10, =-84
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-88]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-88]
	b	.L21

.L23:
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	sub	r9, r9, r8
	ldr	r10, =-84
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	mov	r0, r9
	b	.L14

.L14:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	max_sum_no, .-max_sum_no

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	longest_co
	.type	longest_co, %function
longest_co:
	@ args = 0, pretend = 0, frame = 2260
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	ldr	r12, =2264
	sub	sp, sp, r12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r10, =-1052
	add	r10, r10, fp
	mov	r12, #0
	str	r12, [r10, #0]
	str	r12, [r10, #4]
	str	r12, [r10, #8]
	str	r12, [r10, #12]
	str	r12, [r10, #16]
	str	r12, [r10, #20]
	str	r12, [r10, #24]
	str	r12, [r10, #28]
	str	r12, [r10, #32]
	str	r12, [r10, #36]
	str	r12, [r10, #40]
	str	r12, [r10, #44]
	str	r12, [r10, #48]
	str	r12, [r10, #52]
	str	r12, [r10, #56]
	str	r12, [r10, #60]
	str	r12, [r10, #64]
	str	r12, [r10, #68]
	str	r12, [r10, #72]
	str	r12, [r10, #76]
	str	r12, [r10, #80]
	str	r12, [r10, #84]
	str	r12, [r10, #88]
	str	r12, [r10, #92]
	str	r12, [r10, #96]
	str	r12, [r10, #100]
	str	r12, [r10, #104]
	str	r12, [r10, #108]
	str	r12, [r10, #112]
	str	r12, [r10, #116]
	str	r12, [r10, #120]
	str	r12, [r10, #124]
	str	r12, [r10, #128]
	str	r12, [r10, #132]
	str	r12, [r10, #136]
	str	r12, [r10, #140]
	str	r12, [r10, #144]
	str	r12, [r10, #148]
	str	r12, [r10, #152]
	str	r12, [r10, #156]
	str	r12, [r10, #160]
	str	r12, [r10, #164]
	str	r12, [r10, #168]
	str	r12, [r10, #172]
	str	r12, [r10, #176]
	str	r12, [r10, #180]
	str	r12, [r10, #184]
	str	r12, [r10, #188]
	str	r12, [r10, #192]
	str	r12, [r10, #196]
	str	r12, [r10, #200]
	str	r12, [r10, #204]
	str	r12, [r10, #208]
	str	r12, [r10, #212]
	str	r12, [r10, #216]
	str	r12, [r10, #220]
	str	r12, [r10, #224]
	str	r12, [r10, #228]
	str	r12, [r10, #232]
	str	r12, [r10, #236]
	str	r12, [r10, #240]
	str	r12, [r10, #244]
	str	r12, [r10, #248]
	str	r12, [r10, #252]
	str	r12, [r10, #256]
	str	r12, [r10, #260]
	str	r12, [r10, #264]
	str	r12, [r10, #268]
	str	r12, [r10, #272]
	str	r12, [r10, #276]
	str	r12, [r10, #280]
	str	r12, [r10, #284]
	str	r12, [r10, #288]
	str	r12, [r10, #292]
	str	r12, [r10, #296]
	str	r12, [r10, #300]
	str	r12, [r10, #304]
	str	r12, [r10, #308]
	str	r12, [r10, #312]
	str	r12, [r10, #316]
	str	r12, [r10, #320]
	str	r12, [r10, #324]
	str	r12, [r10, #328]
	str	r12, [r10, #332]
	str	r12, [r10, #336]
	str	r12, [r10, #340]
	str	r12, [r10, #344]
	str	r12, [r10, #348]
	str	r12, [r10, #352]
	str	r12, [r10, #356]
	str	r12, [r10, #360]
	str	r12, [r10, #364]
	str	r12, [r10, #368]
	str	r12, [r10, #372]
	str	r12, [r10, #376]
	str	r12, [r10, #380]
	str	r12, [r10, #384]
	str	r12, [r10, #388]
	str	r12, [r10, #392]
	str	r12, [r10, #396]
	str	r12, [r10, #400]
	str	r12, [r10, #404]
	str	r12, [r10, #408]
	str	r12, [r10, #412]
	str	r12, [r10, #416]
	str	r12, [r10, #420]
	str	r12, [r10, #424]
	str	r12, [r10, #428]
	str	r12, [r10, #432]
	str	r12, [r10, #436]
	str	r12, [r10, #440]
	str	r12, [r10, #444]
	str	r12, [r10, #448]
	str	r12, [r10, #452]
	str	r12, [r10, #456]
	str	r12, [r10, #460]
	str	r12, [r10, #464]
	str	r12, [r10, #468]
	str	r12, [r10, #472]
	str	r12, [r10, #476]
	str	r12, [r10, #480]
	str	r12, [r10, #484]
	str	r12, [r10, #488]
	str	r12, [r10, #492]
	str	r12, [r10, #496]
	str	r12, [r10, #500]
	str	r12, [r10, #504]
	str	r12, [r10, #508]
	str	r12, [r10, #512]
	str	r12, [r10, #516]
	str	r12, [r10, #520]
	str	r12, [r10, #524]
	str	r12, [r10, #528]
	str	r12, [r10, #532]
	str	r12, [r10, #536]
	str	r12, [r10, #540]
	str	r12, [r10, #544]
	str	r12, [r10, #548]
	str	r12, [r10, #552]
	str	r12, [r10, #556]
	str	r12, [r10, #560]
	str	r12, [r10, #564]
	str	r12, [r10, #568]
	str	r12, [r10, #572]
	str	r12, [r10, #576]
	str	r12, [r10, #580]
	str	r12, [r10, #584]
	str	r12, [r10, #588]
	str	r12, [r10, #592]
	str	r12, [r10, #596]
	str	r12, [r10, #600]
	str	r12, [r10, #604]
	str	r12, [r10, #608]
	str	r12, [r10, #612]
	str	r12, [r10, #616]
	str	r12, [r10, #620]
	str	r12, [r10, #624]
	str	r12, [r10, #628]
	str	r12, [r10, #632]
	str	r12, [r10, #636]
	str	r12, [r10, #640]
	str	r12, [r10, #644]
	str	r12, [r10, #648]
	str	r12, [r10, #652]
	str	r12, [r10, #656]
	str	r12, [r10, #660]
	str	r12, [r10, #664]
	str	r12, [r10, #668]
	str	r12, [r10, #672]
	str	r12, [r10, #676]
	str	r12, [r10, #680]
	str	r12, [r10, #684]
	str	r12, [r10, #688]
	str	r12, [r10, #692]
	str	r12, [r10, #696]
	str	r12, [r10, #700]
	str	r12, [r10, #704]
	str	r12, [r10, #708]
	str	r12, [r10, #712]
	str	r12, [r10, #716]
	str	r12, [r10, #720]
	str	r12, [r10, #724]
	str	r12, [r10, #728]
	str	r12, [r10, #732]
	str	r12, [r10, #736]
	str	r12, [r10, #740]
	str	r12, [r10, #744]
	str	r12, [r10, #748]
	str	r12, [r10, #752]
	str	r12, [r10, #756]
	str	r12, [r10, #760]
	str	r12, [r10, #764]
	str	r12, [r10, #768]
	str	r12, [r10, #772]
	str	r12, [r10, #776]
	str	r12, [r10, #780]
	str	r12, [r10, #784]
	str	r12, [r10, #788]
	str	r12, [r10, #792]
	str	r12, [r10, #796]
	str	r12, [r10, #800]
	str	r12, [r10, #804]
	str	r12, [r10, #808]
	str	r12, [r10, #812]
	str	r12, [r10, #816]
	str	r12, [r10, #820]
	str	r12, [r10, #824]
	str	r12, [r10, #828]
	str	r12, [r10, #832]
	str	r12, [r10, #836]
	str	r12, [r10, #840]
	str	r12, [r10, #844]
	str	r12, [r10, #848]
	str	r12, [r10, #852]
	str	r12, [r10, #856]
	str	r12, [r10, #860]
	str	r12, [r10, #864]
	str	r12, [r10, #868]
	str	r12, [r10, #872]
	str	r12, [r10, #876]
	str	r12, [r10, #880]
	str	r12, [r10, #884]
	str	r12, [r10, #888]
	str	r12, [r10, #892]
	str	r12, [r10, #896]
	str	r12, [r10, #900]
	str	r12, [r10, #904]
	str	r12, [r10, #908]
	str	r12, [r10, #912]
	str	r12, [r10, #916]
	str	r12, [r10, #920]
	str	r12, [r10, #924]
	str	r12, [r10, #928]
	str	r12, [r10, #932]
	str	r12, [r10, #936]
	str	r12, [r10, #940]
	str	r12, [r10, #944]
	str	r12, [r10, #948]
	str	r12, [r10, #952]
	str	r12, [r10, #956]
	str	r12, [r10, #960]
	str	r12, [r10, #964]
	str	r12, [r10, #968]
	str	r12, [r10, #972]
	str	r12, [r10, #976]
	str	r12, [r10, #980]
	str	r12, [r10, #984]
	str	r12, [r10, #988]
	str	r12, [r10, #992]
	str	r12, [r10, #996]
	str	r12, [r10, #1000]
	str	r12, [r10, #1004]
	str	r12, [r10, #1008]
	str	r12, [r10, #1012]
	str	r12, [r10, #1016]
	str	r12, [r10, #1020]

	ldr	r9, =1
	str	r9, [fp, #-1056]

.L52:
	ldr	r9, [fp, #-1056]
	ldr	r8, [fp, #-20]
	cmp	r9, r8
	ble	.L115
	ldr	r10, =1
	cmp	r10, #0
	b	.L54

.L115:
	ldr	r10, =0
	cmp	r10, #0
	b	.L53
	b	.L54

.L53:
	ldr	r9, =1
	str	r9, [fp, #-1060]

.L61:
	ldr	r9, [fp, #-1060]
	ldr	r8, [fp, #-28]
	cmp	r9, r8
	ble	.L116
	ldr	r10, =1
	cmp	r10, #0
	b	.L63

.L116:
	ldr	r10, =0
	cmp	r10, #0
	b	.L62
	b	.L63

.L62:
	ldr	r9, [fp, #-1056]
	ldr	r8, =1
	sub	r9, r9, r8
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	ldr	r8, [fp, #-1060]
	ldr	r7, =1
	sub	r8, r8, r7
	ldr	r7, [fp, #-24]
	ldr	r8,	[r7, r8,LSL#2]
	cmp	r9, r8
	beq	.L67
	b	.L68

.L67:
	ldr	r9, [fp, #-1056]
	ldr	r8, =1
	sub	r9, r9, r8
	ldr	r8, [fp, #-1060]
	ldr	r7, =1
	sub	r8, r8, r7
	ldr	r7, =16
	mul	r9, r9, r7
	add	r9, r9, r8
	ldr	r10, =-1052
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =1
	add	r9, r8, r9
	ldr	r8, [fp, #-1056]
	ldr	r7, [fp, #-1060]
	ldr	r6, =16
	mul	r8, r8, r6
	add	r8, r8, r7
	ldr	r10, =-1052
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	b	.L69

.L68:
	ldr	r9, [fp, #-1056]
	ldr	r8, =1
	sub	r9, r9, r8
	ldr	r8, [fp, #-1060]
	ldr	r7, =16
	mul	r9, r9, r7
	add	r9, r9, r8
	ldr	r10, =-1052
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, [fp, #-1056]
	ldr	r7, [fp, #-1060]
	ldr	r6, =1
	sub	r7, r7, r6
	ldr	r6, =16
	mul	r8, r8, r6
	add	r8, r8, r7
	ldr	r10, =-1052
	add	r10, r10, fp
	ldr	r8,	[r10, r8,LSL#2]
	mov	r0, r9
	mov	r1, r8
	bl	MAX
	mov	r9, r0
	ldr	r8, [fp, #-1056]
	ldr	r7, [fp, #-1060]
	ldr	r6, =16
	mul	r8, r8, r6
	add	r8, r8, r7
	ldr	r10, =-1052
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]

.L69:
	ldr	r9, [fp, #-1060]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-1060]
	b	.L61

.L63:
	ldr	r9, [fp, #-1056]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-1056]
	b	.L52

.L54:
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-28]
	ldr	r7, =16
	mul	r9, r9, r7
	add	r9, r9, r8
	ldr	r10, =-1052
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	mov	r0, r9
	b	.L48

.L48:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	longest_co, .-longest_co

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 300
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #304
	ldr	r9, =8
	ldr	r10, =-72
	add	r10, r10, fp
	str	r9,	[r10, #0]
	ldr	r9, =7
	ldr	r10, =-72
	add	r10, r10, fp
	str	r9,	[r10, #4]
	ldr	r9, =4
	ldr	r10, =-72
	add	r10, r10, fp
	str	r9,	[r10, #8]
	ldr	r9, =1
	ldr	r10, =-72
	add	r10, r10, fp
	str	r9,	[r10, #12]
	ldr	r9, =2
	ldr	r10, =-72
	add	r10, r10, fp
	str	r9,	[r10, #16]
	ldr	r9, =7
	ldr	r10, =-72
	add	r10, r10, fp
	str	r9,	[r10, #20]
	ldr	r9, =0
	ldr	r10, =-72
	add	r10, r10, fp
	str	r9,	[r10, #24]
	ldr	r9, =1
	ldr	r10, =-72
	add	r10, r10, fp
	str	r9,	[r10, #28]
	ldr	r9, =9
	ldr	r10, =-72
	add	r10, r10, fp
	str	r9,	[r10, #32]
	ldr	r9, =3
	ldr	r10, =-72
	add	r10, r10, fp
	str	r9,	[r10, #36]
	ldr	r9, =4
	ldr	r10, =-72
	add	r10, r10, fp
	str	r9,	[r10, #40]
	ldr	r9, =8
	ldr	r10, =-72
	add	r10, r10, fp
	str	r9,	[r10, #44]
	ldr	r9, =3
	ldr	r10, =-72
	add	r10, r10, fp
	str	r9,	[r10, #48]
	ldr	r9, =7
	ldr	r10, =-72
	add	r10, r10, fp
	str	r9,	[r10, #52]
	ldr	r9, =0
	ldr	r10, =-72
	add	r10, r10, fp
	str	r9,	[r10, #56]
	ldr	r9, =3
	ldr	r10, =-124
	add	r10, r10, fp
	str	r9,	[r10, #0]
	ldr	r9, =9
	ldr	r10, =-124
	add	r10, r10, fp
	str	r9,	[r10, #4]
	ldr	r9, =7
	ldr	r10, =-124
	add	r10, r10, fp
	str	r9,	[r10, #8]
	ldr	r9, =1
	ldr	r10, =-124
	add	r10, r10, fp
	str	r9,	[r10, #12]
	ldr	r9, =4
	ldr	r10, =-124
	add	r10, r10, fp
	str	r9,	[r10, #16]
	ldr	r9, =2
	ldr	r10, =-124
	add	r10, r10, fp
	str	r9,	[r10, #20]
	ldr	r9, =4
	ldr	r10, =-124
	add	r10, r10, fp
	str	r9,	[r10, #24]
	ldr	r9, =3
	ldr	r10, =-124
	add	r10, r10, fp
	str	r9,	[r10, #28]
	ldr	r9, =6
	ldr	r10, =-124
	add	r10, r10, fp
	str	r9,	[r10, #32]
	ldr	r9, =8
	ldr	r10, =-124
	add	r10, r10, fp
	str	r9,	[r10, #36]
	ldr	r9, =0
	ldr	r10, =-124
	add	r10, r10, fp
	str	r9,	[r10, #40]
	ldr	r9, =1
	ldr	r10, =-124
	add	r10, r10, fp
	str	r9,	[r10, #44]
	ldr	r9, =5
	ldr	r10, =-124
	add	r10, r10, fp
	str	r9,	[r10, #48]
	ldr	r9, =-72
	add	r9, r11, r9
	ldr	r8, =15
	mov	r0, r9
	mov	r1, r8
	bl	max_sum_no
	mov	r9, r0
	mov	r0, r9
	bl	putint
	ldr	r9, =10
	mov	r0, r9
	bl	putch
	ldr	r9, =-72
	add	r9, r11, r9
	ldr	r8, =15
	ldr	r7, =-124
	add	r7, r11, r7
	ldr	r6, =13
	mov	r0, r9
	mov	r1, r8
	mov	r2, r7
	mov	r3, r6
	bl	longest_co
	mov	r9, r0
	mov	r0, r9
	bl	putint
	ldr	r9, =10
	mov	r0, r9
	bl	putch
	ldr	r9, =0
	mov	r0, r9
	b	.L112

.L112:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
