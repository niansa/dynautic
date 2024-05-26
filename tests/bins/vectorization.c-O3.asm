
vectorization.c.elf:     file format elf64-littleaarch64


Disassembly of section .start:

00000000000e0000 <_start>:
   e0000:	d10043ff 	sub	sp, sp, #0x10
   e0004:	d286020e 	mov	x14, #0x3010                	// #12304
   e0008:	d140cbff 	sub	sp, sp, #0x32, lsl #12
   e000c:	d288020f 	mov	x15, #0x4010                	// #16400
   e0010:	8b2e63e2 	add	x2, sp, x14
   e0014:	8b2f63e5 	add	x5, sp, x15
   e0018:	aa0203e1 	mov	x1, x2
   e001c:	52800023 	mov	w3, #0x1                   	// #1
   e0020:	528004e4 	mov	w4, #0x27                  	// #39
   e0024:	a9007bfd 	stp	x29, x30, [sp]
   e0028:	910003fd 	mov	x29, sp
   e002c:	d503201f 	nop
   e0030:	531d1060 	ubfiz	w0, w3, #3, #5
   e0034:	4b030000 	sub	w0, w0, w3
   e0038:	12001c00 	and	w0, w0, #0xff
   e003c:	4a040000 	eor	w0, w0, w4
   e0040:	11000400 	add	w0, w0, #0x1
   e0044:	12001c03 	and	w3, w0, #0xff
   e0048:	38001423 	strb	w3, [x1], #1
   e004c:	eb05003f 	cmp	x1, x5
   e0050:	54ffff01 	b.ne	e0030 <_start+0x30>  // b.any
   e0054:	d28a020d 	mov	x13, #0x5010                	// #20496
   e0058:	8b2d63e5 	add	x5, sp, x13
   e005c:	52800023 	mov	w3, #0x1                   	// #1
   e0060:	528004e4 	mov	w4, #0x27                  	// #39
   e0064:	d503201f 	nop
   e0068:	531d1060 	ubfiz	w0, w3, #3, #5
   e006c:	4b030000 	sub	w0, w0, w3
   e0070:	12001c00 	and	w0, w0, #0xff
   e0074:	4a040000 	eor	w0, w0, w4
   e0078:	11000400 	add	w0, w0, #0x1
   e007c:	12001c03 	and	w3, w0, #0xff
   e0080:	38001423 	strb	w3, [x1], #1
   e0084:	eb05003f 	cmp	x1, x5
   e0088:	54ffff01 	b.ne	e0068 <_start+0x68>  // b.any
   e008c:	aa0103e3 	mov	x3, x1
   e0090:	d28c020c 	mov	x12, #0x6010                	// #24592
   e0094:	910043e7 	add	x7, sp, #0x10
   e0098:	8b2c63e1 	add	x1, sp, x12
   e009c:	52800024 	mov	w4, #0x1                   	// #1
   e00a0:	528004e5 	mov	w5, #0x27                  	// #39
   e00a4:	d503201f 	nop
   e00a8:	531d1080 	ubfiz	w0, w4, #3, #5
   e00ac:	4b040000 	sub	w0, w0, w4
   e00b0:	12001c00 	and	w0, w0, #0xff
   e00b4:	4a050000 	eor	w0, w0, w5
   e00b8:	11000400 	add	w0, w0, #0x1
   e00bc:	12001c04 	and	w4, w0, #0xff
   e00c0:	38001464 	strb	w4, [x3], #1
   e00c4:	eb01007f 	cmp	x3, x1
   e00c8:	54ffff01 	b.ne	e00a8 <_start+0xa8>  // b.any
   e00cc:	d282020b 	mov	x11, #0x1010                	// #4112
   e00d0:	912000e3 	add	x3, x7, #0x800
   e00d4:	8b2b63e6 	add	x6, sp, x11
   e00d8:	52800024 	mov	w4, #0x1                   	// #1
   e00dc:	528004e5 	mov	w5, #0x27                  	// #39
   e00e0:	531d1080 	ubfiz	w0, w4, #3, #5
   e00e4:	4b040000 	sub	w0, w0, w4
   e00e8:	12001c00 	and	w0, w0, #0xff
   e00ec:	4a050000 	eor	w0, w0, w5
   e00f0:	11000400 	add	w0, w0, #0x1
   e00f4:	12001c04 	and	w4, w0, #0xff
   e00f8:	38001464 	strb	w4, [x3], #1
   e00fc:	eb06007f 	cmp	x3, x6
   e0100:	54ffff01 	b.ne	e00e0 <_start+0xe0>  // b.any
   e0104:	d283020a 	mov	x10, #0x1810                	// #6160
   e0108:	8b2a63e6 	add	x6, sp, x10
   e010c:	52800024 	mov	w4, #0x1                   	// #1
   e0110:	528004e5 	mov	w5, #0x27                  	// #39
   e0114:	d503201f 	nop
   e0118:	531d1080 	ubfiz	w0, w4, #3, #5
   e011c:	4b040000 	sub	w0, w0, w4
   e0120:	12001c00 	and	w0, w0, #0xff
   e0124:	4a050000 	eor	w0, w0, w5
   e0128:	11000400 	add	w0, w0, #0x1
   e012c:	12001c04 	and	w4, w0, #0xff
   e0130:	38001464 	strb	w4, [x3], #1
   e0134:	eb06007f 	cmp	x3, x6
   e0138:	54ffff01 	b.ne	e0118 <_start+0x118>  // b.any
   e013c:	d2840209 	mov	x9, #0x2010                	// #8208
   e0140:	8b2963e4 	add	x4, sp, x9
   e0144:	52800025 	mov	w5, #0x1                   	// #1
   e0148:	528004e6 	mov	w6, #0x27                  	// #39
   e014c:	d503201f 	nop
   e0150:	531d10a0 	ubfiz	w0, w5, #3, #5
   e0154:	4b050000 	sub	w0, w0, w5
   e0158:	12001c00 	and	w0, w0, #0xff
   e015c:	4a060000 	eor	w0, w0, w6
   e0160:	11000400 	add	w0, w0, #0x1
   e0164:	12001c05 	and	w5, w0, #0xff
   e0168:	38001465 	strb	w5, [x3], #1
   e016c:	eb04007f 	cmp	x3, x4
   e0170:	54ffff01 	b.ne	e0150 <_start+0x150>  // b.any
   e0174:	d2940206 	mov	x6, #0xa010                	// #40976
   e0178:	d2980208 	mov	x8, #0xc010                	// #49168
   e017c:	8b2863e8 	add	x8, sp, x8
   e0180:	8b2663e3 	add	x3, sp, x6
   e0184:	52800025 	mov	w5, #0x1                   	// #1
   e0188:	528004e6 	mov	w6, #0x27                  	// #39
   e018c:	d503201f 	nop
   e0190:	531d10a0 	ubfiz	w0, w5, #3, #5
   e0194:	4b050000 	sub	w0, w0, w5
   e0198:	12001c00 	and	w0, w0, #0xff
   e019c:	4a060000 	eor	w0, w0, w6
   e01a0:	11000400 	add	w0, w0, #0x1
   e01a4:	12001c05 	and	w5, w0, #0xff
   e01a8:	38001465 	strb	w5, [x3], #1
   e01ac:	eb08007f 	cmp	x3, x8
   e01b0:	54ffff01 	b.ne	e0190 <_start+0x190>  // b.any
   e01b4:	d29c0205 	mov	x5, #0xe010                	// #57360
   e01b8:	528004e6 	mov	w6, #0x27                  	// #39
   e01bc:	8b2563e8 	add	x8, sp, x5
   e01c0:	52800025 	mov	w5, #0x1                   	// #1
   e01c4:	d503201f 	nop
   e01c8:	531d10a0 	ubfiz	w0, w5, #3, #5
   e01cc:	4b050000 	sub	w0, w0, w5
   e01d0:	12001c00 	and	w0, w0, #0xff
   e01d4:	4a060000 	eor	w0, w0, w6
   e01d8:	11000400 	add	w0, w0, #0x1
   e01dc:	12001c05 	and	w5, w0, #0xff
   e01e0:	38001465 	strb	w5, [x3], #1
   e01e4:	eb08007f 	cmp	x3, x8
   e01e8:	54ffff01 	b.ne	e01c8 <_start+0x1c8>  // b.any
   e01ec:	914043e8 	add	x8, sp, #0x10, lsl #12
   e01f0:	52800025 	mov	w5, #0x1                   	// #1
   e01f4:	91004108 	add	x8, x8, #0x10
   e01f8:	528004e6 	mov	w6, #0x27                  	// #39
   e01fc:	d503201f 	nop
   e0200:	531d10a0 	ubfiz	w0, w5, #3, #5
   e0204:	4b050000 	sub	w0, w0, w5
   e0208:	12001c00 	and	w0, w0, #0xff
   e020c:	4a060000 	eor	w0, w0, w6
   e0210:	11000400 	add	w0, w0, #0x1
   e0214:	12001c05 	and	w5, w0, #0xff
   e0218:	38001465 	strb	w5, [x3], #1
   e021c:	eb08007f 	cmp	x3, x8
   e0220:	54ffff01 	b.ne	e0200 <_start+0x200>  // b.any
   e0224:	aa0403e3 	mov	x3, x4
   e0228:	528004e5 	mov	w5, #0x27                  	// #39
   e022c:	52800024 	mov	w4, #0x1                   	// #1
   e0230:	531d1080 	ubfiz	w0, w4, #3, #5
   e0234:	4b040000 	sub	w0, w0, w4
   e0238:	12001c00 	and	w0, w0, #0xff
   e023c:	4a050000 	eor	w0, w0, w5
   e0240:	11000400 	add	w0, w0, #0x1
   e0244:	12001c04 	and	w4, w0, #0xff
   e0248:	38001464 	strb	w4, [x3], #1
   e024c:	eb02007f 	cmp	x3, x2
   e0250:	54ffff01 	b.ne	e0230 <_start+0x230>  // b.any
   e0254:	d28e0202 	mov	x2, #0x7010                	// #28688
   e0258:	528004e3 	mov	w3, #0x27                  	// #39
   e025c:	8b2263e4 	add	x4, sp, x2
   e0260:	52800022 	mov	w2, #0x1                   	// #1
   e0264:	d503201f 	nop
   e0268:	531d1040 	ubfiz	w0, w2, #3, #5
   e026c:	4b020000 	sub	w0, w0, w2
   e0270:	12001c00 	and	w0, w0, #0xff
   e0274:	4a030000 	eor	w0, w0, w3
   e0278:	11000400 	add	w0, w0, #0x1
   e027c:	12001c02 	and	w2, w0, #0xff
   e0280:	38001422 	strb	w2, [x1], #1
   e0284:	eb04003f 	cmp	x1, x4
   e0288:	54ffff01 	b.ne	e0268 <_start+0x268>  // b.any
   e028c:	d2900200 	mov	x0, #0x8010                	// #32784
   e0290:	8b2063e4 	add	x4, sp, x0
   e0294:	52800022 	mov	w2, #0x1                   	// #1
   e0298:	528004e3 	mov	w3, #0x27                  	// #39
   e029c:	d503201f 	nop
   e02a0:	531d1040 	ubfiz	w0, w2, #3, #5
   e02a4:	4b020000 	sub	w0, w0, w2
   e02a8:	12001c00 	and	w0, w0, #0xff
   e02ac:	4a030000 	eor	w0, w0, w3
   e02b0:	11000400 	add	w0, w0, #0x1
   e02b4:	12001c02 	and	w2, w0, #0xff
   e02b8:	38001422 	strb	w2, [x1], #1
   e02bc:	eb04003f 	cmp	x1, x4
   e02c0:	54ffff01 	b.ne	e02a0 <_start+0x2a0>  // b.any
   e02c4:	91404be2 	add	x2, sp, #0x12, lsl #12
   e02c8:	91404fe4 	add	x4, sp, #0x13, lsl #12
   e02cc:	91004042 	add	x2, x2, #0x10
   e02d0:	91004084 	add	x4, x4, #0x10
   e02d4:	52800021 	mov	w1, #0x1                   	// #1
   e02d8:	528004e3 	mov	w3, #0x27                  	// #39
   e02dc:	d503201f 	nop
   e02e0:	531d1020 	ubfiz	w0, w1, #3, #5
   e02e4:	4b010000 	sub	w0, w0, w1
   e02e8:	12001c00 	and	w0, w0, #0xff
   e02ec:	4a030000 	eor	w0, w0, w3
   e02f0:	11000400 	add	w0, w0, #0x1
   e02f4:	12001c01 	and	w1, w0, #0xff
   e02f8:	38001441 	strb	w1, [x2], #1
   e02fc:	eb04005f 	cmp	x2, x4
   e0300:	54ffff01 	b.ne	e02e0 <_start+0x2e0>  // b.any
   e0304:	52850006 	mov	w6, #0x2800                	// #10240
   e0308:	aa0703e0 	mov	x0, x7
   e030c:	9400000d 	bl	e0340 <example1>
   e0310:	aa0703e0 	mov	x0, x7
   e0314:	9400000b 	bl	e0340 <example1>
   e0318:	710004c6 	subs	w6, w6, #0x1
   e031c:	54ffffa1 	b.ne	e0310 <_start+0x310>  // b.any
   e0320:	a9407bfd 	ldp	x29, x30, [sp]
   e0324:	910043ff 	add	sp, sp, #0x10
   e0328:	d2800000 	mov	x0, #0x0                   	// #0
   e032c:	9140cbff 	add	sp, sp, #0x32, lsl #12
   e0330:	d65f03c0 	ret

