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
	.global	QuickSort
	.type	QuickSort, %function
QuickSort:
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #84
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-24]
	cmp	r9, r8
	blt	.L171
	ldr	r10, =1
	cmp	r10, #0
	b	.L3

.L171:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2
	b	.L3

.L2:
	str	r9, [fp, #-28]
	str	r8, [fp, #-32]
	ldr	r7, [fp, #-16]
	ldr	r7,	[r7, r9,LSL#2]
	str	r7, [fp, #-36]

.L16:
	ldr	r7, [fp, #-28]
	ldr	r6, [fp, #-32]
	cmp	r7, r6
	blt	.L172
	ldr	r10, =1
	cmp	r10, #0
	b	.L18

.L172:
	ldr	r10, =0
	cmp	r10, #0
	b	.L17
	b	.L18

.L17:

.L22:
	ldr	r7, [fp, #-28]
	ldr	r6, [fp, #-32]
	cmp	r7, r6
	blt	.L173
	ldr	r10, =1
	cmp	r10, #0
	b	.L25

.L173:
	ldr	r10, =0
	cmp	r10, #0
	b	.L26
	b	.L25

.L26:
	ldr	r6, [fp, #-32]
	ldr	r5, [fp, #-16]
	ldr	r6,	[r5, r6,LSL#2]
	ldr	r5, [fp, #-36]
	ldr	r4, =1
	sub	r5, r5, r4
	cmp	r6, r5
	bgt	.L174
	ldr	r10, =1
	cmp	r10, #0
	b	.L27

.L174:
	ldr	r10, =0
	cmp	r10, #0
	b	.L27

.L27:

.L25:
	beq	.L23
	b	.L24

.L23:
	ldr	r7, [fp, #-32]
	ldr	r6, =1
	sub	r7, r7, r6
	str	r7, [fp, #-32]
	b	.L22

.L24:
	ldr	r7, [fp, #-28]
	ldr	r6, [fp, #-32]
	cmp	r7, r6
	blt	.L175
	ldr	r10, =1
	cmp	r10, #0
	b	.L44

.L175:
	ldr	r10, =0
	cmp	r10, #0
	b	.L43
	b	.L44

.L43:
	ldr	r7, [fp, #-32]
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, [fp, #-28]
	ldr	r5, [fp, #-16]
	str	r7,	[r5, r6,LSL#2]
	ldr	r7, [fp, #-28]
	ldr	r6, =1
	add	r7, r6, r7
	str	r7, [fp, #-28]

.L44:

.L57:
	ldr	r7, [fp, #-28]
	ldr	r6, [fp, #-32]
	cmp	r7, r6
	blt	.L176
	ldr	r10, =1
	cmp	r10, #0
	b	.L60

.L176:
	ldr	r10, =0
	cmp	r10, #0
	b	.L61
	b	.L60

.L61:
	ldr	r6, [fp, #-28]
	ldr	r5, [fp, #-16]
	ldr	r6,	[r5, r6,LSL#2]
	ldr	r5, [fp, #-36]
	cmp	r6, r5
	blt	.L177
	ldr	r10, =1
	cmp	r10, #0
	b	.L62

.L177:
	ldr	r10, =0
	cmp	r10, #0
	b	.L62

.L62:

.L60:
	beq	.L58
	b	.L59

.L58:
	ldr	r7, [fp, #-28]
	ldr	r6, =1
	add	r7, r6, r7
	str	r7, [fp, #-28]
	b	.L57

.L59:
	ldr	r7, [fp, #-28]
	ldr	r6, [fp, #-32]
	cmp	r7, r6
	blt	.L178
	ldr	r10, =1
	cmp	r10, #0
	b	.L76

.L178:
	ldr	r10, =0
	cmp	r10, #0
	b	.L75
	b	.L76

.L75:
	ldr	r7, [fp, #-28]
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, [fp, #-32]
	ldr	r5, [fp, #-16]
	str	r7,	[r5, r6,LSL#2]
	ldr	r7, [fp, #-32]
	ldr	r6, =1
	sub	r7, r7, r6
	str	r7, [fp, #-32]

.L76:
	b	.L16

.L18:
	ldr	r7, [fp, #-36]
	ldr	r6, [fp, #-28]
	ldr	r5, [fp, #-16]
	str	r7,	[r5, r6,LSL#2]
	ldr	r7, =1
	sub	r7, r6, r7
	str	r7, [fp, #-40]
	ldr	r7, [fp, #-16]
	ldr	r5, [fp, #-40]
	mov	r0, r7
	mov	r1, r9
	mov	r2, r5
	bl	QuickSort
	mov	r9, r0
	str	r9, [fp, #-40]
	ldr	r9, =1
	add	r9, r9, r6
	str	r9, [fp, #-40]
	ldr	r7, [fp, #-16]
	mov	r0, r7
	mov	r1, r9
	mov	r2, r8
	bl	QuickSort
	mov	r9, r0
	str	r9, [fp, #-40]

.L3:
	ldr	r9, =0
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	QuickSort, .-QuickSort

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 252
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #256
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
	ldr	r9, =9
	str	r9, [fp, #-60]
	ldr	r9, =-52
	add	r9, r11, r9
	ldr	r8, [fp, #-56]
	ldr	r7, [fp, #-60]
	mov	r0, r9
	mov	r1, r8
	mov	r2, r7
	bl	QuickSort
	mov	r9, r0
	str	r9, [fp, #-56]

.L153:
	ldr	r9, [fp, #-56]
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	cmp	r9, r8
	blt	.L179
	ldr	r10, =1
	cmp	r10, #0
	b	.L155

.L179:
	ldr	r10, =0
	cmp	r10, #0
	b	.L154
	b	.L155

.L154:
	ldr	r9, [fp, #-56]
	ldr	r10, =-52
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	str	r9, [fp, #-64]
	ldr	r9, [fp, #-64]
	mov	r0, r9
	bl	putint
	ldr	r9, =10
	str	r9, [fp, #-64]
	ldr	r9, [fp, #-64]
	mov	r0, r9
	bl	putch
	ldr	r9, [fp, #-56]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-56]
	b	.L153

.L155:
	ldr	r9, =0
	mov	r0, r9
	b	.L110

.L110:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
