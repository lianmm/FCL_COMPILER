	.global	g
	.data
	.align	2
	.type	g, %object
	.size	g, 4
g:
	.word	0


	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	func
	.type	func, %function
func:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-16]
	movw	r9, #:lower16:g
	movt	r9, #:upper16:g
	ldr	r9, [r9, #0]
	ldr	r8, [fp, #-16]
	add	r9, r8, r9
	movw	r10, #:lower16:g
	movt	r10, #:upper16:g
	str	r9, [r10, #0]
	movw	r9, #:lower16:g
	movt	r9, #:upper16:g
	ldr	r9, [r9, #0]
	mov	r0, r9
	bl	putint
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	func, .-func

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 36
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #40
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	ldr	r8, =10
	cmp	r9, r8
	bgt	.L93
	ldr	r10, =1
	cmp	r10, #0
	b	.L15

.L93:
	ldr	r10, =0
	cmp	r10, #0
	b	.L16
	b	.L15

.L16:
	mov	r0, r9
	bl	func
	mov	r9, r0
	cmp	r9, #0
	bne	.L94
	ldr	r10, =1
	cmp	r10, #0
	b	.L17

.L94:
	ldr	r10, =0
	cmp	r10, #0
	b	.L17

.L17:

.L15:
	beq	.L12
	b	.L13

.L12:
	ldr	r9, =1
	str	r9, [fp, #-16]
	b	.L14

.L13:
	ldr	r9, =0
	str	r9, [fp, #-16]

.L14:
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	ldr	r8, =11
	cmp	r9, r8
	bgt	.L95
	ldr	r10, =1
	cmp	r10, #0
	b	.L33

.L95:
	ldr	r10, =0
	cmp	r10, #0
	b	.L34
	b	.L33

.L34:
	mov	r0, r9
	bl	func
	mov	r9, r0
	cmp	r9, #0
	bne	.L96
	ldr	r10, =1
	cmp	r10, #0
	b	.L35

.L96:
	ldr	r10, =0
	cmp	r10, #0
	b	.L35

.L35:

.L33:
	beq	.L30
	b	.L31

.L30:
	ldr	r9, =1
	str	r9, [fp, #-16]
	b	.L32

.L31:
	ldr	r9, =0
	str	r9, [fp, #-16]

.L32:
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	ldr	r8, =99
	cmp	r9, r8
	ble	.L97
	ldr	r10, =1
	cmp	r10, #0
	b	.L52

.L97:
	ldr	r10, =0
	cmp	r10, #0
	b	.L51
	b	.L52

.L52:
	mov	r0, r9
	bl	func
	mov	r9, r0
	cmp	r9, #0
	bne	.L98
	ldr	r10, =1
	cmp	r10, #0
	b	.L53

.L98:
	ldr	r10, =0
	cmp	r10, #0
	b	.L53

.L53:

.L51:
	beq	.L48
	b	.L49

.L48:
	ldr	r9, =1
	str	r9, [fp, #-16]
	b	.L50

.L49:
	ldr	r9, =0
	str	r9, [fp, #-16]

.L50:
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	ldr	r8, =100
	cmp	r9, r8
	ble	.L99
	ldr	r10, =1
	cmp	r10, #0
	b	.L70

.L99:
	ldr	r10, =0
	cmp	r10, #0
	b	.L69
	b	.L70

.L70:
	mov	r0, r9
	bl	func
	mov	r9, r0
	cmp	r9, #0
	bne	.L100
	ldr	r10, =1
	cmp	r10, #0
	b	.L71

.L100:
	ldr	r10, =0
	cmp	r10, #0
	b	.L71

.L71:

.L69:
	beq	.L66
	b	.L67

.L66:
	ldr	r9, =1
	str	r9, [fp, #-16]
	b	.L68

.L67:
	ldr	r9, =0
	str	r9, [fp, #-16]

.L68:
	ldr	r9, =99
	mov	r0, r9
	bl	func
	mov	r9, r0
	cmp	r9, #0
	beq	.L85
	b	.L84

.L85:
	ldr	r8, =100
	mov	r0, r8
	bl	func
	mov	r8, r0
	cmp	r8, #0
	bne	.L101
	ldr	r10, =1
	cmp	r10, #0
	b	.L86

.L101:
	ldr	r10, =0
	cmp	r10, #0
	b	.L86

.L86:

.L84:
	beq	.L81
	b	.L82

.L81:
	ldr	r9, =1
	str	r9, [fp, #-16]
	b	.L83

.L82:
	ldr	r9, =0
	str	r9, [fp, #-16]

.L83:
	ldr	r9, =0
	mov	r0, r9
	b	.L8

.L8:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
