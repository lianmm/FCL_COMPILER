
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	doubleWhil
	.type	doubleWhil, %function
doubleWhil:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #28
	ldr	r9, =5
	str	r9, [fp, #-16]
	ldr	r9, =7
	str	r9, [fp, #-20]

.L8:
	ldr	r9, [fp, #-16]
	ldr	r8, =100
	cmp	r9, r8
	blt	.L39
	ldr	r10, =1
	cmp	r10, #0
	b	.L10

.L39:
	ldr	r10, =0
	cmp	r10, #0
	b	.L9
	b	.L10

.L9:
	ldr	r9, [fp, #-16]
	ldr	r8, =30
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L20:
	ldr	r9, [fp, #-20]
	ldr	r8, =100
	cmp	r9, r8
	blt	.L40
	ldr	r10, =1
	cmp	r10, #0
	b	.L22

.L40:
	ldr	r10, =0
	cmp	r10, #0
	b	.L21
	b	.L22

.L21:
	ldr	r9, [fp, #-20]
	ldr	r8, =6
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L20

.L22:
	ldr	r9, [fp, #-20]
	ldr	r8, =100
	sub	r9, r9, r8
	str	r9, [fp, #-20]
	b	.L8

.L10:
	ldr	r9, [fp, #-20]
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	doubleWhil, .-doubleWhil

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
	bl	doubleWhil
	mov	r9, r0
	mov	r0, r9
	b	.L38

.L38:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
