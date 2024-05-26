
vectorization.c.elf:     file format elf64-littleaarch64


Disassembly of section .start:

00000000000e0000 <_start>:
   e0000:	d101c3ff 	sub	sp, sp, #0x70
   e0004:	d2860e10 	mov	x16, #0x3070                	// #12400
   e0008:	d140cbff 	sub	sp, sp, #0x32, lsl #12
   e000c:	d2880e11 	mov	x17, #0x4070                	// #16496
   e0010:	8b3063e9 	add	x9, sp, x16
   e0014:	8b3163e8 	add	x8, sp, x17
   e0018:	aa0903e2 	mov	x2, x9
   e001c:	52800021 	mov	w1, #0x1                   	// #1
   e0020:	a9007bfd 	stp	x29, x30, [sp]
   e0024:	910003fd 	mov	x29, sp
   e0028:	528004e3 	mov	w3, #0x27                  	// #39
   e002c:	a90153f3 	stp	x19, x20, [sp, #16]
   e0030:	a9025bf5 	stp	x21, x22, [sp, #32]
   e0034:	a90363f7 	stp	x23, x24, [sp, #48]
   e0038:	a9046bf9 	stp	x25, x26, [sp, #64]
   e003c:	f9002bfb 	str	x27, [sp, #80]
   e0040:	531d1020 	ubfiz	w0, w1, #3, #5
   e0044:	4b010000 	sub	w0, w0, w1
   e0048:	12001c00 	and	w0, w0, #0xff
   e004c:	4a030000 	eor	w0, w0, w3
   e0050:	11000400 	add	w0, w0, #0x1
   e0054:	12001c01 	and	w1, w0, #0xff
   e0058:	38001441 	strb	w1, [x2], #1
   e005c:	eb08005f 	cmp	x2, x8
   e0060:	54ffff01 	b.ne	e0040 <_start+0x40>  // b.any
   e0064:	d28a0e0f 	mov	x15, #0x5070                	// #20592
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
   e009c:	d28c0e0e 	mov	x14, #0x6070                	// #24688
   e00a0:	aa1603e3 	mov	x3, x22
   e00a4:	9101c3ea 	add	x10, sp, #0x70
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
   e00dc:	d2820e0d 	mov	x13, #0x1070                	// #4208
   e00e0:	91200143 	add	x3, x10, #0x800
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
   e0114:	d2830e0c 	mov	x12, #0x1870                	// #6256
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
   e014c:	d2840e0b 	mov	x11, #0x2070                	// #8304
   e0150:	8b2b63ec 	add	x12, sp, x11
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
   e017c:	eb0c005f 	cmp	x2, x12
   e0180:	54ffff01 	b.ne	e0160 <_start+0x160>  // b.any
   e0184:	d2940e06 	mov	x6, #0xa070                	// #41072
   e0188:	8b2663ed 	add	x13, sp, x6
   e018c:	d2980e07 	mov	x7, #0xc070                	// #49264
   e0190:	aa0d03e3 	mov	x3, x13
   e0194:	8b2763ee 	add	x14, sp, x7
   e0198:	52800022 	mov	w2, #0x1                   	// #1
   e019c:	528004e4 	mov	w4, #0x27                  	// #39
   e01a0:	531d1040 	ubfiz	w0, w2, #3, #5
   e01a4:	4b020000 	sub	w0, w0, w2
   e01a8:	12001c00 	and	w0, w0, #0xff
   e01ac:	4a040000 	eor	w0, w0, w4
   e01b0:	11000400 	add	w0, w0, #0x1
   e01b4:	12001c02 	and	w2, w0, #0xff
   e01b8:	38001462 	strb	w2, [x3], #1
   e01bc:	eb0e007f 	cmp	x3, x14
   e01c0:	54ffff01 	b.ne	e01a0 <_start+0x1a0>  // b.any
   e01c4:	d29c0e05 	mov	x5, #0xe070                	// #57456
   e01c8:	aa0e03e2 	mov	x2, x14
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
   e01fc:	914043eb 	add	x11, sp, #0x10, lsl #12
   e0200:	52800023 	mov	w3, #0x1                   	// #1
   e0204:	9101c16b 	add	x11, x11, #0x70
   e0208:	528004e4 	mov	w4, #0x27                  	// #39
   e020c:	d503201f 	nop
   e0210:	531d1060 	ubfiz	w0, w3, #3, #5
   e0214:	4b030000 	sub	w0, w0, w3
   e0218:	12001c00 	and	w0, w0, #0xff
   e021c:	4a040000 	eor	w0, w0, w4
   e0220:	11000400 	add	w0, w0, #0x1
   e0224:	12001c03 	and	w3, w0, #0xff
   e0228:	38001443 	strb	w3, [x2], #1
   e022c:	eb0b005f 	cmp	x2, x11
   e0230:	54ffff01 	b.ne	e0210 <_start+0x210>  // b.any
   e0234:	aa0c03e3 	mov	x3, x12
   e0238:	52800022 	mov	w2, #0x1                   	// #1
   e023c:	528004e4 	mov	w4, #0x27                  	// #39
   e0240:	531d1040 	ubfiz	w0, w2, #3, #5
   e0244:	4b020000 	sub	w0, w0, w2
   e0248:	12001c00 	and	w0, w0, #0xff
   e024c:	4a040000 	eor	w0, w0, w4
   e0250:	11000400 	add	w0, w0, #0x1
   e0254:	12001c02 	and	w2, w0, #0xff
   e0258:	38001462 	strb	w2, [x3], #1
   e025c:	eb09007f 	cmp	x3, x9
   e0260:	54ffff01 	b.ne	e0240 <_start+0x240>  // b.any
   e0264:	d28e0e04 	mov	x4, #0x7070                	// #28784
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
   e029c:	d2900e03 	mov	x3, #0x8070                	// #32880
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
   e02dc:	9101c273 	add	x19, x19, #0x70
   e02e0:	9101c294 	add	x20, x20, #0x70
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
   e0318:	aa0a03e0 	mov	x0, x10
   e031c:	94000199 	bl	e0980 <example1>
   e0320:	aa0a03e0 	mov	x0, x10
   e0324:	94000197 	bl	e0980 <example1>
   e0328:	710004c6 	subs	w6, w6, #0x1
   e032c:	54ffffa1 	b.ne	e0320 <_start+0x320>  // b.any
   e0330:	d2948e02 	mov	x2, #0xa470                	// #42096
   e0334:	aa0d03e1 	mov	x1, x13
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
   e0360:	aa0a03e0 	mov	x0, x10
   e0364:	9400017c 	bl	e0954 <example2a.constprop.0>
   e0368:	aa0a03e0 	mov	x0, x10
   e036c:	9400017a 	bl	e0954 <example2a.constprop.0>
   e0370:	71000463 	subs	w3, w3, #0x1
   e0374:	54ffffa1 	b.ne	e0368 <_start+0x368>  // b.any
   e0378:	d29a0e01 	mov	x1, #0xd070                	// #53360
   e037c:	8b2163e1 	add	x1, sp, x1
   e0380:	52800032 	mov	w18, #0x1                   	// #1
   e0384:	d503201f 	nop
   e0388:	384015c0 	ldrb	w0, [x14], #1
   e038c:	0b120652 	add	w18, w18, w18, lsl #1
   e0390:	4a120000 	eor	w0, w0, w18
   e0394:	53185c12 	lsl	w18, w0, #8
   e0398:	4a402252 	eor	w18, w18, w0, lsr #8
   e039c:	eb0101df 	cmp	x14, x1
   e03a0:	54ffff41 	b.ne	e0388 <_start+0x388>  // b.any
   e03a4:	52810004 	mov	w4, #0x800                 	// #2048
   e03a8:	aa0a03e0 	mov	x0, x10
   e03ac:	94000161 	bl	e0930 <example2b.constprop.0>
   e03b0:	aa0a03e0 	mov	x0, x10
   e03b4:	9400015f 	bl	e0930 <example2b.constprop.0>
   e03b8:	71000484 	subs	w4, w4, #0x1
   e03bc:	54ffffa1 	b.ne	e03b0 <_start+0x3b0>  // b.any
   e03c0:	d2960e00 	mov	x0, #0xb070                	// #45168
   e03c4:	aa0d03e1 	mov	x1, x13
   e03c8:	8b2063ee 	add	x14, sp, x0
   e03cc:	52800035 	mov	w21, #0x1                   	// #1
   e03d0:	38401420 	ldrb	w0, [x1], #1
   e03d4:	0b1506b5 	add	w21, w21, w21, lsl #1
   e03d8:	4a150000 	eor	w0, w0, w21
   e03dc:	53185c15 	lsl	w21, w0, #8
   e03e0:	4a4022b5 	eor	w21, w21, w0, lsr #8
   e03e4:	eb0e003f 	cmp	x1, x14
   e03e8:	54ffff41 	b.ne	e03d0 <_start+0x3d0>  // b.any
   e03ec:	52810004 	mov	w4, #0x800                 	// #2048
   e03f0:	aa0803e1 	mov	x1, x8
   e03f4:	aa0903e0 	mov	x0, x9
   e03f8:	94000147 	bl	e0914 <example3.constprop.0>
   e03fc:	d503201f 	nop
   e0400:	aa0803e1 	mov	x1, x8
   e0404:	aa0903e0 	mov	x0, x9
   e0408:	94000143 	bl	e0914 <example3.constprop.0>
   e040c:	71000484 	subs	w4, w4, #0x1
   e0410:	54ffff81 	b.ne	e0400 <_start+0x400>  // b.any
   e0414:	aa0903e1 	mov	x1, x9
   e0418:	52800037 	mov	w23, #0x1                   	// #1
   e041c:	d503201f 	nop
   e0420:	38401420 	ldrb	w0, [x1], #1
   e0424:	0b1706f7 	add	w23, w23, w23, lsl #1
   e0428:	4a170000 	eor	w0, w0, w23
   e042c:	53185c17 	lsl	w23, w0, #8
   e0430:	4a4022f7 	eor	w23, w23, w0, lsr #8
   e0434:	eb08003f 	cmp	x1, x8
   e0438:	54ffff41 	b.ne	e0420 <_start+0x420>  // b.any
   e043c:	52810004 	mov	w4, #0x800                 	// #2048
   e0440:	aa0803e1 	mov	x1, x8
   e0444:	aa0903e0 	mov	x0, x9
   e0448:	9400012a 	bl	e08f0 <example4a.constprop.0>
   e044c:	d503201f 	nop
   e0450:	aa0803e1 	mov	x1, x8
   e0454:	aa0903e0 	mov	x0, x9
   e0458:	94000126 	bl	e08f0 <example4a.constprop.0>
   e045c:	71000484 	subs	w4, w4, #0x1
   e0460:	54ffff81 	b.ne	e0450 <_start+0x450>  // b.any
   e0464:	aa0903e1 	mov	x1, x9
   e0468:	52800038 	mov	w24, #0x1                   	// #1
   e046c:	d503201f 	nop
   e0470:	38401420 	ldrb	w0, [x1], #1
   e0474:	0b180718 	add	w24, w24, w24, lsl #1
   e0478:	4a180000 	eor	w0, w0, w24
   e047c:	53185c18 	lsl	w24, w0, #8
   e0480:	4a402318 	eor	w24, w24, w0, lsr #8
   e0484:	eb08003f 	cmp	x1, x8
   e0488:	54ffff41 	b.ne	e0470 <_start+0x470>  // b.any
   e048c:	52810006 	mov	w6, #0x800                 	// #2048
   e0490:	aa0a03e0 	mov	x0, x10
   e0494:	94000107 	bl	e08b0 <example4b.constprop.0>
   e0498:	aa0a03e0 	mov	x0, x10
   e049c:	94000105 	bl	e08b0 <example4b.constprop.0>
   e04a0:	710004c6 	subs	w6, w6, #0x1
   e04a4:	54ffffa1 	b.ne	e0498 <_start+0x498>  // b.any
   e04a8:	aa0903e1 	mov	x1, x9
   e04ac:	52800039 	mov	w25, #0x1                   	// #1
   e04b0:	38401420 	ldrb	w0, [x1], #1
   e04b4:	0b190739 	add	w25, w25, w25, lsl #1
   e04b8:	4a190000 	eor	w0, w0, w25
   e04bc:	53185c19 	lsl	w25, w0, #8
   e04c0:	4a402339 	eor	w25, w25, w0, lsr #8
   e04c4:	eb08003f 	cmp	x1, x8
   e04c8:	54ffff41 	b.ne	e04b0 <_start+0x4b0>  // b.any
   e04cc:	52810003 	mov	w3, #0x800                 	// #2048
   e04d0:	aa0a03e0 	mov	x0, x10
   e04d4:	940000eb 	bl	e0880 <example4c.constprop.0>
   e04d8:	aa0a03e0 	mov	x0, x10
   e04dc:	940000e9 	bl	e0880 <example4c.constprop.0>
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
   e0510:	aa0a03e0 	mov	x0, x10
   e0514:	940000d3 	bl	e0860 <example7.constprop.0>
   e0518:	aa0a03e0 	mov	x0, x10
   e051c:	940000d1 	bl	e0860 <example7.constprop.0>
   e0520:	71000463 	subs	w3, w3, #0x1
   e0524:	54ffffa1 	b.ne	e0518 <_start+0x518>  // b.any
   e0528:	aa0d03e1 	mov	x1, x13
   e052c:	52800036 	mov	w22, #0x1                   	// #1
   e0530:	38401420 	ldrb	w0, [x1], #1
   e0534:	0b1606d6 	add	w22, w22, w22, lsl #1
   e0538:	4a160000 	eor	w0, w0, w22
   e053c:	53185c16 	lsl	w22, w0, #8
   e0540:	4a4022d6 	eor	w22, w22, w0, lsr #8
   e0544:	eb0e003f 	cmp	x1, x14
   e0548:	54ffff41 	b.ne	e0530 <_start+0x530>  // b.any
   e054c:	52802005 	mov	w5, #0x100                 	// #256
   e0550:	aa0a03e0 	mov	x0, x10
   e0554:	940000b3 	bl	e0820 <example8.constprop.0>
   e0558:	aa0a03e0 	mov	x0, x10
   e055c:	940000b1 	bl	e0820 <example8.constprop.0>
   e0560:	710004a5 	subs	w5, w5, #0x1
   e0564:	54ffffa1 	b.ne	e0558 <_start+0x558>  // b.any
   e0568:	5280003b 	mov	w27, #0x1                   	// #1
   e056c:	d503201f 	nop
   e0570:	38401660 	ldrb	w0, [x19], #1
   e0574:	0b1b077b 	add	w27, w27, w27, lsl #1
   e0578:	4a1b0000 	eor	w0, w0, w27
   e057c:	53185c1b 	lsl	w27, w0, #8
   e0580:	4a40237b 	eor	w27, w27, w0, lsr #8
   e0584:	eb14027f 	cmp	x19, x20
   e0588:	54ffff41 	b.ne	e0570 <_start+0x570>  // b.any
   e058c:	9101b3e1 	add	x1, sp, #0x6c
   e0590:	52810006 	mov	w6, #0x800                 	// #2048
   e0594:	d503201f 	nop
   e0598:	aa0a03e0 	mov	x0, x10
   e059c:	940001bd 	bl	e0c90 <example9>
   e05a0:	710004c6 	subs	w6, w6, #0x1
   e05a4:	54ffffa1 	b.ne	e0598 <_start+0x598>  // b.any
   e05a8:	b9406fe0 	ldr	w0, [sp, #108]
   e05ac:	0b150252 	add	w18, w18, w21
   e05b0:	0b1802f7 	add	w23, w23, w24
   e05b4:	0b1a0339 	add	w25, w25, w26
   e05b8:	0b0000f3 	add	w19, w7, w0
   e05bc:	0b1b02d6 	add	w22, w22, w27
   e05c0:	0b120273 	add	w19, w19, w18
   e05c4:	52810007 	mov	w7, #0x800                 	// #2048
   e05c8:	0b170273 	add	w19, w19, w23
   e05cc:	aa0a03e0 	mov	x0, x10
   e05d0:	0b190273 	add	w19, w19, w25
   e05d4:	94000083 	bl	e07e0 <example10a.constprop.0>
   e05d8:	0b160273 	add	w19, w19, w22
   e05dc:	d503201f 	nop
   e05e0:	aa0a03e0 	mov	x0, x10
   e05e4:	9400007f 	bl	e07e0 <example10a.constprop.0>
   e05e8:	710004e7 	subs	w7, w7, #0x1
   e05ec:	54ffffa1 	b.ne	e05e0 <_start+0x5e0>  // b.any
   e05f0:	aa0903e1 	mov	x1, x9
   e05f4:	52800034 	mov	w20, #0x1                   	// #1
   e05f8:	38401420 	ldrb	w0, [x1], #1
   e05fc:	0b140694 	add	w20, w20, w20, lsl #1
   e0600:	4a140000 	eor	w0, w0, w20
   e0604:	53185c14 	lsl	w20, w0, #8
   e0608:	4a402294 	eor	w20, w20, w0, lsr #8
   e060c:	eb08003f 	cmp	x1, x8
   e0610:	54ffff41 	b.ne	e05f8 <_start+0x5f8>  // b.any
   e0614:	91200141 	add	x1, x10, #0x800
   e0618:	52800032 	mov	w18, #0x1                   	// #1
   e061c:	d503201f 	nop
   e0620:	38401420 	ldrb	w0, [x1], #1
   e0624:	0b120652 	add	w18, w18, w18, lsl #1
   e0628:	4a120000 	eor	w0, w0, w18
   e062c:	53185c12 	lsl	w18, w0, #8
   e0630:	4a402252 	eor	w18, w18, w0, lsr #8
   e0634:	eb0f003f 	cmp	x1, x15
   e0638:	54ffff41 	b.ne	e0620 <_start+0x620>  // b.any
   e063c:	52820004 	mov	w4, #0x1000                	// #4096
   e0640:	aa0a03e0 	mov	x0, x10
   e0644:	9400005c 	bl	e07b4 <example10b.constprop.0>
   e0648:	aa0a03e0 	mov	x0, x10
   e064c:	9400005a 	bl	e07b4 <example10b.constprop.0>
   e0650:	71000484 	subs	w4, w4, #0x1
   e0654:	54ffffa1 	b.ne	e0648 <_start+0x648>  // b.any
   e0658:	5280002f 	mov	w15, #0x1                   	// #1
   e065c:	d503201f 	nop
   e0660:	38401520 	ldrb	w0, [x9], #1
   e0664:	0b0f05ef 	add	w15, w15, w15, lsl #1
   e0668:	4a0f0000 	eor	w0, w0, w15
   e066c:	53185c0f 	lsl	w15, w0, #8
   e0670:	4a4021ef 	eor	w15, w15, w0, lsr #8
   e0674:	eb08013f 	cmp	x9, x8
   e0678:	54ffff41 	b.ne	e0660 <_start+0x660>  // b.any
   e067c:	52810009 	mov	w9, #0x800                 	// #2048
   e0680:	aa0a03e0 	mov	x0, x10
   e0684:	940001ab 	bl	e0d30 <example11>
   e0688:	aa0a03e0 	mov	x0, x10
   e068c:	940001a9 	bl	e0d30 <example11>
   e0690:	71000529 	subs	w9, w9, #0x1
   e0694:	54ffffa1 	b.ne	e0688 <_start+0x688>  // b.any
   e0698:	914047e1 	add	x1, sp, #0x11, lsl #12
   e069c:	52800035 	mov	w21, #0x1                   	// #1
   e06a0:	9101c021 	add	x1, x1, #0x70
   e06a4:	d503201f 	nop
   e06a8:	38401560 	ldrb	w0, [x11], #1
   e06ac:	0b1506b5 	add	w21, w21, w21, lsl #1
   e06b0:	4a150000 	eor	w0, w0, w21
   e06b4:	53185c15 	lsl	w21, w0, #8
   e06b8:	4a4022b5 	eor	w21, w21, w0, lsr #8
   e06bc:	eb01017f 	cmp	x11, x1
   e06c0:	54ffff41 	b.ne	e06a8 <_start+0x6a8>  // b.any
   e06c4:	5282000b 	mov	w11, #0x1000                	// #4096
   e06c8:	aa0a03e0 	mov	x0, x10
   e06cc:	940001ad 	bl	e0d80 <example12>
   e06d0:	aa0a03e0 	mov	x0, x10
   e06d4:	940001ab 	bl	e0d80 <example12>
   e06d8:	7100056b 	subs	w11, w11, #0x1
   e06dc:	54ffffa1 	b.ne	e06d0 <_start+0x6d0>  // b.any
   e06e0:	52800025 	mov	w5, #0x1                   	// #1
   e06e4:	d503201f 	nop
   e06e8:	384015a0 	ldrb	w0, [x13], #1
   e06ec:	0b0504a5 	add	w5, w5, w5, lsl #1
   e06f0:	4a050000 	eor	w0, w0, w5
   e06f4:	53185c05 	lsl	w5, w0, #8
   e06f8:	4a4020a5 	eor	w5, w5, w0, lsr #8
   e06fc:	eb0e01bf 	cmp	x13, x14
   e0700:	54ffff41 	b.ne	e06e8 <_start+0x6e8>  // b.any
   e0704:	52840004 	mov	w4, #0x2000                	// #8192
   e0708:	aa0c03e1 	mov	x1, x12
   e070c:	aa0a03e0 	mov	x0, x10
   e0710:	94000020 	bl	e0790 <example23.constprop.0>
   e0714:	d503201f 	nop
   e0718:	aa0c03e1 	mov	x1, x12
   e071c:	aa0a03e0 	mov	x0, x10
   e0720:	9400001c 	bl	e0790 <example23.constprop.0>
   e0724:	71000484 	subs	w4, w4, #0x1
   e0728:	54ffff81 	b.ne	e0718 <_start+0x718>  // b.any
   e072c:	91080142 	add	x2, x10, #0x200
   e0730:	52800020 	mov	w0, #0x1                   	// #1
   e0734:	d503201f 	nop
   e0738:	38401541 	ldrb	w1, [x10], #1
   e073c:	0b000400 	add	w0, w0, w0, lsl #1
   e0740:	4a000021 	eor	w1, w1, w0
   e0744:	53185c20 	lsl	w0, w1, #8
   e0748:	4a412000 	eor	w0, w0, w1, lsr #8
   e074c:	eb02015f 	cmp	x10, x2
   e0750:	54ffff41 	b.ne	e0738 <_start+0x738>  // b.any
   e0754:	0b140241 	add	w1, w18, w20
   e0758:	0b1501ef 	add	w15, w15, w21
   e075c:	0b130021 	add	w1, w1, w19
   e0760:	0b0000a5 	add	w5, w5, w0
   e0764:	a9407bfd 	ldp	x29, x30, [sp]
   e0768:	0b0f0020 	add	w0, w1, w15
   e076c:	a94153f3 	ldp	x19, x20, [sp, #16]
   e0770:	0b050000 	add	w0, w0, w5
   e0774:	a9425bf5 	ldp	x21, x22, [sp, #32]
   e0778:	a94363f7 	ldp	x23, x24, [sp, #48]
   e077c:	a9446bf9 	ldp	x25, x26, [sp, #64]
   e0780:	f9402bfb 	ldr	x27, [sp, #80]
   e0784:	9101c3ff 	add	sp, sp, #0x70
   e0788:	9140cbff 	add	sp, sp, #0x32, lsl #12
   e078c:	d65f03c0 	ret

Disassembly of section .text:

00000000000e0790 <example23.constprop.0>:
   e0790:	d2800002 	mov	x2, #0x0                   	// #0
   e0794:	d503201f 	nop
   e0798:	78627803 	ldrh	w3, [x0, x2, lsl #1]
   e079c:	53196063 	lsl	w3, w3, #7
   e07a0:	b8227823 	str	w3, [x1, x2, lsl #2]
   e07a4:	91000442 	add	x2, x2, #0x1
   e07a8:	f104005f 	cmp	x2, #0x100
   e07ac:	54ffff61 	b.ne	e0798 <example23.constprop.0+0x8>  // b.any
   e07b0:	d65f03c0 	ret

00000000000e07b4 <example10b.constprop.0>:
   e07b4:	91400c03 	add	x3, x0, #0x3, lsl #12
   e07b8:	91400402 	add	x2, x0, #0x1, lsl #12
   e07bc:	d2800001 	mov	x1, #0x0                   	// #0
   e07c0:	78e17840 	ldrsh	w0, [x2, x1, lsl #1]
   e07c4:	b8217860 	str	w0, [x3, x1, lsl #2]
   e07c8:	91000421 	add	x1, x1, #0x1
   e07cc:	f110003f 	cmp	x1, #0x400
   e07d0:	54ffff81 	b.ne	e07c0 <example10b.constprop.0+0xc>  // b.any
   e07d4:	d65f03c0 	ret
   e07d8:	d503201f 	nop
   e07dc:	d503201f 	nop

00000000000e07e0 <example10a.constprop.0>:
   e07e0:	91400c02 	add	x2, x0, #0x3, lsl #12
   e07e4:	91200001 	add	x1, x0, #0x800
   e07e8:	91400406 	add	x6, x0, #0x1, lsl #12
   e07ec:	d503201f 	nop
   e07f0:	b9500043 	ldr	w3, [x2, #4096]
   e07f4:	b9600045 	ldr	w5, [x2, #8192]
   e07f8:	79500020 	ldrh	w0, [x1, #2048]
   e07fc:	79600024 	ldrh	w4, [x1, #4096]
   e0800:	0b050063 	add	w3, w3, w5
   e0804:	b8004443 	str	w3, [x2], #4
   e0808:	0b040000 	add	w0, w0, w4
   e080c:	78002420 	strh	w0, [x1], #2
   e0810:	eb0100df 	cmp	x6, x1
   e0814:	54fffee1 	b.ne	e07f0 <example10a.constprop.0+0x10>  // b.any
   e0818:	d65f03c0 	ret
   e081c:	d503201f 	nop

00000000000e0820 <example8.constprop.0>:
   e0820:	91404803 	add	x3, x0, #0x12, lsl #12
   e0824:	91404c01 	add	x1, x0, #0x13, lsl #12
   e0828:	9140cc04 	add	x4, x0, #0x33, lsl #12
   e082c:	b21d03e2 	mov	x2, #0x800000008           	// #34359738376
   e0830:	aa0303e0 	mov	x0, x3
   e0834:	d503201f 	nop
   e0838:	f8008402 	str	x2, [x0], #8
   e083c:	eb01001f 	cmp	x0, x1
   e0840:	54ffffc1 	b.ne	e0838 <example8.constprop.0+0x18>  // b.any
   e0844:	91400401 	add	x1, x0, #0x1, lsl #12
   e0848:	91400463 	add	x3, x3, #0x1, lsl #12
   e084c:	eb04003f 	cmp	x1, x4
   e0850:	54ffff01 	b.ne	e0830 <example8.constprop.0+0x10>  // b.any
   e0854:	d65f03c0 	ret
   e0858:	d503201f 	nop
   e085c:	d503201f 	nop

00000000000e0860 <example7.constprop.0>:
   e0860:	91402801 	add	x1, x0, #0xa, lsl #12
   e0864:	91402c02 	add	x2, x0, #0xb, lsl #12
   e0868:	f9500820 	ldr	x0, [x1, #8208]
   e086c:	f8008420 	str	x0, [x1], #8
   e0870:	eb01005f 	cmp	x2, x1
   e0874:	54ffffa1 	b.ne	e0868 <example7.constprop.0+0x8>  // b.any
   e0878:	d65f03c0 	ret
   e087c:	d503201f 	nop

00000000000e0880 <example4c.constprop.0>:
   e0880:	91402801 	add	x1, x0, #0xa, lsl #12
   e0884:	91402c02 	add	x2, x0, #0xb, lsl #12
   e0888:	b9400020 	ldr	w0, [x1]
   e088c:	91001021 	add	x1, x1, #0x4
   e0890:	7100101f 	cmp	w0, #0x4
   e0894:	1a9fd7e0 	cset	w0, gt
   e0898:	531e7400 	lsl	w0, w0, #2
   e089c:	b91ffc20 	str	w0, [x1, #8188]
   e08a0:	eb01005f 	cmp	x2, x1
   e08a4:	54ffff21 	b.ne	e0888 <example4c.constprop.0+0x8>  // b.any
   e08a8:	d65f03c0 	ret
   e08ac:	d503201f 	nop

00000000000e08b0 <example4b.constprop.0>:
   e08b0:	d2980082 	mov	x2, #0xc004                	// #49156
   e08b4:	d29c0183 	mov	x3, #0xe00c                	// #57356
   e08b8:	91402805 	add	x5, x0, #0xa, lsl #12
   e08bc:	8b020004 	add	x4, x0, x2
   e08c0:	8b030003 	add	x3, x0, x3
   e08c4:	d2800001 	mov	x1, #0x0                   	// #0
   e08c8:	b8616880 	ldr	w0, [x4, x1]
   e08cc:	b8616862 	ldr	w2, [x3, x1]
   e08d0:	0b020000 	add	w0, w0, w2
   e08d4:	b82168a0 	str	w0, [x5, x1]
   e08d8:	91001021 	add	x1, x1, #0x4
   e08dc:	f13f603f 	cmp	x1, #0xfd8
   e08e0:	54ffff41 	b.ne	e08c8 <example4b.constprop.0+0x18>  // b.any
   e08e4:	d65f03c0 	ret
   e08e8:	d503201f 	nop
   e08ec:	d503201f 	nop

00000000000e08f0 <example4a.constprop.0>:
   e08f0:	d2800002 	mov	x2, #0x0                   	// #0
   e08f4:	d503201f 	nop
   e08f8:	b8626823 	ldr	w3, [x1, x2]
   e08fc:	11001463 	add	w3, w3, #0x5
   e0900:	b8226803 	str	w3, [x0, x2]
   e0904:	91001042 	add	x2, x2, #0x4
   e0908:	f140045f 	cmp	x2, #0x1, lsl #12
   e090c:	54ffff61 	b.ne	e08f8 <example4a.constprop.0+0x8>  // b.any
   e0910:	d65f03c0 	ret

00000000000e0914 <example3.constprop.0>:
   e0914:	d2800002 	mov	x2, #0x0                   	// #0
   e0918:	f8626823 	ldr	x3, [x1, x2]
   e091c:	f8226803 	str	x3, [x0, x2]
   e0920:	91002042 	add	x2, x2, #0x8
   e0924:	f140045f 	cmp	x2, #0x1, lsl #12
   e0928:	54ffff81 	b.ne	e0918 <example3.constprop.0+0x4>  // b.any
   e092c:	d65f03c0 	ret

00000000000e0930 <example2b.constprop.0>:
   e0930:	91402801 	add	x1, x0, #0xa, lsl #12
   e0934:	91402c02 	add	x2, x0, #0xb, lsl #12
   e0938:	f9500023 	ldr	x3, [x1, #8192]
   e093c:	f9600020 	ldr	x0, [x1, #16384]
   e0940:	8a030000 	and	x0, x0, x3
   e0944:	f8008420 	str	x0, [x1], #8
   e0948:	eb01005f 	cmp	x2, x1
   e094c:	54ffff61 	b.ne	e0938 <example2b.constprop.0+0x8>  // b.any
   e0950:	d65f03c0 	ret

00000000000e0954 <example2a.constprop.0>:
   e0954:	91403001 	add	x1, x0, #0xc, lsl #12
   e0958:	91403400 	add	x0, x0, #0xd, lsl #12
   e095c:	b21f03e2 	mov	x2, #0x200000002           	// #8589934594
   e0960:	f8008422 	str	x2, [x1], #8
   e0964:	eb00003f 	cmp	x1, x0
   e0968:	54ffffc1 	b.ne	e0960 <example2a.constprop.0+0xc>  // b.any
   e096c:	d65f03c0 	ret

00000000000e0970 <dump_regs>:
   e0970:	d40000c1 	svc	#0x6
   e0974:	d65f03c0 	ret
   e0978:	d503201f 	nop
   e097c:	d503201f 	nop

00000000000e0980 <example1>:
   e0980:	91402805 	add	x5, x0, #0xa, lsl #12
   e0984:	91403004 	add	x4, x0, #0xc, lsl #12
   e0988:	91403803 	add	x3, x0, #0xe, lsl #12
   e098c:	d2800001 	mov	x1, #0x0                   	// #0
   e0990:	b8616880 	ldr	w0, [x4, x1]
   e0994:	b8616862 	ldr	w2, [x3, x1]
   e0998:	0b020000 	add	w0, w0, w2
   e099c:	b82168a0 	str	w0, [x5, x1]
   e09a0:	91001021 	add	x1, x1, #0x4
   e09a4:	f110003f 	cmp	x1, #0x400
   e09a8:	54ffff41 	b.ne	e0990 <example1+0x10>  // b.any
   e09ac:	d65f03c0 	ret

00000000000e09b0 <example2a>:
   e09b0:	2a0103e5 	mov	w5, w1
   e09b4:	7100003f 	cmp	w1, #0x0
   e09b8:	5400024d 	b.le	e0a00 <example2a+0x50>
   e09bc:	7100043f 	cmp	w1, #0x1
   e09c0:	54000220 	b.eq	e0a04 <example2a+0x54>  // b.none
   e09c4:	d2800001 	mov	x1, #0x0                   	// #0
   e09c8:	53017ca4 	lsr	w4, w5, #1
   e09cc:	b3407c41 	bfxil	x1, x2, #0, #32
   e09d0:	91403003 	add	x3, x0, #0xc, lsl #12
   e09d4:	8b244c64 	add	x4, x3, w4, uxtw #3
   e09d8:	b3607c41 	bfi	x1, x2, #32, #32
   e09dc:	d503201f 	nop
   e09e0:	f8008461 	str	x1, [x3], #8
   e09e4:	eb04007f 	cmp	x3, x4
   e09e8:	54ffffc1 	b.ne	e09e0 <example2a+0x30>  // b.any
   e09ec:	121f78a1 	and	w1, w5, #0xfffffffe
   e09f0:	36000085 	tbz	w5, #0, e0a00 <example2a+0x50>
   e09f4:	93407c21 	sxtw	x1, w1
   e09f8:	91400c21 	add	x1, x1, #0x3, lsl #12
   e09fc:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0a00:	d65f03c0 	ret
   e0a04:	52800001 	mov	w1, #0x0                   	// #0
   e0a08:	17fffffb 	b	e09f4 <example2a+0x44>
   e0a0c:	d503201f 	nop

00000000000e0a10 <example2b>:
   e0a10:	aa0003e5 	mov	x5, x0
   e0a14:	340002c1 	cbz	w1, e0a6c <example2b+0x5c>
   e0a18:	7100043f 	cmp	w1, #0x1
   e0a1c:	540002a0 	b.eq	e0a70 <example2b+0x60>  // b.none
   e0a20:	53017c20 	lsr	w0, w1, #1
   e0a24:	914028a2 	add	x2, x5, #0xa, lsl #12
   e0a28:	8b204c40 	add	x0, x2, w0, uxtw #3
   e0a2c:	d503201f 	nop
   e0a30:	f9500043 	ldr	x3, [x2, #8192]
   e0a34:	f9600044 	ldr	x4, [x2, #16384]
   e0a38:	8a040063 	and	x3, x3, x4
   e0a3c:	f8008443 	str	x3, [x2], #8
   e0a40:	eb02001f 	cmp	x0, x2
   e0a44:	54ffff61 	b.ne	e0a30 <example2b+0x20>  // b.any
   e0a48:	121f7820 	and	w0, w1, #0xfffffffe
   e0a4c:	36000101 	tbz	w1, #0, e0a6c <example2b+0x5c>
   e0a50:	8b20c8a0 	add	x0, x5, w0, sxtw #2
   e0a54:	91403001 	add	x1, x0, #0xc, lsl #12
   e0a58:	91402000 	add	x0, x0, #0x8, lsl #12
   e0a5c:	b9400022 	ldr	w2, [x1]
   e0a60:	b9600021 	ldr	w1, [x1, #8192]
   e0a64:	0a020021 	and	w1, w1, w2
   e0a68:	b9200001 	str	w1, [x0, #8192]
   e0a6c:	d65f03c0 	ret
   e0a70:	52800000 	mov	w0, #0x0                   	// #0
   e0a74:	17fffff7 	b	e0a50 <example2b+0x40>
   e0a78:	d503201f 	nop
   e0a7c:	d503201f 	nop

00000000000e0a80 <example3>:
   e0a80:	34000241 	cbz	w1, e0ac8 <example3+0x48>
   e0a84:	7100043f 	cmp	w1, #0x1
   e0a88:	540001c0 	b.eq	e0ac0 <example3+0x40>  // b.none
   e0a8c:	53017c25 	lsr	w5, w1, #1
   e0a90:	d2800000 	mov	x0, #0x0                   	// #0
   e0a94:	d37df0a5 	lsl	x5, x5, #3
   e0a98:	f8606864 	ldr	x4, [x3, x0]
   e0a9c:	f8206844 	str	x4, [x2, x0]
   e0aa0:	91002000 	add	x0, x0, #0x8
   e0aa4:	eb0000bf 	cmp	x5, x0
   e0aa8:	54ffff81 	b.ne	e0a98 <example3+0x18>  // b.any
   e0aac:	121f7820 	and	w0, w1, #0xfffffffe
   e0ab0:	360000c1 	tbz	w1, #0, e0ac8 <example3+0x48>
   e0ab4:	d37ef400 	lsl	x0, x0, #2
   e0ab8:	8b000042 	add	x2, x2, x0
   e0abc:	8b000063 	add	x3, x3, x0
   e0ac0:	b9400060 	ldr	w0, [x3]
   e0ac4:	b9000040 	str	w0, [x2]
   e0ac8:	d65f03c0 	ret
   e0acc:	d503201f 	nop

00000000000e0ad0 <example4a>:
   e0ad0:	34000141 	cbz	w1, e0af8 <example4a+0x28>
   e0ad4:	d37e7c24 	ubfiz	x4, x1, #2, #32
   e0ad8:	d2800000 	mov	x0, #0x0                   	// #0
   e0adc:	d503201f 	nop
   e0ae0:	b8606861 	ldr	w1, [x3, x0]
   e0ae4:	11001421 	add	w1, w1, #0x5
   e0ae8:	b8206841 	str	w1, [x2, x0]
   e0aec:	91001000 	add	x0, x0, #0x4
   e0af0:	eb04001f 	cmp	x0, x4
   e0af4:	54ffff61 	b.ne	e0ae0 <example4a+0x10>  // b.any
   e0af8:	d65f03c0 	ret
   e0afc:	d503201f 	nop

00000000000e0b00 <example4b>:
   e0b00:	7100003f 	cmp	w1, #0x0
   e0b04:	5400020d 	b.le	e0b44 <example4b+0x44>
   e0b08:	937e7c24 	sbfiz	x4, x1, #2, #32
   e0b0c:	91402806 	add	x6, x0, #0xa, lsl #12
   e0b10:	d2980081 	mov	x1, #0xc004                	// #49156
   e0b14:	d29c0182 	mov	x2, #0xe00c                	// #57356
   e0b18:	8b010005 	add	x5, x0, x1
   e0b1c:	8b020003 	add	x3, x0, x2
   e0b20:	d2800000 	mov	x0, #0x0                   	// #0
   e0b24:	d503201f 	nop
   e0b28:	b86068a1 	ldr	w1, [x5, x0]
   e0b2c:	b8606862 	ldr	w2, [x3, x0]
   e0b30:	0b020021 	add	w1, w1, w2
   e0b34:	b82068c1 	str	w1, [x6, x0]
   e0b38:	91001000 	add	x0, x0, #0x4
   e0b3c:	eb00009f 	cmp	x4, x0
   e0b40:	54ffff41 	b.ne	e0b28 <example4b+0x28>  // b.any
   e0b44:	d65f03c0 	ret
   e0b48:	d503201f 	nop
   e0b4c:	d503201f 	nop

00000000000e0b50 <example4c>:
   e0b50:	7100003f 	cmp	w1, #0x0
   e0b54:	5400016d 	b.le	e0b80 <example4c+0x30>
   e0b58:	91402800 	add	x0, x0, #0xa, lsl #12
   e0b5c:	8b21c802 	add	x2, x0, w1, sxtw #2
   e0b60:	b9400001 	ldr	w1, [x0]
   e0b64:	91001000 	add	x0, x0, #0x4
   e0b68:	7100103f 	cmp	w1, #0x4
   e0b6c:	1a9fd7e1 	cset	w1, gt
   e0b70:	531e7421 	lsl	w1, w1, #2
   e0b74:	b91ffc01 	str	w1, [x0, #8188]
   e0b78:	eb00005f 	cmp	x2, x0
   e0b7c:	54ffff21 	b.ne	e0b60 <example4c+0x10>  // b.any
   e0b80:	d65f03c0 	ret

00000000000e0b84 <example5>:
   e0b84:	2a0103e4 	mov	w4, w1
   e0b88:	7100003f 	cmp	w1, #0x0
   e0b8c:	5400024d 	b.le	e0bd4 <example5+0x50>
   e0b90:	7100043f 	cmp	w1, #0x1
   e0b94:	54000220 	b.eq	e0bd8 <example5+0x54>  // b.none
   e0b98:	53017c23 	lsr	w3, w1, #1
   e0b9c:	91402402 	add	x2, x0, #0x9, lsl #12
   e0ba0:	d28000a1 	mov	x1, #0x5                   	// #5
   e0ba4:	8b234c43 	add	x3, x2, w3, uxtw #3
   e0ba8:	f2c000a1 	movk	x1, #0x5, lsl #32
   e0bac:	d503201f 	nop
   e0bb0:	f8008441 	str	x1, [x2], #8
   e0bb4:	eb03005f 	cmp	x2, x3
   e0bb8:	54ffffc1 	b.ne	e0bb0 <example5+0x2c>  // b.any
   e0bbc:	121f7881 	and	w1, w4, #0xfffffffe
   e0bc0:	360000a4 	tbz	w4, #0, e0bd4 <example5+0x50>
   e0bc4:	d2848003 	mov	x3, #0x2400                	// #9216
   e0bc8:	528000a2 	mov	w2, #0x5                   	// #5
   e0bcc:	8b21c061 	add	x1, x3, w1, sxtw
   e0bd0:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0bd4:	d65f03c0 	ret
   e0bd8:	52800001 	mov	w1, #0x0                   	// #0
   e0bdc:	17fffffa 	b	e0bc4 <example5+0x40>

00000000000e0be0 <example7>:
   e0be0:	93407c22 	sxtw	x2, w1
   e0be4:	91400c43 	add	x3, x2, #0x3, lsl #12
   e0be8:	d37ef463 	lsl	x3, x3, #2
   e0bec:	8b030001 	add	x1, x0, x3
   e0bf0:	f240083f 	tst	x1, #0x7
   e0bf4:	54000121 	b.ne	e0c18 <example7+0x38>  // b.any
   e0bf8:	91402803 	add	x3, x0, #0xa, lsl #12
   e0bfc:	d2800000 	mov	x0, #0x0                   	// #0
   e0c00:	f8606822 	ldr	x2, [x1, x0]
   e0c04:	f8206862 	str	x2, [x3, x0]
   e0c08:	91002000 	add	x0, x0, #0x8
   e0c0c:	f140041f 	cmp	x0, #0x1, lsl #12
   e0c10:	54ffff81 	b.ne	e0c00 <example7+0x20>  // b.any
   e0c14:	d65f03c0 	ret
   e0c18:	8b030000 	add	x0, x0, x3
   e0c1c:	cb020be3 	neg	x3, x2, lsl #2
   e0c20:	d1400863 	sub	x3, x3, #0x2, lsl #12
   e0c24:	91400402 	add	x2, x0, #0x1, lsl #12
   e0c28:	aa0103e0 	mov	x0, x1
   e0c2c:	d503201f 	nop
   e0c30:	b9400001 	ldr	w1, [x0]
   e0c34:	b8236801 	str	w1, [x0, x3]
   e0c38:	91001000 	add	x0, x0, #0x4
   e0c3c:	eb02001f 	cmp	x0, x2
   e0c40:	54ffff81 	b.ne	e0c30 <example7+0x50>  // b.any
   e0c44:	d65f03c0 	ret
   e0c48:	d503201f 	nop
   e0c4c:	d503201f 	nop

00000000000e0c50 <example8>:
   e0c50:	2a0103e6 	mov	w6, w1
   e0c54:	91404804 	add	x4, x0, #0x12, lsl #12
   e0c58:	91404c02 	add	x2, x0, #0x13, lsl #12
   e0c5c:	9140cc05 	add	x5, x0, #0x33, lsl #12
   e0c60:	d2800001 	mov	x1, #0x0                   	// #0
   e0c64:	aa0403e0 	mov	x0, x4
   e0c68:	b3407cc1 	bfxil	x1, x6, #0, #32
   e0c6c:	b3607cc1 	bfi	x1, x6, #32, #32
   e0c70:	f8008401 	str	x1, [x0], #8
   e0c74:	eb02001f 	cmp	x0, x2
   e0c78:	54ffffc1 	b.ne	e0c70 <example8+0x20>  // b.any
   e0c7c:	91400402 	add	x2, x0, #0x1, lsl #12
   e0c80:	91400484 	add	x4, x4, #0x1, lsl #12
   e0c84:	eb05005f 	cmp	x2, x5
   e0c88:	54fffec1 	b.ne	e0c60 <example8+0x10>  // b.any
   e0c8c:	d65f03c0 	ret

00000000000e0c90 <example9>:
   e0c90:	91401802 	add	x2, x0, #0x6, lsl #12
   e0c94:	91401c05 	add	x5, x0, #0x7, lsl #12
   e0c98:	52800003 	mov	w3, #0x0                   	// #0
   e0c9c:	d503201f 	nop
   e0ca0:	b9400040 	ldr	w0, [x2]
   e0ca4:	91001042 	add	x2, x2, #0x4
   e0ca8:	b94ffc44 	ldr	w4, [x2, #4092]
   e0cac:	4b040000 	sub	w0, w0, w4
   e0cb0:	0b000063 	add	w3, w3, w0
   e0cb4:	eb0200bf 	cmp	x5, x2
   e0cb8:	54ffff41 	b.ne	e0ca0 <example9+0x10>  // b.any
   e0cbc:	b9000023 	str	w3, [x1]
   e0cc0:	d65f03c0 	ret

00000000000e0cc4 <example10a>:
   e0cc4:	91400c02 	add	x2, x0, #0x3, lsl #12
   e0cc8:	91200001 	add	x1, x0, #0x800
   e0ccc:	91400406 	add	x6, x0, #0x1, lsl #12
   e0cd0:	b9500043 	ldr	w3, [x2, #4096]
   e0cd4:	b9600045 	ldr	w5, [x2, #8192]
   e0cd8:	79500020 	ldrh	w0, [x1, #2048]
   e0cdc:	79600024 	ldrh	w4, [x1, #4096]
   e0ce0:	0b050063 	add	w3, w3, w5
   e0ce4:	b8004443 	str	w3, [x2], #4
   e0ce8:	0b040000 	add	w0, w0, w4
   e0cec:	78002420 	strh	w0, [x1], #2
   e0cf0:	eb0100df 	cmp	x6, x1
   e0cf4:	54fffee1 	b.ne	e0cd0 <example10a+0xc>  // b.any
   e0cf8:	d65f03c0 	ret
   e0cfc:	d503201f 	nop

00000000000e0d00 <example10b>:
   e0d00:	91400c03 	add	x3, x0, #0x3, lsl #12
   e0d04:	91400402 	add	x2, x0, #0x1, lsl #12
   e0d08:	d2800001 	mov	x1, #0x0                   	// #0
   e0d0c:	d503201f 	nop
   e0d10:	78e17840 	ldrsh	w0, [x2, x1, lsl #1]
   e0d14:	b8217860 	str	w0, [x3, x1, lsl #2]
   e0d18:	91000421 	add	x1, x1, #0x1
   e0d1c:	f110003f 	cmp	x1, #0x400
   e0d20:	54ffff81 	b.ne	e0d10 <example10b+0x10>  // b.any
   e0d24:	d65f03c0 	ret
   e0d28:	d503201f 	nop
   e0d2c:	d503201f 	nop

00000000000e0d30 <example11>:
   e0d30:	91403001 	add	x1, x0, #0xc, lsl #12
   e0d34:	91402808 	add	x8, x0, #0xa, lsl #12
   e0d38:	91404007 	add	x7, x0, #0x10, lsl #12
   e0d3c:	d2800002 	mov	x2, #0x0                   	// #0
   e0d40:	29401025 	ldp	w5, w4, [x1]
   e0d44:	91002021 	add	x1, x1, #0x8
   e0d48:	b95ffc20 	ldr	w0, [x1, #8188]
   e0d4c:	b95ff823 	ldr	w3, [x1, #8184]
   e0d50:	1b007c86 	mul	w6, w4, w0
   e0d54:	1b037c84 	mul	w4, w4, w3
   e0d58:	1b0398a3 	msub	w3, w5, w3, w6
   e0d5c:	1b051000 	madd	w0, w0, w5, w4
   e0d60:	b8227903 	str	w3, [x8, x2, lsl #2]
   e0d64:	b82278e0 	str	w0, [x7, x2, lsl #2]
   e0d68:	91000442 	add	x2, x2, #0x1
   e0d6c:	f108005f 	cmp	x2, #0x200
   e0d70:	54fffe81 	b.ne	e0d40 <example11+0x10>  // b.any
   e0d74:	d65f03c0 	ret
   e0d78:	d503201f 	nop
   e0d7c:	d503201f 	nop

00000000000e0d80 <example12>:
   e0d80:	b0000001 	adrp	x1, e1000 <memcpy+0xd0>
   e0d84:	91402803 	add	x3, x0, #0xa, lsl #12
   e0d88:	91402c09 	add	x9, x0, #0xb, lsl #12
   e0d8c:	d2c00022 	mov	x2, #0x100000000           	// #4294967296
   e0d90:	f9412421 	ldr	x1, [x1, #584]
   e0d94:	d503201f 	nop
   e0d98:	11001048 	add	w8, w2, #0x4
   e0d9c:	11001027 	add	w7, w1, #0x4
   e0da0:	9360fc46 	asr	x6, x2, #32
   e0da4:	9360fc25 	asr	x5, x1, #32
   e0da8:	d2800004 	mov	x4, #0x0                   	// #0
   e0dac:	d2800000 	mov	x0, #0x0                   	// #0
   e0db0:	b3407d04 	bfxil	x4, x8, #0, #32
   e0db4:	110010c6 	add	w6, w6, #0x4
   e0db8:	b3407ce0 	bfxil	x0, x7, #0, #32
   e0dbc:	110010a5 	add	w5, w5, #0x4
   e0dc0:	a9000462 	stp	x2, x1, [x3]
   e0dc4:	b3607cc4 	bfi	x4, x6, #32, #32
   e0dc8:	b3607ca0 	bfi	x0, x5, #32, #32
   e0dcc:	91004063 	add	x3, x3, #0x10
   e0dd0:	aa0403e2 	mov	x2, x4
   e0dd4:	aa0003e1 	mov	x1, x0
   e0dd8:	eb09007f 	cmp	x3, x9
   e0ddc:	54fffde1 	b.ne	e0d98 <example12+0x18>  // b.any
   e0de0:	d65f03c0 	ret

00000000000e0de4 <example13>:
   e0de4:	aa0103e9 	mov	x9, x1
   e0de8:	aa0203e8 	mov	x8, x2
   e0dec:	aa0303e7 	mov	x7, x3
   e0df0:	d2800006 	mov	x6, #0x0                   	// #0
   e0df4:	d503201f 	nop
   e0df8:	f8667925 	ldr	x5, [x9, x6, lsl #3]
   e0dfc:	d2800000 	mov	x0, #0x0                   	// #0
   e0e00:	f8667904 	ldr	x4, [x8, x6, lsl #3]
   e0e04:	52800002 	mov	w2, #0x0                   	// #0
   e0e08:	b86068a1 	ldr	w1, [x5, x0]
   e0e0c:	b8606883 	ldr	w3, [x4, x0]
   e0e10:	91008000 	add	x0, x0, #0x20
   e0e14:	4b030021 	sub	w1, w1, w3
   e0e18:	0b010042 	add	w2, w2, w1
   e0e1c:	f140041f 	cmp	x0, #0x1, lsl #12
   e0e20:	54ffff41 	b.ne	e0e08 <example13+0x24>  // b.any
   e0e24:	b82678e2 	str	w2, [x7, x6, lsl #2]
   e0e28:	910004c6 	add	x6, x6, #0x1
   e0e2c:	f10080df 	cmp	x6, #0x20
   e0e30:	54fffe41 	b.ne	e0df8 <example13+0x14>  // b.any
   e0e34:	d65f03c0 	ret
   e0e38:	d503201f 	nop
   e0e3c:	d503201f 	nop

00000000000e0e40 <example14>:
   e0e40:	aa0103e5 	mov	x5, x1
   e0e44:	aa0203e6 	mov	x6, x2
   e0e48:	aa0303e8 	mov	x8, x3
   e0e4c:	d2800007 	mov	x7, #0x0                   	// #0
   e0e50:	d2800001 	mov	x1, #0x0                   	// #0
   e0e54:	52800002 	mov	w2, #0x0                   	// #0
   e0e58:	d2800000 	mov	x0, #0x0                   	// #0
   e0e5c:	d503201f 	nop
   e0e60:	f86068a4 	ldr	x4, [x5, x0]
   e0e64:	f86068c3 	ldr	x3, [x6, x0]
   e0e68:	91002000 	add	x0, x0, #0x8
   e0e6c:	b8616884 	ldr	w4, [x4, x1]
   e0e70:	b8616863 	ldr	w3, [x3, x1]
   e0e74:	1b030882 	madd	w2, w4, w3, w2
   e0e78:	f140081f 	cmp	x0, #0x2, lsl #12
   e0e7c:	54ffff21 	b.ne	e0e60 <example14+0x20>  // b.any
   e0e80:	91001021 	add	x1, x1, #0x4
   e0e84:	f102003f 	cmp	x1, #0x80
   e0e88:	54fffe81 	b.ne	e0e58 <example14+0x18>  // b.any
   e0e8c:	b8277902 	str	w2, [x8, x7, lsl #2]
   e0e90:	910004e7 	add	x7, x7, #0x1
   e0e94:	910020a5 	add	x5, x5, #0x8
   e0e98:	f10010ff 	cmp	x7, #0x4
   e0e9c:	54fffda1 	b.ne	e0e50 <example14+0x10>  // b.any
   e0ea0:	d65f03c0 	ret

00000000000e0ea4 <example23>:
   e0ea4:	d2800000 	mov	x0, #0x0                   	// #0
   e0ea8:	78607823 	ldrh	w3, [x1, x0, lsl #1]
   e0eac:	53196063 	lsl	w3, w3, #7
   e0eb0:	b8207843 	str	w3, [x2, x0, lsl #2]
   e0eb4:	91000400 	add	x0, x0, #0x1
   e0eb8:	f104001f 	cmp	x0, #0x100
   e0ebc:	54ffff61 	b.ne	e0ea8 <example23+0x4>  // b.any
   e0ec0:	d65f03c0 	ret

00000000000e0ec4 <init_memory>:
   e0ec4:	eb01001f 	cmp	x0, x1
   e0ec8:	540001a0 	b.eq	e0efc <init_memory+0x38>  // b.none
   e0ecc:	52800023 	mov	w3, #0x1                   	// #1
   e0ed0:	528004e4 	mov	w4, #0x27                  	// #39
   e0ed4:	d503201f 	nop
   e0ed8:	531d1062 	ubfiz	w2, w3, #3, #5
   e0edc:	4b030042 	sub	w2, w2, w3
   e0ee0:	12001c42 	and	w2, w2, #0xff
   e0ee4:	4a040042 	eor	w2, w2, w4
   e0ee8:	11000442 	add	w2, w2, #0x1
   e0eec:	12001c43 	and	w3, w2, #0xff
   e0ef0:	38001403 	strb	w3, [x0], #1
   e0ef4:	eb00003f 	cmp	x1, x0
   e0ef8:	54ffff01 	b.ne	e0ed8 <init_memory+0x14>  // b.any
   e0efc:	d65f03c0 	ret

00000000000e0f00 <digest_memory>:
   e0f00:	aa0003e3 	mov	x3, x0
   e0f04:	52800020 	mov	w0, #0x1                   	// #1
   e0f08:	eb01007f 	cmp	x3, x1
   e0f0c:	54000100 	b.eq	e0f2c <digest_memory+0x2c>  // b.none
   e0f10:	38401462 	ldrb	w2, [x3], #1
   e0f14:	0b000400 	add	w0, w0, w0, lsl #1
   e0f18:	4a000042 	eor	w2, w2, w0
   e0f1c:	53185c40 	lsl	w0, w2, #8
   e0f20:	4a422000 	eor	w0, w0, w2, lsr #8
   e0f24:	eb03003f 	cmp	x1, x3
   e0f28:	54ffff41 	b.ne	e0f10 <digest_memory+0x10>  // b.any
   e0f2c:	d65f03c0 	ret

00000000000e0f30 <memcpy>:
   e0f30:	b4000222 	cbz	x2, e0f74 <memcpy+0x44>
   e0f34:	d1000443 	sub	x3, x2, #0x1
   e0f38:	f1001c7f 	cmp	x3, #0x7
   e0f3c:	54000729 	b.ls	e1020 <memcpy+0xf0>  // b.plast
   e0f40:	aa010005 	orr	x5, x0, x1
   e0f44:	91000424 	add	x4, x1, #0x1
   e0f48:	cb040004 	sub	x4, x0, x4
   e0f4c:	d2800003 	mov	x3, #0x0                   	// #0
   e0f50:	f24008bf 	tst	x5, #0x7
   e0f54:	fa460880 	ccmp	x4, #0x6, #0x0, eq	// eq = none
   e0f58:	54000108 	b.hi	e0f78 <memcpy+0x48>  // b.pmore
   e0f5c:	d503201f 	nop
   e0f60:	38636824 	ldrb	w4, [x1, x3]
   e0f64:	38236804 	strb	w4, [x0, x3]
   e0f68:	91000463 	add	x3, x3, #0x1
   e0f6c:	eb03005f 	cmp	x2, x3
   e0f70:	54ffff81 	b.ne	e0f60 <memcpy+0x30>  // b.any
   e0f74:	d65f03c0 	ret
   e0f78:	927df044 	and	x4, x2, #0xfffffffffffffff8
   e0f7c:	d503201f 	nop
   e0f80:	f8636825 	ldr	x5, [x1, x3]
   e0f84:	f8236805 	str	x5, [x0, x3]
   e0f88:	91002063 	add	x3, x3, #0x8
   e0f8c:	eb03009f 	cmp	x4, x3
   e0f90:	54ffff81 	b.ne	e0f80 <memcpy+0x50>  // b.any
   e0f94:	eb04005f 	cmp	x2, x4
   e0f98:	54fffee0 	b.eq	e0f74 <memcpy+0x44>  // b.none
   e0f9c:	38646825 	ldrb	w5, [x1, x4]
   e0fa0:	91000483 	add	x3, x4, #0x1
   e0fa4:	38246805 	strb	w5, [x0, x4]
   e0fa8:	eb03005f 	cmp	x2, x3
   e0fac:	54fffe40 	b.eq	e0f74 <memcpy+0x44>  // b.none
   e0fb0:	38636826 	ldrb	w6, [x1, x3]
   e0fb4:	91000885 	add	x5, x4, #0x2
   e0fb8:	38236806 	strb	w6, [x0, x3]
   e0fbc:	eb05005f 	cmp	x2, x5
   e0fc0:	54fffda0 	b.eq	e0f74 <memcpy+0x44>  // b.none
   e0fc4:	38656826 	ldrb	w6, [x1, x5]
   e0fc8:	91000c83 	add	x3, x4, #0x3
   e0fcc:	38256806 	strb	w6, [x0, x5]
   e0fd0:	eb03005f 	cmp	x2, x3
   e0fd4:	54fffd00 	b.eq	e0f74 <memcpy+0x44>  // b.none
   e0fd8:	38636826 	ldrb	w6, [x1, x3]
   e0fdc:	91001085 	add	x5, x4, #0x4
   e0fe0:	38236806 	strb	w6, [x0, x3]
   e0fe4:	eb05005f 	cmp	x2, x5
   e0fe8:	54fffc60 	b.eq	e0f74 <memcpy+0x44>  // b.none
   e0fec:	38656826 	ldrb	w6, [x1, x5]
   e0ff0:	91001483 	add	x3, x4, #0x5
   e0ff4:	38256806 	strb	w6, [x0, x5]
   e0ff8:	eb03005f 	cmp	x2, x3
   e0ffc:	54fffbc0 	b.eq	e0f74 <memcpy+0x44>  // b.none
   e1000:	38636825 	ldrb	w5, [x1, x3]
   e1004:	91001884 	add	x4, x4, #0x6
   e1008:	38236805 	strb	w5, [x0, x3]
   e100c:	eb04005f 	cmp	x2, x4
   e1010:	54fffb20 	b.eq	e0f74 <memcpy+0x44>  // b.none
   e1014:	38646821 	ldrb	w1, [x1, x4]
   e1018:	38246801 	strb	w1, [x0, x4]
   e101c:	d65f03c0 	ret
   e1020:	d2800003 	mov	x3, #0x0                   	// #0
   e1024:	38636824 	ldrb	w4, [x1, x3]
   e1028:	38236804 	strb	w4, [x0, x3]
   e102c:	91000463 	add	x3, x3, #0x1
   e1030:	eb03005f 	cmp	x2, x3
   e1034:	54fff961 	b.ne	e0f60 <memcpy+0x30>  // b.any
   e1038:	17ffffcf 	b	e0f74 <memcpy+0x44>
   e103c:	d503201f 	nop

00000000000e1040 <memset>:
   e1040:	b4000ce2 	cbz	x2, e11dc <memset+0x19c>
   e1044:	cb0003e7 	neg	x7, x0
   e1048:	d2800168 	mov	x8, #0xb                   	// #11
   e104c:	924008e3 	and	x3, x7, #0x7
   e1050:	d1000446 	sub	x6, x2, #0x1
   e1054:	91001c65 	add	x5, x3, #0x7
   e1058:	12001c24 	and	w4, w1, #0xff
   e105c:	eb0800bf 	cmp	x5, x8
   e1060:	9a8820a5 	csel	x5, x5, x8, cs	// cs = hs, nlast
   e1064:	eb0500df 	cmp	x6, x5
   e1068:	54000c83 	b.cc	e11f8 <memset+0x1b8>  // b.lo, b.ul, b.last
   e106c:	b4000c23 	cbz	x3, e11f0 <memset+0x1b0>
   e1070:	39000004 	strb	w4, [x0]
   e1074:	f27f04ff 	tst	x7, #0x6
   e1078:	54000b80 	b.eq	e11e8 <memset+0x1a8>  // b.none
   e107c:	39000404 	strb	w4, [x0, #1]
   e1080:	f100087f 	cmp	x3, #0x2
   e1084:	54000be9 	b.ls	e1200 <memset+0x1c0>  // b.plast
   e1088:	39000804 	strb	w4, [x0, #2]
   e108c:	36100aa7 	tbz	w7, #2, e11e0 <memset+0x1a0>
   e1090:	39000c04 	strb	w4, [x0, #3]
   e1094:	f100107f 	cmp	x3, #0x4
   e1098:	54000b89 	b.ls	e1208 <memset+0x1c8>  // b.plast
   e109c:	39001004 	strb	w4, [x0, #4]
   e10a0:	f100147f 	cmp	x3, #0x5
   e10a4:	54000b60 	b.eq	e1210 <memset+0x1d0>  // b.none
   e10a8:	39001404 	strb	w4, [x0, #5]
   e10ac:	f1001c7f 	cmp	x3, #0x7
   e10b0:	54000b41 	b.ne	e1218 <memset+0x1d8>  // b.any
   e10b4:	aa0303e6 	mov	x6, x3
   e10b8:	39001804 	strb	w4, [x0, #6]
   e10bc:	d2800005 	mov	x5, #0x0                   	// #0
   e10c0:	cb030049 	sub	x9, x2, x3
   e10c4:	b3401c85 	bfxil	x5, x4, #0, #8
   e10c8:	8b030001 	add	x1, x0, x3
   e10cc:	927df128 	and	x8, x9, #0xfffffffffffffff8
   e10d0:	b3781c85 	bfi	x5, x4, #8, #8
   e10d4:	8b080027 	add	x7, x1, x8
   e10d8:	b3701c85 	bfi	x5, x4, #16, #8
   e10dc:	b3681c85 	bfi	x5, x4, #24, #8
   e10e0:	b3601c85 	bfi	x5, x4, #32, #8
   e10e4:	b3581c85 	bfi	x5, x4, #40, #8
   e10e8:	b3501c85 	bfi	x5, x4, #48, #8
   e10ec:	b3481c85 	bfi	x5, x4, #56, #8
   e10f0:	f8008425 	str	x5, [x1], #8
   e10f4:	eb0100ff 	cmp	x7, x1
   e10f8:	54ffffc1 	b.ne	e10f0 <memset+0xb0>  // b.any
   e10fc:	8b0800c1 	add	x1, x6, x8
   e1100:	eb08013f 	cmp	x9, x8
   e1104:	540006c0 	b.eq	e11dc <memset+0x19c>  // b.none
   e1108:	91000423 	add	x3, x1, #0x1
   e110c:	38216804 	strb	w4, [x0, x1]
   e1110:	eb03005f 	cmp	x2, x3
   e1114:	54000640 	b.eq	e11dc <memset+0x19c>  // b.none
   e1118:	91000825 	add	x5, x1, #0x2
   e111c:	38236804 	strb	w4, [x0, x3]
   e1120:	eb05005f 	cmp	x2, x5
   e1124:	540005c0 	b.eq	e11dc <memset+0x19c>  // b.none
   e1128:	91000c23 	add	x3, x1, #0x3
   e112c:	38256804 	strb	w4, [x0, x5]
   e1130:	eb03005f 	cmp	x2, x3
   e1134:	54000540 	b.eq	e11dc <memset+0x19c>  // b.none
   e1138:	91001025 	add	x5, x1, #0x4
   e113c:	38236804 	strb	w4, [x0, x3]
   e1140:	eb05005f 	cmp	x2, x5
   e1144:	540004c0 	b.eq	e11dc <memset+0x19c>  // b.none
   e1148:	91001423 	add	x3, x1, #0x5
   e114c:	38256804 	strb	w4, [x0, x5]
   e1150:	eb03005f 	cmp	x2, x3
   e1154:	54000440 	b.eq	e11dc <memset+0x19c>  // b.none
   e1158:	91001825 	add	x5, x1, #0x6
   e115c:	38236804 	strb	w4, [x0, x3]
   e1160:	eb05005f 	cmp	x2, x5
   e1164:	540003c0 	b.eq	e11dc <memset+0x19c>  // b.none
   e1168:	91001c23 	add	x3, x1, #0x7
   e116c:	38256804 	strb	w4, [x0, x5]
   e1170:	eb03005f 	cmp	x2, x3
   e1174:	54000340 	b.eq	e11dc <memset+0x19c>  // b.none
   e1178:	91002025 	add	x5, x1, #0x8
   e117c:	38236804 	strb	w4, [x0, x3]
   e1180:	eb05005f 	cmp	x2, x5
   e1184:	540002c0 	b.eq	e11dc <memset+0x19c>  // b.none
   e1188:	91002423 	add	x3, x1, #0x9
   e118c:	38256804 	strb	w4, [x0, x5]
   e1190:	eb03005f 	cmp	x2, x3
   e1194:	54000240 	b.eq	e11dc <memset+0x19c>  // b.none
   e1198:	91002825 	add	x5, x1, #0xa
   e119c:	38236804 	strb	w4, [x0, x3]
   e11a0:	eb05005f 	cmp	x2, x5
   e11a4:	540001c0 	b.eq	e11dc <memset+0x19c>  // b.none
   e11a8:	91002c23 	add	x3, x1, #0xb
   e11ac:	38256804 	strb	w4, [x0, x5]
   e11b0:	eb03005f 	cmp	x2, x3
   e11b4:	54000140 	b.eq	e11dc <memset+0x19c>  // b.none
   e11b8:	91003025 	add	x5, x1, #0xc
   e11bc:	38236804 	strb	w4, [x0, x3]
   e11c0:	eb05005f 	cmp	x2, x5
   e11c4:	540000c0 	b.eq	e11dc <memset+0x19c>  // b.none
   e11c8:	91003421 	add	x1, x1, #0xd
   e11cc:	38256804 	strb	w4, [x0, x5]
   e11d0:	eb01005f 	cmp	x2, x1
   e11d4:	54000040 	b.eq	e11dc <memset+0x19c>  // b.none
   e11d8:	38216804 	strb	w4, [x0, x1]
   e11dc:	d65f03c0 	ret
   e11e0:	d2800066 	mov	x6, #0x3                   	// #3
   e11e4:	17ffffb6 	b	e10bc <memset+0x7c>
   e11e8:	d2800026 	mov	x6, #0x1                   	// #1
   e11ec:	17ffffb4 	b	e10bc <memset+0x7c>
   e11f0:	d2800006 	mov	x6, #0x0                   	// #0
   e11f4:	17ffffb2 	b	e10bc <memset+0x7c>
   e11f8:	d2800001 	mov	x1, #0x0                   	// #0
   e11fc:	17ffffc3 	b	e1108 <memset+0xc8>
   e1200:	d2800046 	mov	x6, #0x2                   	// #2
   e1204:	17ffffae 	b	e10bc <memset+0x7c>
   e1208:	d2800086 	mov	x6, #0x4                   	// #4
   e120c:	17ffffac 	b	e10bc <memset+0x7c>
   e1210:	aa0303e6 	mov	x6, x3
   e1214:	17ffffaa 	b	e10bc <memset+0x7c>
   e1218:	d28000c6 	mov	x6, #0x6                   	// #6
   e121c:	17ffffa8 	b	e10bc <memset+0x7c>

00000000000e1220 <memmove>:
   e1220:	b40000c2 	cbz	x2, e1238 <memmove+0x18>
   e1224:	d503201f 	nop
   e1228:	d1000442 	sub	x2, x2, #0x1
   e122c:	38626823 	ldrb	w3, [x1, x2]
   e1230:	38226803 	strb	w3, [x0, x2]
   e1234:	b5ffffa2 	cbnz	x2, e1228 <memmove+0x8>
   e1238:	d65f03c0 	ret
