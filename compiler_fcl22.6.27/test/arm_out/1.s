	.arch armv7-a
	.eabi_attribute 27, 3
	.fpu vfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"1.c"
	.text

	
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, #1
	str	r3, [fp, #-8]
	mov	r3, #1
	str	r3, [fp, #-12]
	b	.L2
.L6:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L7
.L3:
	ldr	r3, [fp, #-8]
	cmp	r3, #9
	beq	.L8
.L4:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	b	.L2
.L7:
	mov	r0, r0	@ nop
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #20
	ble	.L6
	b	.L5
.L8:
	mov	r0, r0	@ nop
.L5:
	ldr	r0, [fp, #-12]
	bl	putint
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	main, .-main
	.ident	"GCC: (crosstool-NG hg+unknown-20130521.154019 - tc0002) 4.6.4"
	.section	.note.GNU-stack,"",%progbits
