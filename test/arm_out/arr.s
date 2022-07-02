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
	.file	"arr.c"
	.section	.rodata
	.align	2
.LC0:
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 232
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #232
	mov	r3, #3
	str	r3, [fp, #-8]
	sub	r3, fp, #40
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	movw	r3, #:lower16:.LC0
	movt	r3, #:upper16:.LC0
	sub	ip, fp, #72
	mov	lr, r3
	ldmia	 !, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	sub	r3, fp, #104
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r2, #0
	str	r2, [r3, #0]
	add	r3, r3, #4
	mov	r3, #1
	str	r3, [fp, #-104]
	mov	r3, #2
	str	r3, [fp, #-100]
	mov	r3, #3
	str	r3, [fp, #-96]
	mov	r3, #5
	str	r3, [fp, #-88]
	movw	r3, #:lower16:a.1264
	movt	r3, #:upper16:a.1264
	ldr	r3, [r3, #24]
	str	r3, [fp, #-80]
	mov	r3, #8
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-84]
	str	r3, [fp, #-136]
	ldr	r3, [fp, #-52]
	str	r3, [fp, #-132]
	mov	r3, #3
	str	r3, [fp, #-128]
	mov	r3, #4
	str	r3, [fp, #-124]
	mov	r3, #5
	str	r3, [fp, #-120]
	mov	r3, #6
	str	r3, [fp, #-116]
	mov	r3, #7
	str	r3, [fp, #-112]
	mov	r3, #8
	str	r3, [fp, #-108]
	sub	r2, fp, #232
	mov	r3, #96
	mov	r0, r2
	mov	r1, #0
	mov	r2, r3
	bl	memset
	mov	r3, #1
	str	r3, [fp, #-184]
	mov	r3, #2
	str	r3, [fp, #-180]
	mov	r3, #3
	str	r3, [fp, #-176]
	mov	r3, #6
	str	r3, [fp, #-172]
	mov	r3, #7
	str	r3, [fp, #-168]
	mov	r3, #8
	str	r3, [fp, #-152]
	mov	r3, #9
	str	r3, [fp, #-148]
	mov	r3, #10
	str	r3, [fp, #-144]
	ldr	r2, [fp, #-108]
	ldr	r3, [fp, #-136]
	add	r2, r2, r3
	ldr	r3, [fp, #-132]
	add	r2, r2, r3
	ldr	r3, [fp, #-80]
	add	r3, r2, r3
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	main, .-main
	.section	.rodata
	.align	2
	.type	a.1264, %object
	.size	a.1264, 32
a.1264:
	.word	1
	.word	2
	.word	3
	.word	4
	.space	8
	.word	7
	.space	4
	.ident	"GCC: (crosstool-NG hg+unknown-20130521.154019 - tc0002) 4.6.4"
	.section	.note.GNU-stack,"",%progbits
