
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	move
	.type	move, %function
move:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #32
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r9, [fp, #-16]
	mov	r0, r9
	bl	putint
	ldr	r9, =32
	mov	r0, r9
	bl	putch
	ldr	r9, [fp, #-20]
	mov	r0, r9
	bl	putint
	ldr	r9, =44
	mov	r0, r9
	bl	putch
	ldr	r9, =32
	mov	r0, r9
	bl	putch

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	move, .-move

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	hanoi
	.type	hanoi, %function
hanoi:
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #84
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	cmp	r9, r8
	beq	.L3
	b	.L4

.L3:
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-28]
	mov	r0, r9
	mov	r1, r8
	bl	move
	b	.L5

.L4:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	sub	r8, r9, r8
	ldr	r7, [fp, #-20]
	ldr	r6, [fp, #-28]
	ldr	r5, [fp, #-24]
	mov	r0, r8
	mov	r1, r7
	mov	r2, r6
	mov	r3, r5
	bl	hanoi
	mov	r0, r7
	mov	r1, r6
	bl	move
	ldr	r8, =1
	sub	r9, r9, r8
	mov	r0, r9
	mov	r1, r5
	mov	r2, r7
	mov	r3, r6
	bl	hanoi

.L5:

.L2:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	hanoi, .-hanoi

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #68
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-16]

.L16:
	ldr	r9, [fp, #-16]
	ldr	r8, =0
	cmp	r9, r8
	bgt	.L28
	ldr	r10, =1
	cmp	r10, #0
	b	.L18

.L28:
	ldr	r10, =0
	cmp	r10, #0
	b	.L17
	b	.L18

.L17:
	bl	getint
	mov	r9, r0
	ldr	r8, =1
	ldr	r7, =2
	ldr	r6, =3
	mov	r0, r9
	mov	r1, r8
	mov	r2, r7
	mov	r3, r6
	bl	hanoi
	ldr	r9, =10
	mov	r0, r9
	bl	putch
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	sub	r9, r9, r8
	str	r9, [fp, #-16]
	b	.L16

.L18:
	ldr	r9, =0
	mov	r0, r9
	b	.L15

.L15:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
