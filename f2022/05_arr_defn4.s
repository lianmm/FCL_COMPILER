
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 236
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #240
	ldr	r9, =1
	ldr	r10, =-44
	add	r10, r10, fp
	str	r9,	[r10, #0]
	ldr	r9, =2
	ldr	r10, =-44
	add	r10, r10, fp
	str	r9,	[r10, #4]
	ldr	r9, =3
	ldr	r10, =-44
	add	r10, r10, fp
	str	r9,	[r10, #8]
	ldr	r9, =4
	ldr	r10, =-44
	add	r10, r10, fp
	str	r9,	[r10, #12]
	ldr	r10, =-44
	add	r10, r10, fp
	mov	r12, #0
	str	r12, [r10, #16]
	str	r12, [r10, #20]

	ldr	r9, =7
	ldr	r10, =-44
	add	r10, r10, fp
	str	r9,	[r10, #24]
	ldr	r10, =-80
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
	ldr	r9, =0
	ldr	r8, =2
	ldr	r7, =3
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r10, =-44
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =1
	ldr	r10, =-144
	add	r10, r10, fp
	str	r8,	[r10, #0]
	ldr	r8, =2
	ldr	r10, =-144
	add	r10, r10, fp
	str	r8,	[r10, #4]
	ldr	r8, =3
	ldr	r10, =-144
	add	r10, r10, fp
	str	r8,	[r10, #8]
	ldr	r10, =-144
	add	r10, r10, fp
	mov	r12, #0
	str	r12, [r10, #12]

	ldr	r8, =5
	ldr	r10, =-144
	add	r10, r10, fp
	str	r8,	[r10, #16]
	ldr	r10, =-144
	add	r10, r10, fp
	mov	r12, #0
	str	r12, [r10, #20]

	ldr	r10, =-144
	add	r10, r10, fp
	str	r9,	[r10, #24]
	ldr	r9, =8
	ldr	r10, =-144
	add	r10, r10, fp
	str	r9,	[r10, #28]
	ldr	r9, =1
	ldr	r8, =2
	ldr	r7, =2
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r10, =-144
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =1
	ldr	r7, =2
	ldr	r6, =2
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r10, =-112
	add	r10, r10, fp
	ldr	r8,	[r10, r8,LSL#2]
	ldr	r10, =-176
	add	r10, r10, fp
	str	r9,	[r10, #0]
	ldr	r10, =-176
	add	r10, r10, fp
	str	r8,	[r10, #4]
	ldr	r9, =3
	ldr	r10, =-176
	add	r10, r10, fp
	str	r9,	[r10, #8]
	ldr	r9, =4
	ldr	r10, =-176
	add	r10, r10, fp
	str	r9,	[r10, #12]
	ldr	r9, =5
	ldr	r10, =-176
	add	r10, r10, fp
	str	r9,	[r10, #16]
	ldr	r9, =6
	ldr	r10, =-176
	add	r10, r10, fp
	str	r9,	[r10, #20]
	ldr	r9, =7
	ldr	r10, =-176
	add	r10, r10, fp
	str	r9,	[r10, #24]
	ldr	r9, =8
	ldr	r10, =-176
	add	r10, r10, fp
	str	r9,	[r10, #28]
	ldr	r9, =0
	ldr	r8, =1
	ldr	r7, =1
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r8, =2
	ldr	r7, =3
	mul	r8, r7, r8
	add	r9, r8, r9
	ldr	r10, =-176
	add	r10, r10, fp
	ldr	r9,	[r10, r9,LSL#2]
	ldr	r8, =0
	ldr	r7, =1
	ldr	r6, =0
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =0
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r10, =-176
	add	r10, r10, fp
	ldr	r8,	[r10, r8,LSL#2]
	add	r9, r8, r9
	ldr	r8, =0
	ldr	r7, =1
	ldr	r6, =1
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r7, =2
	ldr	r6, =0
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r10, =-176
	add	r10, r10, fp
	ldr	r8,	[r10, r8,LSL#2]
	add	r9, r8, r9
	ldr	r8, =0
	ldr	r7, =2
	ldr	r6, =3
	mul	r7, r6, r7
	add	r8, r7, r8
	ldr	r10, =-144
	add	r10, r10, fp
	ldr	r8,	[r10, r8,LSL#2]
	add	r9, r8, r9
	mov	r0, r9
	b	.L1

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
