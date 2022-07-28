	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"test.c"
	.text
	.align	1
	.global	func1
	.arch armv7-a
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	func1, %function
func1:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	r0, r3
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	func1, .-func1
	.global	a
	.data
	.align	2
	.type	a, %object
	.size	a, 4
a:
	.word	6
	.global	b
	.align	2
	.type	b, %object
	.size	b, 4
b:
	.word	7
	.global	c
	.align	2
	.type	c, %object
	.size	c, 4
c:
	.word	8
	.global	d
	.align	2
	.type	d, %object
	.size	d, 4
d:
	.word	9
	.global	e
	.align	2
	.type	e, %object
	.size	e, 4
e:
	.word	10
	.text
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 928
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #928
	add	r7, sp, #0
	ldr	r2, .L5
.LPIC0:
	add	r2, pc
	ldr	r3, .L5+4
	ldr	r3, [r2, r3]
	ldr	r3, [r3]
	str	r3, [r7, #924]
	mov	r3,#0
	adds	r3, r7, #4
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #524
	mov	r0, r3
	movs	r3, #40
	mov	r2, r3
	movs	r1, #0
	bl	memset(PLT)
	add	r3, r7, #524
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #284
	mov	r2, r3
	movs	r3, #0
	str	r3, [r2]
	str	r3, [r2, #4]
	str	r3, [r2, #8]
	str	r3, [r2, #12]
	str	r3, [r2, #16]
	str	r3, [r2, #20]
	add	r3, r7, #284
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #8
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #12
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #16
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #20
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #24
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #28
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #32
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #564
	mov	r0, r3
	movs	r3, #40
	mov	r2, r3
	movs	r1, #0
	bl	memset(PLT)
	add	r3, r7, #564
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #308
	mov	r2, r3
	movs	r3, #0
	str	r3, [r2]
	str	r3, [r2, #4]
	str	r3, [r2, #8]
	str	r3, [r2, #12]
	str	r3, [r2, #16]
	str	r3, [r2, #20]
	add	r3, r7, #308
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #36
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #40
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #44
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #48
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #52
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #56
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #60
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #604
	mov	r0, r3
	movs	r3, #40
	mov	r2, r3
	movs	r1, #0
	bl	memset(PLT)
	add	r3, r7, #604
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #332
	mov	r2, r3
	movs	r3, #0
	str	r3, [r2]
	str	r3, [r2, #4]
	str	r3, [r2, #8]
	str	r3, [r2, #12]
	str	r3, [r2, #16]
	str	r3, [r2, #20]
	add	r3, r7, #332
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #64
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #68
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #72
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #76
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #80
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #84
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #88
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #644
	mov	r0, r3
	movs	r3, #40
	mov	r2, r3
	movs	r1, #0
	bl	memset(PLT)
	add	r3, r7, #644
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #356
	mov	r2, r3
	movs	r3, #0
	str	r3, [r2]
	str	r3, [r2, #4]
	str	r3, [r2, #8]
	str	r3, [r2, #12]
	str	r3, [r2, #16]
	str	r3, [r2, #20]
	add	r3, r7, #356
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #92
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #96
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #100
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #104
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #108
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #112
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #116
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #684
	movs	r2, #40
	movs	r1, #0
	mov	r0, r3
	bl	memset(PLT)
	movs	r3, #1
	str	r3, [r7, #684]
	add	r3, r7, #380
	mov	r2, r3
	movs	r3, #0
	str	r3, [r2]
	str	r3, [r2, #4]
	str	r3, [r2, #8]
	str	r3, [r2, #12]
	str	r3, [r2, #16]
	str	r3, [r2, #20]
	add	r3, r7, #380
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #120
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #124
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #128
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #132
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #136
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #140
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #144
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #724
	movs	r2, #40
	movs	r1, #0
	mov	r0, r3
	bl	memset(PLT)
	movs	r3, #1
	str	r3, [r7, #724]
	add	r3, r7, #404
	mov	r2, r3
	movs	r3, #0
	str	r3, [r2]
	str	r3, [r2, #4]
	str	r3, [r2, #8]
	str	r3, [r2, #12]
	str	r3, [r2, #16]
	str	r3, [r2, #20]
	add	r3, r7, #404
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #148
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #152
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #156
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #160
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #164
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #168
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #172
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #764
	movs	r2, #40
	movs	r1, #0
	mov	r0, r3
	bl	memset(PLT)
	movs	r3, #1
	str	r3, [r7, #764]
	add	r3, r7, #428
	mov	r2, r3
	movs	r3, #0
	str	r3, [r2]
	str	r3, [r2, #4]
	str	r3, [r2, #8]
	str	r3, [r2, #12]
	str	r3, [r2, #16]
	str	r3, [r2, #20]
	add	r3, r7, #428
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #176
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #180
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #184
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #188
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #192
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #196
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #200
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #804
	movs	r2, #40
	movs	r1, #0
	mov	r0, r3
	bl	memset(PLT)
	movs	r3, #1
	str	r3, [r7, #804]
	add	r3, r7, #452
	mov	r2, r3
	movs	r3, #0
	str	r3, [r2]
	str	r3, [r2, #4]
	str	r3, [r2, #8]
	str	r3, [r2, #12]
	str	r3, [r2, #16]
	str	r3, [r2, #20]
	add	r3, r7, #452
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #204
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #208
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #212
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #216
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #220
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #224
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #228
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #844
	movs	r2, #40
	movs	r1, #0
	mov	r0, r3
	bl	memset(PLT)
	movs	r3, #1
	str	r3, [r7, #844]
	add	r3, r7, #476
	mov	r2, r3
	movs	r3, #0
	str	r3, [r2]
	str	r3, [r2, #4]
	str	r3, [r2, #8]
	str	r3, [r2, #12]
	str	r3, [r2, #16]
	str	r3, [r2, #20]
	add	r3, r7, #476
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #232
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #236
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #240
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #244
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #248
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #252
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #256
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #884
	movs	r2, #40
	movs	r1, #0
	mov	r0, r3
	bl	memset(PLT)
	movs	r3, #1
	str	r3, [r7, #884]
	add	r3, r7, #500
	mov	r2, r3
	movs	r3, #0
	str	r3, [r2]
	str	r3, [r2, #4]
	str	r3, [r2, #8]
	str	r3, [r2, #12]
	str	r3, [r2, #16]
	str	r3, [r2, #20]
	add	r3, r7, #500
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #260
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #264
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #268
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #272
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #276
	movs	r2, #1
	str	r2, [r3]
	add	r3, r7, #280
	movs	r2, #1
	str	r2, [r3]
	movs	r3, #0
	ldr	r1, .L5+8
.LPIC1:
	add	r1, pc
	ldr	r2, .L5+4
	ldr	r2, [r1, r2]
	ldr	r1, [r2]
	ldr	r2, [r7, #924]
	eors	r1, r2, r1
	mov	r2, #0
	beq	.L4
	bl	__stack_chk_fail(PLT)
.L4:
	mov	r0, r3
	add	r7, r7, #928
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L6:
	.align	2
.L5:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC0+4)
	.word	__stack_chk_guard(GOT)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC1+4)
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",%progbits
