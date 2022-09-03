	.arch armv7-a
	.fpu vfpv4
	.arm
	.global	var1
	.data
	.align	2
	.type	var1, %object
	.size	var1, 12
var1:
	.word	 19971231
	.word	 19981013
	.word	 1000000007
	.global	var2
	.data
	.align	2
	.type	var2, %object
	.size	var2, 4
var2:
	.word	0
	.global	var3
	.bss
	.align	2
	.type	var3, %object
	.size	var3, 40000
var3:
	.space	 40000
	.text
	.align	2
	.global	func1
	.type	func1, %function
func1:
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r8-r10,fp, lr}
	vpush.s32	{d0-d2}
	add	fp, sp, #0
	sub	sp, sp, #132
	str	r0, [r11, #-4]
	mov	r10, r1
	vmov.s32	d2[0], r10
	vmov.s32	d2[1], r2
	mov	r10, #0
	mov	r1, r10
	mov	r10, #124
	mov	r2, r10
	mov	r10, #65404
	movt	r10, #65535
	add	r10, fp, r10
	mov	r0, r10
	bl	memset(PLT)
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	mov	r12, #0
	str	r12, [r0, #0]
	str	r12, [r0, #4]
	str	r12, [r0, #8]
	str	r12, [r0, #12]
	str	r12, [r0, #16]
	str	r12, [r0, #20]
	str	r12, [r0, #24]
	str	r12, [r0, #28]
	str	r12, [r0, #32]
	str	r12, [r0, #36]
	str	r12, [r0, #40]
	str	r12, [r0, #44]
	str	r12, [r0, #48]
	str	r12, [r0, #52]
	str	r12, [r0, #56]
	str	r12, [r0, #60]
	str	r12, [r0, #64]
	str	r12, [r0, #68]
	str	r12, [r0, #72]
	str	r12, [r0, #76]
	str	r12, [r0, #80]
	str	r12, [r0, #84]
	str	r12, [r0, #88]
	str	r12, [r0, #92]
	str	r12, [r0, #96]
	str	r12, [r0, #100]
	str	r12, [r0, #104]
	str	r12, [r0, #108]
	str	r12, [r0, #112]
	str	r12, [r0, #116]
	str	r12, [r0, #120]
	mov	r10, #0
	mov	r9, #1
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	str	r9, [r0, r10,LSL#2]
	mov	r10, #0
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r10, [r0, r10,LSL#2]
	mov	r10, r10,LSL#1
	mov	r9, #1
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	b	.L278
	.ltorg
.L278:
	str	r10, [r0, r9,LSL#2]
	mov	r10, #1
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r10, [r0, r10,LSL#2]
	mov	r10, r10,LSL#1
	mov	r9, #2
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	str	r10, [r0, r9,LSL#2]
	mov	r10, #2
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r10, [r0, r10,LSL#2]
	mov	r10, r10,LSL#1
	mov	r9, #3
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	str	r10, [r0, r9,LSL#2]
	mov	r10, #3
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r10, [r0, r10,LSL#2]
	mov	r10, r10,LSL#1
	mov	r9, #4
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	str	r10, [r0, r9,LSL#2]
	mov	r10, #4
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r10, [r0, r10,LSL#2]
	mov	r10, r10,LSL#1
	mov	r9, #5
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	str	r10, [r0, r9,LSL#2]
	mov	r10, #5
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r10, [r0, r10,LSL#2]
	mov	r10, r10,LSL#1
	mov	r9, #6
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	str	r10, [r0, r9,LSL#2]
	mov	r10, #6
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r10, [r0, r10,LSL#2]
	mov	r10, r10,LSL#1
	mov	r9, #7
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	str	r10, [r0, r9,LSL#2]
	mov	r10, #7
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r10, [r0, r10,LSL#2]
	mov	r10, r10,LSL#1
	b	.L279
	.ltorg
.L279:
	mov	r9, #8
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	str	r10, [r0, r9,LSL#2]
	mov	r10, #8
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r10, [r0, r10,LSL#2]
	mov	r10, r10,LSL#1
	mov	r9, #9
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	str	r10, [r0, r9,LSL#2]
	mov	r10, #9
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r10, [r0, r10,LSL#2]
	mov	r10, r10,LSL#1
	mov	r9, #10
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	str	r10, [r0, r9,LSL#2]
	mov	r10, #10
	vmov.s32	d1[0], r10
	b	.L74
	.ltorg
.L74:
	vmov.s32	r10, d1[0]
	cmp	r10, #30
	blt	.L268
	mov	r0, #1
	cmp	r0, #0
	b	.L76
	.ltorg
.L268:
	mov	r0, #0
	cmp	r0, #0
	b	.L75
	b	.L76
	.ltorg
.L75:
	vmov.s32	r10, d1[0]
	add	r10, r10, #1
	sub	r9, r10, #1
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r9, [r0, r9,LSL#2]
	mov	r9, r9,LSL#1
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	str	r9, [r0, r10,LSL#2]
	vmov.s32	d1[0], r10
	b	.L74
	.ltorg
.L76:
	vmov.s32	r10, d2[0]
	mov	r0, r10
	mov	r1, #30
	bl	__aeabi_idiv
	mov	r10, r0
	mov	r9, #10000
	cmp	r10, r9
	bge	.L269
	mov	r10, #0
	vmov.s32	d1[1], r10
	mov	r10, #0
	vmov.s32	d1[1], r10
	mov	r0, #1
	cmp	r0, #0
	b	.L96
	.ltorg
.L269:
	mov	r0, #0
	cmp	r0, #0
	b	.L95
	b	.L96
	.ltorg
.L95:
	mov		r0, #0
	b	.L4
	.ltorg
.L96:
	vmov.s32	r10, d2[0]
	mov	r0, r10
	mov	r1, #30
	bl	__aeabi_idiv
	mov	r10, r0
	ldr	r9, [r11, #-4]
	ldr	r10, [r9, r10,LSL#2]
	vmov.s32	r9, d2[0]
	mov	r8, #30
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r9, [r0, r9,LSL#2]
	mov	r0, r10
	mov	r1, r9
	bl	__aeabi_idiv
	mov	r10, r0
	mov	r9, #2
	mov	r0, r10
	mov	r1, r9
	bl	__aeabi_idivmod
	mov	r10, r1
	vmov.s32	r9, d2[1]
	cmp	r10, r9
	bne	.L270
	mov	r0, #1
	cmp	r0, #0
	b	.L104
	.ltorg
.L270:
	mov	r0, #0
	cmp	r0, #0
	b	.L103
	b	.L104
	.ltorg
.L103:
	vmov.s32	r10, d2[0]
	mov	r0, r10
	mov	r1, #30
	bl	__aeabi_idiv
	mov	r10, r0
	ldr	r9, [r11, #-4]
	ldr	r10, [r9, r10,LSL#2]
	vmov.s32	r9, d2[0]
	mov	r8, #30
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r9, [r0, r9,LSL#2]
	mov	r0, r10
	mov	r1, r9
	bl	__aeabi_idiv
	mov	r10, r0
	mov	r9, #2
	mov	r0, r10
	mov	r1, r9
	bl	__aeabi_idivmod
	mov	r10, r1
	cmp	r10, #0
	beq	.L120
	b	.L121
	.ltorg
.L120:
	vmov.s32	r10, d2[1]
	cmp	r10, #1
	beq	.L137
	b	.L121
	.ltorg
.L137:
	vmov.s32	r10, d2[0]
	mov	r9, #30
	mov	r0, r10
	mov	r1, r9
	bl	__aeabi_idivmod
	mov	r10, r1
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r10, [r0, r10,LSL#2]
	vmov.s32	d1[1], r10
.L138:
	b	.L121
	.ltorg
.L121:
	vmov.s32	r10, d2[0]
	mov	r0, r10
	mov	r1, #30
	bl	__aeabi_idiv
	mov	r9, r0
	ldr	r8, [r11, #-4]
	ldr	r9, [r8, r9,LSL#2]
	mov	r8, #30
	mov	r0, r10
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r10, r1
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r10, [r0, r10,LSL#2]
	mov	r0, r9
	mov	r1, r10
	bl	__aeabi_idiv
	mov	r10, r0
	mov	r9, #2
	mov	r0, r10
	mov	r1, r9
	bl	__aeabi_idivmod
	mov	r10, r1
	cmp	r10, #1
	beq	.L148
	b	.L104
	.ltorg
.L148:
	vmov.s32	r10, d2[1]
	cmp	r10, #0
	beq	.L165
	b	.L104
	.ltorg
.L165:
	vmov.s32	r10, d1[1]
	vmov.s32	r9, d2[0]
	mov	r8, #30
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r9, [r0, r9,LSL#2]
	sub	r10, r10, r9
	vmov.s32	d1[1], r10
.L166:
.L149:
	b	.L104
	.ltorg
.L104:
	vmov.s32	r10, d2[0]
	mov	r0, r10
	mov	r1, #30
	bl	__aeabi_idiv
	mov	r9, r0
	ldr	r8, [r11, #-4]
	ldr	r9, [r8, r9,LSL#2]
	vmov.s32	r8, d1[1]
	add	r9, r8, r9
	mov	r0, r10
	mov	r1, #30
	bl	__aeabi_idiv
	mov	r10, r0
	ldr	r8, [r11, #-4]
	str	r9, [r8, r10,LSL#2]
	mov		r0, #0
	b	.L4
	.ltorg
.L4:
	add	sp, sp, #132
	vpop.s32	{d0-d2}
	pop	{r8-r10,fp, pc}
	.size	func1, .-func1
	.text
	.align	2
	.global	func2
	.type	func2, %function
func2:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r8-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #4
	movw	r12, #:lower16:var2
	movt	r12, #:upper16:var2
	ldr	r10, [r12, #0]
	mov	r9, #0
	movw	r0, #:lower16:var1
	movt	r0, #:upper16:var1
	ldr	r9, [r0, r9,LSL#2]
	mul	r10, r9, r10
	mov	r9, #1
	movw	r0, #:lower16:var1
	movt	r0, #:upper16:var1
	ldr	r9, [r0, r9,LSL#2]
	add	r10, r9, r10
	movw	r0, #:lower16:var2
	movt	r0, #:upper16:var2
	str	r10, [r0, #0]
	movw	r12, #:lower16:var2
	movt	r12, #:upper16:var2
	ldr	r10, [r12, #0]
	mov	r9, #2
	movw	r0, #:lower16:var1
	movt	r0, #:upper16:var1
	ldr	r9, [r0, r9,LSL#2]
	mov	r0, r10
	mov	r1, r9
	bl	__aeabi_idivmod
	mov	r10, r1
	movw	r0, #:lower16:var2
	movt	r0, #:upper16:var2
	str	r10, [r0, #0]
	movw	r12, #:lower16:var2
	movt	r12, #:upper16:var2
	ldr	r10, [r12, #0]
	cmp	r10, #0
	blt	.L271
	mov	r0, #1
	cmp	r0, #0
	b	.L208
	.ltorg
.L271:
	mov	r0, #0
	cmp	r0, #0
	b	.L207
	b	.L208
	.ltorg
.L207:
	mov	r10, #2
	movw	r0, #:lower16:var1
	movt	r0, #:upper16:var1
	ldr	r10, [r0, r10,LSL#2]
	movw	r12, #:lower16:var2
	movt	r12, #:upper16:var2
	ldr	r9, [r12, #0]
	add	r10, r9, r10
	movw	r0, #:lower16:var2
	movt	r0, #:upper16:var2
	str	r10, [r0, #0]
	b	.L208
	.ltorg
.L208:
	movw	r12, #:lower16:var2
	movt	r12, #:upper16:var2
	ldr	r10, [r12, #0]
	mov		r0, r10
	b	.L191
	.ltorg
.L191:
	add	sp, sp, #4
	pop	{r8-r10,fp, pc}
	.size	func2, .-func2
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4-r10,fp, lr}
	vpush.s32	{d0-d5}
	add	fp, sp, #0
	sub	sp, sp, #132
	bl	getint
	mov	r10, r0
	bl	getint
	mov	r9, r0
	movw	r0, #:lower16:var2
	movt	r0, #:upper16:var2
	str	r9, [r0, #0]
	bl	_sysy_starttime(PLT)
	mov	r12, r0
	vmov.s32	d2[1], r10
	b	.L222
	.ltorg
.L222:
	vmov.s32	r10, d2[1]
	cmp	r10, #0
	bgt	.L272
	mov	r0, #1
	cmp	r0, #0
	b	.L224
	.ltorg
.L272:
	mov	r0, #0
	cmp	r0, #0
	b	.L223
	b	.L224
	.ltorg
.L223:
	vmov.s32	r10, d2[1]
	sub	r10, r10, #1
	movw	r12, #:lower16:var2
	movt	r12, #:upper16:var2
	ldr	r9, [r12, #0]
	mov	r8, #0
	movw	r0, #:lower16:var1
	movt	r0, #:upper16:var1
	ldr	r8, [r0, r8,LSL#2]
	mul	r9, r8, r9
	mov	r8, #1
	movw	r0, #:lower16:var1
	movt	r0, #:upper16:var1
	ldr	r8, [r0, r8,LSL#2]
	add	r9, r8, r9
	movw	r0, #:lower16:var2
	movt	r0, #:upper16:var2
	str	r9, [r0, #0]
	movw	r12, #:lower16:var2
	movt	r12, #:upper16:var2
	ldr	r9, [r12, #0]
	mov	r8, #2
	movw	r0, #:lower16:var1
	movt	r0, #:upper16:var1
	ldr	r8, [r0, r8,LSL#2]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	movw	r0, #:lower16:var2
	movt	r0, #:upper16:var2
	str	r9, [r0, #0]
	movw	r12, #:lower16:var2
	movt	r12, #:upper16:var2
	ldr	r9, [r12, #0]
	cmp	r9, #0
	blt	.L273
	mov	r0, #1
	cmp	r0, #0
	b	.L247
	.ltorg
.L273:
	mov	r0, #0
	cmp	r0, #0
	b	.L246
	b	.L247
	.ltorg
.L246:
	mov	r9, #2
	movw	r0, #:lower16:var1
	movt	r0, #:upper16:var1
	ldr	r9, [r0, r9,LSL#2]
	movw	r12, #:lower16:var2
	movt	r12, #:upper16:var2
	ldr	r8, [r12, #0]
	add	r9, r8, r9
	movw	r0, #:lower16:var2
	movt	r0, #:upper16:var2
	str	r9, [r0, #0]
	b	.L247
	.ltorg
.L247:
	movw	r12, #:lower16:var2
	movt	r12, #:upper16:var2
	ldr	r9, [r12, #0]
	vmov.s32	d5[1], r9
	b	.L248
	.ltorg
.L248:
	vmov.s32	r9, d5[1]
	mov	r8, #37856
	movt	r8, #4
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	movw	r12, #:lower16:var2
	movt	r12, #:upper16:var2
	ldr	r8, [r12, #0]
	mov	r7, #0
	movw	r0, #:lower16:var1
	movt	r0, #:upper16:var1
	ldr	r7, [r0, r7,LSL#2]
	mul	r8, r7, r8
	mov	r7, #1
	movw	r0, #:lower16:var1
	movt	r0, #:upper16:var1
	ldr	r7, [r0, r7,LSL#2]
	add	r8, r7, r8
	movw	r0, #:lower16:var2
	movt	r0, #:upper16:var2
	str	r8, [r0, #0]
	movw	r12, #:lower16:var2
	movt	r12, #:upper16:var2
	ldr	r8, [r12, #0]
	mov	r7, #2
	movw	r0, #:lower16:var1
	movt	r0, #:upper16:var1
	ldr	r7, [r0, r7,LSL#2]
	mov	r0, r8
	mov	r1, r7
	bl	__aeabi_idivmod
	mov	r8, r1
	movw	r0, #:lower16:var2
	movt	r0, #:upper16:var2
	str	r8, [r0, #0]
	movw	r12, #:lower16:var2
	movt	r12, #:upper16:var2
	ldr	r8, [r12, #0]
	cmp	r8, #0
	blt	.L274
	mov	r0, #1
	cmp	r0, #0
	b	.L250
	.ltorg
.L274:
	mov	r0, #0
	cmp	r0, #0
	b	.L249
	b	.L250
	.ltorg
.L249:
	mov	r8, #2
	movw	r0, #:lower16:var1
	movt	r0, #:upper16:var1
	ldr	r8, [r0, r8,LSL#2]
	movw	r12, #:lower16:var2
	movt	r12, #:upper16:var2
	ldr	r7, [r12, #0]
	add	r8, r7, r8
	movw	r0, #:lower16:var2
	movt	r0, #:upper16:var2
	str	r8, [r0, #0]
	b	.L250
	.ltorg
.L250:
	movw	r12, #:lower16:var2
	movt	r12, #:upper16:var2
	ldr	r8, [r12, #0]
	vmov.s32	d5[1], r8
	b	.L251
	.ltorg
.L251:
	vmov.s32	r8, d5[1]
	mov	r7, #2
	mov	r0, r8
	mov	r1, r7
	bl	__aeabi_idivmod
	mov	r8, r1
	movw	r7, #:lower16:var3
	movt	r7, #:upper16:var3
	vmov.s32	d5[0], r7
	vmov.s32	d4[0], r9
	vmov.s32	d4[1], r8
	mov	r7, #0
	mov	r1, r7
	mov	r7, #124
	mov	r2, r7
	mov	r7, #65404
	movt	r7, #65535
	add	r7, fp, r7
	mov	r0, r7
	bl	memset(PLT)
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	mov	r12, #0
	str	r12, [r0, #0]
	str	r12, [r0, #4]
	str	r12, [r0, #8]
	str	r12, [r0, #12]
	str	r12, [r0, #16]
	str	r12, [r0, #20]
	str	r12, [r0, #24]
	str	r12, [r0, #28]
	str	r12, [r0, #32]
	str	r12, [r0, #36]
	str	r12, [r0, #40]
	str	r12, [r0, #44]
	str	r12, [r0, #48]
	str	r12, [r0, #52]
	str	r12, [r0, #56]
	str	r12, [r0, #60]
	str	r12, [r0, #64]
	str	r12, [r0, #68]
	str	r12, [r0, #72]
	str	r12, [r0, #76]
	str	r12, [r0, #80]
	str	r12, [r0, #84]
	str	r12, [r0, #88]
	str	r12, [r0, #92]
	str	r12, [r0, #96]
	str	r12, [r0, #100]
	str	r12, [r0, #104]
	str	r12, [r0, #108]
	str	r12, [r0, #112]
	str	r12, [r0, #116]
	str	r12, [r0, #120]
	mov	r7, #0
	mov	r6, #1
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	str	r6, [r0, r7,LSL#2]
	mov	r7, #0
	mov	r0, #65404
	movt	r0, #65535
	b	.L280
	.ltorg
.L280:
	add	r0, r0, r11
	ldr	r7, [r0, r7,LSL#2]
	mov	r7, r7,LSL#1
	mov	r6, #1
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	str	r7, [r0, r6,LSL#2]
	mov	r7, #1
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r7, [r0, r7,LSL#2]
	mov	r7, r7,LSL#1
	mov	r6, #2
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	str	r7, [r0, r6,LSL#2]
	mov	r7, #2
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r7, [r0, r7,LSL#2]
	mov	r7, r7,LSL#1
	mov	r6, #3
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	str	r7, [r0, r6,LSL#2]
	mov	r7, #3
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r7, [r0, r7,LSL#2]
	mov	r7, r7,LSL#1
	mov	r6, #4
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	str	r7, [r0, r6,LSL#2]
	mov	r7, #4
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r7, [r0, r7,LSL#2]
	mov	r7, r7,LSL#1
	mov	r6, #5
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	str	r7, [r0, r6,LSL#2]
	mov	r7, #5
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r7, [r0, r7,LSL#2]
	mov	r7, r7,LSL#1
	mov	r6, #6
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	str	r7, [r0, r6,LSL#2]
	mov	r7, #6
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r7, [r0, r7,LSL#2]
	mov	r7, r7,LSL#1
	mov	r6, #7
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	b	.L281
	.ltorg
.L281:
	str	r7, [r0, r6,LSL#2]
	mov	r7, #7
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r7, [r0, r7,LSL#2]
	mov	r7, r7,LSL#1
	mov	r6, #8
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	str	r7, [r0, r6,LSL#2]
	mov	r7, #8
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r7, [r0, r7,LSL#2]
	mov	r7, r7,LSL#1
	mov	r6, #9
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	str	r7, [r0, r6,LSL#2]
	mov	r7, #9
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r7, [r0, r7,LSL#2]
	mov	r7, r7,LSL#1
	mov	r6, #10
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	str	r7, [r0, r6,LSL#2]
	mov	r7, #10
	vmov.s32	d1[0], r7
	b	.L252
	.ltorg
.L252:
	vmov.s32	r7, d1[0]
	cmp	r7, #30
	blt	.L275
	mov	r0, #1
	cmp	r0, #0
	b	.L254
	.ltorg
.L275:
	mov	r0, #0
	cmp	r0, #0
	b	.L253
	b	.L254
	.ltorg
.L253:
	vmov.s32	r7, d1[0]
	add	r7, r7, #1
	sub	r6, r7, #1
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r6, [r0, r6,LSL#2]
	mov	r6, r6,LSL#1
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	str	r6, [r0, r7,LSL#2]
	vmov.s32	d1[0], r7
	b	.L252
	.ltorg
.L254:
	vmov.s32	r7, d4[0]
	mov	r0, r7
	mov	r1, #30
	bl	__aeabi_idiv
	mov	r7, r0
	mov	r6, #10000
	cmp	r7, r6
	bge	.L276
	mov	r7, #0
	vmov.s32	d3[1], r7
	mov	r7, #0
	vmov.s32	d3[1], r7
	mov	r0, #1
	cmp	r0, #0
	b	.L256
	.ltorg
.L276:
	mov	r0, #0
	cmp	r0, #0
	b	.L255
	b	.L256
	.ltorg
.L255:
	mov	r7, #0
	vmov.s32	d3[0], r7
	b	.L257
	.ltorg
.L256:
	vmov.s32	r7, d4[0]
	mov	r0, r7
	mov	r1, #30
	bl	__aeabi_idiv
	mov	r7, r0
	vmov.s32	r6, d5[0]
	ldr	r7, [r6, r7,LSL#2]
	vmov.s32	r6, d4[0]
	mov	r5, #30
	mov	r0, r6
	mov	r1, r5
	bl	__aeabi_idivmod
	mov	r6, r1
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r6, [r0, r6,LSL#2]
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idiv
	mov	r7, r0
	mov	r6, #2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r7, r1
	vmov.s32	r6, d4[1]
	cmp	r7, r6
	bne	.L277
	mov	r0, #1
	cmp	r0, #0
	b	.L259
	.ltorg
.L277:
	mov	r0, #0
	cmp	r0, #0
	b	.L258
	b	.L259
	.ltorg
.L258:
	vmov.s32	r7, d4[0]
	mov	r0, r7
	mov	r1, #30
	bl	__aeabi_idiv
	mov	r7, r0
	vmov.s32	r6, d5[0]
	ldr	r7, [r6, r7,LSL#2]
	vmov.s32	r6, d4[0]
	mov	r5, #30
	mov	r0, r6
	mov	r1, r5
	bl	__aeabi_idivmod
	mov	r6, r1
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r6, [r0, r6,LSL#2]
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idiv
	mov	r7, r0
	mov	r6, #2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r7, r1
	cmp	r7, #0
	beq	.L260
	b	.L261
	.ltorg
.L260:
	vmov.s32	r7, d4[1]
	cmp	r7, #1
	beq	.L262
	b	.L261
	.ltorg
.L262:
	vmov.s32	r7, d4[0]
	mov	r6, #30
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r7, r1
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r7, [r0, r7,LSL#2]
	vmov.s32	d3[1], r7
.L263:
	b	.L261
	.ltorg
.L261:
	vmov.s32	r7, d4[0]
	mov	r0, r7
	mov	r1, #30
	bl	__aeabi_idiv
	mov	r6, r0
	vmov.s32	r5, d5[0]
	ldr	r6, [r5, r6,LSL#2]
	mov	r5, #30
	mov	r0, r7
	mov	r1, r5
	bl	__aeabi_idivmod
	mov	r7, r1
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r7, [r0, r7,LSL#2]
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_idiv
	mov	r7, r0
	mov	r6, #2
	mov	r0, r7
	mov	r1, r6
	bl	__aeabi_idivmod
	mov	r7, r1
	cmp	r7, #1
	beq	.L264
	b	.L259
	.ltorg
.L264:
	vmov.s32	r7, d4[1]
	cmp	r7, #0
	beq	.L265
	b	.L259
	.ltorg
.L265:
	vmov.s32	r7, d3[1]
	vmov.s32	r6, d4[0]
	mov	r5, #30
	mov	r0, r6
	mov	r1, r5
	bl	__aeabi_idivmod
	mov	r6, r1
	mov	r0, #65404
	movt	r0, #65535
	add	r0, r0, r11
	ldr	r6, [r0, r6,LSL#2]
	sub	r7, r7, r6
	vmov.s32	d3[1], r7
.L266:
.L267:
	b	.L259
	.ltorg
.L259:
	vmov.s32	r7, d4[0]
	mov	r0, r7
	mov	r1, #30
	bl	__aeabi_idiv
	mov	r6, r0
	vmov.s32	r5, d5[0]
	ldr	r6, [r5, r6,LSL#2]
	vmov.s32	r5, d3[1]
	add	r6, r5, r6
	mov	r0, r7
	mov	r1, #30
	bl	__aeabi_idiv
	mov	r7, r0
	vmov.s32	r5, d5[0]
	str	r6, [r5, r7,LSL#2]
	mov	r7, #0
	vmov.s32	d3[0], r7
	b	.L257
	.ltorg
.L257:
	vmov.s32	d2[1], r10
	vmov.s32	d2[0], r9
	vmov.s32	d1[1], r8
	b	.L222
	.ltorg
.L224:
	bl	_sysy_stoptime(PLT)
	mov	r12, r0
	movw	r1, #:lower16:var3
	movt	r1, #:upper16:var3
	mov	r10, #10000
	mov	r0, r10
	bl	putarray
	mov		r0, #0
	b	.L218
	.ltorg
.L218:
	add	sp, sp, #132
	vpop.s32	{d0-d5}
	pop	{r4-r10,fp, pc}
	.size	main, .-main
	.section .note.GNU-stack,"",%progbits
