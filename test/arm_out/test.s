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
	.global	maxn
	.section	.rodata
	.align	2
	.type	maxn, %object
	.size	maxn, 4
maxn:
	.word	18
	.global	mod
	.align	2
	.type	mod, %object
	.size	mod, 4
mod:
	.word	1000000007
	.comm	dp,52907904,4
	.comm	list,800,4
	.text
	.align	2
	.global	equal
	.type	equal, %function
equal:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bne	.L2
	mov	r3, #1
	b	.L3
.L2:
	mov	r3, #0
.L3:
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	equal, .-equal
	.global	__aeabi_idivmod
	.align	2
	.global	dfs
	.type	dfs, %function
dfs:
	@ args = 8, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	mov	r0, #36
	bl	putch
	ldr	r0, [fp, #-24]
	bl	putint
	mov	r0, #32
	bl	putch
	ldr	r0, [fp, #-28]
	bl	putint
	mov	r0, #32
	bl	putch
	ldr	r0, [fp, #-32]
	bl	putint
	mov	r0, #32
	bl	putch
	ldr	r0, [fp, #-36]
	bl	putint
	mov	r0, #32
	bl	putch
	ldr	r0, [fp, #4]
	bl	putint
	mov	r0, #32
	bl	putch
	ldr	r0, [fp, #8]
	bl	putint
	mov	r0, #32
	bl	putch
	movw	r2, #:lower16:dp
	movt	r2, #:upper16:dp
	ldr	r1, [fp, #4]
	ldr	r0, [fp, #-36]
	ldr	ip, [fp, #-28]
	ldr	r4, [fp, #-32]
	ldr	r5, [fp, #-24]
	mov	r3, r1
	mov	r3, r3, asl #3
	rsb	r3, r1, r3
	movw	r1, #13936
	movt	r1, 11
	mul	r1, r1, r5
	add	r1, r3, r1
	mov	r3, r0
	mov	r3, r3, asl #6
	rsb	r3, r0, r3
	mov	r3, r3, asl #1
	add	r1, r1, r3
	movw	r3, #2268
	mul	r3, r3, r4
	add	r1, r1, r3
	movw	r3, #40824
	mul	r3, r3, ip
	add	r1, r1, r3
	ldr	r3, [fp, #8]
	add	r3, r1, r3
	ldr	r3, [r2, r3, asl #2]
	cmn	r3, #1
	beq	.L5
	movw	r2, #:lower16:dp
	movt	r2, #:upper16:dp
	ldr	r1, [fp, #4]
	ldr	r0, [fp, #-36]
	ldr	ip, [fp, #-28]
	ldr	r4, [fp, #-32]
	ldr	r5, [fp, #-24]
	mov	r3, r1
	mov	r3, r3, asl #3
	rsb	r3, r1, r3
	movw	r1, #13936
	movt	r1, 11
	mul	r1, r1, r5
	add	r1, r3, r1
	mov	r3, r0
	mov	r3, r3, asl #6
	rsb	r3, r0, r3
	mov	r3, r3, asl #1
	add	r1, r1, r3
	movw	r3, #2268
	mul	r3, r3, r4
	add	r1, r1, r3
	movw	r3, #40824
	mul	r3, r3, ip
	add	r1, r1, r3
	ldr	r3, [fp, #8]
	add	r3, r1, r3
	ldr	r3, [r2, r3, asl #2]
	b	.L6
.L5:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	add	r2, r2, r3
	ldr	r3, [fp, #-32]
	add	r2, r2, r3
	ldr	r3, [fp, #-36]
	add	r2, r2, r3
	ldr	r3, [fp, #4]
	add	r3, r2, r3
	cmp	r3, #0
	bne	.L7
	mov	r3, #1
	b	.L6
.L7:
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L8
	ldr	r0, [fp, #8]
	mov	r1, #2
	bl	equal
	mov	r3, r0
	ldr	r2, [fp, #-24]
	rsb	r4, r3, r2
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	ldr	r2, [fp, #4]
	str	r2, [sp, #0]
	mov	r2, #1
	str	r2, [sp, #4]
	mov	r0, r3
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-36]
	bl	dfs
	mov	r3, r0
	mul	r2, r3, r4
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	movw	r3, #:lower16:mod
	movt	r3, #:upper16:mod
	ldr	r3, [r3, #0]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_idivmod
	mov	r3, r1
	str	r3, [fp, #-16]
.L8:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L9
	ldr	r0, [fp, #8]
	mov	r1, #3
	bl	equal
	mov	r3, r0
	ldr	r2, [fp, #-28]
	rsb	r4, r3, r2
	ldr	r3, [fp, #-24]
	add	r2, r3, #1
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	ldr	r1, [fp, #4]
	str	r1, [sp, #0]
	mov	r1, #2
	str	r1, [sp, #4]
	mov	r0, r2
	mov	r1, r3
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-36]
	bl	dfs
	mov	r3, r0
	mul	r2, r3, r4
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	movw	r3, #:lower16:mod
	movt	r3, #:upper16:mod
	ldr	r3, [r3, #0]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_idivmod
	mov	r3, r1
	str	r3, [fp, #-16]
.L9:
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L10
	ldr	r0, [fp, #8]
	mov	r1, #4
	bl	equal
	mov	r3, r0
	ldr	r2, [fp, #-32]
	rsb	r4, r3, r2
	ldr	r3, [fp, #-28]
	add	r2, r3, #1
	ldr	r3, [fp, #-32]
	sub	r3, r3, #1
	ldr	r1, [fp, #4]
	str	r1, [sp, #0]
	mov	r1, #3
	str	r1, [sp, #4]
	ldr	r0, [fp, #-24]
	mov	r1, r2
	mov	r2, r3
	ldr	r3, [fp, #-36]
	bl	dfs
	mov	r3, r0
	mul	r2, r3, r4
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	movw	r3, #:lower16:mod
	movt	r3, #:upper16:mod
	ldr	r3, [r3, #0]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_idivmod
	mov	r3, r1
	str	r3, [fp, #-16]
.L10:
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	beq	.L11
	ldr	r0, [fp, #8]
	mov	r1, #5
	bl	equal
	mov	r3, r0
	ldr	r2, [fp, #-36]
	rsb	r4, r3, r2
	ldr	r3, [fp, #-32]
	add	r2, r3, #1
	ldr	r3, [fp, #-36]
	sub	r3, r3, #1
	ldr	r1, [fp, #4]
	str	r1, [sp, #0]
	mov	r1, #4
	str	r1, [sp, #4]
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-28]
	bl	dfs
	mov	r3, r0
	mul	r2, r3, r4
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	movw	r3, #:lower16:mod
	movt	r3, #:upper16:mod
	ldr	r3, [r3, #0]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_idivmod
	mov	r3, r1
	str	r3, [fp, #-16]
.L11:
	ldr	r3, [fp, #4]
	cmp	r3, #0
	beq	.L12
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	ldr	r2, [fp, #4]
	sub	r2, r2, #1
	str	r2, [sp, #0]
	mov	r2, #5
	str	r2, [sp, #4]
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #-32]
	bl	dfs
	mov	r3, r0
	ldr	r2, [fp, #4]
	mul	r2, r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	movw	r3, #:lower16:mod
	movt	r3, #:upper16:mod
	ldr	r3, [r3, #0]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_idivmod
	mov	r3, r1
	str	r3, [fp, #-16]
.L12:
	movw	r3, #:lower16:mod
	movt	r3, #:upper16:mod
	ldr	r3, [r3, #0]
	ldr	r2, [fp, #-16]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_idivmod
	mov	r3, r1
	mov	ip, r3
	movw	r2, #:lower16:dp
	movt	r2, #:upper16:dp
	ldr	r1, [fp, #4]
	ldr	r0, [fp, #-36]
	ldr	lr, [fp, #-28]
	ldr	r4, [fp, #-32]
	ldr	r5, [fp, #-24]
	mov	r3, r1
	mov	r3, r3, asl #3
	rsb	r3, r1, r3
	movw	r1, #13936
	movt	r1, 11
	mul	r1, r1, r5
	add	r1, r3, r1
	mov	r3, r0
	mov	r3, r3, asl #6
	rsb	r3, r0, r3
	mov	r3, r3, asl #1
	add	r1, r1, r3
	movw	r3, #2268
	mul	r3, r3, r4
	add	r1, r1, r3
	movw	r3, #40824
	mul	r3, r3, lr
	add	r1, r1, r3
	ldr	r3, [fp, #8]
	add	r3, r1, r3
	str	ip, [r2, r3, asl #2]
	ldr	r2, [fp, #-24]
	movw	r3, #55744
	movt	r3, 44
	mul	r2, r3, r2
	ldr	r1, [fp, #-28]
	movw	r3, #32224
	movt	r3, 2
	mul	r3, r3, r1
	add	r1, r2, r3
	ldr	r2, [fp, #-36]
	mov	r3, r2
	mov	r3, r3, asl #6
	rsb	r3, r2, r3
	mov	r3, r3, asl #3
	mov	r2, r3
	ldr	r3, [fp, #-32]
	movw	r0, #9072
	mul	r3, r0, r3
	add	r3, r2, r3
	add	r1, r1, r3
	ldr	r2, [fp, #4]
	mov	r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r2, r1, r3
	movw	r3, #:lower16:dp
	movt	r3, #:upper16:dp
	add	r3, r2, r3
	mov	r0, #7
	mov	r1, r3
	bl	putarray
	movw	r2, #:lower16:dp
	movt	r2, #:upper16:dp
	ldr	r1, [fp, #4]
	ldr	r0, [fp, #-36]
	ldr	ip, [fp, #-28]
	ldr	r4, [fp, #-32]
	ldr	r5, [fp, #-24]
	mov	r3, r1
	mov	r3, r3, asl #3
	rsb	r3, r1, r3
	movw	r1, #13936
	movt	r1, 11
	mul	r1, r1, r5
	add	r1, r3, r1
	mov	r3, r0
	mov	r3, r3, asl #6
	rsb	r3, r0, r3
	mov	r3, r3, asl #1
	add	r1, r1, r3
	movw	r3, #2268
	mul	r3, r3, r4
	add	r1, r1, r3
	movw	r3, #40824
	mul	r3, r3, ip
	add	r1, r1, r3
	ldr	r3, [fp, #8]
	add	r3, r1, r3
	ldr	r3, [r2, r3, asl #2]
.L6:
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, pc}
	.size	dfs, .-dfs
	.global	cns
	.data
	.align	2
	.type	cns, %object
	.size	cns, 80
cns:
	.word	0
	.word	0
	.word	5
	.word	0
	.word	0
	.space	60
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #44
	bl	getint
	str	r0, [fp, #-40]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L14
.L25:
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L15
.L24:
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L16
.L23:
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L17
.L22:
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L18
.L21:
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L19
.L20:
	movw	r2, #:lower16:dp
	movt	r2, #:upper16:dp
	ldr	r1, [fp, #-32]
	ldr	r0, [fp, #-28]
	ldr	ip, [fp, #-20]
	ldr	lr, [fp, #-24]
	ldr	r4, [fp, #-16]
	mov	r3, r1
	mov	r3, r3, asl #3
	rsb	r3, r1, r3
	movw	r1, #13936
	movt	r1, 11
	mul	r1, r1, r4
	add	r1, r3, r1
	mov	r3, r0
	mov	r3, r3, asl #6
	rsb	r3, r0, r3
	mov	r3, r3, asl #1
	add	r1, r1, r3
	movw	r3, #2268
	mul	r3, r3, lr
	add	r1, r1, r3
	movw	r3, #40824
	mul	r3, r3, ip
	add	r1, r1, r3
	ldr	r3, [fp, #-36]
	add	r3, r1, r3
	mvn	r1, #0
	str	r1, [r2, r3, asl #2]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
.L19:
	ldr	r3, [fp, #-36]
	cmp	r3, #6
	ble	.L20
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L18:
	movw	r3, #:lower16:maxn
	movt	r3, #:upper16:maxn
	ldr	r3, [r3, #0]
	ldr	r2, [fp, #-32]
	cmp	r2, r3
	blt	.L21
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L17:
	movw	r3, #:lower16:maxn
	movt	r3, #:upper16:maxn
	ldr	r3, [r3, #0]
	ldr	r2, [fp, #-28]
	cmp	r2, r3
	blt	.L22
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L16:
	movw	r3, #:lower16:maxn
	movt	r3, #:upper16:maxn
	ldr	r3, [r3, #0]
	ldr	r2, [fp, #-24]
	cmp	r2, r3
	blt	.L23
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L15:
	movw	r3, #:lower16:maxn
	movt	r3, #:upper16:maxn
	ldr	r3, [r3, #0]
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	blt	.L24
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L14:
	movw	r3, #:lower16:maxn
	movt	r3, #:upper16:maxn
	ldr	r3, [r3, #0]
	ldr	r2, [fp, #-16]
	cmp	r2, r3
	blt	.L25
	mov	r3, #0
	str	r3, [fp, #-16]
	movw	r3, #:lower16:cns
	movt	r3, #:upper16:cns
	ldr	r0, [r3, #4]
	movw	r3, #:lower16:cns
	movt	r3, #:upper16:cns
	ldr	r1, [r3, #8]
	movw	r3, #:lower16:cns
	movt	r3, #:upper16:cns
	ldr	r2, [r3, #12]
	movw	r3, #:lower16:cns
	movt	r3, #:upper16:cns
	ldr	ip, [r3, #16]
	movw	r3, #:lower16:cns
	movt	r3, #:upper16:cns
	ldr	r3, [r3, #20]
	str	r3, [sp, #0]
	mov	r3, #0
	str	r3, [sp, #4]
	mov	r3, ip
	bl	dfs
	str	r0, [fp, #-44]
	ldr	r0, [fp, #-44]
	bl	putint
	ldr	r3, [fp, #-44]
	mov	r0, r3
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, pc}
	.size	main, .-main
	.ident	"GCC: (crosstool-NG hg+unknown-20130521.154019 - tc0002) 4.6.4"
	.section	.note.GNU-stack,"",%progbits
