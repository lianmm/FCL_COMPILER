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
	.file	"test.c"
	.global	__aeabi_idiv
	.text
	.align	2
	.global	func
	.type	func, %function
func:
	@ args = 16, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	mov	r3, #3
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	add	r2, r2, r3
	ldr	r3, [fp, #-32]
	add	r2, r2, r3
	ldr	r3, [fp, #-36]
	add	r2, r2, r3
	ldr	r3, [fp, #4]
	ldr	r1, [fp, #8]
	mul	r3, r1, r3
	add	r4, r2, r3
	ldr	r0, [fp, #12]
	ldr	r1, [fp, #16]
	bl	__aeabi_idiv
	mov	r3, r0
	rsb	r3, r3, r4
	mov	r0, r3
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, pc}
	.size	func, .-func
	.global	__aeabi_idivmod
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, #2
	str	r3, [fp, #-8]
	mov	r3, #35
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r0, r3
	ldr	r1, [fp, #-8]
	bl	__aeabi_idivmod
	mov	r3, r1
	mov	r0, r3
	bl	putint
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	main, .-main
	.ident	"GCC: (crosstool-NG hg+unknown-20130521.154019 - tc0002) 4.6.4"
	.section	.note.GNU-stack,"",%progbits
