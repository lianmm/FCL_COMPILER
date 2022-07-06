	.global	e
	.data
	.align	2
	.type	e, %object
	.size	e, 1024
e:
	.space	1024
	.global	book
	.data
	.align	2
	.type	book, %object
	.size	book, 64
book:
	.space	64
	.global	dis
	.data
	.align	2
	.type	dis, %object
	.size	dis, 64
dis:
	.space	64
	.global	n
	.data
	.align	2
	.type	n, %object
	.size	n, 4
n:
	.word	0

	.global	m
	.data
	.align	2
	.type	m, %object
	.size	m, 4
m:
	.word	0

	.global	v1
	.data
	.align	2
	.type	v1, %object
	.size	v1, 4
v1:
	.word	0

	.global	v2
	.data
	.align	2
	.type	v2, %object
	.size	v2, 4
v2:
	.word	0

	.global	w
	.data
	.align	2
	.type	w, %object
	.size	w, 4
w:
	.word	0


	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	Dijkstra
	.type	Dijkstra, %function
Dijkstra:
	@ args = 0, pretend = 0, frame = 52
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #56
	ldr	r9, =1
	str	r9, [fp, #-16]

.L5:
	ldr	r9, [fp, #-16]
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	cmp	r9, r8
	ble	.L186
	ldr	r10, =1
	cmp	r10, #0
	b	.L7

.L186:
	ldr	r10, =0
	cmp	r10, #0
	b	.L6
	b	.L7

.L6:
	ldr	r9, [fp, #-16]
	ldr	r8, =16
	ldr	r7, =1
	mul	r8, r7, r8
	add	r9, r8, r9
	movw	r10, #:lower16:e
	movt	r10, #:upper16:e
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, [fp, #-16]
	movw	r10, #:lower16:dis
	movt	r10, #:upper16:dis
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =0
	ldr	r8, [fp, #-16]
	movw	r10, #:lower16:book
	movt	r10, #:upper16:book
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-16]
	b	.L5

.L7:
	ldr	r9, =1
	ldr	r8, =1
	movw	r10, #:lower16:book
	movt	r10, #:upper16:book
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =1
	str	r9, [fp, #-16]

.L29:
	ldr	r9, [fp, #-16]
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	ldr	r7, =1
	sub	r8, r8, r7
	cmp	r9, r8
	ble	.L187
	ldr	r10, =1
	cmp	r10, #0
	b	.L31

.L187:
	ldr	r10, =0
	cmp	r10, #0
	b	.L30
	b	.L31

.L30:
	ldr	r9, =65535
	str	r9, [fp, #-24]
	ldr	r9, =0
	str	r9, [fp, #-28]
	ldr	r9, =1
	str	r9, [fp, #-32]

.L38:
	ldr	r9, [fp, #-32]
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	cmp	r9, r8
	ble	.L188
	ldr	r10, =1
	cmp	r10, #0
	b	.L40

.L188:
	ldr	r10, =0
	cmp	r10, #0
	b	.L39
	b	.L40

.L39:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-32]
	movw	r10, #:lower16:dis
	movt	r10, #:upper16:dis
	ldr	r8,	[r10, r8,LSL#2]
	cmp	r9, r8
	bgt	.L189
	ldr	r10, =1
	cmp	r10, #0
	b	.L46

.L189:
	ldr	r10, =0
	cmp	r10, #0
	b	.L47
	b	.L46

.L47:
	ldr	r8, [fp, #-32]
	movw	r10, #:lower16:book
	movt	r10, #:upper16:book
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =0
	cmp	r8, r7

.L48:

.L46:
	beq	.L44
	b	.L45

.L44:
	ldr	r9, [fp, #-32]
	movw	r10, #:lower16:dis
	movt	r10, #:upper16:dis
	ldr	r9,	[r10, r9,LSL#2]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-32]
	str	r9, [fp, #-28]

.L45:
	ldr	r9, [fp, #-32]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-32]
	b	.L38

.L40:
	ldr	r9, =1
	ldr	r8, [fp, #-28]
	movw	r10, #:lower16:book
	movt	r10, #:upper16:book
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =1
	str	r9, [fp, #-36]

.L70:
	ldr	r9, [fp, #-36]
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	cmp	r9, r8
	ble	.L190
	ldr	r10, =1
	cmp	r10, #0
	b	.L72

.L190:
	ldr	r10, =0
	cmp	r10, #0
	b	.L71
	b	.L72

.L71:
	ldr	r9, [fp, #-28]
	ldr	r8, [fp, #-36]
	ldr	r7, =16
	mul	r9, r9, r7
	add	r9, r9, r8
	movw	r10, #:lower16:e
	movt	r10, #:upper16:e
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =65535
	cmp	r9, r8
	blt	.L191
	ldr	r10, =1
	cmp	r10, #0
	b	.L77

.L191:
	ldr	r10, =0
	cmp	r10, #0
	b	.L76
	b	.L77

.L76:
	ldr	r9, [fp, #-36]
	movw	r10, #:lower16:dis
	movt	r10, #:upper16:dis
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, [fp, #-28]
	movw	r10, #:lower16:dis
	movt	r10, #:upper16:dis
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, [fp, #-28]
	ldr	r6, [fp, #-36]
	ldr	r5, =16
	mul	r7, r7, r5
	add	r7, r7, r6
	movw	r10, #:lower16:e
	movt	r10, #:upper16:e
	ldr	r7,	[r10, r7,LSL#2]
	add	r8, r7, r8
	cmp	r9, r8
	bgt	.L192
	ldr	r10, =1
	cmp	r10, #0
	b	.L82

.L192:
	ldr	r10, =0
	cmp	r10, #0
	b	.L81
	b	.L82

.L81:
	ldr	r9, [fp, #-28]
	movw	r10, #:lower16:dis
	movt	r10, #:upper16:dis
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, [fp, #-28]
	ldr	r7, [fp, #-36]
	ldr	r6, =16
	mul	r8, r8, r6
	add	r8, r8, r7
	movw	r10, #:lower16:e
	movt	r10, #:upper16:e
	ldr	r8,	[r10, r8,LSL#2]
	add	r9, r8, r9
	ldr	r8, [fp, #-36]
	movw	r10, #:lower16:dis
	movt	r10, #:upper16:dis
	str	r9,	[r10, r8,LSL#2]

.L82:

.L77:
	ldr	r9, [fp, #-36]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-36]
	b	.L70

.L72:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-16]
	b	.L29

.L31:

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	Dijkstra, .-Dijkstra

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 252
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #256
	bl	getint
	mov	r9, r0
	movw	r10, #:lower16:n
	movt	r10, #:upper16:n
	str	r9, [r10, #0]
	bl	getint
	mov	r9, r0
	movw	r10, #:lower16:m
	movt	r10, #:upper16:m
	str	r9, [r10, #0]
	ldr	r9, =1
	str	r9, [fp, #-16]

.L117:
	ldr	r9, [fp, #-16]
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	cmp	r9, r8
	ble	.L193
	ldr	r10, =1
	cmp	r10, #0
	b	.L119

.L193:
	ldr	r10, =0
	cmp	r10, #0
	b	.L118
	b	.L119

.L118:
	ldr	r9, =1
	str	r9, [fp, #-20]

.L123:
	ldr	r9, [fp, #-20]
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	cmp	r9, r8
	ble	.L194
	ldr	r10, =1
	cmp	r10, #0
	b	.L125

.L194:
	ldr	r10, =0
	cmp	r10, #0
	b	.L124
	b	.L125

.L124:
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-20]
	cmp	r9, r8
	beq	.L129
	b	.L130

.L129:
	ldr	r9, =0
	ldr	r8, [fp, #-16]
	ldr	r7, [fp, #-20]
	ldr	r6, =16
	mul	r8, r8, r6
	add	r8, r8, r7
	movw	r10, #:lower16:e
	movt	r10, #:upper16:e
	str	r9,	[r10, r8,LSL#2]
	b	.L131

.L130:
	ldr	r9, =65535
	ldr	r8, [fp, #-16]
	ldr	r7, [fp, #-20]
	ldr	r6, =16
	mul	r8, r8, r6
	add	r8, r8, r7
	movw	r10, #:lower16:e
	movt	r10, #:upper16:e
	str	r9,	[r10, r8,LSL#2]

.L131:
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L123

.L125:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-16]
	b	.L117

.L119:
	ldr	r9, =1
	str	r9, [fp, #-16]

.L156:
	ldr	r9, [fp, #-16]
	movw	r8, #:lower16:m
	movt	r8, #:upper16:m
	ldr	r8, [r8, #0]
	cmp	r9, r8
	ble	.L195
	ldr	r10, =1
	cmp	r10, #0
	b	.L158

.L195:
	ldr	r10, =0
	cmp	r10, #0
	b	.L157
	b	.L158

.L157:
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-20]
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-24]
	bl	getint
	mov	r9, r0
	ldr	r8, [fp, #-20]
	ldr	r7, [fp, #-24]
	ldr	r6, =16
	mul	r8, r8, r6
	add	r8, r8, r7
	movw	r10, #:lower16:e
	movt	r10, #:upper16:e
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-16]
	b	.L156

.L158:
	bl	Dijkstra
	ldr	r9, =1
	str	r9, [fp, #-16]

.L174:
	ldr	r9, [fp, #-16]
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	cmp	r9, r8
	ble	.L196
	ldr	r10, =1
	cmp	r10, #0
	b	.L176

.L196:
	ldr	r10, =0
	cmp	r10, #0
	b	.L175
	b	.L176

.L175:
	ldr	r9, [fp, #-16]
	movw	r10, #:lower16:dis
	movt	r10, #:upper16:dis
	ldr	r9,	[r10, r9,LSL#2]
	mov	r0, r9
	bl	putint
	ldr	r9, =32
	mov	r0, r9
	bl	putch
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-16]
	b	.L174

.L176:
	ldr	r9, =10
	mov	r0, r9
	bl	putch
	ldr	r9, =0
	mov	r0, r9
	b	.L107

.L107:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
