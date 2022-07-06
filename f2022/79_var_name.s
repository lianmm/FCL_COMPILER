
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 116
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #120
	ldr	r9, =2
	str	r9, [fp, #-16]
	ldr	r9, =1
	ldr	r10, =-100
	add	r10, r10, fp
	str	r9,	[r10, #0]
	ldr	r9, =2
	ldr	r10, =-100
	add	r10, r10, fp
	str	r9,	[r10, #4]
	ldr	r10, =-100
	add	r10, r10, fp
	mov	r12, #0
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

	ldr	r9, =0
	str	r9, [fp, #-104]

.L2:
	ldr	r9, [fp, #-16]
	ldr	r8, =20
	cmp	r9, r8
	blt	.L35
	ldr	r10, =1
	cmp	r10, #0
	b	.L4

.L35:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3
	b	.L4

.L3:
	ldr	r9, [fp, #-16]
	ldr	r10, =-100
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, [fp, #-16]
	ldr	r7, =1
	sub	r8, r8, r7
	ldr	r10, =-100
	add	r10, r10, fp
	ldr	r8,	[r10, r8,LSL#2]
	add	r9, r8, r9
	ldr	r8, [fp, #-16]
	ldr	r7, =2
	sub	r8, r8, r7
	ldr	r10, =-100
	add	r10, r10, fp
	ldr	r8,	[r10, r8,LSL#2]
	add	r9, r8, r9
	ldr	r8, [fp, #-16]
	ldr	r10, =-100
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-104]
	ldr	r8, [fp, #-16]
	ldr	r10, =-100
	add	r10, r10, fp
	ldr	r8,	[r10, r8,LSL#2]
	add	r9, r8, r9
	str	r9, [fp, #-104]
	ldr	r9, [fp, #-16]
	ldr	r10, =-100
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	mov	r0, r9
	bl	putint
	ldr	r9, =10
	mov	r0, r9
	bl	putch
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-16]
	b	.L2

.L4:
	ldr	r9, [fp, #-104]
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
