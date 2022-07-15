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
	.global	a1
	.data
	.align	2
	.type	a1, %object
	.size	a1, 4
a1:
	.word	1
	.global	a2
	.align	2
	.type	a2, %object
	.size	a2, 4
a2:
	.word	2
	.global	a3
	.align	2
	.type	a3, %object
	.size	a3, 4
a3:
	.word	3
	.global	a4
	.align	2
	.type	a4, %object
	.size	a4, 4
a4:
	.word	4
	.global	a5
	.align	2
	.type	a5, %object
	.size	a5, 4
a5:
	.word	5
	.global	a6
	.align	2
	.type	a6, %object
	.size	a6, 4
a6:
	.word	6
	.global	a7
	.align	2
	.type	a7, %object
	.size	a7, 4
a7:
	.word	7
	.global	a8
	.align	2
	.type	a8, %object
	.size	a8, 4
a8:
	.word	8
	.global	a9
	.align	2
	.type	a9, %object
	.size	a9, 4
a9:
	.word	9
	.global	a10
	.align	2
	.type	a10, %object
	.size	a10, 4
a10:
	.word	10
	.global	a11
	.align	2
	.type	a11, %object
	.size	a11, 4
a11:
	.word	11
	.global	a12
	.align	2
	.type	a12, %object
	.size	a12, 4
a12:
	.word	12
	.global	a13
	.align	2
	.type	a13, %object
	.size	a13, 4
a13:
	.word	13
	.global	a14
	.align	2
	.type	a14, %object
	.size	a14, 4
a14:
	.word	14
	.global	a15
	.align	2
	.type	a15, %object
	.size	a15, 4
a15:
	.word	15
	.global	a16
	.align	2
	.type	a16, %object
	.size	a16, 4
a16:
	.word	16
	.global	a17
	.align	2
	.type	a17, %object
	.size	a17, 4
a17:
	.word	1
	.global	a18
	.align	2
	.type	a18, %object
	.size	a18, 4
a18:
	.word	2
	.global	a19
	.align	2
	.type	a19, %object
	.size	a19, 4
a19:
	.word	3
	.global	a20
	.align	2
	.type	a20, %object
	.size	a20, 4
a20:
	.word	4
	.global	a21
	.align	2
	.type	a21, %object
	.size	a21, 4
a21:
	.word	5
	.global	a22
	.align	2
	.type	a22, %object
	.size	a22, 4
a22:
	.word	6
	.global	a23
	.align	2
	.type	a23, %object
	.size	a23, 4
a23:
	.word	7
	.global	a24
	.align	2
	.type	a24, %object
	.size	a24, 4
a24:
	.word	8
	.global	a25
	.align	2
	.type	a25, %object
	.size	a25, 4
a25:
	.word	9
	.global	a26
	.align	2
	.type	a26, %object
	.size	a26, 4
a26:
	.word	10
	.global	a27
	.align	2
	.type	a27, %object
	.size	a27, 4
a27:
	.word	11
	.global	a28
	.align	2
	.type	a28, %object
	.size	a28, 4
a28:
	.word	12
	.global	a29
	.align	2
	.type	a29, %object
	.size	a29, 4
a29:
	.word	13
	.global	a30
	.align	2
	.type	a30, %object
	.size	a30, 4
a30:
	.word	14
	.global	a31
	.align	2
	.type	a31, %object
	.size	a31, 4
a31:
	.word	15
	.global	a32
	.align	2
	.type	a32, %object
	.size	a32, 4
