
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	ifElseIf
	.type	ifElseIf, %function
ifElseIf:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #36
	ldr	r9, =5
	str	r9, [fp, #-16]
	ldr	r9, =10
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-16]
	ldr	r8, =6
	cmp	r9, r8
	beq	.L11
	b	.L12

.L12:
	ldr	r7, [fp, #-20]
	ldr	r6, =11
	cmp	r7, r6

.L13:

.L11:
	beq	.L8
	b	.L9

.L8:
	mov	r0, r9
	b	.L1
	b	.L10

.L9:
	ldr	r9, [fp, #-20]
	ldr	r8, =10
	cmp	r9, r8
	beq	.L24
	b	.L23

.L24:
	ldr	r8, [fp, #-16]
	ldr	r7, =1
	cmp	r8, r7

.L25:

.L23:
	beq	.L20
	b	.L21

.L20:
	ldr	r9, =25
	str	r9, [fp, #-16]
	b	.L22

.L21:
	ldr	r9, [fp, #-20]
	ldr	r8, =10
	cmp	r9, r8
	beq	.L39
	b	.L38

.L39:
	ldr	r8, [fp, #-16]
	ldr	r7, =-5
	cmp	r8, r7

.L40:

.L38:
	beq	.L35
	b	.L36

.L35:
	ldr	r9, =15
	add	r9, r9, r8
	str	r9, [fp, #-16]
	b	.L37

.L36:
	ldr	r9, [fp, #-16]
	rsb	r9, r9, #0
	str	r9, [fp, #-16]

.L37:

.L22:

.L10:
	ldr	r9, [fp, #-16]
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	ifElseIf, .-ifElseIf

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #20
	bl	ifElseIf
	mov	r9, r0
	mov	r0, r9
	bl	putint
	ldr	r9, =0
	mov	r0, r9
	b	.L56

.L56:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
