
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	FourWhile
	.type	FourWhile, %function
FourWhile:
	@ args = 0, pretend = 0, frame = 36
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #40
	ldr	r9, =5
	str	r9, [fp, #-16]
	ldr	r9, =6
	str	r9, [fp, #-20]
	ldr	r9, =7
	str	r9, [fp, #-24]
	ldr	r9, =10
	str	r9, [fp, #-28]

.L14:
	ldr	r9, [fp, #-16]
	ldr	r8, =20
	cmp	r9, r8
	blt	.L90
	ldr	r10, =1
	cmp	r10, #0
	b	.L16

.L90:
	ldr	r10, =0
	cmp	r10, #0
	b	.L15
	b	.L16

.L15:
	ldr	r9, [fp, #-16]
	ldr	r8, =3
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L26:
	ldr	r9, [fp, #-20]
	ldr	r8, =10
	cmp	r9, r8
	blt	.L91
	ldr	r10, =1
	cmp	r10, #0
	b	.L28

.L91:
	ldr	r10, =0
	cmp	r10, #0
	b	.L27
	b	.L28

.L27:
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]

.L38:
	ldr	r9, [fp, #-24]
	ldr	r8, =7
	cmp	r9, r8
	beq	.L39
	b	.L40

.L39:
	ldr	r9, [fp, #-24]
	ldr	r8, =1
	sub	r9, r9, r8
	str	r9, [fp, #-24]

.L50:
	ldr	r9, [fp, #-28]
	ldr	r8, =20
	cmp	r9, r8
	blt	.L92
	ldr	r10, =1
	cmp	r10, #0
	b	.L52

.L92:
	ldr	r10, =0
	cmp	r10, #0
	b	.L51
	b	.L52

.L51:
	ldr	r9, [fp, #-28]
	ldr	r8, =3
	add	r9, r8, r9
	str	r9, [fp, #-28]
	b	.L50

.L52:
	ldr	r9, [fp, #-28]
	ldr	r8, =1
	sub	r9, r9, r8
	str	r9, [fp, #-28]
	b	.L38

.L40:
	ldr	r9, [fp, #-24]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-24]
	b	.L26

.L28:
	ldr	r9, [fp, #-20]
	ldr	r8, =2
	sub	r9, r9, r8
	str	r9, [fp, #-20]
	b	.L14

.L16:
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-20]
	ldr	r7, [fp, #-28]
	add	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, [fp, #-24]
	add	r9, r8, r9
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	FourWhile, .-FourWhile

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
	bl	FourWhile
	mov	r9, r0
	mov	r0, r9
	b	.L89

.L89:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
