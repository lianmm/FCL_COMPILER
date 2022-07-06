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
	.global	swap
	.type	swap, %function
swap:
	@ args = 0, pretend = 0, frame = 60
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #64
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-16]
	ldr	r8,	[r8, r9,LSL#2]
	str	r8, [fp, #-28]
	ldr	r8, [fp, #-24]
	ldr	r7, [fp, #-16]
	ldr	r7,	[r7, r8,LSL#2]
	ldr	r6, [fp, #-16]
	str	r7,	[r6, r9,LSL#2]
	ldr	r9, [fp, #-28]
	ldr	r7, [fp, #-16]
	str	r9,	[r7, r8,LSL#2]
	ldr	r9, =0
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	swap, .-swap

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	heap_ajust
	.type	heap_ajust, %function
heap_ajust:
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #108
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r9, [fp, #-20]
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mul	r9, r8, r9
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-32]

.L24:
	ldr	r9, [fp, #-32]
	ldr	r8, [fp, #-24]
	ldr	r7, =1
	add	r8, r7, r8
	cmp	r9, r8
	blt	.L196
	ldr	r10, =1
	cmp	r10, #0
	b	.L26

.L196:
	ldr	r10, =0
	cmp	r10, #0
	b	.L25
	b	.L26

.L25:
	ldr	r9, [fp, #-32]
	ldr	r8, [fp, #-24]
	cmp	r9, r8
	blt	.L197
	ldr	r10, =1
	cmp	r10, #0
	b	.L35

.L197:
	ldr	r10, =0
	cmp	r10, #0
	b	.L36
	b	.L35

.L36:
	ldr	r8, [fp, #-32]
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, [fp, #-32]
	ldr	r6, =1
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	cmp	r8, r7
	blt	.L198
	ldr	r10, =1
	cmp	r10, #0
	b	.L37

.L198:
	ldr	r10, =0
	cmp	r10, #0
	b	.L37

.L37:

.L35:
	beq	.L33
	b	.L34

.L33:
	ldr	r9, [fp, #-32]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-32]

.L34:
	ldr	r9, [fp, #-28]
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	ldr	r8, [fp, #-32]
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	cmp	r9, r8
	bgt	.L199
	ldr	r10, =1
	cmp	r10, #0
	b	.L54

.L199:
	ldr	r10, =0
	cmp	r10, #0
	b	.L53
	b	.L54

.L53:
	ldr	r9, =0
	mov	r0, r9
	b	.L11
	b	.L55

.L54:
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-28]
	ldr	r7, [fp, #-32]
	mov	r0, r9
	mov	r1, r8
	mov	r2, r7
	bl	swap
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-32]
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mul	r9, r8, r9
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-32]

.L55:
	b	.L24

.L26:
	ldr	r9, =0
	mov	r0, r9
	b	.L11

.L11:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	heap_ajust, .-heap_ajust

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	heap_sort
	.type	heap_sort, %function
heap_sort:
	@ args = 0, pretend = 0, frame = 192
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #196
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r9, [fp, #-20]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	ldr	r8, =1
	sub	r9, r9, r8
	str	r9, [fp, #-24]

.L84:
	ldr	r9, [fp, #-24]
	ldr	r8, =-1
	cmp	r9, r8
	bgt	.L200
	ldr	r10, =1
	cmp	r10, #0
	b	.L86

.L200:
	ldr	r10, =0
	cmp	r10, #0
	b	.L85
	b	.L86

.L85:
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	sub	r9, r9, r8
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-24]
	ldr	r7, [fp, #-28]
	mov	r0, r9
	mov	r1, r8
	mov	r2, r7
	bl	heap_ajust
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-24]
	ldr	r8, =1
	sub	r9, r9, r8
	str	r9, [fp, #-24]
	b	.L84

.L86:
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	sub	r9, r9, r8
	str	r9, [fp, #-24]

.L111:
	ldr	r9, [fp, #-24]
	ldr	r8, =0
	cmp	r9, r8
	bgt	.L201
	ldr	r10, =1
	cmp	r10, #0
	b	.L113

.L201:
	ldr	r10, =0
	cmp	r10, #0
	b	.L112
	b	.L113

.L112:
	ldr	r9, =0
	str	r9, [fp, #-32]
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-32]
	ldr	r7, [fp, #-24]
	mov	r0, r9
	mov	r1, r8
	mov	r2, r7
	bl	swap
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-24]
	ldr	r8, =1
	sub	r9, r9, r8
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-32]
	ldr	r7, [fp, #-28]
	mov	r0, r9
	mov	r1, r8
	mov	r2, r7
	bl	heap_ajust
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-24]
	ldr	r8, =1
	sub	r9, r9, r8
	str	r9, [fp, #-24]
	b	.L111

.L113:
	ldr	r9, =0
	mov	r0, r9
	b	.L74

.L74:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	heap_sort, .-heap_sort

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 244
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #248
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
	ldr	r9, =0
	str	r9, [fp, #-56]
	ldr	r9, =-52
	add	r9, r11, r9
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	mov	r0, r9
	mov	r1, r8
	bl	heap_sort
	mov	r9, r0
	str	r9, [fp, #-56]

.L178:
	ldr	r9, [fp, #-56]
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	cmp	r9, r8
	blt	.L202
	ldr	r10, =1
	cmp	r10, #0
	b	.L180

.L202:
	ldr	r10, =0
	cmp	r10, #0
	b	.L179
	b	.L180

.L179:
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
	b	.L178

.L180:
	ldr	r9, =0
	mov	r0, r9
	b	.L138

.L138:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
