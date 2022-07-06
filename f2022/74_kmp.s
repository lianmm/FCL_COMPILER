
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	get_next
	.type	get_next, %function
get_next:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #52
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r9, =-1
	ldr	r8, =0
	ldr	r7, [fp, #-20]
	str	r9,	[r7, r8,LSL#2]
	ldr	r9, =0
	str	r9, [fp, #-24]
	ldr	r9, =-1
	str	r9, [fp, #-28]

.L5:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	cmp	r9, #0
	bne	.L104
	ldr	r10, =1
	cmp	r10, #0
	b	.L7

.L104:
	ldr	r10, =0
	cmp	r10, #0
	b	.L6
	b	.L7

.L6:
	ldr	r9, [fp, #-28]
	ldr	r8, =-1
	cmp	r9, r8
	beq	.L11
	b	.L12

.L12:
	ldr	r8, [fp, #-24]
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	ldr	r7, [fp, #-28]
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	cmp	r8, r7

.L13:

.L11:
	beq	.L8
	b	.L9

.L8:
	ldr	r9, [fp, #-28]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-24]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, [fp, #-24]
	ldr	r7, [fp, #-20]
	str	r9,	[r7, r8,LSL#2]
	b	.L10

.L9:
	ldr	r9, [fp, #-28]
	ldr	r8, [fp, #-20]
	ldr	r9,	[r8, r9,LSL#2]
	str	r9, [fp, #-28]

.L10:
	b	.L5

.L7:

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	get_next, .-get_next

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	KMP
	.type	KMP, %function
KMP:
	@ args = 0, pretend = 0, frame = 32924
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	ldr	r12, =32928
	sub	sp, sp, r12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r9, [fp, #-16]
	ldr	r8, =-16404
	add	r8, r11, r8
	mov	r0, r9
	mov	r1, r8
	bl	get_next
	ldr	r9, =0
	ldr	r10, =-16408
	str	r9, [fp, r10]
	ldr	r9, =0
	ldr	r10, =-16412
	str	r9, [fp, r10]

.L39:
	ldr	r10, =-16412
	ldr	r9, [fp, r10]
	ldr	r8, [fp, #-20]
	ldr	r9,	[r8, r9,LSL#2]
	cmp	r9, #0
	bne	.L105
	ldr	r10, =1
	cmp	r10, #0
	b	.L41

.L105:
	ldr	r10, =0
	cmp	r10, #0
	b	.L40
	b	.L41

.L40:
	ldr	r10, =-16408
	ldr	r9, [fp, r10]
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	ldr	r10, =-16412
	ldr	r8, [fp, r10]
	ldr	r7, [fp, #-20]
	ldr	r8,	[r7, r8,LSL#2]
	cmp	r9, r8
	beq	.L42
	b	.L43

.L42:
	ldr	r10, =-16408
	ldr	r9, [fp, r10]
	ldr	r8, =1
	add	r9, r8, r9
	ldr	r10, =-16408
	str	r9, [fp, r10]
	ldr	r10, =-16412
	ldr	r9, [fp, r10]
	ldr	r8, =1
	add	r9, r8, r9
	ldr	r10, =-16412
	str	r9, [fp, r10]
	ldr	r10, =-16408
	ldr	r9, [fp, r10]
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	cmp	r9, #0
	beq	.L60
	b	.L61

.L60:
	ldr	r10, =-16412
	ldr	r9, [fp, r10]
	mov	r0, r9
	b	.L38

.L61:
	b	.L44

.L43:
	ldr	r10, =-16408
	ldr	r9, [fp, r10]
	ldr	r10, =-16404
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r10, =-16408
	str	r9, [fp, r10]
	ldr	r10, =-16408
	ldr	r9, [fp, r10]
	ldr	r8, =-1
	cmp	r9, r8
	beq	.L65
	b	.L66

.L65:
	ldr	r10, =-16408
	ldr	r9, [fp, r10]
	ldr	r8, =1
	add	r9, r8, r9
	ldr	r10, =-16408
	str	r9, [fp, r10]
	ldr	r10, =-16412
	ldr	r9, [fp, r10]
	ldr	r8, =1
	add	r9, r8, r9
	ldr	r10, =-16412
	str	r9, [fp, r10]

.L66:

.L44:
	b	.L39

.L41:
	ldr	r9, =-1
	mov	r0, r9
	b	.L38

.L38:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	KMP, .-KMP

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	read_str
	.type	read_str, %function
read_str:
	@ args = 0, pretend = 0, frame = 92
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #96
	str	r0, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]

.L83:
	ldr	r9, =1
	cmp	r9, #0
	bne	.L106
	ldr	r10, =1
	cmp	r10, #0
	b	.L85

.L106:
	ldr	r10, =0
	cmp	r10, #0
	b	.L84
	b	.L85

.L84:
	bl	getch
	mov	r9, r0
	ldr	r8, [fp, #-20]
	ldr	r7, [fp, #-16]
	str	r9,	[r7, r8,LSL#2]
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	ldr	r8, =10
	cmp	r9, r8
	beq	.L89
	b	.L90

.L89:
	b	.L85

.L90:
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L83

.L85:
	ldr	r9, =0
	ldr	r8, [fp, #-20]
	ldr	r7, [fp, #-16]
	str	r9,	[r7, r8,LSL#2]
	mov	r0, r8
	b	.L82

.L82:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	read_str, .-read_str

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 65596
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	ldr	r12, =65600
	sub	sp, sp, r12
	ldr	r9, =-16396
	add	r9, r11, r9
	mov	r0, r9
	bl	read_str
	mov	r12, r0
	ldr	r9, =-32780
	add	r9, r11, r9
	mov	r0, r9
	bl	read_str
	mov	r12, r0
	ldr	r9, =-16396
	add	r9, r11, r9
	ldr	r8, =-32780
	add	r8, r11, r8
	mov	r0, r9
	mov	r1, r8
	bl	KMP
	mov	r9, r0
	mov	r0, r9
	bl	putint
	ldr	r9, =10
	mov	r0, r9
	bl	putch
	ldr	r9, =0
	mov	r0, r9
	b	.L103

.L103:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
