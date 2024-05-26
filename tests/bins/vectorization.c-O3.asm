
vectorization.c.elf:     file format elf64-littleaarch64


Disassembly of section .start:

00000000000e0000 <_start>:
   e0000:	d10143ff 	sub	sp, sp, #0x50
   e0004:	52800021 	mov	w1, #0x1                   	// #1
   e0008:	d140cbff 	sub	sp, sp, #0x32, lsl #12
   e000c:	528004e3 	mov	w3, #0x27                  	// #39
   e0010:	a9007bfd 	stp	x29, x30, [sp]
   e0014:	910003fd 	mov	x29, sp
   e0018:	a90153f3 	stp	x19, x20, [sp, #16]
   e001c:	d2860a13 	mov	x19, #0x3050                	// #12368
   e0020:	8b3363e8 	add	x8, sp, x19
   e0024:	d2880a14 	mov	x20, #0x4050                	// #16464
   e0028:	aa0803e2 	mov	x2, x8
   e002c:	8b3463ea 	add	x10, sp, x20
   e0030:	a9025bf5 	stp	x21, x22, [sp, #32]
   e0034:	a90363f7 	stp	x23, x24, [sp, #48]
   e0038:	531d1020 	ubfiz	w0, w1, #3, #5
   e003c:	4b010000 	sub	w0, w0, w1
   e0040:	12001c00 	and	w0, w0, #0xff
   e0044:	4a030000 	eor	w0, w0, w3
   e0048:	11000400 	add	w0, w0, #0x1
   e004c:	12001c01 	and	w1, w0, #0xff
   e0050:	38001441 	strb	w1, [x2], #1
   e0054:	eb0a005f 	cmp	x2, x10
   e0058:	54ffff01 	b.ne	e0038 <_start+0x38>  // b.any
   e005c:	d28a0a12 	mov	x18, #0x5050                	// #20560
   e0060:	aa0a03e2 	mov	x2, x10
   e0064:	8b3263f2 	add	x18, sp, x18
   e0068:	52800021 	mov	w1, #0x1                   	// #1
   e006c:	528004e3 	mov	w3, #0x27                  	// #39
   e0070:	531d1020 	ubfiz	w0, w1, #3, #5
   e0074:	4b010000 	sub	w0, w0, w1
   e0078:	12001c00 	and	w0, w0, #0xff
   e007c:	4a030000 	eor	w0, w0, w3
   e0080:	11000400 	add	w0, w0, #0x1
   e0084:	12001c01 	and	w1, w0, #0xff
   e0088:	38001441 	strb	w1, [x2], #1
   e008c:	eb12005f 	cmp	x2, x18
   e0090:	54ffff01 	b.ne	e0070 <_start+0x70>  // b.any
   e0094:	d28c0a11 	mov	x17, #0x6050                	// #24656
   e0098:	aa1203e3 	mov	x3, x18
   e009c:	910143e9 	add	x9, sp, #0x50
   e00a0:	8b3163e1 	add	x1, sp, x17
   e00a4:	52800022 	mov	w2, #0x1                   	// #1
   e00a8:	528004e4 	mov	w4, #0x27                  	// #39
   e00ac:	d503201f 	nop
   e00b0:	531d1040 	ubfiz	w0, w2, #3, #5
   e00b4:	4b020000 	sub	w0, w0, w2
   e00b8:	12001c00 	and	w0, w0, #0xff
   e00bc:	4a040000 	eor	w0, w0, w4
   e00c0:	11000400 	add	w0, w0, #0x1
   e00c4:	12001c02 	and	w2, w0, #0xff
   e00c8:	38001462 	strb	w2, [x3], #1
   e00cc:	eb01007f 	cmp	x3, x1
   e00d0:	54ffff01 	b.ne	e00b0 <_start+0xb0>  // b.any
   e00d4:	d2820a10 	mov	x16, #0x1050                	// #4176
   e00d8:	91200123 	add	x3, x9, #0x800
   e00dc:	8b3063ed 	add	x13, sp, x16
   e00e0:	52800022 	mov	w2, #0x1                   	// #1
   e00e4:	528004e4 	mov	w4, #0x27                  	// #39
   e00e8:	531d1040 	ubfiz	w0, w2, #3, #5
   e00ec:	4b020000 	sub	w0, w0, w2
   e00f0:	12001c00 	and	w0, w0, #0xff
   e00f4:	4a040000 	eor	w0, w0, w4
   e00f8:	11000400 	add	w0, w0, #0x1
   e00fc:	12001c02 	and	w2, w0, #0xff
   e0100:	38001462 	strb	w2, [x3], #1
   e0104:	eb0d007f 	cmp	x3, x13
   e0108:	54ffff01 	b.ne	e00e8 <_start+0xe8>  // b.any
   e010c:	d2830a0f 	mov	x15, #0x1850                	// #6224
   e0110:	aa0d03e2 	mov	x2, x13
   e0114:	8b2f63e5 	add	x5, sp, x15
   e0118:	52800023 	mov	w3, #0x1                   	// #1
   e011c:	528004e4 	mov	w4, #0x27                  	// #39
   e0120:	531d1060 	ubfiz	w0, w3, #3, #5
   e0124:	4b030000 	sub	w0, w0, w3
   e0128:	12001c00 	and	w0, w0, #0xff
   e012c:	4a040000 	eor	w0, w0, w4
   e0130:	11000400 	add	w0, w0, #0x1
   e0134:	12001c03 	and	w3, w0, #0xff
   e0138:	38001443 	strb	w3, [x2], #1
   e013c:	eb05005f 	cmp	x2, x5
   e0140:	54ffff01 	b.ne	e0120 <_start+0x120>  // b.any
   e0144:	d2840a0e 	mov	x14, #0x2050                	// #8272
   e0148:	8b2e63eb 	add	x11, sp, x14
   e014c:	52800023 	mov	w3, #0x1                   	// #1
   e0150:	528004e4 	mov	w4, #0x27                  	// #39
   e0154:	d503201f 	nop
   e0158:	531d1060 	ubfiz	w0, w3, #3, #5
   e015c:	4b030000 	sub	w0, w0, w3
   e0160:	12001c00 	and	w0, w0, #0xff
   e0164:	4a040000 	eor	w0, w0, w4
   e0168:	11000400 	add	w0, w0, #0x1
   e016c:	12001c03 	and	w3, w0, #0xff
   e0170:	38001443 	strb	w3, [x2], #1
   e0174:	eb0b005f 	cmp	x2, x11
   e0178:	54ffff01 	b.ne	e0158 <_start+0x158>  // b.any
   e017c:	d2940a06 	mov	x6, #0xa050                	// #41040
   e0180:	8b2663e7 	add	x7, sp, x6
   e0184:	d2980a0c 	mov	x12, #0xc050                	// #49232
   e0188:	aa0703e3 	mov	x3, x7
   e018c:	8b2c63f3 	add	x19, sp, x12
   e0190:	52800022 	mov	w2, #0x1                   	// #1
   e0194:	528004e4 	mov	w4, #0x27                  	// #39
   e0198:	531d1040 	ubfiz	w0, w2, #3, #5
   e019c:	4b020000 	sub	w0, w0, w2
   e01a0:	12001c00 	and	w0, w0, #0xff
   e01a4:	4a040000 	eor	w0, w0, w4
   e01a8:	11000400 	add	w0, w0, #0x1
   e01ac:	12001c02 	and	w2, w0, #0xff
   e01b0:	38001462 	strb	w2, [x3], #1
   e01b4:	eb13007f 	cmp	x3, x19
   e01b8:	54ffff01 	b.ne	e0198 <_start+0x198>  // b.any
   e01bc:	d29c0a05 	mov	x5, #0xe050                	// #57424
   e01c0:	aa1303e2 	mov	x2, x19
   e01c4:	8b2563e5 	add	x5, sp, x5
   e01c8:	52800023 	mov	w3, #0x1                   	// #1
   e01cc:	528004e4 	mov	w4, #0x27                  	// #39
   e01d0:	531d1060 	ubfiz	w0, w3, #3, #5
   e01d4:	4b030000 	sub	w0, w0, w3
   e01d8:	12001c00 	and	w0, w0, #0xff
   e01dc:	4a040000 	eor	w0, w0, w4
   e01e0:	11000400 	add	w0, w0, #0x1
   e01e4:	12001c03 	and	w3, w0, #0xff
   e01e8:	38001443 	strb	w3, [x2], #1
   e01ec:	eb05005f 	cmp	x2, x5
   e01f0:	54ffff01 	b.ne	e01d0 <_start+0x1d0>  // b.any
   e01f4:	914043ec 	add	x12, sp, #0x10, lsl #12
   e01f8:	52800023 	mov	w3, #0x1                   	// #1
   e01fc:	9101418c 	add	x12, x12, #0x50
   e0200:	528004e4 	mov	w4, #0x27                  	// #39
   e0204:	d503201f 	nop
   e0208:	531d1060 	ubfiz	w0, w3, #3, #5
   e020c:	4b030000 	sub	w0, w0, w3
   e0210:	12001c00 	and	w0, w0, #0xff
   e0214:	4a040000 	eor	w0, w0, w4
   e0218:	11000400 	add	w0, w0, #0x1
   e021c:	12001c03 	and	w3, w0, #0xff
   e0220:	38001443 	strb	w3, [x2], #1
   e0224:	eb0c005f 	cmp	x2, x12
   e0228:	54ffff01 	b.ne	e0208 <_start+0x208>  // b.any
   e022c:	aa0b03e3 	mov	x3, x11
   e0230:	52800022 	mov	w2, #0x1                   	// #1
   e0234:	528004e4 	mov	w4, #0x27                  	// #39
   e0238:	531d1040 	ubfiz	w0, w2, #3, #5
   e023c:	4b020000 	sub	w0, w0, w2
   e0240:	12001c00 	and	w0, w0, #0xff
   e0244:	4a040000 	eor	w0, w0, w4
   e0248:	11000400 	add	w0, w0, #0x1
   e024c:	12001c02 	and	w2, w0, #0xff
   e0250:	38001462 	strb	w2, [x3], #1
   e0254:	eb08007f 	cmp	x3, x8
   e0258:	54ffff01 	b.ne	e0238 <_start+0x238>  // b.any
   e025c:	d28e0a04 	mov	x4, #0x7050                	// #28752
   e0260:	8b2463e4 	add	x4, sp, x4
   e0264:	52800022 	mov	w2, #0x1                   	// #1
   e0268:	528004e3 	mov	w3, #0x27                  	// #39
   e026c:	d503201f 	nop
   e0270:	531d1040 	ubfiz	w0, w2, #3, #5
   e0274:	4b020000 	sub	w0, w0, w2
   e0278:	12001c00 	and	w0, w0, #0xff
   e027c:	4a030000 	eor	w0, w0, w3
   e0280:	11000400 	add	w0, w0, #0x1
   e0284:	12001c02 	and	w2, w0, #0xff
   e0288:	38001422 	strb	w2, [x1], #1
   e028c:	eb04003f 	cmp	x1, x4
   e0290:	54ffff01 	b.ne	e0270 <_start+0x270>  // b.any
   e0294:	d2900a03 	mov	x3, #0x8050                	// #32848
   e0298:	52800022 	mov	w2, #0x1                   	// #1
   e029c:	8b2363e4 	add	x4, sp, x3
   e02a0:	528004e3 	mov	w3, #0x27                  	// #39
   e02a4:	d503201f 	nop
   e02a8:	531d1040 	ubfiz	w0, w2, #3, #5
   e02ac:	4b020000 	sub	w0, w0, w2
   e02b0:	12001c00 	and	w0, w0, #0xff
   e02b4:	4a030000 	eor	w0, w0, w3
   e02b8:	11000400 	add	w0, w0, #0x1
   e02bc:	12001c02 	and	w2, w0, #0xff
   e02c0:	38001422 	strb	w2, [x1], #1
   e02c4:	eb04003f 	cmp	x1, x4
   e02c8:	54ffff01 	b.ne	e02a8 <_start+0x2a8>  // b.any
   e02cc:	91404bee 	add	x14, sp, #0x12, lsl #12
   e02d0:	91404fef 	add	x15, sp, #0x13, lsl #12
   e02d4:	910141ce 	add	x14, x14, #0x50
   e02d8:	910141ef 	add	x15, x15, #0x50
   e02dc:	aa0e03e2 	mov	x2, x14
   e02e0:	52800021 	mov	w1, #0x1                   	// #1
   e02e4:	528004e3 	mov	w3, #0x27                  	// #39
   e02e8:	531d1020 	ubfiz	w0, w1, #3, #5
   e02ec:	4b010000 	sub	w0, w0, w1
   e02f0:	12001c00 	and	w0, w0, #0xff
   e02f4:	4a030000 	eor	w0, w0, w3
   e02f8:	11000400 	add	w0, w0, #0x1
   e02fc:	12001c01 	and	w1, w0, #0xff
   e0300:	38001441 	strb	w1, [x2], #1
   e0304:	eb0f005f 	cmp	x2, x15
   e0308:	54ffff01 	b.ne	e02e8 <_start+0x2e8>  // b.any
   e030c:	52850006 	mov	w6, #0x2800                	// #10240
   e0310:	aa0903e0 	mov	x0, x9
   e0314:	9400014b 	bl	e0840 <example1>
   e0318:	aa0903e0 	mov	x0, x9
   e031c:	94000149 	bl	e0840 <example1>
   e0320:	710004c6 	subs	w6, w6, #0x1
   e0324:	54ffffa1 	b.ne	e0318 <_start+0x318>  // b.any
   e0328:	d2948a02 	mov	x2, #0xa450                	// #42064
   e032c:	aa0703e1 	mov	x1, x7
   e0330:	8b2263e2 	add	x2, sp, x2
   e0334:	52800034 	mov	w20, #0x1                   	// #1
   e0338:	38401420 	ldrb	w0, [x1], #1
   e033c:	0b140694 	add	w20, w20, w20, lsl #1
   e0340:	4a140000 	eor	w0, w0, w20
   e0344:	53185c14 	lsl	w20, w0, #8
   e0348:	4a402294 	eor	w20, w20, w0, lsr #8
   e034c:	eb02003f 	cmp	x1, x2
   e0350:	54ffff41 	b.ne	e0338 <_start+0x338>  // b.any
   e0354:	52820003 	mov	w3, #0x1000                	// #4096
   e0358:	aa0903e0 	mov	x0, x9
   e035c:	94000132 	bl	e0824 <example2a.constprop.0>
   e0360:	aa0903e0 	mov	x0, x9
   e0364:	94000130 	bl	e0824 <example2a.constprop.0>
   e0368:	71000463 	subs	w3, w3, #0x1
   e036c:	54ffffa1 	b.ne	e0360 <_start+0x360>  // b.any
   e0370:	d29a0a01 	mov	x1, #0xd050                	// #53328
   e0374:	8b2163e1 	add	x1, sp, x1
   e0378:	52800035 	mov	w21, #0x1                   	// #1
   e037c:	d503201f 	nop
   e0380:	38401660 	ldrb	w0, [x19], #1
   e0384:	0b1506b5 	add	w21, w21, w21, lsl #1
   e0388:	4a150000 	eor	w0, w0, w21
   e038c:	53185c15 	lsl	w21, w0, #8
   e0390:	4a4022b5 	eor	w21, w21, w0, lsr #8
   e0394:	eb01027f 	cmp	x19, x1
   e0398:	54ffff41 	b.ne	e0380 <_start+0x380>  // b.any
   e039c:	52810004 	mov	w4, #0x800                 	// #2048
   e03a0:	aa0903e0 	mov	x0, x9
   e03a4:	94000117 	bl	e0800 <example2b.constprop.0>
   e03a8:	aa0903e0 	mov	x0, x9
   e03ac:	94000115 	bl	e0800 <example2b.constprop.0>
   e03b0:	71000484 	subs	w4, w4, #0x1
   e03b4:	54ffffa1 	b.ne	e03a8 <_start+0x3a8>  // b.any
   e03b8:	d2960a00 	mov	x0, #0xb050                	// #45136
   e03bc:	aa0703e1 	mov	x1, x7
   e03c0:	8b2063f8 	add	x24, sp, x0
   e03c4:	52800036 	mov	w22, #0x1                   	// #1
   e03c8:	38401420 	ldrb	w0, [x1], #1
   e03cc:	0b1606d6 	add	w22, w22, w22, lsl #1
   e03d0:	4a160000 	eor	w0, w0, w22
   e03d4:	53185c16 	lsl	w22, w0, #8
   e03d8:	4a4022d6 	eor	w22, w22, w0, lsr #8
   e03dc:	eb18003f 	cmp	x1, x24
   e03e0:	54ffff41 	b.ne	e03c8 <_start+0x3c8>  // b.any
   e03e4:	52810006 	mov	w6, #0x800                 	// #2048
   e03e8:	aa0903e0 	mov	x0, x9
   e03ec:	940000f5 	bl	e07c0 <example4b.constprop.0>
   e03f0:	aa0903e0 	mov	x0, x9
   e03f4:	940000f3 	bl	e07c0 <example4b.constprop.0>
   e03f8:	710004c6 	subs	w6, w6, #0x1
   e03fc:	54ffffa1 	b.ne	e03f0 <_start+0x3f0>  // b.any
   e0400:	aa0803e1 	mov	x1, x8
   e0404:	52800033 	mov	w19, #0x1                   	// #1
   e0408:	38401420 	ldrb	w0, [x1], #1
   e040c:	0b130673 	add	w19, w19, w19, lsl #1
   e0410:	4a130000 	eor	w0, w0, w19
   e0414:	53185c13 	lsl	w19, w0, #8
   e0418:	4a402273 	eor	w19, w19, w0, lsr #8
   e041c:	eb0a003f 	cmp	x1, x10
   e0420:	54ffff41 	b.ne	e0408 <_start+0x408>  // b.any
   e0424:	52810003 	mov	w3, #0x800                 	// #2048
   e0428:	aa0903e0 	mov	x0, x9
   e042c:	940000d9 	bl	e0790 <example4c.constprop.0>
   e0430:	aa0903e0 	mov	x0, x9
   e0434:	940000d7 	bl	e0790 <example4c.constprop.0>
   e0438:	71000463 	subs	w3, w3, #0x1
   e043c:	54ffffa1 	b.ne	e0430 <_start+0x430>  // b.any
   e0440:	aa0a03e1 	mov	x1, x10
   e0444:	52800037 	mov	w23, #0x1                   	// #1
   e0448:	38401420 	ldrb	w0, [x1], #1
   e044c:	0b1706f7 	add	w23, w23, w23, lsl #1
   e0450:	4a170000 	eor	w0, w0, w23
   e0454:	53185c17 	lsl	w23, w0, #8
   e0458:	4a4022f7 	eor	w23, w23, w0, lsr #8
   e045c:	eb12003f 	cmp	x1, x18
   e0460:	54ffff41 	b.ne	e0448 <_start+0x448>  // b.any
   e0464:	52820003 	mov	w3, #0x1000                	// #4096
   e0468:	aa0903e0 	mov	x0, x9
   e046c:	940000c1 	bl	e0770 <example7.constprop.0>
   e0470:	aa0903e0 	mov	x0, x9
   e0474:	940000bf 	bl	e0770 <example7.constprop.0>
   e0478:	71000463 	subs	w3, w3, #0x1
   e047c:	54ffffa1 	b.ne	e0470 <_start+0x470>  // b.any
   e0480:	52800032 	mov	w18, #0x1                   	// #1
   e0484:	d503201f 	nop
   e0488:	384014e0 	ldrb	w0, [x7], #1
   e048c:	0b120652 	add	w18, w18, w18, lsl #1
   e0490:	4a120000 	eor	w0, w0, w18
   e0494:	53185c12 	lsl	w18, w0, #8
   e0498:	4a402252 	eor	w18, w18, w0, lsr #8
   e049c:	eb1800ff 	cmp	x7, x24
   e04a0:	54ffff41 	b.ne	e0488 <_start+0x488>  // b.any
   e04a4:	52802005 	mov	w5, #0x100                 	// #256
   e04a8:	aa0903e0 	mov	x0, x9
   e04ac:	940000a1 	bl	e0730 <example8.constprop.0>
   e04b0:	aa0903e0 	mov	x0, x9
   e04b4:	9400009f 	bl	e0730 <example8.constprop.0>
   e04b8:	710004a5 	subs	w5, w5, #0x1
   e04bc:	54ffffa1 	b.ne	e04b0 <_start+0x4b0>  // b.any
   e04c0:	52800027 	mov	w7, #0x1                   	// #1
   e04c4:	d503201f 	nop
   e04c8:	384015c0 	ldrb	w0, [x14], #1
   e04cc:	0b0704e7 	add	w7, w7, w7, lsl #1
   e04d0:	4a070000 	eor	w0, w0, w7
   e04d4:	53185c07 	lsl	w7, w0, #8
   e04d8:	4a4020e7 	eor	w7, w7, w0, lsr #8
   e04dc:	eb0f01df 	cmp	x14, x15
   e04e0:	54ffff41 	b.ne	e04c8 <_start+0x4c8>  // b.any
   e04e4:	910133e1 	add	x1, sp, #0x4c
   e04e8:	52810006 	mov	w6, #0x800                 	// #2048
   e04ec:	d503201f 	nop
   e04f0:	aa0903e0 	mov	x0, x9
   e04f4:	94000197 	bl	e0b50 <example9>
   e04f8:	710004c6 	subs	w6, w6, #0x1
   e04fc:	54ffffa1 	b.ne	e04f0 <_start+0x4f0>  // b.any
   e0500:	b9404fe0 	ldr	w0, [sp, #76]
   e0504:	0b1602b5 	add	w21, w21, w22
   e0508:	0b170273 	add	w19, w19, w23
   e050c:	0b070252 	add	w18, w18, w7
   e0510:	0b00028f 	add	w15, w20, w0
   e0514:	52810007 	mov	w7, #0x800                 	// #2048
   e0518:	0b1501ef 	add	w15, w15, w21
   e051c:	aa0903e0 	mov	x0, x9
   e0520:	0b1301ef 	add	w15, w15, w19
   e0524:	0b1201ef 	add	w15, w15, w18
   e0528:	94000072 	bl	e06f0 <example10a.constprop.0>
   e052c:	d503201f 	nop
   e0530:	aa0903e0 	mov	x0, x9
   e0534:	9400006f 	bl	e06f0 <example10a.constprop.0>
   e0538:	710004e7 	subs	w7, w7, #0x1
   e053c:	54ffffa1 	b.ne	e0530 <_start+0x530>  // b.any
   e0540:	aa0803e1 	mov	x1, x8
   e0544:	52800032 	mov	w18, #0x1                   	// #1
   e0548:	38401420 	ldrb	w0, [x1], #1
   e054c:	0b120652 	add	w18, w18, w18, lsl #1
   e0550:	4a120000 	eor	w0, w0, w18
   e0554:	53185c12 	lsl	w18, w0, #8
   e0558:	4a402252 	eor	w18, w18, w0, lsr #8
   e055c:	eb0a003f 	cmp	x1, x10
   e0560:	54ffff41 	b.ne	e0548 <_start+0x548>  // b.any
   e0564:	91200121 	add	x1, x9, #0x800
   e0568:	5280002e 	mov	w14, #0x1                   	// #1
   e056c:	d503201f 	nop
   e0570:	38401420 	ldrb	w0, [x1], #1
   e0574:	0b0e05ce 	add	w14, w14, w14, lsl #1
   e0578:	4a0e0000 	eor	w0, w0, w14
   e057c:	53185c0e 	lsl	w14, w0, #8
   e0580:	4a4021ce 	eor	w14, w14, w0, lsr #8
   e0584:	eb0d003f 	cmp	x1, x13
   e0588:	54ffff41 	b.ne	e0570 <_start+0x570>  // b.any
   e058c:	52820004 	mov	w4, #0x1000                	// #4096
   e0590:	aa0903e0 	mov	x0, x9
   e0594:	9400004c 	bl	e06c4 <example10b.constprop.0>
   e0598:	aa0903e0 	mov	x0, x9
   e059c:	9400004a 	bl	e06c4 <example10b.constprop.0>
   e05a0:	71000484 	subs	w4, w4, #0x1
   e05a4:	54ffffa1 	b.ne	e0598 <_start+0x598>  // b.any
   e05a8:	5280002d 	mov	w13, #0x1                   	// #1
   e05ac:	d503201f 	nop
   e05b0:	38401500 	ldrb	w0, [x8], #1
   e05b4:	0b0d05ad 	add	w13, w13, w13, lsl #1
   e05b8:	4a0d0000 	eor	w0, w0, w13
   e05bc:	53185c0d 	lsl	w13, w0, #8
   e05c0:	4a4021ad 	eor	w13, w13, w0, lsr #8
   e05c4:	eb0a011f 	cmp	x8, x10
   e05c8:	54ffff41 	b.ne	e05b0 <_start+0x5b0>  // b.any
   e05cc:	5281000a 	mov	w10, #0x800                 	// #2048
   e05d0:	aa0903e0 	mov	x0, x9
   e05d4:	94000187 	bl	e0bf0 <example11>
   e05d8:	aa0903e0 	mov	x0, x9
   e05dc:	94000185 	bl	e0bf0 <example11>
   e05e0:	7100054a 	subs	w10, w10, #0x1
   e05e4:	54ffffa1 	b.ne	e05d8 <_start+0x5d8>  // b.any
   e05e8:	914047e1 	add	x1, sp, #0x11, lsl #12
   e05ec:	52800025 	mov	w5, #0x1                   	// #1
   e05f0:	91014021 	add	x1, x1, #0x50
   e05f4:	d503201f 	nop
   e05f8:	38401580 	ldrb	w0, [x12], #1
   e05fc:	0b0504a5 	add	w5, w5, w5, lsl #1
   e0600:	4a050000 	eor	w0, w0, w5
   e0604:	53185c05 	lsl	w5, w0, #8
   e0608:	4a4020a5 	eor	w5, w5, w0, lsr #8
   e060c:	eb01019f 	cmp	x12, x1
   e0610:	54ffff41 	b.ne	e05f8 <_start+0x5f8>  // b.any
   e0614:	52840004 	mov	w4, #0x2000                	// #8192
   e0618:	aa0b03e1 	mov	x1, x11
   e061c:	aa0903e0 	mov	x0, x9
   e0620:	94000020 	bl	e06a0 <example23.constprop.0>
   e0624:	d503201f 	nop
   e0628:	aa0b03e1 	mov	x1, x11
   e062c:	aa0903e0 	mov	x0, x9
   e0630:	9400001c 	bl	e06a0 <example23.constprop.0>
   e0634:	71000484 	subs	w4, w4, #0x1
   e0638:	54ffff81 	b.ne	e0628 <_start+0x628>  // b.any
   e063c:	91080122 	add	x2, x9, #0x200
   e0640:	52800020 	mov	w0, #0x1                   	// #1
   e0644:	d503201f 	nop
   e0648:	38401521 	ldrb	w1, [x9], #1
   e064c:	0b000400 	add	w0, w0, w0, lsl #1
   e0650:	4a000021 	eor	w1, w1, w0
   e0654:	53185c20 	lsl	w0, w1, #8
   e0658:	4a412000 	eor	w0, w0, w1, lsr #8
   e065c:	eb02013f 	cmp	x9, x2
   e0660:	54ffff41 	b.ne	e0648 <_start+0x648>  // b.any
   e0664:	0b1201c1 	add	w1, w14, w18
   e0668:	0b0501ad 	add	w13, w13, w5
   e066c:	0b0f0021 	add	w1, w1, w15
   e0670:	a9407bfd 	ldp	x29, x30, [sp]
   e0674:	0b0d0021 	add	w1, w1, w13
   e0678:	a94153f3 	ldp	x19, x20, [sp, #16]
   e067c:	0b000020 	add	w0, w1, w0
   e0680:	a9425bf5 	ldp	x21, x22, [sp, #32]
   e0684:	a94363f7 	ldp	x23, x24, [sp, #48]
   e0688:	910143ff 	add	sp, sp, #0x50
   e068c:	9140cbff 	add	sp, sp, #0x32, lsl #12
   e0690:	d65f03c0 	ret

Disassembly of section .text:

00000000000e06a0 <example23.constprop.0>:
   e06a0:	d2800002 	mov	x2, #0x0                   	// #0
   e06a4:	d503201f 	nop
   e06a8:	78627803 	ldrh	w3, [x0, x2, lsl #1]
   e06ac:	53196063 	lsl	w3, w3, #7
   e06b0:	b8227823 	str	w3, [x1, x2, lsl #2]
   e06b4:	91000442 	add	x2, x2, #0x1
   e06b8:	f104005f 	cmp	x2, #0x100
   e06bc:	54ffff61 	b.ne	e06a8 <example23.constprop.0+0x8>  // b.any
   e06c0:	d65f03c0 	ret

00000000000e06c4 <example10b.constprop.0>:
   e06c4:	91400c03 	add	x3, x0, #0x3, lsl #12
   e06c8:	91400402 	add	x2, x0, #0x1, lsl #12
   e06cc:	d2800001 	mov	x1, #0x0                   	// #0
   e06d0:	78e17840 	ldrsh	w0, [x2, x1, lsl #1]
   e06d4:	b8217860 	str	w0, [x3, x1, lsl #2]
   e06d8:	91000421 	add	x1, x1, #0x1
   e06dc:	f110003f 	cmp	x1, #0x400
   e06e0:	54ffff81 	b.ne	e06d0 <example10b.constprop.0+0xc>  // b.any
   e06e4:	d65f03c0 	ret
   e06e8:	d503201f 	nop
   e06ec:	d503201f 	nop

00000000000e06f0 <example10a.constprop.0>:
   e06f0:	91400c02 	add	x2, x0, #0x3, lsl #12
   e06f4:	91200001 	add	x1, x0, #0x800
   e06f8:	91400406 	add	x6, x0, #0x1, lsl #12
   e06fc:	d503201f 	nop
   e0700:	b9500043 	ldr	w3, [x2, #4096]
   e0704:	b9600045 	ldr	w5, [x2, #8192]
   e0708:	79500020 	ldrh	w0, [x1, #2048]
   e070c:	79600024 	ldrh	w4, [x1, #4096]
   e0710:	0b050063 	add	w3, w3, w5
   e0714:	b8004443 	str	w3, [x2], #4
   e0718:	0b040000 	add	w0, w0, w4
   e071c:	78002420 	strh	w0, [x1], #2
   e0720:	eb0100df 	cmp	x6, x1
   e0724:	54fffee1 	b.ne	e0700 <example10a.constprop.0+0x10>  // b.any
   e0728:	d65f03c0 	ret
   e072c:	d503201f 	nop

00000000000e0730 <example8.constprop.0>:
   e0730:	91404803 	add	x3, x0, #0x12, lsl #12
   e0734:	91404c01 	add	x1, x0, #0x13, lsl #12
   e0738:	9140cc04 	add	x4, x0, #0x33, lsl #12
   e073c:	b21d03e2 	mov	x2, #0x800000008           	// #34359738376
   e0740:	aa0303e0 	mov	x0, x3
   e0744:	d503201f 	nop
   e0748:	f8008402 	str	x2, [x0], #8
   e074c:	eb01001f 	cmp	x0, x1
   e0750:	54ffffc1 	b.ne	e0748 <example8.constprop.0+0x18>  // b.any
   e0754:	91400401 	add	x1, x0, #0x1, lsl #12
   e0758:	91400463 	add	x3, x3, #0x1, lsl #12
   e075c:	eb04003f 	cmp	x1, x4
   e0760:	54ffff01 	b.ne	e0740 <example8.constprop.0+0x10>  // b.any
   e0764:	d65f03c0 	ret
   e0768:	d503201f 	nop
   e076c:	d503201f 	nop

00000000000e0770 <example7.constprop.0>:
   e0770:	91402801 	add	x1, x0, #0xa, lsl #12
   e0774:	91402c02 	add	x2, x0, #0xb, lsl #12
   e0778:	f9500820 	ldr	x0, [x1, #8208]
   e077c:	f8008420 	str	x0, [x1], #8
   e0780:	eb01005f 	cmp	x2, x1
   e0784:	54ffffa1 	b.ne	e0778 <example7.constprop.0+0x8>  // b.any
   e0788:	d65f03c0 	ret
   e078c:	d503201f 	nop

00000000000e0790 <example4c.constprop.0>:
   e0790:	91402801 	add	x1, x0, #0xa, lsl #12
   e0794:	91402c02 	add	x2, x0, #0xb, lsl #12
   e0798:	b9400020 	ldr	w0, [x1]
   e079c:	91001021 	add	x1, x1, #0x4
   e07a0:	7100101f 	cmp	w0, #0x4
   e07a4:	1a9fd7e0 	cset	w0, gt
   e07a8:	531e7400 	lsl	w0, w0, #2
   e07ac:	b91ffc20 	str	w0, [x1, #8188]
   e07b0:	eb01005f 	cmp	x2, x1
   e07b4:	54ffff21 	b.ne	e0798 <example4c.constprop.0+0x8>  // b.any
   e07b8:	d65f03c0 	ret
   e07bc:	d503201f 	nop

00000000000e07c0 <example4b.constprop.0>:
   e07c0:	d2980082 	mov	x2, #0xc004                	// #49156
   e07c4:	d29c0183 	mov	x3, #0xe00c                	// #57356
   e07c8:	91402805 	add	x5, x0, #0xa, lsl #12
   e07cc:	8b020004 	add	x4, x0, x2
   e07d0:	8b030003 	add	x3, x0, x3
   e07d4:	d2800001 	mov	x1, #0x0                   	// #0
   e07d8:	b8616880 	ldr	w0, [x4, x1]
   e07dc:	b8616862 	ldr	w2, [x3, x1]
   e07e0:	0b020000 	add	w0, w0, w2
   e07e4:	b82168a0 	str	w0, [x5, x1]
   e07e8:	91001021 	add	x1, x1, #0x4
   e07ec:	f13f603f 	cmp	x1, #0xfd8
   e07f0:	54ffff41 	b.ne	e07d8 <example4b.constprop.0+0x18>  // b.any
   e07f4:	d65f03c0 	ret
   e07f8:	d503201f 	nop
   e07fc:	d503201f 	nop

00000000000e0800 <example2b.constprop.0>:
   e0800:	91402801 	add	x1, x0, #0xa, lsl #12
   e0804:	91402c02 	add	x2, x0, #0xb, lsl #12
   e0808:	f9500023 	ldr	x3, [x1, #8192]
   e080c:	f9600020 	ldr	x0, [x1, #16384]
   e0810:	8a030000 	and	x0, x0, x3
   e0814:	f8008420 	str	x0, [x1], #8
   e0818:	eb01005f 	cmp	x2, x1
   e081c:	54ffff61 	b.ne	e0808 <example2b.constprop.0+0x8>  // b.any
   e0820:	d65f03c0 	ret

00000000000e0824 <example2a.constprop.0>:
   e0824:	91403001 	add	x1, x0, #0xc, lsl #12
   e0828:	91403400 	add	x0, x0, #0xd, lsl #12
   e082c:	b21f03e2 	mov	x2, #0x200000002           	// #8589934594
   e0830:	f8008422 	str	x2, [x1], #8
   e0834:	eb00003f 	cmp	x1, x0
   e0838:	54ffffc1 	b.ne	e0830 <example2a.constprop.0+0xc>  // b.any
   e083c:	d65f03c0 	ret

00000000000e0840 <example1>:
   e0840:	91402805 	add	x5, x0, #0xa, lsl #12
   e0844:	91403004 	add	x4, x0, #0xc, lsl #12
   e0848:	91403803 	add	x3, x0, #0xe, lsl #12
   e084c:	d2800001 	mov	x1, #0x0                   	// #0
   e0850:	b8616880 	ldr	w0, [x4, x1]
   e0854:	b8616862 	ldr	w2, [x3, x1]
   e0858:	0b020000 	add	w0, w0, w2
   e085c:	b82168a0 	str	w0, [x5, x1]
   e0860:	91001021 	add	x1, x1, #0x4
   e0864:	f110003f 	cmp	x1, #0x400
   e0868:	54ffff41 	b.ne	e0850 <example1+0x10>  // b.any
   e086c:	d65f03c0 	ret

00000000000e0870 <example2a>:
   e0870:	2a0103e5 	mov	w5, w1
   e0874:	7100003f 	cmp	w1, #0x0
   e0878:	5400024d 	b.le	e08c0 <example2a+0x50>
   e087c:	7100043f 	cmp	w1, #0x1
   e0880:	54000220 	b.eq	e08c4 <example2a+0x54>  // b.none
   e0884:	d2800001 	mov	x1, #0x0                   	// #0
   e0888:	53017ca4 	lsr	w4, w5, #1
   e088c:	b3407c41 	bfxil	x1, x2, #0, #32
   e0890:	91403003 	add	x3, x0, #0xc, lsl #12
   e0894:	8b244c64 	add	x4, x3, w4, uxtw #3
   e0898:	b3607c41 	bfi	x1, x2, #32, #32
   e089c:	d503201f 	nop
   e08a0:	f8008461 	str	x1, [x3], #8
   e08a4:	eb04007f 	cmp	x3, x4
   e08a8:	54ffffc1 	b.ne	e08a0 <example2a+0x30>  // b.any
   e08ac:	121f78a1 	and	w1, w5, #0xfffffffe
   e08b0:	36000085 	tbz	w5, #0, e08c0 <example2a+0x50>
   e08b4:	93407c21 	sxtw	x1, w1
   e08b8:	91400c21 	add	x1, x1, #0x3, lsl #12
   e08bc:	b8217802 	str	w2, [x0, x1, lsl #2]
   e08c0:	d65f03c0 	ret
   e08c4:	52800001 	mov	w1, #0x0                   	// #0
   e08c8:	17fffffb 	b	e08b4 <example2a+0x44>
   e08cc:	d503201f 	nop

00000000000e08d0 <example2b>:
   e08d0:	aa0003e5 	mov	x5, x0
   e08d4:	340002c1 	cbz	w1, e092c <example2b+0x5c>
   e08d8:	7100043f 	cmp	w1, #0x1
   e08dc:	540002a0 	b.eq	e0930 <example2b+0x60>  // b.none
   e08e0:	53017c20 	lsr	w0, w1, #1
   e08e4:	914028a2 	add	x2, x5, #0xa, lsl #12
   e08e8:	8b204c40 	add	x0, x2, w0, uxtw #3
   e08ec:	d503201f 	nop
   e08f0:	f9500043 	ldr	x3, [x2, #8192]
   e08f4:	f9600044 	ldr	x4, [x2, #16384]
   e08f8:	8a040063 	and	x3, x3, x4
   e08fc:	f8008443 	str	x3, [x2], #8
   e0900:	eb02001f 	cmp	x0, x2
   e0904:	54ffff61 	b.ne	e08f0 <example2b+0x20>  // b.any
   e0908:	121f7820 	and	w0, w1, #0xfffffffe
   e090c:	36000101 	tbz	w1, #0, e092c <example2b+0x5c>
   e0910:	8b20c8a0 	add	x0, x5, w0, sxtw #2
   e0914:	91403001 	add	x1, x0, #0xc, lsl #12
   e0918:	91402000 	add	x0, x0, #0x8, lsl #12
   e091c:	b9400022 	ldr	w2, [x1]
   e0920:	b9600021 	ldr	w1, [x1, #8192]
   e0924:	0a020021 	and	w1, w1, w2
   e0928:	b9200001 	str	w1, [x0, #8192]
   e092c:	d65f03c0 	ret
   e0930:	52800000 	mov	w0, #0x0                   	// #0
   e0934:	17fffff7 	b	e0910 <example2b+0x40>
   e0938:	d503201f 	nop
   e093c:	d503201f 	nop

00000000000e0940 <example3>:
   e0940:	34000241 	cbz	w1, e0988 <example3+0x48>
   e0944:	7100043f 	cmp	w1, #0x1
   e0948:	540001c0 	b.eq	e0980 <example3+0x40>  // b.none
   e094c:	53017c25 	lsr	w5, w1, #1
   e0950:	d2800000 	mov	x0, #0x0                   	// #0
   e0954:	d37df0a5 	lsl	x5, x5, #3
   e0958:	f8606864 	ldr	x4, [x3, x0]
   e095c:	f8206844 	str	x4, [x2, x0]
   e0960:	91002000 	add	x0, x0, #0x8
   e0964:	eb0000bf 	cmp	x5, x0
   e0968:	54ffff81 	b.ne	e0958 <example3+0x18>  // b.any
   e096c:	121f7820 	and	w0, w1, #0xfffffffe
   e0970:	360000c1 	tbz	w1, #0, e0988 <example3+0x48>
   e0974:	d37ef400 	lsl	x0, x0, #2
   e0978:	8b000042 	add	x2, x2, x0
   e097c:	8b000063 	add	x3, x3, x0
   e0980:	b9400060 	ldr	w0, [x3]
   e0984:	b9000040 	str	w0, [x2]
   e0988:	d65f03c0 	ret
   e098c:	d503201f 	nop

00000000000e0990 <example4a>:
   e0990:	34000141 	cbz	w1, e09b8 <example4a+0x28>
   e0994:	d37e7c24 	ubfiz	x4, x1, #2, #32
   e0998:	d2800000 	mov	x0, #0x0                   	// #0
   e099c:	d503201f 	nop
   e09a0:	b8606861 	ldr	w1, [x3, x0]
   e09a4:	11001421 	add	w1, w1, #0x5
   e09a8:	b8206841 	str	w1, [x2, x0]
   e09ac:	91001000 	add	x0, x0, #0x4
   e09b0:	eb04001f 	cmp	x0, x4
   e09b4:	54ffff61 	b.ne	e09a0 <example4a+0x10>  // b.any
   e09b8:	d65f03c0 	ret
   e09bc:	d503201f 	nop

00000000000e09c0 <example4b>:
   e09c0:	7100003f 	cmp	w1, #0x0
   e09c4:	5400020d 	b.le	e0a04 <example4b+0x44>
   e09c8:	937e7c24 	sbfiz	x4, x1, #2, #32
   e09cc:	91402806 	add	x6, x0, #0xa, lsl #12
   e09d0:	d2980081 	mov	x1, #0xc004                	// #49156
   e09d4:	d29c0182 	mov	x2, #0xe00c                	// #57356
   e09d8:	8b010005 	add	x5, x0, x1
   e09dc:	8b020003 	add	x3, x0, x2
   e09e0:	d2800000 	mov	x0, #0x0                   	// #0
   e09e4:	d503201f 	nop
   e09e8:	b86068a1 	ldr	w1, [x5, x0]
   e09ec:	b8606862 	ldr	w2, [x3, x0]
   e09f0:	0b020021 	add	w1, w1, w2
   e09f4:	b82068c1 	str	w1, [x6, x0]
   e09f8:	91001000 	add	x0, x0, #0x4
   e09fc:	eb00009f 	cmp	x4, x0
   e0a00:	54ffff41 	b.ne	e09e8 <example4b+0x28>  // b.any
   e0a04:	d65f03c0 	ret
   e0a08:	d503201f 	nop
   e0a0c:	d503201f 	nop

00000000000e0a10 <example4c>:
   e0a10:	7100003f 	cmp	w1, #0x0
   e0a14:	5400016d 	b.le	e0a40 <example4c+0x30>
   e0a18:	91402800 	add	x0, x0, #0xa, lsl #12
   e0a1c:	8b21c802 	add	x2, x0, w1, sxtw #2
   e0a20:	b9400001 	ldr	w1, [x0]
   e0a24:	91001000 	add	x0, x0, #0x4
   e0a28:	7100103f 	cmp	w1, #0x4
   e0a2c:	1a9fd7e1 	cset	w1, gt
   e0a30:	531e7421 	lsl	w1, w1, #2
   e0a34:	b91ffc01 	str	w1, [x0, #8188]
   e0a38:	eb00005f 	cmp	x2, x0
   e0a3c:	54ffff21 	b.ne	e0a20 <example4c+0x10>  // b.any
   e0a40:	d65f03c0 	ret

00000000000e0a44 <example5>:
   e0a44:	2a0103e4 	mov	w4, w1
   e0a48:	7100003f 	cmp	w1, #0x0
   e0a4c:	5400024d 	b.le	e0a94 <example5+0x50>
   e0a50:	7100043f 	cmp	w1, #0x1
   e0a54:	54000220 	b.eq	e0a98 <example5+0x54>  // b.none
   e0a58:	53017c23 	lsr	w3, w1, #1
   e0a5c:	91402402 	add	x2, x0, #0x9, lsl #12
   e0a60:	d28000a1 	mov	x1, #0x5                   	// #5
   e0a64:	8b234c43 	add	x3, x2, w3, uxtw #3
   e0a68:	f2c000a1 	movk	x1, #0x5, lsl #32
   e0a6c:	d503201f 	nop
   e0a70:	f8008441 	str	x1, [x2], #8
   e0a74:	eb03005f 	cmp	x2, x3
   e0a78:	54ffffc1 	b.ne	e0a70 <example5+0x2c>  // b.any
   e0a7c:	121f7881 	and	w1, w4, #0xfffffffe
   e0a80:	360000a4 	tbz	w4, #0, e0a94 <example5+0x50>
   e0a84:	d2848003 	mov	x3, #0x2400                	// #9216
   e0a88:	528000a2 	mov	w2, #0x5                   	// #5
   e0a8c:	8b21c061 	add	x1, x3, w1, sxtw
   e0a90:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0a94:	d65f03c0 	ret
   e0a98:	52800001 	mov	w1, #0x0                   	// #0
   e0a9c:	17fffffa 	b	e0a84 <example5+0x40>

00000000000e0aa0 <example7>:
   e0aa0:	93407c22 	sxtw	x2, w1
   e0aa4:	91400c43 	add	x3, x2, #0x3, lsl #12
   e0aa8:	d37ef463 	lsl	x3, x3, #2
   e0aac:	8b030001 	add	x1, x0, x3
   e0ab0:	f240083f 	tst	x1, #0x7
   e0ab4:	54000121 	b.ne	e0ad8 <example7+0x38>  // b.any
   e0ab8:	91402803 	add	x3, x0, #0xa, lsl #12
   e0abc:	d2800000 	mov	x0, #0x0                   	// #0
   e0ac0:	f8606822 	ldr	x2, [x1, x0]
   e0ac4:	f8206862 	str	x2, [x3, x0]
   e0ac8:	91002000 	add	x0, x0, #0x8
   e0acc:	f140041f 	cmp	x0, #0x1, lsl #12
   e0ad0:	54ffff81 	b.ne	e0ac0 <example7+0x20>  // b.any
   e0ad4:	d65f03c0 	ret
   e0ad8:	8b030000 	add	x0, x0, x3
   e0adc:	cb020be3 	neg	x3, x2, lsl #2
   e0ae0:	d1400863 	sub	x3, x3, #0x2, lsl #12
   e0ae4:	91400402 	add	x2, x0, #0x1, lsl #12
   e0ae8:	aa0103e0 	mov	x0, x1
   e0aec:	d503201f 	nop
   e0af0:	b9400001 	ldr	w1, [x0]
   e0af4:	b8236801 	str	w1, [x0, x3]
   e0af8:	91001000 	add	x0, x0, #0x4
   e0afc:	eb02001f 	cmp	x0, x2
   e0b00:	54ffff81 	b.ne	e0af0 <example7+0x50>  // b.any
   e0b04:	d65f03c0 	ret
   e0b08:	d503201f 	nop
   e0b0c:	d503201f 	nop

00000000000e0b10 <example8>:
   e0b10:	2a0103e6 	mov	w6, w1
   e0b14:	91404804 	add	x4, x0, #0x12, lsl #12
   e0b18:	91404c02 	add	x2, x0, #0x13, lsl #12
   e0b1c:	9140cc05 	add	x5, x0, #0x33, lsl #12
   e0b20:	d2800001 	mov	x1, #0x0                   	// #0
   e0b24:	aa0403e0 	mov	x0, x4
   e0b28:	b3407cc1 	bfxil	x1, x6, #0, #32
   e0b2c:	b3607cc1 	bfi	x1, x6, #32, #32
   e0b30:	f8008401 	str	x1, [x0], #8
   e0b34:	eb02001f 	cmp	x0, x2
   e0b38:	54ffffc1 	b.ne	e0b30 <example8+0x20>  // b.any
   e0b3c:	91400402 	add	x2, x0, #0x1, lsl #12
   e0b40:	91400484 	add	x4, x4, #0x1, lsl #12
   e0b44:	eb05005f 	cmp	x2, x5
   e0b48:	54fffec1 	b.ne	e0b20 <example8+0x10>  // b.any
   e0b4c:	d65f03c0 	ret

00000000000e0b50 <example9>:
   e0b50:	91401802 	add	x2, x0, #0x6, lsl #12
   e0b54:	91401c05 	add	x5, x0, #0x7, lsl #12
   e0b58:	52800003 	mov	w3, #0x0                   	// #0
   e0b5c:	d503201f 	nop
   e0b60:	b9400040 	ldr	w0, [x2]
   e0b64:	91001042 	add	x2, x2, #0x4
   e0b68:	b94ffc44 	ldr	w4, [x2, #4092]
   e0b6c:	4b040000 	sub	w0, w0, w4
   e0b70:	0b000063 	add	w3, w3, w0
   e0b74:	eb0200bf 	cmp	x5, x2
   e0b78:	54ffff41 	b.ne	e0b60 <example9+0x10>  // b.any
   e0b7c:	b9000023 	str	w3, [x1]
   e0b80:	d65f03c0 	ret

00000000000e0b84 <example10a>:
   e0b84:	91400c02 	add	x2, x0, #0x3, lsl #12
   e0b88:	91200001 	add	x1, x0, #0x800
   e0b8c:	91400406 	add	x6, x0, #0x1, lsl #12
   e0b90:	b9500043 	ldr	w3, [x2, #4096]
   e0b94:	b9600045 	ldr	w5, [x2, #8192]
   e0b98:	79500020 	ldrh	w0, [x1, #2048]
   e0b9c:	79600024 	ldrh	w4, [x1, #4096]
   e0ba0:	0b050063 	add	w3, w3, w5
   e0ba4:	b8004443 	str	w3, [x2], #4
   e0ba8:	0b040000 	add	w0, w0, w4
   e0bac:	78002420 	strh	w0, [x1], #2
   e0bb0:	eb0100df 	cmp	x6, x1
   e0bb4:	54fffee1 	b.ne	e0b90 <example10a+0xc>  // b.any
   e0bb8:	d65f03c0 	ret
   e0bbc:	d503201f 	nop

00000000000e0bc0 <example10b>:
   e0bc0:	91400c03 	add	x3, x0, #0x3, lsl #12
   e0bc4:	91400402 	add	x2, x0, #0x1, lsl #12
   e0bc8:	d2800001 	mov	x1, #0x0                   	// #0
   e0bcc:	d503201f 	nop
   e0bd0:	78e17840 	ldrsh	w0, [x2, x1, lsl #1]
   e0bd4:	b8217860 	str	w0, [x3, x1, lsl #2]
   e0bd8:	91000421 	add	x1, x1, #0x1
   e0bdc:	f110003f 	cmp	x1, #0x400
   e0be0:	54ffff81 	b.ne	e0bd0 <example10b+0x10>  // b.any
   e0be4:	d65f03c0 	ret
   e0be8:	d503201f 	nop
   e0bec:	d503201f 	nop

00000000000e0bf0 <example11>:
   e0bf0:	91403001 	add	x1, x0, #0xc, lsl #12
   e0bf4:	91402808 	add	x8, x0, #0xa, lsl #12
   e0bf8:	91404007 	add	x7, x0, #0x10, lsl #12
   e0bfc:	d2800002 	mov	x2, #0x0                   	// #0
   e0c00:	29401025 	ldp	w5, w4, [x1]
   e0c04:	91002021 	add	x1, x1, #0x8
   e0c08:	b95ffc20 	ldr	w0, [x1, #8188]
   e0c0c:	b95ff823 	ldr	w3, [x1, #8184]
   e0c10:	1b007c86 	mul	w6, w4, w0
   e0c14:	1b037c84 	mul	w4, w4, w3
   e0c18:	1b0398a3 	msub	w3, w5, w3, w6
   e0c1c:	1b051000 	madd	w0, w0, w5, w4
   e0c20:	b8227903 	str	w3, [x8, x2, lsl #2]
   e0c24:	b82278e0 	str	w0, [x7, x2, lsl #2]
   e0c28:	91000442 	add	x2, x2, #0x1
   e0c2c:	f108005f 	cmp	x2, #0x200
   e0c30:	54fffe81 	b.ne	e0c00 <example11+0x10>  // b.any
   e0c34:	d65f03c0 	ret
   e0c38:	d503201f 	nop
   e0c3c:	d503201f 	nop

00000000000e0c40 <example12>:
   e0c40:	b0000001 	adrp	x1, e1000 <memset+0x100>
   e0c44:	91402803 	add	x3, x0, #0xa, lsl #12
   e0c48:	91402c09 	add	x9, x0, #0xb, lsl #12
   e0c4c:	d2c00022 	mov	x2, #0x100000000           	// #4294967296
   e0c50:	f9408421 	ldr	x1, [x1, #264]
   e0c54:	d503201f 	nop
   e0c58:	11001048 	add	w8, w2, #0x4
   e0c5c:	11001027 	add	w7, w1, #0x4
   e0c60:	9360fc46 	asr	x6, x2, #32
   e0c64:	9360fc25 	asr	x5, x1, #32
   e0c68:	d2800004 	mov	x4, #0x0                   	// #0
   e0c6c:	d2800000 	mov	x0, #0x0                   	// #0
   e0c70:	b3407d04 	bfxil	x4, x8, #0, #32
   e0c74:	110010c6 	add	w6, w6, #0x4
   e0c78:	b3407ce0 	bfxil	x0, x7, #0, #32
   e0c7c:	110010a5 	add	w5, w5, #0x4
   e0c80:	a9000462 	stp	x2, x1, [x3]
   e0c84:	b3607cc4 	bfi	x4, x6, #32, #32
   e0c88:	b3607ca0 	bfi	x0, x5, #32, #32
   e0c8c:	91004063 	add	x3, x3, #0x10
   e0c90:	aa0403e2 	mov	x2, x4
   e0c94:	aa0003e1 	mov	x1, x0
   e0c98:	eb09007f 	cmp	x3, x9
   e0c9c:	54fffde1 	b.ne	e0c58 <example12+0x18>  // b.any
   e0ca0:	d65f03c0 	ret

00000000000e0ca4 <example13>:
   e0ca4:	aa0103e9 	mov	x9, x1
   e0ca8:	aa0203e8 	mov	x8, x2
   e0cac:	aa0303e7 	mov	x7, x3
   e0cb0:	d2800006 	mov	x6, #0x0                   	// #0
   e0cb4:	d503201f 	nop
   e0cb8:	f8667925 	ldr	x5, [x9, x6, lsl #3]
   e0cbc:	d2800000 	mov	x0, #0x0                   	// #0
   e0cc0:	f8667904 	ldr	x4, [x8, x6, lsl #3]
   e0cc4:	52800002 	mov	w2, #0x0                   	// #0
   e0cc8:	b86068a1 	ldr	w1, [x5, x0]
   e0ccc:	b8606883 	ldr	w3, [x4, x0]
   e0cd0:	91008000 	add	x0, x0, #0x20
   e0cd4:	4b030021 	sub	w1, w1, w3
   e0cd8:	0b010042 	add	w2, w2, w1
   e0cdc:	f140041f 	cmp	x0, #0x1, lsl #12
   e0ce0:	54ffff41 	b.ne	e0cc8 <example13+0x24>  // b.any
   e0ce4:	b82678e2 	str	w2, [x7, x6, lsl #2]
   e0ce8:	910004c6 	add	x6, x6, #0x1
   e0cec:	f10080df 	cmp	x6, #0x20
   e0cf0:	54fffe41 	b.ne	e0cb8 <example13+0x14>  // b.any
   e0cf4:	d65f03c0 	ret
   e0cf8:	d503201f 	nop
   e0cfc:	d503201f 	nop

00000000000e0d00 <example14>:
   e0d00:	aa0103e5 	mov	x5, x1
   e0d04:	aa0203e6 	mov	x6, x2
   e0d08:	aa0303e8 	mov	x8, x3
   e0d0c:	d2800007 	mov	x7, #0x0                   	// #0
   e0d10:	d2800001 	mov	x1, #0x0                   	// #0
   e0d14:	52800002 	mov	w2, #0x0                   	// #0
   e0d18:	d2800000 	mov	x0, #0x0                   	// #0
   e0d1c:	d503201f 	nop
   e0d20:	f86068a4 	ldr	x4, [x5, x0]
   e0d24:	f86068c3 	ldr	x3, [x6, x0]
   e0d28:	91002000 	add	x0, x0, #0x8
   e0d2c:	b8616884 	ldr	w4, [x4, x1]
   e0d30:	b8616863 	ldr	w3, [x3, x1]
   e0d34:	1b030882 	madd	w2, w4, w3, w2
   e0d38:	f140081f 	cmp	x0, #0x2, lsl #12
   e0d3c:	54ffff21 	b.ne	e0d20 <example14+0x20>  // b.any
   e0d40:	91001021 	add	x1, x1, #0x4
   e0d44:	f102003f 	cmp	x1, #0x80
   e0d48:	54fffe81 	b.ne	e0d18 <example14+0x18>  // b.any
   e0d4c:	b8277902 	str	w2, [x8, x7, lsl #2]
   e0d50:	910004e7 	add	x7, x7, #0x1
   e0d54:	910020a5 	add	x5, x5, #0x8
   e0d58:	f10010ff 	cmp	x7, #0x4
   e0d5c:	54fffda1 	b.ne	e0d10 <example14+0x10>  // b.any
   e0d60:	d65f03c0 	ret

00000000000e0d64 <example23>:
   e0d64:	d2800000 	mov	x0, #0x0                   	// #0
   e0d68:	78607823 	ldrh	w3, [x1, x0, lsl #1]
   e0d6c:	53196063 	lsl	w3, w3, #7
   e0d70:	b8207843 	str	w3, [x2, x0, lsl #2]
   e0d74:	91000400 	add	x0, x0, #0x1
   e0d78:	f104001f 	cmp	x0, #0x100
   e0d7c:	54ffff61 	b.ne	e0d68 <example23+0x4>  // b.any
   e0d80:	d65f03c0 	ret

00000000000e0d84 <init_memory>:
   e0d84:	eb01001f 	cmp	x0, x1
   e0d88:	540001a0 	b.eq	e0dbc <init_memory+0x38>  // b.none
   e0d8c:	52800023 	mov	w3, #0x1                   	// #1
   e0d90:	528004e4 	mov	w4, #0x27                  	// #39
   e0d94:	d503201f 	nop
   e0d98:	531d1062 	ubfiz	w2, w3, #3, #5
   e0d9c:	4b030042 	sub	w2, w2, w3
   e0da0:	12001c42 	and	w2, w2, #0xff
   e0da4:	4a040042 	eor	w2, w2, w4
   e0da8:	11000442 	add	w2, w2, #0x1
   e0dac:	12001c43 	and	w3, w2, #0xff
   e0db0:	38001403 	strb	w3, [x0], #1
   e0db4:	eb00003f 	cmp	x1, x0
   e0db8:	54ffff01 	b.ne	e0d98 <init_memory+0x14>  // b.any
   e0dbc:	d65f03c0 	ret

00000000000e0dc0 <digest_memory>:
   e0dc0:	aa0003e3 	mov	x3, x0
   e0dc4:	52800020 	mov	w0, #0x1                   	// #1
   e0dc8:	eb01007f 	cmp	x3, x1
   e0dcc:	54000100 	b.eq	e0dec <digest_memory+0x2c>  // b.none
   e0dd0:	38401462 	ldrb	w2, [x3], #1
   e0dd4:	0b000400 	add	w0, w0, w0, lsl #1
   e0dd8:	4a000042 	eor	w2, w2, w0
   e0ddc:	53185c40 	lsl	w0, w2, #8
   e0de0:	4a422000 	eor	w0, w0, w2, lsr #8
   e0de4:	eb03003f 	cmp	x1, x3
   e0de8:	54ffff41 	b.ne	e0dd0 <digest_memory+0x10>  // b.any
   e0dec:	d65f03c0 	ret

00000000000e0df0 <memcpy>:
   e0df0:	b4000222 	cbz	x2, e0e34 <memcpy+0x44>
   e0df4:	d1000443 	sub	x3, x2, #0x1
   e0df8:	f1001c7f 	cmp	x3, #0x7
   e0dfc:	54000729 	b.ls	e0ee0 <memcpy+0xf0>  // b.plast
   e0e00:	aa010005 	orr	x5, x0, x1
   e0e04:	91000424 	add	x4, x1, #0x1
   e0e08:	cb040004 	sub	x4, x0, x4
   e0e0c:	d2800003 	mov	x3, #0x0                   	// #0
   e0e10:	f24008bf 	tst	x5, #0x7
   e0e14:	fa460880 	ccmp	x4, #0x6, #0x0, eq	// eq = none
   e0e18:	54000108 	b.hi	e0e38 <memcpy+0x48>  // b.pmore
   e0e1c:	d503201f 	nop
   e0e20:	38636824 	ldrb	w4, [x1, x3]
   e0e24:	38236804 	strb	w4, [x0, x3]
   e0e28:	91000463 	add	x3, x3, #0x1
   e0e2c:	eb03005f 	cmp	x2, x3
   e0e30:	54ffff81 	b.ne	e0e20 <memcpy+0x30>  // b.any
   e0e34:	d65f03c0 	ret
   e0e38:	927df044 	and	x4, x2, #0xfffffffffffffff8
   e0e3c:	d503201f 	nop
   e0e40:	f8636825 	ldr	x5, [x1, x3]
   e0e44:	f8236805 	str	x5, [x0, x3]
   e0e48:	91002063 	add	x3, x3, #0x8
   e0e4c:	eb03009f 	cmp	x4, x3
   e0e50:	54ffff81 	b.ne	e0e40 <memcpy+0x50>  // b.any
   e0e54:	eb04005f 	cmp	x2, x4
   e0e58:	54fffee0 	b.eq	e0e34 <memcpy+0x44>  // b.none
   e0e5c:	38646825 	ldrb	w5, [x1, x4]
   e0e60:	91000483 	add	x3, x4, #0x1
   e0e64:	38246805 	strb	w5, [x0, x4]
   e0e68:	eb03005f 	cmp	x2, x3
   e0e6c:	54fffe40 	b.eq	e0e34 <memcpy+0x44>  // b.none
   e0e70:	38636826 	ldrb	w6, [x1, x3]
   e0e74:	91000885 	add	x5, x4, #0x2
   e0e78:	38236806 	strb	w6, [x0, x3]
   e0e7c:	eb05005f 	cmp	x2, x5
   e0e80:	54fffda0 	b.eq	e0e34 <memcpy+0x44>  // b.none
   e0e84:	38656826 	ldrb	w6, [x1, x5]
   e0e88:	91000c83 	add	x3, x4, #0x3
   e0e8c:	38256806 	strb	w6, [x0, x5]
   e0e90:	eb03005f 	cmp	x2, x3
   e0e94:	54fffd00 	b.eq	e0e34 <memcpy+0x44>  // b.none
   e0e98:	38636826 	ldrb	w6, [x1, x3]
   e0e9c:	91001085 	add	x5, x4, #0x4
   e0ea0:	38236806 	strb	w6, [x0, x3]
   e0ea4:	eb05005f 	cmp	x2, x5
   e0ea8:	54fffc60 	b.eq	e0e34 <memcpy+0x44>  // b.none
   e0eac:	38656826 	ldrb	w6, [x1, x5]
   e0eb0:	91001483 	add	x3, x4, #0x5
   e0eb4:	38256806 	strb	w6, [x0, x5]
   e0eb8:	eb03005f 	cmp	x2, x3
   e0ebc:	54fffbc0 	b.eq	e0e34 <memcpy+0x44>  // b.none
   e0ec0:	38636825 	ldrb	w5, [x1, x3]
   e0ec4:	91001884 	add	x4, x4, #0x6
   e0ec8:	38236805 	strb	w5, [x0, x3]
   e0ecc:	eb04005f 	cmp	x2, x4
   e0ed0:	54fffb20 	b.eq	e0e34 <memcpy+0x44>  // b.none
   e0ed4:	38646821 	ldrb	w1, [x1, x4]
   e0ed8:	38246801 	strb	w1, [x0, x4]
   e0edc:	d65f03c0 	ret
   e0ee0:	d2800003 	mov	x3, #0x0                   	// #0
   e0ee4:	38636824 	ldrb	w4, [x1, x3]
   e0ee8:	38236804 	strb	w4, [x0, x3]
   e0eec:	91000463 	add	x3, x3, #0x1
   e0ef0:	eb03005f 	cmp	x2, x3
   e0ef4:	54fff961 	b.ne	e0e20 <memcpy+0x30>  // b.any
   e0ef8:	17ffffcf 	b	e0e34 <memcpy+0x44>
   e0efc:	d503201f 	nop

00000000000e0f00 <memset>:
   e0f00:	b4000ce2 	cbz	x2, e109c <memset+0x19c>
   e0f04:	cb0003e7 	neg	x7, x0
   e0f08:	d2800168 	mov	x8, #0xb                   	// #11
   e0f0c:	924008e3 	and	x3, x7, #0x7
   e0f10:	d1000446 	sub	x6, x2, #0x1
   e0f14:	91001c65 	add	x5, x3, #0x7
   e0f18:	12001c24 	and	w4, w1, #0xff
   e0f1c:	eb0800bf 	cmp	x5, x8
   e0f20:	9a8820a5 	csel	x5, x5, x8, cs	// cs = hs, nlast
   e0f24:	eb0500df 	cmp	x6, x5
   e0f28:	54000c83 	b.cc	e10b8 <memset+0x1b8>  // b.lo, b.ul, b.last
   e0f2c:	b4000c23 	cbz	x3, e10b0 <memset+0x1b0>
   e0f30:	39000004 	strb	w4, [x0]
   e0f34:	f27f04ff 	tst	x7, #0x6
   e0f38:	54000b80 	b.eq	e10a8 <memset+0x1a8>  // b.none
   e0f3c:	39000404 	strb	w4, [x0, #1]
   e0f40:	f100087f 	cmp	x3, #0x2
   e0f44:	54000be9 	b.ls	e10c0 <memset+0x1c0>  // b.plast
   e0f48:	39000804 	strb	w4, [x0, #2]
   e0f4c:	36100aa7 	tbz	w7, #2, e10a0 <memset+0x1a0>
   e0f50:	39000c04 	strb	w4, [x0, #3]
   e0f54:	f100107f 	cmp	x3, #0x4
   e0f58:	54000b89 	b.ls	e10c8 <memset+0x1c8>  // b.plast
   e0f5c:	39001004 	strb	w4, [x0, #4]
   e0f60:	f100147f 	cmp	x3, #0x5
   e0f64:	54000b60 	b.eq	e10d0 <memset+0x1d0>  // b.none
   e0f68:	39001404 	strb	w4, [x0, #5]
   e0f6c:	f1001c7f 	cmp	x3, #0x7
   e0f70:	54000b41 	b.ne	e10d8 <memset+0x1d8>  // b.any
   e0f74:	aa0303e6 	mov	x6, x3
   e0f78:	39001804 	strb	w4, [x0, #6]
   e0f7c:	d2800005 	mov	x5, #0x0                   	// #0
   e0f80:	cb030049 	sub	x9, x2, x3
   e0f84:	b3401c85 	bfxil	x5, x4, #0, #8
   e0f88:	8b030001 	add	x1, x0, x3
   e0f8c:	927df128 	and	x8, x9, #0xfffffffffffffff8
   e0f90:	b3781c85 	bfi	x5, x4, #8, #8
   e0f94:	8b080027 	add	x7, x1, x8
   e0f98:	b3701c85 	bfi	x5, x4, #16, #8
   e0f9c:	b3681c85 	bfi	x5, x4, #24, #8
   e0fa0:	b3601c85 	bfi	x5, x4, #32, #8
   e0fa4:	b3581c85 	bfi	x5, x4, #40, #8
   e0fa8:	b3501c85 	bfi	x5, x4, #48, #8
   e0fac:	b3481c85 	bfi	x5, x4, #56, #8
   e0fb0:	f8008425 	str	x5, [x1], #8
   e0fb4:	eb0100ff 	cmp	x7, x1
   e0fb8:	54ffffc1 	b.ne	e0fb0 <memset+0xb0>  // b.any
   e0fbc:	8b0800c1 	add	x1, x6, x8
   e0fc0:	eb08013f 	cmp	x9, x8
   e0fc4:	540006c0 	b.eq	e109c <memset+0x19c>  // b.none
   e0fc8:	91000423 	add	x3, x1, #0x1
   e0fcc:	38216804 	strb	w4, [x0, x1]
   e0fd0:	eb03005f 	cmp	x2, x3
   e0fd4:	54000640 	b.eq	e109c <memset+0x19c>  // b.none
   e0fd8:	91000825 	add	x5, x1, #0x2
   e0fdc:	38236804 	strb	w4, [x0, x3]
   e0fe0:	eb05005f 	cmp	x2, x5
   e0fe4:	540005c0 	b.eq	e109c <memset+0x19c>  // b.none
   e0fe8:	91000c23 	add	x3, x1, #0x3
   e0fec:	38256804 	strb	w4, [x0, x5]
   e0ff0:	eb03005f 	cmp	x2, x3
   e0ff4:	54000540 	b.eq	e109c <memset+0x19c>  // b.none
   e0ff8:	91001025 	add	x5, x1, #0x4
   e0ffc:	38236804 	strb	w4, [x0, x3]
   e1000:	eb05005f 	cmp	x2, x5
   e1004:	540004c0 	b.eq	e109c <memset+0x19c>  // b.none
   e1008:	91001423 	add	x3, x1, #0x5
   e100c:	38256804 	strb	w4, [x0, x5]
   e1010:	eb03005f 	cmp	x2, x3
   e1014:	54000440 	b.eq	e109c <memset+0x19c>  // b.none
   e1018:	91001825 	add	x5, x1, #0x6
   e101c:	38236804 	strb	w4, [x0, x3]
   e1020:	eb05005f 	cmp	x2, x5
   e1024:	540003c0 	b.eq	e109c <memset+0x19c>  // b.none
   e1028:	91001c23 	add	x3, x1, #0x7
   e102c:	38256804 	strb	w4, [x0, x5]
   e1030:	eb03005f 	cmp	x2, x3
   e1034:	54000340 	b.eq	e109c <memset+0x19c>  // b.none
   e1038:	91002025 	add	x5, x1, #0x8
   e103c:	38236804 	strb	w4, [x0, x3]
   e1040:	eb05005f 	cmp	x2, x5
   e1044:	540002c0 	b.eq	e109c <memset+0x19c>  // b.none
   e1048:	91002423 	add	x3, x1, #0x9
   e104c:	38256804 	strb	w4, [x0, x5]
   e1050:	eb03005f 	cmp	x2, x3
   e1054:	54000240 	b.eq	e109c <memset+0x19c>  // b.none
   e1058:	91002825 	add	x5, x1, #0xa
   e105c:	38236804 	strb	w4, [x0, x3]
   e1060:	eb05005f 	cmp	x2, x5
   e1064:	540001c0 	b.eq	e109c <memset+0x19c>  // b.none
   e1068:	91002c23 	add	x3, x1, #0xb
   e106c:	38256804 	strb	w4, [x0, x5]
   e1070:	eb03005f 	cmp	x2, x3
   e1074:	54000140 	b.eq	e109c <memset+0x19c>  // b.none
   e1078:	91003025 	add	x5, x1, #0xc
   e107c:	38236804 	strb	w4, [x0, x3]
   e1080:	eb05005f 	cmp	x2, x5
   e1084:	540000c0 	b.eq	e109c <memset+0x19c>  // b.none
   e1088:	91003421 	add	x1, x1, #0xd
   e108c:	38256804 	strb	w4, [x0, x5]
   e1090:	eb01005f 	cmp	x2, x1
   e1094:	54000040 	b.eq	e109c <memset+0x19c>  // b.none
   e1098:	38216804 	strb	w4, [x0, x1]
   e109c:	d65f03c0 	ret
   e10a0:	d2800066 	mov	x6, #0x3                   	// #3
   e10a4:	17ffffb6 	b	e0f7c <memset+0x7c>
   e10a8:	d2800026 	mov	x6, #0x1                   	// #1
   e10ac:	17ffffb4 	b	e0f7c <memset+0x7c>
   e10b0:	d2800006 	mov	x6, #0x0                   	// #0
   e10b4:	17ffffb2 	b	e0f7c <memset+0x7c>
   e10b8:	d2800001 	mov	x1, #0x0                   	// #0
   e10bc:	17ffffc3 	b	e0fc8 <memset+0xc8>
   e10c0:	d2800046 	mov	x6, #0x2                   	// #2
   e10c4:	17ffffae 	b	e0f7c <memset+0x7c>
   e10c8:	d2800086 	mov	x6, #0x4                   	// #4
   e10cc:	17ffffac 	b	e0f7c <memset+0x7c>
   e10d0:	aa0303e6 	mov	x6, x3
   e10d4:	17ffffaa 	b	e0f7c <memset+0x7c>
   e10d8:	d28000c6 	mov	x6, #0x6                   	// #6
   e10dc:	17ffffa8 	b	e0f7c <memset+0x7c>

00000000000e10e0 <memmove>:
   e10e0:	b40000c2 	cbz	x2, e10f8 <memmove+0x18>
   e10e4:	d503201f 	nop
   e10e8:	d1000442 	sub	x2, x2, #0x1
   e10ec:	38626823 	ldrb	w3, [x1, x2]
   e10f0:	38226803 	strb	w3, [x0, x2]
   e10f4:	b5ffffa2 	cbnz	x2, e10e8 <memmove+0x8>
   e10f8:	d65f03c0 	ret
