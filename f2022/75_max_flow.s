	.global	size
	.data
	.align	2
	.type	size, %object
	.size	size, 40
size:
	.space	40
	.global	to
	.data
	.align	2
	.type	to, %object
	.size	to, 400
to:
	.space	400
	.global	cap
	.data
	.align	2
	.type	cap, %object
	.size	cap, 400
cap:
	.space	400
	.global	rev
	.data
	.align	2
	.type	rev, %object
	.size	rev, 400
rev:
	.space	400
	.global	used
	.data
	.align	2
	.type	used, %object
	.size	used, 40
used:
	.space	40

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	my_memset
	.type	my_memset, %function
my_memset:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #60
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r9, =0
	str	r9, [fp, #-28]

.L2:
	ldr	r9, [fp, #-28]
	ldr	r8, [fp, #-24]
	cmp	r9, r8
	blt	.L157
	ldr	r10, =1
	cmp	r10, #0
	b	.L4

.L157:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3
	b	.L4

.L3:
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-28]
	ldr	r7, [fp, #-16]
	str	r9,	[r7, r8,LSL#2]
	ldr	r9, [fp, #-28]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-28]
	b	.L2

.L4:

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	my_memset, .-my_memset

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	add_node
	.type	add_node, %function
add_node:
	@ args = 0, pretend = 0, frame = 92
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #96
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-16]
	movw	r10, #:lower16:size
	movt	r10, #:upper16:size
	ldr	r7,	[r10, r8,LSL#2]
	ldr	r6, =10
	mul	r6, r8, r6
	add	r7, r6, r7
	movw	r10, #:lower16:to
	movt	r10, #:upper16:to
	str	r9,	[r10, r7,LSL#2]
	ldr	r7, [fp, #-24]
	movw	r10, #:lower16:size
	movt	r10, #:upper16:size
	ldr	r6,	[r10, r8,LSL#2]
	ldr	r5, =10
	mul	r5, r8, r5
	add	r6, r5, r6
	movw	r10, #:lower16:cap
	movt	r10, #:upper16:cap
	str	r7,	[r10, r6,LSL#2]
	movw	r10, #:lower16:size
	movt	r10, #:upper16:size
	ldr	r7,	[r10, r9,LSL#2]
	movw	r10, #:lower16:size
	movt	r10, #:upper16:size
	ldr	r6,	[r10, r8,LSL#2]
	ldr	r5, =10
	mul	r5, r8, r5
	add	r6, r5, r6
	movw	r10, #:lower16:rev
	movt	r10, #:upper16:rev
	str	r7,	[r10, r6,LSL#2]
	movw	r10, #:lower16:size
	movt	r10, #:upper16:size
	ldr	r7,	[r10, r9,LSL#2]
	ldr	r6, =10
	mul	r6, r9, r6
	add	r7, r6, r7
	movw	r10, #:lower16:to
	movt	r10, #:upper16:to
	str	r8,	[r10, r7,LSL#2]
	ldr	r7, =0
	movw	r10, #:lower16:size
	movt	r10, #:upper16:size
	ldr	r6,	[r10, r9,LSL#2]
	ldr	r5, =10
	mul	r5, r9, r5
	add	r6, r5, r6
	movw	r10, #:lower16:cap
	movt	r10, #:upper16:cap
	str	r7,	[r10, r6,LSL#2]
	movw	r10, #:lower16:size
	movt	r10, #:upper16:size
	ldr	r7,	[r10, r8,LSL#2]
	movw	r10, #:lower16:size
	movt	r10, #:upper16:size
	ldr	r6,	[r10, r9,LSL#2]
	ldr	r5, =10
	mul	r5, r9, r5
	add	r6, r5, r6
	movw	r10, #:lower16:rev
	movt	r10, #:upper16:rev
	str	r7,	[r10, r6,LSL#2]
	movw	r10, #:lower16:size
	movt	r10, #:upper16:size
	ldr	r7,	[r10, r8,LSL#2]
	ldr	r6, =1
	add	r7, r6, r7
	movw	r10, #:lower16:size
	movt	r10, #:upper16:size
	str	r7,	[r10, r8,LSL#2]
	movw	r10, #:lower16:size
	movt	r10, #:upper16:size
	ldr	r8,	[r10, r9,LSL#2]
	ldr	r7, =1
	add	r8, r7, r8
	movw	r10, #:lower16:size
	movt	r10, #:upper16:size
	str	r8,	[r10, r9,LSL#2]

.L17:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	add_node, .-add_node

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	dfs
	.type	dfs, %function
dfs:
	@ args = 0, pretend = 0, frame = 216
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #220
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-20]
	cmp	r9, r8
	beq	.L49
	b	.L50

.L49:
	ldr	r9, [fp, #-24]
	mov	r0, r9
	b	.L48

.L50:
	ldr	r9, =1
	ldr	r8, [fp, #-16]
	movw	r10, #:lower16:used
	movt	r10, #:upper16:used
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =0
	str	r9, [fp, #-28]

.L57:
	ldr	r9, [fp, #-28]
	ldr	r8, [fp, #-16]
	movw	r10, #:lower16:size
	movt	r10, #:upper16:size
	ldr	r8,	[r10, r8,LSL#2]
	cmp	r9, r8
	blt	.L158
	ldr	r10, =1
	cmp	r10, #0
	b	.L59

.L158:
	ldr	r10, =0
	cmp	r10, #0
	b	.L58
	b	.L59

.L58:
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-28]
	ldr	r7, =10
	mul	r9, r9, r7
	add	r9, r9, r8
	movw	r10, #:lower16:to
	movt	r10, #:upper16:to
	ldr	r9,	[r10, r9,LSL#2]
	movw	r10, #:lower16:used
	movt	r10, #:upper16:used
	ldr	r9,	[r10, r9,LSL#2]
	cmp	r9, #0
	bne	.L159
	ldr	r10, =1
	cmp	r10, #0
	b	.L64

.L159:
	ldr	r10, =0
	cmp	r10, #0
	b	.L63
	b	.L64

.L63:
	ldr	r9, [fp, #-28]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-28]
	b	.L57

.L64:
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-28]
	ldr	r7, =10
	mul	r9, r9, r7
	add	r9, r9, r8
	movw	r10, #:lower16:cap
	movt	r10, #:upper16:cap
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =0
	cmp	r9, r8
	ble	.L160
	ldr	r10, =1
	cmp	r10, #0
	b	.L72

.L160:
	ldr	r10, =0
	cmp	r10, #0
	b	.L71
	b	.L72

.L71:
	ldr	r9, [fp, #-28]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-28]
	b	.L57

.L72:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-16]
	ldr	r7, [fp, #-28]
	ldr	r6, =10
	mul	r8, r8, r6
	add	r8, r8, r7
	movw	r10, #:lower16:cap
	movt	r10, #:upper16:cap
	ldr	r8,	[r10, r8,LSL#2]
	cmp	r9, r8
	blt	.L161
	ldr	r10, =1
	cmp	r10, #0
	b	.L83

.L161:
	ldr	r10, =0
	cmp	r10, #0
	b	.L82
	b	.L83

.L82:
	ldr	r9, [fp, #-24]
	str	r9, [fp, #-32]
	b	.L84

.L83:
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-28]
	ldr	r7, =10
	mul	r9, r9, r7
	add	r9, r9, r8
	movw	r10, #:lower16:cap
	movt	r10, #:upper16:cap
	ldr	r9,	[r10, r9,LSL#2]
	str	r9, [fp, #-32]

.L84:
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-28]
	ldr	r7, =10
	mul	r9, r9, r7
	add	r9, r9, r8
	movw	r10, #:lower16:to
	movt	r10, #:upper16:to
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, [fp, #-20]
	ldr	r7, [fp, #-32]
	mov	r0, r9
	mov	r1, r8
	mov	r2, r7
	bl	dfs
	mov	r9, r0
	str	r9, [fp, #-36]
	ldr	r9, [fp, #-36]
	ldr	r8, =0
	cmp	r9, r8
	bgt	.L162
	ldr	r10, =1
	cmp	r10, #0
	b	.L95

.L162:
	ldr	r10, =0
	cmp	r10, #0
	b	.L94
	b	.L95

.L94:
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-28]
	ldr	r7, =10
	mul	r9, r9, r7
	add	r9, r9, r8
	movw	r10, #:lower16:cap
	movt	r10, #:upper16:cap
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, [fp, #-36]
	sub	r9, r9, r8
	ldr	r8, [fp, #-16]
	ldr	r7, [fp, #-28]
	ldr	r6, =10
	mul	r8, r8, r6
	add	r8, r8, r7
	movw	r10, #:lower16:cap
	movt	r10, #:upper16:cap
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-28]
	ldr	r7, =10
	mul	r9, r9, r7
	add	r9, r9, r8
	movw	r10, #:lower16:to
	movt	r10, #:upper16:to
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, [fp, #-16]
	ldr	r7, [fp, #-28]
	ldr	r6, =10
	mul	r8, r8, r6
	add	r8, r8, r7
	movw	r10, #:lower16:rev
	movt	r10, #:upper16:rev
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =10
	mul	r9, r9, r7
	add	r9, r9, r8
	movw	r10, #:lower16:cap
	movt	r10, #:upper16:cap
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, [fp, #-36]
	add	r9, r8, r9
	ldr	r8, [fp, #-16]
	ldr	r7, [fp, #-28]
	ldr	r6, =10
	mul	r8, r8, r6
	add	r8, r8, r7
	movw	r10, #:lower16:to
	movt	r10, #:upper16:to
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, [fp, #-16]
	ldr	r6, [fp, #-28]
	ldr	r5, =10
	mul	r7, r7, r5
	add	r7, r7, r6
	movw	r10, #:lower16:rev
	movt	r10, #:upper16:rev
	ldr	r7,	[r10, r7,LSL#2]
	ldr	r6, =10
	mul	r8, r8, r6
	add	r8, r8, r7
	movw	r10, #:lower16:cap
	movt	r10, #:upper16:cap
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-36]
	mov	r0, r9
	b	.L48

.L95:
	ldr	r9, [fp, #-28]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-28]
	b	.L57

.L59:
	ldr	r9, =0
	mov	r0, r9
	b	.L48

.L48:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	dfs, .-dfs

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	max_flow
	.type	max_flow, %function
max_flow:
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #100
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r9, =0
	str	r9, [fp, #-24]

.L118:
	ldr	r9, =1
	cmp	r9, #0
	bne	.L163
	ldr	r10, =1
	cmp	r10, #0
	b	.L120

.L163:
	ldr	r10, =0
	cmp	r10, #0
	b	.L119
	b	.L120

.L119:
	movw	r12, #:lower16:used
	movt	r12, #:upper16:used
	ldr	r9, =0
	ldr	r8, =10
	movw	r0, #:lower16:used
	movt	r0, #:upper16:used
	mov	r1, r9
	mov	r2, r8
	bl	my_memset
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-20]
	ldr	r7, =1879048192
	mov	r0, r9
	mov	r1, r8
	mov	r2, r7
	bl	dfs
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-28]
	ldr	r8, =0
	cmp	r9, r8
	beq	.L121
	b	.L122

.L121:
	ldr	r9, [fp, #-24]
	mov	r0, r9
	b	.L117

.L122:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	add	r9, r8, r9
	str	r9, [fp, #-24]
	b	.L118

.L120:

.L117:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	max_flow, .-max_flow

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 108
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #112
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-16]
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-20]
	movw	r12, #:lower16:size
	movt	r12, #:upper16:size
	ldr	r9, =0
	ldr	r8, =10
	movw	r0, #:lower16:size
	movt	r0, #:upper16:size
	mov	r1, r9
	mov	r2, r8
	bl	my_memset

.L139:
	ldr	r9, [fp, #-20]
	ldr	r8, =0
	cmp	r9, r8
	bgt	.L164
	ldr	r10, =1
	cmp	r10, #0
	b	.L141

.L164:
	ldr	r10, =0
	cmp	r10, #0
	b	.L140
	b	.L141

.L140:
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-24]
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-28]
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-32]
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	ldr	r7, [fp, #-32]
	mov	r0, r9
	mov	r1, r8
	mov	r2, r7
	bl	add_node
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	sub	r9, r9, r8
	str	r9, [fp, #-20]
	b	.L139

.L141:
	ldr	r9, =1
	ldr	r8, [fp, #-16]
	mov	r0, r9
	mov	r1, r8
	bl	max_flow
	mov	r9, r0
	mov	r0, r9
	bl	putint
	ldr	r9, =10
	mov	r0, r9
	bl	putch
	ldr	r9, =0
	mov	r0, r9
	b	.L132

.L132:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
