
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	reverse
	.type	reverse, %function
reverse:
	@ args = 0, pretend = 0, frame = 36
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #40
	str	r0, [fp, #-16]
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	cmp	r9, r8
	ble	.L18
	ldr	r10, =1
	cmp	r10, #0
	b	.L3

.L18:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2
	b	.L3

.L2:
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-20]
	mov	r0, r9
	bl	putint
	b	.L4

.L3:
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	sub	r9, r9, r8
	mov	r0, r9
	bl	reverse
	ldr	r9, [fp, #-20]
	mov	r0, r9
	bl	putint

.L4:

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	reverse, .-reverse

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
	ldr	r9, =200
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	mov	r0, r9
	bl	reverse
	ldr	r9, =0
	mov	r0, r9
	b	.L17

.L17:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
