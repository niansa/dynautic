
vectorization.c.elf:     file format elf64-littleaarch64


Disassembly of section .start:

00000000000e0000 <_start>:
   e0000:	d10183ff 	sub	sp, sp, #0x60
   e0004:	d2860c10 	mov	x16, #0x3060                	// #12384
   e0008:	d140cbff 	sub	sp, sp, #0x32, lsl #12
   e000c:	d2880c11 	mov	x17, #0x4060                	// #16480
   e0010:	8b3063ea 	add	x10, sp, x16
   e0014:	8b3163e8 	add	x8, sp, x17
   e0018:	aa0a03e2 	mov	x2, x10
   e001c:	52800021 	mov	w1, #0x1                   	// #1
   e0020:	a9007bfd 	stp	x29, x30, [sp]
   e0024:	910003fd 	mov	x29, sp
   e0028:	528004e3 	mov	w3, #0x27                  	// #39
   e002c:	a90153f3 	stp	x19, x20, [sp, #16]
   e0030:	a9025bf5 	stp	x21, x22, [sp, #32]
   e0034:	a90363f7 	stp	x23, x24, [sp, #48]
   e0038:	a9046bf9 	stp	x25, x26, [sp, #64]
   e003c:	d503201f 	nop
   e0040:	531d1020 	ubfiz	w0, w1, #3, #5
   e0044:	4b010000 	sub	w0, w0, w1
   e0048:	12001c00 	and	w0, w0, #0xff
   e004c:	4a030000 	eor	w0, w0, w3
   e0050:	11000400 	add	w0, w0, #0x1
   e0054:	12001c01 	and	w1, w0, #0xff
   e0058:	38001441 	strb	w1, [x2], #1
   e005c:	eb08005f 	cmp	x2, x8
   e0060:	54ffff01 	b.ne	e0040 <_start+0x40>  // b.any
   e0064:	d28a0c0f 	mov	x15, #0x5060                	// #20576
   e0068:	aa0803e2 	mov	x2, x8
   e006c:	8b2f63f6 	add	x22, sp, x15
   e0070:	52800021 	mov	w1, #0x1                   	// #1
   e0074:	528004e3 	mov	w3, #0x27                  	// #39
   e0078:	531d1020 	ubfiz	w0, w1, #3, #5
   e007c:	4b010000 	sub	w0, w0, w1
   e0080:	12001c00 	and	w0, w0, #0xff
   e0084:	4a030000 	eor	w0, w0, w3
   e0088:	11000400 	add	w0, w0, #0x1
   e008c:	12001c01 	and	w1, w0, #0xff
   e0090:	38001441 	strb	w1, [x2], #1
   e0094:	eb16005f 	cmp	x2, x22
   e0098:	54ffff01 	b.ne	e0078 <_start+0x78>  // b.any
   e009c:	d28c0c0e 	mov	x14, #0x6060                	// #24672
   e00a0:	aa1603e3 	mov	x3, x22
   e00a4:	910183e9 	add	x9, sp, #0x60
   e00a8:	8b2e63e1 	add	x1, sp, x14
   e00ac:	52800022 	mov	w2, #0x1                   	// #1
   e00b0:	528004e4 	mov	w4, #0x27                  	// #39
   e00b4:	d503201f 	nop
   e00b8:	531d1040 	ubfiz	w0, w2, #3, #5
   e00bc:	4b020000 	sub	w0, w0, w2
   e00c0:	12001c00 	and	w0, w0, #0xff
   e00c4:	4a040000 	eor	w0, w0, w4
   e00c8:	11000400 	add	w0, w0, #0x1
   e00cc:	12001c02 	and	w2, w0, #0xff
   e00d0:	38001462 	strb	w2, [x3], #1
   e00d4:	eb01007f 	cmp	x3, x1
   e00d8:	54ffff01 	b.ne	e00b8 <_start+0xb8>  // b.any
   e00dc:	d2820c0d 	mov	x13, #0x1060                	// #4192
   e00e0:	91200123 	add	x3, x9, #0x800
   e00e4:	8b2d63ef 	add	x15, sp, x13
   e00e8:	52800022 	mov	w2, #0x1                   	// #1
   e00ec:	528004e4 	mov	w4, #0x27                  	// #39
   e00f0:	531d1040 	ubfiz	w0, w2, #3, #5
   e00f4:	4b020000 	sub	w0, w0, w2
   e00f8:	12001c00 	and	w0, w0, #0xff
   e00fc:	4a040000 	eor	w0, w0, w4
   e0100:	11000400 	add	w0, w0, #0x1
   e0104:	12001c02 	and	w2, w0, #0xff
   e0108:	38001462 	strb	w2, [x3], #1
   e010c:	eb0f007f 	cmp	x3, x15
   e0110:	54ffff01 	b.ne	e00f0 <_start+0xf0>  // b.any
   e0114:	d2830c0c 	mov	x12, #0x1860                	// #6240
   e0118:	aa0f03e2 	mov	x2, x15
   e011c:	8b2c63e5 	add	x5, sp, x12
   e0120:	52800023 	mov	w3, #0x1                   	// #1
   e0124:	528004e4 	mov	w4, #0x27                  	// #39
   e0128:	531d1060 	ubfiz	w0, w3, #3, #5
   e012c:	4b030000 	sub	w0, w0, w3
   e0130:	12001c00 	and	w0, w0, #0xff
   e0134:	4a040000 	eor	w0, w0, w4
   e0138:	11000400 	add	w0, w0, #0x1
   e013c:	12001c03 	and	w3, w0, #0xff
   e0140:	38001443 	strb	w3, [x2], #1
   e0144:	eb05005f 	cmp	x2, x5
   e0148:	54ffff01 	b.ne	e0128 <_start+0x128>  // b.any
   e014c:	d2840c0b 	mov	x11, #0x2060                	// #8288
   e0150:	8b2b63eb 	add	x11, sp, x11
   e0154:	52800023 	mov	w3, #0x1                   	// #1
   e0158:	528004e4 	mov	w4, #0x27                  	// #39
   e015c:	d503201f 	nop
   e0160:	531d1060 	ubfiz	w0, w3, #3, #5
   e0164:	4b030000 	sub	w0, w0, w3
   e0168:	12001c00 	and	w0, w0, #0xff
   e016c:	4a040000 	eor	w0, w0, w4
   e0170:	11000400 	add	w0, w0, #0x1
   e0174:	12001c03 	and	w3, w0, #0xff
   e0178:	38001443 	strb	w3, [x2], #1
   e017c:	eb0b005f 	cmp	x2, x11
   e0180:	54ffff01 	b.ne	e0160 <_start+0x160>  // b.any
   e0184:	d2940c06 	mov	x6, #0xa060                	// #41056
   e0188:	8b2663f5 	add	x21, sp, x6
   e018c:	d2980c07 	mov	x7, #0xc060                	// #49248
   e0190:	aa1503e3 	mov	x3, x21
   e0194:	8b2763ed 	add	x13, sp, x7
   e0198:	52800022 	mov	w2, #0x1                   	// #1
   e019c:	528004e4 	mov	w4, #0x27                  	// #39
   e01a0:	531d1040 	ubfiz	w0, w2, #3, #5
   e01a4:	4b020000 	sub	w0, w0, w2
   e01a8:	12001c00 	and	w0, w0, #0xff
   e01ac:	4a040000 	eor	w0, w0, w4
   e01b0:	11000400 	add	w0, w0, #0x1
   e01b4:	12001c02 	and	w2, w0, #0xff
   e01b8:	38001462 	strb	w2, [x3], #1
   e01bc:	eb0d007f 	cmp	x3, x13
   e01c0:	54ffff01 	b.ne	e01a0 <_start+0x1a0>  // b.any
   e01c4:	d29c0c05 	mov	x5, #0xe060                	// #57440
   e01c8:	aa0d03e2 	mov	x2, x13
   e01cc:	8b2563e5 	add	x5, sp, x5
   e01d0:	52800023 	mov	w3, #0x1                   	// #1
   e01d4:	528004e4 	mov	w4, #0x27                  	// #39
   e01d8:	531d1060 	ubfiz	w0, w3, #3, #5
   e01dc:	4b030000 	sub	w0, w0, w3
   e01e0:	12001c00 	and	w0, w0, #0xff
   e01e4:	4a040000 	eor	w0, w0, w4
   e01e8:	11000400 	add	w0, w0, #0x1
   e01ec:	12001c03 	and	w3, w0, #0xff
   e01f0:	38001443 	strb	w3, [x2], #1
   e01f4:	eb05005f 	cmp	x2, x5
   e01f8:	54ffff01 	b.ne	e01d8 <_start+0x1d8>  // b.any
   e01fc:	914043ec 	add	x12, sp, #0x10, lsl #12
   e0200:	52800023 	mov	w3, #0x1                   	// #1
   e0204:	9101818c 	add	x12, x12, #0x60
   e0208:	528004e4 	mov	w4, #0x27                  	// #39
   e020c:	d503201f 	nop
   e0210:	531d1060 	ubfiz	w0, w3, #3, #5
   e0214:	4b030000 	sub	w0, w0, w3
   e0218:	12001c00 	and	w0, w0, #0xff
   e021c:	4a040000 	eor	w0, w0, w4
   e0220:	11000400 	add	w0, w0, #0x1
   e0224:	12001c03 	and	w3, w0, #0xff
   e0228:	38001443 	strb	w3, [x2], #1
   e022c:	eb0c005f 	cmp	x2, x12
   e0230:	54ffff01 	b.ne	e0210 <_start+0x210>  // b.any
   e0234:	aa0b03e3 	mov	x3, x11
   e0238:	52800022 	mov	w2, #0x1                   	// #1
   e023c:	528004e4 	mov	w4, #0x27                  	// #39
   e0240:	531d1040 	ubfiz	w0, w2, #3, #5
   e0244:	4b020000 	sub	w0, w0, w2
   e0248:	12001c00 	and	w0, w0, #0xff
   e024c:	4a040000 	eor	w0, w0, w4
   e0250:	11000400 	add	w0, w0, #0x1
   e0254:	12001c02 	and	w2, w0, #0xff
   e0258:	38001462 	strb	w2, [x3], #1
   e025c:	eb0a007f 	cmp	x3, x10
   e0260:	54ffff01 	b.ne	e0240 <_start+0x240>  // b.any
   e0264:	d28e0c04 	mov	x4, #0x7060                	// #28768
   e0268:	8b2463e4 	add	x4, sp, x4
   e026c:	52800022 	mov	w2, #0x1                   	// #1
   e0270:	528004e3 	mov	w3, #0x27                  	// #39
   e0274:	d503201f 	nop
   e0278:	531d1040 	ubfiz	w0, w2, #3, #5
   e027c:	4b020000 	sub	w0, w0, w2
   e0280:	12001c00 	and	w0, w0, #0xff
   e0284:	4a030000 	eor	w0, w0, w3
   e0288:	11000400 	add	w0, w0, #0x1
   e028c:	12001c02 	and	w2, w0, #0xff
   e0290:	38001422 	strb	w2, [x1], #1
   e0294:	eb04003f 	cmp	x1, x4
   e0298:	54ffff01 	b.ne	e0278 <_start+0x278>  // b.any
   e029c:	d2900c03 	mov	x3, #0x8060                	// #32864
   e02a0:	52800022 	mov	w2, #0x1                   	// #1
   e02a4:	8b2363e4 	add	x4, sp, x3
   e02a8:	528004e3 	mov	w3, #0x27                  	// #39
   e02ac:	d503201f 	nop
   e02b0:	531d1040 	ubfiz	w0, w2, #3, #5
   e02b4:	4b020000 	sub	w0, w0, w2
   e02b8:	12001c00 	and	w0, w0, #0xff
   e02bc:	4a030000 	eor	w0, w0, w3
   e02c0:	11000400 	add	w0, w0, #0x1
   e02c4:	12001c02 	and	w2, w0, #0xff
   e02c8:	38001422 	strb	w2, [x1], #1
   e02cc:	eb04003f 	cmp	x1, x4
   e02d0:	54ffff01 	b.ne	e02b0 <_start+0x2b0>  // b.any
   e02d4:	91404bf3 	add	x19, sp, #0x12, lsl #12
   e02d8:	91404ff4 	add	x20, sp, #0x13, lsl #12
   e02dc:	91018273 	add	x19, x19, #0x60
   e02e0:	91018294 	add	x20, x20, #0x60
   e02e4:	aa1303e2 	mov	x2, x19
   e02e8:	52800021 	mov	w1, #0x1                   	// #1
   e02ec:	528004e3 	mov	w3, #0x27                  	// #39
   e02f0:	531d1020 	ubfiz	w0, w1, #3, #5
   e02f4:	4b010000 	sub	w0, w0, w1
   e02f8:	12001c00 	and	w0, w0, #0xff
   e02fc:	4a030000 	eor	w0, w0, w3
   e0300:	11000400 	add	w0, w0, #0x1
   e0304:	12001c01 	and	w1, w0, #0xff
   e0308:	38001441 	strb	w1, [x2], #1
   e030c:	eb14005f 	cmp	x2, x20
   e0310:	54ffff01 	b.ne	e02f0 <_start+0x2f0>  // b.any
   e0314:	52850006 	mov	w6, #0x2800                	// #10240
   e0318:	aa0903e0 	mov	x0, x9
   e031c:	94000189 	bl	e0940 <example1>
   e0320:	aa0903e0 	mov	x0, x9
   e0324:	94000187 	bl	e0940 <example1>
   e0328:	710004c6 	subs	w6, w6, #0x1
   e032c:	54ffffa1 	b.ne	e0320 <_start+0x320>  // b.any
   e0330:	d2948c02 	mov	x2, #0xa460                	// #42080
   e0334:	aa1503e1 	mov	x1, x21
   e0338:	8b2263e2 	add	x2, sp, x2
   e033c:	52800027 	mov	w7, #0x1                   	// #1
   e0340:	38401420 	ldrb	w0, [x1], #1
   e0344:	0b0704e7 	add	w7, w7, w7, lsl #1
   e0348:	4a070000 	eor	w0, w0, w7
   e034c:	53185c07 	lsl	w7, w0, #8
   e0350:	4a4020e7 	eor	w7, w7, w0, lsr #8
   e0354:	eb02003f 	cmp	x1, x2
   e0358:	54ffff41 	b.ne	e0340 <_start+0x340>  // b.any
   e035c:	52820003 	mov	w3, #0x1000                	// #4096
   e0360:	aa0903e0 	mov	x0, x9
   e0364:	9400016c 	bl	e0914 <example2a.constprop.0>
   e0368:	aa0903e0 	mov	x0, x9
   e036c:	9400016a 	bl	e0914 <example2a.constprop.0>
   e0370:	71000463 	subs	w3, w3, #0x1
   e0374:	54ffffa1 	b.ne	e0368 <_start+0x368>  // b.any
   e0378:	d29a0c01 	mov	x1, #0xd060                	// #53344
   e037c:	8b2163e1 	add	x1, sp, x1
   e0380:	5280002e 	mov	w14, #0x1                   	// #1
   e0384:	d503201f 	nop
   e0388:	384015a0 	ldrb	w0, [x13], #1
   e038c:	0b0e05ce 	add	w14, w14, w14, lsl #1
   e0390:	4a0e0000 	eor	w0, w0, w14
   e0394:	53185c0e 	lsl	w14, w0, #8
   e0398:	4a4021ce 	eor	w14, w14, w0, lsr #8
   e039c:	eb0101bf 	cmp	x13, x1
   e03a0:	54ffff41 	b.ne	e0388 <_start+0x388>  // b.any
   e03a4:	52810004 	mov	w4, #0x800                 	// #2048
   e03a8:	aa0903e0 	mov	x0, x9
   e03ac:	94000151 	bl	e08f0 <example2b.constprop.0>
   e03b0:	aa0903e0 	mov	x0, x9
   e03b4:	9400014f 	bl	e08f0 <example2b.constprop.0>
   e03b8:	71000484 	subs	w4, w4, #0x1
   e03bc:	54ffffa1 	b.ne	e03b0 <_start+0x3b0>  // b.any
   e03c0:	d2960c00 	mov	x0, #0xb060                	// #45152
   e03c4:	aa1503e1 	mov	x1, x21
   e03c8:	8b2063f8 	add	x24, sp, x0
   e03cc:	52800032 	mov	w18, #0x1                   	// #1
   e03d0:	38401420 	ldrb	w0, [x1], #1
   e03d4:	0b120652 	add	w18, w18, w18, lsl #1
   e03d8:	4a120000 	eor	w0, w0, w18
   e03dc:	53185c12 	lsl	w18, w0, #8
   e03e0:	4a402252 	eor	w18, w18, w0, lsr #8
   e03e4:	eb18003f 	cmp	x1, x24
   e03e8:	54ffff41 	b.ne	e03d0 <_start+0x3d0>  // b.any
   e03ec:	52810004 	mov	w4, #0x800                 	// #2048
   e03f0:	aa0803e1 	mov	x1, x8
   e03f4:	aa0a03e0 	mov	x0, x10
   e03f8:	94000137 	bl	e08d4 <example3.constprop.0>
   e03fc:	d503201f 	nop
   e0400:	aa0803e1 	mov	x1, x8
   e0404:	aa0a03e0 	mov	x0, x10
   e0408:	94000133 	bl	e08d4 <example3.constprop.0>
   e040c:	71000484 	subs	w4, w4, #0x1
   e0410:	54ffff81 	b.ne	e0400 <_start+0x400>  // b.any
   e0414:	aa0a03e1 	mov	x1, x10
   e0418:	5280002d 	mov	w13, #0x1                   	// #1
   e041c:	d503201f 	nop
   e0420:	38401420 	ldrb	w0, [x1], #1
   e0424:	0b0d05ad 	add	w13, w13, w13, lsl #1
   e0428:	4a0d0000 	eor	w0, w0, w13
   e042c:	53185c0d 	lsl	w13, w0, #8
   e0430:	4a4021ad 	eor	w13, w13, w0, lsr #8
   e0434:	eb08003f 	cmp	x1, x8
   e0438:	54ffff41 	b.ne	e0420 <_start+0x420>  // b.any
   e043c:	52810004 	mov	w4, #0x800                 	// #2048
   e0440:	aa0803e1 	mov	x1, x8
   e0444:	aa0a03e0 	mov	x0, x10
   e0448:	9400011a 	bl	e08b0 <example4a.constprop.0>
   e044c:	d503201f 	nop
   e0450:	aa0803e1 	mov	x1, x8
   e0454:	aa0a03e0 	mov	x0, x10
   e0458:	94000116 	bl	e08b0 <example4a.constprop.0>
   e045c:	71000484 	subs	w4, w4, #0x1
   e0460:	54ffff81 	b.ne	e0450 <_start+0x450>  // b.any
   e0464:	aa0a03e1 	mov	x1, x10
   e0468:	52800037 	mov	w23, #0x1                   	// #1
   e046c:	d503201f 	nop
   e0470:	38401420 	ldrb	w0, [x1], #1
   e0474:	0b1706f7 	add	w23, w23, w23, lsl #1
   e0478:	4a170000 	eor	w0, w0, w23
   e047c:	53185c17 	lsl	w23, w0, #8
   e0480:	4a4022f7 	eor	w23, w23, w0, lsr #8
   e0484:	eb08003f 	cmp	x1, x8
   e0488:	54ffff41 	b.ne	e0470 <_start+0x470>  // b.any
   e048c:	52810006 	mov	w6, #0x800                 	// #2048
   e0490:	aa0903e0 	mov	x0, x9
   e0494:	940000f7 	bl	e0870 <example4b.constprop.0>
   e0498:	aa0903e0 	mov	x0, x9
   e049c:	940000f5 	bl	e0870 <example4b.constprop.0>
   e04a0:	710004c6 	subs	w6, w6, #0x1
   e04a4:	54ffffa1 	b.ne	e0498 <_start+0x498>  // b.any
   e04a8:	aa0a03e1 	mov	x1, x10
   e04ac:	52800039 	mov	w25, #0x1                   	// #1
   e04b0:	38401420 	ldrb	w0, [x1], #1
   e04b4:	0b190739 	add	w25, w25, w25, lsl #1
   e04b8:	4a190000 	eor	w0, w0, w25
   e04bc:	53185c19 	lsl	w25, w0, #8
   e04c0:	4a402339 	eor	w25, w25, w0, lsr #8
   e04c4:	eb08003f 	cmp	x1, x8
   e04c8:	54ffff41 	b.ne	e04b0 <_start+0x4b0>  // b.any
   e04cc:	52810003 	mov	w3, #0x800                 	// #2048
   e04d0:	aa0903e0 	mov	x0, x9
   e04d4:	940000db 	bl	e0840 <example4c.constprop.0>
   e04d8:	aa0903e0 	mov	x0, x9
   e04dc:	940000d9 	bl	e0840 <example4c.constprop.0>
   e04e0:	71000463 	subs	w3, w3, #0x1
   e04e4:	54ffffa1 	b.ne	e04d8 <_start+0x4d8>  // b.any
   e04e8:	aa0803e1 	mov	x1, x8
   e04ec:	5280003a 	mov	w26, #0x1                   	// #1
   e04f0:	38401420 	ldrb	w0, [x1], #1
   e04f4:	0b1a075a 	add	w26, w26, w26, lsl #1
   e04f8:	4a1a0000 	eor	w0, w0, w26
   e04fc:	53185c1a 	lsl	w26, w0, #8
   e0500:	4a40235a 	eor	w26, w26, w0, lsr #8
   e0504:	eb16003f 	cmp	x1, x22
   e0508:	54ffff41 	b.ne	e04f0 <_start+0x4f0>  // b.any
   e050c:	52820003 	mov	w3, #0x1000                	// #4096
   e0510:	aa0903e0 	mov	x0, x9
   e0514:	940000c3 	bl	e0820 <example7.constprop.0>
   e0518:	aa0903e0 	mov	x0, x9
   e051c:	940000c1 	bl	e0820 <example7.constprop.0>
   e0520:	71000463 	subs	w3, w3, #0x1
   e0524:	54ffffa1 	b.ne	e0518 <_start+0x518>  // b.any
   e0528:	52800036 	mov	w22, #0x1                   	// #1
   e052c:	d503201f 	nop
   e0530:	384016a0 	ldrb	w0, [x21], #1
   e0534:	0b1606d6 	add	w22, w22, w22, lsl #1
   e0538:	4a160000 	eor	w0, w0, w22
   e053c:	53185c16 	lsl	w22, w0, #8
   e0540:	4a4022d6 	eor	w22, w22, w0, lsr #8
   e0544:	eb1802bf 	cmp	x21, x24
   e0548:	54ffff41 	b.ne	e0530 <_start+0x530>  // b.any
   e054c:	52802005 	mov	w5, #0x100                 	// #256
   e0550:	aa0903e0 	mov	x0, x9
   e0554:	940000a3 	bl	e07e0 <example8.constprop.0>
   e0558:	aa0903e0 	mov	x0, x9
   e055c:	940000a1 	bl	e07e0 <example8.constprop.0>
   e0560:	710004a5 	subs	w5, w5, #0x1
   e0564:	54ffffa1 	b.ne	e0558 <_start+0x558>  // b.any
   e0568:	52800035 	mov	w21, #0x1                   	// #1
   e056c:	d503201f 	nop
   e0570:	38401660 	ldrb	w0, [x19], #1
   e0574:	0b1506b5 	add	w21, w21, w21, lsl #1
   e0578:	4a150000 	eor	w0, w0, w21
   e057c:	53185c15 	lsl	w21, w0, #8
   e0580:	4a4022b5 	eor	w21, w21, w0, lsr #8
   e0584:	eb14027f 	cmp	x19, x20
   e0588:	54ffff41 	b.ne	e0570 <_start+0x570>  // b.any
   e058c:	910173e1 	add	x1, sp, #0x5c
   e0590:	52810006 	mov	w6, #0x800                 	// #2048
   e0594:	d503201f 	nop
   e0598:	aa0903e0 	mov	x0, x9
   e059c:	940001ad 	bl	e0c50 <example9>
   e05a0:	710004c6 	subs	w6, w6, #0x1
   e05a4:	54ffffa1 	b.ne	e0598 <_start+0x598>  // b.any
   e05a8:	b9405fe0 	ldr	w0, [sp, #92]
   e05ac:	0b1201ce 	add	w14, w14, w18
   e05b0:	0b1701ad 	add	w13, w13, w23
   e05b4:	0b1a0339 	add	w25, w25, w26
   e05b8:	0b0000f2 	add	w18, w7, w0
   e05bc:	0b1502d6 	add	w22, w22, w21
   e05c0:	0b0e0252 	add	w18, w18, w14
   e05c4:	52810007 	mov	w7, #0x800                 	// #2048
   e05c8:	0b0d0252 	add	w18, w18, w13
   e05cc:	aa0903e0 	mov	x0, x9
   e05d0:	0b190252 	add	w18, w18, w25
   e05d4:	94000073 	bl	e07a0 <example10a.constprop.0>
   e05d8:	0b160252 	add	w18, w18, w22
   e05dc:	d503201f 	nop
   e05e0:	aa0903e0 	mov	x0, x9
   e05e4:	9400006f 	bl	e07a0 <example10a.constprop.0>
   e05e8:	710004e7 	subs	w7, w7, #0x1
   e05ec:	54ffffa1 	b.ne	e05e0 <_start+0x5e0>  // b.any
   e05f0:	aa0a03e1 	mov	x1, x10
   e05f4:	52800033 	mov	w19, #0x1                   	// #1
   e05f8:	38401420 	ldrb	w0, [x1], #1
   e05fc:	0b130673 	add	w19, w19, w19, lsl #1
   e0600:	4a130000 	eor	w0, w0, w19
   e0604:	53185c13 	lsl	w19, w0, #8
   e0608:	4a402273 	eor	w19, w19, w0, lsr #8
   e060c:	eb08003f 	cmp	x1, x8
   e0610:	54ffff41 	b.ne	e05f8 <_start+0x5f8>  // b.any
   e0614:	91200121 	add	x1, x9, #0x800
   e0618:	5280002d 	mov	w13, #0x1                   	// #1
   e061c:	d503201f 	nop
   e0620:	38401420 	ldrb	w0, [x1], #1
   e0624:	0b0d05ad 	add	w13, w13, w13, lsl #1
   e0628:	4a0d0000 	eor	w0, w0, w13
   e062c:	53185c0d 	lsl	w13, w0, #8
   e0630:	4a4021ad 	eor	w13, w13, w0, lsr #8
   e0634:	eb0f003f 	cmp	x1, x15
   e0638:	54ffff41 	b.ne	e0620 <_start+0x620>  // b.any
   e063c:	52820004 	mov	w4, #0x1000                	// #4096
   e0640:	aa0903e0 	mov	x0, x9
   e0644:	9400004c 	bl	e0774 <example10b.constprop.0>
   e0648:	aa0903e0 	mov	x0, x9
   e064c:	9400004a 	bl	e0774 <example10b.constprop.0>
   e0650:	71000484 	subs	w4, w4, #0x1
   e0654:	54ffffa1 	b.ne	e0648 <_start+0x648>  // b.any
   e0658:	5280002e 	mov	w14, #0x1                   	// #1
   e065c:	d503201f 	nop
   e0660:	38401540 	ldrb	w0, [x10], #1
   e0664:	0b0e05ce 	add	w14, w14, w14, lsl #1
   e0668:	4a0e0000 	eor	w0, w0, w14
   e066c:	53185c0e 	lsl	w14, w0, #8
   e0670:	4a4021ce 	eor	w14, w14, w0, lsr #8
   e0674:	eb08015f 	cmp	x10, x8
   e0678:	54ffff41 	b.ne	e0660 <_start+0x660>  // b.any
   e067c:	5281000a 	mov	w10, #0x800                 	// #2048
   e0680:	aa0903e0 	mov	x0, x9
   e0684:	9400019b 	bl	e0cf0 <example11>
   e0688:	aa0903e0 	mov	x0, x9
   e068c:	94000199 	bl	e0cf0 <example11>
   e0690:	7100054a 	subs	w10, w10, #0x1
   e0694:	54ffffa1 	b.ne	e0688 <_start+0x688>  // b.any
   e0698:	914047e1 	add	x1, sp, #0x11, lsl #12
   e069c:	52800025 	mov	w5, #0x1                   	// #1
   e06a0:	91018021 	add	x1, x1, #0x60
   e06a4:	d503201f 	nop
   e06a8:	38401580 	ldrb	w0, [x12], #1
   e06ac:	0b0504a5 	add	w5, w5, w5, lsl #1
   e06b0:	4a050000 	eor	w0, w0, w5
   e06b4:	53185c05 	lsl	w5, w0, #8
   e06b8:	4a4020a5 	eor	w5, w5, w0, lsr #8
   e06bc:	eb01019f 	cmp	x12, x1
   e06c0:	54ffff41 	b.ne	e06a8 <_start+0x6a8>  // b.any
   e06c4:	52840004 	mov	w4, #0x2000                	// #8192
   e06c8:	aa0b03e1 	mov	x1, x11
   e06cc:	aa0903e0 	mov	x0, x9
   e06d0:	94000020 	bl	e0750 <example23.constprop.0>
   e06d4:	d503201f 	nop
   e06d8:	aa0b03e1 	mov	x1, x11
   e06dc:	aa0903e0 	mov	x0, x9
   e06e0:	9400001c 	bl	e0750 <example23.constprop.0>
   e06e4:	71000484 	subs	w4, w4, #0x1
   e06e8:	54ffff81 	b.ne	e06d8 <_start+0x6d8>  // b.any
   e06ec:	91080122 	add	x2, x9, #0x200
   e06f0:	52800020 	mov	w0, #0x1                   	// #1
   e06f4:	d503201f 	nop
   e06f8:	38401521 	ldrb	w1, [x9], #1
   e06fc:	0b000400 	add	w0, w0, w0, lsl #1
   e0700:	4a000021 	eor	w1, w1, w0
   e0704:	53185c20 	lsl	w0, w1, #8
   e0708:	4a412000 	eor	w0, w0, w1, lsr #8
   e070c:	eb02013f 	cmp	x9, x2
   e0710:	54ffff41 	b.ne	e06f8 <_start+0x6f8>  // b.any
   e0714:	0b1301a1 	add	w1, w13, w19
   e0718:	0b0501ce 	add	w14, w14, w5
   e071c:	0b120021 	add	w1, w1, w18
   e0720:	a9407bfd 	ldp	x29, x30, [sp]
   e0724:	0b0e0021 	add	w1, w1, w14
   e0728:	a94153f3 	ldp	x19, x20, [sp, #16]
   e072c:	0b000020 	add	w0, w1, w0
   e0730:	a9425bf5 	ldp	x21, x22, [sp, #32]
   e0734:	a94363f7 	ldp	x23, x24, [sp, #48]
   e0738:	a9446bf9 	ldp	x25, x26, [sp, #64]
   e073c:	910183ff 	add	sp, sp, #0x60
   e0740:	9140cbff 	add	sp, sp, #0x32, lsl #12
   e0744:	d65f03c0 	ret

Disassembly of section .text:

00000000000e0750 <example23.constprop.0>:
   e0750:	d2800002 	mov	x2, #0x0                   	// #0
   e0754:	d503201f 	nop
   e0758:	78627803 	ldrh	w3, [x0, x2, lsl #1]
   e075c:	53196063 	lsl	w3, w3, #7
   e0760:	b8227823 	str	w3, [x1, x2, lsl #2]
   e0764:	91000442 	add	x2, x2, #0x1
   e0768:	f104005f 	cmp	x2, #0x100
   e076c:	54ffff61 	b.ne	e0758 <example23.constprop.0+0x8>  // b.any
   e0770:	d65f03c0 	ret

00000000000e0774 <example10b.constprop.0>:
   e0774:	91400c03 	add	x3, x0, #0x3, lsl #12
   e0778:	91400402 	add	x2, x0, #0x1, lsl #12
   e077c:	d2800001 	mov	x1, #0x0                   	// #0
   e0780:	78e17840 	ldrsh	w0, [x2, x1, lsl #1]
   e0784:	b8217860 	str	w0, [x3, x1, lsl #2]
   e0788:	91000421 	add	x1, x1, #0x1
   e078c:	f110003f 	cmp	x1, #0x400
   e0790:	54ffff81 	b.ne	e0780 <example10b.constprop.0+0xc>  // b.any
   e0794:	d65f03c0 	ret
   e0798:	d503201f 	nop
   e079c:	d503201f 	nop

00000000000e07a0 <example10a.constprop.0>:
   e07a0:	91400c02 	add	x2, x0, #0x3, lsl #12
   e07a4:	91200001 	add	x1, x0, #0x800
   e07a8:	91400406 	add	x6, x0, #0x1, lsl #12
   e07ac:	d503201f 	nop
   e07b0:	b9500043 	ldr	w3, [x2, #4096]
   e07b4:	b9600045 	ldr	w5, [x2, #8192]
   e07b8:	79500020 	ldrh	w0, [x1, #2048]
   e07bc:	79600024 	ldrh	w4, [x1, #4096]
   e07c0:	0b050063 	add	w3, w3, w5
   e07c4:	b8004443 	str	w3, [x2], #4
   e07c8:	0b040000 	add	w0, w0, w4
   e07cc:	78002420 	strh	w0, [x1], #2
   e07d0:	eb0100df 	cmp	x6, x1
   e07d4:	54fffee1 	b.ne	e07b0 <example10a.constprop.0+0x10>  // b.any
   e07d8:	d65f03c0 	ret
   e07dc:	d503201f 	nop

00000000000e07e0 <example8.constprop.0>:
   e07e0:	91404803 	add	x3, x0, #0x12, lsl #12
   e07e4:	91404c01 	add	x1, x0, #0x13, lsl #12
   e07e8:	9140cc04 	add	x4, x0, #0x33, lsl #12
   e07ec:	b21d03e2 	mov	x2, #0x800000008           	// #34359738376
   e07f0:	aa0303e0 	mov	x0, x3
   e07f4:	d503201f 	nop
   e07f8:	f8008402 	str	x2, [x0], #8
   e07fc:	eb01001f 	cmp	x0, x1
   e0800:	54ffffc1 	b.ne	e07f8 <example8.constprop.0+0x18>  // b.any
   e0804:	91400401 	add	x1, x0, #0x1, lsl #12
   e0808:	91400463 	add	x3, x3, #0x1, lsl #12
   e080c:	eb04003f 	cmp	x1, x4
   e0810:	54ffff01 	b.ne	e07f0 <example8.constprop.0+0x10>  // b.any
   e0814:	d65f03c0 	ret
   e0818:	d503201f 	nop
   e081c:	d503201f 	nop

00000000000e0820 <example7.constprop.0>:
   e0820:	91402801 	add	x1, x0, #0xa, lsl #12
   e0824:	91402c02 	add	x2, x0, #0xb, lsl #12
   e0828:	f9500820 	ldr	x0, [x1, #8208]
   e082c:	f8008420 	str	x0, [x1], #8
   e0830:	eb01005f 	cmp	x2, x1
   e0834:	54ffffa1 	b.ne	e0828 <example7.constprop.0+0x8>  // b.any
   e0838:	d65f03c0 	ret
   e083c:	d503201f 	nop

00000000000e0840 <example4c.constprop.0>:
   e0840:	91402801 	add	x1, x0, #0xa, lsl #12
   e0844:	91402c02 	add	x2, x0, #0xb, lsl #12
   e0848:	b9400020 	ldr	w0, [x1]
   e084c:	91001021 	add	x1, x1, #0x4
   e0850:	7100101f 	cmp	w0, #0x4
   e0854:	1a9fd7e0 	cset	w0, gt
   e0858:	531e7400 	lsl	w0, w0, #2
   e085c:	b91ffc20 	str	w0, [x1, #8188]
   e0860:	eb01005f 	cmp	x2, x1
   e0864:	54ffff21 	b.ne	e0848 <example4c.constprop.0+0x8>  // b.any
   e0868:	d65f03c0 	ret
   e086c:	d503201f 	nop

00000000000e0870 <example4b.constprop.0>:
   e0870:	d2980082 	mov	x2, #0xc004                	// #49156
   e0874:	d29c0183 	mov	x3, #0xe00c                	// #57356
   e0878:	91402805 	add	x5, x0, #0xa, lsl #12
   e087c:	8b020004 	add	x4, x0, x2
   e0880:	8b030003 	add	x3, x0, x3
   e0884:	d2800001 	mov	x1, #0x0                   	// #0
   e0888:	b8616880 	ldr	w0, [x4, x1]
   e088c:	b8616862 	ldr	w2, [x3, x1]
   e0890:	0b020000 	add	w0, w0, w2
   e0894:	b82168a0 	str	w0, [x5, x1]
   e0898:	91001021 	add	x1, x1, #0x4
   e089c:	f13f603f 	cmp	x1, #0xfd8
   e08a0:	54ffff41 	b.ne	e0888 <example4b.constprop.0+0x18>  // b.any
   e08a4:	d65f03c0 	ret
   e08a8:	d503201f 	nop
   e08ac:	d503201f 	nop

00000000000e08b0 <example4a.constprop.0>:
   e08b0:	d2800002 	mov	x2, #0x0                   	// #0
   e08b4:	d503201f 	nop
   e08b8:	b8626823 	ldr	w3, [x1, x2]
   e08bc:	11001463 	add	w3, w3, #0x5
   e08c0:	b8226803 	str	w3, [x0, x2]
   e08c4:	91001042 	add	x2, x2, #0x4
   e08c8:	f140045f 	cmp	x2, #0x1, lsl #12
   e08cc:	54ffff61 	b.ne	e08b8 <example4a.constprop.0+0x8>  // b.any
   e08d0:	d65f03c0 	ret

00000000000e08d4 <example3.constprop.0>:
   e08d4:	d2800002 	mov	x2, #0x0                   	// #0
   e08d8:	f8626823 	ldr	x3, [x1, x2]
   e08dc:	f8226803 	str	x3, [x0, x2]
   e08e0:	91002042 	add	x2, x2, #0x8
   e08e4:	f140045f 	cmp	x2, #0x1, lsl #12
   e08e8:	54ffff81 	b.ne	e08d8 <example3.constprop.0+0x4>  // b.any
   e08ec:	d65f03c0 	ret

00000000000e08f0 <example2b.constprop.0>:
   e08f0:	91402801 	add	x1, x0, #0xa, lsl #12
   e08f4:	91402c02 	add	x2, x0, #0xb, lsl #12
   e08f8:	f9500023 	ldr	x3, [x1, #8192]
   e08fc:	f9600020 	ldr	x0, [x1, #16384]
   e0900:	8a030000 	and	x0, x0, x3
   e0904:	f8008420 	str	x0, [x1], #8
   e0908:	eb01005f 	cmp	x2, x1
   e090c:	54ffff61 	b.ne	e08f8 <example2b.constprop.0+0x8>  // b.any
   e0910:	d65f03c0 	ret

00000000000e0914 <example2a.constprop.0>:
   e0914:	91403001 	add	x1, x0, #0xc, lsl #12
   e0918:	91403400 	add	x0, x0, #0xd, lsl #12
   e091c:	b21f03e2 	mov	x2, #0x200000002           	// #8589934594
   e0920:	f8008422 	str	x2, [x1], #8
   e0924:	eb00003f 	cmp	x1, x0
   e0928:	54ffffc1 	b.ne	e0920 <example2a.constprop.0+0xc>  // b.any
   e092c:	d65f03c0 	ret

00000000000e0930 <dump_regs>:
   e0930:	d40000c1 	svc	#0x6
   e0934:	d65f03c0 	ret
   e0938:	d503201f 	nop
   e093c:	d503201f 	nop

00000000000e0940 <example1>:
   e0940:	91402805 	add	x5, x0, #0xa, lsl #12
   e0944:	91403004 	add	x4, x0, #0xc, lsl #12
   e0948:	91403803 	add	x3, x0, #0xe, lsl #12
   e094c:	d2800001 	mov	x1, #0x0                   	// #0
   e0950:	b8616880 	ldr	w0, [x4, x1]
   e0954:	b8616862 	ldr	w2, [x3, x1]
   e0958:	0b020000 	add	w0, w0, w2
   e095c:	b82168a0 	str	w0, [x5, x1]
   e0960:	91001021 	add	x1, x1, #0x4
   e0964:	f110003f 	cmp	x1, #0x400
   e0968:	54ffff41 	b.ne	e0950 <example1+0x10>  // b.any
   e096c:	d65f03c0 	ret

00000000000e0970 <example2a>:
   e0970:	2a0103e5 	mov	w5, w1
   e0974:	7100003f 	cmp	w1, #0x0
   e0978:	5400024d 	b.le	e09c0 <example2a+0x50>
   e097c:	7100043f 	cmp	w1, #0x1
   e0980:	54000220 	b.eq	e09c4 <example2a+0x54>  // b.none
   e0984:	d2800001 	mov	x1, #0x0                   	// #0
   e0988:	53017ca4 	lsr	w4, w5, #1
   e098c:	b3407c41 	bfxil	x1, x2, #0, #32
   e0990:	91403003 	add	x3, x0, #0xc, lsl #12
   e0994:	8b244c64 	add	x4, x3, w4, uxtw #3
   e0998:	b3607c41 	bfi	x1, x2, #32, #32
   e099c:	d503201f 	nop
   e09a0:	f8008461 	str	x1, [x3], #8
   e09a4:	eb04007f 	cmp	x3, x4
   e09a8:	54ffffc1 	b.ne	e09a0 <example2a+0x30>  // b.any
   e09ac:	121f78a1 	and	w1, w5, #0xfffffffe
   e09b0:	36000085 	tbz	w5, #0, e09c0 <example2a+0x50>
   e09b4:	93407c21 	sxtw	x1, w1
   e09b8:	91400c21 	add	x1, x1, #0x3, lsl #12
   e09bc:	b8217802 	str	w2, [x0, x1, lsl #2]
   e09c0:	d65f03c0 	ret
   e09c4:	52800001 	mov	w1, #0x0                   	// #0
   e09c8:	17fffffb 	b	e09b4 <example2a+0x44>
   e09cc:	d503201f 	nop

00000000000e09d0 <example2b>:
   e09d0:	aa0003e5 	mov	x5, x0
   e09d4:	340002c1 	cbz	w1, e0a2c <example2b+0x5c>
   e09d8:	7100043f 	cmp	w1, #0x1
   e09dc:	540002a0 	b.eq	e0a30 <example2b+0x60>  // b.none
   e09e0:	53017c20 	lsr	w0, w1, #1
   e09e4:	914028a2 	add	x2, x5, #0xa, lsl #12
   e09e8:	8b204c40 	add	x0, x2, w0, uxtw #3
   e09ec:	d503201f 	nop
   e09f0:	f9500043 	ldr	x3, [x2, #8192]
   e09f4:	f9600044 	ldr	x4, [x2, #16384]
   e09f8:	8a040063 	and	x3, x3, x4
   e09fc:	f8008443 	str	x3, [x2], #8
   e0a00:	eb02001f 	cmp	x0, x2
   e0a04:	54ffff61 	b.ne	e09f0 <example2b+0x20>  // b.any
   e0a08:	121f7820 	and	w0, w1, #0xfffffffe
   e0a0c:	36000101 	tbz	w1, #0, e0a2c <example2b+0x5c>
   e0a10:	8b20c8a0 	add	x0, x5, w0, sxtw #2
   e0a14:	91403001 	add	x1, x0, #0xc, lsl #12
   e0a18:	91402000 	add	x0, x0, #0x8, lsl #12
   e0a1c:	b9400022 	ldr	w2, [x1]
   e0a20:	b9600021 	ldr	w1, [x1, #8192]
   e0a24:	0a020021 	and	w1, w1, w2
   e0a28:	b9200001 	str	w1, [x0, #8192]
   e0a2c:	d65f03c0 	ret
   e0a30:	52800000 	mov	w0, #0x0                   	// #0
   e0a34:	17fffff7 	b	e0a10 <example2b+0x40>
   e0a38:	d503201f 	nop
   e0a3c:	d503201f 	nop

00000000000e0a40 <example3>:
   e0a40:	34000241 	cbz	w1, e0a88 <example3+0x48>
   e0a44:	7100043f 	cmp	w1, #0x1
   e0a48:	540001c0 	b.eq	e0a80 <example3+0x40>  // b.none
   e0a4c:	53017c25 	lsr	w5, w1, #1
   e0a50:	d2800000 	mov	x0, #0x0                   	// #0
   e0a54:	d37df0a5 	lsl	x5, x5, #3
   e0a58:	f8606864 	ldr	x4, [x3, x0]
   e0a5c:	f8206844 	str	x4, [x2, x0]
   e0a60:	91002000 	add	x0, x0, #0x8
   e0a64:	eb0000bf 	cmp	x5, x0
   e0a68:	54ffff81 	b.ne	e0a58 <example3+0x18>  // b.any
   e0a6c:	121f7820 	and	w0, w1, #0xfffffffe
   e0a70:	360000c1 	tbz	w1, #0, e0a88 <example3+0x48>
   e0a74:	d37ef400 	lsl	x0, x0, #2
   e0a78:	8b000042 	add	x2, x2, x0
   e0a7c:	8b000063 	add	x3, x3, x0
   e0a80:	b9400060 	ldr	w0, [x3]
   e0a84:	b9000040 	str	w0, [x2]
   e0a88:	d65f03c0 	ret
   e0a8c:	d503201f 	nop

00000000000e0a90 <example4a>:
   e0a90:	34000141 	cbz	w1, e0ab8 <example4a+0x28>
   e0a94:	d37e7c24 	ubfiz	x4, x1, #2, #32
   e0a98:	d2800000 	mov	x0, #0x0                   	// #0
   e0a9c:	d503201f 	nop
   e0aa0:	b8606861 	ldr	w1, [x3, x0]
   e0aa4:	11001421 	add	w1, w1, #0x5
   e0aa8:	b8206841 	str	w1, [x2, x0]
   e0aac:	91001000 	add	x0, x0, #0x4
   e0ab0:	eb04001f 	cmp	x0, x4
   e0ab4:	54ffff61 	b.ne	e0aa0 <example4a+0x10>  // b.any
   e0ab8:	d65f03c0 	ret
   e0abc:	d503201f 	nop

00000000000e0ac0 <example4b>:
   e0ac0:	7100003f 	cmp	w1, #0x0
   e0ac4:	5400020d 	b.le	e0b04 <example4b+0x44>
   e0ac8:	937e7c24 	sbfiz	x4, x1, #2, #32
   e0acc:	91402806 	add	x6, x0, #0xa, lsl #12
   e0ad0:	d2980081 	mov	x1, #0xc004                	// #49156
   e0ad4:	d29c0182 	mov	x2, #0xe00c                	// #57356
   e0ad8:	8b010005 	add	x5, x0, x1
   e0adc:	8b020003 	add	x3, x0, x2
   e0ae0:	d2800000 	mov	x0, #0x0                   	// #0
   e0ae4:	d503201f 	nop
   e0ae8:	b86068a1 	ldr	w1, [x5, x0]
   e0aec:	b8606862 	ldr	w2, [x3, x0]
   e0af0:	0b020021 	add	w1, w1, w2
   e0af4:	b82068c1 	str	w1, [x6, x0]
   e0af8:	91001000 	add	x0, x0, #0x4
   e0afc:	eb00009f 	cmp	x4, x0
   e0b00:	54ffff41 	b.ne	e0ae8 <example4b+0x28>  // b.any
   e0b04:	d65f03c0 	ret
   e0b08:	d503201f 	nop
   e0b0c:	d503201f 	nop

00000000000e0b10 <example4c>:
   e0b10:	7100003f 	cmp	w1, #0x0
   e0b14:	5400016d 	b.le	e0b40 <example4c+0x30>
   e0b18:	91402800 	add	x0, x0, #0xa, lsl #12
   e0b1c:	8b21c802 	add	x2, x0, w1, sxtw #2
   e0b20:	b9400001 	ldr	w1, [x0]
   e0b24:	91001000 	add	x0, x0, #0x4
   e0b28:	7100103f 	cmp	w1, #0x4
   e0b2c:	1a9fd7e1 	cset	w1, gt
   e0b30:	531e7421 	lsl	w1, w1, #2
   e0b34:	b91ffc01 	str	w1, [x0, #8188]
   e0b38:	eb00005f 	cmp	x2, x0
   e0b3c:	54ffff21 	b.ne	e0b20 <example4c+0x10>  // b.any
   e0b40:	d65f03c0 	ret

00000000000e0b44 <example5>:
   e0b44:	2a0103e4 	mov	w4, w1
   e0b48:	7100003f 	cmp	w1, #0x0
   e0b4c:	5400024d 	b.le	e0b94 <example5+0x50>
   e0b50:	7100043f 	cmp	w1, #0x1
   e0b54:	54000220 	b.eq	e0b98 <example5+0x54>  // b.none
   e0b58:	53017c23 	lsr	w3, w1, #1
   e0b5c:	91402402 	add	x2, x0, #0x9, lsl #12
   e0b60:	d28000a1 	mov	x1, #0x5                   	// #5
   e0b64:	8b234c43 	add	x3, x2, w3, uxtw #3
   e0b68:	f2c000a1 	movk	x1, #0x5, lsl #32
   e0b6c:	d503201f 	nop
   e0b70:	f8008441 	str	x1, [x2], #8
   e0b74:	eb03005f 	cmp	x2, x3
   e0b78:	54ffffc1 	b.ne	e0b70 <example5+0x2c>  // b.any
   e0b7c:	121f7881 	and	w1, w4, #0xfffffffe
   e0b80:	360000a4 	tbz	w4, #0, e0b94 <example5+0x50>
   e0b84:	d2848003 	mov	x3, #0x2400                	// #9216
   e0b88:	528000a2 	mov	w2, #0x5                   	// #5
   e0b8c:	8b21c061 	add	x1, x3, w1, sxtw
   e0b90:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0b94:	d65f03c0 	ret
   e0b98:	52800001 	mov	w1, #0x0                   	// #0
   e0b9c:	17fffffa 	b	e0b84 <example5+0x40>

00000000000e0ba0 <example7>:
   e0ba0:	93407c22 	sxtw	x2, w1
   e0ba4:	91400c43 	add	x3, x2, #0x3, lsl #12
   e0ba8:	d37ef463 	lsl	x3, x3, #2
   e0bac:	8b030001 	add	x1, x0, x3
   e0bb0:	f240083f 	tst	x1, #0x7
   e0bb4:	54000121 	b.ne	e0bd8 <example7+0x38>  // b.any
   e0bb8:	91402803 	add	x3, x0, #0xa, lsl #12
   e0bbc:	d2800000 	mov	x0, #0x0                   	// #0
   e0bc0:	f8606822 	ldr	x2, [x1, x0]
   e0bc4:	f8206862 	str	x2, [x3, x0]
   e0bc8:	91002000 	add	x0, x0, #0x8
   e0bcc:	f140041f 	cmp	x0, #0x1, lsl #12
   e0bd0:	54ffff81 	b.ne	e0bc0 <example7+0x20>  // b.any
   e0bd4:	d65f03c0 	ret
   e0bd8:	8b030000 	add	x0, x0, x3
   e0bdc:	cb020be3 	neg	x3, x2, lsl #2
   e0be0:	d1400863 	sub	x3, x3, #0x2, lsl #12
   e0be4:	91400402 	add	x2, x0, #0x1, lsl #12
   e0be8:	aa0103e0 	mov	x0, x1
   e0bec:	d503201f 	nop
   e0bf0:	b9400001 	ldr	w1, [x0]
   e0bf4:	b8236801 	str	w1, [x0, x3]
   e0bf8:	91001000 	add	x0, x0, #0x4
   e0bfc:	eb02001f 	cmp	x0, x2
   e0c00:	54ffff81 	b.ne	e0bf0 <example7+0x50>  // b.any
   e0c04:	d65f03c0 	ret
   e0c08:	d503201f 	nop
   e0c0c:	d503201f 	nop

00000000000e0c10 <example8>:
   e0c10:	2a0103e6 	mov	w6, w1
   e0c14:	91404804 	add	x4, x0, #0x12, lsl #12
   e0c18:	91404c02 	add	x2, x0, #0x13, lsl #12
   e0c1c:	9140cc05 	add	x5, x0, #0x33, lsl #12
   e0c20:	d2800001 	mov	x1, #0x0                   	// #0
   e0c24:	aa0403e0 	mov	x0, x4
   e0c28:	b3407cc1 	bfxil	x1, x6, #0, #32
   e0c2c:	b3607cc1 	bfi	x1, x6, #32, #32
   e0c30:	f8008401 	str	x1, [x0], #8
   e0c34:	eb02001f 	cmp	x0, x2
   e0c38:	54ffffc1 	b.ne	e0c30 <example8+0x20>  // b.any
   e0c3c:	91400402 	add	x2, x0, #0x1, lsl #12
   e0c40:	91400484 	add	x4, x4, #0x1, lsl #12
   e0c44:	eb05005f 	cmp	x2, x5
   e0c48:	54fffec1 	b.ne	e0c20 <example8+0x10>  // b.any
   e0c4c:	d65f03c0 	ret

00000000000e0c50 <example9>:
   e0c50:	91401802 	add	x2, x0, #0x6, lsl #12
   e0c54:	91401c05 	add	x5, x0, #0x7, lsl #12
   e0c58:	52800003 	mov	w3, #0x0                   	// #0
   e0c5c:	d503201f 	nop
   e0c60:	b9400040 	ldr	w0, [x2]
   e0c64:	91001042 	add	x2, x2, #0x4
   e0c68:	b94ffc44 	ldr	w4, [x2, #4092]
   e0c6c:	4b040000 	sub	w0, w0, w4
   e0c70:	0b000063 	add	w3, w3, w0
   e0c74:	eb0200bf 	cmp	x5, x2
   e0c78:	54ffff41 	b.ne	e0c60 <example9+0x10>  // b.any
   e0c7c:	b9000023 	str	w3, [x1]
   e0c80:	d65f03c0 	ret

00000000000e0c84 <example10a>:
   e0c84:	91400c02 	add	x2, x0, #0x3, lsl #12
   e0c88:	91200001 	add	x1, x0, #0x800
   e0c8c:	91400406 	add	x6, x0, #0x1, lsl #12
   e0c90:	b9500043 	ldr	w3, [x2, #4096]
   e0c94:	b9600045 	ldr	w5, [x2, #8192]
   e0c98:	79500020 	ldrh	w0, [x1, #2048]
   e0c9c:	79600024 	ldrh	w4, [x1, #4096]
   e0ca0:	0b050063 	add	w3, w3, w5
   e0ca4:	b8004443 	str	w3, [x2], #4
   e0ca8:	0b040000 	add	w0, w0, w4
   e0cac:	78002420 	strh	w0, [x1], #2
   e0cb0:	eb0100df 	cmp	x6, x1
   e0cb4:	54fffee1 	b.ne	e0c90 <example10a+0xc>  // b.any
   e0cb8:	d65f03c0 	ret
   e0cbc:	d503201f 	nop

00000000000e0cc0 <example10b>:
   e0cc0:	91400c03 	add	x3, x0, #0x3, lsl #12
   e0cc4:	91400402 	add	x2, x0, #0x1, lsl #12
   e0cc8:	d2800001 	mov	x1, #0x0                   	// #0
   e0ccc:	d503201f 	nop
   e0cd0:	78e17840 	ldrsh	w0, [x2, x1, lsl #1]
   e0cd4:	b8217860 	str	w0, [x3, x1, lsl #2]
   e0cd8:	91000421 	add	x1, x1, #0x1
   e0cdc:	f110003f 	cmp	x1, #0x400
   e0ce0:	54ffff81 	b.ne	e0cd0 <example10b+0x10>  // b.any
   e0ce4:	d65f03c0 	ret
   e0ce8:	d503201f 	nop
   e0cec:	d503201f 	nop

00000000000e0cf0 <example11>:
   e0cf0:	91403001 	add	x1, x0, #0xc, lsl #12
   e0cf4:	91402808 	add	x8, x0, #0xa, lsl #12
   e0cf8:	91404007 	add	x7, x0, #0x10, lsl #12
   e0cfc:	d2800002 	mov	x2, #0x0                   	// #0
   e0d00:	29401025 	ldp	w5, w4, [x1]
   e0d04:	91002021 	add	x1, x1, #0x8
   e0d08:	b95ffc20 	ldr	w0, [x1, #8188]
   e0d0c:	b95ff823 	ldr	w3, [x1, #8184]
   e0d10:	1b007c86 	mul	w6, w4, w0
   e0d14:	1b037c84 	mul	w4, w4, w3
   e0d18:	1b0398a3 	msub	w3, w5, w3, w6
   e0d1c:	1b051000 	madd	w0, w0, w5, w4
   e0d20:	b8227903 	str	w3, [x8, x2, lsl #2]
   e0d24:	b82278e0 	str	w0, [x7, x2, lsl #2]
   e0d28:	91000442 	add	x2, x2, #0x1
   e0d2c:	f108005f 	cmp	x2, #0x200
   e0d30:	54fffe81 	b.ne	e0d00 <example11+0x10>  // b.any
   e0d34:	d65f03c0 	ret
   e0d38:	d503201f 	nop
   e0d3c:	d503201f 	nop

00000000000e0d40 <example12>:
   e0d40:	b0000001 	adrp	x1, e1000 <memset>
   e0d44:	91402803 	add	x3, x0, #0xa, lsl #12
   e0d48:	91402c09 	add	x9, x0, #0xb, lsl #12
   e0d4c:	d2c00022 	mov	x2, #0x100000000           	// #4294967296
   e0d50:	f9410421 	ldr	x1, [x1, #520]
   e0d54:	d503201f 	nop
   e0d58:	11001048 	add	w8, w2, #0x4
   e0d5c:	11001027 	add	w7, w1, #0x4
   e0d60:	9360fc46 	asr	x6, x2, #32
   e0d64:	9360fc25 	asr	x5, x1, #32
   e0d68:	d2800004 	mov	x4, #0x0                   	// #0
   e0d6c:	d2800000 	mov	x0, #0x0                   	// #0
   e0d70:	b3407d04 	bfxil	x4, x8, #0, #32
   e0d74:	110010c6 	add	w6, w6, #0x4
   e0d78:	b3407ce0 	bfxil	x0, x7, #0, #32
   e0d7c:	110010a5 	add	w5, w5, #0x4
   e0d80:	a9000462 	stp	x2, x1, [x3]
   e0d84:	b3607cc4 	bfi	x4, x6, #32, #32
   e0d88:	b3607ca0 	bfi	x0, x5, #32, #32
   e0d8c:	91004063 	add	x3, x3, #0x10
   e0d90:	aa0403e2 	mov	x2, x4
   e0d94:	aa0003e1 	mov	x1, x0
   e0d98:	eb09007f 	cmp	x3, x9
   e0d9c:	54fffde1 	b.ne	e0d58 <example12+0x18>  // b.any
   e0da0:	d65f03c0 	ret

00000000000e0da4 <example13>:
   e0da4:	aa0103e9 	mov	x9, x1
   e0da8:	aa0203e8 	mov	x8, x2
   e0dac:	aa0303e7 	mov	x7, x3
   e0db0:	d2800006 	mov	x6, #0x0                   	// #0
   e0db4:	d503201f 	nop
   e0db8:	f8667925 	ldr	x5, [x9, x6, lsl #3]
   e0dbc:	d2800000 	mov	x0, #0x0                   	// #0
   e0dc0:	f8667904 	ldr	x4, [x8, x6, lsl #3]
   e0dc4:	52800002 	mov	w2, #0x0                   	// #0
   e0dc8:	b86068a1 	ldr	w1, [x5, x0]
   e0dcc:	b8606883 	ldr	w3, [x4, x0]
   e0dd0:	91008000 	add	x0, x0, #0x20
   e0dd4:	4b030021 	sub	w1, w1, w3
   e0dd8:	0b010042 	add	w2, w2, w1
   e0ddc:	f140041f 	cmp	x0, #0x1, lsl #12
   e0de0:	54ffff41 	b.ne	e0dc8 <example13+0x24>  // b.any
   e0de4:	b82678e2 	str	w2, [x7, x6, lsl #2]
   e0de8:	910004c6 	add	x6, x6, #0x1
   e0dec:	f10080df 	cmp	x6, #0x20
   e0df0:	54fffe41 	b.ne	e0db8 <example13+0x14>  // b.any
   e0df4:	d65f03c0 	ret
   e0df8:	d503201f 	nop
   e0dfc:	d503201f 	nop

00000000000e0e00 <example14>:
   e0e00:	aa0103e5 	mov	x5, x1
   e0e04:	aa0203e6 	mov	x6, x2
   e0e08:	aa0303e8 	mov	x8, x3
   e0e0c:	d2800007 	mov	x7, #0x0                   	// #0
   e0e10:	d2800001 	mov	x1, #0x0                   	// #0
   e0e14:	52800002 	mov	w2, #0x0                   	// #0
   e0e18:	d2800000 	mov	x0, #0x0                   	// #0
   e0e1c:	d503201f 	nop
   e0e20:	f86068a4 	ldr	x4, [x5, x0]
   e0e24:	f86068c3 	ldr	x3, [x6, x0]
   e0e28:	91002000 	add	x0, x0, #0x8
   e0e2c:	b8616884 	ldr	w4, [x4, x1]
   e0e30:	b8616863 	ldr	w3, [x3, x1]
   e0e34:	1b030882 	madd	w2, w4, w3, w2
   e0e38:	f140081f 	cmp	x0, #0x2, lsl #12
   e0e3c:	54ffff21 	b.ne	e0e20 <example14+0x20>  // b.any
   e0e40:	91001021 	add	x1, x1, #0x4
   e0e44:	f102003f 	cmp	x1, #0x80
   e0e48:	54fffe81 	b.ne	e0e18 <example14+0x18>  // b.any
   e0e4c:	b8277902 	str	w2, [x8, x7, lsl #2]
   e0e50:	910004e7 	add	x7, x7, #0x1
   e0e54:	910020a5 	add	x5, x5, #0x8
   e0e58:	f10010ff 	cmp	x7, #0x4
   e0e5c:	54fffda1 	b.ne	e0e10 <example14+0x10>  // b.any
   e0e60:	d65f03c0 	ret

00000000000e0e64 <example23>:
   e0e64:	d2800000 	mov	x0, #0x0                   	// #0
   e0e68:	78607823 	ldrh	w3, [x1, x0, lsl #1]
   e0e6c:	53196063 	lsl	w3, w3, #7
   e0e70:	b8207843 	str	w3, [x2, x0, lsl #2]
   e0e74:	91000400 	add	x0, x0, #0x1
   e0e78:	f104001f 	cmp	x0, #0x100
   e0e7c:	54ffff61 	b.ne	e0e68 <example23+0x4>  // b.any
   e0e80:	d65f03c0 	ret

00000000000e0e84 <init_memory>:
   e0e84:	eb01001f 	cmp	x0, x1
   e0e88:	540001a0 	b.eq	e0ebc <init_memory+0x38>  // b.none
   e0e8c:	52800023 	mov	w3, #0x1                   	// #1
   e0e90:	528004e4 	mov	w4, #0x27                  	// #39
   e0e94:	d503201f 	nop
   e0e98:	531d1062 	ubfiz	w2, w3, #3, #5
   e0e9c:	4b030042 	sub	w2, w2, w3
   e0ea0:	12001c42 	and	w2, w2, #0xff
   e0ea4:	4a040042 	eor	w2, w2, w4
   e0ea8:	11000442 	add	w2, w2, #0x1
   e0eac:	12001c43 	and	w3, w2, #0xff
   e0eb0:	38001403 	strb	w3, [x0], #1
   e0eb4:	eb00003f 	cmp	x1, x0
   e0eb8:	54ffff01 	b.ne	e0e98 <init_memory+0x14>  // b.any
   e0ebc:	d65f03c0 	ret

00000000000e0ec0 <digest_memory>:
   e0ec0:	aa0003e3 	mov	x3, x0
   e0ec4:	52800020 	mov	w0, #0x1                   	// #1
   e0ec8:	eb01007f 	cmp	x3, x1
   e0ecc:	54000100 	b.eq	e0eec <digest_memory+0x2c>  // b.none
   e0ed0:	38401462 	ldrb	w2, [x3], #1
   e0ed4:	0b000400 	add	w0, w0, w0, lsl #1
   e0ed8:	4a000042 	eor	w2, w2, w0
   e0edc:	53185c40 	lsl	w0, w2, #8
   e0ee0:	4a422000 	eor	w0, w0, w2, lsr #8
   e0ee4:	eb03003f 	cmp	x1, x3
   e0ee8:	54ffff41 	b.ne	e0ed0 <digest_memory+0x10>  // b.any
   e0eec:	d65f03c0 	ret

00000000000e0ef0 <memcpy>:
   e0ef0:	b4000222 	cbz	x2, e0f34 <memcpy+0x44>
   e0ef4:	d1000443 	sub	x3, x2, #0x1
   e0ef8:	f1001c7f 	cmp	x3, #0x7
   e0efc:	54000729 	b.ls	e0fe0 <memcpy+0xf0>  // b.plast
   e0f00:	aa010005 	orr	x5, x0, x1
   e0f04:	91000424 	add	x4, x1, #0x1
   e0f08:	cb040004 	sub	x4, x0, x4
   e0f0c:	d2800003 	mov	x3, #0x0                   	// #0
   e0f10:	f24008bf 	tst	x5, #0x7
   e0f14:	fa460880 	ccmp	x4, #0x6, #0x0, eq	// eq = none
   e0f18:	54000108 	b.hi	e0f38 <memcpy+0x48>  // b.pmore
   e0f1c:	d503201f 	nop
   e0f20:	38636824 	ldrb	w4, [x1, x3]
   e0f24:	38236804 	strb	w4, [x0, x3]
   e0f28:	91000463 	add	x3, x3, #0x1
   e0f2c:	eb03005f 	cmp	x2, x3
   e0f30:	54ffff81 	b.ne	e0f20 <memcpy+0x30>  // b.any
   e0f34:	d65f03c0 	ret
   e0f38:	927df044 	and	x4, x2, #0xfffffffffffffff8
   e0f3c:	d503201f 	nop
   e0f40:	f8636825 	ldr	x5, [x1, x3]
   e0f44:	f8236805 	str	x5, [x0, x3]
   e0f48:	91002063 	add	x3, x3, #0x8
   e0f4c:	eb03009f 	cmp	x4, x3
   e0f50:	54ffff81 	b.ne	e0f40 <memcpy+0x50>  // b.any
   e0f54:	eb04005f 	cmp	x2, x4
   e0f58:	54fffee0 	b.eq	e0f34 <memcpy+0x44>  // b.none
   e0f5c:	38646825 	ldrb	w5, [x1, x4]
   e0f60:	91000483 	add	x3, x4, #0x1
   e0f64:	38246805 	strb	w5, [x0, x4]
   e0f68:	eb03005f 	cmp	x2, x3
   e0f6c:	54fffe40 	b.eq	e0f34 <memcpy+0x44>  // b.none
   e0f70:	38636826 	ldrb	w6, [x1, x3]
   e0f74:	91000885 	add	x5, x4, #0x2
   e0f78:	38236806 	strb	w6, [x0, x3]
   e0f7c:	eb05005f 	cmp	x2, x5
   e0f80:	54fffda0 	b.eq	e0f34 <memcpy+0x44>  // b.none
   e0f84:	38656826 	ldrb	w6, [x1, x5]
   e0f88:	91000c83 	add	x3, x4, #0x3
   e0f8c:	38256806 	strb	w6, [x0, x5]
   e0f90:	eb03005f 	cmp	x2, x3
   e0f94:	54fffd00 	b.eq	e0f34 <memcpy+0x44>  // b.none
   e0f98:	38636826 	ldrb	w6, [x1, x3]
   e0f9c:	91001085 	add	x5, x4, #0x4
   e0fa0:	38236806 	strb	w6, [x0, x3]
   e0fa4:	eb05005f 	cmp	x2, x5
   e0fa8:	54fffc60 	b.eq	e0f34 <memcpy+0x44>  // b.none
   e0fac:	38656826 	ldrb	w6, [x1, x5]
   e0fb0:	91001483 	add	x3, x4, #0x5
   e0fb4:	38256806 	strb	w6, [x0, x5]
   e0fb8:	eb03005f 	cmp	x2, x3
   e0fbc:	54fffbc0 	b.eq	e0f34 <memcpy+0x44>  // b.none
   e0fc0:	38636825 	ldrb	w5, [x1, x3]
   e0fc4:	91001884 	add	x4, x4, #0x6
   e0fc8:	38236805 	strb	w5, [x0, x3]
   e0fcc:	eb04005f 	cmp	x2, x4
   e0fd0:	54fffb20 	b.eq	e0f34 <memcpy+0x44>  // b.none
   e0fd4:	38646821 	ldrb	w1, [x1, x4]
   e0fd8:	38246801 	strb	w1, [x0, x4]
   e0fdc:	d65f03c0 	ret
   e0fe0:	d2800003 	mov	x3, #0x0                   	// #0
   e0fe4:	38636824 	ldrb	w4, [x1, x3]
   e0fe8:	38236804 	strb	w4, [x0, x3]
   e0fec:	91000463 	add	x3, x3, #0x1
   e0ff0:	eb03005f 	cmp	x2, x3
   e0ff4:	54fff961 	b.ne	e0f20 <memcpy+0x30>  // b.any
   e0ff8:	17ffffcf 	b	e0f34 <memcpy+0x44>
   e0ffc:	d503201f 	nop

00000000000e1000 <memset>:
   e1000:	b4000ce2 	cbz	x2, e119c <memset+0x19c>
   e1004:	cb0003e7 	neg	x7, x0
   e1008:	d2800168 	mov	x8, #0xb                   	// #11
   e100c:	924008e3 	and	x3, x7, #0x7
   e1010:	d1000446 	sub	x6, x2, #0x1
   e1014:	91001c65 	add	x5, x3, #0x7
   e1018:	12001c24 	and	w4, w1, #0xff
   e101c:	eb0800bf 	cmp	x5, x8
   e1020:	9a8820a5 	csel	x5, x5, x8, cs	// cs = hs, nlast
   e1024:	eb0500df 	cmp	x6, x5
   e1028:	54000c83 	b.cc	e11b8 <memset+0x1b8>  // b.lo, b.ul, b.last
   e102c:	b4000c23 	cbz	x3, e11b0 <memset+0x1b0>
   e1030:	39000004 	strb	w4, [x0]
   e1034:	f27f04ff 	tst	x7, #0x6
   e1038:	54000b80 	b.eq	e11a8 <memset+0x1a8>  // b.none
   e103c:	39000404 	strb	w4, [x0, #1]
   e1040:	f100087f 	cmp	x3, #0x2
   e1044:	54000be9 	b.ls	e11c0 <memset+0x1c0>  // b.plast
   e1048:	39000804 	strb	w4, [x0, #2]
   e104c:	36100aa7 	tbz	w7, #2, e11a0 <memset+0x1a0>
   e1050:	39000c04 	strb	w4, [x0, #3]
   e1054:	f100107f 	cmp	x3, #0x4
   e1058:	54000b89 	b.ls	e11c8 <memset+0x1c8>  // b.plast
   e105c:	39001004 	strb	w4, [x0, #4]
   e1060:	f100147f 	cmp	x3, #0x5
   e1064:	54000b60 	b.eq	e11d0 <memset+0x1d0>  // b.none
   e1068:	39001404 	strb	w4, [x0, #5]
   e106c:	f1001c7f 	cmp	x3, #0x7
   e1070:	54000b41 	b.ne	e11d8 <memset+0x1d8>  // b.any
   e1074:	aa0303e6 	mov	x6, x3
   e1078:	39001804 	strb	w4, [x0, #6]
   e107c:	d2800005 	mov	x5, #0x0                   	// #0
   e1080:	cb030049 	sub	x9, x2, x3
   e1084:	b3401c85 	bfxil	x5, x4, #0, #8
   e1088:	8b030001 	add	x1, x0, x3
   e108c:	927df128 	and	x8, x9, #0xfffffffffffffff8
   e1090:	b3781c85 	bfi	x5, x4, #8, #8
   e1094:	8b080027 	add	x7, x1, x8
   e1098:	b3701c85 	bfi	x5, x4, #16, #8
   e109c:	b3681c85 	bfi	x5, x4, #24, #8
   e10a0:	b3601c85 	bfi	x5, x4, #32, #8
   e10a4:	b3581c85 	bfi	x5, x4, #40, #8
   e10a8:	b3501c85 	bfi	x5, x4, #48, #8
   e10ac:	b3481c85 	bfi	x5, x4, #56, #8
   e10b0:	f8008425 	str	x5, [x1], #8
   e10b4:	eb0100ff 	cmp	x7, x1
   e10b8:	54ffffc1 	b.ne	e10b0 <memset+0xb0>  // b.any
   e10bc:	8b0800c1 	add	x1, x6, x8
   e10c0:	eb08013f 	cmp	x9, x8
   e10c4:	540006c0 	b.eq	e119c <memset+0x19c>  // b.none
   e10c8:	91000423 	add	x3, x1, #0x1
   e10cc:	38216804 	strb	w4, [x0, x1]
   e10d0:	eb03005f 	cmp	x2, x3
   e10d4:	54000640 	b.eq	e119c <memset+0x19c>  // b.none
   e10d8:	91000825 	add	x5, x1, #0x2
   e10dc:	38236804 	strb	w4, [x0, x3]
   e10e0:	eb05005f 	cmp	x2, x5
   e10e4:	540005c0 	b.eq	e119c <memset+0x19c>  // b.none
   e10e8:	91000c23 	add	x3, x1, #0x3
   e10ec:	38256804 	strb	w4, [x0, x5]
   e10f0:	eb03005f 	cmp	x2, x3
   e10f4:	54000540 	b.eq	e119c <memset+0x19c>  // b.none
   e10f8:	91001025 	add	x5, x1, #0x4
   e10fc:	38236804 	strb	w4, [x0, x3]
   e1100:	eb05005f 	cmp	x2, x5
   e1104:	540004c0 	b.eq	e119c <memset+0x19c>  // b.none
   e1108:	91001423 	add	x3, x1, #0x5
   e110c:	38256804 	strb	w4, [x0, x5]
   e1110:	eb03005f 	cmp	x2, x3
   e1114:	54000440 	b.eq	e119c <memset+0x19c>  // b.none
   e1118:	91001825 	add	x5, x1, #0x6
   e111c:	38236804 	strb	w4, [x0, x3]
   e1120:	eb05005f 	cmp	x2, x5
   e1124:	540003c0 	b.eq	e119c <memset+0x19c>  // b.none
   e1128:	91001c23 	add	x3, x1, #0x7
   e112c:	38256804 	strb	w4, [x0, x5]
   e1130:	eb03005f 	cmp	x2, x3
   e1134:	54000340 	b.eq	e119c <memset+0x19c>  // b.none
   e1138:	91002025 	add	x5, x1, #0x8
   e113c:	38236804 	strb	w4, [x0, x3]
   e1140:	eb05005f 	cmp	x2, x5
   e1144:	540002c0 	b.eq	e119c <memset+0x19c>  // b.none
   e1148:	91002423 	add	x3, x1, #0x9
   e114c:	38256804 	strb	w4, [x0, x5]
   e1150:	eb03005f 	cmp	x2, x3
   e1154:	54000240 	b.eq	e119c <memset+0x19c>  // b.none
   e1158:	91002825 	add	x5, x1, #0xa
   e115c:	38236804 	strb	w4, [x0, x3]
   e1160:	eb05005f 	cmp	x2, x5
   e1164:	540001c0 	b.eq	e119c <memset+0x19c>  // b.none
   e1168:	91002c23 	add	x3, x1, #0xb
   e116c:	38256804 	strb	w4, [x0, x5]
   e1170:	eb03005f 	cmp	x2, x3
   e1174:	54000140 	b.eq	e119c <memset+0x19c>  // b.none
   e1178:	91003025 	add	x5, x1, #0xc
   e117c:	38236804 	strb	w4, [x0, x3]
   e1180:	eb05005f 	cmp	x2, x5
   e1184:	540000c0 	b.eq	e119c <memset+0x19c>  // b.none
   e1188:	91003421 	add	x1, x1, #0xd
   e118c:	38256804 	strb	w4, [x0, x5]
   e1190:	eb01005f 	cmp	x2, x1
   e1194:	54000040 	b.eq	e119c <memset+0x19c>  // b.none
   e1198:	38216804 	strb	w4, [x0, x1]
   e119c:	d65f03c0 	ret
   e11a0:	d2800066 	mov	x6, #0x3                   	// #3
   e11a4:	17ffffb6 	b	e107c <memset+0x7c>
   e11a8:	d2800026 	mov	x6, #0x1                   	// #1
   e11ac:	17ffffb4 	b	e107c <memset+0x7c>
   e11b0:	d2800006 	mov	x6, #0x0                   	// #0
   e11b4:	17ffffb2 	b	e107c <memset+0x7c>
   e11b8:	d2800001 	mov	x1, #0x0                   	// #0
   e11bc:	17ffffc3 	b	e10c8 <memset+0xc8>
   e11c0:	d2800046 	mov	x6, #0x2                   	// #2
   e11c4:	17ffffae 	b	e107c <memset+0x7c>
   e11c8:	d2800086 	mov	x6, #0x4                   	// #4
   e11cc:	17ffffac 	b	e107c <memset+0x7c>
   e11d0:	aa0303e6 	mov	x6, x3
   e11d4:	17ffffaa 	b	e107c <memset+0x7c>
   e11d8:	d28000c6 	mov	x6, #0x6                   	// #6
   e11dc:	17ffffa8 	b	e107c <memset+0x7c>

00000000000e11e0 <memmove>:
   e11e0:	b40000c2 	cbz	x2, e11f8 <memmove+0x18>
   e11e4:	d503201f 	nop
   e11e8:	d1000442 	sub	x2, x2, #0x1
   e11ec:	38626823 	ldrb	w3, [x1, x2]
   e11f0:	38226803 	strb	w3, [x0, x2]
   e11f4:	b5ffffa2 	cbnz	x2, e11e8 <memmove+0x8>
   e11f8:	d65f03c0 	ret