Disassembly of section .text:

00000000000e0340 <example1>:
   e0340:	91402805 	add	x5, x0, #0xa, lsl #12
   e0344:	91403004 	add	x4, x0, #0xc, lsl #12
   e0348:	91403803 	add	x3, x0, #0xe, lsl #12
   e034c:	d2800001 	mov	x1, #0x0                   	// #0
   e0350:	b8616880 	ldr	w0, [x4, x1]
   e0354:	b8616862 	ldr	w2, [x3, x1]
   e0358:	0b020000 	add	w0, w0, w2
   e035c:	b82168a0 	str	w0, [x5, x1]
   e0360:	91001021 	add	x1, x1, #0x4
   e0364:	f110003f 	cmp	x1, #0x400
   e0368:	54ffff41 	b.ne	e0350 <example1+0x10>  // b.any
   e036c:	d65f03c0 	ret

00000000000e0370 <example2a>:
   e0370:	2a0103e5 	mov	w5, w1
   e0374:	7100003f 	cmp	w1, #0x0
   e0378:	5400024d 	b.le	e03c0 <example2a+0x50>
   e037c:	7100043f 	cmp	w1, #0x1
   e0380:	54000220 	b.eq	e03c4 <example2a+0x54>  // b.none
   e0384:	d2800001 	mov	x1, #0x0                   	// #0
   e0388:	53017ca4 	lsr	w4, w5, #1
   e038c:	b3407c41 	bfxil	x1, x2, #0, #32
   e0390:	91403003 	add	x3, x0, #0xc, lsl #12
   e0394:	8b244c64 	add	x4, x3, w4, uxtw #3
   e0398:	b3607c41 	bfi	x1, x2, #32, #32
   e039c:	d503201f 	nop
   e03a0:	f8008461 	str	x1, [x3], #8
   e03a4:	eb04007f 	cmp	x3, x4
   e03a8:	54ffffc1 	b.ne	e03a0 <example2a+0x30>  // b.any
   e03ac:	121f78a1 	and	w1, w5, #0xfffffffe
   e03b0:	36000085 	tbz	w5, #0, e03c0 <example2a+0x50>
   e03b4:	93407c21 	sxtw	x1, w1
   e03b8:	91400c21 	add	x1, x1, #0x3, lsl #12
   e03bc:	b8217802 	str	w2, [x0, x1, lsl #2]
   e03c0:	d65f03c0 	ret
   e03c4:	52800001 	mov	w1, #0x0                   	// #0
   e03c8:	17fffffb 	b	e03b4 <example2a+0x44>
   e03cc:	d503201f 	nop

00000000000e03d0 <example2b>:
   e03d0:	aa0003e5 	mov	x5, x0
   e03d4:	340002c1 	cbz	w1, e042c <example2b+0x5c>
   e03d8:	7100043f 	cmp	w1, #0x1
   e03dc:	540002a0 	b.eq	e0430 <example2b+0x60>  // b.none
   e03e0:	53017c20 	lsr	w0, w1, #1
   e03e4:	914028a2 	add	x2, x5, #0xa, lsl #12
   e03e8:	8b204c40 	add	x0, x2, w0, uxtw #3
   e03ec:	d503201f 	nop
   e03f0:	f9500043 	ldr	x3, [x2, #8192]
   e03f4:	f9600044 	ldr	x4, [x2, #16384]
   e03f8:	8a040063 	and	x3, x3, x4
   e03fc:	f8008443 	str	x3, [x2], #8
   e0400:	eb02001f 	cmp	x0, x2
   e0404:	54ffff61 	b.ne	e03f0 <example2b+0x20>  // b.any
   e0408:	121f7820 	and	w0, w1, #0xfffffffe
   e040c:	36000101 	tbz	w1, #0, e042c <example2b+0x5c>
   e0410:	8b20c8a0 	add	x0, x5, w0, sxtw #2
   e0414:	91403001 	add	x1, x0, #0xc, lsl #12
   e0418:	91402000 	add	x0, x0, #0x8, lsl #12
   e041c:	b9400022 	ldr	w2, [x1]
   e0420:	b9600021 	ldr	w1, [x1, #8192]
   e0424:	0a020021 	and	w1, w1, w2
   e0428:	b9200001 	str	w1, [x0, #8192]
   e042c:	d65f03c0 	ret
   e0430:	52800000 	mov	w0, #0x0                   	// #0
   e0434:	17fffff7 	b	e0410 <example2b+0x40>
   e0438:	d503201f 	nop
   e043c:	d503201f 	nop

00000000000e0440 <example3>:
   e0440:	34000241 	cbz	w1, e0488 <example3+0x48>
   e0444:	7100043f 	cmp	w1, #0x1
   e0448:	540001c0 	b.eq	e0480 <example3+0x40>  // b.none
   e044c:	53017c25 	lsr	w5, w1, #1
   e0450:	d2800000 	mov	x0, #0x0                   	// #0
   e0454:	d37df0a5 	lsl	x5, x5, #3
   e0458:	f8606864 	ldr	x4, [x3, x0]
   e045c:	f8206844 	str	x4, [x2, x0]
   e0460:	91002000 	add	x0, x0, #0x8
   e0464:	eb0000bf 	cmp	x5, x0
   e0468:	54ffff81 	b.ne	e0458 <example3+0x18>  // b.any
   e046c:	121f7820 	and	w0, w1, #0xfffffffe
   e0470:	360000c1 	tbz	w1, #0, e0488 <example3+0x48>
   e0474:	d37ef400 	lsl	x0, x0, #2
   e0478:	8b000042 	add	x2, x2, x0
   e047c:	8b000063 	add	x3, x3, x0
   e0480:	b9400060 	ldr	w0, [x3]
   e0484:	b9000040 	str	w0, [x2]
   e0488:	d65f03c0 	ret
   e048c:	d503201f 	nop

00000000000e0490 <example4a>:
   e0490:	34000141 	cbz	w1, e04b8 <example4a+0x28>
   e0494:	d37e7c24 	ubfiz	x4, x1, #2, #32
   e0498:	d2800000 	mov	x0, #0x0                   	// #0
   e049c:	d503201f 	nop
   e04a0:	b8606861 	ldr	w1, [x3, x0]
   e04a4:	11001421 	add	w1, w1, #0x5
   e04a8:	b8206841 	str	w1, [x2, x0]
   e04ac:	91001000 	add	x0, x0, #0x4
   e04b0:	eb04001f 	cmp	x0, x4
   e04b4:	54ffff61 	b.ne	e04a0 <example4a+0x10>  // b.any
   e04b8:	d65f03c0 	ret
   e04bc:	d503201f 	nop

00000000000e04c0 <example4b>:
   e04c0:	7100003f 	cmp	w1, #0x0
   e04c4:	5400020d 	b.le	e0504 <example4b+0x44>
   e04c8:	937e7c24 	sbfiz	x4, x1, #2, #32
   e04cc:	91402806 	add	x6, x0, #0xa, lsl #12
   e04d0:	d2980081 	mov	x1, #0xc004                	// #49156
   e04d4:	d29c0182 	mov	x2, #0xe00c                	// #57356
   e04d8:	8b010005 	add	x5, x0, x1
   e04dc:	8b020003 	add	x3, x0, x2
   e04e0:	d2800000 	mov	x0, #0x0                   	// #0
   e04e4:	d503201f 	nop
   e04e8:	b86068a1 	ldr	w1, [x5, x0]
   e04ec:	b8606862 	ldr	w2, [x3, x0]
   e04f0:	0b020021 	add	w1, w1, w2
   e04f4:	b82068c1 	str	w1, [x6, x0]
   e04f8:	91001000 	add	x0, x0, #0x4
   e04fc:	eb00009f 	cmp	x4, x0
   e0500:	54ffff41 	b.ne	e04e8 <example4b+0x28>  // b.any
   e0504:	d65f03c0 	ret
   e0508:	d503201f 	nop
   e050c:	d503201f 	nop

00000000000e0510 <example4c>:
   e0510:	7100003f 	cmp	w1, #0x0
   e0514:	5400016d 	b.le	e0540 <example4c+0x30>
   e0518:	91402800 	add	x0, x0, #0xa, lsl #12
   e051c:	8b21c802 	add	x2, x0, w1, sxtw #2
   e0520:	b9400001 	ldr	w1, [x0]
   e0524:	91001000 	add	x0, x0, #0x4
   e0528:	7100103f 	cmp	w1, #0x4
   e052c:	1a9fd7e1 	cset	w1, gt
   e0530:	531e7421 	lsl	w1, w1, #2
   e0534:	b91ffc01 	str	w1, [x0, #8188]
   e0538:	eb00005f 	cmp	x2, x0
   e053c:	54ffff21 	b.ne	e0520 <example4c+0x10>  // b.any
   e0540:	d65f03c0 	ret

00000000000e0544 <example5>:
   e0544:	2a0103e4 	mov	w4, w1
   e0548:	7100003f 	cmp	w1, #0x0
   e054c:	5400024d 	b.le	e0594 <example5+0x50>
   e0550:	7100043f 	cmp	w1, #0x1
   e0554:	54000220 	b.eq	e0598 <example5+0x54>  // b.none
   e0558:	53017c23 	lsr	w3, w1, #1
   e055c:	91402402 	add	x2, x0, #0x9, lsl #12
   e0560:	d28000a1 	mov	x1, #0x5                   	// #5
   e0564:	8b234c43 	add	x3, x2, w3, uxtw #3
   e0568:	f2c000a1 	movk	x1, #0x5, lsl #32
   e056c:	d503201f 	nop
   e0570:	f8008441 	str	x1, [x2], #8
   e0574:	eb03005f 	cmp	x2, x3
   e0578:	54ffffc1 	b.ne	e0570 <example5+0x2c>  // b.any
   e057c:	121f7881 	and	w1, w4, #0xfffffffe
   e0580:	360000a4 	tbz	w4, #0, e0594 <example5+0x50>
   e0584:	d2848003 	mov	x3, #0x2400                	// #9216
   e0588:	528000a2 	mov	w2, #0x5                   	// #5
   e058c:	8b21c061 	add	x1, x3, w1, sxtw
   e0590:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0594:	d65f03c0 	ret
   e0598:	52800001 	mov	w1, #0x0                   	// #0
   e059c:	17fffffa 	b	e0584 <example5+0x40>

00000000000e05a0 <example7>:
   e05a0:	93407c22 	sxtw	x2, w1
   e05a4:	91400c43 	add	x3, x2, #0x3, lsl #12
   e05a8:	d37ef463 	lsl	x3, x3, #2
   e05ac:	8b030001 	add	x1, x0, x3
   e05b0:	f240083f 	tst	x1, #0x7
   e05b4:	54000121 	b.ne	e05d8 <example7+0x38>  // b.any
   e05b8:	91402803 	add	x3, x0, #0xa, lsl #12
   e05bc:	d2800000 	mov	x0, #0x0                   	// #0
   e05c0:	f8606822 	ldr	x2, [x1, x0]
   e05c4:	f8206862 	str	x2, [x3, x0]
   e05c8:	91002000 	add	x0, x0, #0x8
   e05cc:	f140041f 	cmp	x0, #0x1, lsl #12
   e05d0:	54ffff81 	b.ne	e05c0 <example7+0x20>  // b.any
   e05d4:	d65f03c0 	ret
   e05d8:	8b030000 	add	x0, x0, x3
   e05dc:	cb020be3 	neg	x3, x2, lsl #2
   e05e0:	d1400863 	sub	x3, x3, #0x2, lsl #12
   e05e4:	91400402 	add	x2, x0, #0x1, lsl #12
   e05e8:	aa0103e0 	mov	x0, x1
   e05ec:	d503201f 	nop
   e05f0:	b9400001 	ldr	w1, [x0]
   e05f4:	b8236801 	str	w1, [x0, x3]
   e05f8:	91001000 	add	x0, x0, #0x4
   e05fc:	eb02001f 	cmp	x0, x2
   e0600:	54ffff81 	b.ne	e05f0 <example7+0x50>  // b.any
   e0604:	d65f03c0 	ret
   e0608:	d503201f 	nop
   e060c:	d503201f 	nop

00000000000e0610 <example8>:
   e0610:	2a0103e6 	mov	w6, w1
   e0614:	91404804 	add	x4, x0, #0x12, lsl #12
   e0618:	91404c02 	add	x2, x0, #0x13, lsl #12
   e061c:	9140cc05 	add	x5, x0, #0x33, lsl #12
   e0620:	d2800001 	mov	x1, #0x0                   	// #0
   e0624:	aa0403e0 	mov	x0, x4
   e0628:	b3407cc1 	bfxil	x1, x6, #0, #32
   e062c:	b3607cc1 	bfi	x1, x6, #32, #32
   e0630:	f8008401 	str	x1, [x0], #8
   e0634:	eb02001f 	cmp	x0, x2
   e0638:	54ffffc1 	b.ne	e0630 <example8+0x20>  // b.any
   e063c:	91400402 	add	x2, x0, #0x1, lsl #12
   e0640:	91400484 	add	x4, x4, #0x1, lsl #12
   e0644:	eb05005f 	cmp	x2, x5
   e0648:	54fffec1 	b.ne	e0620 <example8+0x10>  // b.any
   e064c:	d65f03c0 	ret

00000000000e0650 <example9>:
   e0650:	91401802 	add	x2, x0, #0x6, lsl #12
   e0654:	91401c05 	add	x5, x0, #0x7, lsl #12
   e0658:	52800003 	mov	w3, #0x0                   	// #0
   e065c:	d503201f 	nop
   e0660:	b9400040 	ldr	w0, [x2]
   e0664:	91001042 	add	x2, x2, #0x4
   e0668:	b94ffc44 	ldr	w4, [x2, #4092]
   e066c:	4b040000 	sub	w0, w0, w4
   e0670:	0b000063 	add	w3, w3, w0
   e0674:	eb0200bf 	cmp	x5, x2
   e0678:	54ffff41 	b.ne	e0660 <example9+0x10>  // b.any
   e067c:	b9000023 	str	w3, [x1]
   e0680:	d65f03c0 	ret

00000000000e0684 <example10a>:
   e0684:	91400c02 	add	x2, x0, #0x3, lsl #12
   e0688:	91200001 	add	x1, x0, #0x800
   e068c:	91400406 	add	x6, x0, #0x1, lsl #12
   e0690:	b9500043 	ldr	w3, [x2, #4096]
   e0694:	b9600045 	ldr	w5, [x2, #8192]
   e0698:	79500020 	ldrh	w0, [x1, #2048]
   e069c:	79600024 	ldrh	w4, [x1, #4096]
   e06a0:	0b050063 	add	w3, w3, w5
   e06a4:	b8004443 	str	w3, [x2], #4
   e06a8:	0b040000 	add	w0, w0, w4
   e06ac:	78002420 	strh	w0, [x1], #2
   e06b0:	eb0100df 	cmp	x6, x1
   e06b4:	54fffee1 	b.ne	e0690 <example10a+0xc>  // b.any
   e06b8:	d65f03c0 	ret
   e06bc:	d503201f 	nop

00000000000e06c0 <example10b>:
   e06c0:	91400c03 	add	x3, x0, #0x3, lsl #12
   e06c4:	91400402 	add	x2, x0, #0x1, lsl #12
   e06c8:	d2800001 	mov	x1, #0x0                   	// #0
   e06cc:	d503201f 	nop
   e06d0:	78e17840 	ldrsh	w0, [x2, x1, lsl #1]
   e06d4:	b8217860 	str	w0, [x3, x1, lsl #2]
   e06d8:	91000421 	add	x1, x1, #0x1
   e06dc:	f110003f 	cmp	x1, #0x400
   e06e0:	54ffff81 	b.ne	e06d0 <example10b+0x10>  // b.any
   e06e4:	d65f03c0 	ret
   e06e8:	d503201f 	nop
   e06ec:	d503201f 	nop

00000000000e06f0 <example11>:
   e06f0:	91403001 	add	x1, x0, #0xc, lsl #12
   e06f4:	91402808 	add	x8, x0, #0xa, lsl #12
   e06f8:	91404007 	add	x7, x0, #0x10, lsl #12
   e06fc:	d2800002 	mov	x2, #0x0                   	// #0
   e0700:	29401025 	ldp	w5, w4, [x1]
   e0704:	91002021 	add	x1, x1, #0x8
   e0708:	b95ffc20 	ldr	w0, [x1, #8188]
   e070c:	b95ff823 	ldr	w3, [x1, #8184]
   e0710:	1b007c86 	mul	w6, w4, w0
   e0714:	1b037c84 	mul	w4, w4, w3
   e0718:	1b0398a3 	msub	w3, w5, w3, w6
   e071c:	1b051000 	madd	w0, w0, w5, w4
   e0720:	b8227903 	str	w3, [x8, x2, lsl #2]
   e0724:	b82278e0 	str	w0, [x7, x2, lsl #2]
   e0728:	91000442 	add	x2, x2, #0x1
   e072c:	f108005f 	cmp	x2, #0x200
   e0730:	54fffe81 	b.ne	e0700 <example11+0x10>  // b.any
   e0734:	d65f03c0 	ret
   e0738:	d503201f 	nop
   e073c:	d503201f 	nop

00000000000e0740 <example12>:
   e0740:	90000001 	adrp	x1, e0000 <_start>
   e0744:	91402803 	add	x3, x0, #0xa, lsl #12
   e0748:	91402c09 	add	x9, x0, #0xb, lsl #12
   e074c:	d2c00022 	mov	x2, #0x100000000           	// #4294967296
   e0750:	f9460421 	ldr	x1, [x1, #3080]
   e0754:	d503201f 	nop
   e0758:	11001048 	add	w8, w2, #0x4
   e075c:	11001027 	add	w7, w1, #0x4
   e0760:	9360fc46 	asr	x6, x2, #32
   e0764:	9360fc25 	asr	x5, x1, #32
   e0768:	d2800004 	mov	x4, #0x0                   	// #0
   e076c:	d2800000 	mov	x0, #0x0                   	// #0
   e0770:	b3407d04 	bfxil	x4, x8, #0, #32
   e0774:	110010c6 	add	w6, w6, #0x4
   e0778:	b3407ce0 	bfxil	x0, x7, #0, #32
   e077c:	110010a5 	add	w5, w5, #0x4
   e0780:	a9000462 	stp	x2, x1, [x3]
   e0784:	b3607cc4 	bfi	x4, x6, #32, #32
   e0788:	b3607ca0 	bfi	x0, x5, #32, #32
   e078c:	91004063 	add	x3, x3, #0x10
   e0790:	aa0403e2 	mov	x2, x4
   e0794:	aa0003e1 	mov	x1, x0
   e0798:	eb09007f 	cmp	x3, x9
   e079c:	54fffde1 	b.ne	e0758 <example12+0x18>  // b.any
   e07a0:	d65f03c0 	ret

00000000000e07a4 <example13>:
   e07a4:	aa0103e9 	mov	x9, x1
   e07a8:	aa0203e8 	mov	x8, x2
   e07ac:	aa0303e7 	mov	x7, x3
   e07b0:	d2800006 	mov	x6, #0x0                   	// #0
   e07b4:	d503201f 	nop
   e07b8:	f8667925 	ldr	x5, [x9, x6, lsl #3]
   e07bc:	d2800000 	mov	x0, #0x0                   	// #0
   e07c0:	f8667904 	ldr	x4, [x8, x6, lsl #3]
   e07c4:	52800002 	mov	w2, #0x0                   	// #0
   e07c8:	b86068a1 	ldr	w1, [x5, x0]
   e07cc:	b8606883 	ldr	w3, [x4, x0]
   e07d0:	91008000 	add	x0, x0, #0x20
   e07d4:	4b030021 	sub	w1, w1, w3
   e07d8:	0b010042 	add	w2, w2, w1
   e07dc:	f140041f 	cmp	x0, #0x1, lsl #12
   e07e0:	54ffff41 	b.ne	e07c8 <example13+0x24>  // b.any
   e07e4:	b82678e2 	str	w2, [x7, x6, lsl #2]
   e07e8:	910004c6 	add	x6, x6, #0x1
   e07ec:	f10080df 	cmp	x6, #0x20
   e07f0:	54fffe41 	b.ne	e07b8 <example13+0x14>  // b.any
   e07f4:	d65f03c0 	ret
   e07f8:	d503201f 	nop
   e07fc:	d503201f 	nop

00000000000e0800 <example14>:
   e0800:	aa0103e5 	mov	x5, x1
   e0804:	aa0203e6 	mov	x6, x2
   e0808:	aa0303e8 	mov	x8, x3
   e080c:	d2800007 	mov	x7, #0x0                   	// #0
   e0810:	d2800001 	mov	x1, #0x0                   	// #0
   e0814:	52800002 	mov	w2, #0x0                   	// #0
   e0818:	d2800000 	mov	x0, #0x0                   	// #0
   e081c:	d503201f 	nop
   e0820:	f86068a4 	ldr	x4, [x5, x0]
   e0824:	f86068c3 	ldr	x3, [x6, x0]
   e0828:	91002000 	add	x0, x0, #0x8
   e082c:	b8616884 	ldr	w4, [x4, x1]
   e0830:	b8616863 	ldr	w3, [x3, x1]
   e0834:	1b030882 	madd	w2, w4, w3, w2
   e0838:	f140081f 	cmp	x0, #0x2, lsl #12
   e083c:	54ffff21 	b.ne	e0820 <example14+0x20>  // b.any
   e0840:	91001021 	add	x1, x1, #0x4
   e0844:	f102003f 	cmp	x1, #0x80
   e0848:	54fffe81 	b.ne	e0818 <example14+0x18>  // b.any
   e084c:	b8277902 	str	w2, [x8, x7, lsl #2]
   e0850:	910004e7 	add	x7, x7, #0x1
   e0854:	910020a5 	add	x5, x5, #0x8
   e0858:	f10010ff 	cmp	x7, #0x4
   e085c:	54fffda1 	b.ne	e0810 <example14+0x10>  // b.any
   e0860:	d65f03c0 	ret

00000000000e0864 <example23>:
   e0864:	d2800000 	mov	x0, #0x0                   	// #0
   e0868:	78607823 	ldrh	w3, [x1, x0, lsl #1]
   e086c:	53196063 	lsl	w3, w3, #7
   e0870:	b8207843 	str	w3, [x2, x0, lsl #2]
   e0874:	91000400 	add	x0, x0, #0x1
   e0878:	f104001f 	cmp	x0, #0x100
   e087c:	54ffff61 	b.ne	e0868 <example23+0x4>  // b.any
   e0880:	d65f03c0 	ret

00000000000e0884 <init_memory>:
   e0884:	eb01001f 	cmp	x0, x1
   e0888:	540001a0 	b.eq	e08bc <init_memory+0x38>  // b.none
   e088c:	52800023 	mov	w3, #0x1                   	// #1
   e0890:	528004e4 	mov	w4, #0x27                  	// #39
   e0894:	d503201f 	nop
   e0898:	531d1062 	ubfiz	w2, w3, #3, #5
   e089c:	4b030042 	sub	w2, w2, w3
   e08a0:	12001c42 	and	w2, w2, #0xff
   e08a4:	4a040042 	eor	w2, w2, w4
   e08a8:	11000442 	add	w2, w2, #0x1
   e08ac:	12001c43 	and	w3, w2, #0xff
   e08b0:	38001403 	strb	w3, [x0], #1
   e08b4:	eb00003f 	cmp	x1, x0
   e08b8:	54ffff01 	b.ne	e0898 <init_memory+0x14>  // b.any
   e08bc:	d65f03c0 	ret

00000000000e08c0 <digest_memory>:
   e08c0:	aa0003e3 	mov	x3, x0
   e08c4:	52800020 	mov	w0, #0x1                   	// #1
   e08c8:	eb01007f 	cmp	x3, x1
   e08cc:	54000100 	b.eq	e08ec <digest_memory+0x2c>  // b.none
   e08d0:	38401462 	ldrb	w2, [x3], #1
   e08d4:	0b000400 	add	w0, w0, w0, lsl #1
   e08d8:	4a000042 	eor	w2, w2, w0
   e08dc:	53185c40 	lsl	w0, w2, #8
   e08e0:	4a422000 	eor	w0, w0, w2, lsr #8
   e08e4:	eb03003f 	cmp	x1, x3
   e08e8:	54ffff41 	b.ne	e08d0 <digest_memory+0x10>  // b.any
   e08ec:	d65f03c0 	ret

00000000000e08f0 <memcpy>:
   e08f0:	b4000222 	cbz	x2, e0934 <memcpy+0x44>
   e08f4:	d1000443 	sub	x3, x2, #0x1
   e08f8:	f1001c7f 	cmp	x3, #0x7
   e08fc:	54000729 	b.ls	e09e0 <memcpy+0xf0>  // b.plast
   e0900:	aa010005 	orr	x5, x0, x1
   e0904:	91000424 	add	x4, x1, #0x1
   e0908:	cb040004 	sub	x4, x0, x4
   e090c:	d2800003 	mov	x3, #0x0                   	// #0
   e0910:	f24008bf 	tst	x5, #0x7
   e0914:	fa460880 	ccmp	x4, #0x6, #0x0, eq	// eq = none
   e0918:	54000108 	b.hi	e0938 <memcpy+0x48>  // b.pmore
   e091c:	d503201f 	nop
   e0920:	38636824 	ldrb	w4, [x1, x3]
   e0924:	38236804 	strb	w4, [x0, x3]
   e0928:	91000463 	add	x3, x3, #0x1
   e092c:	eb03005f 	cmp	x2, x3
   e0930:	54ffff81 	b.ne	e0920 <memcpy+0x30>  // b.any
   e0934:	d65f03c0 	ret
   e0938:	927df044 	and	x4, x2, #0xfffffffffffffff8
   e093c:	d503201f 	nop
   e0940:	f8636825 	ldr	x5, [x1, x3]
   e0944:	f8236805 	str	x5, [x0, x3]
   e0948:	91002063 	add	x3, x3, #0x8
   e094c:	eb03009f 	cmp	x4, x3
   e0950:	54ffff81 	b.ne	e0940 <memcpy+0x50>  // b.any
   e0954:	eb04005f 	cmp	x2, x4
   e0958:	54fffee0 	b.eq	e0934 <memcpy+0x44>  // b.none
   e095c:	38646825 	ldrb	w5, [x1, x4]
   e0960:	91000483 	add	x3, x4, #0x1
   e0964:	38246805 	strb	w5, [x0, x4]
   e0968:	eb03005f 	cmp	x2, x3
   e096c:	54fffe40 	b.eq	e0934 <memcpy+0x44>  // b.none
   e0970:	38636826 	ldrb	w6, [x1, x3]
   e0974:	91000885 	add	x5, x4, #0x2
   e0978:	38236806 	strb	w6, [x0, x3]
   e097c:	eb05005f 	cmp	x2, x5
   e0980:	54fffda0 	b.eq	e0934 <memcpy+0x44>  // b.none
   e0984:	38656826 	ldrb	w6, [x1, x5]
   e0988:	91000c83 	add	x3, x4, #0x3
   e098c:	38256806 	strb	w6, [x0, x5]
   e0990:	eb03005f 	cmp	x2, x3
   e0994:	54fffd00 	b.eq	e0934 <memcpy+0x44>  // b.none
   e0998:	38636826 	ldrb	w6, [x1, x3]
   e099c:	91001085 	add	x5, x4, #0x4
   e09a0:	38236806 	strb	w6, [x0, x3]
   e09a4:	eb05005f 	cmp	x2, x5
   e09a8:	54fffc60 	b.eq	e0934 <memcpy+0x44>  // b.none
   e09ac:	38656826 	ldrb	w6, [x1, x5]
   e09b0:	91001483 	add	x3, x4, #0x5
   e09b4:	38256806 	strb	w6, [x0, x5]
   e09b8:	eb03005f 	cmp	x2, x3
   e09bc:	54fffbc0 	b.eq	e0934 <memcpy+0x44>  // b.none
   e09c0:	38636825 	ldrb	w5, [x1, x3]
   e09c4:	91001884 	add	x4, x4, #0x6
   e09c8:	38236805 	strb	w5, [x0, x3]
   e09cc:	eb04005f 	cmp	x2, x4
   e09d0:	54fffb20 	b.eq	e0934 <memcpy+0x44>  // b.none
   e09d4:	38646821 	ldrb	w1, [x1, x4]
   e09d8:	38246801 	strb	w1, [x0, x4]
   e09dc:	d65f03c0 	ret
   e09e0:	d2800003 	mov	x3, #0x0                   	// #0
   e09e4:	38636824 	ldrb	w4, [x1, x3]
   e09e8:	38236804 	strb	w4, [x0, x3]
   e09ec:	91000463 	add	x3, x3, #0x1
   e09f0:	eb03005f 	cmp	x2, x3
   e09f4:	54fff961 	b.ne	e0920 <memcpy+0x30>  // b.any
   e09f8:	17ffffcf 	b	e0934 <memcpy+0x44>
   e09fc:	d503201f 	nop

00000000000e0a00 <memset>:
   e0a00:	b4000ce2 	cbz	x2, e0b9c <memset+0x19c>
   e0a04:	cb0003e7 	neg	x7, x0
   e0a08:	d2800168 	mov	x8, #0xb                   	// #11
   e0a0c:	924008e3 	and	x3, x7, #0x7
   e0a10:	d1000446 	sub	x6, x2, #0x1
   e0a14:	91001c65 	add	x5, x3, #0x7
   e0a18:	12001c24 	and	w4, w1, #0xff
   e0a1c:	eb0800bf 	cmp	x5, x8
   e0a20:	9a8820a5 	csel	x5, x5, x8, cs	// cs = hs, nlast
   e0a24:	eb0500df 	cmp	x6, x5
   e0a28:	54000c83 	b.cc	e0bb8 <memset+0x1b8>  // b.lo, b.ul, b.last
   e0a2c:	b4000c23 	cbz	x3, e0bb0 <memset+0x1b0>
   e0a30:	39000004 	strb	w4, [x0]
   e0a34:	f27f04ff 	tst	x7, #0x6
   e0a38:	54000b80 	b.eq	e0ba8 <memset+0x1a8>  // b.none
   e0a3c:	39000404 	strb	w4, [x0, #1]
   e0a40:	f100087f 	cmp	x3, #0x2
   e0a44:	54000be9 	b.ls	e0bc0 <memset+0x1c0>  // b.plast
   e0a48:	39000804 	strb	w4, [x0, #2]
   e0a4c:	36100aa7 	tbz	w7, #2, e0ba0 <memset+0x1a0>
   e0a50:	39000c04 	strb	w4, [x0, #3]
   e0a54:	f100107f 	cmp	x3, #0x4
   e0a58:	54000b89 	b.ls	e0bc8 <memset+0x1c8>  // b.plast
   e0a5c:	39001004 	strb	w4, [x0, #4]
   e0a60:	f100147f 	cmp	x3, #0x5
   e0a64:	54000b60 	b.eq	e0bd0 <memset+0x1d0>  // b.none
   e0a68:	39001404 	strb	w4, [x0, #5]
   e0a6c:	f1001c7f 	cmp	x3, #0x7
   e0a70:	54000b41 	b.ne	e0bd8 <memset+0x1d8>  // b.any
   e0a74:	aa0303e6 	mov	x6, x3
   e0a78:	39001804 	strb	w4, [x0, #6]
   e0a7c:	d2800005 	mov	x5, #0x0                   	// #0
   e0a80:	cb030049 	sub	x9, x2, x3
   e0a84:	b3401c85 	bfxil	x5, x4, #0, #8
   e0a88:	8b030001 	add	x1, x0, x3
   e0a8c:	927df128 	and	x8, x9, #0xfffffffffffffff8
   e0a90:	b3781c85 	bfi	x5, x4, #8, #8
   e0a94:	8b080027 	add	x7, x1, x8
   e0a98:	b3701c85 	bfi	x5, x4, #16, #8
   e0a9c:	b3681c85 	bfi	x5, x4, #24, #8
   e0aa0:	b3601c85 	bfi	x5, x4, #32, #8
   e0aa4:	b3581c85 	bfi	x5, x4, #40, #8
   e0aa8:	b3501c85 	bfi	x5, x4, #48, #8
   e0aac:	b3481c85 	bfi	x5, x4, #56, #8
   e0ab0:	f8008425 	str	x5, [x1], #8
   e0ab4:	eb0100ff 	cmp	x7, x1
   e0ab8:	54ffffc1 	b.ne	e0ab0 <memset+0xb0>  // b.any
   e0abc:	8b0800c1 	add	x1, x6, x8
   e0ac0:	eb08013f 	cmp	x9, x8
   e0ac4:	540006c0 	b.eq	e0b9c <memset+0x19c>  // b.none
   e0ac8:	91000423 	add	x3, x1, #0x1
   e0acc:	38216804 	strb	w4, [x0, x1]
   e0ad0:	eb03005f 	cmp	x2, x3
   e0ad4:	54000640 	b.eq	e0b9c <memset+0x19c>  // b.none
   e0ad8:	91000825 	add	x5, x1, #0x2
   e0adc:	38236804 	strb	w4, [x0, x3]
   e0ae0:	eb05005f 	cmp	x2, x5
   e0ae4:	540005c0 	b.eq	e0b9c <memset+0x19c>  // b.none
   e0ae8:	91000c23 	add	x3, x1, #0x3
   e0aec:	38256804 	strb	w4, [x0, x5]
   e0af0:	eb03005f 	cmp	x2, x3
   e0af4:	54000540 	b.eq	e0b9c <memset+0x19c>  // b.none
   e0af8:	91001025 	add	x5, x1, #0x4
   e0afc:	38236804 	strb	w4, [x0, x3]
   e0b00:	eb05005f 	cmp	x2, x5
   e0b04:	540004c0 	b.eq	e0b9c <memset+0x19c>  // b.none
   e0b08:	91001423 	add	x3, x1, #0x5
   e0b0c:	38256804 	strb	w4, [x0, x5]
   e0b10:	eb03005f 	cmp	x2, x3
   e0b14:	54000440 	b.eq	e0b9c <memset+0x19c>  // b.none
   e0b18:	91001825 	add	x5, x1, #0x6
   e0b1c:	38236804 	strb	w4, [x0, x3]
   e0b20:	eb05005f 	cmp	x2, x5
   e0b24:	540003c0 	b.eq	e0b9c <memset+0x19c>  // b.none
   e0b28:	91001c23 	add	x3, x1, #0x7
   e0b2c:	38256804 	strb	w4, [x0, x5]
   e0b30:	eb03005f 	cmp	x2, x3
   e0b34:	54000340 	b.eq	e0b9c <memset+0x19c>  // b.none
   e0b38:	91002025 	add	x5, x1, #0x8
   e0b3c:	38236804 	strb	w4, [x0, x3]
   e0b40:	eb05005f 	cmp	x2, x5
   e0b44:	540002c0 	b.eq	e0b9c <memset+0x19c>  // b.none
   e0b48:	91002423 	add	x3, x1, #0x9
   e0b4c:	38256804 	strb	w4, [x0, x5]
   e0b50:	eb03005f 	cmp	x2, x3
   e0b54:	54000240 	b.eq	e0b9c <memset+0x19c>  // b.none
   e0b58:	91002825 	add	x5, x1, #0xa
   e0b5c:	38236804 	strb	w4, [x0, x3]
   e0b60:	eb05005f 	cmp	x2, x5
   e0b64:	540001c0 	b.eq	e0b9c <memset+0x19c>  // b.none
   e0b68:	91002c23 	add	x3, x1, #0xb
   e0b6c:	38256804 	strb	w4, [x0, x5]
   e0b70:	eb03005f 	cmp	x2, x3
   e0b74:	54000140 	b.eq	e0b9c <memset+0x19c>  // b.none
   e0b78:	91003025 	add	x5, x1, #0xc
   e0b7c:	38236804 	strb	w4, [x0, x3]
   e0b80:	eb05005f 	cmp	x2, x5
   e0b84:	540000c0 	b.eq	e0b9c <memset+0x19c>  // b.none
   e0b88:	91003421 	add	x1, x1, #0xd
   e0b8c:	38256804 	strb	w4, [x0, x5]
   e0b90:	eb01005f 	cmp	x2, x1
   e0b94:	54000040 	b.eq	e0b9c <memset+0x19c>  // b.none
   e0b98:	38216804 	strb	w4, [x0, x1]
   e0b9c:	d65f03c0 	ret
   e0ba0:	d2800066 	mov	x6, #0x3                   	// #3
   e0ba4:	17ffffb6 	b	e0a7c <memset+0x7c>
   e0ba8:	d2800026 	mov	x6, #0x1                   	// #1
   e0bac:	17ffffb4 	b	e0a7c <memset+0x7c>
   e0bb0:	d2800006 	mov	x6, #0x0                   	// #0
   e0bb4:	17ffffb2 	b	e0a7c <memset+0x7c>
   e0bb8:	d2800001 	mov	x1, #0x0                   	// #0
   e0bbc:	17ffffc3 	b	e0ac8 <memset+0xc8>
   e0bc0:	d2800046 	mov	x6, #0x2                   	// #2
   e0bc4:	17ffffae 	b	e0a7c <memset+0x7c>
   e0bc8:	d2800086 	mov	x6, #0x4                   	// #4
   e0bcc:	17ffffac 	b	e0a7c <memset+0x7c>
   e0bd0:	aa0303e6 	mov	x6, x3
   e0bd4:	17ffffaa 	b	e0a7c <memset+0x7c>
   e0bd8:	d28000c6 	mov	x6, #0x6                   	// #6
   e0bdc:	17ffffa8 	b	e0a7c <memset+0x7c>

00000000000e0be0 <memmove>:
   e0be0:	b40000c2 	cbz	x2, e0bf8 <memmove+0x18>
   e0be4:	d503201f 	nop
   e0be8:	d1000442 	sub	x2, x2, #0x1
   e0bec:	38626823 	ldrb	w3, [x1, x2]
   e0bf0:	38226803 	strb	w3, [x0, x2]
   e0bf4:	b5ffffa2 	cbnz	x2, e0be8 <memmove+0x8>
   e0bf8:	d65f03c0 	ret
