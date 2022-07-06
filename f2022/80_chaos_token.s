	.global	__HELLO
	.data
	.align	2
	.type	__HELLO, %object
	.size	__HELLO, 400
__HELLO:
	.word	87
	.word	101
	.word	108
	.word	99
	.word	111
	.word	109
	.word	101
	.word	32
	.word	116
	.word	111
	.word	32
	.word	116
	.word	104
	.word	101
	.word	32
	.word	74
	.word	97
	.word	112
	.word	97
	.word	114
	.word	105
	.word	32
	.word	80
	.word	97
	.word	114
	.word	107
	.word	33
	.word	10
	.space	288
	.global	N4__mE___
	.data
	.align	2
	.type	N4__mE___, %object
	.size	N4__mE___, 1200
N4__mE___:
	.word	83
	.word	97
	.word	97
	.word	98
	.word	97
	.word	114
	.word	117
	.space	180
	.word	75
	.word	97
	.word	98
	.word	97
	.word	110
	.space	188
	.word	72
	.word	97
	.word	115
	.word	104
	.word	105
	.word	98
	.word	105
	.word	114
	.word	111
	.word	107
	.word	111
	.word	117
	.space	160
	.word	65
	.word	114
	.word	97
	.word	105
	.word	103
	.word	117
	.word	109
	.word	97
	.space	176
	.word	72
	.word	117
	.word	110
	.word	98
	.word	111
	.word	114
	.word	117
	.word	116
	.word	111
	.word	32
	.word	80
	.word	101
	.word	110
	.word	103
	.word	105
	.word	110
	.space	144
	.word	84
	.word	97
	.word	105
	.word	114
	.word	105
	.word	107
	.word	117
	.word	32
	.word	79
	.word	111
	.word	107
	.word	97
	.word	109
	.word	105
	.space	144
	.global	saY_HeI10_
	.data
	.align	2
	.type	saY_HeI10_, %object
	.size	saY_HeI10_, 160
saY_HeI10_:
	.word	32
	.word	115
	.word	97
	.word	121
	.word	115
	.word	32
	.word	104
	.word	101
	.word	108
	.word	108
	.word	111
	.word	32
	.word	116
	.word	111
	.word	32
	.space	100
	.global	RET
	.data
	.align	2
	.type	RET, %object
	.size	RET, 20
RET:
	.word	10
	.space	16

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	putstr
	.type	putstr, %function
putstr:
	@ args = 0, pretend = 0, frame = 36
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #40
	str	r0, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]

.L5:
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	cmp	r9, #0
	bne	.L46
	ldr	r10, =1
	cmp	r10, #0
	b	.L7

.L46:
	ldr	r10, =0
	cmp	r10, #0
	b	.L6
	b	.L7

.L6:
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	mov	r0, r9
	bl	putch
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L5

.L7:
	ldr	r9, [fp, #-20]
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	putstr, .-putstr

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 76
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #80
	movw	r12, #:lower16:__HELLO
	movt	r12, #:upper16:__HELLO
	movw	r0, #:lower16:__HELLO
	movt	r0, #:upper16:__HELLO
	bl	putstr
	mov	r12, r0
	ldr	r9, =0
	str	r9, [fp, #-16]

.L15:
	ldr	r9, =1
	cmp	r9, #0
	bne	.L47
	ldr	r10, =1
	cmp	r10, #0
	b	.L17

.L47:
	ldr	r10, =0
	cmp	r10, #0
	b	.L16
	b	.L17

.L16:
	ldr	r9, [fp, #-16]
	ldr	r8, =6
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-16]
	ldr	r8, =6
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-24]
	cmp	r9, r8
	bne	.L48
	ldr	r10, =1
	cmp	r10, #0
	b	.L25

.L48:
	ldr	r10, =0
	cmp	r10, #0
	b	.L24
	b	.L25

.L24:
	ldr	r9, [fp, #-20]
	ldr	r8, =0
	ldr	r7, =50
	mul	r9, r9, r7
	add	r9, r9, r8
	movw	r10, #:lower16:N4__mE___
	movt	r10, #:upper16:N4__mE___
	ldr	r9,	[r10, r9,LSL#2]
	mov	r0, r9
	bl	putstr
	mov	r12, r0
	movw	r12, #:lower16:saY_HeI10_
	movt	r12, #:upper16:saY_HeI10_
	movw	r0, #:lower16:saY_HeI10_
	movt	r0, #:upper16:saY_HeI10_
	bl	putstr
	mov	r12, r0
	ldr	r9, [fp, #-24]
	ldr	r8, =0
	ldr	r7, =50
	mul	r9, r9, r7
	add	r9, r9, r8
	movw	r10, #:lower16:N4__mE___
	movt	r10, #:upper16:N4__mE___
	ldr	r9,	[r10, r9,LSL#2]
	mov	r0, r9
	bl	putstr
	mov	r12, r0
	movw	r12, #:lower16:RET
	movt	r12, #:upper16:RET
	movw	r0, #:lower16:RET
	movt	r0, #:upper16:RET
	bl	putstr
	mov	r12, r0

.L25:
	ldr	r9, [fp, #-16]
	ldr	r8, =17
	mul	r9, r8, r9
	ldr	r8, =23
	add	r9, r8, r9
	ldr	r8, =32
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	ldr	r8, =0
	cmp	r9, r8
	beq	.L41
	b	.L42

.L41:
	b	.L17

.L42:
	b	.L15

.L17:
	ldr	r9, =0
	mov	r0, r9
	b	.L14

.L14:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
