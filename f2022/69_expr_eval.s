	.global	last_char
	.data
	.align	2
	.type	last_char, %object
	.size	last_char, 4
last_char:
	.word	32

	.global	num
	.data
	.align	2
	.type	num, %object
	.size	num, 4
num:
	.word	0

	.global	other
	.data
	.align	2
	.type	other, %object
	.size	other, 4
other:
	.word	0

	.global	cur_token
	.data
	.align	2
	.type	cur_token, %object
	.size	cur_token, 4
cur_token:
	.word	0


	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	next_char
	.type	next_char, %function
next_char:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #16
	bl	getch
	mov	r9, r0
	movw	r10, #:lower16:last_char
	movt	r10, #:upper16:last_char
	str	r9, [r10, #0]
	movw	r9, #:lower16:last_char
	movt	r9, #:upper16:last_char
	ldr	r9, [r9, #0]
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	next_char, .-next_char

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	is_space
	.type	is_space, %function
is_space:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #44
	str	r0, [fp, #-16]
	ldr	r9, [fp, #-16]
	ldr	r8, =32
	cmp	r9, r8
	beq	.L9
	b	.L10

.L10:
	ldr	r7, =10
	cmp	r9, r7

.L11:

.L9:
	beq	.L6
	b	.L7

.L6:
	ldr	r9, =1
	mov	r0, r9
	b	.L5
	b	.L8

.L7:
	ldr	r9, =0
	mov	r0, r9
	b	.L5

.L8:

.L5:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	is_space, .-is_space

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	is_num
	.type	is_num, %function
is_num:
	@ args = 0, pretend = 0, frame = 52
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #56
	str	r0, [fp, #-16]
	ldr	r9, [fp, #-16]
	ldr	r8, =48
	cmp	r9, r8
	bge	.L199
	ldr	r10, =1
	cmp	r10, #0
	b	.L22

.L199:
	ldr	r10, =0
	cmp	r10, #0
	b	.L23
	b	.L22

.L23:
	ldr	r7, =57
	cmp	r9, r7
	ble	.L200
	ldr	r10, =1
	cmp	r10, #0
	b	.L24

.L200:
	ldr	r10, =0
	cmp	r10, #0
	b	.L24

.L24:

.L22:
	beq	.L19
	b	.L20

.L19:
	ldr	r9, =1
	mov	r0, r9
	b	.L18
	b	.L21

.L20:
	ldr	r9, =0
	mov	r0, r9
	b	.L18

.L21:

.L18:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	is_num, .-is_num

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	next_token
	.type	next_token, %function
next_token:
	@ args = 0, pretend = 0, frame = 44
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #48

.L32:
	movw	r9, #:lower16:last_char
	movt	r9, #:upper16:last_char
	ldr	r9, [r9, #0]
	mov	r0, r9
	bl	is_space
	mov	r9, r0
	cmp	r9, #0
	bne	.L201
	ldr	r10, =1
	cmp	r10, #0
	b	.L34

.L201:
	ldr	r10, =0
	cmp	r10, #0
	b	.L33
	b	.L34

.L33:
	bl	next_char
	mov	r12, r0
	b	.L32

.L34:
	movw	r9, #:lower16:last_char
	movt	r9, #:upper16:last_char
	ldr	r9, [r9, #0]
	mov	r0, r9
	bl	is_num
	mov	r8, r0
	cmp	r8, #0
	bne	.L202
	ldr	r10, =1
	cmp	r10, #0
	b	.L36

.L202:
	ldr	r10, =0
	cmp	r10, #0
	b	.L35
	b	.L36

.L35:
	ldr	r8, =48
	sub	r9, r9, r8
	movw	r10, #:lower16:num
	movt	r10, #:upper16:num
	str	r9, [r10, #0]

.L44:
	bl	next_char
	mov	r9, r0
	mov	r0, r9
	bl	is_num
	mov	r9, r0
	cmp	r9, #0
	bne	.L203
	ldr	r10, =1
	cmp	r10, #0
	b	.L46

.L203:
	ldr	r10, =0
	cmp	r10, #0
	b	.L45
	b	.L46

.L45:
	movw	r9, #:lower16:num
	movt	r9, #:upper16:num
	ldr	r9, [r9, #0]
	ldr	r8, =10
	mul	r9, r8, r9
	movw	r8, #:lower16:last_char
	movt	r8, #:upper16:last_char
	ldr	r8, [r8, #0]
	add	r9, r8, r9
	ldr	r8, =48
	sub	r9, r9, r8
	movw	r10, #:lower16:num
	movt	r10, #:upper16:num
	str	r9, [r10, #0]
	b	.L44

.L46:
	ldr	r9, =0
	movw	r10, #:lower16:cur_token
	movt	r10, #:upper16:cur_token
	str	r9, [r10, #0]
	b	.L37

.L36:
	movw	r9, #:lower16:last_char
	movt	r9, #:upper16:last_char
	ldr	r9, [r9, #0]
	movw	r10, #:lower16:other
	movt	r10, #:upper16:other
	str	r9, [r10, #0]
	bl	next_char
	mov	r12, r0
	ldr	r9, =1
	movw	r10, #:lower16:cur_token
	movt	r10, #:upper16:cur_token
	str	r9, [r10, #0]

.L37:
	movw	r9, #:lower16:cur_token
	movt	r9, #:upper16:cur_token
	ldr	r9, [r9, #0]
	mov	r0, r9
	b	.L31

.L31:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	next_token, .-next_token

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	panic
	.type	panic, %function
panic:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #44
	ldr	r9, =112
	mov	r0, r9
	bl	putch
	ldr	r9, =97
	mov	r0, r9
	bl	putch
	ldr	r9, =110
	mov	r0, r9
	bl	putch
	ldr	r9, =105
	mov	r0, r9
	bl	putch
	ldr	r9, =99
	mov	r0, r9
	bl	putch
	ldr	r9, =33
	mov	r0, r9
	bl	putch
	ldr	r9, =10
	mov	r0, r9
	bl	putch
	ldr	r9, =-1
	mov	r0, r9
	b	.L68

.L68:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	panic, .-panic

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	get_op_pre
	.type	get_op_pre, %function
get_op_pre:
	@ args = 0, pretend = 0, frame = 76
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #80
	str	r0, [fp, #-16]
	ldr	r9, [fp, #-16]
	ldr	r8, =43
	cmp	r9, r8
	beq	.L72
	b	.L73

.L73:
	ldr	r7, =45
	cmp	r9, r7

.L74:

.L72:
	beq	.L70
	b	.L71

.L70:
	ldr	r9, =10
	mov	r0, r9
	b	.L69

.L71:
	ldr	r9, [fp, #-16]
	ldr	r8, =42
	cmp	r9, r8
	beq	.L86
	b	.L87

.L87:
	ldr	r7, =47
	cmp	r9, r7

.L88:

.L86:
	beq	.L83
	b	.L84

.L84:
	ldr	r7, =37
	cmp	r9, r7

.L85:

.L83:
	beq	.L81
	b	.L82

.L81:
	ldr	r9, =20
	mov	r0, r9
	b	.L69

.L82:
	ldr	r9, =0
	mov	r0, r9
	b	.L69

.L69:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	get_op_pre, .-get_op_pre

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	stack_push
	.type	stack_push, %function
stack_push:
	@ args = 0, pretend = 0, frame = 68
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #72
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r9, =0
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	ldr	r8, =1
	add	r9, r8, r9
	ldr	r8, =0
	ldr	r7, [fp, #-16]
	str	r9,	[r7, r8,LSL#2]
	ldr	r9, [fp, #-20]
	ldr	r8, =0
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, [fp, #-16]
	str	r9,	[r7, r8,LSL#2]

.L98:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	stack_push, .-stack_push

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	stack_pop
	.type	stack_pop, %function
stack_pop:
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #84
	str	r0, [fp, #-16]
	ldr	r9, =0
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	str	r9, [fp, #-20]
	ldr	r9, =0
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	ldr	r8, =1
	sub	r9, r9, r8
	ldr	r8, =0
	ldr	r7, [fp, #-16]
	str	r9,	[r7, r8,LSL#2]
	ldr	r9, [fp, #-20]
	mov	r0, r9
	b	.L108

.L108:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	stack_pop, .-stack_pop

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	stack_peek
	.type	stack_peek, %function
stack_peek:
	@ args = 0, pretend = 0, frame = 44
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #48
	str	r0, [fp, #-16]
	ldr	r9, =0
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	mov	r0, r9
	b	.L115

.L115:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	stack_peek, .-stack_peek

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	stack_size
	.type	stack_size, %function
stack_size:
	@ args = 0, pretend = 0, frame = 36
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #40
	str	r0, [fp, #-16]
	ldr	r9, =0
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	mov	r0, r9
	b	.L116

.L116:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	stack_size, .-stack_size

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	eval_op
	.type	eval_op, %function
eval_op:
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #100
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r9, [fp, #-16]
	ldr	r8, =43
	cmp	r9, r8
	beq	.L118
	b	.L119

.L118:
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-24]
	add	r9, r8, r9
	mov	r0, r9
	b	.L117

.L119:
	ldr	r9, [fp, #-16]
	ldr	r8, =45
	cmp	r9, r8
	beq	.L126
	b	.L127

.L126:
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-24]
	sub	r9, r9, r8
	mov	r0, r9
	b	.L117

.L127:
	ldr	r9, [fp, #-16]
	ldr	r8, =42
	cmp	r9, r8
	beq	.L134
	b	.L135

.L134:
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-24]
	mul	r9, r8, r9
	mov	r0, r9
	b	.L117

.L135:
	ldr	r9, [fp, #-16]
	ldr	r8, =47
	cmp	r9, r8
	beq	.L142
	b	.L143

.L142:
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-24]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	mov	r0, r9
	b	.L117

.L143:
	ldr	r9, [fp, #-16]
	ldr	r8, =37
	cmp	r9, r8
	beq	.L150
	b	.L151

.L150:
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-24]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	mov	r0, r9
	b	.L117

.L151:
	ldr	r9, =0
	mov	r0, r9
	b	.L117

.L117:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	eval_op, .-eval_op

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	eval
	.type	eval, %function
eval:
	@ args = 0, pretend = 0, frame = 4268
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	ldr	r12, =4272
	sub	sp, sp, r12
	ldr	r10, =-1036
	add	r10, r10, fp
	mov	r12, #0
	str	r12, [r10, #0]
	str	r12, [r10, #4]
	str	r12, [r10, #8]
	str	r12, [r10, #12]
	str	r12, [r10, #16]
	str	r12, [r10, #20]
	str	r12, [r10, #24]
	str	r12, [r10, #28]
	str	r12, [r10, #32]
	str	r12, [r10, #36]
	str	r12, [r10, #40]
	str	r12, [r10, #44]
	str	r12, [r10, #48]
	str	r12, [r10, #52]
	str	r12, [r10, #56]
	str	r12, [r10, #60]
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
	str	r12, [r10, #140]
	str	r12, [r10, #144]
	str	r12, [r10, #148]
	str	r12, [r10, #152]
	str	r12, [r10, #156]
	str	r12, [r10, #160]
	str	r12, [r10, #164]
	str	r12, [r10, #168]
	str	r12, [r10, #172]
	str	r12, [r10, #176]
	str	r12, [r10, #180]
	str	r12, [r10, #184]
	str	r12, [r10, #188]
	str	r12, [r10, #192]
	str	r12, [r10, #196]
	str	r12, [r10, #200]
	str	r12, [r10, #204]
	str	r12, [r10, #208]
	str	r12, [r10, #212]
	str	r12, [r10, #216]
	str	r12, [r10, #220]
	str	r12, [r10, #224]
	str	r12, [r10, #228]
	str	r12, [r10, #232]
	str	r12, [r10, #236]
	str	r12, [r10, #240]
	str	r12, [r10, #244]
	str	r12, [r10, #248]
	str	r12, [r10, #252]
	str	r12, [r10, #256]
	str	r12, [r10, #260]
	str	r12, [r10, #264]
	str	r12, [r10, #268]
	str	r12, [r10, #272]
	str	r12, [r10, #276]
	str	r12, [r10, #280]
	str	r12, [r10, #284]
	str	r12, [r10, #288]
	str	r12, [r10, #292]
	str	r12, [r10, #296]
	str	r12, [r10, #300]
	str	r12, [r10, #304]
	str	r12, [r10, #308]
	str	r12, [r10, #312]
	str	r12, [r10, #316]
	str	r12, [r10, #320]
	str	r12, [r10, #324]
	str	r12, [r10, #328]
	str	r12, [r10, #332]
	str	r12, [r10, #336]
	str	r12, [r10, #340]
	str	r12, [r10, #344]
	str	r12, [r10, #348]
	str	r12, [r10, #352]
	str	r12, [r10, #356]
	str	r12, [r10, #360]
	str	r12, [r10, #364]
	str	r12, [r10, #368]
	str	r12, [r10, #372]
	str	r12, [r10, #376]
	str	r12, [r10, #380]
	str	r12, [r10, #384]
	str	r12, [r10, #388]
	str	r12, [r10, #392]
	str	r12, [r10, #396]
	str	r12, [r10, #400]
	str	r12, [r10, #404]
	str	r12, [r10, #408]
	str	r12, [r10, #412]
	str	r12, [r10, #416]
	str	r12, [r10, #420]
	str	r12, [r10, #424]
	str	r12, [r10, #428]
	str	r12, [r10, #432]
	str	r12, [r10, #436]
	str	r12, [r10, #440]
	str	r12, [r10, #444]
	str	r12, [r10, #448]
	str	r12, [r10, #452]
	str	r12, [r10, #456]
	str	r12, [r10, #460]
	str	r12, [r10, #464]
	str	r12, [r10, #468]
	str	r12, [r10, #472]
	str	r12, [r10, #476]
	str	r12, [r10, #480]
	str	r12, [r10, #484]
	str	r12, [r10, #488]
	str	r12, [r10, #492]
	str	r12, [r10, #496]
	str	r12, [r10, #500]
	str	r12, [r10, #504]
	str	r12, [r10, #508]
	str	r12, [r10, #512]
	str	r12, [r10, #516]
	str	r12, [r10, #520]
	str	r12, [r10, #524]
	str	r12, [r10, #528]
	str	r12, [r10, #532]
	str	r12, [r10, #536]
	str	r12, [r10, #540]
	str	r12, [r10, #544]
	str	r12, [r10, #548]
	str	r12, [r10, #552]
	str	r12, [r10, #556]
	str	r12, [r10, #560]
	str	r12, [r10, #564]
	str	r12, [r10, #568]
	str	r12, [r10, #572]
	str	r12, [r10, #576]
	str	r12, [r10, #580]
	str	r12, [r10, #584]
	str	r12, [r10, #588]
	str	r12, [r10, #592]
	str	r12, [r10, #596]
	str	r12, [r10, #600]
	str	r12, [r10, #604]
	str	r12, [r10, #608]
	str	r12, [r10, #612]
	str	r12, [r10, #616]
	str	r12, [r10, #620]
	str	r12, [r10, #624]
	str	r12, [r10, #628]
	str	r12, [r10, #632]
	str	r12, [r10, #636]
	str	r12, [r10, #640]
	str	r12, [r10, #644]
	str	r12, [r10, #648]
	str	r12, [r10, #652]
	str	r12, [r10, #656]
	str	r12, [r10, #660]
	str	r12, [r10, #664]
	str	r12, [r10, #668]
	str	r12, [r10, #672]
	str	r12, [r10, #676]
	str	r12, [r10, #680]
	str	r12, [r10, #684]
	str	r12, [r10, #688]
	str	r12, [r10, #692]
	str	r12, [r10, #696]
	str	r12, [r10, #700]
	str	r12, [r10, #704]
	str	r12, [r10, #708]
	str	r12, [r10, #712]
	str	r12, [r10, #716]
	str	r12, [r10, #720]
	str	r12, [r10, #724]
	str	r12, [r10, #728]
	str	r12, [r10, #732]
	str	r12, [r10, #736]
	str	r12, [r10, #740]
	str	r12, [r10, #744]
	str	r12, [r10, #748]
	str	r12, [r10, #752]
	str	r12, [r10, #756]
	str	r12, [r10, #760]
	str	r12, [r10, #764]
	str	r12, [r10, #768]
	str	r12, [r10, #772]
	str	r12, [r10, #776]
	str	r12, [r10, #780]
	str	r12, [r10, #784]
	str	r12, [r10, #788]
	str	r12, [r10, #792]
	str	r12, [r10, #796]
	str	r12, [r10, #800]
	str	r12, [r10, #804]
	str	r12, [r10, #808]
	str	r12, [r10, #812]
	str	r12, [r10, #816]
	str	r12, [r10, #820]
	str	r12, [r10, #824]
	str	r12, [r10, #828]
	str	r12, [r10, #832]
	str	r12, [r10, #836]
	str	r12, [r10, #840]
	str	r12, [r10, #844]
	str	r12, [r10, #848]
	str	r12, [r10, #852]
	str	r12, [r10, #856]
	str	r12, [r10, #860]
	str	r12, [r10, #864]
	str	r12, [r10, #868]
	str	r12, [r10, #872]
	str	r12, [r10, #876]
	str	r12, [r10, #880]
	str	r12, [r10, #884]
	str	r12, [r10, #888]
	str	r12, [r10, #892]
	str	r12, [r10, #896]
	str	r12, [r10, #900]
	str	r12, [r10, #904]
	str	r12, [r10, #908]
	str	r12, [r10, #912]
	str	r12, [r10, #916]
	str	r12, [r10, #920]
	str	r12, [r10, #924]
	str	r12, [r10, #928]
	str	r12, [r10, #932]
	str	r12, [r10, #936]
	str	r12, [r10, #940]
	str	r12, [r10, #944]
	str	r12, [r10, #948]
	str	r12, [r10, #952]
	str	r12, [r10, #956]
	str	r12, [r10, #960]
	str	r12, [r10, #964]
	str	r12, [r10, #968]
	str	r12, [r10, #972]
	str	r12, [r10, #976]
	str	r12, [r10, #980]
	str	r12, [r10, #984]
	str	r12, [r10, #988]
	str	r12, [r10, #992]
	str	r12, [r10, #996]
	str	r12, [r10, #1000]
	str	r12, [r10, #1004]
	str	r12, [r10, #1008]
	str	r12, [r10, #1012]
	str	r12, [r10, #1016]
	str	r12, [r10, #1020]

	ldr	r10, =-2060
	add	r10, r10, fp
	mov	r12, #0
	str	r12, [r10, #0]
	str	r12, [r10, #4]
	str	r12, [r10, #8]
	str	r12, [r10, #12]
	str	r12, [r10, #16]
	str	r12, [r10, #20]
	str	r12, [r10, #24]
	str	r12, [r10, #28]
	str	r12, [r10, #32]
	str	r12, [r10, #36]
	str	r12, [r10, #40]
	str	r12, [r10, #44]
	str	r12, [r10, #48]
	str	r12, [r10, #52]
	str	r12, [r10, #56]
	str	r12, [r10, #60]
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
	str	r12, [r10, #140]
	str	r12, [r10, #144]
	str	r12, [r10, #148]
	str	r12, [r10, #152]
	str	r12, [r10, #156]
	str	r12, [r10, #160]
	str	r12, [r10, #164]
	str	r12, [r10, #168]
	str	r12, [r10, #172]
	str	r12, [r10, #176]
	str	r12, [r10, #180]
	str	r12, [r10, #184]
	str	r12, [r10, #188]
	str	r12, [r10, #192]
	str	r12, [r10, #196]
	str	r12, [r10, #200]
	str	r12, [r10, #204]
	str	r12, [r10, #208]
	str	r12, [r10, #212]
	str	r12, [r10, #216]
	str	r12, [r10, #220]
	str	r12, [r10, #224]
	str	r12, [r10, #228]
	str	r12, [r10, #232]
	str	r12, [r10, #236]
	str	r12, [r10, #240]
	str	r12, [r10, #244]
	str	r12, [r10, #248]
	str	r12, [r10, #252]
	str	r12, [r10, #256]
	str	r12, [r10, #260]
	str	r12, [r10, #264]
	str	r12, [r10, #268]
	str	r12, [r10, #272]
	str	r12, [r10, #276]
	str	r12, [r10, #280]
	str	r12, [r10, #284]
	str	r12, [r10, #288]
	str	r12, [r10, #292]
	str	r12, [r10, #296]
	str	r12, [r10, #300]
	str	r12, [r10, #304]
	str	r12, [r10, #308]
	str	r12, [r10, #312]
	str	r12, [r10, #316]
	str	r12, [r10, #320]
	str	r12, [r10, #324]
	str	r12, [r10, #328]
	str	r12, [r10, #332]
	str	r12, [r10, #336]
	str	r12, [r10, #340]
	str	r12, [r10, #344]
	str	r12, [r10, #348]
	str	r12, [r10, #352]
	str	r12, [r10, #356]
	str	r12, [r10, #360]
	str	r12, [r10, #364]
	str	r12, [r10, #368]
	str	r12, [r10, #372]
	str	r12, [r10, #376]
	str	r12, [r10, #380]
	str	r12, [r10, #384]
	str	r12, [r10, #388]
	str	r12, [r10, #392]
	str	r12, [r10, #396]
	str	r12, [r10, #400]
	str	r12, [r10, #404]
	str	r12, [r10, #408]
	str	r12, [r10, #412]
	str	r12, [r10, #416]
	str	r12, [r10, #420]
	str	r12, [r10, #424]
	str	r12, [r10, #428]
	str	r12, [r10, #432]
	str	r12, [r10, #436]
	str	r12, [r10, #440]
	str	r12, [r10, #444]
	str	r12, [r10, #448]
	str	r12, [r10, #452]
	str	r12, [r10, #456]
	str	r12, [r10, #460]
	str	r12, [r10, #464]
	str	r12, [r10, #468]
	str	r12, [r10, #472]
	str	r12, [r10, #476]
	str	r12, [r10, #480]
	str	r12, [r10, #484]
	str	r12, [r10, #488]
	str	r12, [r10, #492]
	str	r12, [r10, #496]
	str	r12, [r10, #500]
	str	r12, [r10, #504]
	str	r12, [r10, #508]
	str	r12, [r10, #512]
	str	r12, [r10, #516]
	str	r12, [r10, #520]
	str	r12, [r10, #524]
	str	r12, [r10, #528]
	str	r12, [r10, #532]
	str	r12, [r10, #536]
	str	r12, [r10, #540]
	str	r12, [r10, #544]
	str	r12, [r10, #548]
	str	r12, [r10, #552]
	str	r12, [r10, #556]
	str	r12, [r10, #560]
	str	r12, [r10, #564]
	str	r12, [r10, #568]
	str	r12, [r10, #572]
	str	r12, [r10, #576]
	str	r12, [r10, #580]
	str	r12, [r10, #584]
	str	r12, [r10, #588]
	str	r12, [r10, #592]
	str	r12, [r10, #596]
	str	r12, [r10, #600]
	str	r12, [r10, #604]
	str	r12, [r10, #608]
	str	r12, [r10, #612]
	str	r12, [r10, #616]
	str	r12, [r10, #620]
	str	r12, [r10, #624]
	str	r12, [r10, #628]
	str	r12, [r10, #632]
	str	r12, [r10, #636]
	str	r12, [r10, #640]
	str	r12, [r10, #644]
	str	r12, [r10, #648]
	str	r12, [r10, #652]
	str	r12, [r10, #656]
	str	r12, [r10, #660]
	str	r12, [r10, #664]
	str	r12, [r10, #668]
	str	r12, [r10, #672]
	str	r12, [r10, #676]
	str	r12, [r10, #680]
	str	r12, [r10, #684]
	str	r12, [r10, #688]
	str	r12, [r10, #692]
	str	r12, [r10, #696]
	str	r12, [r10, #700]
	str	r12, [r10, #704]
	str	r12, [r10, #708]
	str	r12, [r10, #712]
	str	r12, [r10, #716]
	str	r12, [r10, #720]
	str	r12, [r10, #724]
	str	r12, [r10, #728]
	str	r12, [r10, #732]
	str	r12, [r10, #736]
	str	r12, [r10, #740]
	str	r12, [r10, #744]
	str	r12, [r10, #748]
	str	r12, [r10, #752]
	str	r12, [r10, #756]
	str	r12, [r10, #760]
	str	r12, [r10, #764]
	str	r12, [r10, #768]
	str	r12, [r10, #772]
	str	r12, [r10, #776]
	str	r12, [r10, #780]
	str	r12, [r10, #784]
	str	r12, [r10, #788]
	str	r12, [r10, #792]
	str	r12, [r10, #796]
	str	r12, [r10, #800]
	str	r12, [r10, #804]
	str	r12, [r10, #808]
	str	r12, [r10, #812]
	str	r12, [r10, #816]
	str	r12, [r10, #820]
	str	r12, [r10, #824]
	str	r12, [r10, #828]
	str	r12, [r10, #832]
	str	r12, [r10, #836]
	str	r12, [r10, #840]
	str	r12, [r10, #844]
	str	r12, [r10, #848]
	str	r12, [r10, #852]
	str	r12, [r10, #856]
	str	r12, [r10, #860]
	str	r12, [r10, #864]
	str	r12, [r10, #868]
	str	r12, [r10, #872]
	str	r12, [r10, #876]
	str	r12, [r10, #880]
	str	r12, [r10, #884]
	str	r12, [r10, #888]
	str	r12, [r10, #892]
	str	r12, [r10, #896]
	str	r12, [r10, #900]
	str	r12, [r10, #904]
	str	r12, [r10, #908]
	str	r12, [r10, #912]
	str	r12, [r10, #916]
	str	r12, [r10, #920]
	str	r12, [r10, #924]
	str	r12, [r10, #928]
	str	r12, [r10, #932]
	str	r12, [r10, #936]
	str	r12, [r10, #940]
	str	r12, [r10, #944]
	str	r12, [r10, #948]
	str	r12, [r10, #952]
	str	r12, [r10, #956]
	str	r12, [r10, #960]
	str	r12, [r10, #964]
	str	r12, [r10, #968]
	str	r12, [r10, #972]
	str	r12, [r10, #976]
	str	r12, [r10, #980]
	str	r12, [r10, #984]
	str	r12, [r10, #988]
	str	r12, [r10, #992]
	str	r12, [r10, #996]
	str	r12, [r10, #1000]
	str	r12, [r10, #1004]
	str	r12, [r10, #1008]
	str	r12, [r10, #1012]
	str	r12, [r10, #1016]
	str	r12, [r10, #1020]

	movw	r9, #:lower16:cur_token
	movt	r9, #:upper16:cur_token
	ldr	r9, [r9, #0]
	ldr	r8, =0
	cmp	r9, r8
	bne	.L204
	ldr	r10, =1
	cmp	r10, #0
	b	.L160

.L204:
	ldr	r10, =0
	cmp	r10, #0
	b	.L159
	b	.L160

.L159:
	bl	panic
	mov	r9, r0
	mov	r0, r9
	b	.L158

.L160:
	ldr	r9, =-1036
	add	r9, r11, r9
	movw	r8, #:lower16:num
	movt	r8, #:upper16:num
	ldr	r8, [r8, #0]
	mov	r0, r9
	mov	r1, r8
	bl	stack_push
	bl	next_token
	mov	r12, r0

.L164:
	movw	r9, #:lower16:cur_token
	movt	r9, #:upper16:cur_token
	ldr	r9, [r9, #0]
	ldr	r8, =1
	cmp	r9, r8
	beq	.L165
	b	.L166

.L165:
	movw	r9, #:lower16:other
	movt	r9, #:upper16:other
	ldr	r9, [r9, #0]
	str	r9, [fp, #-2064]
	ldr	r9, [fp, #-2064]
	mov	r0, r9
	bl	get_op_pre
	mov	r9, r0
	cmp	r9, #0
	beq	.L170
	b	.L171

.L170:
	b	.L166

.L171:
	bl	next_token
	mov	r12, r0

.L172:
	ldr	r9, =-2060
	add	r9, r11, r9
	mov	r0, r9
	bl	stack_size
	mov	r9, r0
	cmp	r9, #0
	bne	.L205
	ldr	r10, =1
	cmp	r10, #0
	b	.L175

.L205:
	ldr	r10, =0
	cmp	r10, #0
	b	.L176
	b	.L175

.L176:
	ldr	r7, =-2060
	add	r7, r11, r7
	mov	r0, r7
	bl	stack_peek
	mov	r7, r0
	mov	r0, r7
	bl	get_op_pre
	mov	r7, r0
	ldr	r6, [fp, #-2064]
	mov	r0, r6
	bl	get_op_pre
	mov	r6, r0
	cmp	r7, r6
	bge	.L206
	ldr	r10, =1
	cmp	r10, #0
	b	.L177

.L206:
	ldr	r10, =0
	cmp	r10, #0
	b	.L177

.L177:

.L175:
	beq	.L173
	b	.L174

.L173:
	ldr	r9, =-2060
	add	r9, r11, r9
	mov	r0, r9
	bl	stack_pop
	mov	r9, r0
	str	r9, [fp, #-2068]
	ldr	r9, =-1036
	add	r9, r11, r9
	mov	r0, r9
	bl	stack_pop
	mov	r9, r0
	str	r9, [fp, #-2072]
	ldr	r9, =-1036
	add	r9, r11, r9
	mov	r0, r9
	bl	stack_pop
	mov	r9, r0
	str	r9, [fp, #-2076]
	ldr	r9, =-1036
	add	r9, r11, r9
	ldr	r8, [fp, #-2068]
	ldr	r7, [fp, #-2076]
	ldr	r6, [fp, #-2072]
	mov	r0, r8
	mov	r1, r7
	mov	r2, r6
	bl	eval_op
	mov	r8, r0
	mov	r0, r9
	mov	r1, r8
	bl	stack_push
	b	.L172

.L174:
	ldr	r9, =-2060
	add	r9, r11, r9
	ldr	r8, [fp, #-2064]
	mov	r0, r9
	mov	r1, r8
	bl	stack_push
	movw	r9, #:lower16:cur_token
	movt	r9, #:upper16:cur_token
	ldr	r9, [r9, #0]
	ldr	r8, =0
	cmp	r9, r8
	bne	.L207
	ldr	r10, =1
	cmp	r10, #0
	b	.L182

.L207:
	ldr	r10, =0
	cmp	r10, #0
	b	.L181
	b	.L182

.L181:
	bl	panic
	mov	r9, r0
	mov	r0, r9
	b	.L158

.L182:
	ldr	r9, =-1036
	add	r9, r11, r9
	movw	r8, #:lower16:num
	movt	r8, #:upper16:num
	ldr	r8, [r8, #0]
	mov	r0, r9
	mov	r1, r8
	bl	stack_push
	bl	next_token
	mov	r12, r0
	b	.L164

.L166:
	bl	next_token
	mov	r12, r0

.L186:
	ldr	r9, =-2060
	add	r9, r11, r9
	mov	r0, r9
	bl	stack_size
	mov	r9, r0
	cmp	r9, #0
	bne	.L208
	ldr	r10, =1
	cmp	r10, #0
	b	.L188

.L208:
	ldr	r10, =0
	cmp	r10, #0
	b	.L187
	b	.L188

.L187:
	ldr	r9, =-2060
	add	r9, r11, r9
	mov	r0, r9
	bl	stack_pop
	mov	r9, r0
	str	r9, [fp, #-2064]
	ldr	r9, =-1036
	add	r9, r11, r9
	mov	r0, r9
	bl	stack_pop
	mov	r9, r0
	str	r9, [fp, #-2068]
	ldr	r9, =-1036
	add	r9, r11, r9
	mov	r0, r9
	bl	stack_pop
	mov	r9, r0
	str	r9, [fp, #-2072]
	ldr	r9, =-1036
	add	r9, r11, r9
	ldr	r8, [fp, #-2064]
	ldr	r7, [fp, #-2072]
	ldr	r6, [fp, #-2068]
	mov	r0, r8
	mov	r1, r7
	mov	r2, r6
	bl	eval_op
	mov	r8, r0
	mov	r0, r9
	mov	r1, r8
	bl	stack_push
	b	.L186

.L188:
	ldr	r9, =-1036
	add	r9, r11, r9
	mov	r0, r9
	bl	stack_peek
	mov	r9, r0
	mov	r0, r9
	b	.L158

.L158:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	eval, .-eval

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 52
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #56
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-16]
	bl	getch
	mov	r12, r0
	bl	next_token
	mov	r12, r0

.L190:
	ldr	r9, [fp, #-16]
	cmp	r9, #0
	bne	.L209
	ldr	r10, =1
	cmp	r10, #0
	b	.L192

.L209:
	ldr	r10, =0
	cmp	r10, #0
	b	.L191
	b	.L192

.L191:
	bl	eval
	mov	r9, r0
	mov	r0, r9
	bl	putint
	ldr	r9, =10
	mov	r0, r9
	bl	putch
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	sub	r9, r9, r8
	str	r9, [fp, #-16]
	b	.L190

.L192:
	ldr	r9, =0
	mov	r0, r9
	b	.L189

.L189:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
