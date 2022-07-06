	.global	g
	.data
	.align	2
	.type	g, %object
	.size	g, 4
g:
	.word	0

	.global	h
	.data
	.align	2
	.type	h, %object
	.size	h, 4
h:
	.word	0

	.global	f
	.data
	.align	2
	.type	f, %object
	.size	f, 4
f:
	.word	0

	.global	e
	.data
	.align	2
	.type	e, %object
	.size	e, 4
e:
	.word	0


	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	EightWhile
	.type	EightWhile, %function
EightWhile:
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
	blt	.L186
	ldr	r10, =1
	cmp	r10, #0
	b	.L16

.L186:
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
	blt	.L187
	ldr	r10, =1
	cmp	r10, #0
	b	.L28

.L187:
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
	blt	.L188
	ldr	r10, =1
	cmp	r10, #0
	b	.L52

.L188:
	ldr	r10, =0
	cmp	r10, #0
	b	.L51
	b	.L52

.L51:
	ldr	r9, [fp, #-28]
	ldr	r8, =3
	add	r9, r8, r9
	str	r9, [fp, #-28]

.L62:
	movw	r9, #:lower16:e
	movt	r9, #:upper16:e
	ldr	r9, [r9, #0]
	ldr	r8, =1
	cmp	r9, r8
	bgt	.L189
	ldr	r10, =1
	cmp	r10, #0
	b	.L64

.L189:
	ldr	r10, =0
	cmp	r10, #0
	b	.L63
	b	.L64

.L63:
	movw	r9, #:lower16:e
	movt	r9, #:upper16:e
	ldr	r9, [r9, #0]
	ldr	r8, =1
	sub	r9, r9, r8
	movw	r10, #:lower16:e
	movt	r10, #:upper16:e
	str	r9, [r10, #0]

.L74:
	movw	r9, #:lower16:f
	movt	r9, #:upper16:f
	ldr	r9, [r9, #0]
	ldr	r8, =2
	cmp	r9, r8
	bgt	.L190
	ldr	r10, =1
	cmp	r10, #0
	b	.L76

.L190:
	ldr	r10, =0
	cmp	r10, #0
	b	.L75
	b	.L76

.L75:
	movw	r9, #:lower16:f
	movt	r9, #:upper16:f
	ldr	r9, [r9, #0]
	ldr	r8, =2
	sub	r9, r9, r8
	movw	r10, #:lower16:f
	movt	r10, #:upper16:f
	str	r9, [r10, #0]

.L86:
	movw	r9, #:lower16:g
	movt	r9, #:upper16:g
	ldr	r9, [r9, #0]
	ldr	r8, =3
	cmp	r9, r8
	blt	.L191
	ldr	r10, =1
	cmp	r10, #0
	b	.L88

.L191:
	ldr	r10, =0
	cmp	r10, #0
	b	.L87
	b	.L88

.L87:
	movw	r9, #:lower16:g
	movt	r9, #:upper16:g
	ldr	r9, [r9, #0]
	ldr	r8, =10
	add	r9, r8, r9
	movw	r10, #:lower16:g
	movt	r10, #:upper16:g
	str	r9, [r10, #0]

.L98:
	movw	r9, #:lower16:h
	movt	r9, #:upper16:h
	ldr	r9, [r9, #0]
	ldr	r8, =10
	cmp	r9, r8
	blt	.L192
	ldr	r10, =1
	cmp	r10, #0
	b	.L100

.L192:
	ldr	r10, =0
	cmp	r10, #0
	b	.L99
	b	.L100

.L99:
	movw	r9, #:lower16:h
	movt	r9, #:upper16:h
	ldr	r9, [r9, #0]
	ldr	r8, =8
	add	r9, r8, r9
	movw	r10, #:lower16:h
	movt	r10, #:upper16:h
	str	r9, [r10, #0]
	b	.L98

.L100:
	movw	r9, #:lower16:h
	movt	r9, #:upper16:h
	ldr	r9, [r9, #0]
	ldr	r8, =1
	sub	r9, r9, r8
	movw	r10, #:lower16:h
	movt	r10, #:upper16:h
	str	r9, [r10, #0]
	b	.L86

.L88:
	movw	r9, #:lower16:g
	movt	r9, #:upper16:g
	ldr	r9, [r9, #0]
	ldr	r8, =8
	sub	r9, r9, r8
	movw	r10, #:lower16:g
	movt	r10, #:upper16:g
	str	r9, [r10, #0]
	b	.L74

.L76:
	movw	r9, #:lower16:f
	movt	r9, #:upper16:f
	ldr	r9, [r9, #0]
	ldr	r8, =1
	add	r9, r8, r9
	movw	r10, #:lower16:f
	movt	r10, #:upper16:f
	str	r9, [r10, #0]
	b	.L62

.L64:
	movw	r9, #:lower16:e
	movt	r9, #:upper16:e
	ldr	r9, [r9, #0]
	ldr	r8, =1
	add	r9, r8, r9
	movw	r10, #:lower16:e
	movt	r10, #:upper16:e
	str	r9, [r10, #0]
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
	movw	r8, #:lower16:e
	movt	r8, #:upper16:e
	ldr	r8, [r8, #0]
	add	r8, r7, r8
	movw	r7, #:lower16:g
	movt	r7, #:upper16:g
	ldr	r7, [r7, #0]
	sub	r8, r8, r7
	movw	r7, #:lower16:h
	movt	r7, #:upper16:h
	ldr	r7, [r7, #0]
	add	r8, r7, r8
	sub	r9, r9, r8
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	EightWhile, .-EightWhile

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #32
	ldr	r9, =1
	movw	r10, #:lower16:g
	movt	r10, #:upper16:g
	str	r9, [r10, #0]
	ldr	r9, =2
	movw	r10, #:lower16:h
	movt	r10, #:upper16:h
	str	r9, [r10, #0]
	ldr	r9, =4
	movw	r10, #:lower16:e
	movt	r10, #:upper16:e
	str	r9, [r10, #0]
	ldr	r9, =6
	movw	r10, #:lower16:f
	movt	r10, #:upper16:f
	str	r9, [r10, #0]
	bl	EightWhile
	mov	r9, r0
	mov	r0, r9
	b	.L173

.L173:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
