
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	func1
	.type	func1, %function
func1:
	@ args = 0, pretend = 0, frame = 52
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #56
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r9, [fp, #-24]
	ldr	r8, =0
	cmp	r9, r8
	beq	.L2
	b	.L3

.L2:
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-20]
	mul	r9, r8, r9
	mov	r0, r9
	b	.L1
	b	.L4

.L3:
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-20]
	ldr	r7, [fp, #-24]
	sub	r8, r8, r7
	ldr	r7, =0
	mov	r0, r9
	mov	r1, r8
	mov	r2, r7
	bl	func1
	mov	r9, r0
	mov	r0, r9
	b	.L1

.L4:

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	func1, .-func1

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	func2
	.type	func2, %function
func2:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #52
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r9, [fp, #-20]
	cmp	r9, #0
	bne	.L66
	ldr	r10, =1
	cmp	r10, #0
	b	.L16

.L66:
	ldr	r10, =0
	cmp	r10, #0
	b	.L15
	b	.L16

.L15:
	ldr	r8, [fp, #-16]
	mov	r0, r8
	mov	r1, r9
	bl	__aeabi_idivmod
	mov	r9, r1
	ldr	r8, =0
	mov	r0, r9
	mov	r1, r8
	bl	func2
	mov	r9, r0
	mov	r0, r9
	b	.L14
	b	.L17

.L16:
	ldr	r9, [fp, #-16]
	mov	r0, r9
	b	.L14

.L17:

.L14:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	func2, .-func2

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	func3
	.type	func3, %function
func3:
	@ args = 0, pretend = 0, frame = 60
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #64
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r9, [fp, #-20]
	ldr	r8, =0
	cmp	r9, r8
	beq	.L22
	b	.L23

.L22:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	add	r9, r8, r9
	mov	r0, r9
	b	.L21
	b	.L24

.L23:
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-20]
	add	r9, r8, r9
	ldr	r8, =0
	mov	r0, r9
	mov	r1, r8
	bl	func3
	mov	r9, r0
	mov	r0, r9
	b	.L21

.L24:

.L21:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	func3, .-func3

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	func4
	.type	func4, %function
func4:
	@ args = 0, pretend = 0, frame = 52
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #56
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r9, [fp, #-16]
	cmp	r9, #0
	bne	.L67
	ldr	r10, =1
	cmp	r10, #0
	b	.L36

.L67:
	ldr	r10, =0
	cmp	r10, #0
	b	.L35
	b	.L36

.L35:
	ldr	r9, [fp, #-20]
	mov	r0, r9
	b	.L34
	b	.L37

.L36:
	ldr	r9, [fp, #-24]
	mov	r0, r9
	b	.L34

.L37:

.L34:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	func4, .-func4

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	func5
	.type	func5, %function
func5:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-16]
	ldr	r9, [fp, #-16]
	rsb	r9, r9, #0
	mov	r0, r9
	b	.L38

.L38:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	func5, .-func5

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	func6
	.type	func6, %function
func6:
	@ args = 0, pretend = 0, frame = 36
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #40
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-20]
	cmp	r9, #0
	bne	.L68
	ldr	r10, =1
	cmp	r10, #0
	b	.L43

.L68:
	ldr	r10, =0
	cmp	r10, #0
	b	.L44
	b	.L43

.L44:
	cmp	r8, #0
	bne	.L69
	ldr	r10, =1
	cmp	r10, #0
	b	.L45

.L69:
	ldr	r10, =0
	cmp	r10, #0
	b	.L45

.L45:

.L43:
	beq	.L40
	b	.L41

.L40:
	ldr	r9, =1
	mov	r0, r9
	b	.L39
	b	.L42

.L41:
	ldr	r9, =0
	mov	r0, r9
	b	.L39

.L42:

.L39:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	func6, .-func6

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	func7
	.type	func7, %function
func7:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #44
	str	r0, [fp, #-16]
	ldr	r9, [fp, #-16]
	cmp	r9, #0
	beq	.L47
	b	.L48

.L47:
	ldr	r9, =1
	mov	r0, r9
	b	.L46
	b	.L49

.L48:
	ldr	r9, =0
	mov	r0, r9
	b	.L46

.L49:

.L46:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	func7, .-func7

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 184
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #188
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-16]
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-20]
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-24]
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, =0
	str	r9, [fp, #-72]

.L51:
	ldr	r9, [fp, #-72]
	ldr	r8, =10
	cmp	r9, r8
	blt	.L70
	ldr	r10, =1
	cmp	r10, #0
	b	.L53

.L70:
	ldr	r10, =0
	cmp	r10, #0
	b	.L52
	b	.L53

.L52:
	bl	getint
	mov	r9, r0
	ldr	r8, [fp, #-72]
	ldr	r10, =-68
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-72]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-72]
	b	.L51

.L53:
	ldr	r9, [fp, #-16]
	mov	r0, r9
	bl	func7
	mov	r8, r0
	ldr	r7, [fp, #-20]
	mov	r0, r7
	bl	func5
	mov	r6, r0
	mov	r0, r8
	mov	r1, r6
	bl	func6
	mov	r8, r0
	ldr	r6, [fp, #-24]
	mov	r0, r8
	mov	r1, r6
	bl	func2
	mov	r8, r0
	ldr	r5, [fp, #-28]
	mov	r0, r8
	mov	r1, r5
	bl	func3
	mov	r8, r0
	mov	r0, r8
	bl	func5
	mov	r8, r0
	ldr	r4, =0
	ldr	r10, =-68
	add	r10, r10, fp
	ldr	r4,	[r10, r4,LSL#2]
	ldr	r3, =1
	ldr	r10, =-68
	add	r10, r10, fp
	ldr	r3,	[r10, r3,LSL#2]
	mov	r0, r3
	bl	func5
	mov	r3, r0
	ldr	r2, =2
	ldr	r10, =-68
	add	r10, r10, fp
	ldr	r2,	[r10, r2,LSL#2]
	ldr	r1, =3
	ldr	r10, =-68
	add	r10, r10, fp
	ldr	r1,	[r10, r1,LSL#2]
	mov	r0, r1
	bl	func7
	mov	r1, r0
	mov	r0, r2
	mov	r10, r1
	mov	r1, r1
	mov	r1, r10
	bl	func6
	mov	r2, r0
	ldr	r1, =4
	ldr	r10, =-68
	add	r10, r10, fp
	ldr	r1,	[r10, r1,LSL#2]
	ldr	r0, =5
	ldr	r10, =-68
	add	r10, r10, fp
	ldr	r0,	[r10, r0,LSL#2]
	mov	r10, r0
	mov	r0, r0
	mov	r0, r10
	bl	func7
	mov	r0, r0
	mov	r10, r0
	mov	r0, r1
	mov	r1, r10
	mov	r10, r1
	mov	r1, r1
	mov	r1, r10
	bl	func2
	mov	r1, r0
	mov	r10, r0
	mov	r0, r3
	mov	r3, r10
	mov	r10, r1
	mov	r1, r2
	mov	r2, r10
	mov	r10, r2
	mov	r2, r2
	mov	r2, r10
	bl	func4
	mov	r3, r0
	ldr	r2, =6
	ldr	r10, =-68
	add	r10, r10, fp
	ldr	r2,	[r10, r2,LSL#2]
	mov	r10, r0
	mov	r0, r3
	mov	r3, r10
	mov	r10, r1
	mov	r1, r2
	mov	r2, r10
	bl	func3
	mov	r3, r0
	ldr	r2, =7
	ldr	r10, =-68
	add	r10, r10, fp
	ldr	r2,	[r10, r2,LSL#2]
	mov	r10, r0
	mov	r0, r3
	mov	r3, r10
	mov	r10, r1
	mov	r1, r2
	mov	r2, r10
	bl	func2
	mov	r3, r0
	ldr	r2, =8
	ldr	r10, =-68
	add	r10, r10, fp
	ldr	r2,	[r10, r2,LSL#2]
	str	r7, [fp, #-120]
	ldr	r7, =9
	ldr	r10, =-68
	add	r10, r10, fp
	ldr	r7,	[r10, r7,LSL#2]
	mov	r10, r0
	mov	r0, r7
	mov	r7, r10
	bl	func7
	mov	r7, r0
	mov	r10, r0
	mov	r0, r2
	mov	r2, r10
	mov	r10, r1
	mov	r1, r7
	mov	r7, r10
	bl	func3
	mov	r7, r0
	mov	r10, r0
	mov	r0, r3
	mov	r3, r10
	mov	r10, r1
	mov	r1, r7
	mov	r7, r10
	mov	r10, r2
	mov	r2, r9
	mov	r9, r10
	bl	func1
	mov	r7, r0
	mov	r10, r0
	mov	r0, r8
	mov	r8, r10
	mov	r10, r1
	mov	r1, r4
	mov	r4, r10
	mov	r10, r2
	mov	r2, r7
	mov	r7, r10
	bl	func4
	mov	r8, r0
	mov	r10, r0
	mov	r0, r6
	mov	r6, r10
	bl	func7
	mov	r7, r0
	mov	r10, r0
	mov	r0, r7
	mov	r7, r10
	mov	r10, r1
	mov	r1, r5
	mov	r5, r10
	bl	func3
	mov	r7, r0
	ldr	r12, [fp, #-120]
	mov	r10, r0
	mov	r0, r12
	mov	r12, r10
	mov	r10, r1
	mov	r1, r7
	mov	r7, r10
	bl	func2
	mov	r7, r0
	mov	r10, r0
	mov	r0, r8
	mov	r8, r10
	mov	r10, r1
	mov	r1, r7
	mov	r7, r10
	bl	func3
	mov	r8, r0
	ldr	r7, =0
	ldr	r10, =-68
	add	r10, r10, fp
	ldr	r7,	[r10, r7,LSL#2]
	ldr	r6, =1
	ldr	r10, =-68
	add	r10, r10, fp
	ldr	r6,	[r10, r6,LSL#2]
	mov	r10, r0
	mov	r0, r8
	mov	r8, r10
	mov	r10, r1
	mov	r1, r7
	mov	r7, r10
	mov	r10, r2
	mov	r2, r6
	mov	r6, r10
	bl	func1
	mov	r8, r0
	ldr	r7, =2
	ldr	r10, =-68
	add	r10, r10, fp
	ldr	r7,	[r10, r7,LSL#2]
	mov	r10, r0
	mov	r0, r8
	mov	r8, r10
	mov	r10, r1
	mov	r1, r7
	mov	r7, r10
	bl	func2
	mov	r8, r0
	ldr	r7, =3
	ldr	r10, =-68
	add	r10, r10, fp
	ldr	r7,	[r10, r7,LSL#2]
	ldr	r6, =4
	ldr	r10, =-68
	add	r10, r10, fp
	ldr	r6,	[r10, r6,LSL#2]
	ldr	r5, =5
	ldr	r10, =-68
	add	r10, r10, fp
	ldr	r5,	[r10, r5,LSL#2]
	mov	r10, r0
	mov	r0, r5
	mov	r5, r10
	bl	func5
	mov	r5, r0
	mov	r10, r0
	mov	r0, r6
	mov	r6, r10
	mov	r10, r1
	mov	r1, r5
	mov	r5, r10
	bl	func3
	mov	r6, r0
	ldr	r5, =6
	ldr	r10, =-68
	add	r10, r10, fp
	ldr	r5,	[r10, r5,LSL#2]
	mov	r10, r0
	mov	r0, r5
	mov	r5, r10
	bl	func5
	mov	r5, r0
	mov	r10, r0
	mov	r0, r6
	mov	r6, r10
	mov	r10, r1
	mov	r1, r5
	mov	r5, r10
	bl	func2
	mov	r6, r0
	ldr	r5, =7
	ldr	r10, =-68
	add	r10, r10, fp
	ldr	r5,	[r10, r5,LSL#2]
	ldr	r4, =8
	ldr	r10, =-68
	add	r10, r10, fp
	ldr	r4,	[r10, r4,LSL#2]
	mov	r10, r0
	mov	r0, r4
	mov	r4, r10
	bl	func7
	mov	r4, r0
	mov	r10, r0
	mov	r0, r6
	mov	r6, r10
	mov	r10, r1
	mov	r1, r5
	mov	r5, r10
	mov	r10, r2
	mov	r2, r4
	mov	r4, r10
	bl	func1
	mov	r6, r0
	ldr	r5, =9
	ldr	r10, =-68
	add	r10, r10, fp
	ldr	r5,	[r10, r5,LSL#2]
	mov	r10, r0
	mov	r0, r5
	mov	r5, r10
	bl	func5
	mov	r5, r0
	mov	r10, r0
	mov	r0, r6
	mov	r6, r10
	mov	r10, r1
	mov	r1, r5
	mov	r5, r10
	bl	func2
	mov	r6, r0
	mov	r10, r0
	mov	r0, r6
	mov	r6, r10
	mov	r10, r1
	mov	r1, r7
	mov	r7, r10
	bl	func3
	mov	r7, r0
	mov	r10, r0
	mov	r0, r8
	mov	r8, r10
	mov	r10, r1
	mov	r1, r7
	mov	r7, r10
	mov	r10, r2
	mov	r2, r7
	mov	r7, r10
	bl	func1
	mov	r8, r0
	str	r8, [fp, #-76]
	ldr	r8, [fp, #-76]
	mov	r0, r8
	b	.L50

.L50:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
