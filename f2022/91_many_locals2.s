	.global	n
	.data
	.align	2
	.type	n, %object
	.size	n, 4
n:
	.word	0


	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 260
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #264
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-136]

.L5:
	ldr	r9, [fp, #-136]
	ldr	r8, =5
	cmp	r9, r8
	beq	.L6
	b	.L7

.L6:
	ldr	r9, [fp, #-136]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-136]
	b	.L5

.L7:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	add	r8, r8, r9
	str	r8, [fp, #-20]
	ldr	r8, [fp, #-20]
	ldr	r7, =1
	add	r7, r7, r8
	str	r7, [fp, #-24]
	ldr	r7, [fp, #-24]
	ldr	r6, =1
	add	r6, r6, r7
	str	r6, [fp, #-28]
	ldr	r6, [fp, #-28]
	ldr	r5, =1
	add	r5, r5, r6
	str	r5, [fp, #-32]
	ldr	r5, [fp, #-32]
	ldr	r4, =1
	add	r4, r4, r5
	str	r4, [fp, #-36]
	ldr	r4, [fp, #-36]
	ldr	r3, =1
	add	r3, r3, r4
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	ldr	r2, =1
	add	r2, r2, r3
	str	r2, [fp, #-44]
	ldr	r2, [fp, #-44]
	ldr	r1, =1
	add	r1, r1, r2
	str	r1, [fp, #-48]
	ldr	r1, [fp, #-48]
	ldr	r0, =1
	add	r0, r0, r1
	str	r0, [fp, #-52]
	ldr	r0, [fp, #-52]
	str	r1, [fp, #-148]
	ldr	r1, =1
	add	r1, r1, r0
	str	r1, [fp, #-56]
	ldr	r1, [fp, #-56]
	str	r0, [fp, #-152]
	ldr	r0, =1
	add	r0, r0, r1
	str	r0, [fp, #-60]
	ldr	r0, [fp, #-60]
	str	r1, [fp, #-156]
	ldr	r1, =1
	add	r1, r1, r0
	str	r1, [fp, #-64]
	ldr	r1, [fp, #-64]
	str	r0, [fp, #-160]
	ldr	r0, =1
	add	r0, r0, r1
	str	r0, [fp, #-68]
	ldr	r0, [fp, #-68]
	str	r1, [fp, #-164]
	ldr	r1, =1
	add	r1, r1, r0
	str	r1, [fp, #-72]
	ldr	r1, [fp, #-72]
	str	r0, [fp, #-168]
	ldr	r0, =1
	add	r0, r0, r1
	str	r0, [fp, #-76]
	ldr	r0, [fp, #-76]
	str	r1, [fp, #-172]
	ldr	r1, =1
	add	r1, r1, r0
	str	r1, [fp, #-80]
	ldr	r1, [fp, #-80]
	str	r0, [fp, #-176]
	ldr	r0, =1
	add	r0, r0, r1
	str	r0, [fp, #-84]
	ldr	r0, [fp, #-84]
	str	r1, [fp, #-180]
	ldr	r1, =1
	add	r1, r1, r0
	str	r1, [fp, #-88]
	ldr	r1, [fp, #-88]
	str	r0, [fp, #-184]
	ldr	r0, =1
	add	r0, r0, r1
	str	r0, [fp, #-92]
	ldr	r0, [fp, #-92]
	str	r1, [fp, #-188]
	ldr	r1, =1
	add	r1, r1, r0
	str	r1, [fp, #-96]
	ldr	r1, [fp, #-96]
	str	r0, [fp, #-192]
	ldr	r0, =1
	add	r0, r0, r1
	str	r0, [fp, #-100]
	ldr	r0, [fp, #-100]
	str	r1, [fp, #-196]
	ldr	r1, =1
	add	r1, r1, r0
	str	r1, [fp, #-104]
	ldr	r1, [fp, #-104]
	str	r0, [fp, #-200]
	ldr	r0, =1
	add	r0, r0, r1
	str	r0, [fp, #-108]
	ldr	r0, [fp, #-108]
	str	r1, [fp, #-204]
	ldr	r1, =1
	add	r1, r1, r0
	str	r1, [fp, #-112]
	ldr	r1, [fp, #-112]
	str	r0, [fp, #-208]
	ldr	r0, =1
	add	r0, r0, r1
	str	r0, [fp, #-116]
	ldr	r0, [fp, #-116]
	str	r1, [fp, #-212]
	ldr	r1, =1
	add	r1, r1, r0
	str	r1, [fp, #-120]
	ldr	r1, [fp, #-120]
	str	r0, [fp, #-216]
	ldr	r0, =1
	add	r0, r0, r1
	str	r0, [fp, #-124]
	ldr	r0, [fp, #-124]
	str	r1, [fp, #-220]
	ldr	r1, =1
	add	r1, r1, r0
	str	r1, [fp, #-128]
	ldr	r1, [fp, #-128]
	str	r0, [fp, #-224]
	ldr	r0, =1
	add	r0, r0, r1
	str	r0, [fp, #-132]
	mov	r10, r0
	mov	r0, r9
	mov	r9, r10
	bl	putint
	mov	r10, r0
	mov	r0, r8
	mov	r8, r10
	bl	putint
	mov	r10, r0
	mov	r0, r7
	mov	r7, r10
	bl	putint
	mov	r10, r0
	mov	r0, r6
	mov	r6, r10
	bl	putint
	mov	r10, r0
	mov	r0, r5
	mov	r5, r10
	bl	putint
	mov	r10, r0
	mov	r0, r4
	mov	r4, r10
	bl	putint
	mov	r10, r0
	mov	r0, r3
	mov	r3, r10
	bl	putint
	mov	r10, r0
	mov	r0, r2
	mov	r2, r10
	bl	putint
	ldr	r12, [fp, #-148]
	mov	r10, r0
	mov	r0, r12
	mov	r12, r10
	bl	putint
	ldr	r12, [fp, #-152]
	mov	r10, r0
	mov	r0, r12
	mov	r12, r10
	bl	putint
	ldr	r12, [fp, #-156]
	mov	r10, r0
	mov	r0, r12
	mov	r12, r10
	bl	putint
	ldr	r12, [fp, #-160]
	mov	r10, r0
	mov	r0, r12
	mov	r12, r10
	bl	putint
	ldr	r12, [fp, #-164]
	mov	r10, r0
	mov	r0, r12
	mov	r12, r10
	bl	putint
	ldr	r12, [fp, #-168]
	mov	r10, r0
	mov	r0, r12
	mov	r12, r10
	bl	putint
	ldr	r12, [fp, #-172]
	mov	r10, r0
	mov	r0, r12
	mov	r12, r10
	bl	putint
	ldr	r12, [fp, #-176]
	mov	r10, r0
	mov	r0, r12
	mov	r12, r10
	bl	putint
	ldr	r12, [fp, #-180]
	mov	r10, r0
	mov	r0, r12
	mov	r12, r10
	bl	putint
	ldr	r12, [fp, #-184]
	mov	r10, r0
	mov	r0, r12
	mov	r12, r10
	bl	putint
	ldr	r12, [fp, #-188]
	mov	r10, r0
	mov	r0, r12
	mov	r12, r10
	bl	putint
	ldr	r12, [fp, #-192]
	mov	r10, r0
	mov	r0, r12
	mov	r12, r10
	bl	putint
	ldr	r12, [fp, #-196]
	mov	r10, r0
	mov	r0, r12
	mov	r12, r10
	bl	putint
	ldr	r12, [fp, #-200]
	mov	r10, r0
	mov	r0, r12
	mov	r12, r10
	bl	putint
	ldr	r12, [fp, #-204]
	mov	r10, r0
	mov	r0, r12
	mov	r12, r10
	bl	putint
	ldr	r12, [fp, #-208]
	mov	r10, r0
	mov	r0, r12
	mov	r12, r10
	bl	putint
	ldr	r12, [fp, #-212]
	mov	r10, r0
	mov	r0, r12
	mov	r12, r10
	bl	putint
	ldr	r12, [fp, #-216]
	mov	r10, r0
	mov	r0, r12
	mov	r12, r10
	bl	putint
	ldr	r12, [fp, #-220]
	mov	r10, r0
	mov	r0, r12
	mov	r12, r10
	bl	putint
	ldr	r12, [fp, #-224]
	mov	r10, r0
	mov	r0, r12
	mov	r12, r10
	bl	putint
	mov	r10, r0
	mov	r0, r1
	mov	r1, r10
	bl	putint
	ldr	r9, [fp, #-132]
	mov	r10, r0
	mov	r0, r9
	mov	r9, r10
	bl	putint
	ldr	r9, =10
	str	r9, [fp, #-144]
	ldr	r9, [fp, #-144]
	mov	r10, r0
	mov	r0, r9
	mov	r9, r10
	bl	putch
	ldr	r8, [fp, #-136]
	mov	r10, r0
	mov	r0, r8
	mov	r8, r10
	bl	putint
	mov	r10, r0
	mov	r0, r8
	mov	r8, r10
	bl	putch
	ldr	r12, [fp, #-216]
	mov	r0, r12
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
