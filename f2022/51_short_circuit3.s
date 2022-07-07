	.global	a
	.data
	.align	2
	.type	a, %object
	.size	a, 4
a:
	.word	0

	.global	b
	.data
	.align	2
	.type	b, %object
	.size	b, 4
b:
	.word	0

	.global	d
	.data
	.align	2
	.type	d, %object
	.size	d, 4
d:
	.word	0


	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	set_a
	.type	set_a, %function
set_a:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #32
	str	r0, [fp, #-16]
	ldr	r9, [fp, #-16]
	movw	r10, #:lower16:a
	movt	r10, #:upper16:a
	str	r9, [r10, #0]
	movw	r9, #:lower16:a
	movt	r9, #:upper16:a
	ldr	r9, [r9, #0]
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	set_a, .-set_a

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	set_b
	.type	set_b, %function
set_b:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-16]
	ldr	r9, [fp, #-16]
	movw	r10, #:lower16:b
	movt	r10, #:upper16:b
	str	r9, [r10, #0]
	movw	r9, #:lower16:b
	movt	r9, #:upper16:b
	ldr	r9, [r9, #0]
	mov	r0, r9
	b	.L5

.L5:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	set_b, .-set_b

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	set_d
	.type	set_d, %function
set_d:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-16]
	ldr	r9, [fp, #-16]
	movw	r10, #:lower16:d
	movt	r10, #:upper16:d
	str	r9, [r10, #0]
	movw	r9, #:lower16:d
	movt	r9, #:upper16:d
	ldr	r9, [r9, #0]
	mov	r0, r9
	b	.L9

.L9:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	set_d, .-set_d

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #60
	ldr	r9, =2
	movw	r10, #:lower16:a
	movt	r10, #:upper16:a
	str	r9, [r10, #0]
	ldr	r9, =3
	movw	r10, #:lower16:b
	movt	r10, #:upper16:b
	str	r9, [r10, #0]
	ldr	r9, =0
	mov	r0, r9
	bl	set_a
	mov	r9, r0
	cmp	r9, #0
	bne	.L182
	ldr	r10, =1
	cmp	r10, #0
	b	.L22

.L182:
	ldr	r10, =0
	cmp	r10, #0
	b	.L23
	b	.L22

.L23:
	ldr	r7, =1
	mov	r0, r7
	bl	set_b
	mov	r8, r0
	cmp	r8, #0
	bne	.L183
	ldr	r10, =1
	cmp	r10, #0
	b	.L24

.L183:
	ldr	r10, =0
	cmp	r10, #0
	b	.L24

.L24:

.L22:
	beq	.L20
	b	.L21

.L20:

.L21:
	movw	r9, #:lower16:a
	movt	r9, #:upper16:a
	ldr	r9, [r9, #0]
	mov	r0, r9
	bl	putint
	ldr	r9, =32
	mov	r0, r9
	bl	putch
	movw	r9, #:lower16:b
	movt	r9, #:upper16:b
	ldr	r9, [r9, #0]
	mov	r0, r9
	bl	putint
	ldr	r9, =32
	mov	r0, r9
	bl	putch
	ldr	r9, =2
	movw	r10, #:lower16:a
	movt	r10, #:upper16:a
	str	r9, [r10, #0]
	ldr	r9, =3
	movw	r10, #:lower16:b
	movt	r10, #:upper16:b
	str	r9, [r10, #0]
	ldr	r9, =0
	mov	r0, r9
	bl	set_a
	mov	r9, r0
	cmp	r9, #0
	bne	.L184
	ldr	r10, =1
	cmp	r10, #0
	b	.L33

.L184:
	ldr	r10, =0
	cmp	r10, #0
	b	.L34
	b	.L33

.L34:
	ldr	r7, =1
	mov	r0, r7
	bl	set_b
	mov	r8, r0
	cmp	r8, #0
	bne	.L185
	ldr	r10, =1
	cmp	r10, #0
	b	.L35

.L185:
	ldr	r10, =0
	cmp	r10, #0
	b	.L35

.L35:

.L33:
	beq	.L31
	b	.L32

.L31:

.L32:
	movw	r9, #:lower16:a
	movt	r9, #:upper16:a
	ldr	r9, [r9, #0]
	mov	r0, r9
	bl	putint
	ldr	r9, =32
	mov	r0, r9
	bl	putch
	movw	r9, #:lower16:b
	movt	r9, #:upper16:b
	ldr	r9, [r9, #0]
	mov	r0, r9
	bl	putint
	ldr	r9, =10
	mov	r0, r9
	bl	putch
	ldr	r9, =2
	movw	r10, #:lower16:d
	movt	r10, #:upper16:d
	str	r9, [r10, #0]
	ldr	r9, =1
	cmp	r9, #0
	bne	.L186
	ldr	r10, =1
	cmp	r10, #0
	b	.L41

.L186:
	ldr	r10, =0
	cmp	r10, #0
	b	.L42
	b	.L41

.L42:
	ldr	r7, =3
	mov	r0, r7
	bl	set_d
	mov	r8, r0
	cmp	r8, #0
	bne	.L187
	ldr	r10, =1
	cmp	r10, #0
	b	.L43

.L187:
	ldr	r10, =0
	cmp	r10, #0
	b	.L43

.L43:

.L41:
	beq	.L39
	b	.L40

.L39:

.L40:
	movw	r9, #:lower16:d
	movt	r9, #:upper16:d
	ldr	r9, [r9, #0]
	mov	r0, r9
	bl	putint
	ldr	r8, =32
	mov	r0, r8
	bl	putch
	ldr	r8, =1
	cmp	r8, #0
	bne	.L188
	ldr	r10, =1
	cmp	r10, #0
	b	.L50

.L188:
	ldr	r10, =0
	cmp	r10, #0
	b	.L49
	b	.L50

.L50:
	ldr	r6, =4
	mov	r0, r6
	bl	set_d
	mov	r7, r0
	cmp	r7, #0
	bne	.L189
	ldr	r10, =1
	cmp	r10, #0
	b	.L51

.L189:
	ldr	r10, =0
	cmp	r10, #0
	b	.L51

.L51:

.L49:
	beq	.L47
	b	.L48

.L47:

.L48:
	mov	r0, r9
	bl	putint
	ldr	r9, =10
	mov	r0, r9
	bl	putch
	ldr	r9, =1
	cmp	r9, #0
	bne	.L190
	ldr	r10, =1
	cmp	r10, #0
	b	.L56

.L190:
	ldr	r10, =0
	cmp	r10, #0
	b	.L55
	b	.L56

.L55:
	ldr	r9, =65
	mov	r0, r9
	bl	putch

.L56:
	ldr	r9, =0
	cmp	r9, #0
	bne	.L191
	ldr	r10, =1
	cmp	r10, #0
	b	.L67

.L191:
	ldr	r10, =0
	cmp	r10, #0
	b	.L66
	b	.L67

.L66:
	ldr	r9, =66
	mov	r0, r9
	bl	putch

.L67:
	ldr	r9, =0
	cmp	r9, #0
	bne	.L192
	ldr	r10, =1
	cmp	r10, #0
	b	.L81

.L192:
	ldr	r10, =0
	cmp	r10, #0
	b	.L80
	b	.L81

.L80:
	ldr	r9, =67
	mov	r0, r9
	bl	putch

.L81:
	ldr	r9, =1
	cmp	r9, #0
	bne	.L193
	ldr	r10, =1
	cmp	r10, #0
	b	.L92

.L193:
	ldr	r10, =0
	cmp	r10, #0
	b	.L91
	b	.L92

.L91:
	ldr	r9, =68
	mov	r0, r9
	bl	putch

.L92:
	ldr	r9, =0
	cmp	r9, #0
	bne	.L194
	ldr	r10, =1
	cmp	r10, #0
	b	.L100

.L194:
	ldr	r10, =0
	cmp	r10, #0
	b	.L99
	b	.L100

.L99:
	ldr	r9, =69
	mov	r0, r9
	bl	putch

.L100:
	ldr	r9, =1
	cmp	r9, #0
	bne	.L195
	ldr	r10, =1
	cmp	r10, #0
	b	.L108

.L195:
	ldr	r10, =0
	cmp	r10, #0
	b	.L107
	b	.L108

.L107:
	ldr	r9, =70
	mov	r0, r9
	bl	putch

.L108:
	ldr	r9, =10
	mov	r0, r9
	bl	putch
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, =1
	str	r9, [fp, #-24]
	ldr	r9, =2
	str	r9, [fp, #-28]
	ldr	r9, =3
	str	r9, [fp, #-32]
	ldr	r9, =4
	str	r9, [fp, #-36]

.L115:
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-24]
	cmp	r9, #0
	bne	.L196
	ldr	r10, =1
	cmp	r10, #0
	b	.L118

.L196:
	ldr	r10, =0
	cmp	r10, #0
	b	.L119
	b	.L118

.L119:
	cmp	r8, #0
	bne	.L197
	ldr	r10, =1
	cmp	r10, #0
	b	.L120

.L197:
	ldr	r10, =0
	cmp	r10, #0
	b	.L120

.L120:

.L118:
	beq	.L116
	b	.L117

.L116:
	ldr	r9, =32
	mov	r0, r9
	bl	putch
	b	.L115

.L117:
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-24]
	cmp	r9, #0
	bne	.L198
	ldr	r10, =1
	cmp	r10, #0
	b	.L124

.L198:
	ldr	r10, =0
	cmp	r10, #0
	b	.L123
	b	.L124

.L124:
	cmp	r8, #0
	bne	.L199
	ldr	r10, =1
	cmp	r10, #0
	b	.L125

.L199:
	ldr	r10, =0
	cmp	r10, #0
	b	.L125

.L125:

.L123:
	beq	.L121
	b	.L122

.L121:
	ldr	r9, =67
	mov	r0, r9
	bl	putch

.L122:
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-24]
	cmp	r9, r8
	bge	.L200
	ldr	r10, =1
	cmp	r10, #0
	b	.L129

.L200:
	ldr	r10, =0
	cmp	r10, #0
	b	.L128
	b	.L129

.L129:
	cmp	r8, r9
	ble	.L201
	ldr	r10, =1
	cmp	r10, #0
	b	.L130

.L201:
	ldr	r10, =0
	cmp	r10, #0
	b	.L130

.L130:

.L128:
	beq	.L126
	b	.L127

.L126:
	ldr	r9, =72
	mov	r0, r9
	bl	putch

.L127:
	ldr	r9, [fp, #-28]
	ldr	r8, [fp, #-24]
	cmp	r9, r8
	bge	.L202
	ldr	r10, =1
	cmp	r10, #0
	b	.L139

.L202:
	ldr	r10, =0
	cmp	r10, #0
	b	.L140
	b	.L139

.L140:
	ldr	r8, [fp, #-36]
	ldr	r7, [fp, #-32]
	cmp	r8, r7
	bne	.L203
	ldr	r10, =1
	cmp	r10, #0
	b	.L141

.L203:
	ldr	r10, =0
	cmp	r10, #0
	b	.L141

.L141:

.L139:
	beq	.L137
	b	.L138

.L137:
	ldr	r9, =73
	mov	r0, r9
	bl	putch

.L138:
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-24]
	cmp	r8, #0
	movne	r8, #0
	moveq	r8, #1
	cmp	r9, r8
	beq	.L154
	b	.L153

.L154:
	ldr	r8, [fp, #-32]
	cmp	r8, r8
	blt	.L204
	ldr	r10, =1
	cmp	r10, #0
	b	.L155

.L204:
	ldr	r10, =0
	cmp	r10, #0
	b	.L155

.L155:

.L153:
	beq	.L150
	b	.L151

.L151:
	ldr	r8, [fp, #-36]
	cmp	r8, r8
	bge	.L205
	ldr	r10, =1
	cmp	r10, #0
	b	.L152

.L205:
	ldr	r10, =0
	cmp	r10, #0
	b	.L152

.L152:

.L150:
	beq	.L148
	b	.L149

.L148:
	ldr	r9, =74
	mov	r0, r9
	bl	putch

.L149:
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-24]
	cmp	r8, #0
	movne	r8, #0
	moveq	r8, #1
	cmp	r9, r8
	beq	.L167
	b	.L168

.L168:
	ldr	r8, [fp, #-32]
	cmp	r8, r8
	blt	.L206
	ldr	r10, =1
	cmp	r10, #0
	b	.L173

.L206:
	ldr	r10, =0
	cmp	r10, #0
	b	.L174
	b	.L173

.L174:
	ldr	r8, [fp, #-36]
	cmp	r8, r8
	bge	.L207
	ldr	r10, =1
	cmp	r10, #0
	b	.L175

.L207:
	ldr	r10, =0
	cmp	r10, #0
	b	.L175

.L175:

.L173:

.L169:

.L167:
	beq	.L165
	b	.L166

.L165:
	ldr	r9, =75
	mov	r0, r9
	bl	putch

.L166:
	ldr	r9, =10
	mov	r0, r9
	bl	putch
	ldr	r9, =0
	mov	r0, r9
	b	.L13

.L13:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
