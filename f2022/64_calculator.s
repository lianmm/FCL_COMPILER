	.global	ints
	.data
	.align	2
	.type	ints, %object
	.size	ints, 40000
ints:
	.space	40000
	.global	intt
	.data
	.align	2
	.type	intt, %object
	.size	intt, 4
intt:
	.word	0

	.global	chas
	.data
	.align	2
	.type	chas, %object
	.size	chas, 40000
chas:
	.space	40000
	.global	chat
	.data
	.align	2
	.type	chat, %object
	.size	chat, 4
chat:
	.word	0

	.global	i
	.data
	.align	2
	.type	i, %object
	.size	i, 4
i:
	.word	0

	.global	ii
	.data
	.align	2
	.type	ii, %object
	.size	ii, 4
ii:
	.word	1

	.global	c
	.data
	.align	2
	.type	c, %object
	.size	c, 4
c:
	.word	0

	.global	get
	.data
	.align	2
	.type	get, %object
	.size	get, 40000
get:
	.space	40000
	.global	get2
	.data
	.align	2
	.type	get2, %object
	.size	get2, 40000
get2:
	.space	40000

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	isdigit
	.type	isdigit, %function
isdigit:
	@ args = 0, pretend = 0, frame = 36
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #40
	str	r0, [fp, #-16]
	ldr	r9, [fp, #-16]
	ldr	r8, =48
	cmp	r9, r8
	bge	.L592
	ldr	r10, =1
	cmp	r10, #0
	b	.L4

.L592:
	ldr	r10, =0
	cmp	r10, #0
	b	.L5
	b	.L4

.L5:
	ldr	r7, =57
	cmp	r9, r7
	ble	.L593
	ldr	r10, =1
	cmp	r10, #0
	b	.L6

.L593:
	ldr	r10, =0
	cmp	r10, #0
	b	.L6

.L6:

.L4:
	beq	.L2
	b	.L3

.L2:
	ldr	r9, =1
	mov	r0, r9
	b	.L1

.L3:
	ldr	r9, =0
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	isdigit, .-isdigit

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	power
	.type	power, %function
power:
	@ args = 0, pretend = 0, frame = 60
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #64
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r9, =1
	str	r9, [fp, #-24]

.L14:
	ldr	r9, [fp, #-20]
	ldr	r8, =0
	cmp	r9, r8
	bne	.L594
	ldr	r10, =1
	cmp	r10, #0
	b	.L16

.L594:
	ldr	r10, =0
	cmp	r10, #0
	b	.L15
	b	.L16

.L15:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-16]
	mul	r9, r8, r9
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	sub	r9, r9, r8
	str	r9, [fp, #-20]
	b	.L14

.L16:
	ldr	r9, [fp, #-24]
	mov	r0, r9
	b	.L13

.L13:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	power, .-power

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	getstr
	.type	getstr, %function
getstr:
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #84
	str	r0, [fp, #-16]
	bl	getch
	mov	r9, r0
	str	r9, [fp, #-20]
	ldr	r9, =0
	str	r9, [fp, #-24]

.L33:
	ldr	r9, [fp, #-20]
	ldr	r8, =13
	cmp	r9, r8
	bne	.L595
	ldr	r10, =1
	cmp	r10, #0
	b	.L36

.L595:
	ldr	r10, =0
	cmp	r10, #0
	b	.L37
	b	.L36

.L37:
	ldr	r8, [fp, #-20]
	ldr	r7, =10
	cmp	r8, r7
	bne	.L596
	ldr	r10, =1
	cmp	r10, #0
	b	.L38

.L596:
	ldr	r10, =0
	cmp	r10, #0
	b	.L38

.L38:

.L36:
	beq	.L34
	b	.L35

.L34:
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-24]
	ldr	r7, [fp, #-16]
	str	r9,	[r7, r8,LSL#2]
	ldr	r9, [fp, #-24]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-24]
	bl	getch
	mov	r9, r0
	str	r9, [fp, #-20]
	b	.L33

.L35:
	ldr	r9, [fp, #-24]
	mov	r0, r9
	b	.L32

.L32:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	getstr, .-getstr

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	intpush
	.type	intpush, %function
intpush:
	@ args = 0, pretend = 0, frame = 44
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #48
	str	r0, [fp, #-16]
	movw	r9, #:lower16:intt
	movt	r9, #:upper16:intt
	ldr	r9, [r9, #0]
	ldr	r8, =1
	add	r9, r8, r9
	movw	r10, #:lower16:intt
	movt	r10, #:upper16:intt
	str	r9, [r10, #0]
	ldr	r9, [fp, #-16]
	movw	r8, #:lower16:intt
	movt	r8, #:upper16:intt
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:ints
	movt	r10, #:upper16:ints
	str	r9,	[r10, r8,LSL#2]

.L57:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	intpush, .-intpush

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	chapush
	.type	chapush, %function
chapush:
	@ args = 0, pretend = 0, frame = 44
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #48
	str	r0, [fp, #-16]
	movw	r9, #:lower16:chat
	movt	r9, #:upper16:chat
	ldr	r9, [r9, #0]
	ldr	r8, =1
	add	r9, r8, r9
	movw	r10, #:lower16:chat
	movt	r10, #:upper16:chat
	str	r9, [r10, #0]
	ldr	r9, [fp, #-16]
	movw	r8, #:lower16:chat
	movt	r8, #:upper16:chat
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:chas
	movt	r10, #:upper16:chas
	str	r9,	[r10, r8,LSL#2]

.L67:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	chapush, .-chapush

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	intpop
	.type	intpop, %function
intpop:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #36
	movw	r9, #:lower16:intt
	movt	r9, #:upper16:intt
	ldr	r9, [r9, #0]
	ldr	r8, =1
	sub	r9, r9, r8
	movw	r10, #:lower16:intt
	movt	r10, #:upper16:intt
	str	r9, [r10, #0]
	movw	r9, #:lower16:intt
	movt	r9, #:upper16:intt
	ldr	r9, [r9, #0]
	ldr	r8, =1
	add	r9, r8, r9
	movw	r10, #:lower16:ints
	movt	r10, #:upper16:ints
	ldr	r9,	[r10, r9,LSL#2]
	mov	r0, r9
	b	.L77

.L77:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	intpop, .-intpop

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	chapop
	.type	chapop, %function
chapop:
	@ args = 0, pretend = 0, frame = 36
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #40
	movw	r9, #:lower16:chat
	movt	r9, #:upper16:chat
	ldr	r9, [r9, #0]
	ldr	r8, =1
	sub	r9, r9, r8
	movw	r10, #:lower16:chat
	movt	r10, #:upper16:chat
	str	r9, [r10, #0]
	movw	r9, #:lower16:chat
	movt	r9, #:upper16:chat
	ldr	r9, [r9, #0]
	ldr	r8, =1
	add	r9, r8, r9
	movw	r10, #:lower16:chas
	movt	r10, #:upper16:chas
	ldr	r9,	[r10, r9,LSL#2]
	mov	r0, r9
	b	.L87

.L87:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	chapop, .-chapop

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	intadd
	.type	intadd, %function
intadd:
	@ args = 0, pretend = 0, frame = 52
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #56
	str	r0, [fp, #-16]
	movw	r9, #:lower16:intt
	movt	r9, #:upper16:intt
	ldr	r9, [r9, #0]
	movw	r10, #:lower16:ints
	movt	r10, #:upper16:ints
	ldr	r8,	[r10, r9,LSL#2]
	ldr	r7, =10
	mul	r8, r7, r8
	movw	r10, #:lower16:ints
	movt	r10, #:upper16:ints
	str	r8,	[r10, r9,LSL#2]
	movw	r10, #:lower16:ints
	movt	r10, #:upper16:ints
	ldr	r8,	[r10, r9,LSL#2]
	ldr	r7, [fp, #-16]
	add	r8, r7, r8
	movw	r10, #:lower16:ints
	movt	r10, #:upper16:ints
	str	r8,	[r10, r9,LSL#2]

.L97:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	intadd, .-intadd

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	find
	.type	find, %function
find:
	@ args = 0, pretend = 0, frame = 52
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #56
	bl	chapop
	mov	r9, r0
	movw	r10, #:lower16:c
	movt	r10, #:upper16:c
	str	r9, [r10, #0]
	ldr	r9, =32
	movw	r8, #:lower16:ii
	movt	r8, #:upper16:ii
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:get2
	movt	r10, #:upper16:get2
	str	r9,	[r10, r8,LSL#2]
	movw	r9, #:lower16:c
	movt	r9, #:upper16:c
	ldr	r9, [r9, #0]
	ldr	r7, =1
	add	r7, r7, r8
	movw	r10, #:lower16:get2
	movt	r10, #:upper16:get2
	str	r9,	[r10, r7,LSL#2]
	ldr	r9, =2
	add	r9, r9, r8
	movw	r10, #:lower16:ii
	movt	r10, #:upper16:ii
	str	r9, [r10, #0]
	movw	r9, #:lower16:chat
	movt	r9, #:upper16:chat
	ldr	r9, [r9, #0]
	ldr	r8, =0
	cmp	r9, r8
	beq	.L129
	b	.L130

.L129:
	ldr	r9, =0
	mov	r0, r9
	b	.L110

.L130:
	ldr	r9, =1
	mov	r0, r9
	b	.L110

.L110:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	find, .-find

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 100
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #104
	ldr	r9, =0
	movw	r10, #:lower16:intt
	movt	r10, #:upper16:intt
	str	r9, [r10, #0]
	ldr	r9, =0
	movw	r10, #:lower16:chat
	movt	r10, #:upper16:chat
	str	r9, [r10, #0]
	movw	r12, #:lower16:get
	movt	r12, #:upper16:get
	movw	r0, #:lower16:get
	movt	r0, #:upper16:get
	bl	getstr
	mov	r9, r0
	str	r9, [fp, #-16]

.L141:
	movw	r9, #:lower16:i
	movt	r9, #:upper16:i
	ldr	r9, [r9, #0]
	ldr	r8, [fp, #-16]
	cmp	r9, r8
	blt	.L597
	ldr	r10, =1
	cmp	r10, #0
	b	.L143

.L597:
	ldr	r10, =0
	cmp	r10, #0
	b	.L142
	b	.L143

.L142:
	movw	r9, #:lower16:i
	movt	r9, #:upper16:i
	ldr	r9, [r9, #0]
	movw	r10, #:lower16:get
	movt	r10, #:upper16:get
	ldr	r9,	[r10, r9,LSL#2]
	mov	r0, r9
	bl	isdigit
	mov	r9, r0
	ldr	r8, =1
	cmp	r9, r8
	beq	.L147
	b	.L148

.L147:
	movw	r9, #:lower16:i
	movt	r9, #:upper16:i
	ldr	r9, [r9, #0]
	movw	r10, #:lower16:get
	movt	r10, #:upper16:get
	ldr	r9,	[r10, r9,LSL#2]
	movw	r8, #:lower16:ii
	movt	r8, #:upper16:ii
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:get2
	movt	r10, #:upper16:get2
	str	r9,	[r10, r8,LSL#2]
	movw	r9, #:lower16:ii
	movt	r9, #:upper16:ii
	ldr	r9, [r9, #0]
	ldr	r8, =1
	add	r9, r8, r9
	movw	r10, #:lower16:ii
	movt	r10, #:upper16:ii
	str	r9, [r10, #0]
	b	.L149

.L148:
	movw	r9, #:lower16:i
	movt	r9, #:upper16:i
	ldr	r9, [r9, #0]
	movw	r10, #:lower16:get
	movt	r10, #:upper16:get
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =40
	cmp	r9, r8
	beq	.L162
	b	.L163

.L162:
	ldr	r9, =40
	mov	r0, r9
	bl	chapush

.L163:
	movw	r9, #:lower16:i
	movt	r9, #:upper16:i
	ldr	r9, [r9, #0]
	movw	r10, #:lower16:get
	movt	r10, #:upper16:get
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =94
	cmp	r9, r8
	beq	.L167
	b	.L168

.L167:
	ldr	r9, =94
	mov	r0, r9
	bl	chapush

.L168:
	movw	r9, #:lower16:i
	movt	r9, #:upper16:i
	ldr	r9, [r9, #0]
	movw	r10, #:lower16:get
	movt	r10, #:upper16:get
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =41
	cmp	r9, r8
	beq	.L172
	b	.L173

.L172:
	bl	chapop
	mov	r9, r0
	movw	r10, #:lower16:c
	movt	r10, #:upper16:c
	str	r9, [r10, #0]

.L180:
	movw	r9, #:lower16:c
	movt	r9, #:upper16:c
	ldr	r9, [r9, #0]
	ldr	r8, =40
	cmp	r9, r8
	bne	.L598
	ldr	r10, =1
	cmp	r10, #0
	b	.L182

.L598:
	ldr	r10, =0
	cmp	r10, #0
	b	.L181
	b	.L182

.L181:
	ldr	r9, =32
	movw	r8, #:lower16:ii
	movt	r8, #:upper16:ii
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:get2
	movt	r10, #:upper16:get2
	str	r9,	[r10, r8,LSL#2]
	movw	r9, #:lower16:c
	movt	r9, #:upper16:c
	ldr	r9, [r9, #0]
	movw	r8, #:lower16:ii
	movt	r8, #:upper16:ii
	ldr	r8, [r8, #0]
	ldr	r7, =1
	add	r8, r7, r8
	movw	r10, #:lower16:get2
	movt	r10, #:upper16:get2
	str	r9,	[r10, r8,LSL#2]
	movw	r9, #:lower16:ii
	movt	r9, #:upper16:ii
	ldr	r9, [r9, #0]
	ldr	r8, =2
	add	r9, r8, r9
	movw	r10, #:lower16:ii
	movt	r10, #:upper16:ii
	str	r9, [r10, #0]
	bl	chapop
	mov	r9, r0
	movw	r10, #:lower16:c
	movt	r10, #:upper16:c
	str	r9, [r10, #0]
	b	.L180

.L182:

.L173:
	movw	r9, #:lower16:i
	movt	r9, #:upper16:i
	ldr	r9, [r9, #0]
	movw	r10, #:lower16:get
	movt	r10, #:upper16:get
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =43
	cmp	r9, r8
	beq	.L204
	b	.L205

.L204:

.L209:
	movw	r9, #:lower16:chat
	movt	r9, #:upper16:chat
	ldr	r9, [r9, #0]
	movw	r10, #:lower16:chas
	movt	r10, #:upper16:chas
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =43
	cmp	r9, r8
	beq	.L224
	b	.L225

.L225:
	movw	r8, #:lower16:chat
	movt	r8, #:upper16:chat
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:chas
	movt	r10, #:upper16:chas
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =45
	cmp	r8, r7

.L226:

.L224:
	beq	.L221
	b	.L222

.L222:
	movw	r8, #:lower16:chat
	movt	r8, #:upper16:chat
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:chas
	movt	r10, #:upper16:chas
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =42
	cmp	r8, r7

.L223:

.L221:
	beq	.L218
	b	.L219

.L219:
	movw	r8, #:lower16:chat
	movt	r8, #:upper16:chat
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:chas
	movt	r10, #:upper16:chas
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =47
	cmp	r8, r7

.L220:

.L218:
	beq	.L215
	b	.L216

.L216:
	movw	r8, #:lower16:chat
	movt	r8, #:upper16:chat
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:chas
	movt	r10, #:upper16:chas
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =37
	cmp	r8, r7

.L217:

.L215:
	beq	.L212
	b	.L213

.L213:
	movw	r8, #:lower16:chat
	movt	r8, #:upper16:chat
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:chas
	movt	r10, #:upper16:chas
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =94
	cmp	r8, r7

.L214:

.L212:
	beq	.L210
	b	.L211

.L210:
	bl	find
	mov	r9, r0
	ldr	r8, =0
	cmp	r9, r8
	beq	.L245
	b	.L246

.L245:
	b	.L211

.L246:
	b	.L209

.L211:
	ldr	r9, =43
	mov	r0, r9
	bl	chapush

.L205:
	movw	r9, #:lower16:i
	movt	r9, #:upper16:i
	ldr	r9, [r9, #0]
	movw	r10, #:lower16:get
	movt	r10, #:upper16:get
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =45
	cmp	r9, r8
	beq	.L250
	b	.L251

.L250:

.L255:
	movw	r9, #:lower16:chat
	movt	r9, #:upper16:chat
	ldr	r9, [r9, #0]
	movw	r10, #:lower16:chas
	movt	r10, #:upper16:chas
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =43
	cmp	r9, r8
	beq	.L270
	b	.L271

.L271:
	movw	r8, #:lower16:chat
	movt	r8, #:upper16:chat
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:chas
	movt	r10, #:upper16:chas
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =45
	cmp	r8, r7

.L272:

.L270:
	beq	.L267
	b	.L268

.L268:
	movw	r8, #:lower16:chat
	movt	r8, #:upper16:chat
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:chas
	movt	r10, #:upper16:chas
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =42
	cmp	r8, r7

.L269:

.L267:
	beq	.L264
	b	.L265

.L265:
	movw	r8, #:lower16:chat
	movt	r8, #:upper16:chat
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:chas
	movt	r10, #:upper16:chas
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =47
	cmp	r8, r7

.L266:

.L264:
	beq	.L261
	b	.L262

.L262:
	movw	r8, #:lower16:chat
	movt	r8, #:upper16:chat
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:chas
	movt	r10, #:upper16:chas
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =37
	cmp	r8, r7

.L263:

.L261:
	beq	.L258
	b	.L259

.L259:
	movw	r8, #:lower16:chat
	movt	r8, #:upper16:chat
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:chas
	movt	r10, #:upper16:chas
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =94
	cmp	r8, r7

.L260:

.L258:
	beq	.L256
	b	.L257

.L256:
	bl	find
	mov	r9, r0
	ldr	r8, =0
	cmp	r9, r8
	beq	.L291
	b	.L292

.L291:
	b	.L257

.L292:
	b	.L255

.L257:
	ldr	r9, =45
	mov	r0, r9
	bl	chapush

.L251:
	movw	r9, #:lower16:i
	movt	r9, #:upper16:i
	ldr	r9, [r9, #0]
	movw	r10, #:lower16:get
	movt	r10, #:upper16:get
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =42
	cmp	r9, r8
	beq	.L296
	b	.L297

.L296:

.L301:
	movw	r9, #:lower16:chat
	movt	r9, #:upper16:chat
	ldr	r9, [r9, #0]
	movw	r10, #:lower16:chas
	movt	r10, #:upper16:chas
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =42
	cmp	r9, r8
	beq	.L310
	b	.L311

.L311:
	movw	r8, #:lower16:chat
	movt	r8, #:upper16:chat
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:chas
	movt	r10, #:upper16:chas
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =47
	cmp	r8, r7

.L312:

.L310:
	beq	.L307
	b	.L308

.L308:
	movw	r8, #:lower16:chat
	movt	r8, #:upper16:chat
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:chas
	movt	r10, #:upper16:chas
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =37
	cmp	r8, r7

.L309:

.L307:
	beq	.L304
	b	.L305

.L305:
	movw	r8, #:lower16:chat
	movt	r8, #:upper16:chat
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:chas
	movt	r10, #:upper16:chas
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =94
	cmp	r8, r7

.L306:

.L304:
	beq	.L302
	b	.L303

.L302:
	bl	find
	mov	r9, r0
	ldr	r8, =0
	cmp	r9, r8
	beq	.L325
	b	.L326

.L325:
	b	.L303

.L326:
	b	.L301

.L303:
	ldr	r9, =42
	mov	r0, r9
	bl	chapush

.L297:
	movw	r9, #:lower16:i
	movt	r9, #:upper16:i
	ldr	r9, [r9, #0]
	movw	r10, #:lower16:get
	movt	r10, #:upper16:get
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =47
	cmp	r9, r8
	beq	.L330
	b	.L331

.L330:

.L335:
	movw	r9, #:lower16:chat
	movt	r9, #:upper16:chat
	ldr	r9, [r9, #0]
	movw	r10, #:lower16:chas
	movt	r10, #:upper16:chas
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =42
	cmp	r9, r8
	beq	.L344
	b	.L345

.L345:
	movw	r8, #:lower16:chat
	movt	r8, #:upper16:chat
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:chas
	movt	r10, #:upper16:chas
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =47
	cmp	r8, r7

.L346:

.L344:
	beq	.L341
	b	.L342

.L342:
	movw	r8, #:lower16:chat
	movt	r8, #:upper16:chat
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:chas
	movt	r10, #:upper16:chas
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =37
	cmp	r8, r7

.L343:

.L341:
	beq	.L338
	b	.L339

.L339:
	movw	r8, #:lower16:chat
	movt	r8, #:upper16:chat
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:chas
	movt	r10, #:upper16:chas
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =94
	cmp	r8, r7

.L340:

.L338:
	beq	.L336
	b	.L337

.L336:
	bl	find
	mov	r9, r0
	ldr	r8, =0
	cmp	r9, r8
	beq	.L359
	b	.L360

.L359:
	b	.L337

.L360:
	b	.L335

.L337:
	ldr	r9, =47
	mov	r0, r9
	bl	chapush

.L331:
	movw	r9, #:lower16:i
	movt	r9, #:upper16:i
	ldr	r9, [r9, #0]
	movw	r10, #:lower16:get
	movt	r10, #:upper16:get
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =37
	cmp	r9, r8
	beq	.L364
	b	.L365

.L364:

.L369:
	movw	r9, #:lower16:chat
	movt	r9, #:upper16:chat
	ldr	r9, [r9, #0]
	movw	r10, #:lower16:chas
	movt	r10, #:upper16:chas
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =42
	cmp	r9, r8
	beq	.L378
	b	.L379

.L379:
	movw	r8, #:lower16:chat
	movt	r8, #:upper16:chat
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:chas
	movt	r10, #:upper16:chas
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =47
	cmp	r8, r7

.L380:

.L378:
	beq	.L375
	b	.L376

.L376:
	movw	r8, #:lower16:chat
	movt	r8, #:upper16:chat
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:chas
	movt	r10, #:upper16:chas
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =37
	cmp	r8, r7

.L377:

.L375:
	beq	.L372
	b	.L373

.L373:
	movw	r8, #:lower16:chat
	movt	r8, #:upper16:chat
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:chas
	movt	r10, #:upper16:chas
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =94
	cmp	r8, r7

.L374:

.L372:
	beq	.L370
	b	.L371

.L370:
	bl	find
	mov	r9, r0
	ldr	r8, =0
	cmp	r9, r8
	beq	.L393
	b	.L394

.L393:
	b	.L371

.L394:
	b	.L369

.L371:
	ldr	r9, =37
	mov	r0, r9
	bl	chapush

.L365:
	ldr	r9, =32
	movw	r8, #:lower16:ii
	movt	r8, #:upper16:ii
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:get2
	movt	r10, #:upper16:get2
	str	r9,	[r10, r8,LSL#2]
	movw	r9, #:lower16:ii
	movt	r9, #:upper16:ii
	ldr	r9, [r9, #0]
	ldr	r8, =1
	add	r9, r8, r9
	movw	r10, #:lower16:ii
	movt	r10, #:upper16:ii
	str	r9, [r10, #0]

.L149:
	movw	r9, #:lower16:i
	movt	r9, #:upper16:i
	ldr	r9, [r9, #0]
	ldr	r8, =1
	add	r9, r8, r9
	movw	r10, #:lower16:i
	movt	r10, #:upper16:i
	str	r9, [r10, #0]
	b	.L141

.L143:

.L413:
	movw	r9, #:lower16:chat
	movt	r9, #:upper16:chat
	ldr	r9, [r9, #0]
	ldr	r8, =0
	cmp	r9, r8
	bgt	.L599
	ldr	r10, =1
	cmp	r10, #0
	b	.L415

.L599:
	ldr	r10, =0
	cmp	r10, #0
	b	.L414
	b	.L415

.L414:
	bl	chapop
	mov	r9, r0
	str	r9, [fp, #-20]
	ldr	r9, =32
	movw	r8, #:lower16:ii
	movt	r8, #:upper16:ii
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:get2
	movt	r10, #:upper16:get2
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-20]
	movw	r8, #:lower16:ii
	movt	r8, #:upper16:ii
	ldr	r8, [r8, #0]
	ldr	r7, =1
	add	r8, r7, r8
	movw	r10, #:lower16:get2
	movt	r10, #:upper16:get2
	str	r9,	[r10, r8,LSL#2]
	movw	r9, #:lower16:ii
	movt	r9, #:upper16:ii
	ldr	r9, [r9, #0]
	ldr	r8, =2
	add	r9, r8, r9
	movw	r10, #:lower16:ii
	movt	r10, #:upper16:ii
	str	r9, [r10, #0]
	b	.L413

.L415:
	ldr	r9, =64
	movw	r8, #:lower16:ii
	movt	r8, #:upper16:ii
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:get2
	movt	r10, #:upper16:get2
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =1
	movw	r10, #:lower16:i
	movt	r10, #:upper16:i
	str	r9, [r10, #0]

.L440:
	movw	r9, #:lower16:i
	movt	r9, #:upper16:i
	ldr	r9, [r9, #0]
	movw	r10, #:lower16:get2
	movt	r10, #:upper16:get2
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =64
	cmp	r9, r8
	bne	.L600
	ldr	r10, =1
	cmp	r10, #0
	b	.L442

.L600:
	ldr	r10, =0
	cmp	r10, #0
	b	.L441
	b	.L442

.L441:
	movw	r9, #:lower16:i
	movt	r9, #:upper16:i
	ldr	r9, [r9, #0]
	movw	r10, #:lower16:get2
	movt	r10, #:upper16:get2
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =43
	cmp	r9, r8
	beq	.L461
	b	.L462

.L462:
	movw	r8, #:lower16:i
	movt	r8, #:upper16:i
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:get2
	movt	r10, #:upper16:get2
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =45
	cmp	r8, r7

.L463:

.L461:
	beq	.L458
	b	.L459

.L459:
	movw	r8, #:lower16:i
	movt	r8, #:upper16:i
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:get2
	movt	r10, #:upper16:get2
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =42
	cmp	r8, r7

.L460:

.L458:
	beq	.L455
	b	.L456

.L456:
	movw	r8, #:lower16:i
	movt	r8, #:upper16:i
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:get2
	movt	r10, #:upper16:get2
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =47
	cmp	r8, r7

.L457:

.L455:
	beq	.L452
	b	.L453

.L453:
	movw	r8, #:lower16:i
	movt	r8, #:upper16:i
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:get2
	movt	r10, #:upper16:get2
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =37
	cmp	r8, r7

.L454:

.L452:
	beq	.L449
	b	.L450

.L450:
	movw	r8, #:lower16:i
	movt	r8, #:upper16:i
	ldr	r8, [r8, #0]
	movw	r10, #:lower16:get2
	movt	r10, #:upper16:get2
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =94
	cmp	r8, r7

.L451:

.L449:
	beq	.L446
	b	.L447

.L446:
	bl	intpop
	mov	r9, r0
	str	r9, [fp, #-20]
	bl	intpop
	mov	r9, r0
	str	r9, [fp, #-24]
	movw	r9, #:lower16:i
	movt	r9, #:upper16:i
	ldr	r9, [r9, #0]
	movw	r10, #:lower16:get2
	movt	r10, #:upper16:get2
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =43
	cmp	r9, r8
	beq	.L482
	b	.L483

.L482:
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-24]
	add	r9, r8, r9
	str	r9, [fp, #-28]

.L483:
	movw	r9, #:lower16:i
	movt	r9, #:upper16:i
	ldr	r9, [r9, #0]
	movw	r10, #:lower16:get2
	movt	r10, #:upper16:get2
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =45
	cmp	r9, r8
	beq	.L493
	b	.L494

.L493:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-20]
	sub	r9, r9, r8
	str	r9, [fp, #-28]

.L494:
	movw	r9, #:lower16:i
	movt	r9, #:upper16:i
	ldr	r9, [r9, #0]
	movw	r10, #:lower16:get2
	movt	r10, #:upper16:get2
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =42
	cmp	r9, r8
	beq	.L504
	b	.L505

.L504:
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-24]
	mul	r9, r8, r9
	str	r9, [fp, #-28]

.L505:
	movw	r9, #:lower16:i
	movt	r9, #:upper16:i
	ldr	r9, [r9, #0]
	movw	r10, #:lower16:get2
	movt	r10, #:upper16:get2
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =47
	cmp	r9, r8
	beq	.L515
	b	.L516

.L515:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-20]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]

.L516:
	movw	r9, #:lower16:i
	movt	r9, #:upper16:i
	ldr	r9, [r9, #0]
	movw	r10, #:lower16:get2
	movt	r10, #:upper16:get2
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =37
	cmp	r9, r8
	beq	.L526
	b	.L527

.L526:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-20]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	str	r9, [fp, #-28]

.L527:
	movw	r9, #:lower16:i
	movt	r9, #:upper16:i
	ldr	r9, [r9, #0]
	movw	r10, #:lower16:get2
	movt	r10, #:upper16:get2
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =94
	cmp	r9, r8
	beq	.L537
	b	.L538

.L537:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-20]
	mov	r0, r9
	mov	r1, r8
	bl	power
	mov	r9, r0
	str	r9, [fp, #-28]

.L538:
	ldr	r9, [fp, #-28]
	mov	r0, r9
	bl	intpush
	b	.L448

.L447:
	movw	r9, #:lower16:i
	movt	r9, #:upper16:i
	ldr	r9, [r9, #0]
	movw	r10, #:lower16:get2
	movt	r10, #:upper16:get2
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =32
	cmp	r9, r8
	bne	.L601
	ldr	r10, =1
	cmp	r10, #0
	b	.L546

.L601:
	ldr	r10, =0
	cmp	r10, #0
	b	.L545
	b	.L546

.L545:
	movw	r9, #:lower16:i
	movt	r9, #:upper16:i
	ldr	r9, [r9, #0]
	movw	r10, #:lower16:get2
	movt	r10, #:upper16:get2
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =48
	sub	r9, r9, r8
	mov	r0, r9
	bl	intpush
	ldr	r9, =1
	movw	r10, #:lower16:ii
	movt	r10, #:upper16:ii
	str	r9, [r10, #0]

.L556:
	movw	r9, #:lower16:i
	movt	r9, #:upper16:i
	ldr	r9, [r9, #0]
	movw	r8, #:lower16:ii
	movt	r8, #:upper16:ii
	ldr	r8, [r8, #0]
	add	r9, r8, r9
	movw	r10, #:lower16:get2
	movt	r10, #:upper16:get2
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =32
	cmp	r9, r8
	bne	.L602
	ldr	r10, =1
	cmp	r10, #0
	b	.L558

.L602:
	ldr	r10, =0
	cmp	r10, #0
	b	.L557
	b	.L558

.L557:
	movw	r9, #:lower16:i
	movt	r9, #:upper16:i
	ldr	r9, [r9, #0]
	movw	r8, #:lower16:ii
	movt	r8, #:upper16:ii
	ldr	r8, [r8, #0]
	add	r9, r8, r9
	movw	r10, #:lower16:get2
	movt	r10, #:upper16:get2
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =48
	sub	r9, r9, r8
	mov	r0, r9
	bl	intadd
	movw	r9, #:lower16:ii
	movt	r9, #:upper16:ii
	ldr	r9, [r9, #0]
	ldr	r8, =1
	add	r9, r8, r9
	movw	r10, #:lower16:ii
	movt	r10, #:upper16:ii
	str	r9, [r10, #0]
	b	.L556

.L558:
	movw	r9, #:lower16:i
	movt	r9, #:upper16:i
	ldr	r9, [r9, #0]
	movw	r8, #:lower16:ii
	movt	r8, #:upper16:ii
	ldr	r8, [r8, #0]
	add	r9, r8, r9
	ldr	r8, =1
	sub	r9, r9, r8
	movw	r10, #:lower16:i
	movt	r10, #:upper16:i
	str	r9, [r10, #0]

.L546:

.L448:
	movw	r9, #:lower16:i
	movt	r9, #:upper16:i
	ldr	r9, [r9, #0]
	ldr	r8, =1
	add	r9, r8, r9
	movw	r10, #:lower16:i
	movt	r10, #:upper16:i
	str	r9, [r10, #0]
	b	.L440

.L442:
	ldr	r9, =1
	movw	r10, #:lower16:ints
	movt	r10, #:upper16:ints
	ldr	r9,	[r10, r9,LSL#2]
	mov	r0, r9
	bl	putint
	ldr	r9, =0
	mov	r0, r9
	b	.L134

.L134:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
