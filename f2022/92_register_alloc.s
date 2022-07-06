	.global	a1
	.data
	.align	2
	.type	a1, %object
	.size	a1, 4
a1:
	.word	1

	.global	a2
	.data
	.align	2
	.type	a2, %object
	.size	a2, 4
a2:
	.word	2

	.global	a3
	.data
	.align	2
	.type	a3, %object
	.size	a3, 4
a3:
	.word	3

	.global	a4
	.data
	.align	2
	.type	a4, %object
	.size	a4, 4
a4:
	.word	4

	.global	a5
	.data
	.align	2
	.type	a5, %object
	.size	a5, 4
a5:
	.word	5

	.global	a6
	.data
	.align	2
	.type	a6, %object
	.size	a6, 4
a6:
	.word	6

	.global	a7
	.data
	.align	2
	.type	a7, %object
	.size	a7, 4
a7:
	.word	7

	.global	a8
	.data
	.align	2
	.type	a8, %object
	.size	a8, 4
a8:
	.word	8

	.global	a9
	.data
	.align	2
	.type	a9, %object
	.size	a9, 4
a9:
	.word	9

	.global	a10
	.data
	.align	2
	.type	a10, %object
	.size	a10, 4
a10:
	.word	10

	.global	a11
	.data
	.align	2
	.type	a11, %object
	.size	a11, 4
a11:
	.word	11

	.global	a12
	.data
	.align	2
	.type	a12, %object
	.size	a12, 4
a12:
	.word	12

	.global	a13
	.data
	.align	2
	.type	a13, %object
	.size	a13, 4
a13:
	.word	13

	.global	a14
	.data
	.align	2
	.type	a14, %object
	.size	a14, 4
a14:
	.word	14

	.global	a15
	.data
	.align	2
	.type	a15, %object
	.size	a15, 4
a15:
	.word	15

	.global	a16
	.data
	.align	2
	.type	a16, %object
	.size	a16, 4
a16:
	.word	16

	.global	a17
	.data
	.align	2
	.type	a17, %object
	.size	a17, 4
a17:
	.word	1

	.global	a18
	.data
	.align	2
	.type	a18, %object
	.size	a18, 4
a18:
	.word	2

	.global	a19
	.data
	.align	2
	.type	a19, %object
	.size	a19, 4
a19:
	.word	3

	.global	a20
	.data
	.align	2
	.type	a20, %object
	.size	a20, 4
a20:
	.word	4

	.global	a21
	.data
	.align	2
	.type	a21, %object
	.size	a21, 4
a21:
	.word	5

	.global	a22
	.data
	.align	2
	.type	a22, %object
	.size	a22, 4
a22:
	.word	6

	.global	a23
	.data
	.align	2
	.type	a23, %object
	.size	a23, 4
a23:
	.word	7

	.global	a24
	.data
	.align	2
	.type	a24, %object
	.size	a24, 4
a24:
	.word	8

	.global	a25
	.data
	.align	2
	.type	a25, %object
	.size	a25, 4
a25:
	.word	9

	.global	a26
	.data
	.align	2
	.type	a26, %object
	.size	a26, 4
a26:
	.word	10

	.global	a27
	.data
	.align	2
	.type	a27, %object
	.size	a27, 4
a27:
	.word	11

	.global	a28
	.data
	.align	2
	.type	a28, %object
	.size	a28, 4
a28:
	.word	12

	.global	a29
	.data
	.align	2
	.type	a29, %object
	.size	a29, 4
a29:
	.word	13

	.global	a30
	.data
	.align	2
	.type	a30, %object
	.size	a30, 4
a30:
	.word	14

	.global	a31
	.data
	.align	2
	.type	a31, %object
	.size	a31, 4
a31:
	.word	15

	.global	a32
	.data
	.align	2
	.type	a32, %object
	.size	a32, 4
a32:
	.word	16


	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	func
	.type	func, %function
