
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	ifWhile
	.type	ifWhile, %function
ifWhile:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #28
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =3
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-16]
	ldr	r8, =5
	cmp	r9, r8
	beq	.L8
	b	.L9

.L8:

.L14:
	ldr	r9, [fp, #-20]
	ldr	r8, =2
	cmp	r9, r8
	beq	.L15
	b	.L16

.L15:
	ldr	r9, [fp, #-20]
	ldr	r8, =2
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L14

.L16:
	ldr	r9, [fp, #-20]
	ldr	r8, =25
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L10

.L9:

.L32:
	ldr	r9, [fp, #-16]
	ldr	r8, =5
	cmp	r9, r8
	blt	.L51
	ldr	r10, =1
	cmp	r10, #0
	b	.L34

.L51:
	ldr	r10, =0
	cmp	r10, #0
	b	.L33
	b	.L34

.L33:
	ldr	r9, [fp, #-20]
	ldr	r8, =2
	mul	r9, r8, r9
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-16]
	b	.L32

.L34:

.L10:
	ldr	r9, [fp, #-20]
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	ifWhile, .-ifWhile

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #16
	bl	ifWhile
	mov	r9, r0
	mov	r0, r9
	b	.L50

.L50:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
