
vectorization.c.elf:     file format elf64-littleaarch64


Disassembly of section .start:

00000000000e0000 <_start>:
   e0000:	d10103ff 	sub	sp, sp, #0x40
   e0004:	52800021 	mov	w1, #0x1                   	// #1
   e0008:	d140cbff 	sub	sp, sp, #0x32, lsl #12
   e000c:	528004e3 	mov	w3, #0x27                  	// #39
   e0010:	a9007bfd 	stp	x29, x30, [sp]
   e0014:	910003fd 	mov	x29, sp
   e0018:	a90153f3 	stp	x19, x20, [sp, #16]
   e001c:	d2860813 	mov	x19, #0x3040                	// #12352
   e0020:	8b3363e9 	add	x9, sp, x19
   e0024:	d2880814 	mov	x20, #0x4040                	// #16448
   e0028:	aa0903e2 	mov	x2, x9
   e002c:	8b3463eb 	add	x11, sp, x20
   e0030:	a9025bf5 	stp	x21, x22, [sp, #32]
   e0034:	d503201f 	nop
   e0038:	531d1020 	ubfiz	w0, w1, #3, #5
   e003c:	4b010000 	sub	w0, w0, w1
   e0040:	12001c00 	and	w0, w0, #0xff
   e0044:	4a030000 	eor	w0, w0, w3
   e0048:	11000400 	add	w0, w0, #0x1
   e004c:	12001c01 	and	w1, w0, #0xff
   e0050:	38001441 	strb	w1, [x2], #1
   e0054:	eb0b005f 	cmp	x2, x11
   e0058:	54ffff01 	b.ne	e0038 <_start+0x38>  // b.any
   e005c:	d28a0812 	mov	x18, #0x5040                	// #20544
   e0060:	aa0b03e2 	mov	x2, x11
   e0064:	8b3263ec 	add	x12, sp, x18
   e0068:	52800021 	mov	w1, #0x1                   	// #1
   e006c:	528004e3 	mov	w3, #0x27                  	// #39
   e0070:	531d1020 	ubfiz	w0, w1, #3, #5
   e0074:	4b010000 	sub	w0, w0, w1
   e0078:	12001c00 	and	w0, w0, #0xff
   e007c:	4a030000 	eor	w0, w0, w3
   e0080:	11000400 	add	w0, w0, #0x1
   e0084:	12001c01 	and	w1, w0, #0xff
   e0088:	38001441 	strb	w1, [x2], #1
   e008c:	eb0c005f 	cmp	x2, x12
   e0090:	54ffff01 	b.ne	e0070 <_start+0x70>  // b.any
   e0094:	d28c0811 	mov	x17, #0x6040                	// #24640
   e0098:	aa0c03e3 	mov	x3, x12
   e009c:	910103e7 	add	x7, sp, #0x40
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
   e00d4:	d2820810 	mov	x16, #0x1040                	// #4160
   e00d8:	912000e3 	add	x3, x7, #0x800
   e00dc:	8b3063ea 	add	x10, sp, x16
   e00e0:	52800022 	mov	w2, #0x1                   	// #1
   e00e4:	528004e4 	mov	w4, #0x27                  	// #39
   e00e8:	531d1040 	ubfiz	w0, w2, #3, #5
   e00ec:	4b020000 	sub	w0, w0, w2
   e00f0:	12001c00 	and	w0, w0, #0xff
   e00f4:	4a040000 	eor	w0, w0, w4
   e00f8:	11000400 	add	w0, w0, #0x1
   e00fc:	12001c02 	and	w2, w0, #0xff
   e0100:	38001462 	strb	w2, [x3], #1
   e0104:	eb0a007f 	cmp	x3, x10
   e0108:	54ffff01 	b.ne	e00e8 <_start+0xe8>  // b.any
   e010c:	d283080f 	mov	x15, #0x1840                	// #6208
   e0110:	aa0a03e2 	mov	x2, x10
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
   e0144:	d284080e 	mov	x14, #0x2040                	// #8256
   e0148:	8b2e63e3 	add	x3, sp, x14
   e014c:	52800024 	mov	w4, #0x1                   	// #1
   e0150:	528004e5 	mov	w5, #0x27                  	// #39
   e0154:	d503201f 	nop
   e0158:	531d1080 	ubfiz	w0, w4, #3, #5
   e015c:	4b040000 	sub	w0, w0, w4
   e0160:	12001c00 	and	w0, w0, #0xff
   e0164:	4a050000 	eor	w0, w0, w5
   e0168:	11000400 	add	w0, w0, #0x1
   e016c:	12001c04 	and	w4, w0, #0xff
   e0170:	38001444 	strb	w4, [x2], #1
   e0174:	eb03005f 	cmp	x2, x3
   e0178:	54ffff01 	b.ne	e0158 <_start+0x158>  // b.any
   e017c:	d2940806 	mov	x6, #0xa040                	// #41024
   e0180:	8b2663e8 	add	x8, sp, x6
   e0184:	d298080d 	mov	x13, #0xc040                	// #49216
   e0188:	aa0803e4 	mov	x4, x8
   e018c:	8b2d63ed 	add	x13, sp, x13
   e0190:	52800022 	mov	w2, #0x1                   	// #1
   e0194:	528004e5 	mov	w5, #0x27                  	// #39
   e0198:	531d1040 	ubfiz	w0, w2, #3, #5
   e019c:	4b020000 	sub	w0, w0, w2
   e01a0:	12001c00 	and	w0, w0, #0xff
   e01a4:	4a050000 	eor	w0, w0, w5
   e01a8:	11000400 	add	w0, w0, #0x1
   e01ac:	12001c02 	and	w2, w0, #0xff
   e01b0:	38001482 	strb	w2, [x4], #1
   e01b4:	eb0d009f 	cmp	x4, x13
   e01b8:	54ffff01 	b.ne	e0198 <_start+0x198>  // b.any
   e01bc:	d29c0805 	mov	x5, #0xe040                	// #57408
   e01c0:	aa0d03e2 	mov	x2, x13
   e01c4:	8b2563e6 	add	x6, sp, x5
   e01c8:	52800024 	mov	w4, #0x1                   	// #1
   e01cc:	528004e5 	mov	w5, #0x27                  	// #39
   e01d0:	531d1080 	ubfiz	w0, w4, #3, #5
   e01d4:	4b040000 	sub	w0, w0, w4
   e01d8:	12001c00 	and	w0, w0, #0xff
   e01dc:	4a050000 	eor	w0, w0, w5
   e01e0:	11000400 	add	w0, w0, #0x1
   e01e4:	12001c04 	and	w4, w0, #0xff
   e01e8:	38001444 	strb	w4, [x2], #1
   e01ec:	eb06005f 	cmp	x2, x6
   e01f0:	54ffff01 	b.ne	e01d0 <_start+0x1d0>  // b.any
   e01f4:	914043e6 	add	x6, sp, #0x10, lsl #12
   e01f8:	52800024 	mov	w4, #0x1                   	// #1
   e01fc:	910100c6 	add	x6, x6, #0x40
   e0200:	528004e5 	mov	w5, #0x27                  	// #39
   e0204:	d503201f 	nop
   e0208:	531d1080 	ubfiz	w0, w4, #3, #5
   e020c:	4b040000 	sub	w0, w0, w4
   e0210:	12001c00 	and	w0, w0, #0xff
   e0214:	4a050000 	eor	w0, w0, w5
   e0218:	11000400 	add	w0, w0, #0x1
   e021c:	12001c04 	and	w4, w0, #0xff
   e0220:	38001444 	strb	w4, [x2], #1
   e0224:	eb06005f 	cmp	x2, x6
   e0228:	54ffff01 	b.ne	e0208 <_start+0x208>  // b.any
   e022c:	52800022 	mov	w2, #0x1                   	// #1
   e0230:	528004e4 	mov	w4, #0x27                  	// #39
   e0234:	d503201f 	nop
   e0238:	531d1040 	ubfiz	w0, w2, #3, #5
   e023c:	4b020000 	sub	w0, w0, w2
   e0240:	12001c00 	and	w0, w0, #0xff
   e0244:	4a040000 	eor	w0, w0, w4
   e0248:	11000400 	add	w0, w0, #0x1
   e024c:	12001c02 	and	w2, w0, #0xff
   e0250:	38001462 	strb	w2, [x3], #1
   e0254:	eb09007f 	cmp	x3, x9
   e0258:	54ffff01 	b.ne	e0238 <_start+0x238>  // b.any
   e025c:	d28e0804 	mov	x4, #0x7040                	// #28736
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
   e0294:	d2900803 	mov	x3, #0x8040                	// #32832
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
   e02d4:	910101ce 	add	x14, x14, #0x40
   e02d8:	910101ef 	add	x15, x15, #0x40
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
   e0310:	aa0703e0 	mov	x0, x7
   e0314:	940000fb 	bl	e0700 <example1>
   e0318:	aa0703e0 	mov	x0, x7
   e031c:	940000f9 	bl	e0700 <example1>
   e0320:	710004c6 	subs	w6, w6, #0x1
   e0324:	54ffffa1 	b.ne	e0318 <_start+0x318>  // b.any
   e0328:	d2948802 	mov	x2, #0xa440                	// #42048
   e032c:	aa0803e1 	mov	x1, x8
   e0330:	8b2263e2 	add	x2, sp, x2
   e0334:	52800032 	mov	w18, #0x1                   	// #1
   e0338:	38401420 	ldrb	w0, [x1], #1
   e033c:	0b120652 	add	w18, w18, w18, lsl #1
   e0340:	4a120000 	eor	w0, w0, w18
   e0344:	53185c12 	lsl	w18, w0, #8
   e0348:	4a402252 	eor	w18, w18, w0, lsr #8
   e034c:	eb02003f 	cmp	x1, x2
   e0350:	54ffff41 	b.ne	e0338 <_start+0x338>  // b.any
   e0354:	52820003 	mov	w3, #0x1000                	// #4096
   e0358:	aa0703e0 	mov	x0, x7
   e035c:	940000e2 	bl	e06e4 <example2a.constprop.0>
   e0360:	aa0703e0 	mov	x0, x7
   e0364:	940000e0 	bl	e06e4 <example2a.constprop.0>
   e0368:	71000463 	subs	w3, w3, #0x1
   e036c:	54ffffa1 	b.ne	e0360 <_start+0x360>  // b.any
   e0370:	d29a0801 	mov	x1, #0xd040                	// #53312
   e0374:	8b2163e1 	add	x1, sp, x1
   e0378:	52800033 	mov	w19, #0x1                   	// #1
   e037c:	d503201f 	nop
   e0380:	384015a0 	ldrb	w0, [x13], #1
   e0384:	0b130673 	add	w19, w19, w19, lsl #1
   e0388:	4a130000 	eor	w0, w0, w19
   e038c:	53185c13 	lsl	w19, w0, #8
   e0390:	4a402273 	eor	w19, w19, w0, lsr #8
   e0394:	eb0101bf 	cmp	x13, x1
   e0398:	54ffff41 	b.ne	e0380 <_start+0x380>  // b.any
   e039c:	52810004 	mov	w4, #0x800                 	// #2048
   e03a0:	aa0703e0 	mov	x0, x7
   e03a4:	940000c7 	bl	e06c0 <example2b.constprop.0>
   e03a8:	aa0703e0 	mov	x0, x7
   e03ac:	940000c5 	bl	e06c0 <example2b.constprop.0>
   e03b0:	71000484 	subs	w4, w4, #0x1
   e03b4:	54ffffa1 	b.ne	e03a8 <_start+0x3a8>  // b.any
   e03b8:	d2960800 	mov	x0, #0xb040                	// #45120
   e03bc:	aa0803e1 	mov	x1, x8
   e03c0:	8b2063f6 	add	x22, sp, x0
   e03c4:	52800034 	mov	w20, #0x1                   	// #1
   e03c8:	38401420 	ldrb	w0, [x1], #1
   e03cc:	0b140694 	add	w20, w20, w20, lsl #1
   e03d0:	4a140000 	eor	w0, w0, w20
   e03d4:	53185c14 	lsl	w20, w0, #8
   e03d8:	4a402294 	eor	w20, w20, w0, lsr #8
   e03dc:	eb16003f 	cmp	x1, x22
   e03e0:	54ffff41 	b.ne	e03c8 <_start+0x3c8>  // b.any
   e03e4:	52810006 	mov	w6, #0x800                 	// #2048
   e03e8:	aa0703e0 	mov	x0, x7
   e03ec:	940000a5 	bl	e0680 <example4b.constprop.0>
   e03f0:	aa0703e0 	mov	x0, x7
   e03f4:	940000a3 	bl	e0680 <example4b.constprop.0>
   e03f8:	710004c6 	subs	w6, w6, #0x1
   e03fc:	54ffffa1 	b.ne	e03f0 <_start+0x3f0>  // b.any
   e0400:	aa0903e1 	mov	x1, x9
   e0404:	5280002d 	mov	w13, #0x1                   	// #1
   e0408:	38401420 	ldrb	w0, [x1], #1
   e040c:	0b0d05ad 	add	w13, w13, w13, lsl #1
   e0410:	4a0d0000 	eor	w0, w0, w13
   e0414:	53185c0d 	lsl	w13, w0, #8
   e0418:	4a4021ad 	eor	w13, w13, w0, lsr #8
   e041c:	eb0b003f 	cmp	x1, x11
   e0420:	54ffff41 	b.ne	e0408 <_start+0x408>  // b.any
   e0424:	52810003 	mov	w3, #0x800                 	// #2048
   e0428:	aa0703e0 	mov	x0, x7
   e042c:	94000089 	bl	e0650 <example4c.constprop.0>
   e0430:	aa0703e0 	mov	x0, x7
   e0434:	94000087 	bl	e0650 <example4c.constprop.0>
   e0438:	71000463 	subs	w3, w3, #0x1
   e043c:	54ffffa1 	b.ne	e0430 <_start+0x430>  // b.any
   e0440:	aa0b03e1 	mov	x1, x11
   e0444:	52800035 	mov	w21, #0x1                   	// #1
   e0448:	38401420 	ldrb	w0, [x1], #1
   e044c:	0b1506b5 	add	w21, w21, w21, lsl #1
   e0450:	4a150000 	eor	w0, w0, w21
   e0454:	53185c15 	lsl	w21, w0, #8
   e0458:	4a4022b5 	eor	w21, w21, w0, lsr #8
   e045c:	eb0c003f 	cmp	x1, x12
   e0460:	54ffff41 	b.ne	e0448 <_start+0x448>  // b.any
   e0464:	52820003 	mov	w3, #0x1000                	// #4096
   e0468:	aa0703e0 	mov	x0, x7
   e046c:	94000071 	bl	e0630 <example7.constprop.0>
   e0470:	aa0703e0 	mov	x0, x7
   e0474:	9400006f 	bl	e0630 <example7.constprop.0>
   e0478:	71000463 	subs	w3, w3, #0x1
   e047c:	54ffffa1 	b.ne	e0470 <_start+0x470>  // b.any
   e0480:	5280002c 	mov	w12, #0x1                   	// #1
   e0484:	d503201f 	nop
   e0488:	38401500 	ldrb	w0, [x8], #1
   e048c:	0b0c058c 	add	w12, w12, w12, lsl #1
   e0490:	4a0c0000 	eor	w0, w0, w12
   e0494:	53185c0c 	lsl	w12, w0, #8
   e0498:	4a40218c 	eor	w12, w12, w0, lsr #8
   e049c:	eb16011f 	cmp	x8, x22
   e04a0:	54ffff41 	b.ne	e0488 <_start+0x488>  // b.any
   e04a4:	52802005 	mov	w5, #0x100                 	// #256
   e04a8:	aa0703e0 	mov	x0, x7
   e04ac:	94000051 	bl	e05f0 <example8.constprop.0>
   e04b0:	aa0703e0 	mov	x0, x7
   e04b4:	9400004f 	bl	e05f0 <example8.constprop.0>
   e04b8:	710004a5 	subs	w5, w5, #0x1
   e04bc:	54ffffa1 	b.ne	e04b0 <_start+0x4b0>  // b.any
   e04c0:	52800028 	mov	w8, #0x1                   	// #1
   e04c4:	d503201f 	nop
   e04c8:	384015c0 	ldrb	w0, [x14], #1
   e04cc:	0b080508 	add	w8, w8, w8, lsl #1
   e04d0:	4a080000 	eor	w0, w0, w8
   e04d4:	53185c08 	lsl	w8, w0, #8
   e04d8:	4a402108 	eor	w8, w8, w0, lsr #8
   e04dc:	eb0f01df 	cmp	x14, x15
   e04e0:	54ffff41 	b.ne	e04c8 <_start+0x4c8>  // b.any
   e04e4:	9100f3e1 	add	x1, sp, #0x3c
   e04e8:	52810006 	mov	w6, #0x800                 	// #2048
   e04ec:	d503201f 	nop
   e04f0:	aa0703e0 	mov	x0, x7
   e04f4:	94000147 	bl	e0a10 <example9>
   e04f8:	710004c6 	subs	w6, w6, #0x1
   e04fc:	54ffffa1 	b.ne	e04f0 <_start+0x4f0>  // b.any
   e0500:	b9403fe0 	ldr	w0, [sp, #60]
   e0504:	0b140273 	add	w19, w19, w20
   e0508:	0b1501ad 	add	w13, w13, w21
   e050c:	0b08018c 	add	w12, w12, w8
   e0510:	0b000241 	add	w1, w18, w0
   e0514:	52810008 	mov	w8, #0x800                 	// #2048
   e0518:	0b130021 	add	w1, w1, w19
   e051c:	aa0703e0 	mov	x0, x7
   e0520:	0b0d0021 	add	w1, w1, w13
   e0524:	0b0c002c 	add	w12, w1, w12
   e0528:	94000022 	bl	e05b0 <example10a.constprop.0>
   e052c:	d503201f 	nop
   e0530:	aa0703e0 	mov	x0, x7
   e0534:	9400001f 	bl	e05b0 <example10a.constprop.0>
   e0538:	71000508 	subs	w8, w8, #0x1
   e053c:	54ffffa1 	b.ne	e0530 <_start+0x530>  // b.any
   e0540:	52800021 	mov	w1, #0x1                   	// #1
   e0544:	d503201f 	nop
   e0548:	38401520 	ldrb	w0, [x9], #1
   e054c:	0b010421 	add	w1, w1, w1, lsl #1
   e0550:	4a010000 	eor	w0, w0, w1
   e0554:	53185c01 	lsl	w1, w0, #8
   e0558:	4a402021 	eor	w1, w1, w0, lsr #8
   e055c:	eb0b013f 	cmp	x9, x11
   e0560:	54ffff41 	b.ne	e0548 <_start+0x548>  // b.any
   e0564:	912000e7 	add	x7, x7, #0x800
   e0568:	52800020 	mov	w0, #0x1                   	// #1
   e056c:	d503201f 	nop
   e0570:	384014e2 	ldrb	w2, [x7], #1
   e0574:	0b000400 	add	w0, w0, w0, lsl #1
   e0578:	4a000042 	eor	w2, w2, w0
   e057c:	53185c40 	lsl	w0, w2, #8
   e0580:	4a422000 	eor	w0, w0, w2, lsr #8
   e0584:	eb0a00ff 	cmp	x7, x10
   e0588:	54ffff41 	b.ne	e0570 <_start+0x570>  // b.any
   e058c:	a9407bfd 	ldp	x29, x30, [sp]
   e0590:	0b010000 	add	w0, w0, w1
   e0594:	a94153f3 	ldp	x19, x20, [sp, #16]
   e0598:	0b0c0000 	add	w0, w0, w12
   e059c:	a9425bf5 	ldp	x21, x22, [sp, #32]
   e05a0:	910103ff 	add	sp, sp, #0x40
   e05a4:	9140cbff 	add	sp, sp, #0x32, lsl #12
   e05a8:	d65f03c0 	ret

Disassembly of section .text:

00000000000e05b0 <example10a.constprop.0>:
   e05b0:	91400c02 	add	x2, x0, #0x3, lsl #12
   e05b4:	91200001 	add	x1, x0, #0x800
   e05b8:	91400406 	add	x6, x0, #0x1, lsl #12
   e05bc:	d503201f 	nop
   e05c0:	b9500043 	ldr	w3, [x2, #4096]
   e05c4:	b9600045 	ldr	w5, [x2, #8192]
   e05c8:	79500020 	ldrh	w0, [x1, #2048]
   e05cc:	79600024 	ldrh	w4, [x1, #4096]
   e05d0:	0b050063 	add	w3, w3, w5
   e05d4:	b8004443 	str	w3, [x2], #4
   e05d8:	0b040000 	add	w0, w0, w4
   e05dc:	78002420 	strh	w0, [x1], #2
   e05e0:	eb0100df 	cmp	x6, x1
   e05e4:	54fffee1 	b.ne	e05c0 <example10a.constprop.0+0x10>  // b.any
   e05e8:	d65f03c0 	ret
   e05ec:	d503201f 	nop

00000000000e05f0 <example8.constprop.0>:
   e05f0:	91404803 	add	x3, x0, #0x12, lsl #12
   e05f4:	91404c01 	add	x1, x0, #0x13, lsl #12
   e05f8:	9140cc04 	add	x4, x0, #0x33, lsl #12
   e05fc:	b21d03e2 	mov	x2, #0x800000008           	// #34359738376
   e0600:	aa0303e0 	mov	x0, x3
   e0604:	d503201f 	nop
   e0608:	f8008402 	str	x2, [x0], #8
   e060c:	eb01001f 	cmp	x0, x1
   e0610:	54ffffc1 	b.ne	e0608 <example8.constprop.0+0x18>  // b.any
   e0614:	91400401 	add	x1, x0, #0x1, lsl #12
   e0618:	91400463 	add	x3, x3, #0x1, lsl #12
   e061c:	eb04003f 	cmp	x1, x4
   e0620:	54ffff01 	b.ne	e0600 <example8.constprop.0+0x10>  // b.any
   e0624:	d65f03c0 	ret
   e0628:	d503201f 	nop
   e062c:	d503201f 	nop

00000000000e0630 <example7.constprop.0>:
   e0630:	91402801 	add	x1, x0, #0xa, lsl #12
   e0634:	91402c02 	add	x2, x0, #0xb, lsl #12
   e0638:	f9500820 	ldr	x0, [x1, #8208]
   e063c:	f8008420 	str	x0, [x1], #8
   e0640:	eb01005f 	cmp	x2, x1
   e0644:	54ffffa1 	b.ne	e0638 <example7.constprop.0+0x8>  // b.any
   e0648:	d65f03c0 	ret
   e064c:	d503201f 	nop

00000000000e0650 <example4c.constprop.0>:
   e0650:	91402801 	add	x1, x0, #0xa, lsl #12
   e0654:	91402c02 	add	x2, x0, #0xb, lsl #12
   e0658:	b9400020 	ldr	w0, [x1]
   e065c:	91001021 	add	x1, x1, #0x4
   e0660:	7100101f 	cmp	w0, #0x4
   e0664:	1a9fd7e0 	cset	w0, gt
   e0668:	531e7400 	lsl	w0, w0, #2
   e066c:	b91ffc20 	str	w0, [x1, #8188]
   e0670:	eb01005f 	cmp	x2, x1
   e0674:	54ffff21 	b.ne	e0658 <example4c.constprop.0+0x8>  // b.any
   e0678:	d65f03c0 	ret
   e067c:	d503201f 	nop

00000000000e0680 <example4b.constprop.0>:
   e0680:	d2980082 	mov	x2, #0xc004                	// #49156
   e0684:	d29c0183 	mov	x3, #0xe00c                	// #57356
   e0688:	91402805 	add	x5, x0, #0xa, lsl #12
   e068c:	8b020004 	add	x4, x0, x2
   e0690:	8b030003 	add	x3, x0, x3
   e0694:	d2800001 	mov	x1, #0x0                   	// #0
   e0698:	b8616880 	ldr	w0, [x4, x1]
   e069c:	b8616862 	ldr	w2, [x3, x1]
   e06a0:	0b020000 	add	w0, w0, w2
   e06a4:	b82168a0 	str	w0, [x5, x1]
   e06a8:	91001021 	add	x1, x1, #0x4
   e06ac:	f13f603f 	cmp	x1, #0xfd8
   e06b0:	54ffff41 	b.ne	e0698 <example4b.constprop.0+0x18>  // b.any
   e06b4:	d65f03c0 	ret
   e06b8:	d503201f 	nop
   e06bc:	d503201f 	nop

00000000000e06c0 <example2b.constprop.0>:
   e06c0:	91402801 	add	x1, x0, #0xa, lsl #12
   e06c4:	91402c02 	add	x2, x0, #0xb, lsl #12
   e06c8:	f9500023 	ldr	x3, [x1, #8192]
   e06cc:	f9600020 	ldr	x0, [x1, #16384]
   e06d0:	8a030000 	and	x0, x0, x3
   e06d4:	f8008420 	str	x0, [x1], #8
   e06d8:	eb01005f 	cmp	x2, x1
   e06dc:	54ffff61 	b.ne	e06c8 <example2b.constprop.0+0x8>  // b.any
   e06e0:	d65f03c0 	ret

00000000000e06e4 <example2a.constprop.0>:
   e06e4:	91403001 	add	x1, x0, #0xc, lsl #12
   e06e8:	91403400 	add	x0, x0, #0xd, lsl #12
   e06ec:	b21f03e2 	mov	x2, #0x200000002           	// #8589934594
   e06f0:	f8008422 	str	x2, [x1], #8
   e06f4:	eb00003f 	cmp	x1, x0
   e06f8:	54ffffc1 	b.ne	e06f0 <example2a.constprop.0+0xc>  // b.any
   e06fc:	d65f03c0 	ret

00000000000e0700 <example1>:
   e0700:	91402805 	add	x5, x0, #0xa, lsl #12
   e0704:	91403004 	add	x4, x0, #0xc, lsl #12
   e0708:	91403803 	add	x3, x0, #0xe, lsl #12
   e070c:	d2800001 	mov	x1, #0x0                   	// #0
   e0710:	b8616880 	ldr	w0, [x4, x1]
   e0714:	b8616862 	ldr	w2, [x3, x1]
   e0718:	0b020000 	add	w0, w0, w2
   e071c:	b82168a0 	str	w0, [x5, x1]
   e0720:	91001021 	add	x1, x1, #0x4
   e0724:	f110003f 	cmp	x1, #0x400
   e0728:	54ffff41 	b.ne	e0710 <example1+0x10>  // b.any
   e072c:	d65f03c0 	ret

00000000000e0730 <example2a>:
   e0730:	2a0103e5 	mov	w5, w1
   e0734:	7100003f 	cmp	w1, #0x0
   e0738:	5400024d 	b.le	e0780 <example2a+0x50>
   e073c:	7100043f 	cmp	w1, #0x1
   e0740:	54000220 	b.eq	e0784 <example2a+0x54>  // b.none
   e0744:	d2800001 	mov	x1, #0x0                   	// #0
   e0748:	53017ca4 	lsr	w4, w5, #1
   e074c:	b3407c41 	bfxil	x1, x2, #0, #32
   e0750:	91403003 	add	x3, x0, #0xc, lsl #12
   e0754:	8b244c64 	add	x4, x3, w4, uxtw #3
   e0758:	b3607c41 	bfi	x1, x2, #32, #32
   e075c:	d503201f 	nop
   e0760:	f8008461 	str	x1, [x3], #8
   e0764:	eb04007f 	cmp	x3, x4
   e0768:	54ffffc1 	b.ne	e0760 <example2a+0x30>  // b.any
   e076c:	121f78a1 	and	w1, w5, #0xfffffffe
   e0770:	36000085 	tbz	w5, #0, e0780 <example2a+0x50>
   e0774:	93407c21 	sxtw	x1, w1
   e0778:	91400c21 	add	x1, x1, #0x3, lsl #12
   e077c:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0780:	d65f03c0 	ret
   e0784:	52800001 	mov	w1, #0x0                   	// #0
   e0788:	17fffffb 	b	e0774 <example2a+0x44>
   e078c:	d503201f 	nop

00000000000e0790 <example2b>:
   e0790:	aa0003e5 	mov	x5, x0
   e0794:	340002c1 	cbz	w1, e07ec <example2b+0x5c>
   e0798:	7100043f 	cmp	w1, #0x1
   e079c:	540002a0 	b.eq	e07f0 <example2b+0x60>  // b.none
   e07a0:	53017c20 	lsr	w0, w1, #1
   e07a4:	914028a2 	add	x2, x5, #0xa, lsl #12
   e07a8:	8b204c40 	add	x0, x2, w0, uxtw #3
   e07ac:	d503201f 	nop
   e07b0:	f9500043 	ldr	x3, [x2, #8192]
   e07b4:	f9600044 	ldr	x4, [x2, #16384]
   e07b8:	8a040063 	and	x3, x3, x4
   e07bc:	f8008443 	str	x3, [x2], #8
   e07c0:	eb02001f 	cmp	x0, x2
   e07c4:	54ffff61 	b.ne	e07b0 <example2b+0x20>  // b.any
   e07c8:	121f7820 	and	w0, w1, #0xfffffffe
   e07cc:	36000101 	tbz	w1, #0, e07ec <example2b+0x5c>
   e07d0:	8b20c8a0 	add	x0, x5, w0, sxtw #2
   e07d4:	91403001 	add	x1, x0, #0xc, lsl #12
   e07d8:	91402000 	add	x0, x0, #0x8, lsl #12
   e07dc:	b9400022 	ldr	w2, [x1]
   e07e0:	b9600021 	ldr	w1, [x1, #8192]
   e07e4:	0a020021 	and	w1, w1, w2
   e07e8:	b9200001 	str	w1, [x0, #8192]
   e07ec:	d65f03c0 	ret
   e07f0:	52800000 	mov	w0, #0x0                   	// #0
   e07f4:	17fffff7 	b	e07d0 <example2b+0x40>
   e07f8:	d503201f 	nop
   e07fc:	d503201f 	nop

00000000000e0800 <example3>:
   e0800:	34000241 	cbz	w1, e0848 <example3+0x48>
   e0804:	7100043f 	cmp	w1, #0x1
   e0808:	540001c0 	b.eq	e0840 <example3+0x40>  // b.none
   e080c:	53017c25 	lsr	w5, w1, #1
   e0810:	d2800000 	mov	x0, #0x0                   	// #0
   e0814:	d37df0a5 	lsl	x5, x5, #3
   e0818:	f8606864 	ldr	x4, [x3, x0]
   e081c:	f8206844 	str	x4, [x2, x0]
   e0820:	91002000 	add	x0, x0, #0x8
   e0824:	eb0000bf 	cmp	x5, x0
   e0828:	54ffff81 	b.ne	e0818 <example3+0x18>  // b.any
   e082c:	121f7820 	and	w0, w1, #0xfffffffe
   e0830:	360000c1 	tbz	w1, #0, e0848 <example3+0x48>
   e0834:	d37ef400 	lsl	x0, x0, #2
   e0838:	8b000042 	add	x2, x2, x0
   e083c:	8b000063 	add	x3, x3, x0
   e0840:	b9400060 	ldr	w0, [x3]
   e0844:	b9000040 	str	w0, [x2]
   e0848:	d65f03c0 	ret
   e084c:	d503201f 	nop

00000000000e0850 <example4a>:
   e0850:	34000141 	cbz	w1, e0878 <example4a+0x28>
   e0854:	d37e7c24 	ubfiz	x4, x1, #2, #32
   e0858:	d2800000 	mov	x0, #0x0                   	// #0
   e085c:	d503201f 	nop
   e0860:	b8606861 	ldr	w1, [x3, x0]
   e0864:	11001421 	add	w1, w1, #0x5
   e0868:	b8206841 	str	w1, [x2, x0]
   e086c:	91001000 	add	x0, x0, #0x4
   e0870:	eb04001f 	cmp	x0, x4
   e0874:	54ffff61 	b.ne	e0860 <example4a+0x10>  // b.any
   e0878:	d65f03c0 	ret
   e087c:	d503201f 	nop

00000000000e0880 <example4b>:
   e0880:	7100003f 	cmp	w1, #0x0
   e0884:	5400020d 	b.le	e08c4 <example4b+0x44>
   e0888:	937e7c24 	sbfiz	x4, x1, #2, #32
   e088c:	91402806 	add	x6, x0, #0xa, lsl #12
   e0890:	d2980081 	mov	x1, #0xc004                	// #49156
   e0894:	d29c0182 	mov	x2, #0xe00c                	// #57356
   e0898:	8b010005 	add	x5, x0, x1
   e089c:	8b020003 	add	x3, x0, x2
   e08a0:	d2800000 	mov	x0, #0x0                   	// #0
   e08a4:	d503201f 	nop
   e08a8:	b86068a1 	ldr	w1, [x5, x0]
   e08ac:	b8606862 	ldr	w2, [x3, x0]
   e08b0:	0b020021 	add	w1, w1, w2
   e08b4:	b82068c1 	str	w1, [x6, x0]
   e08b8:	91001000 	add	x0, x0, #0x4
   e08bc:	eb00009f 	cmp	x4, x0
   e08c0:	54ffff41 	b.ne	e08a8 <example4b+0x28>  // b.any
   e08c4:	d65f03c0 	ret
   e08c8:	d503201f 	nop
   e08cc:	d503201f 	nop

00000000000e08d0 <example4c>:
   e08d0:	7100003f 	cmp	w1, #0x0
   e08d4:	5400016d 	b.le	e0900 <example4c+0x30>
   e08d8:	91402800 	add	x0, x0, #0xa, lsl #12
   e08dc:	8b21c802 	add	x2, x0, w1, sxtw #2
   e08e0:	b9400001 	ldr	w1, [x0]
   e08e4:	91001000 	add	x0, x0, #0x4
   e08e8:	7100103f 	cmp	w1, #0x4
   e08ec:	1a9fd7e1 	cset	w1, gt
   e08f0:	531e7421 	lsl	w1, w1, #2
   e08f4:	b91ffc01 	str	w1, [x0, #8188]
   e08f8:	eb00005f 	cmp	x2, x0
   e08fc:	54ffff21 	b.ne	e08e0 <example4c+0x10>  // b.any
   e0900:	d65f03c0 	ret

00000000000e0904 <example5>:
   e0904:	2a0103e4 	mov	w4, w1
   e0908:	7100003f 	cmp	w1, #0x0
   e090c:	5400024d 	b.le	e0954 <example5+0x50>
   e0910:	7100043f 	cmp	w1, #0x1
   e0914:	54000220 	b.eq	e0958 <example5+0x54>  // b.none
   e0918:	53017c23 	lsr	w3, w1, #1
   e091c:	91402402 	add	x2, x0, #0x9, lsl #12
   e0920:	d28000a1 	mov	x1, #0x5                   	// #5
   e0924:	8b234c43 	add	x3, x2, w3, uxtw #3
   e0928:	f2c000a1 	movk	x1, #0x5, lsl #32
   e092c:	d503201f 	nop
   e0930:	f8008441 	str	x1, [x2], #8
   e0934:	eb03005f 	cmp	x2, x3
   e0938:	54ffffc1 	b.ne	e0930 <example5+0x2c>  // b.any
   e093c:	121f7881 	and	w1, w4, #0xfffffffe
   e0940:	360000a4 	tbz	w4, #0, e0954 <example5+0x50>
   e0944:	d2848003 	mov	x3, #0x2400                	// #9216
   e0948:	528000a2 	mov	w2, #0x5                   	// #5
   e094c:	8b21c061 	add	x1, x3, w1, sxtw
   e0950:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0954:	d65f03c0 	ret
   e0958:	52800001 	mov	w1, #0x0                   	// #0
   e095c:	17fffffa 	b	e0944 <example5+0x40>

00000000000e0960 <example7>:
   e0960:	93407c22 	sxtw	x2, w1
   e0964:	91400c43 	add	x3, x2, #0x3, lsl #12
   e0968:	d37ef463 	lsl	x3, x3, #2
   e096c:	8b030001 	add	x1, x0, x3
   e0970:	f240083f 	tst	x1, #0x7
   e0974:	54000121 	b.ne	e0998 <example7+0x38>  // b.any
   e0978:	91402803 	add	x3, x0, #0xa, lsl #12
   e097c:	d2800000 	mov	x0, #0x0                   	// #0
   e0980:	f8606822 	ldr	x2, [x1, x0]
   e0984:	f8206862 	str	x2, [x3, x0]
   e0988:	91002000 	add	x0, x0, #0x8
   e098c:	f140041f 	cmp	x0, #0x1, lsl #12
   e0990:	54ffff81 	b.ne	e0980 <example7+0x20>  // b.any
   e0994:	d65f03c0 	ret
   e0998:	8b030000 	add	x0, x0, x3
   e099c:	cb020be3 	neg	x3, x2, lsl #2
   e09a0:	d1400863 	sub	x3, x3, #0x2, lsl #12
   e09a4:	91400402 	add	x2, x0, #0x1, lsl #12
   e09a8:	aa0103e0 	mov	x0, x1
   e09ac:	d503201f 	nop
   e09b0:	b9400001 	ldr	w1, [x0]
   e09b4:	b8236801 	str	w1, [x0, x3]
   e09b8:	91001000 	add	x0, x0, #0x4
   e09bc:	eb02001f 	cmp	x0, x2
   e09c0:	54ffff81 	b.ne	e09b0 <example7+0x50>  // b.any
   e09c4:	d65f03c0 	ret
   e09c8:	d503201f 	nop
   e09cc:	d503201f 	nop

00000000000e09d0 <example8>:
   e09d0:	2a0103e6 	mov	w6, w1
   e09d4:	91404804 	add	x4, x0, #0x12, lsl #12
   e09d8:	91404c02 	add	x2, x0, #0x13, lsl #12
   e09dc:	9140cc05 	add	x5, x0, #0x33, lsl #12
   e09e0:	d2800001 	mov	x1, #0x0                   	// #0
   e09e4:	aa0403e0 	mov	x0, x4
   e09e8:	b3407cc1 	bfxil	x1, x6, #0, #32
   e09ec:	b3607cc1 	bfi	x1, x6, #32, #32
   e09f0:	f8008401 	str	x1, [x0], #8
   e09f4:	eb02001f 	cmp	x0, x2
   e09f8:	54ffffc1 	b.ne	e09f0 <example8+0x20>  // b.any
   e09fc:	91400402 	add	x2, x0, #0x1, lsl #12
   e0a00:	91400484 	add	x4, x4, #0x1, lsl #12
   e0a04:	eb05005f 	cmp	x2, x5
   e0a08:	54fffec1 	b.ne	e09e0 <example8+0x10>  // b.any
   e0a0c:	d65f03c0 	ret

00000000000e0a10 <example9>:
   e0a10:	91401802 	add	x2, x0, #0x6, lsl #12
   e0a14:	91401c05 	add	x5, x0, #0x7, lsl #12
   e0a18:	52800003 	mov	w3, #0x0                   	// #0
   e0a1c:	d503201f 	nop
   e0a20:	b9400040 	ldr	w0, [x2]
   e0a24:	91001042 	add	x2, x2, #0x4
   e0a28:	b94ffc44 	ldr	w4, [x2, #4092]
   e0a2c:	4b040000 	sub	w0, w0, w4
   e0a30:	0b000063 	add	w3, w3, w0
   e0a34:	eb0200bf 	cmp	x5, x2
   e0a38:	54ffff41 	b.ne	e0a20 <example9+0x10>  // b.any
   e0a3c:	b9000023 	str	w3, [x1]
   e0a40:	d65f03c0 	ret

00000000000e0a44 <example10a>:
   e0a44:	91400c02 	add	x2, x0, #0x3, lsl #12
   e0a48:	91200001 	add	x1, x0, #0x800
   e0a4c:	91400406 	add	x6, x0, #0x1, lsl #12
   e0a50:	b9500043 	ldr	w3, [x2, #4096]
   e0a54:	b9600045 	ldr	w5, [x2, #8192]
   e0a58:	79500020 	ldrh	w0, [x1, #2048]
   e0a5c:	79600024 	ldrh	w4, [x1, #4096]
   e0a60:	0b050063 	add	w3, w3, w5
   e0a64:	b8004443 	str	w3, [x2], #4
   e0a68:	0b040000 	add	w0, w0, w4
   e0a6c:	78002420 	strh	w0, [x1], #2
   e0a70:	eb0100df 	cmp	x6, x1
   e0a74:	54fffee1 	b.ne	e0a50 <example10a+0xc>  // b.any
   e0a78:	d65f03c0 	ret
   e0a7c:	d503201f 	nop

00000000000e0a80 <example10b>:
   e0a80:	91400c03 	add	x3, x0, #0x3, lsl #12
   e0a84:	91400402 	add	x2, x0, #0x1, lsl #12
   e0a88:	d2800001 	mov	x1, #0x0                   	// #0
   e0a8c:	d503201f 	nop
   e0a90:	78e17840 	ldrsh	w0, [x2, x1, lsl #1]
   e0a94:	b8217860 	str	w0, [x3, x1, lsl #2]
   e0a98:	91000421 	add	x1, x1, #0x1
   e0a9c:	f110003f 	cmp	x1, #0x400
   e0aa0:	54ffff81 	b.ne	e0a90 <example10b+0x10>  // b.any
   e0aa4:	d65f03c0 	ret
   e0aa8:	d503201f 	nop
   e0aac:	d503201f 	nop

00000000000e0ab0 <example11>:
   e0ab0:	91403001 	add	x1, x0, #0xc, lsl #12
   e0ab4:	91402808 	add	x8, x0, #0xa, lsl #12
   e0ab8:	91404007 	add	x7, x0, #0x10, lsl #12
   e0abc:	d2800002 	mov	x2, #0x0                   	// #0
   e0ac0:	29401025 	ldp	w5, w4, [x1]
   e0ac4:	91002021 	add	x1, x1, #0x8
   e0ac8:	b95ffc20 	ldr	w0, [x1, #8188]
   e0acc:	b95ff823 	ldr	w3, [x1, #8184]
   e0ad0:	1b007c86 	mul	w6, w4, w0
   e0ad4:	1b037c84 	mul	w4, w4, w3
   e0ad8:	1b0398a3 	msub	w3, w5, w3, w6
   e0adc:	1b051000 	madd	w0, w0, w5, w4
   e0ae0:	b8227903 	str	w3, [x8, x2, lsl #2]
   e0ae4:	b82278e0 	str	w0, [x7, x2, lsl #2]
   e0ae8:	91000442 	add	x2, x2, #0x1
   e0aec:	f108005f 	cmp	x2, #0x200
   e0af0:	54fffe81 	b.ne	e0ac0 <example11+0x10>  // b.any
   e0af4:	d65f03c0 	ret
   e0af8:	d503201f 	nop
   e0afc:	d503201f 	nop

00000000000e0b00 <example12>:
   e0b00:	90000001 	adrp	x1, e0000 <_start>
   e0b04:	91402803 	add	x3, x0, #0xa, lsl #12
   e0b08:	91402c09 	add	x9, x0, #0xb, lsl #12
   e0b0c:	d2c00022 	mov	x2, #0x100000000           	// #4294967296
   e0b10:	f947e421 	ldr	x1, [x1, #4040]
   e0b14:	d503201f 	nop
   e0b18:	11001048 	add	w8, w2, #0x4
   e0b1c:	11001027 	add	w7, w1, #0x4
   e0b20:	9360fc46 	asr	x6, x2, #32
   e0b24:	9360fc25 	asr	x5, x1, #32
   e0b28:	d2800004 	mov	x4, #0x0                   	// #0
   e0b2c:	d2800000 	mov	x0, #0x0                   	// #0
   e0b30:	b3407d04 	bfxil	x4, x8, #0, #32
   e0b34:	110010c6 	add	w6, w6, #0x4
   e0b38:	b3407ce0 	bfxil	x0, x7, #0, #32
   e0b3c:	110010a5 	add	w5, w5, #0x4
   e0b40:	a9000462 	stp	x2, x1, [x3]
   e0b44:	b3607cc4 	bfi	x4, x6, #32, #32
   e0b48:	b3607ca0 	bfi	x0, x5, #32, #32
   e0b4c:	91004063 	add	x3, x3, #0x10
   e0b50:	aa0403e2 	mov	x2, x4
   e0b54:	aa0003e1 	mov	x1, x0
   e0b58:	eb09007f 	cmp	x3, x9
   e0b5c:	54fffde1 	b.ne	e0b18 <example12+0x18>  // b.any
   e0b60:	d65f03c0 	ret

00000000000e0b64 <example13>:
   e0b64:	aa0103e9 	mov	x9, x1
   e0b68:	aa0203e8 	mov	x8, x2
   e0b6c:	aa0303e7 	mov	x7, x3
   e0b70:	d2800006 	mov	x6, #0x0                   	// #0
   e0b74:	d503201f 	nop
   e0b78:	f8667925 	ldr	x5, [x9, x6, lsl #3]
   e0b7c:	d2800000 	mov	x0, #0x0                   	// #0
   e0b80:	f8667904 	ldr	x4, [x8, x6, lsl #3]
   e0b84:	52800002 	mov	w2, #0x0                   	// #0
   e0b88:	b86068a1 	ldr	w1, [x5, x0]
   e0b8c:	b8606883 	ldr	w3, [x4, x0]
   e0b90:	91008000 	add	x0, x0, #0x20
   e0b94:	4b030021 	sub	w1, w1, w3
   e0b98:	0b010042 	add	w2, w2, w1
   e0b9c:	f140041f 	cmp	x0, #0x1, lsl #12
   e0ba0:	54ffff41 	b.ne	e0b88 <example13+0x24>  // b.any
   e0ba4:	b82678e2 	str	w2, [x7, x6, lsl #2]
   e0ba8:	910004c6 	add	x6, x6, #0x1
   e0bac:	f10080df 	cmp	x6, #0x20
   e0bb0:	54fffe41 	b.ne	e0b78 <example13+0x14>  // b.any
   e0bb4:	d65f03c0 	ret
   e0bb8:	d503201f 	nop
   e0bbc:	d503201f 	nop

00000000000e0bc0 <example14>:
   e0bc0:	aa0103e5 	mov	x5, x1
   e0bc4:	aa0203e6 	mov	x6, x2
   e0bc8:	aa0303e8 	mov	x8, x3
   e0bcc:	d2800007 	mov	x7, #0x0                   	// #0
   e0bd0:	d2800001 	mov	x1, #0x0                   	// #0
   e0bd4:	52800002 	mov	w2, #0x0                   	// #0
   e0bd8:	d2800000 	mov	x0, #0x0                   	// #0
   e0bdc:	d503201f 	nop
   e0be0:	f86068a4 	ldr	x4, [x5, x0]
   e0be4:	f86068c3 	ldr	x3, [x6, x0]
   e0be8:	91002000 	add	x0, x0, #0x8
   e0bec:	b8616884 	ldr	w4, [x4, x1]
   e0bf0:	b8616863 	ldr	w3, [x3, x1]
   e0bf4:	1b030882 	madd	w2, w4, w3, w2
   e0bf8:	f140081f 	cmp	x0, #0x2, lsl #12
   e0bfc:	54ffff21 	b.ne	e0be0 <example14+0x20>  // b.any
   e0c00:	91001021 	add	x1, x1, #0x4
   e0c04:	f102003f 	cmp	x1, #0x80
   e0c08:	54fffe81 	b.ne	e0bd8 <example14+0x18>  // b.any
   e0c0c:	b8277902 	str	w2, [x8, x7, lsl #2]
   e0c10:	910004e7 	add	x7, x7, #0x1
   e0c14:	910020a5 	add	x5, x5, #0x8
   e0c18:	f10010ff 	cmp	x7, #0x4
   e0c1c:	54fffda1 	b.ne	e0bd0 <example14+0x10>  // b.any
   e0c20:	d65f03c0 	ret

00000000000e0c24 <example23>:
   e0c24:	d2800000 	mov	x0, #0x0                   	// #0
   e0c28:	78607823 	ldrh	w3, [x1, x0, lsl #1]
   e0c2c:	53196063 	lsl	w3, w3, #7
   e0c30:	b8207843 	str	w3, [x2, x0, lsl #2]
   e0c34:	91000400 	add	x0, x0, #0x1
   e0c38:	f104001f 	cmp	x0, #0x100
   e0c3c:	54ffff61 	b.ne	e0c28 <example23+0x4>  // b.any
   e0c40:	d65f03c0 	ret

00000000000e0c44 <init_memory>:
   e0c44:	eb01001f 	cmp	x0, x1
   e0c48:	540001a0 	b.eq	e0c7c <init_memory+0x38>  // b.none
   e0c4c:	52800023 	mov	w3, #0x1                   	// #1
   e0c50:	528004e4 	mov	w4, #0x27                  	// #39
   e0c54:	d503201f 	nop
   e0c58:	531d1062 	ubfiz	w2, w3, #3, #5
   e0c5c:	4b030042 	sub	w2, w2, w3
   e0c60:	12001c42 	and	w2, w2, #0xff
   e0c64:	4a040042 	eor	w2, w2, w4
   e0c68:	11000442 	add	w2, w2, #0x1
   e0c6c:	12001c43 	and	w3, w2, #0xff
   e0c70:	38001403 	strb	w3, [x0], #1
   e0c74:	eb00003f 	cmp	x1, x0
   e0c78:	54ffff01 	b.ne	e0c58 <init_memory+0x14>  // b.any
   e0c7c:	d65f03c0 	ret

00000000000e0c80 <digest_memory>:
   e0c80:	aa0003e3 	mov	x3, x0
   e0c84:	52800020 	mov	w0, #0x1                   	// #1
   e0c88:	eb01007f 	cmp	x3, x1
   e0c8c:	54000100 	b.eq	e0cac <digest_memory+0x2c>  // b.none
   e0c90:	38401462 	ldrb	w2, [x3], #1
   e0c94:	0b000400 	add	w0, w0, w0, lsl #1
   e0c98:	4a000042 	eor	w2, w2, w0
   e0c9c:	53185c40 	lsl	w0, w2, #8
   e0ca0:	4a422000 	eor	w0, w0, w2, lsr #8
   e0ca4:	eb03003f 	cmp	x1, x3
   e0ca8:	54ffff41 	b.ne	e0c90 <digest_memory+0x10>  // b.any
   e0cac:	d65f03c0 	ret

00000000000e0cb0 <memcpy>:
   e0cb0:	b4000222 	cbz	x2, e0cf4 <memcpy+0x44>
   e0cb4:	d1000443 	sub	x3, x2, #0x1
   e0cb8:	f1001c7f 	cmp	x3, #0x7
   e0cbc:	54000729 	b.ls	e0da0 <memcpy+0xf0>  // b.plast
   e0cc0:	aa010005 	orr	x5, x0, x1
   e0cc4:	91000424 	add	x4, x1, #0x1
   e0cc8:	cb040004 	sub	x4, x0, x4
   e0ccc:	d2800003 	mov	x3, #0x0                   	// #0
   e0cd0:	f24008bf 	tst	x5, #0x7
   e0cd4:	fa460880 	ccmp	x4, #0x6, #0x0, eq	// eq = none
   e0cd8:	54000108 	b.hi	e0cf8 <memcpy+0x48>  // b.pmore
   e0cdc:	d503201f 	nop
   e0ce0:	38636824 	ldrb	w4, [x1, x3]
   e0ce4:	38236804 	strb	w4, [x0, x3]
   e0ce8:	91000463 	add	x3, x3, #0x1
   e0cec:	eb03005f 	cmp	x2, x3
   e0cf0:	54ffff81 	b.ne	e0ce0 <memcpy+0x30>  // b.any
   e0cf4:	d65f03c0 	ret
   e0cf8:	927df044 	and	x4, x2, #0xfffffffffffffff8
   e0cfc:	d503201f 	nop
   e0d00:	f8636825 	ldr	x5, [x1, x3]
   e0d04:	f8236805 	str	x5, [x0, x3]
   e0d08:	91002063 	add	x3, x3, #0x8
   e0d0c:	eb03009f 	cmp	x4, x3
   e0d10:	54ffff81 	b.ne	e0d00 <memcpy+0x50>  // b.any
   e0d14:	eb04005f 	cmp	x2, x4
   e0d18:	54fffee0 	b.eq	e0cf4 <memcpy+0x44>  // b.none
   e0d1c:	38646825 	ldrb	w5, [x1, x4]
   e0d20:	91000483 	add	x3, x4, #0x1
   e0d24:	38246805 	strb	w5, [x0, x4]
   e0d28:	eb03005f 	cmp	x2, x3
   e0d2c:	54fffe40 	b.eq	e0cf4 <memcpy+0x44>  // b.none
   e0d30:	38636826 	ldrb	w6, [x1, x3]
   e0d34:	91000885 	add	x5, x4, #0x2
   e0d38:	38236806 	strb	w6, [x0, x3]
   e0d3c:	eb05005f 	cmp	x2, x5
   e0d40:	54fffda0 	b.eq	e0cf4 <memcpy+0x44>  // b.none
   e0d44:	38656826 	ldrb	w6, [x1, x5]
   e0d48:	91000c83 	add	x3, x4, #0x3
   e0d4c:	38256806 	strb	w6, [x0, x5]
   e0d50:	eb03005f 	cmp	x2, x3
   e0d54:	54fffd00 	b.eq	e0cf4 <memcpy+0x44>  // b.none
   e0d58:	38636826 	ldrb	w6, [x1, x3]
   e0d5c:	91001085 	add	x5, x4, #0x4
   e0d60:	38236806 	strb	w6, [x0, x3]
   e0d64:	eb05005f 	cmp	x2, x5
   e0d68:	54fffc60 	b.eq	e0cf4 <memcpy+0x44>  // b.none
   e0d6c:	38656826 	ldrb	w6, [x1, x5]
   e0d70:	91001483 	add	x3, x4, #0x5
   e0d74:	38256806 	strb	w6, [x0, x5]
   e0d78:	eb03005f 	cmp	x2, x3
   e0d7c:	54fffbc0 	b.eq	e0cf4 <memcpy+0x44>  // b.none
   e0d80:	38636825 	ldrb	w5, [x1, x3]
   e0d84:	91001884 	add	x4, x4, #0x6
   e0d88:	38236805 	strb	w5, [x0, x3]
   e0d8c:	eb04005f 	cmp	x2, x4
   e0d90:	54fffb20 	b.eq	e0cf4 <memcpy+0x44>  // b.none
   e0d94:	38646821 	ldrb	w1, [x1, x4]
   e0d98:	38246801 	strb	w1, [x0, x4]
   e0d9c:	d65f03c0 	ret
   e0da0:	d2800003 	mov	x3, #0x0                   	// #0
   e0da4:	38636824 	ldrb	w4, [x1, x3]
   e0da8:	38236804 	strb	w4, [x0, x3]
   e0dac:	91000463 	add	x3, x3, #0x1
   e0db0:	eb03005f 	cmp	x2, x3
   e0db4:	54fff961 	b.ne	e0ce0 <memcpy+0x30>  // b.any
   e0db8:	17ffffcf 	b	e0cf4 <memcpy+0x44>
   e0dbc:	d503201f 	nop

00000000000e0dc0 <memset>:
   e0dc0:	b4000ce2 	cbz	x2, e0f5c <memset+0x19c>
   e0dc4:	cb0003e7 	neg	x7, x0
   e0dc8:	d2800168 	mov	x8, #0xb                   	// #11
   e0dcc:	924008e3 	and	x3, x7, #0x7
   e0dd0:	d1000446 	sub	x6, x2, #0x1
   e0dd4:	91001c65 	add	x5, x3, #0x7
   e0dd8:	12001c24 	and	w4, w1, #0xff
   e0ddc:	eb0800bf 	cmp	x5, x8
   e0de0:	9a8820a5 	csel	x5, x5, x8, cs	// cs = hs, nlast
   e0de4:	eb0500df 	cmp	x6, x5
   e0de8:	54000c83 	b.cc	e0f78 <memset+0x1b8>  // b.lo, b.ul, b.last
   e0dec:	b4000c23 	cbz	x3, e0f70 <memset+0x1b0>
   e0df0:	39000004 	strb	w4, [x0]
   e0df4:	f27f04ff 	tst	x7, #0x6
   e0df8:	54000b80 	b.eq	e0f68 <memset+0x1a8>  // b.none
   e0dfc:	39000404 	strb	w4, [x0, #1]
   e0e00:	f100087f 	cmp	x3, #0x2
   e0e04:	54000be9 	b.ls	e0f80 <memset+0x1c0>  // b.plast
   e0e08:	39000804 	strb	w4, [x0, #2]
   e0e0c:	36100aa7 	tbz	w7, #2, e0f60 <memset+0x1a0>
   e0e10:	39000c04 	strb	w4, [x0, #3]
   e0e14:	f100107f 	cmp	x3, #0x4
   e0e18:	54000b89 	b.ls	e0f88 <memset+0x1c8>  // b.plast
   e0e1c:	39001004 	strb	w4, [x0, #4]
   e0e20:	f100147f 	cmp	x3, #0x5
   e0e24:	54000b60 	b.eq	e0f90 <memset+0x1d0>  // b.none
   e0e28:	39001404 	strb	w4, [x0, #5]
   e0e2c:	f1001c7f 	cmp	x3, #0x7
   e0e30:	54000b41 	b.ne	e0f98 <memset+0x1d8>  // b.any
   e0e34:	aa0303e6 	mov	x6, x3
   e0e38:	39001804 	strb	w4, [x0, #6]
   e0e3c:	d2800005 	mov	x5, #0x0                   	// #0
   e0e40:	cb030049 	sub	x9, x2, x3
   e0e44:	b3401c85 	bfxil	x5, x4, #0, #8
   e0e48:	8b030001 	add	x1, x0, x3
   e0e4c:	927df128 	and	x8, x9, #0xfffffffffffffff8
   e0e50:	b3781c85 	bfi	x5, x4, #8, #8
   e0e54:	8b080027 	add	x7, x1, x8
   e0e58:	b3701c85 	bfi	x5, x4, #16, #8
   e0e5c:	b3681c85 	bfi	x5, x4, #24, #8
   e0e60:	b3601c85 	bfi	x5, x4, #32, #8
   e0e64:	b3581c85 	bfi	x5, x4, #40, #8
   e0e68:	b3501c85 	bfi	x5, x4, #48, #8
   e0e6c:	b3481c85 	bfi	x5, x4, #56, #8
   e0e70:	f8008425 	str	x5, [x1], #8
   e0e74:	eb0100ff 	cmp	x7, x1
   e0e78:	54ffffc1 	b.ne	e0e70 <memset+0xb0>  // b.any
   e0e7c:	8b0800c1 	add	x1, x6, x8
   e0e80:	eb08013f 	cmp	x9, x8
   e0e84:	540006c0 	b.eq	e0f5c <memset+0x19c>  // b.none
   e0e88:	91000423 	add	x3, x1, #0x1
   e0e8c:	38216804 	strb	w4, [x0, x1]
   e0e90:	eb03005f 	cmp	x2, x3
   e0e94:	54000640 	b.eq	e0f5c <memset+0x19c>  // b.none
   e0e98:	91000825 	add	x5, x1, #0x2
   e0e9c:	38236804 	strb	w4, [x0, x3]
   e0ea0:	eb05005f 	cmp	x2, x5
   e0ea4:	540005c0 	b.eq	e0f5c <memset+0x19c>  // b.none
   e0ea8:	91000c23 	add	x3, x1, #0x3
   e0eac:	38256804 	strb	w4, [x0, x5]
   e0eb0:	eb03005f 	cmp	x2, x3
   e0eb4:	54000540 	b.eq	e0f5c <memset+0x19c>  // b.none
   e0eb8:	91001025 	add	x5, x1, #0x4
   e0ebc:	38236804 	strb	w4, [x0, x3]
   e0ec0:	eb05005f 	cmp	x2, x5
   e0ec4:	540004c0 	b.eq	e0f5c <memset+0x19c>  // b.none
   e0ec8:	91001423 	add	x3, x1, #0x5
   e0ecc:	38256804 	strb	w4, [x0, x5]
   e0ed0:	eb03005f 	cmp	x2, x3
   e0ed4:	54000440 	b.eq	e0f5c <memset+0x19c>  // b.none
   e0ed8:	91001825 	add	x5, x1, #0x6
   e0edc:	38236804 	strb	w4, [x0, x3]
   e0ee0:	eb05005f 	cmp	x2, x5
   e0ee4:	540003c0 	b.eq	e0f5c <memset+0x19c>  // b.none
   e0ee8:	91001c23 	add	x3, x1, #0x7
   e0eec:	38256804 	strb	w4, [x0, x5]
   e0ef0:	eb03005f 	cmp	x2, x3
   e0ef4:	54000340 	b.eq	e0f5c <memset+0x19c>  // b.none
   e0ef8:	91002025 	add	x5, x1, #0x8
   e0efc:	38236804 	strb	w4, [x0, x3]
   e0f00:	eb05005f 	cmp	x2, x5
   e0f04:	540002c0 	b.eq	e0f5c <memset+0x19c>  // b.none
   e0f08:	91002423 	add	x3, x1, #0x9
   e0f0c:	38256804 	strb	w4, [x0, x5]
   e0f10:	eb03005f 	cmp	x2, x3
   e0f14:	54000240 	b.eq	e0f5c <memset+0x19c>  // b.none
   e0f18:	91002825 	add	x5, x1, #0xa
   e0f1c:	38236804 	strb	w4, [x0, x3]
   e0f20:	eb05005f 	cmp	x2, x5
   e0f24:	540001c0 	b.eq	e0f5c <memset+0x19c>  // b.none
   e0f28:	91002c23 	add	x3, x1, #0xb
   e0f2c:	38256804 	strb	w4, [x0, x5]
   e0f30:	eb03005f 	cmp	x2, x3
   e0f34:	54000140 	b.eq	e0f5c <memset+0x19c>  // b.none
   e0f38:	91003025 	add	x5, x1, #0xc
   e0f3c:	38236804 	strb	w4, [x0, x3]
   e0f40:	eb05005f 	cmp	x2, x5
   e0f44:	540000c0 	b.eq	e0f5c <memset+0x19c>  // b.none
   e0f48:	91003421 	add	x1, x1, #0xd
   e0f4c:	38256804 	strb	w4, [x0, x5]
   e0f50:	eb01005f 	cmp	x2, x1
   e0f54:	54000040 	b.eq	e0f5c <memset+0x19c>  // b.none
   e0f58:	38216804 	strb	w4, [x0, x1]
   e0f5c:	d65f03c0 	ret
   e0f60:	d2800066 	mov	x6, #0x3                   	// #3
   e0f64:	17ffffb6 	b	e0e3c <memset+0x7c>
   e0f68:	d2800026 	mov	x6, #0x1                   	// #1
   e0f6c:	17ffffb4 	b	e0e3c <memset+0x7c>
   e0f70:	d2800006 	mov	x6, #0x0                   	// #0
   e0f74:	17ffffb2 	b	e0e3c <memset+0x7c>
   e0f78:	d2800001 	mov	x1, #0x0                   	// #0
   e0f7c:	17ffffc3 	b	e0e88 <memset+0xc8>
   e0f80:	d2800046 	mov	x6, #0x2                   	// #2
   e0f84:	17ffffae 	b	e0e3c <memset+0x7c>
   e0f88:	d2800086 	mov	x6, #0x4                   	// #4
   e0f8c:	17ffffac 	b	e0e3c <memset+0x7c>
   e0f90:	aa0303e6 	mov	x6, x3
   e0f94:	17ffffaa 	b	e0e3c <memset+0x7c>
   e0f98:	d28000c6 	mov	x6, #0x6                   	// #6
   e0f9c:	17ffffa8 	b	e0e3c <memset+0x7c>

00000000000e0fa0 <memmove>:
   e0fa0:	b40000c2 	cbz	x2, e0fb8 <memmove+0x18>
   e0fa4:	d503201f 	nop
   e0fa8:	d1000442 	sub	x2, x2, #0x1
   e0fac:	38626823 	ldrb	w3, [x1, x2]
   e0fb0:	38226803 	strb	w3, [x0, x2]
   e0fb4:	b5ffffa2 	cbnz	x2, e0fa8 <memmove+0x8>
   e0fb8:	d65f03c0 	ret
