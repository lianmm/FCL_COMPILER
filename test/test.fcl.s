	.arch armv7-a
	.fpu vfpv4
	.arm
	.global	var1
	.data
	.align	2
	.type	var1, %object
	.size	var1, 4
var1:
	.word	0
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r6-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #44
	mov	r10, #0
	mov	r1, r10
	mov	r10, #40
	mov	r2, r10
	mov	r10, #65496
	movt	r10, #65535
	add	r10, fp, r10
	mov	r0, r10
	bl	memset(PLT)
	mov	r10, #1
	mov	r0, #65496
	movt	r0, #65535
	add	r0, r0, r11
	str	r10, [r0, #0]
	mov	r10, #2
	mov	r0, #65496
	movt	r0, #65535
	add	r0, r0, r11
	str	r10, [r0, #4]
	mov	r10, #3
	mov	r0, #65496
	movt	r0, #65535
	add	r0, r0, r11
	str	r10, [r0, #8]
	mov	r10, #4
	mov	r0, #65496
	movt	r0, #65535
	add	r0, r0, r11
	str	r10, [r0, #12]
	mov	r10, #5
	mov	r0, #65496
	movt	r0, #65535
	add	r0, r0, r11
	str	r10, [r0, #16]
	mov	r10, #1
	mov	r0, #65496
	movt	r0, #65535
	add	r0, r0, r11
	str	r10, [r0, #20]
	mov	r10, #2
	mov	r0, #65496
	movt	r0, #65535
	add	r0, r0, r11
	str	r10, [r0, #24]
	mov	r10, #3
	mov	r0, #65496
	movt	r0, #65535
	add	r0, r0, r11
	str	r10, [r0, #28]
	mov	r10, #4
	mov	r0, #65496
	movt	r0, #65535
	add	r0, r0, r11
	str	r10, [r0, #32]
	mov	r10, #5
	mov	r0, #65496
	movt	r0, #65535
	add	r0, r0, r11
	str	r10, [r0, #36]
	bl	getint
	mov	r10, r0
	sub	r9, r10, #1
	add	r8, r9, #1
	mov	r7, r8,LSL#1
	add	r6, r7, #1
	mov	r0, #65496
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r6, [r0, r6,LSL#2]
	add	r7, r7, #0
	mov	r0, #65496
	movt	r0, #65535
	b	.L17
	.ltorg
.L17:
	add	r0, r0, r11
	ldr	r7, [r0, r7,LSL#2]
	add	r7, r7, r6
	mov	r0, r7
	bl	putint
	mov		r0, #0
	b	.L1
	.ltorg
.L1:
	add	sp, sp, #44
	pop	{r6-r10,fp, pc}
	.size	main, .-main
	.section .note.GNU-stack,"",%progbits
