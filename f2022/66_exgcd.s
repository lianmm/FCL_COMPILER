
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	exgcd
	.type	exgcd, %function
exgcd:
	@ args = 0, pretend = 0, frame = 68
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #72
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =0
	cmp	r9, r8
	beq	.L2
	b	.L3

.L2:
	ldr	r9, =1
	ldr	r8, =0
	ldr	r7, [fp, #-24]
	str	r9,	[r7, r8,LSL#2]
	ldr	r9, =0
	ldr	r8, =0
	ldr	r7, [fp, #-28]
	str	r9,	[r7, r8,LSL#2]
	ldr	r9, [fp, #-16]
	mov	r0, r9
	b	.L1
	b	.L4

.L3:
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-16]
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_idivmod
	mov	r7, r1
	ldr	r6, [fp, #-24]
	ldr	r5, [fp, #-28]
	mov	r0, r9
	mov	r1, r7
	mov	r2, r6
	mov	r3, r5
	bl	exgcd
	mov	r7, r0
	str	r7, [fp, #-32]
	ldr	r7, =0
	ldr	r6, [fp, #-24]
	ldr	r7,	[r6, r7,LSL#2]
	str	r7, [fp, #-36]
	ldr	r7, =0
	ldr	r6, [fp, #-28]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =0
	ldr	r5, [fp, #-24]
	str	r7,	[r5, r6,LSL#2]
	ldr	r7, [fp, #-36]
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_idiv
	mov	r9, r0
	ldr	r8, =0
	ldr	r6, [fp, #-28]
	ldr	r8,	[r6, r8,LSL#2]
	mul	r9, r8, r9
	sub	r9, r7, r9
	ldr	r8, =0
	ldr	r7, [fp, #-28]
	str	r9,	[r7, r8,LSL#2]
	ldr	r9, [fp, #-32]
	mov	r0, r9
	b	.L1

.L4:

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	exgcd, .-exgcd

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 108
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #112
	ldr	r9, =7
	str	r9, [fp, #-16]
	ldr	r9, =15
	str	r9, [fp, #-20]
	ldr	r9, =1
	ldr	r10, =-24
	add	r10, r10, fp
	str	r9,	[r10, #0]
	ldr	r9, =1
	ldr	r10, =-28
	add	r10, r10, fp
	str	r9,	[r10, #0]
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-20]
	ldr	r7, =-24
	add	r7, r11, r7
	ldr	r6, =-28
	add	r6, r11, r6
	mov	r0, r9
	mov	r1, r8
	mov	r2, r7
	mov	r3, r6
	bl	exgcd
	mov	r12, r0
	ldr	r9, =0
	ldr	r10, =-24
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	add	r9, r8, r9
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	ldr	r8, =0
	ldr	r10, =-24
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =0
	ldr	r10, =-24
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	mov	r0, r9
	bl	putint
	ldr	r9, =0
	mov	r0, r9
	b	.L32

.L32:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
