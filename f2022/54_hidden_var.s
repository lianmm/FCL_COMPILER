	.global	b
	.data
	.align	2
	.type	b, %object
	.size	b, 4
b:
	.word	5

	.global	c
	.data
	.align	2
	.type	c, %object
	.size	c, 16
c:
	.word	6
	.word	7
	.word	8
	.word	9

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
	ldr	r9, =1
	str	r9, [fp, #-16]
	ldr	r9, =2
	str	r9, [fp, #-20]
	ldr	r9, =3
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-20]
	mov	r0, r9
	bl	putint
	mov	r0, r9
	bl	putint
	ldr	r9, [fp, #-16]
	mov	r0, r9
	bl	putint
	ldr	r9, =10
	mov	r0, r9
	bl	putch

.L11:
	ldr	r9, [fp, #-16]
	ldr	r8, =5
	cmp	r9, r8
	blt	.L30
	ldr	r10, =1
	cmp	r10, #0
	b	.L13

.L30:
	ldr	r10, =0
	cmp	r10, #0
	b	.L12
	b	.L13

.L12:
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-20]
	cmp	r9, #0
	bne	.L31
	ldr	r10, =1
	cmp	r10, #0
	b	.L24

.L31:
	ldr	r10, =0
	cmp	r10, #0
	b	.L23
	b	.L24

.L23:
	b	.L13

.L24:
	b	.L11

.L13:
	ldr	r9, [fp, #-16]
	mov	r0, r9
	bl	putint
	ldr	r9, =10
	mov	r0, r9
	bl	putch
	ldr	r9, =1
	ldr	r8, =2
	movw	r10, #:lower16:c
	movt	r10, #:upper16:c
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =0
	ldr	r10, =-80
	add	r10, r10, fp
	str	r9,	[r10, #0]
	ldr	r9, =9
	ldr	r10, =-80
	add	r10, r10, fp
	str	r9,	[r10, #4]
	ldr	r10, =-80
	add	r10, r10, fp
	mov	r12, #0
	str	r12, [r10, #8]
	str	r12, [r10, #12]
	str	r12, [r10, #16]
	str	r12, [r10, #20]
	str	r12, [r10, #24]
	str	r12, [r10, #28]

	ldr	r9, =8
	ldr	r10, =-80
	add	r10, r10, fp
	str	r9,	[r10, #32]
	ldr	r9, =3
	ldr	r10, =-80
	add	r10, r10, fp
	str	r9,	[r10, #36]
	ldr	r10, =-80
	add	r10, r10, fp
	mov	r12, #0
	str	r12, [r10, #40]
	str	r12, [r10, #44]
	str	r12, [r10, #48]
	str	r12, [r10, #52]
	str	r12, [r10, #56]
	str	r12, [r10, #60]

	ldr	r9, =2
	str	r9, [fp, #-20]
	ldr	r9, =2
	movw	r10, #:lower16:c
	movt	r10, #:upper16:c
	ldr	r9,	[r10, r9,LSL#2]
	cmp	r9, #0
	bne	.L32
	ldr	r10, =1
	cmp	r10, #0
	b	.L29

.L32:
	ldr	r10, =0
	cmp	r10, #0
	b	.L28
	b	.L29

.L28:
	ldr	r10, =-160
	add	r10, r10, fp
	mov	r12, #0
	str	r12, [r10, #0]
	str	r12, [r10, #4]
	str	r12, [r10, #8]
	str	r12, [r10, #12]
	str	r12, [r10, #16]

	ldr	r10, =-160
	add	r10, r10, fp
	mov	r12, #0
	str	r12, [r10, #20]
	str	r12, [r10, #24]
	str	r12, [r10, #28]
	str	r12, [r10, #32]
	str	r12, [r10, #36]

	ldr	r9, =2
	ldr	r10, =-160
	add	r10, r10, fp
	str	r9,	[r10, #40]
	ldr	r9, =1
	ldr	r10, =-160
	add	r10, r10, fp
	str	r9,	[r10, #44]
	ldr	r9, =8
	ldr	r10, =-160
	add	r10, r10, fp
	str	r9,	[r10, #48]

	ldr	r10, =-160
	add	r10, r10, fp
	mov	r12, #0
	str	r12, [r10, #64]
	str	r12, [r10, #68]
	str	r12, [r10, #72]
	str	r12, [r10, #76]
	str	r12, [r10, #80]
	str	r12, [r10, #84]
	str	r12, [r10, #88]
	str	r12, [r10, #92]
	str	r12, [r10, #96]
	str	r12, [r10, #100]
	str	r12, [r10, #104]
	str	r12, [r10, #108]
	str	r12, [r10, #112]
	str	r12, [r10, #116]
	str	r12, [r10, #120]
	str	r12, [r10, #124]
	str	r12, [r10, #128]
	str	r12, [r10, #132]
	str	r12, [r10, #136]

	ldr	r9, [fp, #-20]
	ldr	r8, =0
	ldr	r7, =5
	ldr	r6, =0
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =5
	mul	r7, r9, r7
	add	r8, r7, r8
	ldr	r10, =-160
	add	r10, r10, fp
	ldr	r8,	[r10, r8,LSL#2]
	mov	r0, r8
	bl	putint
	ldr	r8, =1
	ldr	r7, =5
	ldr	r6, =0
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =5
	mul	r7, r9, r7
	add	r8, r7, r8
	ldr	r10, =-160
	add	r10, r10, fp
	ldr	r8,	[r10, r8,LSL#2]
	mov	r0, r8
	bl	putint
	ldr	r8, =2
	ldr	r7, =5
	ldr	r6, =0
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =5
	mul	r9, r9, r7
	add	r9, r9, r8
	ldr	r10, =-160
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	mov	r0, r9
	bl	putint

.L29:
	ldr	r9, =10
	mov	r0, r9
	bl	putch
	movw	r9, #:lower16:b
	movt	r9, #:upper16:b
	ldr	r9, [r9, #0]
	mov	r0, r9
	bl	putint
	ldr	r9, =10
	mov	r0, r9
	bl	putch
	ldr	r9, =0
	movw	r10, #:lower16:c
	movt	r10, #:upper16:c
	ldr	r9,	[r10, r9,LSL#2]
	mov	r0, r9
	bl	putint
	ldr	r9, =1
	movw	r10, #:lower16:c
	movt	r10, #:upper16:c
	ldr	r9,	[r10, r9,LSL#2]
	mov	r0, r9
	bl	putint
	ldr	r9, =2
	movw	r10, #:lower16:c
	movt	r10, #:upper16:c
	ldr	r9,	[r10, r9,LSL#2]
	mov	r0, r9
	bl	putint
	ldr	r9, =3
	movw	r10, #:lower16:c
	movt	r10, #:upper16:c
	ldr	r9,	[r10, r9,LSL#2]
	mov	r0, r9
	bl	putint
	ldr	r9, =10
	mov	r0, r9
	bl	putch
	ldr	r9, =0
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
