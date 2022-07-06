
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	my_getint
	.type	my_getint, %function
my_getint:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #32
	ldr	r9, =0
	str	r9, [fp, #-16]

.L2:
	ldr	r9, =1
	cmp	r9, #0
	bne	.L109
	ldr	r10, =1
	cmp	r10, #0
	b	.L4

.L109:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3
	b	.L4

.L3:
	bl	getch
	mov	r9, r0
	ldr	r8, =48
	sub	r9, r9, r8
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-20]
	ldr	r8, =0
	cmp	r9, r8
	blt	.L110
	ldr	r10, =1
	cmp	r10, #0
	b	.L15

.L110:
	ldr	r10, =0
	cmp	r10, #0
	b	.L14
	b	.L15

.L15:
	ldr	r8, [fp, #-20]
	ldr	r7, =9
	cmp	r8, r7
	bgt	.L111
	ldr	r10, =1
	cmp	r10, #0
	b	.L16

.L111:
	ldr	r10, =0
	cmp	r10, #0
	b	.L16

.L16:

.L14:
	beq	.L11
	b	.L12

.L11:
	b	.L2
	b	.L13

.L12:
	b	.L4

.L13:
	b	.L2

.L4:
	ldr	r9, [fp, #-20]
	str	r9, [fp, #-16]

.L26:
	ldr	r8, =1
	cmp	r8, #0
	bne	.L112
	ldr	r10, =1
	cmp	r10, #0
	b	.L28

.L112:
	ldr	r10, =0
	cmp	r10, #0
	b	.L27
	b	.L28

.L27:
	bl	getch
	mov	r9, r0
	ldr	r8, =48
	sub	r9, r9, r8
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-20]
	ldr	r8, =0
	cmp	r9, r8
	bge	.L113
	ldr	r10, =1
	cmp	r10, #0
	b	.L38

.L113:
	ldr	r10, =0
	cmp	r10, #0
	b	.L39
	b	.L38

.L39:
	ldr	r8, [fp, #-20]
	ldr	r7, =9
	cmp	r8, r7
	ble	.L114
	ldr	r10, =1
	cmp	r10, #0
	b	.L40

.L114:
	ldr	r10, =0
	cmp	r10, #0
	b	.L40

.L40:

.L38:
	beq	.L35
	b	.L36

.L35:
	ldr	r9, [fp, #-16]
	ldr	r8, =10
	mul	r9, r8, r9
	ldr	r8, [fp, #-20]
	add	r9, r8, r9
	str	r9, [fp, #-16]
	b	.L37

.L36:
	b	.L28

.L37:
	b	.L26

.L28:
	ldr	r9, [fp, #-16]
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	my_getint, .-my_getint

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	my_putint
	.type	my_putint, %function
my_putint:
	@ args = 0, pretend = 0, frame = 248
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #252
	str	r0, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-84]

.L57:
	ldr	r9, [fp, #-16]
	ldr	r8, =0
	cmp	r9, r8
	bgt	.L115
	ldr	r10, =1
	cmp	r10, #0
	b	.L59

.L115:
	ldr	r10, =0
	cmp	r10, #0
	b	.L58
	b	.L59

.L58:
	ldr	r9, [fp, #-16]
	ldr	r8, =10
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	ldr	r8, =48
	add	r9, r8, r9
	ldr	r8, [fp, #-84]
	ldr	r10, =-80
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-16]
	ldr	r8, =10
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-84]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-84]
	b	.L57

.L59:

.L84:
	ldr	r9, [fp, #-84]
	ldr	r8, =0
	cmp	r9, r8
	bgt	.L116
	ldr	r10, =1
	cmp	r10, #0
	b	.L86

.L116:
	ldr	r10, =0
	cmp	r10, #0
	b	.L85
	b	.L86

.L85:
	ldr	r9, [fp, #-84]
	ldr	r8, =1
	sub	r9, r9, r8
	str	r9, [fp, #-84]
	ldr	r9, [fp, #-84]
	ldr	r10, =-80
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	mov	r0, r9
	bl	putch
	b	.L84

.L86:

.L56:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	my_putint, .-my_putint

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 60
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #64
	bl	my_getint
	mov	r9, r0
	str	r9, [fp, #-16]

.L97:
	ldr	r9, [fp, #-16]
	ldr	r8, =0
	cmp	r9, r8
	bgt	.L117
	ldr	r10, =1
	cmp	r10, #0
	b	.L99

.L117:
	ldr	r10, =0
	cmp	r10, #0
	b	.L98
	b	.L99

.L98:
	bl	my_getint
	mov	r9, r0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-20]
	mov	r0, r9
	bl	my_putint
	ldr	r9, =10
	mov	r0, r9
	bl	putch
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	sub	r9, r9, r8
	str	r9, [fp, #-16]
	b	.L97

.L99:
	ldr	r9, =0
	mov	r0, r9
	b	.L96

.L96:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
