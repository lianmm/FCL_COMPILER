
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	long_array
	.type	long_array, %function
long_array:
	@ args = 0, pretend = 0, frame = 240052
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	ldr	r12, =240056
	sub	sp, sp, r12
	str	r0, [fp, #-16]
	ldr	r9, =0
	ldr	r10, =-120020
	str	r9, [fp, r10]

.L2:
	ldr	r10, =-120020
	ldr	r9, [fp, r10]
	ldr	r8, =10000
	cmp	r9, r8
	blt	.L201
	ldr	r10, =1
	cmp	r10, #0
	b	.L4

.L201:
	ldr	r10, =0
	cmp	r10, #0
	b	.L3
	b	.L4

.L3:
	ldr	r10, =-120020
	ldr	r9, [fp, r10]
	ldr	r10, =-120020
	ldr	r8, [fp, r10]
	mul	r9, r8, r9
	ldr	r8, =10
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	ldr	r10, =-120020
	ldr	r8, [fp, r10]
	ldr	r10, =-40016
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r10, =-120020
	ldr	r9, [fp, r10]
	ldr	r8, =1
	add	r9, r8, r9
	ldr	r10, =-120020
	str	r9, [fp, r10]
	b	.L2

.L4:
	ldr	r9, =0
	ldr	r10, =-120020
	str	r9, [fp, r10]

.L26:
	ldr	r10, =-120020
	ldr	r9, [fp, r10]
	ldr	r8, =10000
	cmp	r9, r8
	blt	.L202
	ldr	r10, =1
	cmp	r10, #0
	b	.L28

.L202:
	ldr	r10, =0
	cmp	r10, #0
	b	.L27
	b	.L28

.L27:
	ldr	r10, =-120020
	ldr	r9, [fp, r10]
	ldr	r10, =-40016
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r10, =-120020
	ldr	r8, [fp, r10]
	ldr	r10, =-40016
	add	r10, r10, fp
	ldr	r8,	[r10, r8,LSL#2]
	mul	r9, r8, r9
	ldr	r8, =10
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	ldr	r10, =-120020
	ldr	r8, [fp, r10]
	ldr	r10, =-80016
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r10, =-120020
	ldr	r9, [fp, r10]
	ldr	r8, =1
	add	r9, r8, r9
	ldr	r10, =-120020
	str	r9, [fp, r10]
	b	.L26

.L28:
	ldr	r9, =0
	ldr	r10, =-120020
	str	r9, [fp, r10]

.L50:
	ldr	r10, =-120020
	ldr	r9, [fp, r10]
	ldr	r8, =10000
	cmp	r9, r8
	blt	.L203
	ldr	r10, =1
	cmp	r10, #0
	b	.L52

.L203:
	ldr	r10, =0
	cmp	r10, #0
	b	.L51
	b	.L52

.L51:
	ldr	r10, =-120020
	ldr	r9, [fp, r10]
	ldr	r10, =-80016
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r10, =-120020
	ldr	r8, [fp, r10]
	ldr	r10, =-80016
	add	r10, r10, fp
	ldr	r8,	[r10, r8,LSL#2]
	mul	r9, r8, r9
	ldr	r8, =100
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	ldr	r10, =-120020
	ldr	r8, [fp, r10]
	ldr	r10, =-40016
	add	r10, r10, fp
	ldr	r8,	[r10, r8,LSL#2]
	add	r9, r8, r9
	ldr	r10, =-120020
	ldr	r8, [fp, r10]
	ldr	r10, =-120016
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r10, =-120020
	ldr	r9, [fp, r10]
	ldr	r8, =1
	add	r9, r8, r9
	ldr	r10, =-120020
	str	r9, [fp, r10]
	b	.L50

.L52:
	ldr	r9, =0
	ldr	r10, =-120024
	str	r9, [fp, r10]
	ldr	r9, =0
	ldr	r10, =-120020
	str	r9, [fp, r10]

.L77:
	ldr	r10, =-120020
	ldr	r9, [fp, r10]
	ldr	r8, =10000
	cmp	r9, r8
	blt	.L204
	ldr	r10, =1
	cmp	r10, #0
	b	.L79

.L204:
	ldr	r10, =0
	cmp	r10, #0
	b	.L78
	b	.L79

.L78:
	ldr	r10, =-120020
	ldr	r9, [fp, r10]
	ldr	r8, =10
	cmp	r9, r8
	blt	.L205
	ldr	r10, =1
	cmp	r10, #0
	b	.L84

.L205:
	ldr	r10, =0
	cmp	r10, #0
	b	.L83
	b	.L84

.L83:
	ldr	r10, =-120024
	ldr	r9, [fp, r10]
	ldr	r10, =-120020
	ldr	r8, [fp, r10]
	ldr	r10, =-120016
	add	r10, r10, fp
	ldr	r8,	[r10, r8,LSL#2]
	add	r9, r8, r9
	ldr	r8, =1333
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	ldr	r10, =-120024
	str	r9, [fp, r10]
	ldr	r10, =-120024
	ldr	r9, [fp, r10]
	mov	r0, r9
	bl	putint
	b	.L85

.L84:
	ldr	r10, =-120020
	ldr	r9, [fp, r10]
	ldr	r8, =20
	cmp	r9, r8
	blt	.L206
	ldr	r10, =1
	cmp	r10, #0
	b	.L99

.L206:
	ldr	r10, =0
	cmp	r10, #0
	b	.L98
	b	.L99

.L98:
	ldr	r9, =5000
	ldr	r10, =-120028
	str	r9, [fp, r10]

.L107:
	ldr	r10, =-120028
	ldr	r9, [fp, r10]
	ldr	r8, =10000
	cmp	r9, r8
	blt	.L207
	ldr	r10, =1
	cmp	r10, #0
	b	.L109

.L207:
	ldr	r10, =0
	cmp	r10, #0
	b	.L108
	b	.L109

.L108:
	ldr	r10, =-120024
	ldr	r9, [fp, r10]
	ldr	r10, =-120020
	ldr	r8, [fp, r10]
	ldr	r10, =-120016
	add	r10, r10, fp
	ldr	r8,	[r10, r8,LSL#2]
	add	r9, r8, r9
	ldr	r10, =-120028
	ldr	r8, [fp, r10]
	ldr	r10, =-40016
	add	r10, r10, fp
	ldr	r8,	[r10, r8,LSL#2]
	sub	r9, r9, r8
	ldr	r10, =-120024
	str	r9, [fp, r10]
	ldr	r10, =-120028
	ldr	r9, [fp, r10]
	ldr	r8, =1
	add	r9, r8, r9
	ldr	r10, =-120028
	str	r9, [fp, r10]
	b	.L107

.L109:
	ldr	r10, =-120024
	ldr	r9, [fp, r10]
	mov	r0, r9
	bl	putint
	b	.L100

.L99:
	ldr	r10, =-120020
	ldr	r9, [fp, r10]
	ldr	r8, =30
	cmp	r9, r8
	blt	.L208
	ldr	r10, =1
	cmp	r10, #0
	b	.L129

.L208:
	ldr	r10, =0
	cmp	r10, #0
	b	.L128
	b	.L129

.L128:
	ldr	r9, =5000
	ldr	r10, =-120028
	str	r9, [fp, r10]

.L137:
	ldr	r10, =-120028
	ldr	r9, [fp, r10]
	ldr	r8, =10000
	cmp	r9, r8
	blt	.L209
	ldr	r10, =1
	cmp	r10, #0
	b	.L139

.L209:
	ldr	r10, =0
	cmp	r10, #0
	b	.L138
	b	.L139

.L138:
	ldr	r10, =-120028
	ldr	r9, [fp, r10]
	ldr	r8, =2233
	cmp	r9, r8
	bgt	.L210
	ldr	r10, =1
	cmp	r10, #0
	b	.L144

.L210:
	ldr	r10, =0
	cmp	r10, #0
	b	.L143
	b	.L144

.L143:
	ldr	r10, =-120024
	ldr	r9, [fp, r10]
	ldr	r10, =-120020
	ldr	r8, [fp, r10]
	ldr	r10, =-80016
	add	r10, r10, fp
	ldr	r8,	[r10, r8,LSL#2]
	add	r9, r8, r9
	ldr	r10, =-120028
	ldr	r8, [fp, r10]
	ldr	r10, =-40016
	add	r10, r10, fp
	ldr	r8,	[r10, r8,LSL#2]
	sub	r9, r9, r8
	ldr	r10, =-120024
	str	r9, [fp, r10]
	ldr	r10, =-120028
	ldr	r9, [fp, r10]
	ldr	r8, =1
	add	r9, r8, r9
	ldr	r10, =-120028
	str	r9, [fp, r10]
	b	.L145

.L144:
	ldr	r10, =-120024
	ldr	r9, [fp, r10]
	ldr	r10, =-120020
	ldr	r8, [fp, r10]
	ldr	r10, =-40016
	add	r10, r10, fp
	ldr	r8,	[r10, r8,LSL#2]
	add	r9, r8, r9
	ldr	r10, =-120028
	ldr	r8, [fp, r10]
	ldr	r10, =-120016
	add	r10, r10, fp
	ldr	r8,	[r10, r8,LSL#2]
	add	r9, r8, r9
	ldr	r8, =13333
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	ldr	r10, =-120024
	str	r9, [fp, r10]
	ldr	r10, =-120028
	ldr	r9, [fp, r10]
	ldr	r8, =2
	add	r9, r8, r9
	ldr	r10, =-120028
	str	r9, [fp, r10]

.L145:
	b	.L137

.L139:
	ldr	r10, =-120024
	ldr	r9, [fp, r10]
	mov	r0, r9
	bl	putint
	b	.L130

.L129:
	ldr	r10, =-120024
	ldr	r9, [fp, r10]
	ldr	r10, =-120020
	ldr	r8, [fp, r10]
	ldr	r10, =-120016
	add	r10, r10, fp
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, [fp, #-16]
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =99988
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	ldr	r10, =-120024
	str	r9, [fp, r10]

.L130:

.L100:

.L85:
	ldr	r10, =-120020
	ldr	r9, [fp, r10]
	ldr	r8, =1
	add	r9, r8, r9
	ldr	r10, =-120020
	str	r9, [fp, r10]
	b	.L77

.L79:
	ldr	r10, =-120024
	ldr	r9, [fp, r10]
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	long_array, .-long_array

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #20
	ldr	r9, =9
	mov	r0, r9
	bl	long_array
	mov	r9, r0
	mov	r0, r9
	b	.L200

.L200:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