func:
	@ args = 0, pretend = 0, frame = 440
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #444
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-20]
	add	r7, r8, r9
	str	r7, [fp, #-24]
	bl	getint
	mov	r7, r0
	str	r7, [fp, #-28]
	bl	getint
	mov	r7, r0
	str	r7, [fp, #-32]
	bl	getint
	mov	r7, r0
	str	r7, [fp, #-36]
	bl	getint
	mov	r7, r0
	str	r7, [fp, #-40]
	ldr	r7, =1
	ldr	r6, [fp, #-28]
	add	r7, r6, r7
	movw	r5, #:lower16:a1
	movt	r5, #:upper16:a1
	ldr	r5, [r5, #0]
	add	r7, r5, r7
	str	r7, [fp, #-44]
	ldr	r7, =2
	ldr	r4, [fp, #-32]
	add	r7, r4, r7
	movw	r3, #:lower16:a2
	movt	r3, #:upper16:a2
	ldr	r3, [r3, #0]
	add	r7, r3, r7
	str	r7, [fp, #-48]
	ldr	r7, =3
	ldr	r2, [fp, #-36]
	add	r7, r2, r7
	movw	r1, #:lower16:a3
	movt	r1, #:upper16:a3
	ldr	r1, [r1, #0]
	add	r7, r1, r7
	str	r7, [fp, #-52]
	ldr	r7, =4
	ldr	r0, [fp, #-40]
	add	r7, r0, r7
	str	r0, [fp, #-180]
	movw	r0, #:lower16:a4
	movt	r0, #:upper16:a4
	ldr	r0, [r0, #0]
	add	r7, r0, r7
	str	r7, [fp, #-56]
	ldr	r7, =1
	str	r0, [fp, #-184]
	ldr	r0, [fp, #-44]
	add	r7, r0, r7
	str	r1, [fp, #-188]
	movw	r1, #:lower16:a5
	movt	r1, #:upper16:a5
	ldr	r1, [r1, #0]
	add	r7, r1, r7
	str	r7, [fp, #-60]
	ldr	r7, =2
	str	r2, [fp, #-192]
	ldr	r2, [fp, #-48]
	add	r7, r2, r7
	str	r3, [fp, #-196]
	movw	r3, #:lower16:a6
	movt	r3, #:upper16:a6
	ldr	r3, [r3, #0]
	add	r7, r3, r7
	str	r7, [fp, #-64]
	ldr	r7, =3
	str	r4, [fp, #-200]
	ldr	r4, [fp, #-52]
	add	r7, r4, r7
	str	r5, [fp, #-204]
	movw	r5, #:lower16:a7
	movt	r5, #:upper16:a7
	ldr	r5, [r5, #0]
	add	r7, r5, r7
	str	r7, [fp, #-68]
	ldr	r7, =4
	str	r6, [fp, #-208]
	ldr	r6, [fp, #-56]
	add	r7, r6, r7
	str	r6, [fp, #-212]
	movw	r6, #:lower16:a8
	movt	r6, #:upper16:a8
	ldr	r6, [r6, #0]
	add	r7, r6, r7
	str	r7, [fp, #-72]
	ldr	r7, =1
	str	r6, [fp, #-216]
	ldr	r6, [fp, #-60]
	add	r7, r6, r7
	str	r5, [fp, #-220]
	movw	r5, #:lower16:a9
	movt	r5, #:upper16:a9
	ldr	r5, [r5, #0]
	add	r7, r5, r7
	str	r7, [fp, #-76]
	ldr	r7, =2
	str	r4, [fp, #-224]
	ldr	r4, [fp, #-64]
	add	r7, r4, r7
	str	r3, [fp, #-228]
	movw	r3, #:lower16:a10
	movt	r3, #:upper16:a10
	ldr	r3, [r3, #0]
	add	r7, r3, r7
	str	r7, [fp, #-80]
	ldr	r7, =3
	str	r2, [fp, #-232]
	ldr	r2, [fp, #-68]
	add	r7, r2, r7
	str	r1, [fp, #-236]
	movw	r1, #:lower16:a11
	movt	r1, #:upper16:a11
	ldr	r1, [r1, #0]
	add	r7, r1, r7
	str	r7, [fp, #-84]
	ldr	r7, =4
	str	r0, [fp, #-240]
	ldr	r0, [fp, #-72]
	add	r7, r0, r7
	str	r0, [fp, #-244]
	movw	r0, #:lower16:a12
	movt	r0, #:upper16:a12
	ldr	r0, [r0, #0]
	add	r7, r0, r7
	str	r7, [fp, #-88]
	ldr	r7, =1
	str	r0, [fp, #-248]
	ldr	r0, [fp, #-76]
	add	r7, r0, r7
	str	r1, [fp, #-252]
	movw	r1, #:lower16:a13
	movt	r1, #:upper16:a13
	ldr	r1, [r1, #0]
	add	r7, r1, r7
	str	r7, [fp, #-92]
	ldr	r7, =2
	str	r2, [fp, #-256]
	ldr	r2, [fp, #-80]
	add	r7, r2, r7
	str	r3, [fp, #-260]
	movw	r3, #:lower16:a14
	movt	r3, #:upper16:a14
	ldr	r3, [r3, #0]
	add	r7, r3, r7
	str	r7, [fp, #-96]
	ldr	r7, =3
	str	r4, [fp, #-264]
	ldr	r4, [fp, #-84]
	add	r7, r4, r7
	str	r5, [fp, #-268]
	movw	r5, #:lower16:a15
	movt	r5, #:upper16:a15
	ldr	r5, [r5, #0]
	add	r7, r5, r7
	str	r7, [fp, #-100]
	ldr	r7, =4
	str	r6, [fp, #-272]
	ldr	r6, [fp, #-88]
	add	r7, r6, r7
	str	r6, [fp, #-276]
	movw	r6, #:lower16:a16
	movt	r6, #:upper16:a16
	ldr	r6, [r6, #0]
	add	r7, r6, r7
	str	r7, [fp, #-104]
	ldr	r7, =1
	str	r6, [fp, #-280]
	ldr	r6, [fp, #-92]
	add	r7, r6, r7
	str	r5, [fp, #-284]
	movw	r5, #:lower16:a17
	movt	r5, #:upper16:a17
	ldr	r5, [r5, #0]
	add	r7, r5, r7
	str	r7, [fp, #-108]
	ldr	r7, =2
	str	r4, [fp, #-288]
	ldr	r4, [fp, #-96]
	add	r7, r4, r7
	str	r3, [fp, #-292]
	movw	r3, #:lower16:a18
	movt	r3, #:upper16:a18
	ldr	r3, [r3, #0]
	add	r7, r3, r7
	str	r7, [fp, #-112]
	ldr	r7, =3
	str	r2, [fp, #-296]
	ldr	r2, [fp, #-100]
	add	r7, r2, r7
	str	r1, [fp, #-300]
	movw	r1, #:lower16:a19
	movt	r1, #:upper16:a19
	ldr	r1, [r1, #0]
	add	r7, r1, r7
	str	r7, [fp, #-116]
	ldr	r7, =4
	str	r0, [fp, #-304]
	ldr	r0, [fp, #-104]
	add	r7, r0, r7
	str	r0, [fp, #-308]
	movw	r0, #:lower16:a20
	movt	r0, #:upper16:a20
	ldr	r0, [r0, #0]
	add	r7, r0, r7
	str	r7, [fp, #-120]
	ldr	r7, =1
	str	r0, [fp, #-312]
	ldr	r0, [fp, #-108]
	add	r7, r0, r7
	str	r1, [fp, #-316]
	movw	r1, #:lower16:a21
	movt	r1, #:upper16:a21
	ldr	r1, [r1, #0]
	add	r7, r1, r7
	str	r7, [fp, #-124]
	ldr	r7, =2
	str	r2, [fp, #-320]
	ldr	r2, [fp, #-112]
	add	r7, r2, r7
	str	r3, [fp, #-324]
	movw	r3, #:lower16:a22
	movt	r3, #:upper16:a22
	ldr	r3, [r3, #0]
	add	r7, r3, r7
	str	r7, [fp, #-128]
	ldr	r7, =3
	str	r4, [fp, #-328]
	ldr	r4, [fp, #-116]
	add	r7, r4, r7
	str	r5, [fp, #-332]
	movw	r5, #:lower16:a23
	movt	r5, #:upper16:a23
	ldr	r5, [r5, #0]
	add	r7, r5, r7
	str	r7, [fp, #-132]
	ldr	r7, =4
	str	r6, [fp, #-336]
	ldr	r6, [fp, #-120]
	add	r7, r6, r7
	str	r6, [fp, #-340]
	movw	r6, #:lower16:a24
	movt	r6, #:upper16:a24
	ldr	r6, [r6, #0]
	add	r7, r6, r7
	str	r7, [fp, #-136]
	ldr	r7, =1
	str	r6, [fp, #-344]
	ldr	r6, [fp, #-124]
	add	r7, r6, r7
	str	r5, [fp, #-348]
	movw	r5, #:lower16:a25
	movt	r5, #:upper16:a25
	ldr	r5, [r5, #0]
	add	r7, r5, r7
	str	r7, [fp, #-140]
	ldr	r7, =2
	str	r4, [fp, #-352]
	ldr	r4, [fp, #-128]
	add	r7, r4, r7
	str	r3, [fp, #-356]
	movw	r3, #:lower16:a26
	movt	r3, #:upper16:a26
	ldr	r3, [r3, #0]
	add	r7, r3, r7
	str	r7, [fp, #-144]
	ldr	r7, =3
	str	r2, [fp, #-360]
	ldr	r2, [fp, #-132]
	add	r7, r2, r7
	str	r1, [fp, #-364]
	movw	r1, #:lower16:a27
	movt	r1, #:upper16:a27
	ldr	r1, [r1, #0]
	add	r7, r1, r7
	str	r7, [fp, #-148]
	ldr	r7, =4
	str	r0, [fp, #-368]
	ldr	r0, [fp, #-136]
	add	r7, r0, r7
	str	r0, [fp, #-372]
	movw	r0, #:lower16:a28
	movt	r0, #:upper16:a28
	ldr	r0, [r0, #0]
	add	r7, r0, r7
	str	r7, [fp, #-152]
	ldr	r7, =1
	str	r0, [fp, #-376]
	ldr	r0, [fp, #-140]
	add	r7, r0, r7
	str	r1, [fp, #-380]
	movw	r1, #:lower16:a29
	movt	r1, #:upper16:a29
	ldr	r1, [r1, #0]
	add	r7, r1, r7
	str	r7, [fp, #-156]
	ldr	r7, =2
	str	r2, [fp, #-384]
	ldr	r2, [fp, #-144]
	add	r7, r2, r7
	str	r3, [fp, #-388]
	movw	r3, #:lower16:a30
	movt	r3, #:upper16:a30
	ldr	r3, [r3, #0]
	add	r7, r3, r7
	str	r7, [fp, #-160]
	ldr	r7, =3
	str	r4, [fp, #-392]
	ldr	r4, [fp, #-148]
	add	r7, r4, r7
	str	r5, [fp, #-396]
	movw	r5, #:lower16:a31
	movt	r5, #:upper16:a31
	ldr	r5, [r5, #0]
	add	r7, r5, r7
	str	r7, [fp, #-164]
	ldr	r7, =4
	str	r6, [fp, #-400]
	ldr	r6, [fp, #-152]
	add	r7, r6, r7
	str	r6, [fp, #-404]
	movw	r6, #:lower16:a32
	movt	r6, #:upper16:a32
	ldr	r6, [r6, #0]
	add	r7, r6, r7
	str	r7, [fp, #-168]
	sub	r9, r9, r8
	ldr	r8, =10
	add	r9, r8, r9
	str	r9, [fp, #-24]
	ldr	r9, =1
	add	r9, r0, r9
	add	r9, r1, r9
	str	r9, [fp, #-156]
	ldr	r9, =2
	add	r9, r2, r9
	add	r9, r3, r9
	str	r9, [fp, #-160]
	ldr	r9, =3
	add	r9, r4, r9
	add	r9, r5, r9
	str	r9, [fp, #-164]
	ldr	r9, =4
	ldr	r12, [fp, #-404]
	add	r9, r12, r9
	add	r9, r6, r9
	str	r9, [fp, #-168]
	ldr	r9, =1
	ldr	r12, [fp, #-400]
	add	r9, r12, r9
	mov	r12, r6
	ldr	r6, [fp, #-396]
	str	r12, [fp, #-396]
	add	r9, r6, r9
	str	r9, [fp, #-140]
	ldr	r8, =2
	ldr	r12, [fp, #-392]
	add	r8, r12, r8
	mov	r12, r5
	ldr	r5, [fp, #-388]
	str	r12, [fp, #-388]
	add	r8, r5, r8
	str	r8, [fp, #-144]
	ldr	r7, =3
	ldr	r12, [fp, #-384]
	add	r7, r12, r7
	mov	r12, r3
	ldr	r3, [fp, #-380]
	str	r12, [fp, #-380]
	add	r7, r3, r7
	str	r7, [fp, #-148]
	ldr	r4, =4
	ldr	r12, [fp, #-372]
	add	r4, r12, r4
	mov	r12, r1
	ldr	r1, [fp, #-376]
	str	r12, [fp, #-376]
	add	r4, r1, r4
	str	r4, [fp, #-152]
	ldr	r2, =1
	ldr	r12, [fp, #-368]
	add	r2, r12, r2
	mov	r12, r1
	ldr	r1, [fp, #-364]
	str	r12, [fp, #-364]
	add	r2, r1, r2
	str	r2, [fp, #-124]
	ldr	r0, =2
	ldr	r12, [fp, #-360]
	add	r0, r12, r0
	mov	r12, r3
	ldr	r3, [fp, #-356]
	str	r12, [fp, #-356]
	add	r0, r3, r0
	str	r0, [fp, #-128]
	str	r5, [fp, #-408]
	ldr	r5, =3
	ldr	r12, [fp, #-352]
	add	r5, r12, r5
	mov	r12, r6
	ldr	r6, [fp, #-348]
	str	r12, [fp, #-348]
	add	r5, r6, r5
	str	r5, [fp, #-132]
	str	r6, [fp, #-412]
	ldr	r6, =4
	ldr	r12, [fp, #-340]
	add	r6, r12, r6
	ldr	r12, [fp, #-344]
	add	r6, r12, r6
	str	r6, [fp, #-136]
	str	r3, [fp, #-416]
	ldr	r3, =1
	ldr	r12, [fp, #-336]
	add	r3, r12, r3
	mov	r12, r1
	ldr	r1, [fp, #-332]
	str	r12, [fp, #-332]
	add	r3, r1, r3
	str	r3, [fp, #-108]
	str	r1, [fp, #-420]
	ldr	r1, =2
	ldr	r12, [fp, #-328]
	add	r1, r12, r1
	ldr	r12, [fp, #-324]
	add	r1, r12, r1
	str	r1, [fp, #-112]
	str	r4, [fp, #-424]
	ldr	r4, =3
	ldr	r12, [fp, #-320]
	add	r4, r12, r4
	ldr	r12, [fp, #-316]
	add	r4, r12, r4
	str	r4, [fp, #-116]
	str	r7, [fp, #-428]
	ldr	r7, =4
	ldr	r12, [fp, #-308]
	add	r7, r12, r7
	ldr	r12, [fp, #-312]
	add	r7, r12, r7
	str	r7, [fp, #-120]
	str	r8, [fp, #-432]
	ldr	r8, =1
	ldr	r12, [fp, #-304]
	add	r8, r12, r8
	ldr	r12, [fp, #-300]
	add	r8, r12, r8
	str	r8, [fp, #-92]
	str	r9, [fp, #-436]
	ldr	r9, =2
	ldr	r12, [fp, #-296]
	add	r9, r12, r9
	ldr	r12, [fp, #-292]
	add	r9, r12, r9
	str	r9, [fp, #-96]
	str	r6, [fp, #-440]
	ldr	r6, =3
	ldr	r12, [fp, #-288]
	add	r6, r12, r6
	ldr	r12, [fp, #-284]
	add	r6, r12, r6
	str	r6, [fp, #-100]
	str	r5, [fp, #-444]
	ldr	r5, =4
	ldr	r12, [fp, #-276]
	add	r5, r12, r5
	ldr	r12, [fp, #-280]
	add	r5, r12, r5
	str	r5, [fp, #-104]
	str	r0, [fp, #-448]
	ldr	r0, =1
	ldr	r12, [fp, #-272]
	add	r0, r12, r0
	ldr	r12, [fp, #-268]
	add	r0, r12, r0
	str	r0, [fp, #-76]
	str	r2, [fp, #-452]
	ldr	r2, =2
	ldr	r12, [fp, #-264]
	add	r2, r12, r2
	ldr	r12, [fp, #-260]
	add	r2, r12, r2
	str	r2, [fp, #-80]
	str	r7, [fp, #-456]
	ldr	r7, =3
	ldr	r12, [fp, #-256]
	add	r7, r12, r7
	ldr	r12, [fp, #-252]
	add	r7, r12, r7
	str	r7, [fp, #-84]
	str	r4, [fp, #-460]
	ldr	r4, =4
	ldr	r12, [fp, #-244]
	add	r4, r12, r4
	ldr	r12, [fp, #-248]
	add	r4, r12, r4
	str	r4, [fp, #-88]
	str	r1, [fp, #-464]
	ldr	r1, =1
	ldr	r12, [fp, #-240]
	add	r1, r12, r1
	ldr	r12, [fp, #-236]
	add	r1, r12, r1
	str	r1, [fp, #-60]
	str	r3, [fp, #-468]
	ldr	r3, =2
	ldr	r12, [fp, #-232]
	add	r3, r12, r3
	ldr	r12, [fp, #-228]
	add	r3, r12, r3
	str	r3, [fp, #-64]
	str	r5, [fp, #-472]
	ldr	r5, =3
	ldr	r12, [fp, #-224]
	add	r5, r12, r5
	ldr	r12, [fp, #-220]
	add	r5, r12, r5
	str	r5, [fp, #-68]
	str	r6, [fp, #-476]
	ldr	r6, =4
	ldr	r12, [fp, #-212]
	add	r6, r12, r6
	ldr	r12, [fp, #-216]
	add	r6, r12, r6
	str	r6, [fp, #-72]
	str	r9, [fp, #-480]
	ldr	r9, =1
	mov	r12, r8
	ldr	r8, [fp, #-208]
	str	r12, [fp, #-208]
	add	r9, r8, r9
	mov	r12, r4
	ldr	r4, [fp, #-204]
	str	r12, [fp, #-204]
	add	r9, r4, r9
	str	r9, [fp, #-44]
	ldr	r9, =2
	mov	r12, r7
	ldr	r7, [fp, #-200]
	str	r12, [fp, #-200]
	add	r9, r7, r9
	mov	r12, r2
	ldr	r2, [fp, #-196]
	str	r12, [fp, #-196]
	add	r9, r2, r9
	str	r9, [fp, #-48]
	ldr	r9, =3
	mov	r12, r0
	ldr	r0, [fp, #-192]
	str	r12, [fp, #-192]
	add	r9, r0, r9
	mov	r12, r6
	ldr	r6, [fp, #-188]
	str	r12, [fp, #-188]
	add	r9, r6, r9
	str	r9, [fp, #-52]
	ldr	r9, =4
	mov	r12, r5
	ldr	r5, [fp, #-180]
	str	r12, [fp, #-180]
	add	r9, r5, r9
	mov	r12, r3
	ldr	r3, [fp, #-184]
	str	r12, [fp, #-184]
	add	r9, r3, r9
	str	r9, [fp, #-56]
	ldr	r9, =1
	add	r9, r8, r9
	add	r9, r4, r9
	str	r9, [fp, #-44]
	str	r4, [fp, #-484]
	ldr	r4, =2
	add	r4, r7, r4
	add	r4, r2, r4
	str	r4, [fp, #-48]
	str	r2, [fp, #-488]
	ldr	r2, =3
	add	r2, r0, r2
	add	r2, r6, r2
	str	r2, [fp, #-52]
	str	r6, [fp, #-492]
	ldr	r6, =4
	add	r6, r5, r6
	add	r6, r3, r6
	str	r6, [fp, #-56]
	str	r3, [fp, #-496]
	ldr	r3, [fp, #-24]
	add	r8, r8, r3
	add	r8, r7, r8
	add	r8, r0, r8
	add	r8, r5, r8
	sub	r9, r8, r9
	sub	r9, r9, r4
	sub	r9, r9, r2
	sub	r9, r9, r6
	add	r9, r1, r9
	ldr	r12, [fp, #-184]
	add	r9, r12, r9
	ldr	r12, [fp, #-180]
	add	r9, r12, r9
	ldr	r12, [fp, #-188]
	add	r9, r12, r9
	ldr	r12, [fp, #-192]
	sub	r9, r9, r12
	ldr	r12, [fp, #-196]
	sub	r9, r9, r12
	ldr	r12, [fp, #-200]
	sub	r9, r9, r12
	ldr	r12, [fp, #-204]
	sub	r9, r9, r12
	ldr	r12, [fp, #-208]
	add	r9, r12, r9
	ldr	r12, [fp, #-480]
	add	r9, r12, r9
	ldr	r12, [fp, #-476]
	add	r9, r12, r9
	ldr	r12, [fp, #-472]
	add	r9, r12, r9
	ldr	r12, [fp, #-468]
	sub	r9, r9, r12
	ldr	r12, [fp, #-464]
	sub	r9, r9, r12
	ldr	r12, [fp, #-460]
	sub	r9, r9, r12
	ldr	r12, [fp, #-456]
	sub	r9, r9, r12
	ldr	r12, [fp, #-452]
	add	r9, r12, r9
	ldr	r12, [fp, #-448]
	add	r9, r12, r9
	ldr	r12, [fp, #-444]
	add	r9, r12, r9
	ldr	r12, [fp, #-440]
	add	r9, r12, r9
	ldr	r12, [fp, #-436]
	sub	r9, r9, r12
	ldr	r12, [fp, #-432]
	sub	r9, r9, r12
	ldr	r12, [fp, #-428]
	sub	r9, r9, r12
	ldr	r12, [fp, #-424]
	sub	r9, r9, r12
	ldr	r8, [fp, #-156]
	add	r9, r8, r9
	ldr	r8, [fp, #-160]
	add	r9, r8, r9
	ldr	r8, [fp, #-164]
	add	r9, r8, r9
	ldr	r8, [fp, #-168]
	add	r9, r8, r9
	ldr	r12, [fp, #-484]
	add	r9, r12, r9
	ldr	r12, [fp, #-488]
	sub	r9, r9, r12
	ldr	r12, [fp, #-492]
	add	r9, r12, r9
	ldr	r12, [fp, #-496]
	sub	r9, r9, r12
	ldr	r12, [fp, #-236]
	add	r9, r12, r9
	ldr	r12, [fp, #-228]
	sub	r9, r9, r12
	ldr	r12, [fp, #-220]
	add	r9, r12, r9
	ldr	r12, [fp, #-216]
	sub	r9, r9, r12
	ldr	r12, [fp, #-268]
	add	r9, r12, r9
	ldr	r12, [fp, #-260]
	sub	r9, r9, r12
	ldr	r12, [fp, #-252]
	add	r9, r12, r9
	ldr	r12, [fp, #-248]
	sub	r9, r9, r12
	ldr	r12, [fp, #-300]
	add	r9, r12, r9
	ldr	r12, [fp, #-292]
	sub	r9, r9, r12
	ldr	r12, [fp, #-284]
	add	r9, r12, r9
	ldr	r12, [fp, #-280]
	sub	r9, r9, r12
	ldr	r12, [fp, #-420]
	add	r9, r12, r9
	ldr	r12, [fp, #-324]
	sub	r9, r9, r12
	ldr	r12, [fp, #-316]
	add	r9, r12, r9
	ldr	r12, [fp, #-312]
	sub	r9, r9, r12
	ldr	r12, [fp, #-332]
	add	r9, r12, r9
	ldr	r12, [fp, #-416]
	sub	r9, r9, r12
	ldr	r12, [fp, #-412]
	add	r9, r12, r9
	ldr	r12, [fp, #-344]
	sub	r9, r9, r12
	ldr	r12, [fp, #-348]
	add	r9, r12, r9
	ldr	r12, [fp, #-408]
	sub	r9, r9, r12
	ldr	r12, [fp, #-356]
	add	r9, r12, r9
	ldr	r12, [fp, #-364]
	sub	r9, r9, r12
	ldr	r12, [fp, #-376]
	add	r9, r12, r9
	ldr	r12, [fp, #-380]
	sub	r9, r9, r12
	ldr	r12, [fp, #-388]
	add	r9, r12, r9
	ldr	r12, [fp, #-396]
	sub	r9, r9, r12
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	func, .-func

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #44
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-16]
	ldr	r9, [fp, #-16]
	ldr	r8, =18
	add	r8, r8, r9
	str	r8, [fp, #-20]
	ldr	r8, [fp, #-20]
	mov	r0, r9
	mov	r1, r8
	bl	func
	mov	r9, r0
	str	r9, [fp, #-16]
	mov	r0, r9
	bl	putint
	mov	r0, r9
	b	.L845

.L845:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
