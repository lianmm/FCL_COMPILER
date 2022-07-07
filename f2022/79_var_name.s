
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 228
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #232
	ldr	r9, =2
	str	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r10, =-100
	add	r10, r10, fp
	str	r8,	[r10, #0]
	ldr	r7, =2
	ldr	r10, =-100
	add	r10, r10, fp
	str	r7,	[r10, #4]
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

	ldr	r6, =0
	str	r6, [fp, #-104]

.L2:
	ldr	r5, [fp, #-16]
	ldr	r4, =20
	cmp	r5, r4
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
	ldr	r2, [fp, #-16]
	ldr	r10, =-100
	add	r10, r10, fp
	ldr	r1,	[r10, r2,LSL#2]
	ldr	r0, [fp, #-16]
	str	r8, [fp, #-112]
	ldr	r8, =1
	str	r0, [fp, #-116]
	sub	r0, r0, r8
	str	r3, [fp, #-120]
	ldr	r10, =-100
	add	r10, r10, fp
	ldr	r3,	[r10, r0,LSL#2]
	str	r7, [fp, #-124]
	add	r7, r3, r1
	str	r4, [fp, #-128]
	ldr	r4, [fp, #-16]
	str	r8, [fp, #-132]
	ldr	r8, =2
	str	r4, [fp, #-136]
	sub	r4, r4, r8
	str	r4, [fp, #-140]
	ldr	r10, =-100
	add	r10, r10, fp
	ldr	r4,	[r10, r4,LSL#2]
	str	r8, [fp, #-144]
	add	r8, r4, r7
	str	r4, [fp, #-148]
	ldr	r4, [fp, #-16]
	ldr	r10, =-100
	add	r10, r10, fp
	str	r8,	[r10, r4,LSL#2]
	str	r8, [fp, #-152]
	ldr	r8, [fp, #-104]
	str	r2, [fp, #-156]
	ldr	r2, [fp, #-16]
	str	r5, [fp, #-160]
	ldr	r10, =-100
	add	r10, r10, fp
	ldr	r5,	[r10, r2,LSL#2]
	str	r8, [fp, #-164]
	add	r8, r5, r8
	str	r8, [fp, #-104]
	str	r8, [fp, #-168]
	ldr	r8, [fp, #-16]
	str	r2, [fp, #-172]
	ldr	r10, =-100
	add	r10, r10, fp
	ldr	r2,	[r10, r8,LSL#2]
	mov	r10, r0
	mov	r0, r2
	mov	r2, r10
	bl	putint
	str	r0, [fp, #-176]
	ldr	r0, =10
	mov	r10, r0
	mov	r0, r0
	mov	r0, r10
	bl	putch
	str	r0, [fp, #-180]
	ldr	r0, [fp, #-16]
	str	r8, [fp, #-184]
	ldr	r8, =1
	str	r8, [fp, #-188]
	add	r8, r8, r0
	str	r8, [fp, #-16]
	b	.L2

.L4:
	str	r8, [fp, #-192]
	ldr	r8, [fp, #-104]
	mov	r0, r8
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
