
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	relu_reg
	.type	relu_reg, %function
relu_reg:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-16]
	ldr	r9, [fp, #-16]
	ldr	r8, =127
	cmp	r9, r8
	bgt	.L1588
	ldr	r10, =1
	cmp	r10, #0
	b	.L3

.L1588:
	ldr	r10, =0
	cmp	r10, #0
	b	.L2
	b	.L3

.L2:
	ldr	r9, =127
	mov	r0, r9
	b	.L1

.L3:
	ldr	r9, [fp, #-16]
	ldr	r8, =0
	cmp	r9, r8
	blt	.L1589
	ldr	r10, =1
	cmp	r10, #0
	b	.L8

.L1589:
	ldr	r10, =0
	cmp	r10, #0
	b	.L7
	b	.L8

.L7:
	ldr	r9, =0
	mov	r0, r9
	b	.L1

.L8:
	ldr	r9, [fp, #-16]
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	relu_reg, .-relu_reg

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	model
	.type	model, %function
model:
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #84
	str	r0, [fp, #-16]
	ldr	r9, =0
	ldr	r8, =5
	ldr	r7, =0
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	ldr	r8, =85
	mul	r9, r8, r9
	ldr	r8, =1
	ldr	r7, =5
	ldr	r6, =0
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =23
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =2
	ldr	r7, =5
	ldr	r6, =0
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =-82
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =3
	ldr	r7, =5
	ldr	r6, =0
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =-103
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =4
	ldr	r7, =5
	ldr	r6, =0
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =-123
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =0
	ldr	r7, =5
	ldr	r6, =1
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =64
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =1
	ldr	r7, =5
	ldr	r6, =1
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =-120
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =2
	ldr	r7, =5
	ldr	r6, =1
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =50
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =3
	ldr	r7, =5
	ldr	r6, =1
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =-59
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =4
	ldr	r7, =5
	ldr	r6, =1
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =47
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =0
	ldr	r7, =5
	ldr	r6, =2
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =-111
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =1
	ldr	r7, =5
	ldr	r6, =2
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =-67
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =2
	ldr	r7, =5
	ldr	r6, =2
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =-106
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =3
	ldr	r7, =5
	ldr	r6, =2
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =-75
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =4
	ldr	r7, =5
	ldr	r6, =2
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =-102
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =0
	ldr	r7, =5
	ldr	r6, =3
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =34
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =1
	ldr	r7, =5
	ldr	r6, =3
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =-39
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =2
	ldr	r7, =5
	ldr	r6, =3
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =65
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =3
	ldr	r7, =5
	ldr	r6, =3
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =47
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =4
	ldr	r7, =5
	ldr	r6, =3
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =113
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =0
	ldr	r7, =5
	ldr	r6, =4
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =110
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =1
	ldr	r7, =5
	ldr	r6, =4
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =47
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =2
	ldr	r7, =5
	ldr	r6, =4
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =-4
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =3
	ldr	r7, =5
	ldr	r6, =4
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =80
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =4
	ldr	r7, =5
	ldr	r6, =4
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =46
	mul	r8, r7, r8
	add	r9, r8, r9
	mov	r0, r9
	bl	relu_reg
	mov	r9, r0
	ldr	r8, =39
	mul	r9, r8, r9
	ldr	r8, =0
	ldr	r7, =5
	ldr	r6, =0
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =-106
	mul	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =126
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-18
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-31
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-8
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =47
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-4
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =67
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-94
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-121
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =7
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-21
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-60
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-43
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =105
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-42
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =87
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =29
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-106
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-31
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-110
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-100
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-22
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-75
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-125
	mul	r7, r6, r7
	add	r8, r7, r8
	mov	r0, r8
	bl	relu_reg
	mov	r8, r0
	ldr	r7, =77
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =0
	ldr	r7, =5
	ldr	r6, =0
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =26
	mul	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =76
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-70
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =29
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-95
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =96
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =52
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-68
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-5
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =34
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-34
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =102
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =6
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-38
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =27
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =110
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =116
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =39
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-63
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-99
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =65
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =120
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-39
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-6
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =94
	mul	r7, r6, r7
	add	r8, r7, r8
	mov	r0, r8
	bl	relu_reg
	mov	r8, r0
	ldr	r7, =127
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =0
	ldr	r7, =5
	ldr	r6, =0
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =-23
	mul	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-63
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =49
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =50
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =72
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =85
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-30
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =12
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =125
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-117
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-65
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-67
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =125
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =110
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-31
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-123
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =83
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =122
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =11
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-23
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-47
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-32
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-117
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =95
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =118
	mul	r7, r6, r7
	add	r8, r7, r8
	mov	r0, r8
	bl	relu_reg
	mov	r8, r0
	ldr	r7, =-106
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =0
	ldr	r7, =5
	ldr	r6, =0
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =8
	mul	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =82
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-104
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =101
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-116
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-63
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-16
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-70
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =125
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =75
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =66
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-96
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-101
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-114
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =59
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =12
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =5
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-95
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =116
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-93
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =15
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =79
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =3
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =49
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-124
	mul	r7, r6, r7
	add	r8, r7, r8
	mov	r0, r8
	bl	relu_reg
	mov	r8, r0
	ldr	r7, =-3
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =0
	ldr	r7, =5
	ldr	r6, =0
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =81
	mul	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =68
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-102
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-74
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =121
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-15
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =55
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =101
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-13
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-62
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =64
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =114
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =38
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-21
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =112
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =114
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =112
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-10
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-16
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-50
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-112
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-116
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-54
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =82
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-72
	mul	r7, r6, r7
	add	r8, r7, r8
	mov	r0, r8
	bl	relu_reg
	mov	r8, r0
	ldr	r7, =32
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =0
	ldr	r7, =5
	ldr	r6, =0
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =15
	mul	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-77
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =66
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-90
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-6
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-30
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-8
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =81
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =2
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-110
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-95
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =59
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =52
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =15
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =55
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-33
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =14
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =58
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =67
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =86
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-79
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =48
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-13
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-15
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =66
	mul	r7, r6, r7
	add	r8, r7, r8
	mov	r0, r8
	bl	relu_reg
	mov	r8, r0
	ldr	r7, =-95
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =0
	ldr	r7, =5
	ldr	r6, =0
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =33
	mul	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =82
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =67
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =30
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-2
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =65
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =120
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-13
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =18
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =5
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =104
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-119
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-7
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =71
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =107
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =24
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =82
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-96
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-104
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-121
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =65
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =97
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =83
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =46
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-84
	mul	r7, r6, r7
	add	r8, r7, r8
	mov	r0, r8
	bl	relu_reg
	mov	r8, r0
	ldr	r7, =-50
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =0
	ldr	r7, =5
	ldr	r6, =0
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =-29
	mul	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =7
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-70
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =38
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-90
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-15
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-32
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =37
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =36
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-62
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-125
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-46
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-70
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =37
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-73
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-34
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-87
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-75
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =71
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-77
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =53
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =37
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-103
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-13
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-114
	mul	r7, r6, r7
	add	r8, r7, r8
	mov	r0, r8
	bl	relu_reg
	mov	r8, r0
	ldr	r7, =-23
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =0
	ldr	r7, =5
	ldr	r6, =0
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, =67
	mul	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =42
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =41
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-123
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =0
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-92
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =10
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-77
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =75
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =96
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =1
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-51
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =109
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-74
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-7
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-122
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =2
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =67
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =47
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =22
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-68
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =38
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =3
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =29
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =0
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =115
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =1
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-121
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =36
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =3
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =-49
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =4
	ldr	r6, =5
	ldr	r5, =4
	mul	r6, r5, r6
	add	r7, r6, r7
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, =85
	mul	r7, r6, r7
	add	r8, r7, r8
	mov	r0, r8
	bl	relu_reg
	mov	r8, r0
	ldr	r7, =46
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =0
	cmp	r9, r8
	bgt	.L1590
	ldr	r10, =1
	cmp	r10, #0
	b	.L14

.L1590:
	ldr	r10, =0
	cmp	r10, #0
	b	.L13
	b	.L14

.L13:
	ldr	r9, =1
	mov	r0, r9
	b	.L12

.L14:
	ldr	r9, =0
	mov	r0, r9
	b	.L12

.L12:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	model, .-model

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 372
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #376
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-16]

.L1546:
	ldr	r9, [fp, #-16]
	ldr	r8, =0
	cmp	r9, r8
	bgt	.L1591
	ldr	r10, =1
	cmp	r10, #0
	b	.L1548

.L1591:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1547
	b	.L1548

.L1547:
	ldr	r9, =0
	str	r9, [fp, #-120]

.L1552:
	ldr	r9, [fp, #-120]
	ldr	r8, =5
	cmp	r9, r8
	blt	.L1592
	ldr	r10, =1
	cmp	r10, #0
	b	.L1554

.L1592:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1553
	b	.L1554

.L1553:
	ldr	r9, =0
	str	r9, [fp, #-124]

.L1558:
	ldr	r9, [fp, #-124]
	ldr	r8, =5
	cmp	r9, r8
	blt	.L1593
	ldr	r10, =1
	cmp	r10, #0
	b	.L1560

.L1593:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1559
	b	.L1560

.L1559:
	bl	getint
	mov	r9, r0
	ldr	r8, [fp, #-120]
	ldr	r7, [fp, #-124]
	ldr	r6, =5
	mul	r8, r8, r6
	add	r8, r8, r7
	ldr	r10, =-116
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-124]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-124]
	b	.L1558

.L1560:
	ldr	r9, [fp, #-120]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-120]
	b	.L1552

.L1554:
	ldr	r9, =-116
	add	r9, r11, r9
	mov	r0, r9
	bl	model
	mov	r9, r0
	cmp	r9, #0
	bne	.L1594
	ldr	r10, =1
	cmp	r10, #0
	b	.L1580

.L1594:
	ldr	r10, =0
	cmp	r10, #0
	b	.L1579
	b	.L1580

.L1579:
	ldr	r9, =99
	mov	r0, r9
	bl	putch
	ldr	r9, =97
	mov	r0, r9
	bl	putch
	ldr	r9, =116
	mov	r0, r9
	bl	putch
	ldr	r9, =10
	mov	r0, r9
	bl	putch
	b	.L1581

.L1580:
	ldr	r9, =100
	mov	r0, r9
	bl	putch
	ldr	r9, =111
	mov	r0, r9
	bl	putch
	ldr	r9, =103
	mov	r0, r9
	bl	putch
	ldr	r9, =10
	mov	r0, r9
	bl	putch

.L1581:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	sub	r9, r9, r8
	str	r9, [fp, #-16]
	b	.L1546

.L1548:
	ldr	r9, =0
	mov	r0, r9
	b	.L1545

.L1545:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
