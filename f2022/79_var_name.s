	.arch armv7-a
	.fpu vfpv4
	.arm

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 216
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #220
	ldr	r10, =2
	str	r10, [r11, #-16]
	ldr	r10, =0
	mov	r1, r10
	ldr	r10, =80
	mov	r2, r10
	ldr	r10, =-100
	add	r10, r11, r10
	mov	r0, r10
	bl	memset(PLT)
	ldr	r10, =1
	ldr	r0, =-100
	add	r0, r0, r11
	str	r10, [r0, #0]
	ldr	r10, =2
	ldr	r0, =-100
	add	r0, r0, r11
	str	r10, [r0, #4]
	ldr	r0, =-100
	add	r0, r0, r11
	ldr	r12, =0
	str	r12, [r0, #8]
	str	r12, [r0, #12]
	str	r12, [r0, #16]
	str	r12, [r0, #20]
	str	r12, [r0, #24]
	str	r12, [r0, #28]
	str	r12, [r0, #32]
	str	r12, [r0, #36]
	str	r12, [r0, #40]
	str	r12, [r0, #44]
	str	r12, [r0, #48]
	str	r12, [r0, #52]
	str	r12, [r0, #56]
	str	r12, [r0, #60]
	str	r12, [r0, #64]
	str	r12, [r0, #68]
	str	r12, [r0, #72]
	str	r12, [r0, #76]
	ldr	r10, =0
	str	r10, [r11, #-104]
.L2:
	ldr	r10, [r11, #-16]
	ldr	r9, =20
	cmp	r10, r9
	blt	.L35
	ldr	r0, =1
	cmp	r0, #0
	b	.L4
	.ltorg
.L35:
	ldr	r0, =0
	cmp	r0, #0
	b	.L3
	b	.L4
	.ltorg
.L3:
	ldr	r10, [r11, #-16]
	ldr	r0, =-100
	add	r0, r0, r11
	ldr	r10, [r0, r10,LSL#2]
	ldr	r9, [r11, #-16]
	ldr	r8, =1
	sub	r9, r9, r8
	ldr	r0, =-100
	add	r0, r0, r11
	ldr	r9, [r0, r9,LSL#2]
	add	r10, r9, r10
	ldr	r9, [r11, #-16]
	ldr	r8, =2
	sub	r9, r9, r8
	ldr	r0, =-100
	add	r0, r0, r11
	ldr	r9, [r0, r9,LSL#2]
	add	r10, r9, r10
	ldr	r9, [r11, #-16]
	ldr	r0, =-100
	add	r0, r0, r11
	str	r10, [r0, r9,LSL#2]
	ldr	r10, [r11, #-104]
	ldr	r9, [r11, #-16]
	ldr	r0, =-100
	add	r0, r0, r11
	ldr	r9, [r0, r9,LSL#2]
	add	r10, r9, r10
	str	r10, [r11, #-104]
	ldr	r10, [r11, #-16]
	ldr	r0, =-100
	add	r0, r0, r11
	ldr	r10, [r0, r10,LSL#2]
	mov	r0, r10
	bl	putint
	ldr	r10, =10
	mov	r0, r10
	bl	putch
	ldr	r10, [r11, #-16]
	ldr	r9, =1
	add	r10, r9, r10
	str	r10, [r11, #-16]
	b	.L2
	.ltorg
.L4:
	ldr	r10, [r11, #-104]
	mov	r0, r10
	b	.L1
	.ltorg
.L1:
	add	sp, sp, #220
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
