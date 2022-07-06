	.global	k
	.data
	.align	2
	.type	k, %object
	.size	k, 4
k:
	.word	0


	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #36
	ldr	r9, =3389
	movw	r10, #:lower16:k
	movt	r10, #:upper16:k
	str	r9, [r10, #0]
	movw	r9, #:lower16:k
	movt	r9, #:upper16:k
	ldr	r9, [r9, #0]
	ldr	r8, =10000
	cmp	r9, r8
	blt	.L51
	ldr	r10, =1
	cmp	r10, #0
	b	.L6

.L51:
	ldr	r10, =0
	cmp	r10, #0
	b	.L5
	b	.L6

.L5:
	ldr	r8, =1
	add	r9, r8, r9
	movw	r10, #:lower16:k
	movt	r10, #:upper16:k
	str	r9, [r10, #0]
	ldr	r9, =112
	str	r9, [fp, #-16]

.L16:
	ldr	r9, [fp, #-16]
	ldr	r8, =10
	cmp	r9, r8
	bgt	.L52
	ldr	r10, =1
	cmp	r10, #0
	b	.L18

.L52:
	ldr	r10, =0
	cmp	r10, #0
	b	.L17
	b	.L18

.L17:
	ldr	r9, [fp, #-16]
	ldr	r8, =88
	sub	r9, r9, r8
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	ldr	r8, =1000
	cmp	r9, r8
	blt	.L53
	ldr	r10, =1
	cmp	r10, #0
	b	.L29

.L53:
	ldr	r10, =0
	cmp	r10, #0
	b	.L28
	b	.L29

.L28:
	ldr	r9, =9
	str	r9, [fp, #-20]
	ldr	r9, =11
	str	r9, [fp, #-24]
	ldr	r9, =10
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-20]
	sub	r9, r9, r8
	str	r9, [fp, #-16]
	ldr	r9, =11
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-28]
	add	r9, r8, r9
	ldr	r8, [fp, #-24]
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L29:
	b	.L16

.L18:
	ldr	r9, [fp, #-16]
	mov	r0, r9
	bl	putint

.L6:
	movw	r9, #:lower16:k
	movt	r9, #:upper16:k
	ldr	r9, [r9, #0]
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
