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
	.global	counting_s
	.type	counting_s, %function
counting_s:
	@ args = 0, pretend = 0, frame = 144
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #148
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r9, =0
	str	r9, [fp, #-76]
	ldr	r9, =0
	str	r9, [fp, #-68]
	ldr	r9, =0
	str	r9, [fp, #-72]

.L11:
	ldr	r9, [fp, #-76]
	ldr	r8, =10
	cmp	r9, r8
	blt	.L162
	ldr	r10, =1
	cmp	r10, #0
	b	.L13

.L162:
	ldr	r10, =0
	cmp	r10, #0
	b	.L12
	b	.L13

.L12:
	ldr	r9, =0
	ldr	r8, [fp, #-76]
	ldr	r10, =-64
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-76]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-76]
	b	.L11

.L13:

.L26:
	ldr	r9, [fp, #-68]
	ldr	r8, [fp, #-24]
	cmp	r9, r8
	blt	.L163
	ldr	r10, =1
	cmp	r10, #0
	b	.L28

.L163:
	ldr	r10, =0
	cmp	r10, #0
	b	.L27
	b	.L28

.L27:
	ldr	r9, [fp, #-68]
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	ldr	r10, =-64
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =1
	add	r9, r8, r9
	ldr	r8, [fp, #-68]
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r10, =-64
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-68]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-68]
	b	.L26

.L28:
	ldr	r9, =1
	str	r9, [fp, #-76]

.L47:
	ldr	r9, [fp, #-76]
	ldr	r8, =10
	cmp	r9, r8
	blt	.L164
	ldr	r10, =1
	cmp	r10, #0
	b	.L49

.L164:
	ldr	r10, =0
	cmp	r10, #0
	b	.L48
	b	.L49

.L48:
	ldr	r9, [fp, #-76]
	ldr	r10, =-64
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, [fp, #-76]
	ldr	r7, =1
	sub	r8, r8, r7
	ldr	r10, =-64
	add	r10, r10, fp
	ldr	r8,	[r10, r8,LSL#2]
	add	r9, r8, r9
	ldr	r8, [fp, #-76]
	ldr	r10, =-64
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-76]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-76]
	b	.L47

.L49:
	ldr	r9, [fp, #-24]
	str	r9, [fp, #-72]

.L71:
	ldr	r9, [fp, #-72]
	ldr	r8, =0
	cmp	r9, r8
	bgt	.L165
	ldr	r10, =1
	cmp	r10, #0
	b	.L73

.L165:
	ldr	r10, =0
	cmp	r10, #0
	b	.L72
	b	.L73

.L72:
	ldr	r9, [fp, #-72]
	ldr	r8, =1
	sub	r9, r9, r8
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	ldr	r10, =-64
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =1
	sub	r9, r9, r8
	ldr	r8, [fp, #-72]
	ldr	r7, =1
	sub	r8, r8, r7
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r10, =-64
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-72]
	ldr	r8, =1
	sub	r9, r9, r8
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	ldr	r8, [fp, #-72]
	ldr	r7, =1
	sub	r8, r8, r7
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r10, =-64
	add	r10, r10, fp
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, [fp, #-20]
	str	r9,	[r7, r8,LSL#2]
	ldr	r9, [fp, #-72]
	ldr	r8, =1
	sub	r9, r9, r8
	str	r9, [fp, #-72]
	b	.L71

.L73:
	ldr	r9, =0
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	counting_s, .-counting_s

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 332
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #336
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
	ldr	r8, =-96
	add	r8, r11, r8
	movw	r7, #:lower16:n
	movt	r7, #:upper16:n
	ldr	r7, [r7, #0]
	mov	r0, r9
	mov	r1, r8
	mov	r2, r7
	bl	counting_s
	mov	r9, r0
	str	r9, [fp, #-56]

.L144:
	ldr	r9, [fp, #-56]
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	cmp	r9, r8
	blt	.L166
	ldr	r10, =1
	cmp	r10, #0
	b	.L146

.L166:
	ldr	r10, =0
	cmp	r10, #0
	b	.L145
	b	.L146

.L145:
	ldr	r9, [fp, #-56]
	ldr	r10, =-96
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	str	r9, [fp, #-100]
	ldr	r9, [fp, #-100]
	mov	r0, r9
	bl	putint
	ldr	r9, =10
	str	r9, [fp, #-100]
	ldr	r9, [fp, #-100]
	mov	r0, r9
	bl	putch
	ldr	r9, [fp, #-56]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-56]
	b	.L144

.L146:
	ldr	r9, =0
	mov	r0, r9
	b	.L104

.L104:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