a32:
	.word	16
	.text
	.align	1
	.global	func
	.arch armv7-a
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	func, %function
func:
	@ args = 0, pretend = 0, frame = 160
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #160
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r2, [r7, #4]
	ldr	r3, [r7]
	add	r3, r3, r2
	str	r3, [r7, #12]
	bl	getint(PLT)
	str	r0, [r7, #16]
	bl	getint(PLT)
	str	r0, [r7, #20]
	bl	getint(PLT)
	str	r0, [r7, #24]
	bl	getint(PLT)
	str	r0, [r7, #28]
	ldr	r3, [r7, #16]
	adds	r2, r3, #1
	ldr	r3, .L2
.LPIC0:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #32]
	ldr	r3, [r7, #20]
	adds	r2, r3, #2
	ldr	r3, .L2+4
.LPIC1:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #36]
	ldr	r3, [r7, #24]
	adds	r2, r3, #3
	ldr	r3, .L2+8
.LPIC2:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #40]
	ldr	r3, [r7, #28]
	adds	r2, r3, #4
	ldr	r3, .L2+12
.LPIC3:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #44]
	ldr	r3, [r7, #32]
	adds	r2, r3, #1
	ldr	r3, .L2+16
.LPIC4:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #48]
	ldr	r3, [r7, #36]
	adds	r2, r3, #2
	ldr	r3, .L2+20
.LPIC5:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #52]
	ldr	r3, [r7, #40]
	adds	r2, r3, #3
	ldr	r3, .L2+24
.LPIC6:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #56]
	ldr	r3, [r7, #44]
	adds	r2, r3, #4
	ldr	r3, .L2+28
.LPIC7:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #60]
	ldr	r3, [r7, #48]
	adds	r2, r3, #1
	ldr	r3, .L2+32
.LPIC8:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #64]
	ldr	r3, [r7, #52]
	adds	r2, r3, #2
	ldr	r3, .L2+36
.LPIC9:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #68]
	ldr	r3, [r7, #56]
	adds	r2, r3, #3
	ldr	r3, .L2+40
.LPIC10:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #72]
	ldr	r3, [r7, #60]
	adds	r2, r3, #4
	ldr	r3, .L2+44
.LPIC11:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #76]
	ldr	r3, [r7, #64]
	adds	r2, r3, #1
	ldr	r3, .L2+48
.LPIC12:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #80]
	ldr	r3, [r7, #68]
	adds	r2, r3, #2
	ldr	r3, .L2+52
.LPIC13:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #84]
	ldr	r3, [r7, #72]
	adds	r2, r3, #3
	ldr	r3, .L2+56
.LPIC14:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #88]
	ldr	r3, [r7, #76]
	adds	r2, r3, #4
	ldr	r3, .L2+60
.LPIC15:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #92]
	ldr	r3, [r7, #80]
	adds	r2, r3, #1
	ldr	r3, .L2+64
.LPIC16:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #96]
	ldr	r3, [r7, #84]
	adds	r2, r3, #2
	ldr	r3, .L2+68
.LPIC17:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #100]
	ldr	r3, [r7, #88]
	adds	r2, r3, #3
	ldr	r3, .L2+72
.LPIC18:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #104]
	ldr	r3, [r7, #92]
	adds	r2, r3, #4
	ldr	r3, .L2+76
.LPIC19:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #108]
	ldr	r3, [r7, #96]
	adds	r2, r3, #1
	ldr	r3, .L2+80
.LPIC20:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #112]
	ldr	r3, [r7, #100]
	adds	r2, r3, #2
	ldr	r3, .L2+84
.LPIC21:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #116]
	ldr	r3, [r7, #104]
	adds	r2, r3, #3
	ldr	r3, .L2+88
.LPIC22:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #120]
	ldr	r3, [r7, #108]
	adds	r2, r3, #4
	ldr	r3, .L2+92
.LPIC23:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #124]
	ldr	r3, [r7, #112]
	adds	r2, r3, #1
	ldr	r3, .L2+96
.LPIC24:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #128]
	ldr	r3, [r7, #116]
	adds	r2, r3, #2
	ldr	r3, .L2+100
.LPIC25:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #132]
	ldr	r3, [r7, #120]
	adds	r2, r3, #3
	ldr	r3, .L2+104
.LPIC26:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #136]
	ldr	r3, [r7, #124]
	adds	r2, r3, #4
	ldr	r3, .L2+108
.LPIC27:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #140]
	ldr	r3, [r7, #128]
	adds	r2, r3, #1
	ldr	r3, .L2+112
.LPIC28:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #144]
	ldr	r3, [r7, #132]
	adds	r2, r3, #2
	ldr	r3, .L2+116
.LPIC29:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #148]
	ldr	r3, [r7, #136]
	adds	r2, r3, #3
	ldr	r3, .L2+120
.LPIC30:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #152]
	ldr	r3, [r7, #140]
	adds	r2, r3, #4
	ldr	r3, .L2+124
.LPIC31:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #156]
	ldr	r2, [r7, #4]
	ldr	r3, [r7]
	subs	r3, r2, r3
	adds	r3, r3, #10
	str	r3, [r7, #12]
	ldr	r3, [r7, #128]
	adds	r2, r3, #1
	ldr	r3, .L2+128
.LPIC32:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #144]
	ldr	r3, [r7, #132]
	adds	r2, r3, #2
	ldr	r3, .L2+132
.LPIC33:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #148]
	ldr	r3, [r7, #136]
	adds	r2, r3, #3
	ldr	r3, .L2+136
.LPIC34:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #152]
	ldr	r3, [r7, #140]
	adds	r2, r3, #4
	ldr	r3, .L2+140
.LPIC35:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #156]
	ldr	r3, [r7, #112]
	adds	r2, r3, #1
	ldr	r3, .L2+144
.LPIC36:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #128]
	ldr	r3, [r7, #116]
	adds	r2, r3, #2
	ldr	r3, .L2+148
.LPIC37:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #132]
	ldr	r3, [r7, #120]
	adds	r2, r3, #3
	ldr	r3, .L2+152
.LPIC38:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #136]
	ldr	r3, [r7, #124]
	adds	r2, r3, #4
	ldr	r3, .L2+156
.LPIC39:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #140]
	ldr	r3, [r7, #96]
	adds	r2, r3, #1
	ldr	r3, .L2+160
.LPIC40:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #112]
	ldr	r3, [r7, #100]
	adds	r2, r3, #2
	ldr	r3, .L2+164
.LPIC41:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #116]
	ldr	r3, [r7, #104]
	adds	r2, r3, #3
	ldr	r3, .L2+168
.LPIC42:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #120]
	ldr	r3, [r7, #108]
	adds	r2, r3, #4
	ldr	r3, .L2+172
.LPIC43:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #124]
	ldr	r3, [r7, #80]
	adds	r2, r3, #1
	ldr	r3, .L2+176
.LPIC44:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #96]
	ldr	r3, [r7, #84]
	adds	r2, r3, #2
	ldr	r3, .L2+180
.LPIC45:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #100]
	ldr	r3, [r7, #88]
	adds	r2, r3, #3
	ldr	r3, .L2+184
.LPIC46:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #104]
	ldr	r3, [r7, #92]
	adds	r2, r3, #4
	ldr	r3, .L2+188
.LPIC47:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #108]
	ldr	r3, [r7, #64]
	adds	r2, r3, #1
	ldr	r3, .L2+192
.LPIC48:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #80]
	ldr	r3, [r7, #68]
	adds	r2, r3, #2
	ldr	r3, .L2+196
.LPIC49:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #84]
	ldr	r3, [r7, #72]
	adds	r2, r3, #3
	ldr	r3, .L2+200
.LPIC50:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #88]
	ldr	r3, [r7, #76]
	adds	r2, r3, #4
	ldr	r3, .L2+204
.LPIC51:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #92]
	ldr	r3, [r7, #48]
	adds	r2, r3, #1
	ldr	r3, .L2+208
.LPIC52:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #64]
	ldr	r3, [r7, #52]
	adds	r2, r3, #2
	ldr	r3, .L2+212
.LPIC53:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #68]
	ldr	r3, [r7, #56]
	adds	r2, r3, #3
	ldr	r3, .L2+216
.LPIC54:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #72]
	ldr	r3, [r7, #60]
	adds	r2, r3, #4
	ldr	r3, .L2+220
.LPIC55:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #76]
	ldr	r3, [r7, #32]
	adds	r2, r3, #1
	ldr	r3, .L2+224
.LPIC56:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #48]
	ldr	r3, [r7, #36]
	adds	r2, r3, #2
	ldr	r3, .L2+228
.LPIC57:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #52]
	ldr	r3, [r7, #40]
	adds	r2, r3, #3
	ldr	r3, .L2+232
.LPIC58:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #56]
	ldr	r3, [r7, #44]
	adds	r2, r3, #4
	ldr	r3, .L2+236
.LPIC59:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #60]
	ldr	r3, [r7, #16]
	adds	r2, r3, #1
	ldr	r3, .L2+240
.LPIC60:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #32]
	ldr	r3, [r7, #20]
	adds	r2, r3, #2
	ldr	r3, .L2+244
.LPIC61:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #36]
	ldr	r3, [r7, #24]
	adds	r2, r3, #3
	ldr	r3, .L2+248
.LPIC62:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #40]
	ldr	r3, [r7, #28]
	adds	r2, r3, #4
	ldr	r3, .L2+252
.LPIC63:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #44]
	ldr	r3, [r7, #16]
	adds	r2, r3, #1
	ldr	r3, .L2+256
.LPIC64:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #32]
	ldr	r3, [r7, #20]
	adds	r2, r3, #2
	ldr	r3, .L2+260
.LPIC65:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #36]
	ldr	r3, [r7, #24]
	adds	r2, r3, #3
	ldr	r3, .L2+264
.LPIC66:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #40]
	ldr	r3, [r7, #28]
	adds	r2, r3, #4
	ldr	r3, .L2+268
.LPIC67:
	add	r3, pc
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #44]
	ldr	r0, [r7, #128]
	bl	putint(PLT)
	movs	r0, #32
	bl	putch(PLT)
	ldr	r0, [r7, #132]
	bl	putint(PLT)
	movs	r0, #32
	bl	putch(PLT)
	ldr	r0, [r7, #136]
	bl	putint(PLT)
	movs	r0, #32
	bl	putch(PLT)
	ldr	r0, [r7, #140]
	bl	putint(PLT)
	movs	r0, #32
	bl	putch(PLT)
	ldr	r0, [r7, #112]
	bl	putint(PLT)
	movs	r0, #32
	bl	putch(PLT)
	ldr	r0, [r7, #116]
	bl	putint(PLT)
	movs	r0, #32
	bl	putch(PLT)
	ldr	r0, [r7, #120]
	bl	putint(PLT)
	movs	r0, #32
	bl	putch(PLT)
	ldr	r0, [r7, #124]
	bl	putint(PLT)
	movs	r0, #32
	bl	putch(PLT)
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #16]
	add	r2, r2, r3
	ldr	r3, [r7, #20]
	add	r2, r2, r3
	ldr	r3, [r7, #24]
	add	r2, r2, r3
	ldr	r3, [r7, #28]
	add	r2, r2, r3
	ldr	r3, [r7, #32]
	subs	r2, r2, r3
	ldr	r3, [r7, #36]
	subs	r2, r2, r3
	ldr	r3, [r7, #40]
	subs	r2, r2, r3
	ldr	r3, [r7, #44]
	subs	r2, r2, r3
	ldr	r3, [r7, #48]
	add	r2, r2, r3
	ldr	r3, [r7, #52]
	add	r2, r2, r3
	ldr	r3, [r7, #56]
	add	r2, r2, r3
	ldr	r3, [r7, #60]
	add	r2, r2, r3
	ldr	r3, [r7, #64]
	subs	r2, r2, r3
	ldr	r3, [r7, #68]
	subs	r2, r2, r3
	ldr	r3, [r7, #72]
	subs	r2, r2, r3
	ldr	r3, [r7, #76]
	subs	r2, r2, r3
	ldr	r3, [r7, #80]
	add	r2, r2, r3
	ldr	r3, [r7, #84]
	add	r2, r2, r3
	ldr	r3, [r7, #88]
	add	r2, r2, r3
	ldr	r3, [r7, #92]
	add	r2, r2, r3
	ldr	r3, [r7, #96]
	subs	r2, r2, r3
	ldr	r3, [r7, #100]
	subs	r2, r2, r3
	ldr	r3, [r7, #104]
	subs	r2, r2, r3
	ldr	r3, [r7, #108]
	subs	r2, r2, r3
	ldr	r3, [r7, #112]
	add	r2, r2, r3
	ldr	r3, [r7, #116]
	add	r2, r2, r3
	ldr	r3, [r7, #120]
	add	r2, r2, r3
	ldr	r3, [r7, #124]
	add	r2, r2, r3
	ldr	r3, [r7, #128]
	subs	r2, r2, r3
	ldr	r3, [r7, #132]
	subs	r2, r2, r3
	ldr	r3, [r7, #136]
	subs	r2, r2, r3
	ldr	r3, [r7, #140]
	subs	r2, r2, r3
	ldr	r3, [r7, #144]
	add	r2, r2, r3
	ldr	r3, [r7, #148]
	add	r2, r2, r3
	ldr	r3, [r7, #152]
	add	r2, r2, r3
	ldr	r3, [r7, #156]
	add	r2, r2, r3
	ldr	r3, .L2+272
.LPIC68:
	add	r3, pc
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r3, .L2+276
.LPIC69:
	add	r3, pc
	ldr	r3, [r3]
	subs	r2, r2, r3
	ldr	r3, .L2+280
.LPIC70:
	add	r3, pc
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r3, .L2+284
.LPIC71:
	add	r3, pc
	ldr	r3, [r3]
	subs	r2, r2, r3
	ldr	r3, .L2+288
.LPIC72:
	add	r3, pc
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r3, .L2+292
.LPIC73:
	add	r3, pc
	ldr	r3, [r3]
	subs	r2, r2, r3
	ldr	r3, .L2+296
.LPIC74:
	add	r3, pc
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r3, .L2+300
.LPIC75:
	add	r3, pc
	ldr	r3, [r3]
	subs	r2, r2, r3
	ldr	r3, .L2+304
.LPIC76:
	add	r3, pc
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r3, .L2+308
.LPIC77:
	add	r3, pc
	ldr	r3, [r3]
	subs	r2, r2, r3
	ldr	r3, .L2+312
.LPIC78:
	add	r3, pc
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r3, .L2+316
.LPIC79:
	add	r3, pc
	ldr	r3, [r3]
	subs	r2, r2, r3
	ldr	r3, .L2+320
.LPIC80:
	add	r3, pc
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r3, .L2+324
.LPIC81:
	add	r3, pc
	ldr	r3, [r3]
	subs	r2, r2, r3
	ldr	r3, .L2+328
.LPIC82:
	add	r3, pc
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r3, .L2+332
.LPIC83:
	add	r3, pc
	ldr	r3, [r3]
	subs	r2, r2, r3
	ldr	r3, .L2+336
.LPIC84:
	add	r3, pc
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r3, .L2+340
.LPIC85:
	add	r3, pc
	ldr	r3, [r3]
	subs	r2, r2, r3
	ldr	r3, .L2+344
.LPIC86:
	add	r3, pc
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r3, .L2+348
.LPIC87:
	add	r3, pc
	ldr	r3, [r3]
	subs	r2, r2, r3
	ldr	r3, .L2+352
.LPIC88:
	add	r3, pc
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r3, .L2+356
.LPIC89:
	add	r3, pc
	ldr	r3, [r3]
	subs	r2, r2, r3
	ldr	r3, .L2+360
.LPIC90:
	add	r3, pc
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r3, .L2+364
.LPIC91:
	add	r3, pc
	ldr	r3, [r3]
	subs	r2, r2, r3
	ldr	r3, .L2+368
.LPIC92:
	add	r3, pc
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r3, .L2+372
.LPIC93:
	add	r3, pc
	ldr	r3, [r3]
	subs	r2, r2, r3
	ldr	r3, .L2+376
.LPIC94:
	add	r3, pc
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r3, .L2+380
.LPIC95:
	add	r3, pc
	ldr	r3, [r3]
	subs	r2, r2, r3
	ldr	r3, .L2+384
.LPIC96:
	add	r3, pc
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r3, .L2+388
.LPIC97:
	add	r3, pc
	ldr	r3, [r3]
	subs	r2, r2, r3
	ldr	r3, .L2+392
.LPIC98:
	add	r3, pc
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r3, .L2+396
.LPIC99:
	add	r3, pc
	ldr	r3, [r3]
	subs	r3, r2, r3
	mov	r0, r3
	bl	putint(PLT)
	nop
	mov	r0, r3
	adds	r7, r7, #160
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L3:
	.align	2
.L2:
	.word	a1-(.LPIC0+4)
	.word	a2-(.LPIC1+4)
	.word	a3-(.LPIC2+4)
	.word	a4-(.LPIC3+4)
	.word	a5-(.LPIC4+4)
	.word	a6-(.LPIC5+4)
	.word	a7-(.LPIC6+4)
	.word	a8-(.LPIC7+4)
	.word	a9-(.LPIC8+4)
	.word	a10-(.LPIC9+4)
	.word	a11-(.LPIC10+4)
	.word	a12-(.LPIC11+4)
	.word	a13-(.LPIC12+4)
	.word	a14-(.LPIC13+4)
	.word	a15-(.LPIC14+4)
	.word	a16-(.LPIC15+4)
	.word	a17-(.LPIC16+4)
	.word	a18-(.LPIC17+4)
	.word	a19-(.LPIC18+4)
	.word	a20-(.LPIC19+4)
	.word	a21-(.LPIC20+4)
	.word	a22-(.LPIC21+4)
	.word	a23-(.LPIC22+4)
	.word	a24-(.LPIC23+4)
	.word	a25-(.LPIC24+4)
	.word	a26-(.LPIC25+4)
	.word	a27-(.LPIC26+4)
	.word	a28-(.LPIC27+4)
	.word	a29-(.LPIC28+4)
	.word	a30-(.LPIC29+4)
	.word	a31-(.LPIC30+4)
	.word	a32-(.LPIC31+4)
	.word	a29-(.LPIC32+4)
	.word	a30-(.LPIC33+4)
	.word	a31-(.LPIC34+4)
	.word	a32-(.LPIC35+4)
	.word	a25-(.LPIC36+4)
	.word	a26-(.LPIC37+4)
	.word	a27-(.LPIC38+4)
	.word	a28-(.LPIC39+4)
	.word	a21-(.LPIC40+4)
	.word	a22-(.LPIC41+4)
	.word	a23-(.LPIC42+4)
	.word	a24-(.LPIC43+4)
	.word	a17-(.LPIC44+4)
	.word	a18-(.LPIC45+4)
	.word	a19-(.LPIC46+4)
	.word	a20-(.LPIC47+4)
	.word	a13-(.LPIC48+4)
	.word	a14-(.LPIC49+4)
	.word	a15-(.LPIC50+4)
	.word	a16-(.LPIC51+4)
	.word	a9-(.LPIC52+4)
	.word	a10-(.LPIC53+4)
	.word	a11-(.LPIC54+4)
	.word	a12-(.LPIC55+4)
	.word	a5-(.LPIC56+4)
	.word	a6-(.LPIC57+4)
	.word	a7-(.LPIC58+4)
	.word	a8-(.LPIC59+4)
	.word	a1-(.LPIC60+4)
	.word	a2-(.LPIC61+4)
	.word	a3-(.LPIC62+4)
	.word	a4-(.LPIC63+4)
	.word	a1-(.LPIC64+4)
	.word	a2-(.LPIC65+4)
	.word	a3-(.LPIC66+4)
	.word	a4-(.LPIC67+4)
	.word	a1-(.LPIC68+4)
	.word	a2-(.LPIC69+4)
	.word	a3-(.LPIC70+4)
	.word	a4-(.LPIC71+4)
	.word	a5-(.LPIC72+4)
	.word	a6-(.LPIC73+4)
	.word	a7-(.LPIC74+4)
	.word	a8-(.LPIC75+4)
	.word	a9-(.LPIC76+4)
	.word	a10-(.LPIC77+4)
	.word	a11-(.LPIC78+4)
	.word	a12-(.LPIC79+4)
	.word	a13-(.LPIC80+4)
	.word	a14-(.LPIC81+4)
	.word	a15-(.LPIC82+4)
	.word	a16-(.LPIC83+4)
	.word	a17-(.LPIC84+4)
	.word	a18-(.LPIC85+4)
	.word	a19-(.LPIC86+4)
	.word	a20-(.LPIC87+4)
	.word	a21-(.LPIC88+4)
	.word	a22-(.LPIC89+4)
	.word	a23-(.LPIC90+4)
	.word	a24-(.LPIC91+4)
	.word	a25-(.LPIC92+4)
	.word	a26-(.LPIC93+4)
	.word	a27-(.LPIC94+4)
	.word	a28-(.LPIC95+4)
	.word	a29-(.LPIC96+4)
	.word	a30-(.LPIC97+4)
	.word	a31-(.LPIC98+4)
	.word	a32-(.LPIC99+4)
	.size	func, .-func
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	bl	getint(PLT)
	str	r0, [r7]
	ldr	r3, [r7]
	adds	r3, r3, #18
	str	r3, [r7, #4]
	ldr	r1, [r7, #4]
	ldr	r0, [r7]
	bl	func(PLT)
	ldr	r3, [r7]
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",%progbits
