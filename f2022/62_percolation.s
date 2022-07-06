	.global	array
	.data
	.align	2
	.type	array, %object
	.size	array, 440
array:
	.space	440
	.global	n
	.data
	.align	2
	.type	n, %object
	.size	n, 4
n:
	.word	0


	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	init
	.type	init, %function
init:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #44
	str	r0, [fp, #-16]
	ldr	r9, =1
	str	r9, [fp, #-20]

.L2:
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-16]
	ldr	r7, [fp, #-16]
	mul	r8, r7, r8
	ldr	r7, =1
	add	r8, r7, r8
	cmp	r9, r8
	ble	.L208
	ldr	r10, =1
	cmp	r10, #0
	b	.L4

.L208:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3
	b	.L4

.L3:
	ldr	r9, =-1
	ldr	r8, [fp, #-20]
	movw	r10, #:lower16:array
	movt	r10, #:upper16:array
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L2

.L4:

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	init, .-init

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	findfa
	.type	findfa, %function
findfa:
	@ args = 0, pretend = 0, frame = 52
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #56
	str	r0, [fp, #-16]
	ldr	r9, [fp, #-16]
	movw	r10, #:lower16:array
	movt	r10, #:upper16:array
	ldr	r8,	[r10, r9,LSL#2]
	cmp	r8, r9
	beq	.L24
	b	.L25

.L24:
	mov	r0, r9
	b	.L23
	b	.L26

.L25:
	ldr	r9, [fp, #-16]
	movw	r10, #:lower16:array
	movt	r10, #:upper16:array
	ldr	r8,	[r10, r9,LSL#2]
	mov	r0, r8
	bl	findfa
	mov	r8, r0
	movw	r10, #:lower16:array
	movt	r10, #:upper16:array
	str	r8,	[r10, r9,LSL#2]
	movw	r10, #:lower16:array
	movt	r10, #:upper16:array
	ldr	r9,	[r10, r9,LSL#2]
	mov	r0, r9
	b	.L23

.L26:

.L23:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	findfa, .-findfa

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	mmerge
	.type	mmerge, %function
mmerge:
	@ args = 0, pretend = 0, frame = 60
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #64
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r9, [fp, #-16]
	mov	r0, r9
	bl	findfa
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-20]
	mov	r0, r9
	bl	findfa
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	cmp	r9, r8
	bne	.L209
	ldr	r10, =1
	cmp	r10, #0
	b	.L35

.L209:
	ldr	r10, =0
	cmp	r10, #0
	b	.L34
	b	.L35

.L34:
	movw	r10, #:lower16:array
	movt	r10, #:upper16:array
	str	r8,	[r10, r9,LSL#2]

.L35:

.L33:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	mmerge, .-mmerge

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
	ldr	r9, =1
	str	r9, [fp, #-16]

.L46:
	ldr	r9, [fp, #-16]
	cmp	r9, #0
	bne	.L210
	ldr	r10, =1
	cmp	r10, #0
	b	.L48

.L210:
	ldr	r10, =0
	cmp	r10, #0
	b	.L47
	b	.L48

.L47:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	sub	r9, r9, r8
	str	r9, [fp, #-16]
	ldr	r9, =4
	movw	r10, #:lower16:n
	movt	r10, #:upper16:n
	str	r9, [r10, #0]
	ldr	r9, =10
	str	r9, [fp, #-20]
	ldr	r9, =0
	str	r9, [fp, #-32]
	ldr	r9, =0
	str	r9, [fp, #-36]
	movw	r9, #:lower16:n
	movt	r9, #:upper16:n
	ldr	r9, [r9, #0]
	mov	r0, r9
	bl	init
	movw	r9, #:lower16:n
	movt	r9, #:upper16:n
	ldr	r9, [r9, #0]
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	mul	r9, r8, r9
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-40]

.L67:
	ldr	r9, [fp, #-32]
	ldr	r8, [fp, #-20]
	cmp	r9, r8
	blt	.L211
	ldr	r10, =1
	cmp	r10, #0
	b	.L69

.L211:
	ldr	r10, =0
	cmp	r10, #0
	b	.L68
	b	.L69

.L68:
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-24]
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-36]
	cmp	r9, #0
	beq	.L79
	b	.L80

.L79:
	movw	r9, #:lower16:n
	movt	r9, #:upper16:n
	ldr	r9, [r9, #0]
	ldr	r8, [fp, #-24]
	ldr	r7, =1
	sub	r8, r8, r7
	mul	r9, r8, r9
	ldr	r8, [fp, #-28]
	add	r9, r8, r9
	str	r9, [fp, #-44]
	ldr	r9, [fp, #-44]
	ldr	r8, [fp, #-44]
	movw	r10, #:lower16:array
	movt	r10, #:upper16:array
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-24]
	ldr	r8, =1
	cmp	r9, r8
	beq	.L93
	b	.L94

.L93:
	ldr	r9, =0
	ldr	r8, =0
	movw	r10, #:lower16:array
	movt	r10, #:upper16:array
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-44]
	ldr	r8, =0
	mov	r0, r9
	mov	r1, r8
	bl	mmerge

.L94:
	ldr	r9, [fp, #-24]
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	cmp	r9, r8
	beq	.L101
	b	.L102

.L101:
	ldr	r9, [fp, #-40]
	ldr	r8, [fp, #-40]
	movw	r10, #:lower16:array
	movt	r10, #:upper16:array
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-44]
	ldr	r8, [fp, #-40]
	mov	r0, r9
	mov	r1, r8
	bl	mmerge

.L102:
	ldr	r9, [fp, #-28]
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	cmp	r9, r8
	blt	.L212
	ldr	r10, =1
	cmp	r10, #0
	b	.L111

.L212:
	ldr	r10, =0
	cmp	r10, #0
	b	.L112
	b	.L111

.L112:
	ldr	r8, [fp, #-44]
	ldr	r7, =1
	add	r8, r7, r8
	movw	r10, #:lower16:array
	movt	r10, #:upper16:array
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =-1
	cmp	r8, r7
	bne	.L213
	ldr	r10, =1
	cmp	r10, #0
	b	.L113

.L213:
	ldr	r10, =0
	cmp	r10, #0
	b	.L113

.L113:

.L111:
	beq	.L109
	b	.L110

.L109:
	ldr	r9, [fp, #-44]
	ldr	r8, [fp, #-44]
	ldr	r7, =1
	add	r8, r7, r8
	mov	r0, r9
	mov	r1, r8
	bl	mmerge

.L110:
	ldr	r9, [fp, #-28]
	ldr	r8, =1
	cmp	r9, r8
	bgt	.L214
	ldr	r10, =1
	cmp	r10, #0
	b	.L128

.L214:
	ldr	r10, =0
	cmp	r10, #0
	b	.L129
	b	.L128

.L129:
	ldr	r8, [fp, #-44]
	ldr	r7, =1
	sub	r8, r8, r7
	movw	r10, #:lower16:array
	movt	r10, #:upper16:array
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =-1
	cmp	r8, r7
	bne	.L215
	ldr	r10, =1
	cmp	r10, #0
	b	.L130

.L215:
	ldr	r10, =0
	cmp	r10, #0
	b	.L130

.L130:

.L128:
	beq	.L126
	b	.L127

.L126:
	ldr	r9, [fp, #-44]
	ldr	r8, [fp, #-44]
	ldr	r7, =1
	sub	r8, r8, r7
	mov	r0, r9
	mov	r1, r8
	bl	mmerge

.L127:
	ldr	r9, [fp, #-24]
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	cmp	r9, r8
	blt	.L216
	ldr	r10, =1
	cmp	r10, #0
	b	.L145

.L216:
	ldr	r10, =0
	cmp	r10, #0
	b	.L146
	b	.L145

.L146:
	ldr	r8, [fp, #-44]
	movw	r7, #:lower16:n
	movt	r7, #:upper16:n
	ldr	r7, [r7, #0]
	add	r8, r7, r8
	movw	r10, #:lower16:array
	movt	r10, #:upper16:array
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =-1
	cmp	r8, r7
	bne	.L217
	ldr	r10, =1
	cmp	r10, #0
	b	.L147

.L217:
	ldr	r10, =0
	cmp	r10, #0
	b	.L147

.L147:

.L145:
	beq	.L143
	b	.L144

.L143:
	ldr	r9, [fp, #-44]
	ldr	r8, [fp, #-44]
	movw	r7, #:lower16:n
	movt	r7, #:upper16:n
	ldr	r7, [r7, #0]
	add	r8, r7, r8
	mov	r0, r9
	mov	r1, r8
	bl	mmerge

.L144:
	ldr	r9, [fp, #-24]
	ldr	r8, =1
	cmp	r9, r8
	bgt	.L218
	ldr	r10, =1
	cmp	r10, #0
	b	.L162

.L218:
	ldr	r10, =0
	cmp	r10, #0
	b	.L163
	b	.L162

.L163:
	ldr	r8, [fp, #-44]
	movw	r7, #:lower16:n
	movt	r7, #:upper16:n
	ldr	r7, [r7, #0]
	sub	r8, r8, r7
	movw	r10, #:lower16:array
	movt	r10, #:upper16:array
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =-1
	cmp	r8, r7
	bne	.L219
	ldr	r10, =1
	cmp	r10, #0
	b	.L164

.L219:
	ldr	r10, =0
	cmp	r10, #0
	b	.L164

.L164:

.L162:
	beq	.L160
	b	.L161

.L160:
	ldr	r9, [fp, #-44]
	ldr	r8, [fp, #-44]
	movw	r7, #:lower16:n
	movt	r7, #:upper16:n
	ldr	r7, [r7, #0]
	sub	r8, r8, r7
	mov	r0, r9
	mov	r1, r8
	bl	mmerge

.L161:
	ldr	r9, =0
	movw	r10, #:lower16:array
	movt	r10, #:upper16:array
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =-1
	cmp	r9, r8
	bne	.L220
	ldr	r10, =1
	cmp	r10, #0
	b	.L182

.L220:
	ldr	r10, =0
	cmp	r10, #0
	b	.L183
	b	.L182

.L183:
	ldr	r8, [fp, #-40]
	movw	r10, #:lower16:array
	movt	r10, #:upper16:array
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =-1
	cmp	r8, r7
	bne	.L221
	ldr	r10, =1
	cmp	r10, #0
	b	.L184

.L221:
	ldr	r10, =0
	cmp	r10, #0
	b	.L184

.L184:

.L182:
	beq	.L180
	b	.L179

.L180:
	ldr	r8, =0
	mov	r0, r8
	bl	findfa
	mov	r8, r0
	ldr	r7, [fp, #-40]
	mov	r0, r7
	bl	findfa
	mov	r7, r0
	cmp	r8, r7

.L181:

.L179:
	beq	.L177
	b	.L178

.L177:
	ldr	r9, =1
	str	r9, [fp, #-36]
	ldr	r9, [fp, #-32]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-48]
	ldr	r9, [fp, #-48]
	mov	r0, r9
	bl	putint
	ldr	r9, =10
	mov	r0, r9
	bl	putch

.L178:

.L80:
	ldr	r9, [fp, #-32]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-32]
	b	.L67

.L69:
	ldr	r9, [fp, #-36]
	cmp	r9, #0
	beq	.L206
	b	.L207

.L206:
	ldr	r9, =-1
	mov	r0, r9
	bl	putint
	ldr	r9, =10
	mov	r0, r9
	bl	putch

.L207:
	b	.L46

.L48:
	ldr	r9, =0
	mov	r0, r9
	b	.L42

.L42:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
