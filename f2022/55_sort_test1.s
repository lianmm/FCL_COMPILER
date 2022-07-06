	.global	n
	.data
	.align	2
	.type	n, %object
	.size	n, 4
n:
	.word	0


	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	bubblesort
	.type	bubblesort, %function
bubblesort:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #52
	str	r0, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]

.L5:
	ldr	r9, [fp, #-20]
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	ldr	r7, =1
	sub	r8, r8, r7
	cmp	r9, r8
	blt	.L119
	ldr	r10, =1
	cmp	r10, #0
	b	.L7

.L119:
	ldr	r10, =0
	cmp	r10, #0
	b	.L6
	b	.L7

.L6:
	ldr	r9, =0
	str	r9, [fp, #-24]

.L17:
	ldr	r9, [fp, #-24]
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	ldr	r7, [fp, #-20]
	sub	r8, r8, r7
	ldr	r7, =1
	sub	r8, r8, r7
	cmp	r9, r8
	blt	.L120
	ldr	r10, =1
	cmp	r10, #0
	b	.L19

.L120:
	ldr	r10, =0
	cmp	r10, #0
	b	.L18
	b	.L19

.L18:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	ldr	r8, [fp, #-24]
	ldr	r7, =1
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	cmp	r9, r8
	bgt	.L121
	ldr	r10, =1
	cmp	r10, #0
	b	.L30

.L121:
	ldr	r10, =0
	cmp	r10, #0
	b	.L29
	b	.L30

.L29:
	ldr	r9, [fp, #-24]
	ldr	r8, =1
	add	r9, r8, r9
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	ldr	r8, [fp, #-24]
	ldr	r7, =1
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	str	r9,	[r7, r8,LSL#2]
	ldr	r9, [fp, #-28]
	ldr	r8, [fp, #-24]
	ldr	r7, [fp, #-16]
	str	r9,	[r7, r8,LSL#2]

.L30:
	ldr	r9, [fp, #-24]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-24]
	b	.L17

.L19:
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L5

.L7:
	ldr	r9, =0
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	bubblesort, .-bubblesort

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 236
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #240
	ldr	r9, =10
	movw	r10, #:lower16:n
	movt	r10, #:upper16:n
	str	r9, [r10, #0]
	ldr	r9, =4
	ldr	r8, =0
	ldr	r10, =-52
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =3
	ldr	r8, =1
	ldr	r10, =-52
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =9
	ldr	r8, =2
	ldr	r10, =-52
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =2
	ldr	r8, =3
	ldr	r10, =-52
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =0
	ldr	r8, =4
	ldr	r10, =-52
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =1
	ldr	r8, =5
	ldr	r10, =-52
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =6
	ldr	r8, =6
	ldr	r10, =-52
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =5
	ldr	r8, =7
	ldr	r10, =-52
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =7
	ldr	r8, =8
	ldr	r10, =-52
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =8
	ldr	r8, =9
	ldr	r10, =-52
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =-52
	add	r9, r11, r9
	mov	r0, r9
	bl	bubblesort
	mov	r9, r0
	str	r9, [fp, #-56]

.L101:
	ldr	r9, [fp, #-56]
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	cmp	r9, r8
	blt	.L122
	ldr	r10, =1
	cmp	r10, #0
	b	.L103

.L122:
	ldr	r10, =0
	cmp	r10, #0
	b	.L102
	b	.L103

.L102:
	ldr	r9, [fp, #-56]
	ldr	r10, =-52
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	str	r9, [fp, #-60]
	ldr	r9, [fp, #-60]
	mov	r0, r9
	bl	putint
	ldr	r9, =10
	str	r9, [fp, #-60]
	ldr	r9, [fp, #-60]
	mov	r0, r9
	bl	putch
	ldr	r9, [fp, #-56]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-56]
	b	.L101

.L103:
	ldr	r9, =0
	mov	r0, r9
	b	.L64

.L64:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
