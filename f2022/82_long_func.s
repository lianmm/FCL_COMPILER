	.global	SHIFT_TABL
	.data
	.align	2
	.type	SHIFT_TABL, %object
	.size	SHIFT_TABL, 64
SHIFT_TABL:
	.word	1
	.word	2
	.word	4
	.word	8
	.word	16
	.word	32
	.word	64
	.word	128
	.word	256
	.word	512
	.word	1024
	.word	2048
	.word	4096
	.word	8192
	.word	16384
	.word	32768

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	long_func
	.type	long_func, %function
long_func:
	@ args = 0, pretend = 0, frame = 380
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #384
	ldr	r9, =2
	str	r9, [fp, #-36]
	ldr	r9, =0
	str	r9, [fp, #-40]
	ldr	r9, =1
	str	r9, [fp, #-44]

.L2:
	ldr	r9, [fp, #-40]
	ldr	r8, =0
	cmp	r9, r8
	bgt	.L5158
	ldr	r10, =1
	cmp	r10, #0
	b	.L4

.L5158:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3
	b	.L4

.L3:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-40]
	str	r9, [fp, #-24]
	ldr	r9, =1
	str	r9, [fp, #-28]

.L20:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5159
	ldr	r10, =1
	cmp	r10, #0
	b	.L22

.L5159:
	ldr	r10, =0
	cmp	r10, #0
	b	.L21
	b	.L22

.L21:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5160
	ldr	r10, =1
	cmp	r10, #0
	b	.L28

.L5160:
	ldr	r10, =0
	cmp	r10, #0
	b	.L29
	b	.L28

.L29:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5161
	ldr	r10, =1
	cmp	r10, #0
	b	.L30

.L5161:
	ldr	r10, =0
	cmp	r10, #0
	b	.L30

.L30:

.L28:
	beq	.L26
	b	.L27

.L26:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L27:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L20

.L22:
	ldr	r9, [fp, #-16]
	cmp	r9, #0
	bne	.L5162
	ldr	r10, =1
	cmp	r10, #0
	b	.L65

.L5162:
	ldr	r10, =0
	cmp	r10, #0
	b	.L64
	b	.L65

.L64:
	ldr	r9, [fp, #-44]
	str	r9, [fp, #-48]
	ldr	r9, [fp, #-36]
	str	r9, [fp, #-52]
	ldr	r9, =0
	str	r9, [fp, #-56]

.L66:
	ldr	r9, [fp, #-52]
	cmp	r9, #0
	bne	.L5163
	ldr	r10, =1
	cmp	r10, #0
	b	.L68

.L5163:
	ldr	r10, =0
	cmp	r10, #0
	b	.L67
	b	.L68

.L67:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-52]
	str	r9, [fp, #-24]
	ldr	r9, =1
	str	r9, [fp, #-28]

.L81:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5164
	ldr	r10, =1
	cmp	r10, #0
	b	.L83

.L5164:
	ldr	r10, =0
	cmp	r10, #0
	b	.L82
	b	.L83

.L82:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5165
	ldr	r10, =1
	cmp	r10, #0
	b	.L89

.L5165:
	ldr	r10, =0
	cmp	r10, #0
	b	.L90
	b	.L89

.L90:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5166
	ldr	r10, =1
	cmp	r10, #0
	b	.L91

.L5166:
	ldr	r10, =0
	cmp	r10, #0
	b	.L91

.L91:

.L89:
	beq	.L87
	b	.L88

.L87:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L88:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L81

.L83:
	ldr	r9, [fp, #-16]
	cmp	r9, #0
	bne	.L5167
	ldr	r10, =1
	cmp	r10, #0
	b	.L126

.L5167:
	ldr	r10, =0
	cmp	r10, #0
	b	.L125
	b	.L126

.L125:
	ldr	r9, [fp, #-56]
	str	r9, [fp, #-60]
	ldr	r9, [fp, #-48]
	str	r9, [fp, #-64]

.L127:
	ldr	r9, [fp, #-64]
	cmp	r9, #0
	bne	.L5168
	ldr	r10, =1
	cmp	r10, #0
	b	.L129

.L5168:
	ldr	r10, =0
	cmp	r10, #0
	b	.L128
	b	.L129

.L128:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L142:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5169
	ldr	r10, =1
	cmp	r10, #0
	b	.L144

.L5169:
	ldr	r10, =0
	cmp	r10, #0
	b	.L143
	b	.L144

.L143:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5170
	ldr	r10, =1
	cmp	r10, #0
	b	.L149

.L5170:
	ldr	r10, =0
	cmp	r10, #0
	b	.L148
	b	.L149

.L148:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	ldr	r8, =0
	cmp	r9, r8
	beq	.L154
	b	.L155

.L154:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L155:
	b	.L150

.L149:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5171
	ldr	r10, =1
	cmp	r10, #0
	b	.L172

.L5171:
	ldr	r10, =0
	cmp	r10, #0
	b	.L171
	b	.L172

.L171:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L172:

.L150:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L142

.L144:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-68]
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L218:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5172
	ldr	r10, =1
	cmp	r10, #0
	b	.L220

.L5172:
	ldr	r10, =0
	cmp	r10, #0
	b	.L219
	b	.L220

.L219:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5173
	ldr	r10, =1
	cmp	r10, #0
	b	.L226

.L5173:
	ldr	r10, =0
	cmp	r10, #0
	b	.L227
	b	.L226

.L227:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5174
	ldr	r10, =1
	cmp	r10, #0
	b	.L228

.L5174:
	ldr	r10, =0
	cmp	r10, #0
	b	.L228

.L228:

.L226:
	beq	.L224
	b	.L225

.L224:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L225:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L218

.L220:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r8, =0
	cmp	r8, #1
	beq	.L265
	b	.L266

.L265:
	ldr	r9, =0
	str	r9, [fp, #-16]
	b	.L267

.L266:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-64]
	ldr	r8, =1
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mul	r9, r8, r9
	str	r9, [fp, #-24]
	ldr	r9, =65535
	str	r9, [fp, #-28]

.L289:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5175
	ldr	r10, =1
	cmp	r10, #0
	b	.L291

.L5175:
	ldr	r10, =0
	cmp	r10, #0
	b	.L290
	b	.L291

.L290:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5176
	ldr	r10, =1
	cmp	r10, #0
	b	.L297

.L5176:
	ldr	r10, =0
	cmp	r10, #0
	b	.L298
	b	.L297

.L298:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5177
	ldr	r10, =1
	cmp	r10, #0
	b	.L299

.L5177:
	ldr	r10, =0
	cmp	r10, #0
	b	.L299

.L299:

.L297:
	beq	.L295
	b	.L296

.L295:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L296:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L289

.L291:

.L267:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r9, [fp, #-68]
	str	r9, [fp, #-60]
	b	.L127

.L129:
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-56]

.L126:
	ldr	r9, [fp, #-48]
	str	r9, [fp, #-60]
	ldr	r9, [fp, #-48]
	str	r9, [fp, #-64]

.L345:
	ldr	r9, [fp, #-64]
	cmp	r9, #0
	bne	.L5178
	ldr	r10, =1
	cmp	r10, #0
	b	.L347

.L5178:
	ldr	r10, =0
	cmp	r10, #0
	b	.L346
	b	.L347

.L346:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L360:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5179
	ldr	r10, =1
	cmp	r10, #0
	b	.L362

.L5179:
	ldr	r10, =0
	cmp	r10, #0
	b	.L361
	b	.L362

.L361:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5180
	ldr	r10, =1
	cmp	r10, #0
	b	.L367

.L5180:
	ldr	r10, =0
	cmp	r10, #0
	b	.L366
	b	.L367

.L366:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	ldr	r8, =0
	cmp	r9, r8
	beq	.L372
	b	.L373

.L372:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L373:
	b	.L368

.L367:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5181
	ldr	r10, =1
	cmp	r10, #0
	b	.L390

.L5181:
	ldr	r10, =0
	cmp	r10, #0
	b	.L389
	b	.L390

.L389:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L390:

.L368:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L360

.L362:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-68]
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L436:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5182
	ldr	r10, =1
	cmp	r10, #0
	b	.L438

.L5182:
	ldr	r10, =0
	cmp	r10, #0
	b	.L437
	b	.L438

.L437:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5183
	ldr	r10, =1
	cmp	r10, #0
	b	.L444

.L5183:
	ldr	r10, =0
	cmp	r10, #0
	b	.L445
	b	.L444

.L445:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5184
	ldr	r10, =1
	cmp	r10, #0
	b	.L446

.L5184:
	ldr	r10, =0
	cmp	r10, #0
	b	.L446

.L446:

.L444:
	beq	.L442
	b	.L443

.L442:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L443:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L436

.L438:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r8, =0
	cmp	r8, #1
	beq	.L483
	b	.L484

.L483:
	ldr	r9, =0
	str	r9, [fp, #-16]
	b	.L485

.L484:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-64]
	ldr	r8, =1
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mul	r9, r8, r9
	str	r9, [fp, #-24]
	ldr	r9, =65535
	str	r9, [fp, #-28]

.L507:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5185
	ldr	r10, =1
	cmp	r10, #0
	b	.L509

.L5185:
	ldr	r10, =0
	cmp	r10, #0
	b	.L508
	b	.L509

.L508:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5186
	ldr	r10, =1
	cmp	r10, #0
	b	.L515

.L5186:
	ldr	r10, =0
	cmp	r10, #0
	b	.L516
	b	.L515

.L516:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5187
	ldr	r10, =1
	cmp	r10, #0
	b	.L517

.L5187:
	ldr	r10, =0
	cmp	r10, #0
	b	.L517

.L517:

.L515:
	beq	.L513
	b	.L514

.L513:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L514:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L507

.L509:

.L485:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r9, [fp, #-68]
	str	r9, [fp, #-60]
	b	.L345

.L347:
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-48]
	ldr	r9, [fp, #-52]
	str	r9, [fp, #-24]
	ldr	r9, =1
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-28]
	ldr	r8, =15
	cmp	r9, r8
	bge	.L5188
	ldr	r10, =1
	cmp	r10, #0
	b	.L570

.L5188:
	ldr	r10, =0
	cmp	r10, #0
	b	.L569
	b	.L570

.L569:
	ldr	r9, [fp, #-24]
	ldr	r8, =0
	cmp	r9, r8
	blt	.L5189
	ldr	r10, =1
	cmp	r10, #0
	b	.L576

.L5189:
	ldr	r10, =0
	cmp	r10, #0
	b	.L575
	b	.L576

.L575:
	ldr	r9, =65535
	str	r9, [fp, #-16]
	b	.L577

.L576:
	ldr	r9, =0
	str	r9, [fp, #-16]

.L577:
	b	.L571

.L570:
	ldr	r9, [fp, #-28]
	ldr	r8, =0
	cmp	r9, r8
	bgt	.L5190
	ldr	r10, =1
	cmp	r10, #0
	b	.L588

.L5190:
	ldr	r10, =0
	cmp	r10, #0
	b	.L587
	b	.L588

.L587:
	ldr	r9, [fp, #-24]
	ldr	r8, =32767
	cmp	r9, r8
	bgt	.L5191
	ldr	r10, =1
	cmp	r10, #0
	b	.L594

.L5191:
	ldr	r10, =0
	cmp	r10, #0
	b	.L593
	b	.L594

.L593:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-24]
	ldr	r8, =65536
	add	r9, r8, r9
	ldr	r8, =15
	ldr	r7, [fp, #-28]
	sub	r8, r8, r7
	ldr	r7, =1
	add	r8, r7, r8
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	sub	r9, r9, r8
	str	r9, [fp, #-16]
	b	.L595

.L594:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-16]

.L595:
	b	.L589

.L588:
	ldr	r9, [fp, #-24]
	str	r9, [fp, #-16]

.L589:

.L571:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-52]
	b	.L66

.L68:
	ldr	r9, [fp, #-56]
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-44]

.L65:
	ldr	r9, [fp, #-36]
	str	r9, [fp, #-48]
	ldr	r9, [fp, #-36]
	str	r9, [fp, #-52]
	ldr	r9, =0
	str	r9, [fp, #-56]

.L638:
	ldr	r9, [fp, #-52]
	cmp	r9, #0
	bne	.L5192
	ldr	r10, =1
	cmp	r10, #0
	b	.L640

.L5192:
	ldr	r10, =0
	cmp	r10, #0
	b	.L639
	b	.L640

.L639:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-52]
	str	r9, [fp, #-24]
	ldr	r9, =1
	str	r9, [fp, #-28]

.L653:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5193
	ldr	r10, =1
	cmp	r10, #0
	b	.L655

.L5193:
	ldr	r10, =0
	cmp	r10, #0
	b	.L654
	b	.L655

.L654:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5194
	ldr	r10, =1
	cmp	r10, #0
	b	.L661

.L5194:
	ldr	r10, =0
	cmp	r10, #0
	b	.L662
	b	.L661

.L662:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5195
	ldr	r10, =1
	cmp	r10, #0
	b	.L663

.L5195:
	ldr	r10, =0
	cmp	r10, #0
	b	.L663

.L663:

.L661:
	beq	.L659
	b	.L660

.L659:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L660:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L653

.L655:
	ldr	r9, [fp, #-16]
	cmp	r9, #0
	bne	.L5196
	ldr	r10, =1
	cmp	r10, #0
	b	.L698

.L5196:
	ldr	r10, =0
	cmp	r10, #0
	b	.L697
	b	.L698

.L697:
	ldr	r9, [fp, #-56]
	str	r9, [fp, #-60]
	ldr	r9, [fp, #-48]
	str	r9, [fp, #-64]

.L699:
	ldr	r9, [fp, #-64]
	cmp	r9, #0
	bne	.L5197
	ldr	r10, =1
	cmp	r10, #0
	b	.L701

.L5197:
	ldr	r10, =0
	cmp	r10, #0
	b	.L700
	b	.L701

.L700:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L714:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5198
	ldr	r10, =1
	cmp	r10, #0
	b	.L716

.L5198:
	ldr	r10, =0
	cmp	r10, #0
	b	.L715
	b	.L716

.L715:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5199
	ldr	r10, =1
	cmp	r10, #0
	b	.L721

.L5199:
	ldr	r10, =0
	cmp	r10, #0
	b	.L720
	b	.L721

.L720:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	ldr	r8, =0
	cmp	r9, r8
	beq	.L726
	b	.L727

.L726:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L727:
	b	.L722

.L721:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5200
	ldr	r10, =1
	cmp	r10, #0
	b	.L744

.L5200:
	ldr	r10, =0
	cmp	r10, #0
	b	.L743
	b	.L744

.L743:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L744:

.L722:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L714

.L716:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-68]
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L790:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5201
	ldr	r10, =1
	cmp	r10, #0
	b	.L792

.L5201:
	ldr	r10, =0
	cmp	r10, #0
	b	.L791
	b	.L792

.L791:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5202
	ldr	r10, =1
	cmp	r10, #0
	b	.L798

.L5202:
	ldr	r10, =0
	cmp	r10, #0
	b	.L799
	b	.L798

.L799:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5203
	ldr	r10, =1
	cmp	r10, #0
	b	.L800

.L5203:
	ldr	r10, =0
	cmp	r10, #0
	b	.L800

.L800:

.L798:
	beq	.L796
	b	.L797

.L796:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L797:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L790

.L792:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r8, =0
	cmp	r8, #1
	beq	.L837
	b	.L838

.L837:
	ldr	r9, =0
	str	r9, [fp, #-16]
	b	.L839

.L838:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-64]
	ldr	r8, =1
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mul	r9, r8, r9
	str	r9, [fp, #-24]
	ldr	r9, =65535
	str	r9, [fp, #-28]

.L861:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5204
	ldr	r10, =1
	cmp	r10, #0
	b	.L863

.L5204:
	ldr	r10, =0
	cmp	r10, #0
	b	.L862
	b	.L863

.L862:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5205
	ldr	r10, =1
	cmp	r10, #0
	b	.L869

.L5205:
	ldr	r10, =0
	cmp	r10, #0
	b	.L870
	b	.L869

.L870:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5206
	ldr	r10, =1
	cmp	r10, #0
	b	.L871

.L5206:
	ldr	r10, =0
	cmp	r10, #0
	b	.L871

.L871:

.L869:
	beq	.L867
	b	.L868

.L867:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L868:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L861

.L863:

.L839:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r9, [fp, #-68]
	str	r9, [fp, #-60]
	b	.L699

.L701:
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-56]

.L698:
	ldr	r9, [fp, #-48]
	str	r9, [fp, #-60]
	ldr	r9, [fp, #-48]
	str	r9, [fp, #-64]

.L917:
	ldr	r9, [fp, #-64]
	cmp	r9, #0
	bne	.L5207
	ldr	r10, =1
	cmp	r10, #0
	b	.L919

.L5207:
	ldr	r10, =0
	cmp	r10, #0
	b	.L918
	b	.L919

.L918:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L932:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5208
	ldr	r10, =1
	cmp	r10, #0
	b	.L934

.L5208:
	ldr	r10, =0
	cmp	r10, #0
	b	.L933
	b	.L934

.L933:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5209
	ldr	r10, =1
	cmp	r10, #0
	b	.L939

.L5209:
	ldr	r10, =0
	cmp	r10, #0
	b	.L938
	b	.L939

.L938:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	ldr	r8, =0
	cmp	r9, r8
	beq	.L944
	b	.L945

.L944:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L945:
	b	.L940

.L939:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5210
	ldr	r10, =1
	cmp	r10, #0
	b	.L962

.L5210:
	ldr	r10, =0
	cmp	r10, #0
	b	.L961
	b	.L962

.L961:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L962:

.L940:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L932

.L934:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-68]
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L1008:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5211
	ldr	r10, =1
	cmp	r10, #0
	b	.L1010

.L5211:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1009
	b	.L1010

.L1009:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5212
	ldr	r10, =1
	cmp	r10, #0
	b	.L1016

.L5212:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1017
	b	.L1016

.L1017:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5213
	ldr	r10, =1
	cmp	r10, #0
	b	.L1018

.L5213:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1018

.L1018:

.L1016:
	beq	.L1014
	b	.L1015

.L1014:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L1015:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L1008

.L1010:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r8, =0
	cmp	r8, #1
	beq	.L1055
	b	.L1056

.L1055:
	ldr	r9, =0
	str	r9, [fp, #-16]
	b	.L1057

.L1056:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-64]
	ldr	r8, =1
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mul	r9, r8, r9
	str	r9, [fp, #-24]
	ldr	r9, =65535
	str	r9, [fp, #-28]

.L1079:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5214
	ldr	r10, =1
	cmp	r10, #0
	b	.L1081

.L5214:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1080
	b	.L1081

.L1080:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5215
	ldr	r10, =1
	cmp	r10, #0
	b	.L1087

.L5215:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1088
	b	.L1087

.L1088:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5216
	ldr	r10, =1
	cmp	r10, #0
	b	.L1089

.L5216:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1089

.L1089:

.L1087:
	beq	.L1085
	b	.L1086

.L1085:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L1086:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L1079

.L1081:

.L1057:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r9, [fp, #-68]
	str	r9, [fp, #-60]
	b	.L917

.L919:
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-48]
	ldr	r9, [fp, #-52]
	str	r9, [fp, #-24]
	ldr	r9, =1
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-28]
	ldr	r8, =15
	cmp	r9, r8
	bge	.L5217
	ldr	r10, =1
	cmp	r10, #0
	b	.L1142

.L5217:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1141
	b	.L1142

.L1141:
	ldr	r9, [fp, #-24]
	ldr	r8, =0
	cmp	r9, r8
	blt	.L5218
	ldr	r10, =1
	cmp	r10, #0
	b	.L1148

.L5218:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1147
	b	.L1148

.L1147:
	ldr	r9, =65535
	str	r9, [fp, #-16]
	b	.L1149

.L1148:
	ldr	r9, =0
	str	r9, [fp, #-16]

.L1149:
	b	.L1143

.L1142:
	ldr	r9, [fp, #-28]
	ldr	r8, =0
	cmp	r9, r8
	bgt	.L5219
	ldr	r10, =1
	cmp	r10, #0
	b	.L1160

.L5219:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1159
	b	.L1160

.L1159:
	ldr	r9, [fp, #-24]
	ldr	r8, =32767
	cmp	r9, r8
	bgt	.L5220
	ldr	r10, =1
	cmp	r10, #0
	b	.L1166

.L5220:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1165
	b	.L1166

.L1165:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-24]
	ldr	r8, =65536
	add	r9, r8, r9
	ldr	r8, =15
	ldr	r7, [fp, #-28]
	sub	r8, r8, r7
	ldr	r7, =1
	add	r8, r7, r8
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	sub	r9, r9, r8
	str	r9, [fp, #-16]
	b	.L1167

.L1166:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-16]

.L1167:
	b	.L1161

.L1160:
	ldr	r9, [fp, #-24]
	str	r9, [fp, #-16]

.L1161:

.L1143:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-52]
	b	.L638

.L640:
	ldr	r9, [fp, #-56]
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-36]
	ldr	r9, [fp, #-40]
	str	r9, [fp, #-24]
	ldr	r9, =1
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-28]
	ldr	r8, =15
	cmp	r9, r8
	bge	.L5221
	ldr	r10, =1
	cmp	r10, #0
	b	.L1217

.L5221:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1216
	b	.L1217

.L1216:
	ldr	r9, [fp, #-24]
	ldr	r8, =0
	cmp	r9, r8
	blt	.L5222
	ldr	r10, =1
	cmp	r10, #0
	b	.L1223

.L5222:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1222
	b	.L1223

.L1222:
	ldr	r9, =65535
	str	r9, [fp, #-16]
	b	.L1224

.L1223:
	ldr	r9, =0
	str	r9, [fp, #-16]

.L1224:
	b	.L1218

.L1217:
	ldr	r9, [fp, #-28]
	ldr	r8, =0
	cmp	r9, r8
	bgt	.L5223
	ldr	r10, =1
	cmp	r10, #0
	b	.L1235

.L5223:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1234
	b	.L1235

.L1234:
	ldr	r9, [fp, #-24]
	ldr	r8, =32767
	cmp	r9, r8
	bgt	.L5224
	ldr	r10, =1
	cmp	r10, #0
	b	.L1241

.L5224:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1240
	b	.L1241

.L1240:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-24]
	ldr	r8, =65536
	add	r9, r8, r9
	ldr	r8, =15
	ldr	r7, [fp, #-28]
	sub	r8, r8, r7
	ldr	r7, =1
	add	r8, r7, r8
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	sub	r9, r9, r8
	str	r9, [fp, #-16]
	b	.L1242

.L1241:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-16]

.L1242:
	b	.L1236

.L1235:
	ldr	r9, [fp, #-24]
	str	r9, [fp, #-16]

.L1236:

.L1218:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-40]
	b	.L2

.L4:
	ldr	r9, [fp, #-44]
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	mov	r0, r9
	bl	putint
	ldr	r9, =10
	mov	r0, r9
	bl	putch
	ldr	r9, =2
	str	r9, [fp, #-36]
	ldr	r9, =1
	str	r9, [fp, #-40]
	ldr	r9, =1
	str	r9, [fp, #-44]

.L1282:
	ldr	r9, [fp, #-40]
	ldr	r8, =0
	cmp	r9, r8
	bgt	.L5225
	ldr	r10, =1
	cmp	r10, #0
	b	.L1284

.L5225:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1283
	b	.L1284

.L1283:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-40]
	str	r9, [fp, #-24]
	ldr	r9, =1
	str	r9, [fp, #-28]

.L1300:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5226
	ldr	r10, =1
	cmp	r10, #0
	b	.L1302

.L5226:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1301
	b	.L1302

.L1301:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5227
	ldr	r10, =1
	cmp	r10, #0
	b	.L1308

.L5227:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1309
	b	.L1308

.L1309:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5228
	ldr	r10, =1
	cmp	r10, #0
	b	.L1310

.L5228:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1310

.L1310:

.L1308:
	beq	.L1306
	b	.L1307

.L1306:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L1307:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L1300

.L1302:
	ldr	r9, [fp, #-16]
	cmp	r9, #0
	bne	.L5229
	ldr	r10, =1
	cmp	r10, #0
	b	.L1345

.L5229:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1344
	b	.L1345

.L1344:
	ldr	r9, [fp, #-44]
	str	r9, [fp, #-48]
	ldr	r9, [fp, #-36]
	str	r9, [fp, #-52]
	ldr	r9, =0
	str	r9, [fp, #-56]

.L1346:
	ldr	r9, [fp, #-52]
	cmp	r9, #0
	bne	.L5230
	ldr	r10, =1
	cmp	r10, #0
	b	.L1348

.L5230:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1347
	b	.L1348

.L1347:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-52]
	str	r9, [fp, #-24]
	ldr	r9, =1
	str	r9, [fp, #-28]

.L1361:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5231
	ldr	r10, =1
	cmp	r10, #0
	b	.L1363

.L5231:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1362
	b	.L1363

.L1362:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5232
	ldr	r10, =1
	cmp	r10, #0
	b	.L1369

.L5232:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1370
	b	.L1369

.L1370:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5233
	ldr	r10, =1
	cmp	r10, #0
	b	.L1371

.L5233:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1371

.L1371:

.L1369:
	beq	.L1367
	b	.L1368

.L1367:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L1368:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L1361

.L1363:
	ldr	r9, [fp, #-16]
	cmp	r9, #0
	bne	.L5234
	ldr	r10, =1
	cmp	r10, #0
	b	.L1406

.L5234:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1405
	b	.L1406

.L1405:
	ldr	r9, [fp, #-56]
	str	r9, [fp, #-60]
	ldr	r9, [fp, #-48]
	str	r9, [fp, #-64]

.L1407:
	ldr	r9, [fp, #-64]
	cmp	r9, #0
	bne	.L5235
	ldr	r10, =1
	cmp	r10, #0
	b	.L1409

.L5235:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1408
	b	.L1409

.L1408:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L1422:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5236
	ldr	r10, =1
	cmp	r10, #0
	b	.L1424

.L5236:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1423
	b	.L1424

.L1423:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5237
	ldr	r10, =1
	cmp	r10, #0
	b	.L1429

.L5237:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1428
	b	.L1429

.L1428:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	ldr	r8, =0
	cmp	r9, r8
	beq	.L1434
	b	.L1435

.L1434:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L1435:
	b	.L1430

.L1429:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5238
	ldr	r10, =1
	cmp	r10, #0
	b	.L1452

.L5238:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1451
	b	.L1452

.L1451:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L1452:

.L1430:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L1422

.L1424:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-68]
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L1498:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5239
	ldr	r10, =1
	cmp	r10, #0
	b	.L1500

.L5239:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1499
	b	.L1500

.L1499:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5240
	ldr	r10, =1
	cmp	r10, #0
	b	.L1506

.L5240:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1507
	b	.L1506

.L1507:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5241
	ldr	r10, =1
	cmp	r10, #0
	b	.L1508

.L5241:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1508

.L1508:

.L1506:
	beq	.L1504
	b	.L1505

.L1504:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L1505:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L1498

.L1500:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r8, =0
	cmp	r8, #1
	beq	.L1545
	b	.L1546

.L1545:
	ldr	r9, =0
	str	r9, [fp, #-16]
	b	.L1547

.L1546:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-64]
	ldr	r8, =1
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mul	r9, r8, r9
	str	r9, [fp, #-24]
	ldr	r9, =65535
	str	r9, [fp, #-28]

.L1569:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5242
	ldr	r10, =1
	cmp	r10, #0
	b	.L1571

.L5242:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1570
	b	.L1571

.L1570:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5243
	ldr	r10, =1
	cmp	r10, #0
	b	.L1577

.L5243:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1578
	b	.L1577

.L1578:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5244
	ldr	r10, =1
	cmp	r10, #0
	b	.L1579

.L5244:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1579

.L1579:

.L1577:
	beq	.L1575
	b	.L1576

.L1575:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L1576:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L1569

.L1571:

.L1547:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r9, [fp, #-68]
	str	r9, [fp, #-60]
	b	.L1407

.L1409:
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-56]

.L1406:
	ldr	r9, [fp, #-48]
	str	r9, [fp, #-60]
	ldr	r9, [fp, #-48]
	str	r9, [fp, #-64]

.L1625:
	ldr	r9, [fp, #-64]
	cmp	r9, #0
	bne	.L5245
	ldr	r10, =1
	cmp	r10, #0
	b	.L1627

.L5245:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1626
	b	.L1627

.L1626:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L1640:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5246
	ldr	r10, =1
	cmp	r10, #0
	b	.L1642

.L5246:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1641
	b	.L1642

.L1641:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5247
	ldr	r10, =1
	cmp	r10, #0
	b	.L1647

.L5247:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1646
	b	.L1647

.L1646:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	ldr	r8, =0
	cmp	r9, r8
	beq	.L1652
	b	.L1653

.L1652:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L1653:
	b	.L1648

.L1647:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5248
	ldr	r10, =1
	cmp	r10, #0
	b	.L1670

.L5248:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1669
	b	.L1670

.L1669:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L1670:

.L1648:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L1640

.L1642:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-68]
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L1716:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5249
	ldr	r10, =1
	cmp	r10, #0
	b	.L1718

.L5249:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1717
	b	.L1718

.L1717:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5250
	ldr	r10, =1
	cmp	r10, #0
	b	.L1724

.L5250:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1725
	b	.L1724

.L1725:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5251
	ldr	r10, =1
	cmp	r10, #0
	b	.L1726

.L5251:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1726

.L1726:

.L1724:
	beq	.L1722
	b	.L1723

.L1722:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L1723:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L1716

.L1718:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r8, =0
	cmp	r8, #1
	beq	.L1763
	b	.L1764

.L1763:
	ldr	r9, =0
	str	r9, [fp, #-16]
	b	.L1765

.L1764:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-64]
	ldr	r8, =1
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mul	r9, r8, r9
	str	r9, [fp, #-24]
	ldr	r9, =65535
	str	r9, [fp, #-28]

.L1787:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5252
	ldr	r10, =1
	cmp	r10, #0
	b	.L1789

.L5252:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1788
	b	.L1789

.L1788:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5253
	ldr	r10, =1
	cmp	r10, #0
	b	.L1795

.L5253:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1796
	b	.L1795

.L1796:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5254
	ldr	r10, =1
	cmp	r10, #0
	b	.L1797

.L5254:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1797

.L1797:

.L1795:
	beq	.L1793
	b	.L1794

.L1793:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L1794:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L1787

.L1789:

.L1765:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r9, [fp, #-68]
	str	r9, [fp, #-60]
	b	.L1625

.L1627:
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-48]
	ldr	r9, [fp, #-52]
	str	r9, [fp, #-24]
	ldr	r9, =1
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-28]
	ldr	r8, =15
	cmp	r9, r8
	bge	.L5255
	ldr	r10, =1
	cmp	r10, #0
	b	.L1850

.L5255:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1849
	b	.L1850

.L1849:
	ldr	r9, [fp, #-24]
	ldr	r8, =0
	cmp	r9, r8
	blt	.L5256
	ldr	r10, =1
	cmp	r10, #0
	b	.L1856

.L5256:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1855
	b	.L1856

.L1855:
	ldr	r9, =65535
	str	r9, [fp, #-16]
	b	.L1857

.L1856:
	ldr	r9, =0
	str	r9, [fp, #-16]

.L1857:
	b	.L1851

.L1850:
	ldr	r9, [fp, #-28]
	ldr	r8, =0
	cmp	r9, r8
	bgt	.L5257
	ldr	r10, =1
	cmp	r10, #0
	b	.L1868

.L5257:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1867
	b	.L1868

.L1867:
	ldr	r9, [fp, #-24]
	ldr	r8, =32767
	cmp	r9, r8
	bgt	.L5258
	ldr	r10, =1
	cmp	r10, #0
	b	.L1874

.L5258:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1873
	b	.L1874

.L1873:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-24]
	ldr	r8, =65536
	add	r9, r8, r9
	ldr	r8, =15
	ldr	r7, [fp, #-28]
	sub	r8, r8, r7
	ldr	r7, =1
	add	r8, r7, r8
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	sub	r9, r9, r8
	str	r9, [fp, #-16]
	b	.L1875

.L1874:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-16]

.L1875:
	b	.L1869

.L1868:
	ldr	r9, [fp, #-24]
	str	r9, [fp, #-16]

.L1869:

.L1851:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-52]
	b	.L1346

.L1348:
	ldr	r9, [fp, #-56]
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-44]

.L1345:
	ldr	r9, [fp, #-36]
	str	r9, [fp, #-48]
	ldr	r9, [fp, #-36]
	str	r9, [fp, #-52]
	ldr	r9, =0
	str	r9, [fp, #-56]

.L1918:
	ldr	r9, [fp, #-52]
	cmp	r9, #0
	bne	.L5259
	ldr	r10, =1
	cmp	r10, #0
	b	.L1920

.L5259:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1919
	b	.L1920

.L1919:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-52]
	str	r9, [fp, #-24]
	ldr	r9, =1
	str	r9, [fp, #-28]

.L1933:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5260
	ldr	r10, =1
	cmp	r10, #0
	b	.L1935

.L5260:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1934
	b	.L1935

.L1934:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5261
	ldr	r10, =1
	cmp	r10, #0
	b	.L1941

.L5261:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1942
	b	.L1941

.L1942:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5262
	ldr	r10, =1
	cmp	r10, #0
	b	.L1943

.L5262:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1943

.L1943:

.L1941:
	beq	.L1939
	b	.L1940

.L1939:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L1940:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L1933

.L1935:
	ldr	r9, [fp, #-16]
	cmp	r9, #0
	bne	.L5263
	ldr	r10, =1
	cmp	r10, #0
	b	.L1978

.L5263:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1977
	b	.L1978

.L1977:
	ldr	r9, [fp, #-56]
	str	r9, [fp, #-60]
	ldr	r9, [fp, #-48]
	str	r9, [fp, #-64]

.L1979:
	ldr	r9, [fp, #-64]
	cmp	r9, #0
	bne	.L5264
	ldr	r10, =1
	cmp	r10, #0
	b	.L1981

.L5264:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1980
	b	.L1981

.L1980:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L1994:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5265
	ldr	r10, =1
	cmp	r10, #0
	b	.L1996

.L5265:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1995
	b	.L1996

.L1995:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5266
	ldr	r10, =1
	cmp	r10, #0
	b	.L2001

.L5266:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2000
	b	.L2001

.L2000:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	ldr	r8, =0
	cmp	r9, r8
	beq	.L2006
	b	.L2007

.L2006:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L2007:
	b	.L2002

.L2001:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5267
	ldr	r10, =1
	cmp	r10, #0
	b	.L2024

.L5267:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2023
	b	.L2024

.L2023:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L2024:

.L2002:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L1994

.L1996:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-68]
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L2070:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5268
	ldr	r10, =1
	cmp	r10, #0
	b	.L2072

.L5268:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2071
	b	.L2072

.L2071:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5269
	ldr	r10, =1
	cmp	r10, #0
	b	.L2078

.L5269:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2079
	b	.L2078

.L2079:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5270
	ldr	r10, =1
	cmp	r10, #0
	b	.L2080

.L5270:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2080

.L2080:

.L2078:
	beq	.L2076
	b	.L2077

.L2076:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L2077:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L2070

.L2072:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r8, =0
	cmp	r8, #1
	beq	.L2117
	b	.L2118

.L2117:
	ldr	r9, =0
	str	r9, [fp, #-16]
	b	.L2119

.L2118:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-64]
	ldr	r8, =1
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mul	r9, r8, r9
	str	r9, [fp, #-24]
	ldr	r9, =65535
	str	r9, [fp, #-28]

.L2141:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5271
	ldr	r10, =1
	cmp	r10, #0
	b	.L2143

.L5271:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2142
	b	.L2143

.L2142:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5272
	ldr	r10, =1
	cmp	r10, #0
	b	.L2149

.L5272:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2150
	b	.L2149

.L2150:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5273
	ldr	r10, =1
	cmp	r10, #0
	b	.L2151

.L5273:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2151

.L2151:

.L2149:
	beq	.L2147
	b	.L2148

.L2147:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L2148:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L2141

.L2143:

.L2119:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r9, [fp, #-68]
	str	r9, [fp, #-60]
	b	.L1979

.L1981:
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-56]

.L1978:
	ldr	r9, [fp, #-48]
	str	r9, [fp, #-60]
	ldr	r9, [fp, #-48]
	str	r9, [fp, #-64]

.L2197:
	ldr	r9, [fp, #-64]
	cmp	r9, #0
	bne	.L5274
	ldr	r10, =1
	cmp	r10, #0
	b	.L2199

.L5274:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2198
	b	.L2199

.L2198:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L2212:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5275
	ldr	r10, =1
	cmp	r10, #0
	b	.L2214

.L5275:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2213
	b	.L2214

.L2213:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5276
	ldr	r10, =1
	cmp	r10, #0
	b	.L2219

.L5276:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2218
	b	.L2219

.L2218:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	ldr	r8, =0
	cmp	r9, r8
	beq	.L2224
	b	.L2225

.L2224:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L2225:
	b	.L2220

.L2219:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5277
	ldr	r10, =1
	cmp	r10, #0
	b	.L2242

.L5277:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2241
	b	.L2242

.L2241:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L2242:

.L2220:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L2212

.L2214:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-68]
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L2288:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5278
	ldr	r10, =1
	cmp	r10, #0
	b	.L2290

.L5278:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2289
	b	.L2290

.L2289:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5279
	ldr	r10, =1
	cmp	r10, #0
	b	.L2296

.L5279:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2297
	b	.L2296

.L2297:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5280
	ldr	r10, =1
	cmp	r10, #0
	b	.L2298

.L5280:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2298

.L2298:

.L2296:
	beq	.L2294
	b	.L2295

.L2294:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L2295:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L2288

.L2290:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r8, =0
	cmp	r8, #1
	beq	.L2335
	b	.L2336

.L2335:
	ldr	r9, =0
	str	r9, [fp, #-16]
	b	.L2337

.L2336:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-64]
	ldr	r8, =1
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mul	r9, r8, r9
	str	r9, [fp, #-24]
	ldr	r9, =65535
	str	r9, [fp, #-28]

.L2359:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5281
	ldr	r10, =1
	cmp	r10, #0
	b	.L2361

.L5281:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2360
	b	.L2361

.L2360:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5282
	ldr	r10, =1
	cmp	r10, #0
	b	.L2367

.L5282:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2368
	b	.L2367

.L2368:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5283
	ldr	r10, =1
	cmp	r10, #0
	b	.L2369

.L5283:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2369

.L2369:

.L2367:
	beq	.L2365
	b	.L2366

.L2365:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L2366:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L2359

.L2361:

.L2337:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r9, [fp, #-68]
	str	r9, [fp, #-60]
	b	.L2197

.L2199:
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-48]
	ldr	r9, [fp, #-52]
	str	r9, [fp, #-24]
	ldr	r9, =1
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-28]
	ldr	r8, =15
	cmp	r9, r8
	bge	.L5284
	ldr	r10, =1
	cmp	r10, #0
	b	.L2422

.L5284:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2421
	b	.L2422

.L2421:
	ldr	r9, [fp, #-24]
	ldr	r8, =0
	cmp	r9, r8
	blt	.L5285
	ldr	r10, =1
	cmp	r10, #0
	b	.L2428

.L5285:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2427
	b	.L2428

.L2427:
	ldr	r9, =65535
	str	r9, [fp, #-16]
	b	.L2429

.L2428:
	ldr	r9, =0
	str	r9, [fp, #-16]

.L2429:
	b	.L2423

.L2422:
	ldr	r9, [fp, #-28]
	ldr	r8, =0
	cmp	r9, r8
	bgt	.L5286
	ldr	r10, =1
	cmp	r10, #0
	b	.L2440

.L5286:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2439
	b	.L2440

.L2439:
	ldr	r9, [fp, #-24]
	ldr	r8, =32767
	cmp	r9, r8
	bgt	.L5287
	ldr	r10, =1
	cmp	r10, #0
	b	.L2446

.L5287:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2445
	b	.L2446

.L2445:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-24]
	ldr	r8, =65536
	add	r9, r8, r9
	ldr	r8, =15
	ldr	r7, [fp, #-28]
	sub	r8, r8, r7
	ldr	r7, =1
	add	r8, r7, r8
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	sub	r9, r9, r8
	str	r9, [fp, #-16]
	b	.L2447

.L2446:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-16]

.L2447:
	b	.L2441

.L2440:
	ldr	r9, [fp, #-24]
	str	r9, [fp, #-16]

.L2441:

.L2423:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-52]
	b	.L1918

.L1920:
	ldr	r9, [fp, #-56]
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-36]
	ldr	r9, [fp, #-40]
	str	r9, [fp, #-24]
	ldr	r9, =1
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-28]
	ldr	r8, =15
	cmp	r9, r8
	bge	.L5288
	ldr	r10, =1
	cmp	r10, #0
	b	.L2497

.L5288:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2496
	b	.L2497

.L2496:
	ldr	r9, [fp, #-24]
	ldr	r8, =0
	cmp	r9, r8
	blt	.L5289
	ldr	r10, =1
	cmp	r10, #0
	b	.L2503

.L5289:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2502
	b	.L2503

.L2502:
	ldr	r9, =65535
	str	r9, [fp, #-16]
	b	.L2504

.L2503:
	ldr	r9, =0
	str	r9, [fp, #-16]

.L2504:
	b	.L2498

.L2497:
	ldr	r9, [fp, #-28]
	ldr	r8, =0
	cmp	r9, r8
	bgt	.L5290
	ldr	r10, =1
	cmp	r10, #0
	b	.L2515

.L5290:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2514
	b	.L2515

.L2514:
	ldr	r9, [fp, #-24]
	ldr	r8, =32767
	cmp	r9, r8
	bgt	.L5291
	ldr	r10, =1
	cmp	r10, #0
	b	.L2521

.L5291:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2520
	b	.L2521

.L2520:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-24]
	ldr	r8, =65536
	add	r9, r8, r9
	ldr	r8, =15
	ldr	r7, [fp, #-28]
	sub	r8, r8, r7
	ldr	r7, =1
	add	r8, r7, r8
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	sub	r9, r9, r8
	str	r9, [fp, #-16]
	b	.L2522

.L2521:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-16]

.L2522:
	b	.L2516

.L2515:
	ldr	r9, [fp, #-24]
	str	r9, [fp, #-16]

.L2516:

.L2498:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-40]
	b	.L1282

.L1284:
	ldr	r9, [fp, #-44]
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	mov	r0, r9
	bl	putint
	ldr	r9, =10
	mov	r0, r9
	bl	putch
	ldr	r9, =2
	str	r9, [fp, #-32]

.L2565:
	ldr	r9, [fp, #-32]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5292
	ldr	r10, =1
	cmp	r10, #0
	b	.L2567

.L5292:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2566
	b	.L2567

.L2566:
	ldr	r9, =2
	str	r9, [fp, #-36]
	ldr	r9, [fp, #-32]
	str	r9, [fp, #-40]
	ldr	r9, =1
	str	r9, [fp, #-44]

.L2571:
	ldr	r9, [fp, #-40]
	ldr	r8, =0
	cmp	r9, r8
	bgt	.L5293
	ldr	r10, =1
	cmp	r10, #0
	b	.L2573

.L5293:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2572
	b	.L2573

.L2572:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-40]
	str	r9, [fp, #-24]
	ldr	r9, =1
	str	r9, [fp, #-28]

.L2589:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5294
	ldr	r10, =1
	cmp	r10, #0
	b	.L2591

.L5294:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2590
	b	.L2591

.L2590:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5295
	ldr	r10, =1
	cmp	r10, #0
	b	.L2597

.L5295:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2598
	b	.L2597

.L2598:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5296
	ldr	r10, =1
	cmp	r10, #0
	b	.L2599

.L5296:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2599

.L2599:

.L2597:
	beq	.L2595
	b	.L2596

.L2595:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L2596:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L2589

.L2591:
	ldr	r9, [fp, #-16]
	cmp	r9, #0
	bne	.L5297
	ldr	r10, =1
	cmp	r10, #0
	b	.L2634

.L5297:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2633
	b	.L2634

.L2633:
	ldr	r9, [fp, #-44]
	str	r9, [fp, #-48]
	ldr	r9, [fp, #-36]
	str	r9, [fp, #-52]
	ldr	r9, =0
	str	r9, [fp, #-56]

.L2635:
	ldr	r9, [fp, #-52]
	cmp	r9, #0
	bne	.L5298
	ldr	r10, =1
	cmp	r10, #0
	b	.L2637

.L5298:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2636
	b	.L2637

.L2636:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-52]
	str	r9, [fp, #-24]
	ldr	r9, =1
	str	r9, [fp, #-28]

.L2650:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5299
	ldr	r10, =1
	cmp	r10, #0
	b	.L2652

.L5299:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2651
	b	.L2652

.L2651:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5300
	ldr	r10, =1
	cmp	r10, #0
	b	.L2658

.L5300:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2659
	b	.L2658

.L2659:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5301
	ldr	r10, =1
	cmp	r10, #0
	b	.L2660

.L5301:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2660

.L2660:

.L2658:
	beq	.L2656
	b	.L2657

.L2656:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L2657:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L2650

.L2652:
	ldr	r9, [fp, #-16]
	cmp	r9, #0
	bne	.L5302
	ldr	r10, =1
	cmp	r10, #0
	b	.L2695

.L5302:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2694
	b	.L2695

.L2694:
	ldr	r9, [fp, #-56]
	str	r9, [fp, #-60]
	ldr	r9, [fp, #-48]
	str	r9, [fp, #-64]

.L2696:
	ldr	r9, [fp, #-64]
	cmp	r9, #0
	bne	.L5303
	ldr	r10, =1
	cmp	r10, #0
	b	.L2698

.L5303:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2697
	b	.L2698

.L2697:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L2711:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5304
	ldr	r10, =1
	cmp	r10, #0
	b	.L2713

.L5304:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2712
	b	.L2713

.L2712:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5305
	ldr	r10, =1
	cmp	r10, #0
	b	.L2718

.L5305:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2717
	b	.L2718

.L2717:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	ldr	r8, =0
	cmp	r9, r8
	beq	.L2723
	b	.L2724

.L2723:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L2724:
	b	.L2719

.L2718:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5306
	ldr	r10, =1
	cmp	r10, #0
	b	.L2741

.L5306:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2740
	b	.L2741

.L2740:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L2741:

.L2719:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L2711

.L2713:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-68]
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L2787:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5307
	ldr	r10, =1
	cmp	r10, #0
	b	.L2789

.L5307:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2788
	b	.L2789

.L2788:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5308
	ldr	r10, =1
	cmp	r10, #0
	b	.L2795

.L5308:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2796
	b	.L2795

.L2796:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5309
	ldr	r10, =1
	cmp	r10, #0
	b	.L2797

.L5309:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2797

.L2797:

.L2795:
	beq	.L2793
	b	.L2794

.L2793:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L2794:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L2787

.L2789:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r8, =0
	cmp	r8, #1
	beq	.L2834
	b	.L2835

.L2834:
	ldr	r9, =0
	str	r9, [fp, #-16]
	b	.L2836

.L2835:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-64]
	ldr	r8, =1
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mul	r9, r8, r9
	str	r9, [fp, #-24]
	ldr	r9, =65535
	str	r9, [fp, #-28]

.L2858:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5310
	ldr	r10, =1
	cmp	r10, #0
	b	.L2860

.L5310:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2859
	b	.L2860

.L2859:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5311
	ldr	r10, =1
	cmp	r10, #0
	b	.L2866

.L5311:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2867
	b	.L2866

.L2867:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5312
	ldr	r10, =1
	cmp	r10, #0
	b	.L2868

.L5312:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2868

.L2868:

.L2866:
	beq	.L2864
	b	.L2865

.L2864:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L2865:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L2858

.L2860:

.L2836:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r9, [fp, #-68]
	str	r9, [fp, #-60]
	b	.L2696

.L2698:
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-56]

.L2695:
	ldr	r9, [fp, #-48]
	str	r9, [fp, #-60]
	ldr	r9, [fp, #-48]
	str	r9, [fp, #-64]

.L2914:
	ldr	r9, [fp, #-64]
	cmp	r9, #0
	bne	.L5313
	ldr	r10, =1
	cmp	r10, #0
	b	.L2916

.L5313:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2915
	b	.L2916

.L2915:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L2929:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5314
	ldr	r10, =1
	cmp	r10, #0
	b	.L2931

.L5314:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2930
	b	.L2931

.L2930:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5315
	ldr	r10, =1
	cmp	r10, #0
	b	.L2936

.L5315:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2935
	b	.L2936

.L2935:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	ldr	r8, =0
	cmp	r9, r8
	beq	.L2941
	b	.L2942

.L2941:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L2942:
	b	.L2937

.L2936:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5316
	ldr	r10, =1
	cmp	r10, #0
	b	.L2959

.L5316:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2958
	b	.L2959

.L2958:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L2959:

.L2937:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L2929

.L2931:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-68]
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L3005:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5317
	ldr	r10, =1
	cmp	r10, #0
	b	.L3007

.L5317:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3006
	b	.L3007

.L3006:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5318
	ldr	r10, =1
	cmp	r10, #0
	b	.L3013

.L5318:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3014
	b	.L3013

.L3014:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5319
	ldr	r10, =1
	cmp	r10, #0
	b	.L3015

.L5319:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3015

.L3015:

.L3013:
	beq	.L3011
	b	.L3012

.L3011:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L3012:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L3005

.L3007:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r8, =0
	cmp	r8, #1
	beq	.L3052
	b	.L3053

.L3052:
	ldr	r9, =0
	str	r9, [fp, #-16]
	b	.L3054

.L3053:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-64]
	ldr	r8, =1
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mul	r9, r8, r9
	str	r9, [fp, #-24]
	ldr	r9, =65535
	str	r9, [fp, #-28]

.L3076:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5320
	ldr	r10, =1
	cmp	r10, #0
	b	.L3078

.L5320:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3077
	b	.L3078

.L3077:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5321
	ldr	r10, =1
	cmp	r10, #0
	b	.L3084

.L5321:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3085
	b	.L3084

.L3085:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5322
	ldr	r10, =1
	cmp	r10, #0
	b	.L3086

.L5322:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3086

.L3086:

.L3084:
	beq	.L3082
	b	.L3083

.L3082:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L3083:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L3076

.L3078:

.L3054:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r9, [fp, #-68]
	str	r9, [fp, #-60]
	b	.L2914

.L2916:
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-48]
	ldr	r9, [fp, #-52]
	str	r9, [fp, #-24]
	ldr	r9, =1
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-28]
	ldr	r8, =15
	cmp	r9, r8
	bge	.L5323
	ldr	r10, =1
	cmp	r10, #0
	b	.L3139

.L5323:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3138
	b	.L3139

.L3138:
	ldr	r9, [fp, #-24]
	ldr	r8, =0
	cmp	r9, r8
	blt	.L5324
	ldr	r10, =1
	cmp	r10, #0
	b	.L3145

.L5324:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3144
	b	.L3145

.L3144:
	ldr	r9, =65535
	str	r9, [fp, #-16]
	b	.L3146

.L3145:
	ldr	r9, =0
	str	r9, [fp, #-16]

.L3146:
	b	.L3140

.L3139:
	ldr	r9, [fp, #-28]
	ldr	r8, =0
	cmp	r9, r8
	bgt	.L5325
	ldr	r10, =1
	cmp	r10, #0
	b	.L3157

.L5325:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3156
	b	.L3157

.L3156:
	ldr	r9, [fp, #-24]
	ldr	r8, =32767
	cmp	r9, r8
	bgt	.L5326
	ldr	r10, =1
	cmp	r10, #0
	b	.L3163

.L5326:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3162
	b	.L3163

.L3162:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-24]
	ldr	r8, =65536
	add	r9, r8, r9
	ldr	r8, =15
	ldr	r7, [fp, #-28]
	sub	r8, r8, r7
	ldr	r7, =1
	add	r8, r7, r8
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	sub	r9, r9, r8
	str	r9, [fp, #-16]
	b	.L3164

.L3163:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-16]

.L3164:
	b	.L3158

.L3157:
	ldr	r9, [fp, #-24]
	str	r9, [fp, #-16]

.L3158:

.L3140:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-52]
	b	.L2635

.L2637:
	ldr	r9, [fp, #-56]
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-44]

.L2634:
	ldr	r9, [fp, #-36]
	str	r9, [fp, #-48]
	ldr	r9, [fp, #-36]
	str	r9, [fp, #-52]
	ldr	r9, =0
	str	r9, [fp, #-56]

.L3207:
	ldr	r9, [fp, #-52]
	cmp	r9, #0
	bne	.L5327
	ldr	r10, =1
	cmp	r10, #0
	b	.L3209

.L5327:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3208
	b	.L3209

.L3208:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-52]
	str	r9, [fp, #-24]
	ldr	r9, =1
	str	r9, [fp, #-28]

.L3222:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5328
	ldr	r10, =1
	cmp	r10, #0
	b	.L3224

.L5328:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3223
	b	.L3224

.L3223:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5329
	ldr	r10, =1
	cmp	r10, #0
	b	.L3230

.L5329:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3231
	b	.L3230

.L3231:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5330
	ldr	r10, =1
	cmp	r10, #0
	b	.L3232

.L5330:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3232

.L3232:

.L3230:
	beq	.L3228
	b	.L3229

.L3228:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L3229:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L3222

.L3224:
	ldr	r9, [fp, #-16]
	cmp	r9, #0
	bne	.L5331
	ldr	r10, =1
	cmp	r10, #0
	b	.L3267

.L5331:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3266
	b	.L3267

.L3266:
	ldr	r9, [fp, #-56]
	str	r9, [fp, #-60]
	ldr	r9, [fp, #-48]
	str	r9, [fp, #-64]

.L3268:
	ldr	r9, [fp, #-64]
	cmp	r9, #0
	bne	.L5332
	ldr	r10, =1
	cmp	r10, #0
	b	.L3270

.L5332:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3269
	b	.L3270

.L3269:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L3283:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5333
	ldr	r10, =1
	cmp	r10, #0
	b	.L3285

.L5333:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3284
	b	.L3285

.L3284:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5334
	ldr	r10, =1
	cmp	r10, #0
	b	.L3290

.L5334:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3289
	b	.L3290

.L3289:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	ldr	r8, =0
	cmp	r9, r8
	beq	.L3295
	b	.L3296

.L3295:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L3296:
	b	.L3291

.L3290:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5335
	ldr	r10, =1
	cmp	r10, #0
	b	.L3313

.L5335:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3312
	b	.L3313

.L3312:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L3313:

.L3291:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L3283

.L3285:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-68]
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L3359:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5336
	ldr	r10, =1
	cmp	r10, #0
	b	.L3361

.L5336:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3360
	b	.L3361

.L3360:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5337
	ldr	r10, =1
	cmp	r10, #0
	b	.L3367

.L5337:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3368
	b	.L3367

.L3368:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5338
	ldr	r10, =1
	cmp	r10, #0
	b	.L3369

.L5338:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3369

.L3369:

.L3367:
	beq	.L3365
	b	.L3366

.L3365:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L3366:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L3359

.L3361:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r8, =0
	cmp	r8, #1
	beq	.L3406
	b	.L3407

.L3406:
	ldr	r9, =0
	str	r9, [fp, #-16]
	b	.L3408

.L3407:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-64]
	ldr	r8, =1
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mul	r9, r8, r9
	str	r9, [fp, #-24]
	ldr	r9, =65535
	str	r9, [fp, #-28]

.L3430:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5339
	ldr	r10, =1
	cmp	r10, #0
	b	.L3432

.L5339:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3431
	b	.L3432

.L3431:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5340
	ldr	r10, =1
	cmp	r10, #0
	b	.L3438

.L5340:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3439
	b	.L3438

.L3439:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5341
	ldr	r10, =1
	cmp	r10, #0
	b	.L3440

.L5341:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3440

.L3440:

.L3438:
	beq	.L3436
	b	.L3437

.L3436:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L3437:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L3430

.L3432:

.L3408:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r9, [fp, #-68]
	str	r9, [fp, #-60]
	b	.L3268

.L3270:
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-56]

.L3267:
	ldr	r9, [fp, #-48]
	str	r9, [fp, #-60]
	ldr	r9, [fp, #-48]
	str	r9, [fp, #-64]

.L3486:
	ldr	r9, [fp, #-64]
	cmp	r9, #0
	bne	.L5342
	ldr	r10, =1
	cmp	r10, #0
	b	.L3488

.L5342:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3487
	b	.L3488

.L3487:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L3501:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5343
	ldr	r10, =1
	cmp	r10, #0
	b	.L3503

.L5343:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3502
	b	.L3503

.L3502:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5344
	ldr	r10, =1
	cmp	r10, #0
	b	.L3508

.L5344:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3507
	b	.L3508

.L3507:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	ldr	r8, =0
	cmp	r9, r8
	beq	.L3513
	b	.L3514

.L3513:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L3514:
	b	.L3509

.L3508:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5345
	ldr	r10, =1
	cmp	r10, #0
	b	.L3531

.L5345:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3530
	b	.L3531

.L3530:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L3531:

.L3509:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L3501

.L3503:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-68]
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L3577:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5346
	ldr	r10, =1
	cmp	r10, #0
	b	.L3579

.L5346:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3578
	b	.L3579

.L3578:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5347
	ldr	r10, =1
	cmp	r10, #0
	b	.L3585

.L5347:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3586
	b	.L3585

.L3586:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5348
	ldr	r10, =1
	cmp	r10, #0
	b	.L3587

.L5348:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3587

.L3587:

.L3585:
	beq	.L3583
	b	.L3584

.L3583:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L3584:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L3577

.L3579:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r8, =0
	cmp	r8, #1
	beq	.L3624
	b	.L3625

.L3624:
	ldr	r9, =0
	str	r9, [fp, #-16]
	b	.L3626

.L3625:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-64]
	ldr	r8, =1
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mul	r9, r8, r9
	str	r9, [fp, #-24]
	ldr	r9, =65535
	str	r9, [fp, #-28]

.L3648:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5349
	ldr	r10, =1
	cmp	r10, #0
	b	.L3650

.L5349:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3649
	b	.L3650

.L3649:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5350
	ldr	r10, =1
	cmp	r10, #0
	b	.L3656

.L5350:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3657
	b	.L3656

.L3657:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5351
	ldr	r10, =1
	cmp	r10, #0
	b	.L3658

.L5351:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3658

.L3658:

.L3656:
	beq	.L3654
	b	.L3655

.L3654:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L3655:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L3648

.L3650:

.L3626:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r9, [fp, #-68]
	str	r9, [fp, #-60]
	b	.L3486

.L3488:
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-48]
	ldr	r9, [fp, #-52]
	str	r9, [fp, #-24]
	ldr	r9, =1
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-28]
	ldr	r8, =15
	cmp	r9, r8
	bge	.L5352
	ldr	r10, =1
	cmp	r10, #0
	b	.L3711

.L5352:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3710
	b	.L3711

.L3710:
	ldr	r9, [fp, #-24]
	ldr	r8, =0
	cmp	r9, r8
	blt	.L5353
	ldr	r10, =1
	cmp	r10, #0
	b	.L3717

.L5353:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3716
	b	.L3717

.L3716:
	ldr	r9, =65535
	str	r9, [fp, #-16]
	b	.L3718

.L3717:
	ldr	r9, =0
	str	r9, [fp, #-16]

.L3718:
	b	.L3712

.L3711:
	ldr	r9, [fp, #-28]
	ldr	r8, =0
	cmp	r9, r8
	bgt	.L5354
	ldr	r10, =1
	cmp	r10, #0
	b	.L3729

.L5354:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3728
	b	.L3729

.L3728:
	ldr	r9, [fp, #-24]
	ldr	r8, =32767
	cmp	r9, r8
	bgt	.L5355
	ldr	r10, =1
	cmp	r10, #0
	b	.L3735

.L5355:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3734
	b	.L3735

.L3734:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-24]
	ldr	r8, =65536
	add	r9, r8, r9
	ldr	r8, =15
	ldr	r7, [fp, #-28]
	sub	r8, r8, r7
	ldr	r7, =1
	add	r8, r7, r8
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	sub	r9, r9, r8
	str	r9, [fp, #-16]
	b	.L3736

.L3735:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-16]

.L3736:
	b	.L3730

.L3729:
	ldr	r9, [fp, #-24]
	str	r9, [fp, #-16]

.L3730:

.L3712:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-52]
	b	.L3207

.L3209:
	ldr	r9, [fp, #-56]
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-36]
	ldr	r9, [fp, #-40]
	str	r9, [fp, #-24]
	ldr	r9, =1
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-28]
	ldr	r8, =15
	cmp	r9, r8
	bge	.L5356
	ldr	r10, =1
	cmp	r10, #0
	b	.L3786

.L5356:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3785
	b	.L3786

.L3785:
	ldr	r9, [fp, #-24]
	ldr	r8, =0
	cmp	r9, r8
	blt	.L5357
	ldr	r10, =1
	cmp	r10, #0
	b	.L3792

.L5357:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3791
	b	.L3792

.L3791:
	ldr	r9, =65535
	str	r9, [fp, #-16]
	b	.L3793

.L3792:
	ldr	r9, =0
	str	r9, [fp, #-16]

.L3793:
	b	.L3787

.L3786:
	ldr	r9, [fp, #-28]
	ldr	r8, =0
	cmp	r9, r8
	bgt	.L5358
	ldr	r10, =1
	cmp	r10, #0
	b	.L3804

.L5358:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3803
	b	.L3804

.L3803:
	ldr	r9, [fp, #-24]
	ldr	r8, =32767
	cmp	r9, r8
	bgt	.L5359
	ldr	r10, =1
	cmp	r10, #0
	b	.L3810

.L5359:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3809
	b	.L3810

.L3809:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-24]
	ldr	r8, =65536
	add	r9, r8, r9
	ldr	r8, =15
	ldr	r7, [fp, #-28]
	sub	r8, r8, r7
	ldr	r7, =1
	add	r8, r7, r8
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	sub	r9, r9, r8
	str	r9, [fp, #-16]
	b	.L3811

.L3810:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-16]

.L3811:
	b	.L3805

.L3804:
	ldr	r9, [fp, #-24]
	str	r9, [fp, #-16]

.L3805:

.L3787:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-40]
	b	.L2571

.L2573:
	ldr	r9, [fp, #-44]
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	mov	r0, r9
	bl	putint
	ldr	r9, =10
	mov	r0, r9
	bl	putch
	ldr	r9, [fp, #-32]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-32]
	b	.L2565

.L2567:
	ldr	r9, =0
	str	r9, [fp, #-32]

.L3860:
	ldr	r9, [fp, #-32]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5360
	ldr	r10, =1
	cmp	r10, #0
	b	.L3862

.L5360:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3861
	b	.L3862

.L3861:
	ldr	r9, =2
	str	r9, [fp, #-36]
	ldr	r9, [fp, #-32]
	str	r9, [fp, #-40]
	ldr	r9, =1
	str	r9, [fp, #-44]

.L3866:
	ldr	r9, [fp, #-40]
	ldr	r8, =0
	cmp	r9, r8
	bgt	.L5361
	ldr	r10, =1
	cmp	r10, #0
	b	.L3868

.L5361:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3867
	b	.L3868

.L3867:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-40]
	str	r9, [fp, #-24]
	ldr	r9, =1
	str	r9, [fp, #-28]

.L3884:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5362
	ldr	r10, =1
	cmp	r10, #0
	b	.L3886

.L5362:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3885
	b	.L3886

.L3885:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5363
	ldr	r10, =1
	cmp	r10, #0
	b	.L3892

.L5363:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3893
	b	.L3892

.L3893:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5364
	ldr	r10, =1
	cmp	r10, #0
	b	.L3894

.L5364:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3894

.L3894:

.L3892:
	beq	.L3890
	b	.L3891

.L3890:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L3891:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L3884

.L3886:
	ldr	r9, [fp, #-16]
	cmp	r9, #0
	bne	.L5365
	ldr	r10, =1
	cmp	r10, #0
	b	.L3929

.L5365:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3928
	b	.L3929

.L3928:
	ldr	r9, [fp, #-44]
	str	r9, [fp, #-48]
	ldr	r9, [fp, #-36]
	str	r9, [fp, #-52]
	ldr	r9, =0
	str	r9, [fp, #-56]

.L3930:
	ldr	r9, [fp, #-52]
	cmp	r9, #0
	bne	.L5366
	ldr	r10, =1
	cmp	r10, #0
	b	.L3932

.L5366:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3931
	b	.L3932

.L3931:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-52]
	str	r9, [fp, #-24]
	ldr	r9, =1
	str	r9, [fp, #-28]

.L3945:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5367
	ldr	r10, =1
	cmp	r10, #0
	b	.L3947

.L5367:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3946
	b	.L3947

.L3946:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5368
	ldr	r10, =1
	cmp	r10, #0
	b	.L3953

.L5368:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3954
	b	.L3953

.L3954:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5369
	ldr	r10, =1
	cmp	r10, #0
	b	.L3955

.L5369:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3955

.L3955:

.L3953:
	beq	.L3951
	b	.L3952

.L3951:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L3952:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L3945

.L3947:
	ldr	r9, [fp, #-16]
	cmp	r9, #0
	bne	.L5370
	ldr	r10, =1
	cmp	r10, #0
	b	.L3990

.L5370:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3989
	b	.L3990

.L3989:
	ldr	r9, [fp, #-56]
	str	r9, [fp, #-60]
	ldr	r9, [fp, #-48]
	str	r9, [fp, #-64]

.L3991:
	ldr	r9, [fp, #-64]
	cmp	r9, #0
	bne	.L5371
	ldr	r10, =1
	cmp	r10, #0
	b	.L3993

.L5371:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3992
	b	.L3993

.L3992:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L4006:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5372
	ldr	r10, =1
	cmp	r10, #0
	b	.L4008

.L5372:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4007
	b	.L4008

.L4007:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5373
	ldr	r10, =1
	cmp	r10, #0
	b	.L4013

.L5373:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4012
	b	.L4013

.L4012:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	ldr	r8, =0
	cmp	r9, r8
	beq	.L4018
	b	.L4019

.L4018:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L4019:
	b	.L4014

.L4013:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5374
	ldr	r10, =1
	cmp	r10, #0
	b	.L4036

.L5374:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4035
	b	.L4036

.L4035:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L4036:

.L4014:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L4006

.L4008:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-68]
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L4082:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5375
	ldr	r10, =1
	cmp	r10, #0
	b	.L4084

.L5375:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4083
	b	.L4084

.L4083:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5376
	ldr	r10, =1
	cmp	r10, #0
	b	.L4090

.L5376:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4091
	b	.L4090

.L4091:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5377
	ldr	r10, =1
	cmp	r10, #0
	b	.L4092

.L5377:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4092

.L4092:

.L4090:
	beq	.L4088
	b	.L4089

.L4088:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L4089:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L4082

.L4084:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r8, =0
	cmp	r8, #1
	beq	.L4129
	b	.L4130

.L4129:
	ldr	r9, =0
	str	r9, [fp, #-16]
	b	.L4131

.L4130:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-64]
	ldr	r8, =1
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mul	r9, r8, r9
	str	r9, [fp, #-24]
	ldr	r9, =65535
	str	r9, [fp, #-28]

.L4153:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5378
	ldr	r10, =1
	cmp	r10, #0
	b	.L4155

.L5378:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4154
	b	.L4155

.L4154:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5379
	ldr	r10, =1
	cmp	r10, #0
	b	.L4161

.L5379:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4162
	b	.L4161

.L4162:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5380
	ldr	r10, =1
	cmp	r10, #0
	b	.L4163

.L5380:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4163

.L4163:

.L4161:
	beq	.L4159
	b	.L4160

.L4159:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L4160:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L4153

.L4155:

.L4131:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r9, [fp, #-68]
	str	r9, [fp, #-60]
	b	.L3991

.L3993:
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-56]

.L3990:
	ldr	r9, [fp, #-48]
	str	r9, [fp, #-60]
	ldr	r9, [fp, #-48]
	str	r9, [fp, #-64]

.L4209:
	ldr	r9, [fp, #-64]
	cmp	r9, #0
	bne	.L5381
	ldr	r10, =1
	cmp	r10, #0
	b	.L4211

.L5381:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4210
	b	.L4211

.L4210:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L4224:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5382
	ldr	r10, =1
	cmp	r10, #0
	b	.L4226

.L5382:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4225
	b	.L4226

.L4225:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5383
	ldr	r10, =1
	cmp	r10, #0
	b	.L4231

.L5383:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4230
	b	.L4231

.L4230:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	ldr	r8, =0
	cmp	r9, r8
	beq	.L4236
	b	.L4237

.L4236:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L4237:
	b	.L4232

.L4231:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5384
	ldr	r10, =1
	cmp	r10, #0
	b	.L4254

.L5384:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4253
	b	.L4254

.L4253:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L4254:

.L4232:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L4224

.L4226:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-68]
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L4300:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5385
	ldr	r10, =1
	cmp	r10, #0
	b	.L4302

.L5385:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4301
	b	.L4302

.L4301:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5386
	ldr	r10, =1
	cmp	r10, #0
	b	.L4308

.L5386:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4309
	b	.L4308

.L4309:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5387
	ldr	r10, =1
	cmp	r10, #0
	b	.L4310

.L5387:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4310

.L4310:

.L4308:
	beq	.L4306
	b	.L4307

.L4306:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L4307:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L4300

.L4302:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r8, =0
	cmp	r8, #1
	beq	.L4347
	b	.L4348

.L4347:
	ldr	r9, =0
	str	r9, [fp, #-16]
	b	.L4349

.L4348:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-64]
	ldr	r8, =1
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mul	r9, r8, r9
	str	r9, [fp, #-24]
	ldr	r9, =65535
	str	r9, [fp, #-28]

.L4371:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5388
	ldr	r10, =1
	cmp	r10, #0
	b	.L4373

.L5388:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4372
	b	.L4373

.L4372:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5389
	ldr	r10, =1
	cmp	r10, #0
	b	.L4379

.L5389:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4380
	b	.L4379

.L4380:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5390
	ldr	r10, =1
	cmp	r10, #0
	b	.L4381

.L5390:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4381

.L4381:

.L4379:
	beq	.L4377
	b	.L4378

.L4377:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L4378:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L4371

.L4373:

.L4349:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r9, [fp, #-68]
	str	r9, [fp, #-60]
	b	.L4209

.L4211:
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-48]
	ldr	r9, [fp, #-52]
	str	r9, [fp, #-24]
	ldr	r9, =1
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-28]
	ldr	r8, =15
	cmp	r9, r8
	bge	.L5391
	ldr	r10, =1
	cmp	r10, #0
	b	.L4434

.L5391:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4433
	b	.L4434

.L4433:
	ldr	r9, [fp, #-24]
	ldr	r8, =0
	cmp	r9, r8
	blt	.L5392
	ldr	r10, =1
	cmp	r10, #0
	b	.L4440

.L5392:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4439
	b	.L4440

.L4439:
	ldr	r9, =65535
	str	r9, [fp, #-16]
	b	.L4441

.L4440:
	ldr	r9, =0
	str	r9, [fp, #-16]

.L4441:
	b	.L4435

.L4434:
	ldr	r9, [fp, #-28]
	ldr	r8, =0
	cmp	r9, r8
	bgt	.L5393
	ldr	r10, =1
	cmp	r10, #0
	b	.L4452

.L5393:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4451
	b	.L4452

.L4451:
	ldr	r9, [fp, #-24]
	ldr	r8, =32767
	cmp	r9, r8
	bgt	.L5394
	ldr	r10, =1
	cmp	r10, #0
	b	.L4458

.L5394:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4457
	b	.L4458

.L4457:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-24]
	ldr	r8, =65536
	add	r9, r8, r9
	ldr	r8, =15
	ldr	r7, [fp, #-28]
	sub	r8, r8, r7
	ldr	r7, =1
	add	r8, r7, r8
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	sub	r9, r9, r8
	str	r9, [fp, #-16]
	b	.L4459

.L4458:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-16]

.L4459:
	b	.L4453

.L4452:
	ldr	r9, [fp, #-24]
	str	r9, [fp, #-16]

.L4453:

.L4435:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-52]
	b	.L3930

.L3932:
	ldr	r9, [fp, #-56]
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-44]

.L3929:
	ldr	r9, [fp, #-36]
	str	r9, [fp, #-48]
	ldr	r9, [fp, #-36]
	str	r9, [fp, #-52]
	ldr	r9, =0
	str	r9, [fp, #-56]

.L4502:
	ldr	r9, [fp, #-52]
	cmp	r9, #0
	bne	.L5395
	ldr	r10, =1
	cmp	r10, #0
	b	.L4504

.L5395:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4503
	b	.L4504

.L4503:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-52]
	str	r9, [fp, #-24]
	ldr	r9, =1
	str	r9, [fp, #-28]

.L4517:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5396
	ldr	r10, =1
	cmp	r10, #0
	b	.L4519

.L5396:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4518
	b	.L4519

.L4518:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5397
	ldr	r10, =1
	cmp	r10, #0
	b	.L4525

.L5397:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4526
	b	.L4525

.L4526:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5398
	ldr	r10, =1
	cmp	r10, #0
	b	.L4527

.L5398:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4527

.L4527:

.L4525:
	beq	.L4523
	b	.L4524

.L4523:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L4524:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L4517

.L4519:
	ldr	r9, [fp, #-16]
	cmp	r9, #0
	bne	.L5399
	ldr	r10, =1
	cmp	r10, #0
	b	.L4562

.L5399:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4561
	b	.L4562

.L4561:
	ldr	r9, [fp, #-56]
	str	r9, [fp, #-60]
	ldr	r9, [fp, #-48]
	str	r9, [fp, #-64]

.L4563:
	ldr	r9, [fp, #-64]
	cmp	r9, #0
	bne	.L5400
	ldr	r10, =1
	cmp	r10, #0
	b	.L4565

.L5400:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4564
	b	.L4565

.L4564:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L4578:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5401
	ldr	r10, =1
	cmp	r10, #0
	b	.L4580

.L5401:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4579
	b	.L4580

.L4579:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5402
	ldr	r10, =1
	cmp	r10, #0
	b	.L4585

.L5402:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4584
	b	.L4585

.L4584:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	ldr	r8, =0
	cmp	r9, r8
	beq	.L4590
	b	.L4591

.L4590:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L4591:
	b	.L4586

.L4585:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5403
	ldr	r10, =1
	cmp	r10, #0
	b	.L4608

.L5403:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4607
	b	.L4608

.L4607:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L4608:

.L4586:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L4578

.L4580:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-68]
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L4654:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5404
	ldr	r10, =1
	cmp	r10, #0
	b	.L4656

.L5404:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4655
	b	.L4656

.L4655:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5405
	ldr	r10, =1
	cmp	r10, #0
	b	.L4662

.L5405:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4663
	b	.L4662

.L4663:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5406
	ldr	r10, =1
	cmp	r10, #0
	b	.L4664

.L5406:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4664

.L4664:

.L4662:
	beq	.L4660
	b	.L4661

.L4660:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L4661:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L4654

.L4656:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r8, =0
	cmp	r8, #1
	beq	.L4701
	b	.L4702

.L4701:
	ldr	r9, =0
	str	r9, [fp, #-16]
	b	.L4703

.L4702:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-64]
	ldr	r8, =1
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mul	r9, r8, r9
	str	r9, [fp, #-24]
	ldr	r9, =65535
	str	r9, [fp, #-28]

.L4725:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5407
	ldr	r10, =1
	cmp	r10, #0
	b	.L4727

.L5407:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4726
	b	.L4727

.L4726:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5408
	ldr	r10, =1
	cmp	r10, #0
	b	.L4733

.L5408:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4734
	b	.L4733

.L4734:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5409
	ldr	r10, =1
	cmp	r10, #0
	b	.L4735

.L5409:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4735

.L4735:

.L4733:
	beq	.L4731
	b	.L4732

.L4731:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L4732:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L4725

.L4727:

.L4703:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r9, [fp, #-68]
	str	r9, [fp, #-60]
	b	.L4563

.L4565:
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-56]

.L4562:
	ldr	r9, [fp, #-48]
	str	r9, [fp, #-60]
	ldr	r9, [fp, #-48]
	str	r9, [fp, #-64]

.L4781:
	ldr	r9, [fp, #-64]
	cmp	r9, #0
	bne	.L5410
	ldr	r10, =1
	cmp	r10, #0
	b	.L4783

.L5410:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4782
	b	.L4783

.L4782:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L4796:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5411
	ldr	r10, =1
	cmp	r10, #0
	b	.L4798

.L5411:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4797
	b	.L4798

.L4797:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5412
	ldr	r10, =1
	cmp	r10, #0
	b	.L4803

.L5412:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4802
	b	.L4803

.L4802:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	ldr	r8, =0
	cmp	r9, r8
	beq	.L4808
	b	.L4809

.L4808:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L4809:
	b	.L4804

.L4803:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5413
	ldr	r10, =1
	cmp	r10, #0
	b	.L4826

.L5413:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4825
	b	.L4826

.L4825:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L4826:

.L4804:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L4796

.L4798:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-68]
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-64]
	str	r9, [fp, #-28]

.L4872:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5414
	ldr	r10, =1
	cmp	r10, #0
	b	.L4874

.L5414:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4873
	b	.L4874

.L4873:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5415
	ldr	r10, =1
	cmp	r10, #0
	b	.L4880

.L5415:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4881
	b	.L4880

.L4881:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5416
	ldr	r10, =1
	cmp	r10, #0
	b	.L4882

.L5416:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4882

.L4882:

.L4880:
	beq	.L4878
	b	.L4879

.L4878:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L4879:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L4872

.L4874:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r8, =0
	cmp	r8, #1
	beq	.L4919
	b	.L4920

.L4919:
	ldr	r9, =0
	str	r9, [fp, #-16]
	b	.L4921

.L4920:
	ldr	r9, =0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-64]
	ldr	r8, =1
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mul	r9, r8, r9
	str	r9, [fp, #-24]
	ldr	r9, =65535
	str	r9, [fp, #-28]

.L4943:
	ldr	r9, [fp, #-20]
	ldr	r8, =16
	cmp	r9, r8
	blt	.L5417
	ldr	r10, =1
	cmp	r10, #0
	b	.L4945

.L5417:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4944
	b	.L4945

.L4944:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	cmp	r9, #0
	bne	.L5418
	ldr	r10, =1
	cmp	r10, #0
	b	.L4951

.L5418:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4952
	b	.L4951

.L4952:
	ldr	r7, [fp, #-28]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r8, r1
	cmp	r8, #0
	bne	.L5419
	ldr	r10, =1
	cmp	r10, #0
	b	.L4953

.L5419:
	ldr	r10, =0
	cmp	r10, #0
	b	.L4953

.L4953:

.L4951:
	beq	.L4949
	b	.L4950

.L4949:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	ldr	r7, [fp, #-20]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-16]

.L4950:
	ldr	r9, [fp, #-24]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L4943

.L4945:

.L4921:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-64]
	ldr	r9, [fp, #-68]
	str	r9, [fp, #-60]
	b	.L4781

.L4783:
	ldr	r9, [fp, #-60]
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-48]
	ldr	r9, [fp, #-52]
	str	r9, [fp, #-24]
	ldr	r9, =1
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-28]
	ldr	r8, =15
	cmp	r9, r8
	bge	.L5420
	ldr	r10, =1
	cmp	r10, #0
	b	.L5006

.L5420:
	ldr	r10, =0
	cmp	r10, #0
	b	.L5005
	b	.L5006

.L5005:
	ldr	r9, [fp, #-24]
	ldr	r8, =0
	cmp	r9, r8
	blt	.L5421
	ldr	r10, =1
	cmp	r10, #0
	b	.L5012

.L5421:
	ldr	r10, =0
	cmp	r10, #0
	b	.L5011
	b	.L5012

.L5011:
	ldr	r9, =65535
	str	r9, [fp, #-16]
	b	.L5013

.L5012:
	ldr	r9, =0
	str	r9, [fp, #-16]

.L5013:
	b	.L5007

.L5006:
	ldr	r9, [fp, #-28]
	ldr	r8, =0
	cmp	r9, r8
	bgt	.L5422
	ldr	r10, =1
	cmp	r10, #0
	b	.L5024

.L5422:
	ldr	r10, =0
	cmp	r10, #0
	b	.L5023
	b	.L5024

.L5023:
	ldr	r9, [fp, #-24]
	ldr	r8, =32767
	cmp	r9, r8
	bgt	.L5423
	ldr	r10, =1
	cmp	r10, #0
	b	.L5030

.L5423:
	ldr	r10, =0
	cmp	r10, #0
	b	.L5029
	b	.L5030

.L5029:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-24]
	ldr	r8, =65536
	add	r9, r8, r9
	ldr	r8, =15
	ldr	r7, [fp, #-28]
	sub	r8, r8, r7
	ldr	r7, =1
	add	r8, r7, r8
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	sub	r9, r9, r8
	str	r9, [fp, #-16]
	b	.L5031

.L5030:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-16]

.L5031:
	b	.L5025

.L5024:
	ldr	r9, [fp, #-24]
	str	r9, [fp, #-16]

.L5025:

.L5007:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-52]
	b	.L4502

.L4504:
	ldr	r9, [fp, #-56]
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-36]
	ldr	r9, [fp, #-40]
	str	r9, [fp, #-24]
	ldr	r9, =1
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-28]
	ldr	r8, =15
	cmp	r9, r8
	bge	.L5424
	ldr	r10, =1
	cmp	r10, #0
	b	.L5081

.L5424:
	ldr	r10, =0
	cmp	r10, #0
	b	.L5080
	b	.L5081

.L5080:
	ldr	r9, [fp, #-24]
	ldr	r8, =0
	cmp	r9, r8
	blt	.L5425
	ldr	r10, =1
	cmp	r10, #0
	b	.L5087

.L5425:
	ldr	r10, =0
	cmp	r10, #0
	b	.L5086
	b	.L5087

.L5086:
	ldr	r9, =65535
	str	r9, [fp, #-16]
	b	.L5088

.L5087:
	ldr	r9, =0
	str	r9, [fp, #-16]

.L5088:
	b	.L5082

.L5081:
	ldr	r9, [fp, #-28]
	ldr	r8, =0
	cmp	r9, r8
	bgt	.L5426
	ldr	r10, =1
	cmp	r10, #0
	b	.L5099

.L5426:
	ldr	r10, =0
	cmp	r10, #0
	b	.L5098
	b	.L5099

.L5098:
	ldr	r9, [fp, #-24]
	ldr	r8, =32767
	cmp	r9, r8
	bgt	.L5427
	ldr	r10, =1
	cmp	r10, #0
	b	.L5105

.L5427:
	ldr	r10, =0
	cmp	r10, #0
	b	.L5104
	b	.L5105

.L5104:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-24]
	ldr	r8, =65536
	add	r9, r8, r9
	ldr	r8, =15
	ldr	r7, [fp, #-28]
	sub	r8, r8, r7
	ldr	r7, =1
	add	r8, r7, r8
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	sub	r9, r9, r8
	str	r9, [fp, #-16]
	b	.L5106

.L5105:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r8,	[r10, r8,LSL#2]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-16]

.L5106:
	b	.L5100

.L5099:
	ldr	r9, [fp, #-24]
	str	r9, [fp, #-16]

.L5100:

.L5082:
	ldr	r9, [fp, #-16]
	str	r9, [fp, #-40]
	b	.L3866

.L3868:
	ldr	r9, [fp, #-44]
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-32]
	movw	r10, #:lower16:SHIFT_TABL
	movt	r10, #:upper16:SHIFT_TABL
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, [fp, #-16]
	cmp	r9, r8
	bne	.L5428
	ldr	r10, =1
	cmp	r10, #0
	b	.L5147

.L5428:
	ldr	r10, =0
	cmp	r10, #0
	b	.L5146
	b	.L5147

.L5146:
	ldr	r9, =1
	mov	r0, r9
	b	.L1

.L5147:
	ldr	r9, [fp, #-32]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-32]
	b	.L3860

.L3862:
	ldr	r9, =0
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	long_func, .-long_func

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #16
	bl	long_func
	mov	r9, r0
	mov	r0, r9
	b	.L5157

.L5157:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
