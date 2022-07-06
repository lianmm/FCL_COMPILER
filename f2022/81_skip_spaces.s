
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 824
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	ldr	r12, =828
	sub	sp, sp, r12
	ldr	r9, =0
	str	r9, [fp, #-416]
	ldr	r9, =0
	str	r9, [fp, #-420]

.L2:
	bl	getint
	mov	r9, r0
	cmp	r9, #0
	bne	.L32
	ldr	r10, =1
	cmp	r10, #0
	b	.L4

.L32:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3
	b	.L4

.L3:
	bl	getint
	mov	r9, r0
	ldr	r8, [fp, #-416]
	ldr	r10, =-412
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-416]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-416]
	b	.L2

.L4:

.L14:
	ldr	r9, [fp, #-416]
	cmp	r9, #0
	bne	.L33
	ldr	r10, =1
	cmp	r10, #0
	b	.L16

.L33:
	ldr	r10, =0
	cmp	r10, #0
	b	.L15
	b	.L16

.L15:
	ldr	r9, [fp, #-416]
	ldr	r8, =1
	sub	r9, r9, r8
	str	r9, [fp, #-416]
	ldr	r9, [fp, #-420]
	ldr	r8, [fp, #-416]
	ldr	r10, =-412
	add	r10, r10, fp
	ldr	r8,	[r10, r8,LSL#2]
	add	r9, r8, r9
	str	r9, [fp, #-420]
	b	.L14

.L16:
	ldr	r9, [fp, #-420]
	ldr	r8, =79
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
