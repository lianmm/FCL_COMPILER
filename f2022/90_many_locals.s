
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	foo
	.type	foo, %function
foo:
	@ args = 0, pretend = 0, frame = 160
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #164
	ldr	r9, =0
	ldr	r10, =-76
	add	r10, r10, fp
	str	r9,	[r10, #0]
	ldr	r9, =1
	ldr	r10, =-76
	add	r10, r10, fp
	str	r9,	[r10, #4]
	ldr	r9, =2
	ldr	r10, =-76
	add	r10, r10, fp
	str	r9,	[r10, #8]
	ldr	r9, =3
	ldr	r10, =-76
	add	r10, r10, fp
	str	r9,	[r10, #12]
	ldr	r9, =0
	ldr	r10, =-76
	add	r10, r10, fp
	str	r9,	[r10, #16]
	ldr	r9, =1
	ldr	r10, =-76
	add	r10, r10, fp
	str	r9,	[r10, #20]
	ldr	r9, =2
	ldr	r10, =-76
	add	r10, r10, fp
	str	r9,	[r10, #24]
	ldr	r9, =3
	ldr	r10, =-76
	add	r10, r10, fp
	str	r9,	[r10, #28]
	ldr	r9, =0
	ldr	r10, =-76
	add	r10, r10, fp
	str	r9,	[r10, #32]
	ldr	r9, =1
	ldr	r10, =-76
	add	r10, r10, fp
	str	r9,	[r10, #36]
	ldr	r9, =2
	ldr	r10, =-76
	add	r10, r10, fp
	str	r9,	[r10, #40]
	ldr	r9, =3
	ldr	r10, =-76
	add	r10, r10, fp
	str	r9,	[r10, #44]
	ldr	r9, =0
	ldr	r10, =-76
	add	r10, r10, fp
	str	r9,	[r10, #48]
	ldr	r9, =1
	ldr	r10, =-76
	add	r10, r10, fp
	str	r9,	[r10, #52]
	ldr	r9, =2
	ldr	r10, =-76
	add	r10, r10, fp
	str	r9,	[r10, #56]
	ldr	r9, =3
	ldr	r10, =-76
	add	r10, r10, fp
	str	r9,	[r10, #60]
	ldr	r9, =3
	str	r9, [fp, #-80]
	ldr	r9, =7
	str	r9, [fp, #-84]
	ldr	r9, =5
	str	r9, [fp, #-88]
	ldr	r9, =6
	str	r9, [fp, #-92]
	ldr	r9, =1
	str	r9, [fp, #-96]
	ldr	r9, =0
	str	r9, [fp, #-100]
	ldr	r9, =3
	str	r9, [fp, #-104]
	ldr	r9, =5
	str	r9, [fp, #-108]
	ldr	r9, =4
	str	r9, [fp, #-112]
	ldr	r9, =2
	str	r9, [fp, #-116]
	ldr	r9, =7
	str	r9, [fp, #-120]
	ldr	r9, =9
	str	r9, [fp, #-124]
	ldr	r9, =8
	str	r9, [fp, #-128]
	ldr	r9, =1
	str	r9, [fp, #-132]
	ldr	r9, =4
	str	r9, [fp, #-136]
	ldr	r9, =6
	str	r9, [fp, #-140]
	ldr	r9, [fp, #-80]
	ldr	r8, [fp, #-84]
	add	r8, r8, r9
	ldr	r7, [fp, #-88]
	add	r8, r7, r8
	ldr	r7, [fp, #-92]
	add	r8, r7, r8
	ldr	r7, [fp, #-96]
	add	r8, r7, r8
	ldr	r7, [fp, #-100]
	add	r8, r7, r8
	ldr	r7, [fp, #-104]
	add	r8, r7, r8
	ldr	r7, [fp, #-108]
	add	r8, r7, r8
	str	r8, [fp, #-144]
	ldr	r8, [fp, #-112]
	ldr	r7, [fp, #-116]
	add	r8, r7, r8
	ldr	r7, [fp, #-120]
	add	r8, r7, r8
	ldr	r7, [fp, #-124]
	add	r8, r7, r8
	ldr	r7, [fp, #-128]
	add	r8, r7, r8
	ldr	r7, [fp, #-132]
	add	r8, r7, r8
	ldr	r7, [fp, #-136]
	add	r8, r7, r8
	ldr	r7, [fp, #-140]
	add	r8, r7, r8
	str	r8, [fp, #-148]
	ldr	r8, [fp, #-144]
	ldr	r7, [fp, #-148]
	add	r8, r7, r8
	ldr	r10, =-76
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	add	r9, r9, r8
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	foo, .-foo

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 396
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #400
	ldr	r9, =3
	str	r9, [fp, #-16]
	ldr	r9, =7
	str	r9, [fp, #-20]
	ldr	r9, =5
	str	r9, [fp, #-24]
	ldr	r9, =6
	str	r9, [fp, #-28]
	ldr	r9, =1
	str	r9, [fp, #-32]
	ldr	r9, =0
	str	r9, [fp, #-36]
	ldr	r9, =3
	str	r9, [fp, #-40]
	ldr	r9, =5
	str	r9, [fp, #-44]
	ldr	r9, =4
	str	r9, [fp, #-48]
	ldr	r9, =2
	str	r9, [fp, #-52]
	ldr	r9, =7
	str	r9, [fp, #-56]
	ldr	r9, =9
	str	r9, [fp, #-60]
	ldr	r9, =8
	str	r9, [fp, #-64]
	ldr	r9, =1
	str	r9, [fp, #-68]
	ldr	r9, =4
	str	r9, [fp, #-72]
	ldr	r9, =6
	str	r9, [fp, #-76]
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-20]
	add	r9, r8, r9
	ldr	r8, [fp, #-24]
	add	r9, r8, r9
	ldr	r8, [fp, #-28]
	add	r9, r8, r9
	ldr	r8, [fp, #-32]
	add	r9, r8, r9
	ldr	r8, [fp, #-36]
	add	r9, r8, r9
	ldr	r8, [fp, #-40]
	add	r9, r8, r9
	ldr	r8, [fp, #-44]
	add	r9, r8, r9
	str	r9, [fp, #-80]
	ldr	r9, [fp, #-48]
	ldr	r8, [fp, #-52]
	add	r7, r8, r9
	ldr	r6, [fp, #-56]
	add	r7, r6, r7
	ldr	r5, [fp, #-60]
	add	r7, r5, r7
	ldr	r4, [fp, #-64]
	add	r7, r4, r7
	ldr	r3, [fp, #-68]
	add	r7, r3, r7
	ldr	r2, [fp, #-72]
	add	r7, r2, r7
	ldr	r1, [fp, #-76]
	add	r7, r1, r7
	str	r7, [fp, #-84]
	ldr	r7, [fp, #-80]
	bl	foo
	mov	r0, r0
	add	r7, r0, r7
	str	r7, [fp, #-80]
	ldr	r0, =4
	str	r0, [fp, #-88]
	ldr	r0, =7
	str	r0, [fp, #-92]
	ldr	r0, =2
	str	r0, [fp, #-96]
	ldr	r0, =5
	str	r0, [fp, #-100]
	ldr	r0, =8
	str	r0, [fp, #-104]
	ldr	r0, =0
	str	r0, [fp, #-108]
	ldr	r0, =6
	str	r0, [fp, #-112]
	ldr	r0, =3
	str	r0, [fp, #-116]
	ldr	r0, [fp, #-84]
	str	r7, [fp, #-128]
	bl	foo
	mov	r7, r0
	add	r7, r7, r0
	str	r7, [fp, #-84]
	str	r9, [fp, #-16]
	str	r8, [fp, #-20]
	str	r6, [fp, #-24]
	str	r5, [fp, #-28]
	str	r4, [fp, #-32]
	str	r3, [fp, #-36]
	str	r2, [fp, #-40]
	str	r1, [fp, #-44]
	ldr	r9, [fp, #-88]
	ldr	r8, [fp, #-92]
	add	r9, r8, r9
	ldr	r8, [fp, #-96]
	add	r9, r8, r9
	ldr	r8, [fp, #-100]
	add	r9, r8, r9
	ldr	r8, [fp, #-104]
	add	r9, r8, r9
	ldr	r8, [fp, #-108]
	add	r9, r8, r9
	ldr	r8, [fp, #-112]
	add	r9, r8, r9
	ldr	r8, [fp, #-116]
	add	r9, r8, r9
	str	r9, [fp, #-120]
	ldr	r12, [fp, #-128]
	add	r9, r7, r12
	ldr	r8, [fp, #-120]
	add	r9, r8, r9
	str	r9, [fp, #-124]
	ldr	r9, [fp, #-124]
	mov	r10, r0
	mov	r0, r9
	mov	r9, r10
	bl	putint
	ldr	r9, =10
	mov	r10, r0
	mov	r0, r9
	mov	r9, r10
	bl	putch
	ldr	r9, =0
	mov	r0, r9
	b	.L50

.L50:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
