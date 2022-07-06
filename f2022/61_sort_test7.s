	.global	buf
	.data
	.align	2
	.type	buf, %object
	.size	buf, 800
buf:
	.space	800

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	merge_sort
	.type	merge_sort, %function
merge_sort:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #60
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	add	r9, r8, r9
	ldr	r8, [fp, #-20]
	cmp	r9, r8
	bge	.L116
	ldr	r10, =1
	cmp	r10, #0
	b	.L3

.L116:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2
	b	.L3

.L2:
	b	.L1

.L3:
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-20]
	add	r7, r8, r9
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idiv
	mov	r7, r0
	str	r7, [fp, #-24]
	ldr	r7, [fp, #-24]
	mov	r0, r9
	mov	r1, r7
	bl	merge_sort
	mov	r0, r7
	mov	r1, r8
	bl	merge_sort
	str	r9, [fp, #-28]
	str	r7, [fp, #-32]
	str	r9, [fp, #-36]

.L16:
	ldr	r9, [fp, #-28]
	ldr	r8, [fp, #-24]
	cmp	r9, r8
	blt	.L117
	ldr	r10, =1
	cmp	r10, #0
	b	.L19

.L117:
	ldr	r10, =0
	cmp	r10, #0
	b	.L20
	b	.L19

.L20:
	ldr	r8, [fp, #-32]
	ldr	r7, [fp, #-20]
	cmp	r8, r7
	blt	.L118
	ldr	r10, =1
	cmp	r10, #0
	b	.L21

.L118:
	ldr	r10, =0
	cmp	r10, #0
	b	.L21

.L21:

.L19:
	beq	.L17
	b	.L18

.L17:
	ldr	r9, [fp, #-28]
	ldr	r8, =100
	ldr	r7, =0
	mul	r8, r7, r8
	add	r9, r8, r9
	movw	r10, #:lower16:buf
	movt	r10, #:upper16:buf
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, [fp, #-32]
	ldr	r7, =100
	ldr	r6, =0
	mul	r7, r6, r7
	add	r8, r7, r8
	movw	r10, #:lower16:buf
	movt	r10, #:upper16:buf
	ldr	r8,	[r10, r8,LSL#2]
	cmp	r9, r8
	blt	.L119
	ldr	r10, =1
	cmp	r10, #0
	b	.L29

.L119:
	ldr	r10, =0
	cmp	r10, #0
	b	.L28
	b	.L29

.L28:
	ldr	r9, [fp, #-28]
	ldr	r8, =100
	ldr	r7, =0
	mul	r8, r7, r8
	add	r9, r8, r9
	movw	r10, #:lower16:buf
	movt	r10, #:upper16:buf
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, [fp, #-36]
	ldr	r7, =100
	ldr	r6, =1
	mul	r7, r6, r7
	add	r8, r7, r8
	movw	r10, #:lower16:buf
	movt	r10, #:upper16:buf
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-28]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-28]
	b	.L30

.L29:
	ldr	r9, [fp, #-32]
	ldr	r8, =100
	ldr	r7, =0
	mul	r8, r7, r8
	add	r9, r8, r9
	movw	r10, #:lower16:buf
	movt	r10, #:upper16:buf
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, [fp, #-36]
	ldr	r7, =100
	ldr	r6, =1
	mul	r7, r6, r7
	add	r8, r7, r8
	movw	r10, #:lower16:buf
	movt	r10, #:upper16:buf
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-32]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-32]

.L30:
	ldr	r9, [fp, #-36]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-36]
	b	.L16

.L18:

.L58:
	ldr	r9, [fp, #-28]
	ldr	r8, [fp, #-24]
	cmp	r9, r8
	blt	.L120
	ldr	r10, =1
	cmp	r10, #0
	b	.L60

.L120:
	ldr	r10, =0
	cmp	r10, #0
	b	.L59
	b	.L60

.L59:
	ldr	r9, [fp, #-28]
	ldr	r8, =100
	ldr	r7, =0
	mul	r8, r7, r8
	add	r9, r8, r9
	movw	r10, #:lower16:buf
	movt	r10, #:upper16:buf
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, [fp, #-36]
	ldr	r7, =100
	ldr	r6, =1
	mul	r7, r6, r7
	add	r8, r7, r8
	movw	r10, #:lower16:buf
	movt	r10, #:upper16:buf
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-28]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-36]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-36]
	b	.L58

.L60:

.L79:
	ldr	r9, [fp, #-32]
	ldr	r8, [fp, #-20]
	cmp	r9, r8
	blt	.L121
	ldr	r10, =1
	cmp	r10, #0
	b	.L81

.L121:
	ldr	r10, =0
	cmp	r10, #0
	b	.L80
	b	.L81

.L80:
	ldr	r9, [fp, #-32]
	ldr	r8, =100
	ldr	r7, =0
	mul	r8, r7, r8
	add	r9, r8, r9
	movw	r10, #:lower16:buf
	movt	r10, #:upper16:buf
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, [fp, #-36]
	ldr	r7, =100
	ldr	r6, =1
	mul	r7, r6, r7
	add	r8, r7, r8
	movw	r10, #:lower16:buf
	movt	r10, #:upper16:buf
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-32]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-32]
	ldr	r9, [fp, #-36]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-36]
	b	.L79

.L81:

.L100:
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-20]
	cmp	r9, r8
	blt	.L122
	ldr	r10, =1
	cmp	r10, #0
	b	.L102

.L122:
	ldr	r10, =0
	cmp	r10, #0
	b	.L101
	b	.L102

.L101:
	ldr	r9, [fp, #-16]
	ldr	r8, =100
	ldr	r7, =1
	mul	r8, r7, r8
	add	r9, r8, r9
	movw	r10, #:lower16:buf
	movt	r10, #:upper16:buf
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, [fp, #-16]
	ldr	r7, =100
	ldr	r6, =0
	mul	r7, r6, r7
	add	r8, r7, r8
	movw	r10, #:lower16:buf
	movt	r10, #:upper16:buf
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-16]
	b	.L100

.L102:

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	merge_sort, .-merge_sort

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 76
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #80
	ldr	r9, =0
	ldr	r8, =100
	ldr	r7, =0
	mul	r8, r7, r8
	add	r9, r8, r9
	movw	r10, #:lower16:buf
	movt	r10, #:upper16:buf
	add	r9, r10, r9,LSL#2
	mov	r0, r9
	bl	getarray
	mov	r9, r0
	str	r9, [fp, #-16]
	ldr	r9, =0
	ldr	r8, [fp, #-16]
	mov	r0, r9
	mov	r1, r8
	bl	merge_sort
	ldr	r9, =0
	ldr	r7, =100
	ldr	r6, =0
	mul	r7, r6, r7
	add	r9, r7, r9
	movw	r10, #:lower16:buf
	movt	r10, #:upper16:buf
	add	r9, r10, r9,LSL#2
	mov	r0, r8
	mov	r1, r9
	bl	putarray
	ldr	r9, =0
	mov	r0, r9
	b	.L115

.L115:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
