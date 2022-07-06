	.global	ans
	.data
	.align	2
	.type	ans, %object
	.size	ans, 200
ans:
	.space	200
	.global	sum
	.data
	.align	2
	.type	sum, %object
	.size	sum, 4
sum:
	.word	0

	.global	n
	.data
	.align	2
	.type	n, %object
	.size	n, 4
n:
	.word	0

	.global	row
	.data
	.align	2
	.type	row, %object
	.size	row, 200
row:
	.space	200
	.global	line1
	.data
	.align	2
	.type	line1, %object
	.size	line1, 200
line1:
	.space	200
	.global	line2
	.data
	.align	2
	.type	line2, %object
	.size	line2, 400
line2:
	.space	400

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	printans
	.type	printans, %function
printans:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #24
	movw	r9, #:lower16:sum
	movt	r9, #:upper16:sum
	ldr	r9, [r9, #0]
	ldr	r8, =1
	add	r9, r8, r9
	movw	r10, #:lower16:sum
	movt	r10, #:upper16:sum
	str	r9, [r10, #0]
	ldr	r9, =1
	str	r9, [fp, #-16]

.L8:
	ldr	r9, [fp, #-16]
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	cmp	r9, r8
	ble	.L125
	ldr	r10, =1
	cmp	r10, #0
	b	.L10

.L125:
	ldr	r10, =0
	cmp	r10, #0
	b	.L9
	b	.L10

.L9:
	ldr	r9, [fp, #-16]
	movw	r10, #:lower16:ans
	movt	r10, #:upper16:ans
	ldr	r9,	[r10, r9,LSL#2]
	mov	r0, r9
	bl	putint
	ldr	r9, [fp, #-16]
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	cmp	r9, r8
	beq	.L14
	b	.L15

.L14:
	ldr	r9, =10
	mov	r0, r9
	bl	putch
	b	.L1
	b	.L16

.L15:
	ldr	r9, =32
	mov	r0, r9
	bl	putch

.L16:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-16]
	b	.L8

.L10:

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	printans, .-printans

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	f
	.type	f, %function
f:
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #108
	str	r0, [fp, #-16]
	ldr	r9, =1
	str	r9, [fp, #-20]

.L27:
	ldr	r9, [fp, #-20]
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	cmp	r9, r8
	ble	.L126
	ldr	r10, =1
	cmp	r10, #0
	b	.L29

.L126:
	ldr	r10, =0
	cmp	r10, #0
	b	.L28
	b	.L29

.L28:
	ldr	r9, [fp, #-20]
	movw	r10, #:lower16:row
	movt	r10, #:upper16:row
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =1
	cmp	r9, r8
	bne	.L127
	ldr	r10, =1
	cmp	r10, #0
	b	.L38

.L127:
	ldr	r10, =0
	cmp	r10, #0
	b	.L39
	b	.L38

.L39:
	ldr	r8, [fp, #-16]
	ldr	r7, [fp, #-20]
	add	r8, r7, r8
	movw	r10, #:lower16:line1
	movt	r10, #:upper16:line1
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =0
	cmp	r8, r7

.L40:

.L38:
	beq	.L36
	b	.L35

.L36:
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	ldr	r7, [fp, #-16]
	add	r8, r7, r8
	ldr	r7, [fp, #-20]
	sub	r8, r8, r7
	movw	r10, #:lower16:line2
	movt	r10, #:upper16:line2
	ldr	r8,	[r10, r8,LSL#2]
	cmp	r8, #0
	movne	r8, #0
	moveq	r8, #1

.L37:

.L35:
	beq	.L33
	b	.L34

.L33:
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-16]
	movw	r10, #:lower16:ans
	movt	r10, #:upper16:ans
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-16]
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	cmp	r9, r8
	beq	.L59
	b	.L60

.L59:
	bl	printans

.L60:
	ldr	r9, =1
	ldr	r8, [fp, #-20]
	movw	r10, #:lower16:row
	movt	r10, #:upper16:row
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =1
	ldr	r8, [fp, #-16]
	ldr	r7, [fp, #-20]
	add	r8, r7, r8
	movw	r10, #:lower16:line1
	movt	r10, #:upper16:line1
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =1
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	ldr	r7, [fp, #-16]
	add	r8, r7, r8
	ldr	r7, [fp, #-20]
	sub	r8, r8, r7
	movw	r10, #:lower16:line2
	movt	r10, #:upper16:line2
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	add	r9, r8, r9
	mov	r0, r9
	bl	f
	ldr	r9, =0
	ldr	r8, [fp, #-20]
	movw	r10, #:lower16:row
	movt	r10, #:upper16:row
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =0
	ldr	r8, [fp, #-16]
	ldr	r7, [fp, #-20]
	add	r8, r7, r8
	movw	r10, #:lower16:line1
	movt	r10, #:upper16:line1
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =0
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	ldr	r7, [fp, #-16]
	add	r8, r7, r8
	ldr	r7, [fp, #-20]
	sub	r8, r8, r7
	movw	r10, #:lower16:line2
	movt	r10, #:upper16:line2
	str	r9,	[r10, r8,LSL#2]

.L34:
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L27

.L29:

.L26:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	f, .-f

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 52
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #56
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-16]

.L110:
	ldr	r9, [fp, #-16]
	ldr	r8, =0
	cmp	r9, r8
	bgt	.L128
	ldr	r10, =1
	cmp	r10, #0
	b	.L112

.L128:
	ldr	r10, =0
	cmp	r10, #0
	b	.L111
	b	.L112

.L111:
	bl	getint
	mov	r9, r0
	movw	r10, #:lower16:n
	movt	r10, #:upper16:n
	str	r9, [r10, #0]
	ldr	r9, =1
	mov	r0, r9
	bl	f
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	sub	r9, r9, r8
	str	r9, [fp, #-16]
	b	.L110

.L112:
	movw	r9, #:lower16:sum
	movt	r9, #:upper16:sum
	ldr	r9, [r9, #0]
	mov	r0, r9
	b	.L109

.L109:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
