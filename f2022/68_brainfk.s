	.global	tape
	.data
	.align	2
	.type	tape, %object
	.size	tape, 262144
tape:
	.space	262144
	.global	program
	.data
	.align	2
	.type	program, %object
	.size	program, 131072
program:
	.space	131072
	.global	ptr
	.data
	.align	2
	.type	ptr, %object
	.size	ptr, 4
ptr:
	.word	0


	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	read_progr
	.type	read_progr, %function
read_progr:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #28
	ldr	r9, =0
	str	r9, [fp, #-16]
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-20]

.L2:
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-20]
	cmp	r9, r8
	blt	.L146
	ldr	r10, =1
	cmp	r10, #0
	b	.L4

.L146:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3
	b	.L4

.L3:
	bl	getch
	mov	r9, r0
	ldr	r8, [fp, #-16]
	movw	r10, #:lower16:program
	movt	r10, #:upper16:program
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-16]
	b	.L2

.L4:
	ldr	r9, =0
	ldr	r8, [fp, #-16]
	movw	r10, #:lower16:program
	movt	r10, #:upper16:program
	str	r9,	[r10, r8,LSL#2]

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	read_progr, .-read_progr

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	interpret
	.type	interpret, %function
interpret:
	@ args = 0, pretend = 0, frame = 92
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #96
	str	r0, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-28]

.L21:
	ldr	r9, [fp, #-28]
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	cmp	r9, #0
	bne	.L147
	ldr	r10, =1
	cmp	r10, #0
	b	.L23

.L147:
	ldr	r10, =0
	cmp	r10, #0
	b	.L22
	b	.L23

.L22:
	ldr	r9, [fp, #-28]
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-20]
	ldr	r8, =62
	cmp	r9, r8
	beq	.L27
	b	.L28

.L27:
	movw	r9, #:lower16:ptr
	movt	r9, #:upper16:ptr
	ldr	r9, [r9, #0]
	ldr	r8, =1
	add	r9, r8, r9
	movw	r10, #:lower16:ptr
	movt	r10, #:upper16:ptr
	str	r9, [r10, #0]
	b	.L29

.L28:
	ldr	r9, [fp, #-20]
	ldr	r8, =60
	cmp	r9, r8
	beq	.L39
	b	.L40

.L39:
	movw	r9, #:lower16:ptr
	movt	r9, #:upper16:ptr
	ldr	r9, [r9, #0]
	ldr	r8, =1
	sub	r9, r9, r8
	movw	r10, #:lower16:ptr
	movt	r10, #:upper16:ptr
	str	r9, [r10, #0]
	b	.L41

.L40:
	ldr	r9, [fp, #-20]
	ldr	r8, =43
	cmp	r9, r8
	beq	.L51
	b	.L52

.L51:
	movw	r9, #:lower16:ptr
	movt	r9, #:upper16:ptr
	ldr	r9, [r9, #0]
	movw	r10, #:lower16:tape
	movt	r10, #:upper16:tape
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =1
	add	r9, r8, r9
	movw	r8, #:lower16:ptr
	movt	r8, #:upper16:ptr
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:tape
	movt	r10, #:upper16:tape
	str	r9,	[r10, r8,LSL#2]
	b	.L53

.L52:
	ldr	r9, [fp, #-20]
	ldr	r8, =45
	cmp	r9, r8
	beq	.L63
	b	.L64

.L63:
	movw	r9, #:lower16:ptr
	movt	r9, #:upper16:ptr
	ldr	r9, [r9, #0]
	movw	r10, #:lower16:tape
	movt	r10, #:upper16:tape
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =1
	sub	r9, r9, r8
	movw	r8, #:lower16:ptr
	movt	r8, #:upper16:ptr
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:tape
	movt	r10, #:upper16:tape
	str	r9,	[r10, r8,LSL#2]
	b	.L65

.L64:
	ldr	r9, [fp, #-20]
	ldr	r8, =46
	cmp	r9, r8
	beq	.L75
	b	.L76

.L75:
	movw	r9, #:lower16:ptr
	movt	r9, #:upper16:ptr
	ldr	r9, [r9, #0]
	movw	r10, #:lower16:tape
	movt	r10, #:upper16:tape
	ldr	r9,	[r10, r9,LSL#2]
	mov	r0, r9
	bl	putch
	b	.L77

.L76:
	ldr	r9, [fp, #-20]
	ldr	r8, =44
	cmp	r9, r8
	beq	.L81
	b	.L82

.L81:
	bl	getch
	mov	r9, r0
	movw	r8, #:lower16:ptr
	movt	r8, #:upper16:ptr
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:tape
	movt	r10, #:upper16:tape
	str	r9,	[r10, r8,LSL#2]
	b	.L83

.L82:
	ldr	r9, [fp, #-20]
	ldr	r8, =93
	cmp	r9, r8
	beq	.L93
	b	.L92

.L93:
	movw	r8, #:lower16:ptr
	movt	r8, #:upper16:ptr
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:tape
	movt	r10, #:upper16:tape
	ldr	r8,	[r10, r8,LSL#2]
	cmp	r8, #0
	bne	.L148
	ldr	r10, =1
	cmp	r10, #0
	b	.L94

.L148:
	ldr	r10, =0
	cmp	r10, #0
	b	.L94

.L94:

.L92:
	beq	.L90
	b	.L91

.L90:
	ldr	r9, =1
	str	r9, [fp, #-24]

.L101:
	ldr	r9, [fp, #-24]
	ldr	r8, =0
	cmp	r9, r8
	bgt	.L149
	ldr	r10, =1
	cmp	r10, #0
	b	.L103

.L149:
	ldr	r10, =0
	cmp	r10, #0
	b	.L102
	b	.L103

.L102:
	ldr	r9, [fp, #-28]
	ldr	r8, =1
	sub	r9, r9, r8
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-28]
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-20]
	ldr	r8, =91
	cmp	r9, r8
	beq	.L116
	b	.L117

.L116:
	ldr	r9, [fp, #-24]
	ldr	r8, =1
	sub	r9, r9, r8
	str	r9, [fp, #-24]
	b	.L118

.L117:
	ldr	r9, [fp, #-20]
	ldr	r8, =93
	cmp	r9, r8
	beq	.L128
	b	.L129

.L128:
	ldr	r9, [fp, #-24]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-24]

.L129:

.L118:
	b	.L101

.L103:

.L91:

.L83:

.L77:

.L65:

.L53:

.L41:

.L29:
	ldr	r9, [fp, #-28]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-28]
	b	.L21

.L23:

.L20:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	interpret, .-interpret

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #20
	bl	read_progr
	movw	r12, #:lower16:program
	movt	r12, #:upper16:program
	movw	r0, #:lower16:program
	movt	r0, #:upper16:program
	bl	interpret
	ldr	r9, =0
	mov	r0, r9
	b	.L145

.L145:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
