	.arch armv7-a
	.fpu vfpv4
	.arm
	.global	var1
	.data
	.align	2
	.type	var1, %object
	.size	var1, 4
var1:
	.word	6
	.global	var2
	.data
	.align	2
	.type	var2, %object
	.size	var2, 4
var2:
	.word	7
	.global	var3
	.data
	.align	2
	.type	var3, %object
	.size	var3, 4
var3:
	.word	8
	.global	var4
	.data
	.align	2
	.type	var4, %object
	.size	var4, 4
var4:
	.word	9
	.global	var5
	.data
	.align	2
	.type	var5, %object
	.size	var5, 4
var5:
	.word	10

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	func1
	.type	func1, %function
func1:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #20
.L1:
	add	sp, sp, #20
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	func1, .-func1

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 1872
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	ldr	r12, =1876
	sub	sp, sp, r12
	ldr	r10, =1
	str	r10, [r11, #-16]
	ldr	r10, =0
	mov	r1, r10
	ldr	r10, =40
	mov	r2, r10
	ldr	r10, =-56
	add	r10, r11, r10
	mov	r0, r10
	bl	memset(PLT)
	ldr	r10, =1
	ldr	r0, =-56
	add	r0, r0, r11
	str	r10, [r0, #0]
	ldr	r0, =-56
	add	r0, r0, r11
	ldr	r12, =0
	str	r12, [r0, #4]
	str	r12, [r0, #8]
	str	r12, [r0, #12]
	str	r12, [r0, #16]
	str	r12, [r0, #20]
	str	r12, [r0, #24]
	str	r12, [r0, #28]
	str	r12, [r0, #32]
	str	r12, [r0, #36]
	ldr	r10, =0
	mov	r1, r10
	ldr	r10, =24
	mov	r2, r10
	ldr	r10, =-80
	add	r10, r11, r10
	mov	r0, r10
	bl	memset(PLT)
	ldr	r10, =1
	ldr	r0, =-80
	add	r0, r0, r11
	str	r10, [r0, #0]
	ldr	r0, =-80
	add	r0, r0, r11
	ldr	r12, =0
	str	r12, [r0, #4]
	str	r12, [r0, #8]
	str	r12, [r0, #12]
	str	r12, [r0, #16]
	str	r12, [r0, #20]
	ldr	r10, =1
	str	r10, [r11, #-84]
	ldr	r10, =1
	str	r10, [r11, #-88]
	ldr	r10, =1
	str	r10, [r11, #-92]
	ldr	r10, =1
	str	r10, [r11, #-96]
	ldr	r10, =1
	str	r10, [r11, #-100]
	ldr	r10, =1
	str	r10, [r11, #-104]
	ldr	r10, =1
	b	.L6
	.ltorg
.L6:
	str	r10, [r11, #-108]
	ldr	r10, =0
	mov	r1, r10
	ldr	r10, =40
	mov	r2, r10
	ldr	r10, =-148
	add	r10, r11, r10
	mov	r0, r10
	bl	memset(PLT)
	ldr	r10, =1
	ldr	r0, =-148
	add	r0, r0, r11
	str	r10, [r0, #0]
	ldr	r0, =-148
	add	r0, r0, r11
	ldr	r12, =0
	str	r12, [r0, #4]
	str	r12, [r0, #8]
	str	r12, [r0, #12]
	str	r12, [r0, #16]
	str	r12, [r0, #20]
	str	r12, [r0, #24]
	str	r12, [r0, #28]
	str	r12, [r0, #32]
	str	r12, [r0, #36]
	ldr	r10, =0
	mov	r1, r10
	ldr	r10, =24
	mov	r2, r10
	ldr	r10, =-172
	add	r10, r11, r10
	mov	r0, r10
	bl	memset(PLT)
	ldr	r10, =1
	ldr	r0, =-172
	add	r0, r0, r11
	str	r10, [r0, #0]
	ldr	r0, =-172
	add	r0, r0, r11
	ldr	r12, =0
	str	r12, [r0, #4]
	str	r12, [r0, #8]
	str	r12, [r0, #12]
	str	r12, [r0, #16]
	str	r12, [r0, #20]
	ldr	r10, =1
	str	r10, [r11, #-176]
	ldr	r10, =1
	str	r10, [r11, #-180]
	ldr	r10, =1
	str	r10, [r11, #-184]
	ldr	r10, =1
	str	r10, [r11, #-188]
	ldr	r10, =1
	str	r10, [r11, #-192]
	ldr	r10, =1
	str	r10, [r11, #-196]
	ldr	r10, =1
	str	r10, [r11, #-200]
	ldr	r10, =0
	b	.L7
	.ltorg
.L7:
	mov	r1, r10
	ldr	r10, =40
	mov	r2, r10
	ldr	r10, =-240
	add	r10, r11, r10
	mov	r0, r10
	bl	memset(PLT)
	ldr	r10, =1
	ldr	r0, =-240
	add	r0, r0, r11
	str	r10, [r0, #0]
	ldr	r0, =-240
	add	r0, r0, r11
	ldr	r12, =0
	str	r12, [r0, #4]
	str	r12, [r0, #8]
	str	r12, [r0, #12]
	str	r12, [r0, #16]
	str	r12, [r0, #20]
	str	r12, [r0, #24]
	str	r12, [r0, #28]
	str	r12, [r0, #32]
	str	r12, [r0, #36]
	ldr	r10, =0
	mov	r1, r10
	ldr	r10, =24
	mov	r2, r10
	ldr	r10, =-264
	add	r10, r11, r10
	mov	r0, r10
	bl	memset(PLT)
	ldr	r10, =1
	ldr	r0, =-264
	add	r0, r0, r11
	str	r10, [r0, #0]
	ldr	r0, =-264
	add	r0, r0, r11
	ldr	r12, =0
	str	r12, [r0, #4]
	str	r12, [r0, #8]
	str	r12, [r0, #12]
	str	r12, [r0, #16]
	str	r12, [r0, #20]
	ldr	r10, =1
	str	r10, [r11, #-268]
	ldr	r10, =1
	str	r10, [r11, #-272]
	ldr	r10, =1
	str	r10, [r11, #-276]
	ldr	r10, =1
	str	r10, [r11, #-280]
	ldr	r10, =1
	str	r10, [r11, #-284]
	ldr	r10, =1
	str	r10, [r11, #-288]
	ldr	r10, =1
	str	r10, [r11, #-292]
	ldr	r10, =0
	mov	r1, r10
	ldr	r10, =40
	b	.L8
	.ltorg
.L8:
	mov	r2, r10
	ldr	r10, =-332
	add	r10, r11, r10
	mov	r0, r10
	bl	memset(PLT)
	ldr	r10, =1
	ldr	r0, =-332
	add	r0, r0, r11
	str	r10, [r0, #0]
	ldr	r0, =-332
	add	r0, r0, r11
	ldr	r12, =0
	str	r12, [r0, #4]
	str	r12, [r0, #8]
	str	r12, [r0, #12]
	str	r12, [r0, #16]
	str	r12, [r0, #20]
	str	r12, [r0, #24]
	str	r12, [r0, #28]
	str	r12, [r0, #32]
	str	r12, [r0, #36]
	ldr	r10, =0
	mov	r1, r10
	ldr	r10, =24
	mov	r2, r10
	ldr	r10, =-356
	add	r10, r11, r10
	mov	r0, r10
	bl	memset(PLT)
	ldr	r10, =1
	ldr	r0, =-356
	add	r0, r0, r11
	str	r10, [r0, #0]
	ldr	r0, =-356
	add	r0, r0, r11
	ldr	r12, =0
	str	r12, [r0, #4]
	str	r12, [r0, #8]
	str	r12, [r0, #12]
	str	r12, [r0, #16]
	str	r12, [r0, #20]
	ldr	r10, =1
	str	r10, [r11, #-360]
	ldr	r10, =1
	str	r10, [r11, #-364]
	ldr	r10, =1
	str	r10, [r11, #-368]
	ldr	r10, =1
	str	r10, [r11, #-372]
	ldr	r10, =1
	str	r10, [r11, #-376]
	ldr	r10, =1
	str	r10, [r11, #-380]
	ldr	r10, =1
	str	r10, [r11, #-384]
	ldr	r10, =0
	mov	r1, r10
	ldr	r10, =40
	mov	r2, r10
	ldr	r10, =-424
	b	.L9
	.ltorg
.L9:
	add	r10, r11, r10
	mov	r0, r10
	bl	memset(PLT)
	ldr	r10, =1
	ldr	r0, =-424
	add	r0, r0, r11
	str	r10, [r0, #0]
	ldr	r0, =-424
	add	r0, r0, r11
	ldr	r12, =0
	str	r12, [r0, #4]
	str	r12, [r0, #8]
	str	r12, [r0, #12]
	str	r12, [r0, #16]
	str	r12, [r0, #20]
	str	r12, [r0, #24]
	str	r12, [r0, #28]
	str	r12, [r0, #32]
	str	r12, [r0, #36]
	ldr	r10, =0
	mov	r1, r10
	ldr	r10, =24
	mov	r2, r10
	ldr	r10, =-448
	add	r10, r11, r10
	mov	r0, r10
	bl	memset(PLT)
	ldr	r10, =1
	ldr	r0, =-448
	add	r0, r0, r11
	str	r10, [r0, #0]
	ldr	r0, =-448
	add	r0, r0, r11
	ldr	r12, =0
	str	r12, [r0, #4]
	str	r12, [r0, #8]
	str	r12, [r0, #12]
	str	r12, [r0, #16]
	str	r12, [r0, #20]
	ldr	r10, =1
	str	r10, [r11, #-452]
	ldr	r10, =1
	str	r10, [r11, #-456]
	ldr	r10, =1
	str	r10, [r11, #-460]
	ldr	r10, =1
	str	r10, [r11, #-464]
	ldr	r10, =1
	str	r10, [r11, #-468]
	ldr	r10, =1
	str	r10, [r11, #-472]
	ldr	r10, =1
	cmp	r10, #0
	bne	.L5
	ldr	r0, =1
	cmp	r0, #0
	b	.L4
	.ltorg
.L5:
	ldr	r0, =0
	cmp	r0, #0
	b	.L3
	b	.L4
	.ltorg
.L3:
	ldr	r10, =1
	str	r10, [r11, #-476]
	ldr	r10, =0
	mov	r1, r10
	ldr	r10, =40
	mov	r2, r10
	ldr	r10, =-516
	add	r10, r11, r10
	mov	r0, r10
	bl	memset(PLT)
	ldr	r10, =1
	ldr	r0, =-516
	add	r0, r0, r11
	str	r10, [r0, #0]
	ldr	r0, =-516
	add	r0, r0, r11
	ldr	r12, =0
	str	r12, [r0, #4]
	str	r12, [r0, #8]
	str	r12, [r0, #12]
	str	r12, [r0, #16]
	str	r12, [r0, #20]
	str	r12, [r0, #24]
	str	r12, [r0, #28]
	str	r12, [r0, #32]
	str	r12, [r0, #36]
	ldr	r10, =0
	mov	r1, r10
	ldr	r10, =24
	mov	r2, r10
	ldr	r10, =-540
	add	r10, r11, r10
	mov	r0, r10
	bl	memset(PLT)
	ldr	r10, =1
	ldr	r0, =-540
	add	r0, r0, r11
	str	r10, [r0, #0]
	ldr	r0, =-540
	add	r0, r0, r11
	ldr	r12, =0
	str	r12, [r0, #4]
	str	r12, [r0, #8]
	str	r12, [r0, #12]
	str	r12, [r0, #16]
	str	r12, [r0, #20]
	ldr	r10, =1
	str	r10, [r11, #-544]
	ldr	r10, =1
	str	r10, [r11, #-548]
	ldr	r10, =1
	str	r10, [r11, #-552]
	ldr	r10, =1
	str	r10, [r11, #-556]
	ldr	r10, =1
	str	r10, [r11, #-560]
	ldr	r10, =1
	str	r10, [r11, #-564]
	ldr	r10, =1
	b	.L10
	.ltorg
.L10:
	str	r10, [r11, #-568]
	ldr	r10, =0
	mov	r1, r10
	ldr	r10, =40
	mov	r2, r10
	ldr	r10, =-608
	add	r10, r11, r10
	mov	r0, r10
	bl	memset(PLT)
	ldr	r10, =1
	ldr	r0, =-608
	add	r0, r0, r11
	str	r10, [r0, #0]
	ldr	r0, =-608
	add	r0, r0, r11
	ldr	r12, =0
	str	r12, [r0, #4]
	str	r12, [r0, #8]
	str	r12, [r0, #12]
	str	r12, [r0, #16]
	str	r12, [r0, #20]
	str	r12, [r0, #24]
	str	r12, [r0, #28]
	str	r12, [r0, #32]
	str	r12, [r0, #36]
	ldr	r10, =0
	mov	r1, r10
	ldr	r10, =24
	mov	r2, r10
	ldr	r10, =-632
	add	r10, r11, r10
	mov	r0, r10
	bl	memset(PLT)
	ldr	r10, =1
	ldr	r0, =-632
	add	r0, r0, r11
	str	r10, [r0, #0]
	ldr	r0, =-632
	add	r0, r0, r11
	ldr	r12, =0
	str	r12, [r0, #4]
	str	r12, [r0, #8]
	str	r12, [r0, #12]
	str	r12, [r0, #16]
	str	r12, [r0, #20]
	ldr	r10, =1
	str	r10, [r11, #-636]
	ldr	r10, =1
	str	r10, [r11, #-640]
	ldr	r10, =1
	str	r10, [r11, #-644]
	ldr	r10, =1
	str	r10, [r11, #-648]
	ldr	r10, =1
	str	r10, [r11, #-652]
	ldr	r10, =1
	str	r10, [r11, #-656]
	ldr	r10, =1
	str	r10, [r11, #-660]
	ldr	r10, =0
	b	.L11
	.ltorg
.L11:
	mov	r1, r10
	ldr	r10, =40
	mov	r2, r10
	ldr	r10, =-700
	add	r10, r11, r10
	mov	r0, r10
	bl	memset(PLT)
	ldr	r10, =1
	ldr	r0, =-700
	add	r0, r0, r11
	str	r10, [r0, #0]
	ldr	r0, =-700
	add	r0, r0, r11
	ldr	r12, =0
	str	r12, [r0, #4]
	str	r12, [r0, #8]
	str	r12, [r0, #12]
	str	r12, [r0, #16]
	str	r12, [r0, #20]
	str	r12, [r0, #24]
	str	r12, [r0, #28]
	str	r12, [r0, #32]
	str	r12, [r0, #36]
	ldr	r10, =0
	mov	r1, r10
	ldr	r10, =24
	mov	r2, r10
	ldr	r10, =-724
	add	r10, r11, r10
	mov	r0, r10
	bl	memset(PLT)
	ldr	r10, =1
	ldr	r0, =-724
	add	r0, r0, r11
	str	r10, [r0, #0]
	ldr	r0, =-724
	add	r0, r0, r11
	ldr	r12, =0
	str	r12, [r0, #4]
	str	r12, [r0, #8]
	str	r12, [r0, #12]
	str	r12, [r0, #16]
	str	r12, [r0, #20]
	ldr	r10, =1
	str	r10, [r11, #-728]
	ldr	r10, =1
	str	r10, [r11, #-732]
	ldr	r10, =1
	str	r10, [r11, #-736]
	ldr	r10, =1
	str	r10, [r11, #-740]
	ldr	r10, =1
	str	r10, [r11, #-744]
	ldr	r10, =1
	str	r10, [r11, #-748]
	ldr	r10, =1
	str	r10, [r11, #-752]
	ldr	r10, =0
	mov	r1, r10
	ldr	r10, =40
	b	.L12
	.ltorg
.L12:
	mov	r2, r10
	ldr	r10, =-792
	add	r10, r11, r10
	mov	r0, r10
	bl	memset(PLT)
	ldr	r10, =1
	ldr	r0, =-792
	add	r0, r0, r11
	str	r10, [r0, #0]
	ldr	r0, =-792
	add	r0, r0, r11
	ldr	r12, =0
	str	r12, [r0, #4]
	str	r12, [r0, #8]
	str	r12, [r0, #12]
	str	r12, [r0, #16]
	str	r12, [r0, #20]
	str	r12, [r0, #24]
	str	r12, [r0, #28]
	str	r12, [r0, #32]
	str	r12, [r0, #36]
	ldr	r10, =0
	mov	r1, r10
	ldr	r10, =24
	mov	r2, r10
	ldr	r10, =-816
	add	r10, r11, r10
	mov	r0, r10
	bl	memset(PLT)
	ldr	r10, =1
	ldr	r0, =-816
	add	r0, r0, r11
	str	r10, [r0, #0]
	ldr	r0, =-816
	add	r0, r0, r11
	ldr	r12, =0
	str	r12, [r0, #4]
	str	r12, [r0, #8]
	str	r12, [r0, #12]
	str	r12, [r0, #16]
	str	r12, [r0, #20]
	ldr	r10, =1
	str	r10, [r11, #-820]
	ldr	r10, =1
	str	r10, [r11, #-824]
	ldr	r10, =1
	str	r10, [r11, #-828]
	ldr	r10, =1
	str	r10, [r11, #-832]
	ldr	r10, =1
	str	r10, [r11, #-836]
	ldr	r10, =1
	str	r10, [r11, #-840]
	ldr	r10, =1
	str	r10, [r11, #-844]
	ldr	r10, =0
	mov	r1, r10
	ldr	r10, =40
	mov	r2, r10
	ldr	r10, =-884
	b	.L13
	.ltorg
.L13:
	add	r10, r11, r10
	mov	r0, r10
	bl	memset(PLT)
	ldr	r10, =1
	ldr	r0, =-884
	add	r0, r0, r11
	str	r10, [r0, #0]
	ldr	r0, =-884
	add	r0, r0, r11
	ldr	r12, =0
	str	r12, [r0, #4]
	str	r12, [r0, #8]
	str	r12, [r0, #12]
	str	r12, [r0, #16]
	str	r12, [r0, #20]
	str	r12, [r0, #24]
	str	r12, [r0, #28]
	str	r12, [r0, #32]
	str	r12, [r0, #36]
	ldr	r10, =0
	mov	r1, r10
	ldr	r10, =24
	mov	r2, r10
	ldr	r10, =-908
	add	r10, r11, r10
	mov	r0, r10
	bl	memset(PLT)
	ldr	r10, =1
	ldr	r0, =-908
	add	r0, r0, r11
	str	r10, [r0, #0]
	ldr	r0, =-908
	add	r0, r0, r11
	ldr	r12, =0
	str	r12, [r0, #4]
	str	r12, [r0, #8]
	str	r12, [r0, #12]
	str	r12, [r0, #16]
	str	r12, [r0, #20]
	ldr	r10, =1
	str	r10, [r11, #-912]
	ldr	r10, =1
	str	r10, [r11, #-916]
	ldr	r10, =1
	str	r10, [r11, #-920]
	ldr	r10, =1
	str	r10, [r11, #-924]
	ldr	r10, =1
	str	r10, [r11, #-928]
	ldr	r10, =1
	str	r10, [r11, #-932]
.L4:
	ldr	r10, =0
	mov	r0, r10
	b	.L2
	.ltorg
.L2:
	ldr	r12, =1876
	add	sp, sp, r12
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
