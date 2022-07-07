
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	deepWhileB
	.type	deepWhileB, %function
deepWhileB:
	@ args = 0, pretend = 0, frame = 44
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #48
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-20]
	add	r9, r8, r9
	str	r9, [fp, #-24]

.L8:
	ldr	r9, [fp, #-24]
	ldr	r8, =75
	cmp	r9, r8
	blt	.L54
	ldr	r10, =1
	cmp	r10, #0
	b	.L10

.L54:
	ldr	r10, =0
	cmp	r10, #0
	b	.L9
	b	.L10

.L9:
	ldr	r9, =42
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-24]
	ldr	r8, =100
	cmp	r9, r8
	blt	.L55
	ldr	r10, =1
	cmp	r10, #0
	b	.L18

.L55:
	ldr	r10, =0
	cmp	r10, #0
	b	.L17
	b	.L18

.L17:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	add	r9, r8, r9
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-24]
	ldr	r8, =99
	cmp	r9, r8
	bgt	.L56
	ldr	r10, =1
	cmp	r10, #0
	b	.L29

.L56:
	ldr	r10, =0
	cmp	r10, #0
	b	.L28
	b	.L29

.L28:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mul	r9, r8, r9
	str	r9, [fp, #-32]
	ldr	r9, =1
	cmp	r9, #0
	bne	.L57
	ldr	r10, =1
	cmp	r10, #0
	b	.L40

.L57:
	ldr	r10, =0
	cmp	r10, #0
	b	.L39
	b	.L40

.L39:
	ldr	r9, [fp, #-32]
	ldr	r8, =2
	mul	r9, r8, r9
	str	r9, [fp, #-24]

.L40:

.L29:

.L18:
	b	.L8

.L10:
	ldr	r9, [fp, #-24]
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	deepWhileB, .-deepWhileB

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #28
	ldr	r9, =2
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	mov	r0, r9
	mov	r1, r9
	bl	deepWhileB
	mov	r9, r0
	mov	r0, r9
	b	.L50

.L50:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
