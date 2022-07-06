
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 936
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	ldr	r12, =940
	sub	sp, sp, r12
	ldr	r9, =1
	ldr	r10, =-112
	add	r10, r10, fp
	str	r9,	[r10, #0]
	ldr	r9, =2
	ldr	r10, =-112
	add	r10, r10, fp
	str	r9,	[r10, #4]
	ldr	r9, =3
	ldr	r10, =-112
	add	r10, r10, fp
	str	r9,	[r10, #8]
	ldr	r9, =4
	ldr	r10, =-112
	add	r10, r10, fp
	str	r9,	[r10, #12]
	ldr	r9, =5
	ldr	r10, =-112
	add	r10, r10, fp
	str	r9,	[r10, #16]
	ldr	r9, =6
	ldr	r10, =-112
	add	r10, r10, fp
	str	r9,	[r10, #20]
	ldr	r9, =7
	ldr	r10, =-112
	add	r10, r10, fp
	str	r9,	[r10, #24]
	ldr	r9, =8
	ldr	r10, =-112
	add	r10, r10, fp
	str	r9,	[r10, #28]
	ldr	r9, =9
	ldr	r10, =-112
	add	r10, r10, fp
	str	r9,	[r10, #32]
	ldr	r9, =0
	ldr	r10, =-112
	add	r10, r10, fp
	str	r9,	[r10, #36]
	ldr	r9, =1
	ldr	r10, =-112
	add	r10, r10, fp
	str	r9,	[r10, #40]
	ldr	r9, =2
	ldr	r10, =-112
	add	r10, r10, fp
	str	r9,	[r10, #44]
	ldr	r9, =3
	ldr	r10, =-112
	add	r10, r10, fp
	str	r9,	[r10, #48]
	ldr	r9, =4
	ldr	r10, =-112
	add	r10, r10, fp
	str	r9,	[r10, #52]
	ldr	r9, =5
	ldr	r10, =-112
	add	r10, r10, fp
	str	r9,	[r10, #56]
	ldr	r9, =6
	ldr	r10, =-112
	add	r10, r10, fp
	str	r9,	[r10, #60]
	ldr	r9, =7
	ldr	r10, =-112
	add	r10, r10, fp
	str	r9,	[r10, #64]
	ldr	r9, =8
	ldr	r10, =-112
	add	r10, r10, fp
	str	r9,	[r10, #68]
	ldr	r9, =9
	ldr	r10, =-112
	add	r10, r10, fp
	str	r9,	[r10, #72]
	ldr	r9, =0
	ldr	r10, =-112
	add	r10, r10, fp
	str	r9,	[r10, #76]
	ldr	r9, =2
	ldr	r10, =-192
	add	r10, r10, fp
	str	r9,	[r10, #0]
	ldr	r9, =3
	ldr	r10, =-192
	add	r10, r10, fp
	str	r9,	[r10, #4]
	ldr	r9, =4
	ldr	r10, =-192
	add	r10, r10, fp
	str	r9,	[r10, #8]
	ldr	r9, =2
	ldr	r10, =-192
	add	r10, r10, fp
	str	r9,	[r10, #12]
	ldr	r9, =5
	ldr	r10, =-192
	add	r10, r10, fp
	str	r9,	[r10, #16]
	ldr	r9, =7
	ldr	r10, =-192
	add	r10, r10, fp
	str	r9,	[r10, #20]
	ldr	r9, =9
	ldr	r10, =-192
	add	r10, r10, fp
	str	r9,	[r10, #24]
	ldr	r9, =9
	ldr	r10, =-192
	add	r10, r10, fp
	str	r9,	[r10, #28]
	ldr	r9, =0
	ldr	r10, =-192
	add	r10, r10, fp
	str	r9,	[r10, #32]
	ldr	r9, =1
	ldr	r10, =-192
	add	r10, r10, fp
	str	r9,	[r10, #36]
	ldr	r9, =9
	ldr	r10, =-192
	add	r10, r10, fp
	str	r9,	[r10, #40]
	ldr	r9, =8
	ldr	r10, =-192
	add	r10, r10, fp
	str	r9,	[r10, #44]
	ldr	r9, =7
	ldr	r10, =-192
	add	r10, r10, fp
	str	r9,	[r10, #48]
	ldr	r9, =6
	ldr	r10, =-192
	add	r10, r10, fp
	str	r9,	[r10, #52]
	ldr	r9, =4
	ldr	r10, =-192
	add	r10, r10, fp
	str	r9,	[r10, #56]
	ldr	r9, =3
	ldr	r10, =-192
	add	r10, r10, fp
	str	r9,	[r10, #60]
	ldr	r9, =2
	ldr	r10, =-192
	add	r10, r10, fp
	str	r9,	[r10, #64]
	ldr	r9, =1
	ldr	r10, =-192
	add	r10, r10, fp
	str	r9,	[r10, #68]
	ldr	r9, =2
	ldr	r10, =-192
	add	r10, r10, fp
	str	r9,	[r10, #72]
	ldr	r9, =2
	ldr	r10, =-192
	add	r10, r10, fp
	str	r9,	[r10, #76]
	ldr	r9, =20
	str	r9, [fp, #-196]
	ldr	r9, =20
	str	r9, [fp, #-200]
	ldr	r10, =-560
	add	r10, r10, fp
	mov	r12, #0
	str	r12, [r10, #0]
	str	r12, [r10, #4]
	str	r12, [r10, #8]
	str	r12, [r10, #12]
	str	r12, [r10, #16]
	str	r12, [r10, #20]
	str	r12, [r10, #24]
	str	r12, [r10, #28]
	str	r12, [r10, #32]
	str	r12, [r10, #36]
	str	r12, [r10, #40]
	str	r12, [r10, #44]
	str	r12, [r10, #48]
	str	r12, [r10, #52]
	str	r12, [r10, #56]
	str	r12, [r10, #60]
	str	r12, [r10, #64]
	str	r12, [r10, #68]
	str	r12, [r10, #72]
	str	r12, [r10, #76]
	str	r12, [r10, #80]
	str	r12, [r10, #84]
	str	r12, [r10, #88]
	str	r12, [r10, #92]
	str	r12, [r10, #96]
	str	r12, [r10, #100]
	str	r12, [r10, #104]
	str	r12, [r10, #108]
	str	r12, [r10, #112]
	str	r12, [r10, #116]
	str	r12, [r10, #120]
	str	r12, [r10, #124]
	str	r12, [r10, #128]
	str	r12, [r10, #132]
	str	r12, [r10, #136]
	str	r12, [r10, #140]
	str	r12, [r10, #144]
	str	r12, [r10, #148]
	str	r12, [r10, #152]
	str	r12, [r10, #156]

	ldr	r9, =0
	str	r9, [fp, #-16]

.L17:
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-196]
	cmp	r9, r8
	blt	.L196
	ldr	r10, =1
	cmp	r10, #0
	b	.L19

.L196:
	ldr	r10, =0
	cmp	r10, #0
	b	.L18
	b	.L19

.L18:
	ldr	r9, [fp, #-16]
	ldr	r10, =-112
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, [fp, #-16]
	ldr	r10, =-300
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-16]
	b	.L17

.L19:
	ldr	r9, =0
	str	r9, [fp, #-16]

.L35:
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-200]
	cmp	r9, r8
	blt	.L197
	ldr	r10, =1
	cmp	r10, #0
	b	.L37

.L197:
	ldr	r10, =0
	cmp	r10, #0
	b	.L36
	b	.L37

.L36:
	ldr	r9, [fp, #-16]
	ldr	r10, =-192
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, [fp, #-16]
	ldr	r10, =-400
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-16]
	b	.L35

.L37:
	ldr	r9, [fp, #-196]
	ldr	r8, [fp, #-200]
	add	r9, r8, r9
	ldr	r7, =1
	sub	r9, r9, r7
	str	r9, [fp, #-28]
	ldr	r9, =0
	str	r9, [fp, #-16]

.L62:
	ldr	r9, [fp, #-16]
	ldr	r7, [fp, #-28]
	cmp	r9, r7
	ble	.L198
	ldr	r10, =1
	cmp	r10, #0
	b	.L64

.L198:
	ldr	r10, =0
	cmp	r10, #0
	b	.L63
	b	.L64

.L63:
	ldr	r9, =0
	ldr	r7, [fp, #-16]
	ldr	r10, =-560
	add	r10, r10, fp
	str	r9,	[r10, r7,LSL#2]
	ldr	r9, [fp, #-16]
	ldr	r7, =1
	add	r9, r7, r9
	str	r9, [fp, #-16]
	b	.L62

.L64:
	ldr	r9, =0
	str	r9, [fp, #-32]
	ldr	r9, =1
	sub	r9, r8, r9
	str	r9, [fp, #-16]

.L86:
	ldr	r9, [fp, #-16]
	ldr	r8, =-1
	cmp	r9, r8
	bgt	.L199
	ldr	r10, =1
	cmp	r10, #0
	b	.L88

.L199:
	ldr	r10, =0
	cmp	r10, #0
	b	.L87
	b	.L88

.L87:
	ldr	r9, [fp, #-16]
	ldr	r10, =-400
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-196]
	ldr	r8, =1
	sub	r9, r9, r8
	str	r9, [fp, #-20]

.L101:
	ldr	r9, [fp, #-20]
	ldr	r8, =-1
	cmp	r9, r8
	bgt	.L200
	ldr	r10, =1
	cmp	r10, #0
	b	.L103

.L200:
	ldr	r10, =0
	cmp	r10, #0
	b	.L102
	b	.L103

.L102:
	ldr	r9, [fp, #-28]
	ldr	r10, =-560
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, [fp, #-24]
	ldr	r7, [fp, #-20]
	ldr	r10, =-300
	add	r10, r10, fp
	ldr	r7,	[r10, r7,LSL#2]
	mul	r8, r7, r8
	add	r9, r8, r9
	str	r9, [fp, #-32]
	ldr	r9, [fp, #-32]
	ldr	r8, =10
	cmp	r9, r8
	bge	.L201
	ldr	r10, =1
	cmp	r10, #0
	b	.L117

.L201:
	ldr	r10, =0
	cmp	r10, #0
	b	.L116
	b	.L117

.L116:
	ldr	r9, [fp, #-32]
	ldr	r8, [fp, #-28]
	ldr	r10, =-560
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-28]
	ldr	r8, =1
	sub	r9, r9, r8
	ldr	r10, =-560
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, [fp, #-32]
	ldr	r7, =10
	mov	r0, r8
	mov	r1, r7
	bl	__aeabi_idiv
	mov	r8, r0
	add	r9, r8, r9
	ldr	r8, [fp, #-28]
	ldr	r7, =1
	sub	r8, r8, r7
	ldr	r10, =-560
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	b	.L118

.L117:
	ldr	r9, [fp, #-32]
	ldr	r8, [fp, #-28]
	ldr	r10, =-560
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]

.L118:
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	sub	r9, r9, r8
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-28]
	ldr	r8, =1
	sub	r9, r9, r8
	str	r9, [fp, #-28]
	b	.L101

.L103:
	ldr	r9, [fp, #-28]
	ldr	r8, [fp, #-196]
	add	r9, r8, r9
	ldr	r8, =1
	sub	r9, r9, r8
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	sub	r9, r9, r8
	str	r9, [fp, #-16]
	b	.L86

.L88:
	ldr	r9, =0
	ldr	r10, =-560
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =0
	cmp	r9, r8
	bne	.L202
	ldr	r10, =1
	cmp	r10, #0
	b	.L171

.L202:
	ldr	r10, =0
	cmp	r10, #0
	b	.L170
	b	.L171

.L170:
	ldr	r9, =0
	ldr	r10, =-560
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	mov	r0, r9
	bl	putint

.L171:
	ldr	r9, =1
	str	r9, [fp, #-16]

.L178:
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-196]
	ldr	r7, [fp, #-200]
	add	r8, r7, r8
	ldr	r7, =1
	sub	r8, r8, r7
	cmp	r9, r8
	ble	.L203
	ldr	r10, =1
	cmp	r10, #0
	b	.L180

.L203:
	ldr	r10, =0
	cmp	r10, #0
	b	.L179
	b	.L180

.L179:
	ldr	r9, [fp, #-16]
	ldr	r10, =-560
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	mov	r0, r9
	bl	putint
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-16]
	b	.L178

.L180:
	ldr	r9, =0
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
