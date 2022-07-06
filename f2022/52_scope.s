	.global	a
	.data
	.align	2
	.type	a, %object
	.size	a, 4
a:
	.word	7


	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	func
	.type	func, %function
func:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #28
	movw	r9, #:lower16:a
	movt	r9, #:upper16:a
	ldr	r9, [r9, #0]
	str	r9, [fp, #-16]
	ldr	r9, =1
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-16]
	cmp	r9, r8
	beq	.L2
	b	.L3

.L2:
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	ldr	r9, =1
	mov	r0, r9
	b	.L1
	b	.L4

.L3:
	ldr	r9, =0
	mov	r0, r9
	b	.L1

.L4:

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
	@ args = 0, pretend = 0, frame = 60
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #64
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]

.L15:
	ldr	r9, [fp, #-20]
	ldr	r8, =100
	cmp	r9, r8
	blt	.L44
	ldr	r10, =1
	cmp	r10, #0
	b	.L17

.L44:
	ldr	r10, =0
	cmp	r10, #0
	b	.L16
	b	.L17

.L16:
	bl	func
	mov	r9, r0
	ldr	r8, =1
	cmp	r9, r8
	beq	.L21
	b	.L22

.L21:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L22:
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L15

.L17:
	ldr	r9, [fp, #-16]
	ldr	r8, =100
	cmp	r9, r8
	blt	.L45
	ldr	r10, =1
	cmp	r10, #0
	b	.L39

.L45:
	ldr	r10, =0
	cmp	r10, #0
	b	.L38
	b	.L39

.L38:
	ldr	r9, =1
	mov	r0, r9
	bl	putint
	b	.L40

.L39:
	ldr	r9, =0
	mov	r0, r9
	bl	putint

.L40:
	ldr	r9, =0
	mov	r0, r9
	b	.L14

.L14:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
