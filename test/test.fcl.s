	.arch armv7-a
	.fpu vfpv4
	.arm
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
	@ args = 0, pretend = 0, frame = 688
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	ldr	r12, =692
	sub	sp, sp, r12
	str	r0, [r11, #-16]
	str	r1, [r11, #-20]
	ldr	r10, [r11, #-16]
	ldr	r9, [r11, #-20]
	add	r8, r9, r10
	str	r8, [r11, #-24]
	bl	getint
	mov	r8, r0
	str	r8, [r11, #-28]
	bl	getint
	mov	r8, r0
	str	r8, [r11, #-32]
	bl	getint
	mov	r8, r0
	str	r8, [r11, #-36]
	bl	getint
	mov	r8, r0
	str	r8, [r11, #-40]
	ldr	r8, =1
	ldr	r7, [r11, #-28]
	add	r8, r7, r8
	movw	r6, #:lower16:a1
	movt	r6, #:upper16:a1
	ldr	r6, [r6, #0]
	add	r8, r6, r8
	str	r8, [r11, #-44]
	ldr	r8, =2
	ldr	r5, [r11, #-32]
	add	r8, r5, r8
	movw	r4, #:lower16:a2
	movt	r4, #:upper16:a2
	ldr	r4, [r4, #0]
	add	r8, r4, r8
	str	r8, [r11, #-48]
	ldr	r8, =3
	str	r4, [r11, #-180]
	ldr	r4, [r11, #-36]
	add	r8, r4, r8
	str	r4, [r11, #-184]
	movw	r4, #:lower16:a3
	movt	r4, #:upper16:a3
	ldr	r4, [r4, #0]
	add	r8, r4, r8
	str	r8, [r11, #-52]
	ldr	r8, =4
	str	r4, [r11, #-188]
	ldr	r4, [r11, #-40]
	add	r8, r4, r8
	str	r4, [r11, #-192]
	movw	r4, #:lower16:a4
	movt	r4, #:upper16:a4
	ldr	r4, [r4, #0]
	add	r8, r4, r8
	str	r8, [r11, #-56]
	ldr	r8, =1
	str	r4, [r11, #-196]
	ldr	r4, [r11, #-44]
	add	r8, r4, r8
	str	r5, [r11, #-200]
	movw	r5, #:lower16:a5
	movt	r5, #:upper16:a5
	ldr	r5, [r5, #0]
	add	r8, r5, r8
	str	r8, [r11, #-60]
	b	.L858
	.ltorg
.L858:
	ldr	r8, =2
	str	r6, [r11, #-204]
	ldr	r6, [r11, #-48]
	add	r8, r6, r8
	str	r7, [r11, #-208]
	movw	r7, #:lower16:a6
	movt	r7, #:upper16:a6
	ldr	r7, [r7, #0]
	add	r8, r7, r8
	str	r8, [r11, #-64]
	ldr	r8, =3
	str	r7, [r11, #-212]
	ldr	r7, [r11, #-52]
	add	r8, r7, r8
	str	r7, [r11, #-216]
	movw	r7, #:lower16:a7
	movt	r7, #:upper16:a7
	ldr	r7, [r7, #0]
	add	r8, r7, r8
	str	r8, [r11, #-68]
	ldr	r8, =4
	str	r7, [r11, #-220]
	ldr	r7, [r11, #-56]
	add	r8, r7, r8
	str	r7, [r11, #-224]
	movw	r7, #:lower16:a8
	movt	r7, #:upper16:a8
	ldr	r7, [r7, #0]
	add	r8, r7, r8
	str	r8, [r11, #-72]
	ldr	r8, =1
	str	r7, [r11, #-228]
	ldr	r7, [r11, #-60]
	add	r8, r7, r8
	str	r6, [r11, #-232]
	movw	r6, #:lower16:a9
	movt	r6, #:upper16:a9
	ldr	r6, [r6, #0]
	add	r8, r6, r8
	str	r8, [r11, #-76]
	ldr	r8, =2
	str	r5, [r11, #-236]
	ldr	r5, [r11, #-64]
	add	r8, r5, r8
	str	r4, [r11, #-240]
	movw	r4, #:lower16:a10
	movt	r4, #:upper16:a10
	ldr	r4, [r4, #0]
	add	r8, r4, r8
	str	r8, [r11, #-80]
	ldr	r8, =3
	str	r4, [r11, #-244]
	ldr	r4, [r11, #-68]
	add	r8, r4, r8
	str	r4, [r11, #-248]
	movw	r4, #:lower16:a11
	movt	r4, #:upper16:a11
	ldr	r4, [r4, #0]
	add	r8, r4, r8
	str	r8, [r11, #-84]
	ldr	r8, =4
	str	r4, [r11, #-252]
	ldr	r4, [r11, #-72]
	add	r8, r4, r8
	str	r4, [r11, #-256]
	movw	r4, #:lower16:a12
	movt	r4, #:upper16:a12
	b	.L859
	.ltorg
.L859:
	ldr	r4, [r4, #0]
	add	r8, r4, r8
	str	r8, [r11, #-88]
	ldr	r8, =1
	str	r4, [r11, #-260]
	ldr	r4, [r11, #-76]
	add	r8, r4, r8
	str	r5, [r11, #-264]
	movw	r5, #:lower16:a13
	movt	r5, #:upper16:a13
	ldr	r5, [r5, #0]
	add	r8, r5, r8
	str	r8, [r11, #-92]
	ldr	r8, =2
	str	r6, [r11, #-268]
	ldr	r6, [r11, #-80]
	add	r8, r6, r8
	str	r7, [r11, #-272]
	movw	r7, #:lower16:a14
	movt	r7, #:upper16:a14
	ldr	r7, [r7, #0]
	add	r8, r7, r8
	str	r8, [r11, #-96]
	ldr	r8, =3
	str	r7, [r11, #-276]
	ldr	r7, [r11, #-84]
	add	r8, r7, r8
	str	r7, [r11, #-280]
	movw	r7, #:lower16:a15
	movt	r7, #:upper16:a15
	ldr	r7, [r7, #0]
	add	r8, r7, r8
	str	r8, [r11, #-100]
	ldr	r8, =4
	str	r7, [r11, #-284]
	ldr	r7, [r11, #-88]
	add	r8, r7, r8
	str	r7, [r11, #-288]
	movw	r7, #:lower16:a16
	movt	r7, #:upper16:a16
	ldr	r7, [r7, #0]
	add	r8, r7, r8
	str	r8, [r11, #-104]
	ldr	r8, =1
	str	r7, [r11, #-292]
	ldr	r7, [r11, #-92]
	add	r8, r7, r8
	str	r6, [r11, #-296]
	movw	r6, #:lower16:a17
	movt	r6, #:upper16:a17
	ldr	r6, [r6, #0]
	add	r8, r6, r8
	str	r8, [r11, #-108]
	ldr	r8, =2
	str	r5, [r11, #-300]
	ldr	r5, [r11, #-96]
	add	r8, r5, r8
	str	r4, [r11, #-304]
	movw	r4, #:lower16:a18
	movt	r4, #:upper16:a18
	ldr	r4, [r4, #0]
	add	r8, r4, r8
	str	r8, [r11, #-112]
	ldr	r8, =3
	str	r4, [r11, #-308]
	ldr	r4, [r11, #-100]
	b	.L860
	.ltorg
.L860:
	add	r8, r4, r8
	str	r4, [r11, #-312]
	movw	r4, #:lower16:a19
	movt	r4, #:upper16:a19
	ldr	r4, [r4, #0]
	add	r8, r4, r8
	str	r8, [r11, #-116]
	ldr	r8, =4
	str	r4, [r11, #-316]
	ldr	r4, [r11, #-104]
	add	r8, r4, r8
	str	r4, [r11, #-320]
	movw	r4, #:lower16:a20
	movt	r4, #:upper16:a20
	ldr	r4, [r4, #0]
	add	r8, r4, r8
	str	r8, [r11, #-120]
	ldr	r8, =1
	str	r4, [r11, #-324]
	ldr	r4, [r11, #-108]
	add	r8, r4, r8
	str	r5, [r11, #-328]
	movw	r5, #:lower16:a21
	movt	r5, #:upper16:a21
	ldr	r5, [r5, #0]
	add	r8, r5, r8
	str	r8, [r11, #-124]
	ldr	r8, =2
	str	r6, [r11, #-332]
	ldr	r6, [r11, #-112]
	add	r8, r6, r8
	str	r7, [r11, #-336]
	movw	r7, #:lower16:a22
	movt	r7, #:upper16:a22
	ldr	r7, [r7, #0]
	add	r8, r7, r8
	str	r8, [r11, #-128]
	ldr	r8, =3
	str	r7, [r11, #-340]
	ldr	r7, [r11, #-116]
	add	r8, r7, r8
	str	r7, [r11, #-344]
	movw	r7, #:lower16:a23
	movt	r7, #:upper16:a23
	ldr	r7, [r7, #0]
	add	r8, r7, r8
	str	r8, [r11, #-132]
	ldr	r8, =4
	str	r7, [r11, #-348]
	ldr	r7, [r11, #-120]
	add	r8, r7, r8
	str	r7, [r11, #-352]
	movw	r7, #:lower16:a24
	movt	r7, #:upper16:a24
	ldr	r7, [r7, #0]
	add	r8, r7, r8
	str	r8, [r11, #-136]
	ldr	r8, =1
	str	r7, [r11, #-356]
	ldr	r7, [r11, #-124]
	add	r8, r7, r8
	str	r6, [r11, #-360]
	movw	r6, #:lower16:a25
	movt	r6, #:upper16:a25
	ldr	r6, [r6, #0]
	add	r8, r6, r8
	str	r8, [r11, #-140]
	b	.L861
	.ltorg
.L861:
	ldr	r8, =2
	str	r5, [r11, #-364]
	ldr	r5, [r11, #-128]
	add	r8, r5, r8
	str	r4, [r11, #-368]
	movw	r4, #:lower16:a26
	movt	r4, #:upper16:a26
	ldr	r4, [r4, #0]
	add	r8, r4, r8
	str	r8, [r11, #-144]
	ldr	r8, =3
	str	r4, [r11, #-372]
	ldr	r4, [r11, #-132]
	add	r8, r4, r8
	str	r4, [r11, #-376]
	movw	r4, #:lower16:a27
	movt	r4, #:upper16:a27
	ldr	r4, [r4, #0]
	add	r8, r4, r8
	str	r8, [r11, #-148]
	ldr	r8, =4
	str	r4, [r11, #-380]
	ldr	r4, [r11, #-136]
	add	r8, r4, r8
	str	r4, [r11, #-384]
	movw	r4, #:lower16:a28
	movt	r4, #:upper16:a28
	ldr	r4, [r4, #0]
	add	r8, r4, r8
	str	r8, [r11, #-152]
	ldr	r8, =1
	str	r4, [r11, #-388]
	ldr	r4, [r11, #-140]
	add	r8, r4, r8
	str	r5, [r11, #-392]
	movw	r5, #:lower16:a29
	movt	r5, #:upper16:a29
	ldr	r5, [r5, #0]
	add	r8, r5, r8
	str	r8, [r11, #-156]
	ldr	r8, =2
	str	r6, [r11, #-396]
	ldr	r6, [r11, #-144]
	add	r8, r6, r8
	str	r7, [r11, #-400]
	movw	r7, #:lower16:a30
	movt	r7, #:upper16:a30
	ldr	r7, [r7, #0]
	add	r8, r7, r8
	str	r8, [r11, #-160]
	ldr	r8, =3
	str	r7, [r11, #-404]
	ldr	r7, [r11, #-148]
	add	r8, r7, r8
	str	r7, [r11, #-408]
	movw	r7, #:lower16:a31
	movt	r7, #:upper16:a31
	ldr	r7, [r7, #0]
	add	r8, r7, r8
	str	r8, [r11, #-164]
	ldr	r8, =4
	str	r7, [r11, #-412]
	ldr	r7, [r11, #-152]
	add	r8, r7, r8
	str	r7, [r11, #-416]
	movw	r7, #:lower16:a32
	movt	r7, #:upper16:a32
	b	.L862
	.ltorg
.L862:
	ldr	r7, [r7, #0]
	add	r8, r7, r8
	str	r8, [r11, #-168]
	sub	r10, r10, r9
	ldr	r9, =10
	add	r10, r9, r10
	str	r10, [r11, #-24]
	ldr	r10, =1
	add	r10, r4, r10
	add	r10, r5, r10
	str	r10, [r11, #-156]
	ldr	r10, =2
	add	r10, r6, r10
	ldr	r12, [r11, #-404]
	add	r10, r12, r10
	str	r10, [r11, #-160]
	ldr	r10, =3
	ldr	r12, [r11, #-408]
	add	r10, r12, r10
	ldr	r12, [r11, #-412]
	add	r10, r12, r10
	str	r10, [r11, #-164]
	ldr	r10, =4
	ldr	r12, [r11, #-416]
	add	r10, r12, r10
	add	r10, r7, r10
	str	r10, [r11, #-168]
	ldr	r10, =1
	ldr	r12, [r11, #-400]
	add	r10, r12, r10
	mov	r12, r7
	ldr	r7, [r11, #-396]
	str	r12, [r11, #-396]
	add	r10, r7, r10
	str	r10, [r11, #-140]
	ldr	r9, =2
	ldr	r12, [r11, #-392]
	add	r9, r12, r9
	mov	r12, r5
	ldr	r5, [r11, #-372]
	str	r12, [r11, #-372]
	add	r9, r5, r9
	str	r9, [r11, #-144]
	ldr	r8, =3
	ldr	r12, [r11, #-376]
	add	r8, r12, r8
	ldr	r12, [r11, #-380]
	add	r8, r12, r8
	str	r8, [r11, #-148]
	ldr	r6, =4
	ldr	r12, [r11, #-384]
	add	r6, r12, r6
	ldr	r12, [r11, #-388]
	add	r6, r12, r6
	str	r6, [r11, #-152]
	ldr	r4, =1
	ldr	r12, [r11, #-368]
	add	r4, r12, r4
	mov	r12, r5
	ldr	r5, [r11, #-364]
	b	.L863
	.ltorg
.L863:
	str	r12, [r11, #-364]
	add	r4, r5, r4
	str	r4, [r11, #-124]
	str	r7, [r11, #-420]
	ldr	r7, =2
	ldr	r12, [r11, #-360]
	add	r7, r12, r7
	ldr	r12, [r11, #-340]
	add	r7, r12, r7
	str	r7, [r11, #-128]
	str	r5, [r11, #-424]
	ldr	r5, =3
	ldr	r12, [r11, #-344]
	add	r5, r12, r5
	ldr	r12, [r11, #-348]
	add	r5, r12, r5
	str	r5, [r11, #-132]
	str	r5, [r11, #-428]
	ldr	r5, =4
	ldr	r12, [r11, #-352]
	add	r5, r12, r5
	ldr	r12, [r11, #-356]
	add	r5, r12, r5
	str	r5, [r11, #-136]
	str	r5, [r11, #-432]
	ldr	r5, =1
	ldr	r12, [r11, #-336]
	add	r5, r12, r5
	ldr	r12, [r11, #-332]
	add	r5, r12, r5
	str	r5, [r11, #-108]
	str	r5, [r11, #-436]
	ldr	r5, =2
	ldr	r12, [r11, #-328]
	add	r5, r12, r5
	ldr	r12, [r11, #-308]
	add	r5, r12, r5
	str	r5, [r11, #-112]
	str	r5, [r11, #-440]
	ldr	r5, =3
	ldr	r12, [r11, #-312]
	add	r5, r12, r5
	ldr	r12, [r11, #-316]
	add	r5, r12, r5
	str	r5, [r11, #-116]
	str	r5, [r11, #-444]
	ldr	r5, =4
	ldr	r12, [r11, #-320]
	add	r5, r12, r5
	ldr	r12, [r11, #-324]
	add	r5, r12, r5
	str	r5, [r11, #-120]
	str	r5, [r11, #-448]
	ldr	r5, =1
	ldr	r12, [r11, #-304]
	add	r5, r12, r5
	ldr	r12, [r11, #-300]
	add	r5, r12, r5
	str	r5, [r11, #-92]
	str	r5, [r11, #-452]
	b	.L864
	.ltorg
.L864:
	ldr	r5, =2
	ldr	r12, [r11, #-296]
	add	r5, r12, r5
	ldr	r12, [r11, #-276]
	add	r5, r12, r5
	str	r5, [r11, #-96]
	str	r5, [r11, #-456]
	ldr	r5, =3
	ldr	r12, [r11, #-280]
	add	r5, r12, r5
	ldr	r12, [r11, #-284]
	add	r5, r12, r5
	str	r5, [r11, #-100]
	str	r5, [r11, #-460]
	ldr	r5, =4
	ldr	r12, [r11, #-288]
	add	r5, r12, r5
	ldr	r12, [r11, #-292]
	add	r5, r12, r5
	str	r5, [r11, #-104]
	str	r5, [r11, #-464]
	ldr	r5, =1
	ldr	r12, [r11, #-272]
	add	r5, r12, r5
	ldr	r12, [r11, #-268]
	add	r5, r12, r5
	str	r5, [r11, #-76]
	str	r5, [r11, #-468]
	ldr	r5, =2
	ldr	r12, [r11, #-264]
	add	r5, r12, r5
	ldr	r12, [r11, #-244]
	add	r5, r12, r5
	str	r5, [r11, #-80]
	str	r5, [r11, #-472]
	ldr	r5, =3
	ldr	r12, [r11, #-248]
	add	r5, r12, r5
	ldr	r12, [r11, #-252]
	add	r5, r12, r5
	str	r5, [r11, #-84]
	str	r5, [r11, #-476]
	ldr	r5, =4
	ldr	r12, [r11, #-256]
	add	r5, r12, r5
	ldr	r12, [r11, #-260]
	add	r5, r12, r5
	str	r5, [r11, #-88]
	str	r5, [r11, #-480]
	ldr	r5, =1
	ldr	r12, [r11, #-240]
	add	r5, r12, r5
	ldr	r12, [r11, #-236]
	add	r5, r12, r5
	str	r5, [r11, #-60]
	str	r5, [r11, #-484]
	ldr	r5, =2
	ldr	r12, [r11, #-232]
	add	r5, r12, r5
	ldr	r12, [r11, #-212]
	b	.L865
	.ltorg
.L865:
	add	r5, r12, r5
	str	r5, [r11, #-64]
	str	r5, [r11, #-488]
	ldr	r5, =3
	ldr	r12, [r11, #-216]
	add	r5, r12, r5
	ldr	r12, [r11, #-220]
	add	r5, r12, r5
	str	r5, [r11, #-68]
	str	r5, [r11, #-492]
	ldr	r5, =4
	ldr	r12, [r11, #-224]
	add	r5, r12, r5
	ldr	r12, [r11, #-228]
	add	r5, r12, r5
	str	r5, [r11, #-72]
	str	r5, [r11, #-496]
	ldr	r5, =1
	mov	r12, r7
	ldr	r7, [r11, #-208]
	str	r12, [r11, #-208]
	add	r5, r7, r5
	mov	r12, r4
	ldr	r4, [r11, #-204]
	str	r12, [r11, #-204]
	add	r5, r4, r5
	str	r5, [r11, #-44]
	ldr	r5, =2
	mov	r12, r6
	ldr	r6, [r11, #-200]
	str	r12, [r11, #-200]
	add	r5, r6, r5
	mov	r12, r8
	ldr	r8, [r11, #-180]
	str	r12, [r11, #-180]
	add	r5, r8, r5
	str	r5, [r11, #-48]
	ldr	r5, =3
	mov	r12, r9
	ldr	r9, [r11, #-184]
	str	r12, [r11, #-184]
	add	r5, r9, r5
	mov	r12, r10
	ldr	r10, [r11, #-188]
	str	r12, [r11, #-188]
	add	r5, r10, r5
	str	r5, [r11, #-52]
	ldr	r5, =4
	ldr	r12, [r11, #-192]
	add	r5, r12, r5
	ldr	r12, [r11, #-196]
	add	r5, r12, r5
	str	r5, [r11, #-56]
	ldr	r5, =1
	add	r5, r7, r5
	add	r5, r4, r5
	str	r5, [r11, #-44]
	str	r4, [r11, #-500]
	ldr	r4, =2
	add	r4, r6, r4
	b	.L866
	.ltorg
.L866:
	add	r4, r8, r4
	str	r4, [r11, #-48]
	str	r8, [r11, #-504]
	ldr	r8, =3
	add	r8, r9, r8
	add	r8, r10, r8
	str	r8, [r11, #-52]
	str	r10, [r11, #-508]
	ldr	r10, =4
	mov	r12, r8
	ldr	r8, [r11, #-192]
	str	r12, [r11, #-192]
	add	r10, r8, r10
	ldr	r12, [r11, #-196]
	add	r10, r12, r10
	str	r10, [r11, #-56]
	ldr	r12, [r11, #-188]
	mov	r0, r12
	bl	putint
	str	r10, [r11, #-512]
	ldr	r10, =32
	mov	r0, r10
	bl	putch
	ldr	r12, [r11, #-184]
	mov	r0, r12
	bl	putint
	ldr	r10, =32
	mov	r0, r10
	bl	putch
	ldr	r12, [r11, #-180]
	mov	r0, r12
	bl	putint
	ldr	r10, =32
	mov	r0, r10
	bl	putch
	ldr	r12, [r11, #-200]
	mov	r0, r12
	bl	putint
	ldr	r10, =32
	mov	r0, r10
	bl	putch
	ldr	r12, [r11, #-204]
	mov	r0, r12
	bl	putint
	ldr	r10, =32
	mov	r0, r10
	bl	putch
	ldr	r12, [r11, #-208]
	mov	r0, r12
	bl	putint
	ldr	r10, =32
	mov	r0, r10
	bl	putch
	ldr	r12, [r11, #-428]
	mov	r0, r12
	bl	putint
	ldr	r10, =32
	mov	r0, r10
	bl	putch
	ldr	r12, [r11, #-432]
	b	.L867
	.ltorg
.L867:
	mov	r0, r12
	bl	putint
	ldr	r10, =32
	mov	r0, r10
	bl	putch
	ldr	r10, [r11, #-24]
	add	r10, r7, r10
	add	r10, r6, r10
	add	r10, r9, r10
	add	r10, r8, r10
	sub	r10, r10, r5
	sub	r10, r10, r4
	ldr	r12, [r11, #-192]
	sub	r10, r10, r12
	ldr	r12, [r11, #-512]
	sub	r10, r10, r12
	ldr	r12, [r11, #-484]
	add	r10, r12, r10
	ldr	r12, [r11, #-488]
	add	r10, r12, r10
	ldr	r12, [r11, #-492]
	add	r10, r12, r10
	ldr	r12, [r11, #-496]
	add	r10, r12, r10
	ldr	r12, [r11, #-468]
	sub	r10, r10, r12
	ldr	r12, [r11, #-472]
	sub	r10, r10, r12
	ldr	r12, [r11, #-476]
	sub	r10, r10, r12
	ldr	r12, [r11, #-480]
	sub	r10, r10, r12
	ldr	r12, [r11, #-452]
	add	r10, r12, r10
	ldr	r12, [r11, #-456]
	add	r10, r12, r10
	ldr	r12, [r11, #-460]
	add	r10, r12, r10
	ldr	r12, [r11, #-464]
	add	r10, r12, r10
	ldr	r12, [r11, #-436]
	sub	r10, r10, r12
	ldr	r12, [r11, #-440]
	sub	r10, r10, r12
	ldr	r12, [r11, #-444]
	sub	r10, r10, r12
	ldr	r12, [r11, #-448]
	sub	r10, r10, r12
	ldr	r12, [r11, #-204]
	add	r10, r12, r10
	ldr	r12, [r11, #-208]
	add	r10, r12, r10
	ldr	r12, [r11, #-428]
	add	r10, r12, r10
	ldr	r12, [r11, #-432]
	add	r10, r12, r10
	ldr	r12, [r11, #-188]
	sub	r10, r10, r12
	ldr	r12, [r11, #-184]
	sub	r10, r10, r12
	b	.L868
	.ltorg
.L868:
	ldr	r12, [r11, #-180]
	sub	r10, r10, r12
	ldr	r12, [r11, #-200]
	sub	r10, r10, r12
	ldr	r9, [r11, #-156]
	add	r10, r9, r10
	ldr	r9, [r11, #-160]
	add	r10, r9, r10
	ldr	r9, [r11, #-164]
	add	r10, r9, r10
	ldr	r9, [r11, #-168]
	add	r10, r9, r10
	ldr	r12, [r11, #-500]
	add	r10, r12, r10
	ldr	r12, [r11, #-504]
	sub	r10, r10, r12
	ldr	r12, [r11, #-508]
	add	r10, r12, r10
	ldr	r12, [r11, #-196]
	sub	r10, r10, r12
	ldr	r12, [r11, #-236]
	add	r10, r12, r10
	ldr	r12, [r11, #-212]
	sub	r10, r10, r12
	ldr	r12, [r11, #-220]
	add	r10, r12, r10
	ldr	r12, [r11, #-228]
	sub	r10, r10, r12
	ldr	r12, [r11, #-268]
	add	r10, r12, r10
	ldr	r12, [r11, #-244]
	sub	r10, r10, r12
	ldr	r12, [r11, #-252]
	add	r10, r12, r10
	ldr	r12, [r11, #-260]
	sub	r10, r10, r12
	ldr	r12, [r11, #-300]
	add	r10, r12, r10
	ldr	r12, [r11, #-276]
	sub	r10, r10, r12
	ldr	r12, [r11, #-284]
	add	r10, r12, r10
	ldr	r12, [r11, #-292]
	sub	r10, r10, r12
	ldr	r12, [r11, #-332]
	add	r10, r12, r10
	ldr	r12, [r11, #-308]
	sub	r10, r10, r12
	ldr	r12, [r11, #-316]
	add	r10, r12, r10
	ldr	r12, [r11, #-324]
	sub	r10, r10, r12
	ldr	r12, [r11, #-424]
	add	r10, r12, r10
	ldr	r12, [r11, #-340]
	sub	r10, r10, r12
	ldr	r12, [r11, #-348]
	add	r10, r12, r10
	ldr	r12, [r11, #-356]
	sub	r10, r10, r12
	b	.L869
	.ltorg
.L869:
	ldr	r12, [r11, #-420]
	add	r10, r12, r10
	ldr	r12, [r11, #-364]
	sub	r10, r10, r12
	ldr	r12, [r11, #-380]
	add	r10, r12, r10
	ldr	r12, [r11, #-388]
	sub	r10, r10, r12
	ldr	r12, [r11, #-372]
	add	r10, r12, r10
	ldr	r12, [r11, #-404]
	sub	r10, r10, r12
	ldr	r12, [r11, #-412]
	add	r10, r12, r10
	ldr	r12, [r11, #-396]
	sub	r10, r10, r12
	mov	r0, r10
	bl	putint
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
	@ args = 0, pretend = 0, frame = 44
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #48
	bl	getint
	mov	r10, r0
	str	r10, [r11, #-16]
	ldr	r10, [r11, #-16]
	ldr	r9, =18
	add	r9, r9, r10
	str	r9, [r11, #-20]
	ldr	r9, [r11, #-20]
	mov	r1, r9
	mov	r0, r10
	bl	func
	mov	r12, r0
	mov	r0, r10
	b	.L845
	.ltorg
.L845:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
