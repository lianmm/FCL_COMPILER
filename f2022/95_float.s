
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	float_abs
	.type	float_abs, %function
float_abs:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-16]
	ldr	r9, [fp, #-16]
	ldr	r8, =0
	cmp	r9, r8
	blt	.L118
	ldr	r10, =1
	cmp	r10, #0
	b	.L24

.L118:
	ldr	r10, =0
	cmp	r10, #0
	b	.L23
	b	.L24

.L23:
	rsb	r9, r9, #0
	mov	r0, r9
	b	.L22

.L24:
	ldr	r9, [fp, #-16]
	mov	r0, r9
	b	.L22

.L22:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	float_abs, .-float_abs

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	circle_are
	.type	circle_are, %function
circle_are:
	@ args = 0, pretend = 0, frame = 52
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #56
	str	r0, [fp, #-16]
	ldr	r9, =0
	ldr	r8, [fp, #-16]
	mul	r9, r8, r9
	mul	r9, r8, r9
	mul	r8, r8, r8
	ldr	r7, =0
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	mov	r0, r9
	b	.L28

.L28:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	circle_are, .-circle_are

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	float_eq
	.type	float_eq, %function
float_eq:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #60
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-20]
	sub	r9, r9, r8
	mov	r0, r9
	bl	float_abs
	mov	r9, r0
	ldr	r8, =0
	cmp	r9, r8
	blt	.L119
	ldr	r10, =1
	cmp	r10, #0
	b	.L49

.L119:
	ldr	r10, =0
	cmp	r10, #0
	b	.L48
	b	.L49

.L48:
	ldr	r9, =-nan
	mov	r0, r9
	b	.L47
	b	.L50

.L49:
	ldr	r9, =0
	mov	r0, r9
	b	.L47

.L50:

.L47:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	float_eq, .-float_eq

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	error
	.type	error, %function
error:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #36
	ldr	r9, =101
	mov	r0, r9
	bl	putch
	ldr	r9, =114
	mov	r0, r9
	bl	putch
	ldr	r9, =114
	mov	r0, r9
	bl	putch
	ldr	r9, =111
	mov	r0, r9
	bl	putch
	ldr	r9, =114
	mov	r0, r9
	bl	putch
	ldr	r9, =10
	mov	r0, r9
	bl	putch

.L63:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	error, .-error

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	ok
	.type	ok, %function
ok:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #24
	ldr	r9, =111
	mov	r0, r9
	bl	putch
	ldr	r9, =107
	mov	r0, r9
	bl	putch
	ldr	r9, =10
	mov	r0, r9
	bl	putch

.L64:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	ok, .-ok

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	assert
	.type	assert, %function
assert:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-16]
	ldr	r9, [fp, #-16]
	cmp	r9, #0
	beq	.L66
	b	.L67

.L66:
	bl	error
	b	.L68

.L67:
	bl	ok

.L68:

.L65:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	assert, .-assert

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	assert_not
	.type	assert_not, %function
assert_not:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #32
	str	r0, [fp, #-16]
	ldr	r9, [fp, #-16]
	cmp	r9, #0
	bne	.L120
	ldr	r10, =1
	cmp	r10, #0
	b	.L71

.L120:
	ldr	r10, =0
	cmp	r10, #0
	b	.L70
	b	.L71

.L70:
	bl	error
	b	.L72

.L71:
	bl	ok

.L72:

.L69:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	assert_not, .-assert_not

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 92
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #96
	ldr	r9, =0

	mov	r1, r9
	bl	float_eq
	mov	r9, r0
	mov	r0, r9
	bl	assert_not
	ldr	r9, =0
	ldr	r8, =0
	mov	r0, r9
	mov	r1, r8
	bl	float_eq
	mov	r9, r0
	mov	r0, r9
	bl	assert_not
	ldr	r9, =0
	ldr	r8, =0
	mov	r0, r9
	mov	r1, r8
	bl	float_eq
	mov	r9, r0
	mov	r0, r9
	bl	assert
	ldr	r9, =0
	mov	r0, r9
	bl	circle_are
	mov	r9, r0
	ldr	r8, =0
	mov	r0, r8
	bl	circle_are
	mov	r8, r0
	mov	r0, r9
	mov	r1, r8
	bl	float_eq
	mov	r9, r0
	mov	r0, r9
	bl	assert
	ldr	r9, =233
	ldr	r8, =4095
	mov	r0, r9
	mov	r1, r8
	bl	float_eq
	mov	r9, r0
	mov	r0, r9
	bl	assert_not
	ldr	r9, =1.500000
	cmp	r9, #0
	bne	.L121
	ldr	r10, =1
	cmp	r10, #0
	b	.L75

.L121:
	ldr	r10, =0
	cmp	r10, #0
	b	.L74
	b	.L75

.L74:
	bl	ok

.L75:
	ldr	r9, =1
	cmp	r9, #1
	beq	.L76
	b	.L77

.L76:
	bl	ok

.L77:
	cmp	#0.000000, #1
	ldr	r9, =0.000000
	cmp	r9, #1
	beq	.L78
	b	.L79

.L78:
	bl	error

.L79:
	cmp	#1.000000, #1
	ldr	r9, =1.000000
	cmp	r9, #1
	beq	.L83
	b	.L84

.L83:
	bl	ok

.L84:
	ldr	r9, =1
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, =1.000000
	ldr	r10, =-60
	add	r10, r10, fp
	str	r9,	[r10, #0]
	ldr	r9, =2
	ldr	r10, =-60
	add	r10, r10, fp
	str	r9,	[r10, #4]
	ldr	r10, =-60
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

	ldr	r9, =-60
	add	r9, r11, r9
	mov	r0, r9
	bl	getfarray
	mov	r9, r0
	str	r9, [fp, #-64]

.L88:
	ldr	r9, [fp, #-16]
	ldr	r8, =0
	cmp	r9, r8
	blt	.L122
	ldr	r10, =1
	cmp	r10, #0
	b	.L90

.L122:
	ldr	r10, =0
	cmp	r10, #0
	b	.L89
	b	.L90

.L89:
	bl	getfloat
	mov	r9, r0
	str	r9, [fp, #-68]
	ldr	r9, =0
	ldr	r8, [fp, #-68]
	mul	r9, r8, r9
	ldr	r8, [fp, #-68]
	mul	r9, r8, r9
	str	r9, [fp, #-72]
	ldr	r9, [fp, #-68]
	mov	r0, r9
	bl	circle_are
	mov	r9, r0
	str	r9, [fp, #-76]
	ldr	r9, [fp, #-20]
	ldr	r10, =-60
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, [fp, #-68]
	add	r9, r8, r9
	ldr	r8, [fp, #-20]
	ldr	r10, =-60
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-72]
	mov	r0, r9
	bl	putfloat
	ldr	r9, =32
	mov	r0, r9
	bl	putch
	ldr	r9, [fp, #-76]
	mov	r0, r9
	bl	putint
	ldr	r9, =10
	mov	r0, r9
	bl	putch
	ldr	r9, [fp, #-16]
	ldr	r8, =10.000000
	mul	r9, r8, r9
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L88

.L90:
	ldr	r9, [fp, #-64]
	ldr	r8, =-60
	add	r8, r11, r8
	mov	r0, r9
	mov	r1, r8
	bl	putfarray
	ldr	r9, =0
	mov	r0, r9
	b	.L73

.L73:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
