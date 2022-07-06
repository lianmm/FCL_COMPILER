
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #44
	ldr	r9, =5
	str	r9, [fp, #-16]
	ldr	r9, =5
	str	r9, [fp, #-20]
	ldr	r9, =1
	str	r9, [fp, #-24]
	ldr	r9, =-2
	str	r9, [fp, #-28]
	ldr	r9, =2
	str	r9, [fp, #-32]
	ldr	r9, [fp, #-28]
	ldr	r8, =1
	mul	r9, r8, r9
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	ldr	r8, =0
	cmp	r9, r8
	blt	.L84
	ldr	r10, =1
	cmp	r10, #0
	b	.L20

.L84:
	ldr	r10, =0
	cmp	r10, #0
	b	.L19
	b	.L20

.L20:
	ldr	r8, [fp, #-16]
	ldr	r7, [fp, #-20]
	sub	r8, r8, r7
	ldr	r7, =0
	cmp	r8, r7
	bne	.L85
	ldr	r10, =1
	cmp	r10, #0
	b	.L31

.L85:
	ldr	r10, =0
	cmp	r10, #0
	b	.L32
	b	.L31

.L32:
	ldr	r8, [fp, #-24]
	ldr	r7, =3
	add	r8, r7, r8
	ldr	r7, =2
	mov	r0, r8
	mov	r1, r7
	bl	__aeabi_idivmod
	mov	r8, r1
	ldr	r7, =0
	cmp	r8, r7
	bne	.L86
	ldr	r10, =1
	cmp	r10, #0
	b	.L33

.L86:
	ldr	r10, =0
	cmp	r10, #0
	b	.L33

.L33:

.L31:

.L21:

.L19:
	beq	.L17
	b	.L18

.L17:
	ldr	r9, [fp, #-32]
	mov	r0, r9
	bl	putint

.L18:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	ldr	r8, =67
	add	r9, r8, r9
	ldr	r8, =0
	cmp	r9, r8
	blt	.L87
	ldr	r10, =1
	cmp	r10, #0
	b	.L52

.L87:
	ldr	r10, =0
	cmp	r10, #0
	b	.L51
	b	.L52

.L52:
	ldr	r8, [fp, #-16]
	ldr	r7, [fp, #-20]
	sub	r8, r8, r7
	ldr	r7, =0
	cmp	r8, r7
	bne	.L88
	ldr	r10, =1
	cmp	r10, #0
	b	.L63

.L88:
	ldr	r10, =0
	cmp	r10, #0
	b	.L64
	b	.L63

.L64:
	ldr	r8, [fp, #-24]
	ldr	r7, =2
	add	r8, r7, r8
	ldr	r7, =2
	mov	r0, r8
	mov	r1, r7
	bl	__aeabi_idivmod
	mov	r8, r1
	ldr	r7, =0
	cmp	r8, r7
	bne	.L89
	ldr	r10, =1
	cmp	r10, #0
	b	.L65

.L89:
	ldr	r10, =0
	cmp	r10, #0
	b	.L65

.L65:

.L63:

.L53:

.L51:
	beq	.L49
	b	.L50

.L49:
	ldr	r9, =4
	str	r9, [fp, #-32]
	ldr	r9, [fp, #-32]
	mov	r0, r9
	bl	putint

.L50:
	ldr	r9, =0
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
