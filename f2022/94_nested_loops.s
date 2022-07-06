	.global	arr1
	.data
	.align	2
	.type	arr1, %object
	.size	arr1, 57600
arr1:
	.space	57600
	.global	arr2
	.data
	.align	2
	.type	arr2, %object
	.size	arr2, 107520
arr2:
	.space	107520

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	loop1
	.type	loop1, %function
loop1:
	@ args = 0, pretend = 0, frame = 88
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #92
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r9, =0
	str	r9, [fp, #-24]

.L5:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-16]
	cmp	r9, r8
	blt	.L412
	ldr	r10, =1
	cmp	r10, #0
	b	.L8

.L412:
	ldr	r10, =0
	cmp	r10, #0
	b	.L9
	b	.L8

.L9:
	ldr	r8, [fp, #-24]
	ldr	r7, [fp, #-20]
	cmp	r8, r7
	blt	.L413
	ldr	r10, =1
	cmp	r10, #0
	b	.L10

.L413:
	ldr	r10, =0
	cmp	r10, #0
	b	.L10

.L10:

.L8:
	beq	.L6
	b	.L7

.L6:
	ldr	r9, =0
	str	r9, [fp, #-28]

.L20:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	cmp	r9, r8
	blt	.L414
	ldr	r10, =1
	cmp	r10, #0
	b	.L22

.L414:
	ldr	r10, =0
	cmp	r10, #0
	b	.L21
	b	.L22

.L21:
	ldr	r9, =0
	str	r9, [fp, #-32]

.L29:
	ldr	r9, [fp, #-32]
	ldr	r8, =3
	cmp	r9, r8
	blt	.L415
	ldr	r10, =1
	cmp	r10, #0
	b	.L31

.L415:
	ldr	r10, =0
	cmp	r10, #0
	b	.L30
	b	.L31

.L30:
	ldr	r9, =0
	str	r9, [fp, #-36]

.L38:
	ldr	r9, [fp, #-36]
	ldr	r8, =4
	cmp	r9, r8
	blt	.L416
	ldr	r10, =1
	cmp	r10, #0
	b	.L40

.L416:
	ldr	r10, =0
	cmp	r10, #0
	b	.L39
	b	.L40

.L39:
	ldr	r9, =0
	str	r9, [fp, #-40]

.L47:
	ldr	r9, [fp, #-40]
	ldr	r8, =5
	cmp	r9, r8
	blt	.L417
	ldr	r10, =1
	cmp	r10, #0
	b	.L49

.L417:
	ldr	r10, =0
	cmp	r10, #0
	b	.L48
	b	.L49

.L48:
	ldr	r9, =0
	str	r9, [fp, #-44]

.L56:
	ldr	r9, [fp, #-44]
	ldr	r8, =6
	cmp	r9, r8
	blt	.L418
	ldr	r10, =1
	cmp	r10, #0
	b	.L58

.L418:
	ldr	r10, =0
	cmp	r10, #0
	b	.L57
	b	.L58

.L57:
	ldr	r9, =0
	str	r9, [fp, #-48]

.L65:
	ldr	r9, [fp, #-48]
	ldr	r8, =2
	cmp	r9, r8
	blt	.L419
	ldr	r10, =1
	cmp	r10, #0
	b	.L67

.L419:
	ldr	r10, =0
	cmp	r10, #0
	b	.L66
	b	.L67

.L66:
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	add	r9, r8, r9
	ldr	r8, [fp, #-32]
	add	r9, r8, r9
	ldr	r8, [fp, #-36]
	add	r9, r8, r9
	ldr	r8, [fp, #-40]
	add	r9, r8, r9
	ldr	r8, [fp, #-44]
	add	r9, r8, r9
	ldr	r8, [fp, #-48]
	add	r9, r8, r9
	ldr	r8, [fp, #-16]
	add	r9, r8, r9
	ldr	r8, [fp, #-20]
	add	r9, r8, r9
	ldr	r8, [fp, #-24]
	ldr	r7, [fp, #-28]
	ldr	r6, [fp, #-32]
	ldr	r5, [fp, #-36]
	ldr	r4, [fp, #-40]
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-48]
	ldr	r1, =2
	mul	r3, r3, r1
	add	r3, r3, r2
	ldr	r2, =12
	mul	r4, r4, r2
	add	r4, r4, r3
	ldr	r3, =60
	mul	r5, r5, r3
	add	r5, r5, r4
	ldr	r4, =240
	mul	r6, r6, r4
	add	r6, r6, r5
	ldr	r5, =720
	mul	r7, r7, r5
	add	r7, r7, r6
	ldr	r6, =1440
	mul	r8, r8, r6
	add	r8, r8, r7
	movw	r10, #:lower16:arr1
	movt	r10, #:upper16:arr1
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-48]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-48]
	b	.L65

.L67:
	ldr	r9, [fp, #-44]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-44]
	b	.L56

.L58:
	ldr	r9, [fp, #-40]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-40]
	b	.L47

.L49:
	ldr	r9, [fp, #-36]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-36]
	b	.L38

.L40:
	ldr	r9, [fp, #-32]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-32]
	b	.L29

.L31:
	ldr	r9, [fp, #-28]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-28]
	b	.L20

.L22:
	ldr	r9, [fp, #-24]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-24]
	b	.L5

.L7:

.L1:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	loop1, .-loop1

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	loop2
	.type	loop2, %function
loop2:
	@ args = 0, pretend = 0, frame = 356
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #360
	ldr	r9, =0
	str	r9, [fp, #-16]

.L144:
	ldr	r9, [fp, #-16]
	ldr	r8, =10
	cmp	r9, r8
	blt	.L420
	ldr	r10, =1
	cmp	r10, #0
	b	.L146

.L420:
	ldr	r10, =0
	cmp	r10, #0
	b	.L145
	b	.L146

.L145:
	ldr	r9, =0
	str	r9, [fp, #-20]

.L153:
	ldr	r9, [fp, #-20]
	ldr	r8, =2
	cmp	r9, r8
	blt	.L421
	ldr	r10, =1
	cmp	r10, #0
	b	.L155

.L421:
	ldr	r10, =0
	cmp	r10, #0
	b	.L154
	b	.L155

.L154:
	ldr	r9, =0
	str	r9, [fp, #-24]

.L162:
	ldr	r9, [fp, #-24]
	ldr	r8, =3
	cmp	r9, r8
	blt	.L422
	ldr	r10, =1
	cmp	r10, #0
	b	.L164

.L422:
	ldr	r10, =0
	cmp	r10, #0
	b	.L163
	b	.L164

.L163:
	ldr	r9, =0
	str	r9, [fp, #-28]

.L171:
	ldr	r9, [fp, #-28]
	ldr	r8, =2
	cmp	r9, r8
	blt	.L423
	ldr	r10, =1
	cmp	r10, #0
	b	.L173

.L423:
	ldr	r10, =0
	cmp	r10, #0
	b	.L172
	b	.L173

.L172:
	ldr	r9, =0
	str	r9, [fp, #-32]

.L180:
	ldr	r9, [fp, #-32]
	ldr	r8, =4
	cmp	r9, r8
	blt	.L424
	ldr	r10, =1
	cmp	r10, #0
	b	.L182

.L424:
	ldr	r10, =0
	cmp	r10, #0
	b	.L181
	b	.L182

.L181:
	ldr	r9, =0
	str	r9, [fp, #-36]

.L189:
	ldr	r9, [fp, #-36]
	ldr	r8, =8
	cmp	r9, r8
	blt	.L425
	ldr	r10, =1
	cmp	r10, #0
	b	.L191

.L425:
	ldr	r10, =0
	cmp	r10, #0
	b	.L190
	b	.L191

.L190:
	ldr	r9, =0
	str	r9, [fp, #-40]

.L198:
	ldr	r9, [fp, #-40]
	ldr	r8, =7
	cmp	r9, r8
	blt	.L426
	ldr	r10, =1
	cmp	r10, #0
	b	.L200

.L426:
	ldr	r10, =0
	cmp	r10, #0
	b	.L199
	b	.L200

.L199:
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-20]
	add	r9, r8, r9
	ldr	r8, [fp, #-28]
	add	r9, r8, r9
	ldr	r8, [fp, #-40]
	add	r9, r8, r9
	ldr	r8, [fp, #-16]
	ldr	r7, [fp, #-20]
	ldr	r6, [fp, #-24]
	ldr	r5, [fp, #-28]
	ldr	r4, [fp, #-32]
	ldr	r3, [fp, #-36]
	ldr	r2, [fp, #-40]
	ldr	r1, =7
	mul	r3, r3, r1
	add	r3, r3, r2
	ldr	r2, =56
	mul	r4, r4, r2
	add	r4, r4, r3
	ldr	r3, =224
	mul	r5, r5, r3
	add	r5, r5, r4
	ldr	r4, =448
	mul	r6, r6, r4
	add	r6, r6, r5
	ldr	r5, =1344
	mul	r7, r7, r5
	add	r7, r7, r6
	ldr	r6, =2688
	mul	r8, r8, r6
	add	r8, r8, r7
	movw	r10, #:lower16:arr2
	movt	r10, #:upper16:arr2
	str	r9,	[r10, r8,LSL#2]
	ldr	r9, [fp, #-40]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-40]
	b	.L198

.L200:
	ldr	r9, [fp, #-36]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-36]
	b	.L189

.L191:
	ldr	r9, [fp, #-32]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-32]
	b	.L180

.L182:
	ldr	r9, [fp, #-28]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-28]
	b	.L171

.L173:
	ldr	r9, [fp, #-24]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-24]
	b	.L162

.L164:
	ldr	r9, [fp, #-20]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-20]
	b	.L153

.L155:
	ldr	r9, [fp, #-16]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-16]
	b	.L144

.L146:

.L140:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	loop2, .-loop2

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	loop3
	.type	loop3, %function
loop3:
	@ args = 12, pretend = 0, frame = 468
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #472
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r9, =0
	str	r9, [fp, #-60]
	ldr	r9, =0
	str	r9, [fp, #-32]

.L262:
	ldr	r9, [fp, #-32]
	ldr	r8, =10
	cmp	r9, r8
	blt	.L427
	ldr	r10, =1
	cmp	r10, #0
	b	.L264

.L427:
	ldr	r10, =0
	cmp	r10, #0
	b	.L263
	b	.L264

.L263:
	ldr	r9, =0
	str	r9, [fp, #-36]

.L271:
	ldr	r9, [fp, #-36]
	ldr	r8, =100
	cmp	r9, r8
	blt	.L428
	ldr	r10, =1
	cmp	r10, #0
	b	.L273

.L428:
	ldr	r10, =0
	cmp	r10, #0
	b	.L272
	b	.L273

.L272:
	ldr	r9, =0
	str	r9, [fp, #-40]

.L280:
	ldr	r9, [fp, #-40]
	ldr	r8, =1000
	cmp	r9, r8
	blt	.L429
	ldr	r10, =1
	cmp	r10, #0
	b	.L282

.L429:
	ldr	r10, =0
	cmp	r10, #0
	b	.L281
	b	.L282

.L281:
	ldr	r9, =0
	str	r9, [fp, #-44]

.L289:
	ldr	r9, [fp, #-44]
	ldr	r8, =10000
	cmp	r9, r8
	blt	.L430
	ldr	r10, =1
	cmp	r10, #0
	b	.L291

.L430:
	ldr	r10, =0
	cmp	r10, #0
	b	.L290
	b	.L291

.L290:
	ldr	r9, =0
	str	r9, [fp, #-48]

.L298:
	ldr	r9, [fp, #-48]
	ldr	r8, =100000
	cmp	r9, r8
	blt	.L431
	ldr	r10, =1
	cmp	r10, #0
	b	.L300

.L431:
	ldr	r10, =0
	cmp	r10, #0
	b	.L299
	b	.L300

.L299:
	ldr	r9, =0
	str	r9, [fp, #-52]

.L307:
	ldr	r9, [fp, #-52]
	ldr	r8, =1000000
	cmp	r9, r8
	blt	.L432
	ldr	r10, =1
	cmp	r10, #0
	b	.L309

.L432:
	ldr	r10, =0
	cmp	r10, #0
	b	.L308
	b	.L309

.L308:
	ldr	r9, =0
	str	r9, [fp, #-56]

.L316:
	ldr	r9, [fp, #-56]
	ldr	r8, =10000000
	cmp	r9, r8
	blt	.L433
	ldr	r10, =1
	cmp	r10, #0
	b	.L318

.L433:
	ldr	r10, =0
	cmp	r10, #0
	b	.L317
	b	.L318

.L317:
	ldr	r9, [fp, #-60]
	ldr	r8, =817
	mov	r0, r9
	mov	r1, r8
	bl	__aeabi_idivmod
	mov	r9, r1
	ldr	r8, [fp, #-32]
	ldr	r7, [fp, #-36]
	ldr	r6, [fp, #-40]
	ldr	r5, [fp, #-44]
	ldr	r4, [fp, #-48]
	ldr	r3, [fp, #-52]
	ldr	r2, [fp, #-56]
	ldr	r1, =2
	mul	r3, r3, r1
	add	r3, r3, r2
	ldr	r2, =12
	mul	r4, r4, r2
	add	r4, r4, r3
	ldr	r3, =60
	mul	r5, r5, r3
	add	r5, r5, r4
	ldr	r4, =240
	mul	r6, r6, r4
	add	r6, r6, r5
	ldr	r5, =720
	mul	r7, r7, r5
	add	r7, r7, r6
	ldr	r6, =1440
	mul	r8, r8, r6
	add	r8, r8, r7
	movw	r10, #:lower16:arr1
	movt	r10, #:upper16:arr1
	ldr	r8,	[r10, r8,LSL#2]
	add	r9, r8, r9
	ldr	r8, [fp, #-32]
	ldr	r7, [fp, #-36]
	ldr	r6, [fp, #-40]
	ldr	r5, [fp, #-44]
	ldr	r4, [fp, #-48]
	ldr	r3, [fp, #-52]
	ldr	r2, [fp, #-56]
	ldr	r1, =7
	mul	r3, r3, r1
	add	r3, r3, r2
	ldr	r2, =56
	mul	r4, r4, r2
	add	r4, r4, r3
	ldr	r3, =224
	mul	r5, r5, r3
	add	r5, r5, r4
	ldr	r4, =448
	mul	r6, r6, r4
	add	r6, r6, r5
	ldr	r5, =1344
	mul	r7, r7, r5
	add	r7, r7, r6
	ldr	r6, =2688
	mul	r8, r8, r6
	add	r8, r8, r7
	movw	r10, #:lower16:arr2
	movt	r10, #:upper16:arr2
	ldr	r8,	[r10, r8,LSL#2]
	add	r9, r8, r9
	str	r9, [fp, #-60]
	ldr	r9, [fp, #-56]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-56]
	ldr	r9, [fp, #-56]
	ldr	r8, [fp, #44]
	cmp	r9, r8
	bge	.L434
	ldr	r10, =1
	cmp	r10, #0
	b	.L341

.L434:
	ldr	r10, =0
	cmp	r10, #0
	b	.L340
	b	.L341

.L340:
	b	.L318

.L341:
	b	.L316

.L318:
	ldr	r9, [fp, #-52]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-52]
	ldr	r9, [fp, #-52]
	ldr	r8, [fp, #40]
	cmp	r9, r8
	bge	.L435
	ldr	r10, =1
	cmp	r10, #0
	b	.L352

.L435:
	ldr	r10, =0
	cmp	r10, #0
	b	.L351
	b	.L352

.L351:
	b	.L309

.L352:
	b	.L307

.L309:
	ldr	r9, [fp, #-48]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-48]
	ldr	r9, [fp, #-48]
	ldr	r8, [fp, #36]
	cmp	r9, r8
	bge	.L436
	ldr	r10, =1
	cmp	r10, #0
	b	.L363

.L436:
	ldr	r10, =0
	cmp	r10, #0
	b	.L362
	b	.L363

.L362:
	b	.L300

.L363:
	b	.L298

.L300:
	ldr	r9, [fp, #-44]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-44]
	ldr	r9, [fp, #-44]
	ldr	r8, [fp, #-28]
	cmp	r9, r8
	bge	.L437
	ldr	r10, =1
	cmp	r10, #0
	b	.L374

.L437:
	ldr	r10, =0
	cmp	r10, #0
	b	.L373
	b	.L374

.L373:
	b	.L291

.L374:
	b	.L289

.L291:
	ldr	r9, [fp, #-40]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-40]
	ldr	r9, [fp, #-40]
	ldr	r8, [fp, #-24]
	cmp	r9, r8
	bge	.L438
	ldr	r10, =1
	cmp	r10, #0
	b	.L385

.L438:
	ldr	r10, =0
	cmp	r10, #0
	b	.L384
	b	.L385

.L384:
	b	.L282

.L385:
	b	.L280

.L282:
	ldr	r9, [fp, #-36]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-36]
	ldr	r9, [fp, #-36]
	ldr	r8, [fp, #-20]
	cmp	r9, r8
	bge	.L439
	ldr	r10, =1
	cmp	r10, #0
	b	.L396

.L439:
	ldr	r10, =0
	cmp	r10, #0
	b	.L395
	b	.L396

.L395:
	b	.L273

.L396:
	b	.L271

.L273:
	ldr	r9, [fp, #-32]
	ldr	r8, =1
	add	r9, r8, r9
	str	r9, [fp, #-32]
	ldr	r9, [fp, #-32]
	ldr	r8, [fp, #-16]
	cmp	r9, r8
	bge	.L440
	ldr	r10, =1
	cmp	r10, #0
	b	.L407

.L440:
	ldr	r10, =0
	cmp	r10, #0
	b	.L406
	b	.L407

.L406:
	b	.L264

.L407:
	b	.L262

.L264:
	ldr	r9, [fp, #-60]
	mov	r0, r9
	b	.L258

.L258:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	loop3, .-loop3

	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 120
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4-r10,fp, lr}
	add	fp, sp, #0
	sub	sp, sp, #124
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-16]
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-20]
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-24]
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-28]
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-32]
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-36]
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-40]
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-44]
	bl	getint
	mov	r9, r0
	str	r9, [fp, #-48]
	ldr	r9, [fp, #-16]
	ldr	r8, [fp, #-20]
	mov	r0, r9
	mov	r1, r8
	bl	loop1
	bl	loop2
	ldr	r9, [fp, #-24]
	ldr	r8, [fp, #-28]
	ldr	r7, [fp, #-32]
	ldr	r6, [fp, #-36]
	ldr	r5, [fp, #-40]
	ldr	r4, [fp, #-44]
	ldr	r3, [fp, #-48]
	mov	r0, r9
	mov	r1, r8
	mov	r2, r7
	mov	r10, r3
	mov	r3, r6
	mov	r6, r10
	str	r5, [sp, #0]
	str	r4, [sp, #4]
	str	r6, [sp, #8]
	bl	loop3
	mov	r9, r0
	mov	r0, r9
	b	.L411

.L411:
	add	sp, fp, #0
	ldmfd	sp!, {r4-r10,fp, pc}
	.size	main, .-main
