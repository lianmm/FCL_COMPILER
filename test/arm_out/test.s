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
	.global	TOKEN_NUM
	.section	.rodata
	.align	2
	.type	TOKEN_NUM, %object
	.size	TOKEN_NUM, 4
TOKEN_NUM:
	.space	4
	.global	TOKEN_OTHER
	.align	2
	.type	TOKEN_OTHER, %object
	.size	TOKEN_OTHER, 4
TOKEN_OTHER:
	.word	1
	.global	last_char
	.data
	.align	2
	.type	last_char, %object
	.size	last_char, 4
last_char:
	.word	32
	.comm	num,4,4
	.comm	other,4,4
	.comm	cur_token,4,4
	.text
	.align	2
	.global	next_char
	.type	next_char, %function
next_char:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	bl	getch
	mov	r2, r0
	movw	r3, #:lower16:last_char
	movt	r3, #:upper16:last_char
	str	r2, [r3, #0]
	movw	r3, #:lower16:last_char
	movt	r3, #:upper16:last_char
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldmfd	sp!, {fp, pc}
	.size	next_char, .-next_char
	.align	2
	.global	is_space
	.type	is_space, %function
is_space:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #32
	beq	.L3
	ldr	r3, [fp, #-8]
	cmp	r3, #10
	bne	.L4
.L3:
	mov	r3, #1
	b	.L5
.L4:
	mov	r3, #0
.L5:
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	is_space, .-is_space
	.align	2
	.global	is_num
	.type	is_num, %function
is_num:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #47
	ble	.L7
	ldr	r3, [fp, #-8]
	cmp	r3, #57
	bgt	.L7
	mov	r3, #1
	b	.L8
.L7:
	mov	r3, #0
.L8:
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	is_num, .-is_num
	.align	2
	.global	next_token
	.type	next_token, %function
next_token:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	b	.L10
.L11:
	bl	next_char
.L10:
	movw	r3, #:lower16:last_char
	movt	r3, #:upper16:last_char
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	is_space
	mov	r3, r0
	cmp	r3, #0
	bne	.L11
	movw	r3, #:lower16:last_char
	movt	r3, #:upper16:last_char
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	is_num
	mov	r3, r0
	cmp	r3, #0
	beq	.L12
	movw	r3, #:lower16:last_char
	movt	r3, #:upper16:last_char
	ldr	r3, [r3, #0]
	sub	r2, r3, #48
	movw	r3, #:lower16:num
	movt	r3, #:upper16:num
	str	r2, [r3, #0]
	b	.L13
.L14:
	movw	r3, #:lower16:num
	movt	r3, #:upper16:num
	ldr	r2, [r3, #0]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	mov	r2, r3
	movw	r3, #:lower16:last_char
	movt	r3, #:upper16:last_char
	ldr	r3, [r3, #0]
	add	r3, r2, r3
	sub	r2, r3, #48
	movw	r3, #:lower16:num
	movt	r3, #:upper16:num
	str	r2, [r3, #0]
.L13:
	bl	next_char
	mov	r3, r0
	mov	r0, r3
	bl	is_num
	mov	r3, r0
	cmp	r3, #0
	bne	.L14
	movw	r3, #:lower16:TOKEN_NUM
	movt	r3, #:upper16:TOKEN_NUM
	ldr	r2, [r3, #0]
	movw	r3, #:lower16:cur_token
	movt	r3, #:upper16:cur_token
	str	r2, [r3, #0]
	b	.L15
.L12:
	movw	r3, #:lower16:last_char
	movt	r3, #:upper16:last_char
	ldr	r2, [r3, #0]
	movw	r3, #:lower16:other
	movt	r3, #:upper16:other
	str	r2, [r3, #0]
	bl	next_char
	movw	r3, #:lower16:TOKEN_OTHER
	movt	r3, #:upper16:TOKEN_OTHER
	ldr	r2, [r3, #0]
	movw	r3, #:lower16:cur_token
	movt	r3, #:upper16:cur_token
	str	r2, [r3, #0]
.L15:
	movw	r3, #:lower16:cur_token
	movt	r3, #:upper16:cur_token
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldmfd	sp!, {fp, pc}
	.size	next_token, .-next_token
	.align	2
	.global	panic
	.type	panic, %function
panic:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	mov	r0, #112
	bl	putch
	mov	r0, #97
	bl	putch
	mov	r0, #110
	bl	putch
	mov	r0, #105
	bl	putch
	mov	r0, #99
	bl	putch
	mov	r0, #33
	bl	putch
	mov	r0, #10
	bl	putch
	mvn	r3, #0
	mov	r0, r3
	ldmfd	sp!, {fp, pc}
	.size	panic, .-panic
	.align	2
	.global	get_op_prec
	.type	get_op_prec, %function
get_op_prec:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #43
	beq	.L18
	ldr	r3, [fp, #-8]
	cmp	r3, #45
	bne	.L19
.L18:
	mov	r3, #10
	b	.L20
.L19:
	ldr	r3, [fp, #-8]
	cmp	r3, #42
	beq	.L21
	ldr	r3, [fp, #-8]
	cmp	r3, #47
	beq	.L21
	ldr	r3, [fp, #-8]
	cmp	r3, #37
	bne	.L22
.L21:
	mov	r3, #20
	b	.L20
.L22:
	mov	r3, #0
.L20:
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	get_op_prec, .-get_op_prec
	.align	2
	.global	stack_push
	.type	stack_push, %function
stack_push:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, [fp, #-8]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #0]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	ldr	r2, [fp, #-12]
	str	r2, [r3, #0]
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	stack_push, .-stack_push
	.align	2
	.global	stack_pop
	.type	stack_pop, %function
stack_pop:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	sub	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	stack_pop, .-stack_pop
	.align	2
	.global	stack_peek
	.type	stack_peek, %function
stack_peek:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #0]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	stack_peek, .-stack_peek
	.align	2
	.global	stack_size
	.type	stack_size, %function
stack_size:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #0]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	stack_size, .-stack_size
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.align	2
	.global	eval_op
	.type	eval_op, %function
eval_op:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	cmp	r3, #43
	bne	.L28
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	b	.L29
.L28:
	ldr	r3, [fp, #-8]
	cmp	r3, #45
	bne	.L30
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	rsb	r3, r3, r2
	b	.L29
.L30:
	ldr	r3, [fp, #-8]
	cmp	r3, #42
	bne	.L31
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-16]
	mul	r3, r2, r3
	b	.L29
.L31:
	ldr	r3, [fp, #-8]
	cmp	r3, #47
	bne	.L32
	ldr	r0, [fp, #-12]
	ldr	r1, [fp, #-16]
	bl	__aeabi_idiv
	mov	r3, r0
	b	.L29
.L32:
	ldr	r3, [fp, #-8]
	cmp	r3, #37
	bne	.L33
	ldr	r3, [fp, #-12]
	mov	r0, r3
	ldr	r1, [fp, #-16]
	bl	__aeabi_idivmod
	mov	r3, r1
	b	.L29
.L33:
	mov	r3, #0
.L29:
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	eval_op, .-eval_op
	.align	2
	.global	eval
	.type	eval, %function
eval:
	@ args = 0, pretend = 0, frame = 2080
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #2080
	sub	sp, sp, #4
	sub	r3, fp, #1040
	sub	r3, r3, #12
	sub	r3, r3, #12
	mov	r2, #1024
	mov	r0, r3
	mov	r1, #0
	bl	memset
	sub	r3, fp, #2064
	sub	r3, r3, #12
	sub	r3, r3, #12
	mov	r2, #1024
	mov	r0, r3
	mov	r1, #0
	bl	memset
	movw	r3, #:lower16:cur_token
	movt	r3, #:upper16:cur_token
	ldr	r2, [r3, #0]
	movw	r3, #:lower16:TOKEN_NUM
	movt	r3, #:upper16:TOKEN_NUM
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	.L35
	bl	panic
	mov	r3, r0
	b	.L36
.L35:
	movw	r3, #:lower16:num
	movt	r3, #:upper16:num
	ldr	r2, [r3, #0]
	sub	r3, fp, #1040
	sub	r3, r3, #12
	sub	r3, r3, #12
	mov	r0, r3
	mov	r1, r2
	bl	stack_push
	bl	next_token
	b	.L37
.L44:
	movw	r3, #:lower16:other
	movt	r3, #:upper16:other
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-16]
	bl	get_op_prec
	mov	r3, r0
	cmp	r3, #0
	beq	.L47
.L38:
	bl	next_token
	b	.L40
.L42:
	sub	r3, fp, #2064
	sub	r3, r3, #12
	sub	r3, r3, #12
	mov	r0, r3
	bl	stack_pop
	str	r0, [fp, #-20]
	sub	r3, fp, #1040
	sub	r3, r3, #12
	sub	r3, r3, #12
	mov	r0, r3
	bl	stack_pop
	str	r0, [fp, #-24]
	sub	r3, fp, #1040
	sub	r3, r3, #12
	sub	r3, r3, #12
	mov	r0, r3
	bl	stack_pop
	str	r0, [fp, #-28]
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #-24]
	bl	eval_op
	mov	r2, r0
	sub	r3, fp, #1040
	sub	r3, r3, #12
	sub	r3, r3, #12
	mov	r0, r3
	mov	r1, r2
	bl	stack_push
.L40:
	sub	r3, fp, #2064
	sub	r3, r3, #12
	sub	r3, r3, #12
	mov	r0, r3
	bl	stack_size
	mov	r3, r0
	cmp	r3, #0
	beq	.L41
	sub	r3, fp, #2064
	sub	r3, r3, #12
	sub	r3, r3, #12
	mov	r0, r3
	bl	stack_peek
	mov	r3, r0
	mov	r0, r3
	bl	get_op_prec
	mov	r4, r0
	ldr	r0, [fp, #-16]
	bl	get_op_prec
	mov	r3, r0
	cmp	r4, r3
	bge	.L42
.L41:
	sub	r3, fp, #2064
	sub	r3, r3, #12
	sub	r3, r3, #12
	mov	r0, r3
	ldr	r1, [fp, #-16]
	bl	stack_push
	movw	r3, #:lower16:cur_token
	movt	r3, #:upper16:cur_token
	ldr	r2, [r3, #0]
	movw	r3, #:lower16:TOKEN_NUM
	movt	r3, #:upper16:TOKEN_NUM
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	.L43
	bl	panic
	mov	r3, r0
	b	.L36
.L43:
	movw	r3, #:lower16:num
	movt	r3, #:upper16:num
	ldr	r2, [r3, #0]
	sub	r3, fp, #1040
	sub	r3, r3, #12
	sub	r3, r3, #12
	mov	r0, r3
	mov	r1, r2
	bl	stack_push
	bl	next_token
.L37:
	movw	r3, #:lower16:cur_token
	movt	r3, #:upper16:cur_token
	ldr	r2, [r3, #0]
	movw	r3, #:lower16:TOKEN_OTHER
	movt	r3, #:upper16:TOKEN_OTHER
	ldr	r3, [r3, #0]
	cmp	r2, r3
	beq	.L44
	b	.L39
.L47:
	mov	r0, r0	@ nop
.L39:
	bl	next_token
	b	.L45
.L46:
	sub	r3, fp, #2064
	sub	r3, r3, #12
	sub	r3, r3, #12
	mov	r0, r3
	bl	stack_pop
	str	r0, [fp, #-32]
	sub	r3, fp, #1040
	sub	r3, r3, #12
	sub	r3, r3, #12
	mov	r0, r3
	bl	stack_pop
	str	r0, [fp, #-36]
	sub	r3, fp, #1040
	sub	r3, r3, #12
	sub	r3, r3, #12
	mov	r0, r3
	bl	stack_pop
	str	r0, [fp, #-40]
	ldr	r0, [fp, #-32]
	ldr	r1, [fp, #-40]
	ldr	r2, [fp, #-36]
	bl	eval_op
	mov	r2, r0
	sub	r3, fp, #1040
	sub	r3, r3, #12
	sub	r3, r3, #12
	mov	r0, r3
	mov	r1, r2
	bl	stack_push
.L45:
	sub	r3, fp, #2064
	sub	r3, r3, #12
	sub	r3, r3, #12
	mov	r0, r3
	bl	stack_size
	mov	r3, r0
	cmp	r3, #0
	bne	.L46
	sub	r3, fp, #1040
	sub	r3, r3, #12
	sub	r3, r3, #12
	mov	r0, r3
	bl	stack_peek
	mov	r3, r0
.L36:
	mov	r0, r3
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, pc}
	.size	eval, .-eval
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	bl	getint
	str	r0, [fp, #-8]
	bl	getch
	bl	next_token
	b	.L49
.L50:
	bl	eval
	mov	r3, r0
	mov	r0, r3
	bl	putint
	mov	r0, #10
	bl	putch
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L49:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L50
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
	.size	main, .-main
	.ident	"GCC: (crosstool-NG hg+unknown-20130521.154019 - tc0002) 4.6.4"
	.section	.note.GNU-stack,"",%progbits
