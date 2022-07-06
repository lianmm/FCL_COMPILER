	.global	n
	.data
	.align	2
	.type	n, %object
	.size	n, 4
n:
	.word	0


	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	bubblesort
	.type	bubblesort, %function
bubblesort:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #52
	str	r0, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-20]

.L5:
	ldr	r9, [fp, #-20]
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	ldr	r7, =1
	sub	r8, r8, r7
	cmp	r9, r8
	blt	.L795
	ldr	r10, =1
	cmp	r10, #0
	b	.L7

.L795:
	ldr	r10, =0
	cmp	r10, #0
	b	.L6
	b	.L7

.L6:
	ldr	r9, =0
	str	r9, [fp, #-24]

.L17:
	ldr	r9, [fp, #-24]
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	ldr	r7, [fp, #-20]
	sub	r8, r8, r7
	ldr	r7, =1
	sub	r8, r8, r7
	cmp	r9, r8
	blt	.L796
	ldr	r10, =1
	cmp	r10, #0
	b	.L19

.L796:
	ldr	r10, =0
	cmp	r10, #0
	b	.L18
	b	.L19

.L18:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	ldr	r8, [fp, #-24]
	ldr	r7, =1
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	cmp	r9, r8
	bgt	.L797
	ldr	r10, =1
	cmp	r10, #0
	b	.L30

.L797:
	ldr	r10, =0
	cmp	r10, #0
	b	.L29
	b	.L30

.L29:
	ldr	r9, [fp, #-24]
	ldr	r8, =1
	add	r9, r8, r9
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	str	r9, [fp, #-28]
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	ldr	r8, [fp, #-24]
	ldr	r7, =1
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	str	r9,	[r7, r8,LSL#2]
	ldr	r9, [fp, #-28]
	ldr	r8, [fp, #-24]
	ldr	r7, [fp, #-16]
	str	r9,	[r7, r8,LSL#2]

.L30:
	ldr	r9, [fp, #-24]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-24]
	b	.L17

.L19:
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L5

.L7:
	ldr	r9, =0
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	bubblesort, .-bubblesort

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	insertsort
	.type	insertsort, %function
insertsort:
	@ args = 0, pretend = 0, frame = 184
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #188
	str	r0, [fp, #-16]
	ldr	r9, =1
	str	r9, [fp, #-20]

.L68:
	ldr	r9, [fp, #-20]
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	cmp	r9, r8
	blt	.L798
	ldr	r10, =1
	cmp	r10, #0
	b	.L70

.L798:
	ldr	r10, =0
	cmp	r10, #0
	b	.L69
	b	.L70

.L69:
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	sub	r9, r9, r8
	str	r9, [fp, #-28]

.L83:
	ldr	r9, [fp, #-28]
	ldr	r8, =-1
	cmp	r9, r8
	bgt	.L799
	ldr	r10, =1
	cmp	r10, #0
	b	.L86

.L799:
	ldr	r10, =0
	cmp	r10, #0
	b	.L87
	b	.L86

.L87:
	ldr	r8, [fp, #-24]
	ldr	r7, [fp, #-28]
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	cmp	r8, r7
	blt	.L800
	ldr	r10, =1
	cmp	r10, #0
	b	.L88

.L800:
	ldr	r10, =0
	cmp	r10, #0
	b	.L88

.L88:

.L86:
	beq	.L84
	b	.L85

.L84:
	ldr	r9, [fp, #-28]
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	ldr	r8, [fp, #-28]
	ldr	r7, =1
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	str	r9,	[r7, r8,LSL#2]
	ldr	r9, [fp, #-28]
	ldr	r8, =1
	sub	r9, r9, r8
	str	r9, [fp, #-28]
	b	.L83

.L85:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	ldr	r7, =1
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	str	r9,	[r7, r8,LSL#2]
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L68

.L70:
	ldr	r9, =0
	mov	r0, r9
	b	.L64

.L64:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	insertsort, .-insertsort

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	QuickSort
	.type	QuickSort, %function
QuickSort:
	@ args = 0, pretend = 0, frame = 232
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #236
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-24]
	cmp	r9, r8
	blt	.L801
	ldr	r10, =1
	cmp	r10, #0
	b	.L121

.L801:
	ldr	r10, =0
	cmp	r10, #0
	b	.L120
	b	.L121

.L120:
	str	r9, [fp, #-28]
	str	r8, [fp, #-32]
	ldr	r7, [fp, #-16]
	ldr	r7,	[r7, r9,LSL#2]
	str	r7, [fp, #-36]

.L134:
	ldr	r7, [fp, #-28]
	ldr	r6, [fp, #-32]
	cmp	r7, r6
	blt	.L802
	ldr	r10, =1
	cmp	r10, #0
	b	.L136

.L802:
	ldr	r10, =0
	cmp	r10, #0
	b	.L135
	b	.L136

.L135:

.L140:
	ldr	r7, [fp, #-28]
	ldr	r6, [fp, #-32]
	cmp	r7, r6
	blt	.L803
	ldr	r10, =1
	cmp	r10, #0
	b	.L143

.L803:
	ldr	r10, =0
	cmp	r10, #0
	b	.L144
	b	.L143

.L144:
	ldr	r6, [fp, #-32]
	ldr	r5, [fp, #-16]
	ldr	r6,	[r5, r6,LSL#2]
	ldr	r5, [fp, #-36]
	ldr	r4, =1
	sub	r5, r5, r4
	cmp	r6, r5
	bgt	.L804
	ldr	r10, =1
	cmp	r10, #0
	b	.L145

.L804:
	ldr	r10, =0
	cmp	r10, #0
	b	.L145

.L145:

.L143:
	beq	.L141
	b	.L142

.L141:
	ldr	r7, [fp, #-32]
	ldr	r6, =1
	sub	r7, r7, r6
	str	r7, [fp, #-32]
	b	.L140

.L142:
	ldr	r7, [fp, #-28]
	ldr	r6, [fp, #-32]
	cmp	r7, r6
	blt	.L805
	ldr	r10, =1
	cmp	r10, #0
	b	.L162

.L805:
	ldr	r10, =0
	cmp	r10, #0
	b	.L161
	b	.L162

.L161:
	ldr	r7, [fp, #-32]
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, [fp, #-28]
	ldr	r5, [fp, #-16]
	str	r7,	[r5, r6,LSL#2]
	ldr	r7, [fp, #-28]
	ldr	r6, =1
	add	r7, r6, r7
	str	r7, [fp, #-28]

.L162:

.L175:
	ldr	r7, [fp, #-28]
	ldr	r6, [fp, #-32]
	cmp	r7, r6
	blt	.L806
	ldr	r10, =1
	cmp	r10, #0
	b	.L178

.L806:
	ldr	r10, =0
	cmp	r10, #0
	b	.L179
	b	.L178

.L179:
	ldr	r6, [fp, #-28]
	ldr	r5, [fp, #-16]
	ldr	r6,	[r5, r6,LSL#2]
	ldr	r5, [fp, #-36]
	cmp	r6, r5
	blt	.L807
	ldr	r10, =1
	cmp	r10, #0
	b	.L180

.L807:
	ldr	r10, =0
	cmp	r10, #0
	b	.L180

.L180:

.L178:
	beq	.L176
	b	.L177

.L176:
	ldr	r7, [fp, #-28]
	ldr	r6, =1
	add	r7, r6, r7
	str	r7, [fp, #-28]
	b	.L175

.L177:
	ldr	r7, [fp, #-28]
	ldr	r6, [fp, #-32]
	cmp	r7, r6
	blt	.L808
	ldr	r10, =1
	cmp	r10, #0
	b	.L194

.L808:
	ldr	r10, =0
	cmp	r10, #0
	b	.L193
	b	.L194

.L193:
	ldr	r7, [fp, #-28]
	ldr	r6, [fp, #-16]
	ldr	r7,	[r6, r7,LSL#2]
	ldr	r6, [fp, #-32]
	ldr	r5, [fp, #-16]
	str	r7,	[r5, r6,LSL#2]
	ldr	r7, [fp, #-32]
	ldr	r6, =1
	sub	r7, r7, r6
	str	r7, [fp, #-32]

.L194:
	b	.L134

.L136:
	ldr	r7, [fp, #-36]
	ldr	r6, [fp, #-28]
	ldr	r5, [fp, #-16]
	str	r7,	[r5, r6,LSL#2]
	ldr	r7, =1
	sub	r7, r6, r7
	str	r7, [fp, #-40]
	ldr	r7, [fp, #-16]
	ldr	r5, [fp, #-40]
	mov	r0, r7
	mov	r1, r9
	mov	r2, r5
	bl	QuickSort
	mov	r9, r0
	str	r9, [fp, #-40]
	ldr	r9, =1
	add	r9, r9, r6
	str	r9, [fp, #-40]
	ldr	r7, [fp, #-16]
	mov	r0, r7
	mov	r1, r9
	mov	r2, r8
	bl	QuickSort
	mov	r9, r0
	str	r9, [fp, #-40]

.L121:
	ldr	r9, =0
	mov	r0, r9
	b	.L119

.L119:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	QuickSort, .-QuickSort

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	getMid
	.type	getMid, %function
getMid:
	@ args = 0, pretend = 0, frame = 116
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #120
	str	r0, [fp, #-16]
	movw	r9, #:lower16:n
	movt	r9, #:upper16:n
	ldr	r9, [r9, #0]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r8, r1
	ldr	r7, =0
	cmp	r8, r7
	beq	.L229
	b	.L230

.L229:
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-16]
	ldr	r8,	[r8, r9,LSL#2]
	ldr	r7, =1
	sub	r9, r9, r7
	ldr	r7, [fp, #-16]
	ldr	r9,	[r7, r9,LSL#2]
	add	r9, r9, r8
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	mov	r0, r9
	b	.L228
	b	.L231

.L230:
	movw	r9, #:lower16:n
	movt	r9, #:upper16:n
	ldr	r9, [r9, #0]
	ldr	r8, =2
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	mov	r0, r9
	b	.L228

.L231:

.L228:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	getMid, .-getMid

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	getMost
	.type	getMost, %function
getMost:
	@ args = 0, pretend = 0, frame = 8164
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	ldr	r12, =8168
	sub	sp, sp, r12
	str	r0, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-4020]

.L263:
	ldr	r9, [fp, #-4020]
	ldr	r8, =1000
	cmp	r9, r8
	blt	.L809
	ldr	r10, =1
	cmp	r10, #0
	b	.L265

.L809:
	ldr	r10, =0
	cmp	r10, #0
	b	.L264
	b	.L265

.L264:
	ldr	r9, =0
	ldr	r8, [fp, #-4020]
	ldr	r10, =-4016
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-4020]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-4020]
	b	.L263

.L265:
	ldr	r9, =0
	str	r9, [fp, #-4020]
	ldr	r9, =0
	str	r9, [fp, #-4024]

.L284:
	ldr	r9, [fp, #-4020]
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	cmp	r9, r8
	blt	.L810
	ldr	r10, =1
	cmp	r10, #0
	b	.L286

.L810:
	ldr	r10, =0
	cmp	r10, #0
	b	.L285
	b	.L286

.L285:
	ldr	r9, [fp, #-4020]
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	str	r9, [fp, #-4032]
	ldr	r9, [fp, #-4032]
	ldr	r10, =-4016
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =1
	add	r9, r8, r9
	ldr	r8, [fp, #-4032]
	ldr	r10, =-4016
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-4032]
	ldr	r10, =-4016
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, [fp, #-4024]
	cmp	r9, r8
	bgt	.L811
	ldr	r10, =1
	cmp	r10, #0
	b	.L300

.L811:
	ldr	r10, =0
	cmp	r10, #0
	b	.L299
	b	.L300

.L299:
	ldr	r9, [fp, #-4032]
	ldr	r10, =-4016
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	str	r9, [fp, #-4024]
	ldr	r9, [fp, #-4032]
	str	r9, [fp, #-4028]

.L300:
	ldr	r9, [fp, #-4020]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-4020]
	b	.L284

.L286:
	ldr	r9, [fp, #-4028]
	mov	r0, r9
	b	.L259

.L259:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	getMost, .-getMost

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	revert
	.type	revert, %function
revert:
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #132
	str	r0, [fp, #-16]
	ldr	r9, =0
	str	r9, [fp, #-24]
	ldr	r9, =0
	str	r9, [fp, #-28]

.L323:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	cmp	r9, r8
	blt	.L812
	ldr	r10, =1
	cmp	r10, #0
	b	.L325

.L812:
	ldr	r10, =0
	cmp	r10, #0
	b	.L324
	b	.L325

.L324:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	str	r9, [fp, #-20]
	ldr	r9, [fp, #-28]
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	ldr	r8, [fp, #-24]
	ldr	r7, [fp, #-16]
	str	r9,	[r7, r8,LSL#2]
	ldr	r9, [fp, #-20]
	ldr	r8, [fp, #-28]
	ldr	r7, [fp, #-16]
	str	r9,	[r7, r8,LSL#2]
	ldr	r9, [fp, #-24]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, =1
	sub	r9, r9, r8
	str	r9, [fp, #-28]
	b	.L323

.L325:
	ldr	r9, =0
	mov	r0, r9
	b	.L316

.L316:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	revert, .-revert

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	arrCopy
	.type	arrCopy, %function
arrCopy:
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #84
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r9, =0
	str	r9, [fp, #-24]

.L354:
	ldr	r9, [fp, #-24]
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	cmp	r9, r8
	blt	.L813
	ldr	r10, =1
	cmp	r10, #0
	b	.L356

.L813:
	ldr	r10, =0
	cmp	r10, #0
	b	.L355
	b	.L356

.L355:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	ldr	r8, [fp, #-24]
	ldr	r7, [fp, #-20]
	str	r9,	[r7, r8,LSL#2]
	ldr	r9, [fp, #-24]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-24]
	b	.L354

.L356:
	ldr	r9, =0
	mov	r0, r9
	b	.L350

.L350:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	arrCopy, .-arrCopy

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	calSum
	.type	calSum, %function
calSum:
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #132
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r9, =0
	str	r9, [fp, #-24]
	ldr	r9, =0
	str	r9, [fp, #-28]

.L376:
	ldr	r9, [fp, #-28]
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	cmp	r9, r8
	blt	.L814
	ldr	r10, =1
	cmp	r10, #0
	b	.L378

.L814:
	ldr	r10, =0
	cmp	r10, #0
	b	.L377
	b	.L378

.L377:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	add	r9, r8, r9
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, [fp, #-20]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	ldr	r8, [fp, #-20]
	ldr	r7, =1
	sub	r8, r8, r7
	cmp	r9, r8
	bne	.L815
	ldr	r10, =1
	cmp	r10, #0
	b	.L389

.L815:
	ldr	r10, =0
	cmp	r10, #0
	b	.L388
	b	.L389

.L388:
	ldr	r9, =0
	ldr	r8, [fp, #-28]
	ldr	r7, [fp, #-16]
	str	r9,	[r7, r8,LSL#2]
	b	.L390

.L389:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	ldr	r7, [fp, #-16]
	str	r9,	[r7, r8,LSL#2]
	ldr	r9, =0
	str	r9, [fp, #-24]

.L390:
	ldr	r9, [fp, #-28]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-28]
	b	.L376

.L378:
	ldr	r9, =0
	mov	r0, r9
	b	.L369

.L369:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	calSum, .-calSum

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	avgPooling
	.type	avgPooling, %function
avgPooling:
	@ args = 0, pretend = 0, frame = 292
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #296
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r9, =0
	str	r9, [fp, #-28]
	ldr	r9, =0
	str	r9, [fp, #-24]

.L422:
	ldr	r9, [fp, #-28]
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	cmp	r9, r8
	blt	.L816
	ldr	r10, =1
	cmp	r10, #0
	b	.L424

.L816:
	ldr	r10, =0
	cmp	r10, #0
	b	.L423
	b	.L424

.L423:
	ldr	r9, [fp, #-28]
	ldr	r8, [fp, #-20]
	ldr	r7, =1
	sub	r8, r8, r7
	cmp	r9, r8
	blt	.L817
	ldr	r10, =1
	cmp	r10, #0
	b	.L429

.L817:
	ldr	r10, =0
	cmp	r10, #0
	b	.L428
	b	.L429

.L428:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	add	r9, r8, r9
	str	r9, [fp, #-24]
	b	.L430

.L429:
	ldr	r9, [fp, #-28]
	ldr	r8, [fp, #-20]
	ldr	r7, =1
	sub	r8, r8, r7
	cmp	r9, r8
	beq	.L443
	b	.L444

.L443:
	ldr	r9, =0
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	str	r9, [fp, #-32]
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-20]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	ldr	r8, =0
	ldr	r7, [fp, #-16]
	str	r9,	[r7, r8,LSL#2]
	b	.L445

.L444:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	ldr	r7, [fp, #-16]
	ldr	r8,	[r7, r8,LSL#2]
	add	r9, r8, r9
	ldr	r8, [fp, #-32]
	sub	r9, r9, r8
	str	r9, [fp, #-24]
	ldr	r9, [fp, #-28]
	ldr	r8, [fp, #-20]
	sub	r9, r9, r8
	ldr	r8, =1
	add	r9, r8, r9
	ldr	r8, [fp, #-16]
	ldr	r9,	[r8, r9,LSL#2]
	str	r9, [fp, #-32]
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-20]
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idiv
	mov	r9, r0
	ldr	r8, [fp, #-28]
	ldr	r7, [fp, #-20]
	sub	r8, r8, r7
	ldr	r7, =1
	add	r8, r7, r8
	ldr	r7, [fp, #-16]
	str	r9,	[r7, r8,LSL#2]

.L445:

.L430:
	ldr	r9, [fp, #-28]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-28]
	b	.L422

.L424:
	movw	r9, #:lower16:n
	movt	r9, #:upper16:n
	ldr	r9, [r9, #0]
	ldr	r8, [fp, #-20]
	sub	r9, r9, r8
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-28]

.L506:
	ldr	r9, [fp, #-28]
	movw	r8, #:lower16:n
	movt	r8, #:upper16:n
	ldr	r8, [r8, #0]
	cmp	r9, r8
	blt	.L818
	ldr	r10, =1
	cmp	r10, #0
	b	.L508

.L818:
	ldr	r10, =0
	cmp	r10, #0
	b	.L507
	b	.L508

.L507:
	ldr	r9, =0
	ldr	r8, [fp, #-28]
	ldr	r7, [fp, #-16]
	str	r9,	[r7, r8,LSL#2]
	ldr	r9, [fp, #-28]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-28]
	b	.L506

.L508:
	ldr	r9, =0
	mov	r0, r9
	b	.L415

.L415:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	avgPooling, .-avgPooling

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 816
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	ldr	r12, =820
	sub	sp, sp, r12
	ldr	r9, =32
	movw	r10, #:lower16:n
	movt	r10, #:upper16:n
	str	r9, [r10, #0]
	ldr	r9, =7
	ldr	r8, =0
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =23
	ldr	r8, =1
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =89
	ldr	r8, =2
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =26
	ldr	r8, =3
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =282
	ldr	r8, =4
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =254
	ldr	r8, =5
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =27
	ldr	r8, =6
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =5
	ldr	r8, =7
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =83
	ldr	r8, =8
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =273
	ldr	r8, =9
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =574
	ldr	r8, =10
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =905
	ldr	r8, =11
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =354
	ldr	r8, =12
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =657
	ldr	r8, =13
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =935
	ldr	r8, =14
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =264
	ldr	r8, =15
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =639
	ldr	r8, =16
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =459
	ldr	r8, =17
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =29
	ldr	r8, =18
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =68
	ldr	r8, =19
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =929
	ldr	r8, =20
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =756
	ldr	r8, =21
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =452
	ldr	r8, =22
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =279
	ldr	r8, =23
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =58
	ldr	r8, =24
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =87
	ldr	r8, =25
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =96
	ldr	r8, =26
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =36
	ldr	r8, =27
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =39
	ldr	r8, =28
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =28
	ldr	r8, =29
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =1
	ldr	r8, =30
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =290
	ldr	r8, =31
	ldr	r10, =-140
	add	r10, r10, fp
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, =-140
	add	r9, r11, r9
	ldr	r8, =-268
	add	r8, r11, r8
	mov	r0, r9
	mov	r1, r8
	bl	arrCopy
	mov	r9, r0
	str	r9, [fp, #-272]
	ldr	r9, =-268
	add	r9, r11, r9
	mov	r0, r9
	bl	revert
	mov	r9, r0
	str	r9, [fp, #-272]
	ldr	r9, =0
	str	r9, [fp, #-276]

.L630:
	ldr	r9, [fp, #-276]
	ldr	r8, =32
	cmp	r9, r8
	blt	.L819
	ldr	r10, =1
	cmp	r10, #0
	b	.L632

.L819:
	ldr	r10, =0
	cmp	r10, #0
	b	.L631
	b	.L632

.L631:
	ldr	r9, [fp, #-276]
	ldr	r10, =-268
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	str	r9, [fp, #-272]
	ldr	r9, [fp, #-272]
	mov	r0, r9
	bl	putint
	ldr	r9, [fp, #-276]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-276]
	b	.L630

.L632:
	ldr	r9, =-268
	add	r9, r11, r9
	mov	r0, r9
	bl	bubblesort
	mov	r9, r0
	str	r9, [fp, #-272]
	ldr	r9, =0
	str	r9, [fp, #-276]

.L651:
	ldr	r9, [fp, #-276]
	ldr	r8, =32
	cmp	r9, r8
	blt	.L820
	ldr	r10, =1
	cmp	r10, #0
	b	.L653

.L820:
	ldr	r10, =0
	cmp	r10, #0
	b	.L652
	b	.L653

.L652:
	ldr	r9, [fp, #-276]
	ldr	r10, =-268
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	str	r9, [fp, #-272]
	ldr	r9, [fp, #-272]
	mov	r0, r9
	bl	putint
	ldr	r9, [fp, #-276]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-276]
	b	.L651

.L653:
	ldr	r9, =-268
	add	r9, r11, r9
	mov	r0, r9
	bl	getMid
	mov	r9, r0
	str	r9, [fp, #-272]
	ldr	r9, [fp, #-272]
	mov	r0, r9
	bl	putint
	ldr	r9, =-268
	add	r9, r11, r9
	mov	r0, r9
	bl	getMost
	mov	r9, r0
	str	r9, [fp, #-272]
	mov	r0, r9
	bl	putint
	ldr	r9, =-140
	add	r9, r11, r9
	ldr	r8, =-268
	add	r8, r11, r8
	mov	r0, r9
	mov	r1, r8
	bl	arrCopy
	mov	r9, r0
	str	r9, [fp, #-272]
	ldr	r9, =-268
	add	r9, r11, r9
	mov	r0, r9
	bl	bubblesort
	mov	r9, r0
	str	r9, [fp, #-272]
	ldr	r9, =0
	str	r9, [fp, #-276]

.L681:
	ldr	r9, [fp, #-276]
	ldr	r8, =32
	cmp	r9, r8
	blt	.L821
	ldr	r10, =1
	cmp	r10, #0
	b	.L683

.L821:
	ldr	r10, =0
	cmp	r10, #0
	b	.L682
	b	.L683

.L682:
	ldr	r9, [fp, #-276]
	ldr	r10, =-268
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	str	r9, [fp, #-272]
	ldr	r9, [fp, #-272]
	mov	r0, r9
	bl	putint
	ldr	r9, [fp, #-276]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-276]
	b	.L681

.L683:
	ldr	r9, =-140
	add	r9, r11, r9
	ldr	r8, =-268
	add	r8, r11, r8
	mov	r0, r9
	mov	r1, r8
	bl	arrCopy
	mov	r9, r0
	str	r9, [fp, #-272]
	ldr	r9, =-268
	add	r9, r11, r9
	mov	r0, r9
	bl	insertsort
	mov	r9, r0
	str	r9, [fp, #-272]
	ldr	r9, =0
	str	r9, [fp, #-276]

.L705:
	ldr	r9, [fp, #-276]
	ldr	r8, =32
	cmp	r9, r8
	blt	.L822
	ldr	r10, =1
	cmp	r10, #0
	b	.L707

.L822:
	ldr	r10, =0
	cmp	r10, #0
	b	.L706
	b	.L707

.L706:
	ldr	r9, [fp, #-276]
	ldr	r10, =-268
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	str	r9, [fp, #-272]
	ldr	r9, [fp, #-272]
	mov	r0, r9
	bl	putint
	ldr	r9, [fp, #-276]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-276]
	b	.L705

.L707:
	ldr	r9, =-140
	add	r9, r11, r9
	ldr	r8, =-268
	add	r8, r11, r8
	mov	r0, r9
	mov	r1, r8
	bl	arrCopy
	mov	r9, r0
	str	r9, [fp, #-272]
	ldr	r9, =0
	str	r9, [fp, #-276]
	ldr	r9, =31
	str	r9, [fp, #-272]
	ldr	r9, =-268
	add	r9, r11, r9
	ldr	r8, [fp, #-276]
	ldr	r7, [fp, #-272]
	mov	r0, r9
	mov	r1, r8
	mov	r2, r7
	bl	QuickSort
	mov	r9, r0
	str	r9, [fp, #-272]

.L732:
	ldr	r9, [fp, #-276]
	ldr	r8, =32
	cmp	r9, r8
	blt	.L823
	ldr	r10, =1
	cmp	r10, #0
	b	.L734

.L823:
	ldr	r10, =0
	cmp	r10, #0
	b	.L733
	b	.L734

.L733:
	ldr	r9, [fp, #-276]
	ldr	r10, =-268
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	str	r9, [fp, #-272]
	ldr	r9, [fp, #-272]
	mov	r0, r9
	bl	putint
	ldr	r9, [fp, #-276]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-276]
	b	.L732

.L734:
	ldr	r9, =-140
	add	r9, r11, r9
	ldr	r8, =-268
	add	r8, r11, r8
	mov	r0, r9
	mov	r1, r8
	bl	arrCopy
	mov	r9, r0
	str	r9, [fp, #-272]
	ldr	r9, =-268
	add	r9, r11, r9
	ldr	r8, =4
	mov	r0, r9
	mov	r1, r8
	bl	calSum
	mov	r9, r0
	str	r9, [fp, #-272]
	ldr	r9, =0
	str	r9, [fp, #-276]

.L756:
	ldr	r9, [fp, #-276]
	ldr	r8, =32
	cmp	r9, r8
	blt	.L824
	ldr	r10, =1
	cmp	r10, #0
	b	.L758

.L824:
	ldr	r10, =0
	cmp	r10, #0
	b	.L757
	b	.L758

.L757:
	ldr	r9, [fp, #-276]
	ldr	r10, =-268
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	str	r9, [fp, #-272]
	ldr	r9, [fp, #-272]
	mov	r0, r9
	bl	putint
	ldr	r9, [fp, #-276]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-276]
	b	.L756

.L758:
	ldr	r9, =-140
	add	r9, r11, r9
	ldr	r8, =-268
	add	r8, r11, r8
	mov	r0, r9
	mov	r1, r8
	bl	arrCopy
	mov	r9, r0
	str	r9, [fp, #-272]
	ldr	r9, =-268
	add	r9, r11, r9
	ldr	r8, =3
	mov	r0, r9
	mov	r1, r8
	bl	avgPooling
	mov	r9, r0
	str	r9, [fp, #-272]
	ldr	r9, =0
	str	r9, [fp, #-276]

.L780:
	ldr	r9, [fp, #-276]
	ldr	r8, =32
	cmp	r9, r8
	blt	.L825
	ldr	r10, =1
	cmp	r10, #0
	b	.L782

.L825:
	ldr	r10, =0
	cmp	r10, #0
	b	.L781
	b	.L782

.L781:
	ldr	r9, [fp, #-276]
	ldr	r10, =-268
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	str	r9, [fp, #-272]
	ldr	r9, [fp, #-272]
	mov	r0, r9
	bl	putint
	ldr	r9, [fp, #-276]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-276]
	b	.L780

.L782:
	ldr	r9, =0
	mov	r0, r9
	b	.L521

.L521:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
