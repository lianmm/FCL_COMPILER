
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	if_if_Else
	.type	if_if_Else, %function
if_if_Else:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #28
	ldr	r9, =5
	str	r9, [fp, #-16]
	ldr	r9, =10
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-16]
	ldr	r8, =5
	cmp	r9, r8
	beq	.L8
	b	.L9

.L8:
	ldr	r9, [fp, #-20]
	ldr	r8, =10
	cmp	r9, r8
	beq	.L14
	b	.L15

.L14:
	ldr	r9, =25
	str	r9, [fp, #-16]

.L15:
	b	.L10

.L9:
	ldr	r9, [fp, #-16]
	ldr	r8, =15
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L10:
	ldr	r9, [fp, #-16]
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	if_if_Else, .-if_if_Else

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
	bl	if_if_Else
	mov	r9, r0
	mov	r0, r9
	b	.L28

.L28:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main