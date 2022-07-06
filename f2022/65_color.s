	.global	dp
	.data
	.align	2
	.type	dp, %object
	.size	dp, 52907904
dp:
	.space	52907904
	.global	list
	.data
	.align	2
	.type	list, %object
	.size	list, 800
list:
	.space	800

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	equal
	.type	equal, %function
equal:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-20]
	cmp	r9, r8
	beq	.L2
	b	.L3

.L2:
	ldr	r9, =1
	mov	r0, r9
	b	.L1

.L3:
	ldr	r9, =0
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	equal, .-equal

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	dfs
	.type	dfs, %function
dfs:
	@ args = 8, pretend = 0, frame = 188
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #192
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-20]
	ldr	r7, [fp, #-24]
	ldr	r6, [fp, #-28]
	ldr	r5, [fp, #36]
	ldr	r4, [fp, #40]
	ldr	r3, =7
	mul	r3, r5, r3
	add	r3, r3, r4
	ldr	r2, =126
	mul	r2, r6, r2
	add	r3, r2, r3
	ldr	r2, =2268
	mul	r2, r7, r2
	add	r3, r2, r3
	ldr	r2, =40824
	mul	r2, r8, r2
	add	r3, r2, r3
	ldr	r2, =734832
	mul	r2, r9, r2
	add	r3, r2, r3
	movw	r10, #:lower16:dp
	movt	r10, #:upper16:dp
	ldr	r3,	[r10, r3,LSL#2]
	ldr	r2, =-1
	cmp	r3, r2
	bne	.L245
	ldr	r10, =1
	cmp	r10, #0
	b	.L9

.L245:
	ldr	r10, =0
	cmp	r10, #0
	b	.L8
	b	.L9

.L8:
	ldr	r3, =7
	mul	r5, r5, r3
	add	r5, r5, r4
	ldr	r4, =126
	mul	r6, r6, r4
	add	r6, r6, r5
	ldr	r5, =2268
	mul	r7, r7, r5
	add	r7, r7, r6
	ldr	r6, =40824
	mul	r8, r8, r6
	add	r8, r8, r7
	ldr	r7, =734832
	mul	r9, r9, r7
	add	r9, r9, r8
	movw	r10, #:lower16:dp
	movt	r10, #:upper16:dp
	ldr	r9,	[r10, r9,LSL#2]
	mov	r0, r9
	b	.L7

.L9:
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-20]
	add	r9, r8, r9
	ldr	r8, [fp, #-24]
	add	r9, r8, r9
	ldr	r8, [fp, #-28]
	add	r9, r8, r9
	ldr	r8, [fp, #36]
	add	r9, r8, r9
	ldr	r8, =0
	cmp	r9, r8
	beq	.L13
	b	.L14

.L13:
	ldr	r9, =1
	mov	r0, r9
	b	.L7

.L14:
	ldr	r9, =0
	str	r9, [fp, #-32]
	ldr	r9, [fp, #-16]
	cmp	r9, #0
	bne	.L246
	ldr	r10, =1
	cmp	r10, #0
	b	.L31

.L246:
	ldr	r10, =0
	cmp	r10, #0
	b	.L30
	b	.L31

.L30:
	ldr	r8, [fp, #-32]
	ldr	r7, [fp, #40]
	ldr	r6, =2
	mov	r0, r7
	mov	r1, r6
	bl	equal
	mov	r7, r0
	sub	r7, r9, r7
	ldr	r6, =1
	sub	r9, r9, r6
	ldr	r6, [fp, #-20]
	ldr	r5, [fp, #-24]
	ldr	r4, [fp, #-28]
	ldr	r3, [fp, #36]
	ldr	r2, =1
	mov	r0, r9
	mov	r1, r6
	mov	r10, r2
	mov	r2, r5
	mov	r5, r10
	mov	r10, r3
	mov	r3, r4
	mov	r4, r10
	str	r4, [sp, #0]
	str	r5, [sp, #4]
	bl	dfs
	mov	r9, r0
	mul	r9, r9, r7
	add	r9, r9, r8
	ldr	r8, =1000000007
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	str	r9, [fp, #-32]

.L31:
	ldr	r9, [fp, #-20]
	cmp	r9, #0
	bne	.L247
	ldr	r10, =1
	cmp	r10, #0
	b	.L51

.L247:
	ldr	r10, =0
	cmp	r10, #0
	b	.L50
	b	.L51

.L50:
	ldr	r8, [fp, #-32]
	ldr	r7, [fp, #40]
	ldr	r6, =3
	mov	r0, r7
	mov	r1, r6
	bl	equal
	mov	r7, r0
	sub	r7, r9, r7
	ldr	r6, [fp, #-16]
	ldr	r5, =1
	add	r6, r5, r6
	ldr	r5, =1
	sub	r9, r9, r5
	ldr	r5, [fp, #-24]
	ldr	r4, [fp, #-28]
	ldr	r1, [fp, #36]
	ldr	r0, =2
	mov	r10, r0
	mov	r0, r6
	mov	r6, r10
	mov	r10, r1
	mov	r1, r9
	mov	r9, r10
	mov	r10, r2
	mov	r2, r5
	mov	r5, r10
	mov	r10, r3
	mov	r3, r4
	mov	r4, r10
	str	r9, [sp, #0]
	str	r6, [sp, #4]
	bl	dfs
	mov	r9, r0
	mul	r9, r9, r7
	add	r9, r9, r8
	ldr	r8, =1000000007
	mov	r10, r0
	mov	r0, r9
	mov	r9, r10
	mov	r10, r1
	mov	r1, r8
	mov	r8, r10
	bl	__aeabi_idivmod
	mov	r9, r1
	str	r9, [fp, #-32]

.L51:
	ldr	r9, [fp, #-24]
	cmp	r9, #0
	bne	.L248
	ldr	r10, =1
	cmp	r10, #0
	b	.L74

.L248:
	ldr	r10, =0
	cmp	r10, #0
	b	.L73
	b	.L74

.L73:
	ldr	r8, [fp, #-32]
	ldr	r7, [fp, #40]
	ldr	r6, =4
	mov	r10, r0
	mov	r0, r7
	mov	r7, r10
	mov	r10, r1
	mov	r1, r6
	mov	r6, r10
	bl	equal
	mov	r7, r0
	sub	r7, r9, r7
	ldr	r6, [fp, #-16]
	ldr	r5, [fp, #-20]
	ldr	r4, =1
	add	r5, r4, r5
	ldr	r4, =1
	sub	r9, r9, r4
	ldr	r4, [fp, #-28]
	str	r8, [fp, #-140]
	ldr	r8, [fp, #36]
	str	r7, [fp, #-144]
	ldr	r7, =3
	mov	r10, r0
	mov	r0, r6
	mov	r6, r10
	mov	r10, r1
	mov	r1, r5
	mov	r5, r10
	mov	r10, r2
	mov	r2, r9
	mov	r9, r10
	mov	r10, r3
	mov	r3, r4
	mov	r4, r10
	str	r8, [sp, #0]
	str	r7, [sp, #4]
	bl	dfs
	mov	r9, r0
	ldr	r12, [fp, #-144]
	mul	r9, r9, r12
	ldr	r12, [fp, #-140]
	add	r9, r9, r12
	ldr	r8, =1000000007
	mov	r10, r0
	mov	r0, r9
	mov	r9, r10
	mov	r10, r1
	mov	r1, r8
	mov	r8, r10
	bl	__aeabi_idivmod
	mov	r9, r1
	str	r9, [fp, #-32]

.L74:
	ldr	r9, [fp, #-28]
	cmp	r9, #0
	bne	.L249
	ldr	r10, =1
	cmp	r10, #0
	b	.L97

.L249:
	ldr	r10, =0
	cmp	r10, #0
	b	.L96
	b	.L97

.L96:
	ldr	r8, [fp, #-32]
	ldr	r7, [fp, #40]
	ldr	r6, =5
	mov	r10, r0
	mov	r0, r7
	mov	r7, r10
	mov	r10, r1
	mov	r1, r6
	mov	r6, r10
	bl	equal
	mov	r7, r0
	sub	r7, r9, r7
	ldr	r6, [fp, #-16]
	ldr	r5, [fp, #-20]
	ldr	r4, [fp, #-24]
	str	r8, [fp, #-148]
	ldr	r8, =1
	add	r8, r8, r4
	ldr	r4, =1
	sub	r9, r9, r4
	ldr	r4, [fp, #36]
	str	r7, [fp, #-152]
	ldr	r7, =4
	mov	r10, r0
	mov	r0, r6
	mov	r6, r10
	mov	r10, r1
	mov	r1, r5
	mov	r5, r10
	mov	r10, r2
	mov	r2, r8
	mov	r8, r10
	mov	r10, r3
	mov	r3, r9
	mov	r9, r10
	str	r4, [sp, #0]
	str	r7, [sp, #4]
	bl	dfs
	mov	r9, r0
	ldr	r12, [fp, #-152]
	mul	r9, r9, r12
	ldr	r12, [fp, #-148]
	add	r9, r9, r12
	ldr	r8, =1000000007
	mov	r10, r0
	mov	r0, r9
	mov	r9, r10
	mov	r10, r1
	mov	r1, r8
	mov	r8, r10
	bl	__aeabi_idivmod
	mov	r9, r1
	str	r9, [fp, #-32]

.L97:
	ldr	r9, [fp, #36]
	cmp	r9, #0
	bne	.L250
	ldr	r10, =1
	cmp	r10, #0
	b	.L120

.L250:
	ldr	r10, =0
	cmp	r10, #0
	b	.L119
	b	.L120

.L119:
	ldr	r8, [fp, #-32]
	ldr	r7, [fp, #-16]
	ldr	r6, [fp, #-20]
	ldr	r5, [fp, #-24]
	ldr	r4, [fp, #-28]
	str	r8, [fp, #-156]
	ldr	r8, =1
	add	r8, r8, r4
	ldr	r4, =1
	sub	r4, r9, r4
	str	r9, [fp, #-160]
	ldr	r9, =5
	mov	r10, r0
	mov	r0, r7
	mov	r7, r10
	mov	r10, r1
	mov	r1, r6
	mov	r6, r10
	mov	r10, r2
	mov	r2, r5
	mov	r5, r10
	mov	r10, r3
	mov	r3, r8
	mov	r8, r10
	str	r4, [sp, #0]
	str	r9, [sp, #4]
	bl	dfs
	mov	r9, r0
	ldr	r12, [fp, #-160]
	mul	r9, r9, r12
	ldr	r12, [fp, #-156]
	add	r9, r9, r12
	ldr	r8, =1000000007
	mov	r10, r0
	mov	r0, r9
	mov	r9, r10
	mov	r10, r1
	mov	r1, r8
	mov	r8, r10
	bl	__aeabi_idivmod
	mov	r9, r1
	str	r9, [fp, #-32]

.L120:
	ldr	r9, [fp, #-32]
	ldr	r8, =1000000007
	mov	r10, r0
	mov	r0, r9
	mov	r9, r10
	mov	r10, r1
	mov	r1, r8
	mov	r8, r10
	bl	__aeabi_idivmod
	mov	r9, r1
	ldr	r8, [fp, #-16]
	ldr	r7, [fp, #-20]
	ldr	r6, [fp, #-24]
	ldr	r5, [fp, #-28]
	ldr	r4, [fp, #36]
	str	r9, [fp, #-164]
	ldr	r9, [fp, #40]
	str	r8, [fp, #-168]
	ldr	r8, =7
	mul	r8, r4, r8
	add	r8, r8, r9
	str	r9, [fp, #-172]
	ldr	r9, =126
	mul	r9, r5, r9
	add	r9, r9, r8
	ldr	r8, =2268
	mul	r8, r6, r8
	add	r9, r8, r9
	ldr	r8, =40824
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =734832
	ldr	r12, [fp, #-168]
	mul	r8, r12, r8
	add	r9, r8, r9
	ldr	r12, [fp, #-164]
	movw	r10, #:lower16:dp
	movt	r10, #:upper16:dp
	str	r12,	[r10, r9,LSL#2]
	ldr	r9, =7
	mul	r9, r4, r9
	ldr	r12, [fp, #-172]
	add	r9, r9, r12
	ldr	r8, =126
	mul	r8, r5, r8
	add	r9, r8, r9
	ldr	r8, =2268
	mul	r8, r6, r8
	add	r9, r8, r9
	ldr	r8, =40824
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =734832
	ldr	r12, [fp, #-168]
	mul	r8, r12, r8
	add	r9, r8, r9
	movw	r10, #:lower16:dp
	movt	r10, #:upper16:dp
	ldr	r9,	[r10, r9,LSL#2]
	mov	r0, r9
	b	.L7

.L7:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	dfs, .-dfs
	.global	cns
	.data
	.align	2
	.type	cns, %object
	.size	cns, 80
cns:
	.space	80

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 416
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #420
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]

.L146:
	ldr	r9, [fp, #-20]
	ldr	r8, =18
	cmp	r9, r8
	blt	.L251
	ldr	r10, =1
	cmp	r10, #0
	b	.L148

.L251:
	ldr	r10, =0
	cmp	r10, #0
	b	.L147
	b	.L148

.L147:
	ldr	r9, =0
	str	r9, [fp, #-24]

.L152:
	ldr	r9, [fp, #-24]
	ldr	r8, =18
	cmp	r9, r8
	blt	.L252
	ldr	r10, =1
	cmp	r10, #0
	b	.L154

.L252:
	ldr	r10, =0
	cmp	r10, #0
	b	.L153
	b	.L154

.L153:
	ldr	r9, =0
	str	r9, [fp, #-28]

.L158:
	ldr	r9, [fp, #-28]
	ldr	r8, =18
	cmp	r9, r8
	blt	.L253
	ldr	r10, =1
	cmp	r10, #0
	b	.L160

.L253:
	ldr	r10, =0
	cmp	r10, #0
	b	.L159
	b	.L160

.L159:
	ldr	r9, =0
	str	r9, [fp, #-32]

.L164:
	ldr	r9, [fp, #-32]
	ldr	r8, =18
	cmp	r9, r8
	blt	.L254
	ldr	r10, =1
	cmp	r10, #0
	b	.L166

.L254:
	ldr	r10, =0
	cmp	r10, #0
	b	.L165
	b	.L166

.L165:
	ldr	r9, =0
	str	r9, [fp, #-36]

.L170:
	ldr	r9, [fp, #-36]
	ldr	r8, =18
	cmp	r9, r8
	blt	.L255
	ldr	r10, =1
	cmp	r10, #0
	b	.L172

.L255:
	ldr	r10, =0
	cmp	r10, #0
	b	.L171
	b	.L172

.L171:
	ldr	r9, =0
	str	r9, [fp, #-40]

.L176:
	ldr	r9, [fp, #-40]
	ldr	r8, =7
	cmp	r9, r8
	blt	.L256
	ldr	r10, =1
	cmp	r10, #0
	b	.L178

.L256:
	ldr	r10, =0
	cmp	r10, #0
	b	.L177
	b	.L178

.L177:
	ldr	r9, =-1
	ldr	r8, [fp, #-20]
	ldr	r7, [fp, #-24]
	ldr	r6, [fp, #-28]
	ldr	r5, [fp, #-32]
	ldr	r4, [fp, #-36]
	ldr	r3, [fp, #-40]
	ldr	r2, =7
	mul	r4, r4, r2
	add	r4, r4, r3
	ldr	r3, =126
	mul	r5, r5, r3
	add	r5, r5, r4
	ldr	r4, =2268
	mul	r6, r6, r4
	add	r6, r6, r5
	ldr	r5, =40824
	mul	r7, r7, r5
	add	r7, r7, r6
	ldr	r6, =734832
	mul	r8, r8, r6
	add	r8, r8, r7
	movw	r10, #:lower16:dp
	movt	r10, #:upper16:dp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-40]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-40]
	b	.L176

.L178:
	ldr	r9, [fp, #-36]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-36]
	b	.L170

.L172:
	ldr	r9, [fp, #-32]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-32]
	b	.L164

.L166:
	ldr	r9, [fp, #-28]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-28]
	b	.L158

.L160:
	ldr	r9, [fp, #-24]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-24]
	b	.L152

.L154:
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L146

.L148:
	ldr	r9, =0
	str	r9, [fp, #-20]

.L224:
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-16]
	cmp	r9, r8
	blt	.L257
	ldr	r10, =1
	cmp	r10, #0
	b	.L226

.L257:
	ldr	r10, =0
	cmp	r10, #0
	b	.L225
	b	.L226

.L225:
	bl	getint
	mov	r9, r0
	ldr	r8, [fp, #-20]
	movw	r10, #:lower16:list
	movt	r10, #:upper16:list
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-20]
	movw	r10, #:lower16:list
	movt	r10, #:upper16:list
	ldr	r9,	[r10, r9,LSL#2]
	movw	r10, #:lower16:cns
	movt	r10, #:upper16:cns
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =1
	add	r9, r8, r9
	ldr	r8, [fp, #-20]
	movw	r10, #:lower16:list
	movt	r10, #:upper16:list
	ldr	r8,	[r10, r8,LSL#2]
	movw	r10, #:lower16:cns
	movt	r10, #:upper16:cns
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L224

.L226:
	ldr	r9, =1
	movw	r10, #:lower16:cns
	movt	r10, #:upper16:cns
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =2
	movw	r10, #:lower16:cns
	movt	r10, #:upper16:cns
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r7, =3
	movw	r10, #:lower16:cns
	movt	r10, #:upper16:cns
	ldr	r7,	[r10, r7,LSL#2]
	ldr	r6, =4
	movw	r10, #:lower16:cns
	movt	r10, #:upper16:cns
	ldr	r6,	[r10, r6,LSL#2]
	ldr	r5, =5
	movw	r10, #:lower16:cns
	movt	r10, #:upper16:cns
	ldr	r5,	[r10, r5,LSL#2]
	ldr	r4, =0
	mov	r0, r9
	mov	r1, r8
	mov	r10, r2
	mov	r2, r7
	mov	r7, r10
	mov	r10, r3
	mov	r3, r6
	mov	r6, r10
	str	r5, [sp, #0]
	str	r4, [sp, #4]
	bl	dfs
	mov	r9, r0
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-24]
	mov	r0, r9
	bl	putint
	mov	r0, r9
	b	.L145

.L145:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
