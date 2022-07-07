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
	.global	a
	.data
	.align	2
	.type	a, %object
	.size	a, 4
a:
	.word	1
	.global	b
	.bss
	.align	2
	.type	b, %object
	.size	b, 4
b:
	.space	4
	.global	c
	.data
	.align	2
	.type	c, %object
	.size	c, 4
c:
	.word	1
	.global	d
	.align	2
	.type	d, %object
	.size	d, 4
d:
	.word	2
	.global	e
	.align	2
	.type	e, %object
	.size	e, 4
e:
	.word	4
	.global	__aeabi_idiv
	.text
	.align	1
	.global	main
	.arch armv7-a
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	movs	r3, #0
	str	r3, [r7, #4]
	ldr	r3, .L6
.LPIC0:
	add	r3, pc
	ldr	r3, [r3]
	ldr	r2, .L6+4
.LPIC1:
	add	r2, pc
	ldr	r2, [r2]
	mul	r3, r2, r3
	ldr	r2, .L6+8
.LPIC2:
	add	r2, pc
	ldr	r2, [r2]
	mov	r1, r2
	mov	r0, r3
	bl	__aeabi_idiv(PLT)
	mov	r3, r0
	mov	r1, r3
	ldr	r3, .L6+12
.LPIC3:
	add	r3, pc
	ldr	r2, [r3]
	ldr	r3, .L6+16
.LPIC4:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	cmp	r1, r3
	bne	.L2
	ldr	r3, .L6+20
.LPIC5:
	add	r3, pc
	ldr	r2, [r3]
	ldr	r3, .L6+24
.LPIC6:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	ldr	r2, .L6+28
.LPIC7:
	add	r2, pc
	ldr	r2, [r2]
	mul	r2, r2, r3
	ldr	r3, .L6+32
.LPIC8:
	add	r3, pc
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r3, .L6+36
.LPIC9:
	add	r3, pc
	ldr	r1, [r3]
	ldr	r3, .L6+40
.LPIC10:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r1
	cmp	r2, r3
	ble	.L3
.L2:
	ldr	r3, .L6+44
.LPIC11:
	add	r3, pc
	ldr	r2, [r3]
	ldr	r3, .L6+48
.LPIC12:
	add	r3, pc
	ldr	r3, [r3]
	ldr	r1, .L6+52
.LPIC13:
	add	r1, pc
	ldr	r1, [r1]
	mul	r3, r1, r3
	subs	r4, r2, r3
	ldr	r3, .L6+56
.LPIC14:
	add	r3, pc
	ldr	r5, [r3]
	ldr	r3, .L6+60
.LPIC15:
	add	r3, pc
	ldr	r3, [r3]
	ldr	r2, .L6+64
.LPIC16:
	add	r2, pc
	ldr	r2, [r2]
	mov	r1, r2
	mov	r0, r3
	bl	__aeabi_idiv(PLT)
	mov	r3, r0
	subs	r3, r5, r3
	cmp	r4, r3
	bne	.L4
.L3:
	movs	r3, #1
	str	r3, [r7, #4]
.L4:
	ldr	r0, [r7, #4]
	bl	putint(PLT)
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r4, r5, r7, pc}
.L7:
	.align	2
.L6:
	.word	a-(.LPIC0+4)
	.word	b-(.LPIC1+4)
	.word	c-(.LPIC2+4)
	.word	e-(.LPIC3+4)
	.word	d-(.LPIC4+4)
	.word	a-(.LPIC5+4)
	.word	b-(.LPIC6+4)
	.word	a-(.LPIC7+4)
	.word	c-(.LPIC8+4)
	.word	d-(.LPIC9+4)
	.word	e-(.LPIC10+4)
	.word	a-(.LPIC11+4)
	.word	b-(.LPIC12+4)
	.word	c-(.LPIC13+4)
	.word	d-(.LPIC14+4)
	.word	a-(.LPIC15+4)
	.word	c-(.LPIC16+4)
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",%progbits
