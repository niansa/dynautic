
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
   e030c:	94000099 	bl	e0570 <example1>
   e0310:	aa0703e0 	mov	x0, x7
   e0314:	94000097 	bl	e0570 <example1>
   e0318:	710004c6 	subs	w6, w6, #0x1
   e031c:	54ffffa1 	b.ne	e0310 <_start+0x310>  // b.any
   e0320:	52820003 	mov	w3, #0x1000                	// #4096
   e0324:	aa0703e0 	mov	x0, x7
   e0328:	9400008b 	bl	e0554 <example2a.constprop.0>
   e032c:	d503201f 	nop
   e0330:	aa0703e0 	mov	x0, x7
   e0334:	94000088 	bl	e0554 <example2a.constprop.0>
   e0338:	71000463 	subs	w3, w3, #0x1
   e033c:	54ffffa1 	b.ne	e0330 <_start+0x330>  // b.any
   e0340:	52810004 	mov	w4, #0x800                 	// #2048
   e0344:	aa0703e0 	mov	x0, x7
   e0348:	9400007a 	bl	e0530 <example2b.constprop.0>
   e034c:	d503201f 	nop
   e0350:	aa0703e0 	mov	x0, x7
   e0354:	94000077 	bl	e0530 <example2b.constprop.0>
   e0358:	71000484 	subs	w4, w4, #0x1
   e035c:	54ffffa1 	b.ne	e0350 <_start+0x350>  // b.any
   e0360:	52810006 	mov	w6, #0x800                 	// #2048
   e0364:	aa0703e0 	mov	x0, x7
   e0368:	94000062 	bl	e04f0 <example4b.constprop.0>
   e036c:	d503201f 	nop
   e0370:	aa0703e0 	mov	x0, x7
   e0374:	9400005f 	bl	e04f0 <example4b.constprop.0>
   e0378:	710004c6 	subs	w6, w6, #0x1
   e037c:	54ffffa1 	b.ne	e0370 <_start+0x370>  // b.any
   e0380:	52810003 	mov	w3, #0x800                 	// #2048
   e0384:	aa0703e0 	mov	x0, x7
   e0388:	9400004e 	bl	e04c0 <example4c.constprop.0>
   e038c:	d503201f 	nop
   e0390:	aa0703e0 	mov	x0, x7
   e0394:	9400004b 	bl	e04c0 <example4c.constprop.0>
   e0398:	71000463 	subs	w3, w3, #0x1
   e039c:	54ffffa1 	b.ne	e0390 <_start+0x390>  // b.any
   e03a0:	52820003 	mov	w3, #0x1000                	// #4096
   e03a4:	aa0703e0 	mov	x0, x7
   e03a8:	9400003e 	bl	e04a0 <example7.constprop.0>
   e03ac:	d503201f 	nop
   e03b0:	aa0703e0 	mov	x0, x7
   e03b4:	9400003b 	bl	e04a0 <example7.constprop.0>
   e03b8:	71000463 	subs	w3, w3, #0x1
   e03bc:	54ffffa1 	b.ne	e03b0 <_start+0x3b0>  // b.any
   e03c0:	52802005 	mov	w5, #0x100                 	// #256
   e03c4:	aa0703e0 	mov	x0, x7
   e03c8:	94000026 	bl	e0460 <example8.constprop.0>
   e03cc:	d503201f 	nop
   e03d0:	aa0703e0 	mov	x0, x7
   e03d4:	94000023 	bl	e0460 <example8.constprop.0>
   e03d8:	710004a5 	subs	w5, w5, #0x1
   e03dc:	54ffffa1 	b.ne	e03d0 <_start+0x3d0>  // b.any
   e03e0:	52810008 	mov	w8, #0x800                 	// #2048
   e03e4:	aa0703e0 	mov	x0, x7
   e03e8:	9400000e 	bl	e0420 <example10a.constprop.0>
   e03ec:	d503201f 	nop
   e03f0:	aa0703e0 	mov	x0, x7
   e03f4:	9400000b 	bl	e0420 <example10a.constprop.0>
   e03f8:	71000508 	subs	w8, w8, #0x1
   e03fc:	54ffffa1 	b.ne	e03f0 <_start+0x3f0>  // b.any
   e0400:	a9407bfd 	ldp	x29, x30, [sp]
   e0404:	910043ff 	add	sp, sp, #0x10
   e0408:	d2800000 	mov	x0, #0x0                   	// #0
   e040c:	9140cbff 	add	sp, sp, #0x32, lsl #12
   e0410:	d65f03c0 	ret

Disassembly of section .text:

00000000000e0420 <example10a.constprop.0>:
   e0420:	91400c02 	add	x2, x0, #0x3, lsl #12
   e0424:	91200001 	add	x1, x0, #0x800
   e0428:	91400406 	add	x6, x0, #0x1, lsl #12
   e042c:	d503201f 	nop
   e0430:	b9500043 	ldr	w3, [x2, #4096]
   e0434:	b9600045 	ldr	w5, [x2, #8192]
   e0438:	79500020 	ldrh	w0, [x1, #2048]
   e043c:	79600024 	ldrh	w4, [x1, #4096]
   e0440:	0b050063 	add	w3, w3, w5
   e0444:	b8004443 	str	w3, [x2], #4
   e0448:	0b040000 	add	w0, w0, w4
   e044c:	78002420 	strh	w0, [x1], #2
   e0450:	eb0100df 	cmp	x6, x1
   e0454:	54fffee1 	b.ne	e0430 <example10a.constprop.0+0x10>  // b.any
   e0458:	d65f03c0 	ret
   e045c:	d503201f 	nop

00000000000e0460 <example8.constprop.0>:
   e0460:	91404803 	add	x3, x0, #0x12, lsl #12
   e0464:	91404c01 	add	x1, x0, #0x13, lsl #12
   e0468:	9140cc04 	add	x4, x0, #0x33, lsl #12
   e046c:	b21d03e2 	mov	x2, #0x800000008           	// #34359738376
   e0470:	aa0303e0 	mov	x0, x3
   e0474:	d503201f 	nop
   e0478:	f8008402 	str	x2, [x0], #8
   e047c:	eb01001f 	cmp	x0, x1
   e0480:	54ffffc1 	b.ne	e0478 <example8.constprop.0+0x18>  // b.any
   e0484:	91400401 	add	x1, x0, #0x1, lsl #12
   e0488:	91400463 	add	x3, x3, #0x1, lsl #12
   e048c:	eb04003f 	cmp	x1, x4
   e0490:	54ffff01 	b.ne	e0470 <example8.constprop.0+0x10>  // b.any
   e0494:	d65f03c0 	ret
   e0498:	d503201f 	nop
   e049c:	d503201f 	nop

00000000000e04a0 <example7.constprop.0>:
   e04a0:	91402801 	add	x1, x0, #0xa, lsl #12
   e04a4:	91402c02 	add	x2, x0, #0xb, lsl #12
   e04a8:	f9500820 	ldr	x0, [x1, #8208]
   e04ac:	f8008420 	str	x0, [x1], #8
   e04b0:	eb01005f 	cmp	x2, x1
   e04b4:	54ffffa1 	b.ne	e04a8 <example7.constprop.0+0x8>  // b.any
   e04b8:	d65f03c0 	ret
   e04bc:	d503201f 	nop

00000000000e04c0 <example4c.constprop.0>:
   e04c0:	91402801 	add	x1, x0, #0xa, lsl #12
   e04c4:	91402c02 	add	x2, x0, #0xb, lsl #12
   e04c8:	b9400020 	ldr	w0, [x1]
   e04cc:	91001021 	add	x1, x1, #0x4
   e04d0:	7100101f 	cmp	w0, #0x4
   e04d4:	1a9fd7e0 	cset	w0, gt
   e04d8:	531e7400 	lsl	w0, w0, #2
   e04dc:	b91ffc20 	str	w0, [x1, #8188]
   e04e0:	eb01005f 	cmp	x2, x1
   e04e4:	54ffff21 	b.ne	e04c8 <example4c.constprop.0+0x8>  // b.any
   e04e8:	d65f03c0 	ret
   e04ec:	d503201f 	nop

00000000000e04f0 <example4b.constprop.0>:
   e04f0:	d2980082 	mov	x2, #0xc004                	// #49156
   e04f4:	d29c0183 	mov	x3, #0xe00c                	// #57356
   e04f8:	91402805 	add	x5, x0, #0xa, lsl #12
   e04fc:	8b020004 	add	x4, x0, x2
   e0500:	8b030003 	add	x3, x0, x3
   e0504:	d2800001 	mov	x1, #0x0                   	// #0
   e0508:	b8616880 	ldr	w0, [x4, x1]
   e050c:	b8616862 	ldr	w2, [x3, x1]
   e0510:	0b020000 	add	w0, w0, w2
   e0514:	b82168a0 	str	w0, [x5, x1]
   e0518:	91001021 	add	x1, x1, #0x4
   e051c:	f13f603f 	cmp	x1, #0xfd8
   e0520:	54ffff41 	b.ne	e0508 <example4b.constprop.0+0x18>  // b.any
   e0524:	d65f03c0 	ret
   e0528:	d503201f 	nop
   e052c:	d503201f 	nop

00000000000e0530 <example2b.constprop.0>:
   e0530:	91402801 	add	x1, x0, #0xa, lsl #12
   e0534:	91402c02 	add	x2, x0, #0xb, lsl #12
   e0538:	f9500023 	ldr	x3, [x1, #8192]
   e053c:	f9600020 	ldr	x0, [x1, #16384]
   e0540:	8a030000 	and	x0, x0, x3
   e0544:	f8008420 	str	x0, [x1], #8
   e0548:	eb01005f 	cmp	x2, x1
   e054c:	54ffff61 	b.ne	e0538 <example2b.constprop.0+0x8>  // b.any
   e0550:	d65f03c0 	ret

00000000000e0554 <example2a.constprop.0>:
   e0554:	91403001 	add	x1, x0, #0xc, lsl #12
   e0558:	91403400 	add	x0, x0, #0xd, lsl #12
   e055c:	b21f03e2 	mov	x2, #0x200000002           	// #8589934594
   e0560:	f8008422 	str	x2, [x1], #8
   e0564:	eb00003f 	cmp	x1, x0
   e0568:	54ffffc1 	b.ne	e0560 <example2a.constprop.0+0xc>  // b.any
   e056c:	d65f03c0 	ret

00000000000e0570 <example1>:
   e0570:	91402805 	add	x5, x0, #0xa, lsl #12
   e0574:	91403004 	add	x4, x0, #0xc, lsl #12
   e0578:	91403803 	add	x3, x0, #0xe, lsl #12
   e057c:	d2800001 	mov	x1, #0x0                   	// #0
   e0580:	b8616880 	ldr	w0, [x4, x1]
   e0584:	b8616862 	ldr	w2, [x3, x1]
   e0588:	0b020000 	add	w0, w0, w2
   e058c:	b82168a0 	str	w0, [x5, x1]
   e0590:	91001021 	add	x1, x1, #0x4
   e0594:	f110003f 	cmp	x1, #0x400
   e0598:	54ffff41 	b.ne	e0580 <example1+0x10>  // b.any
   e059c:	d65f03c0 	ret

00000000000e05a0 <example2a>:
   e05a0:	2a0103e5 	mov	w5, w1
   e05a4:	7100003f 	cmp	w1, #0x0
   e05a8:	5400024d 	b.le	e05f0 <example2a+0x50>
   e05ac:	7100043f 	cmp	w1, #0x1
   e05b0:	54000220 	b.eq	e05f4 <example2a+0x54>  // b.none
   e05b4:	d2800001 	mov	x1, #0x0                   	// #0
   e05b8:	53017ca4 	lsr	w4, w5, #1
   e05bc:	b3407c41 	bfxil	x1, x2, #0, #32
   e05c0:	91403003 	add	x3, x0, #0xc, lsl #12
   e05c4:	8b244c64 	add	x4, x3, w4, uxtw #3
   e05c8:	b3607c41 	bfi	x1, x2, #32, #32
   e05cc:	d503201f 	nop
   e05d0:	f8008461 	str	x1, [x3], #8
   e05d4:	eb04007f 	cmp	x3, x4
   e05d8:	54ffffc1 	b.ne	e05d0 <example2a+0x30>  // b.any
   e05dc:	121f78a1 	and	w1, w5, #0xfffffffe
   e05e0:	36000085 	tbz	w5, #0, e05f0 <example2a+0x50>
   e05e4:	93407c21 	sxtw	x1, w1
   e05e8:	91400c21 	add	x1, x1, #0x3, lsl #12
   e05ec:	b8217802 	str	w2, [x0, x1, lsl #2]
   e05f0:	d65f03c0 	ret
   e05f4:	52800001 	mov	w1, #0x0                   	// #0
   e05f8:	17fffffb 	b	e05e4 <example2a+0x44>
   e05fc:	d503201f 	nop

00000000000e0600 <example2b>:
   e0600:	aa0003e5 	mov	x5, x0
   e0604:	340002c1 	cbz	w1, e065c <example2b+0x5c>
   e0608:	7100043f 	cmp	w1, #0x1
   e060c:	540002a0 	b.eq	e0660 <example2b+0x60>  // b.none
   e0610:	53017c20 	lsr	w0, w1, #1
   e0614:	914028a2 	add	x2, x5, #0xa, lsl #12
   e0618:	8b204c40 	add	x0, x2, w0, uxtw #3
   e061c:	d503201f 	nop
   e0620:	f9500043 	ldr	x3, [x2, #8192]
   e0624:	f9600044 	ldr	x4, [x2, #16384]
   e0628:	8a040063 	and	x3, x3, x4
   e062c:	f8008443 	str	x3, [x2], #8
   e0630:	eb02001f 	cmp	x0, x2
   e0634:	54ffff61 	b.ne	e0620 <example2b+0x20>  // b.any
   e0638:	121f7820 	and	w0, w1, #0xfffffffe
   e063c:	36000101 	tbz	w1, #0, e065c <example2b+0x5c>
   e0640:	8b20c8a0 	add	x0, x5, w0, sxtw #2
   e0644:	91403001 	add	x1, x0, #0xc, lsl #12
   e0648:	91402000 	add	x0, x0, #0x8, lsl #12
   e064c:	b9400022 	ldr	w2, [x1]
   e0650:	b9600021 	ldr	w1, [x1, #8192]
   e0654:	0a020021 	and	w1, w1, w2
   e0658:	b9200001 	str	w1, [x0, #8192]
   e065c:	d65f03c0 	ret
   e0660:	52800000 	mov	w0, #0x0                   	// #0
   e0664:	17fffff7 	b	e0640 <example2b+0x40>
   e0668:	d503201f 	nop
   e066c:	d503201f 	nop

00000000000e0670 <example3>:
   e0670:	34000241 	cbz	w1, e06b8 <example3+0x48>
   e0674:	7100043f 	cmp	w1, #0x1
   e0678:	540001c0 	b.eq	e06b0 <example3+0x40>  // b.none
   e067c:	53017c25 	lsr	w5, w1, #1
   e0680:	d2800000 	mov	x0, #0x0                   	// #0
   e0684:	d37df0a5 	lsl	x5, x5, #3
   e0688:	f8606864 	ldr	x4, [x3, x0]
   e068c:	f8206844 	str	x4, [x2, x0]
   e0690:	91002000 	add	x0, x0, #0x8
   e0694:	eb0000bf 	cmp	x5, x0
   e0698:	54ffff81 	b.ne	e0688 <example3+0x18>  // b.any
   e069c:	121f7820 	and	w0, w1, #0xfffffffe
   e06a0:	360000c1 	tbz	w1, #0, e06b8 <example3+0x48>
   e06a4:	d37ef400 	lsl	x0, x0, #2
   e06a8:	8b000042 	add	x2, x2, x0
   e06ac:	8b000063 	add	x3, x3, x0
   e06b0:	b9400060 	ldr	w0, [x3]
   e06b4:	b9000040 	str	w0, [x2]
   e06b8:	d65f03c0 	ret
   e06bc:	d503201f 	nop

00000000000e06c0 <example4a>:
   e06c0:	34000141 	cbz	w1, e06e8 <example4a+0x28>
   e06c4:	d37e7c24 	ubfiz	x4, x1, #2, #32
   e06c8:	d2800000 	mov	x0, #0x0                   	// #0
   e06cc:	d503201f 	nop
   e06d0:	b8606861 	ldr	w1, [x3, x0]
   e06d4:	11001421 	add	w1, w1, #0x5
   e06d8:	b8206841 	str	w1, [x2, x0]
   e06dc:	91001000 	add	x0, x0, #0x4
   e06e0:	eb04001f 	cmp	x0, x4
   e06e4:	54ffff61 	b.ne	e06d0 <example4a+0x10>  // b.any
   e06e8:	d65f03c0 	ret
   e06ec:	d503201f 	nop

00000000000e06f0 <example4b>:
   e06f0:	7100003f 	cmp	w1, #0x0
   e06f4:	5400020d 	b.le	e0734 <example4b+0x44>
   e06f8:	937e7c24 	sbfiz	x4, x1, #2, #32
   e06fc:	91402806 	add	x6, x0, #0xa, lsl #12
   e0700:	d2980081 	mov	x1, #0xc004                	// #49156
   e0704:	d29c0182 	mov	x2, #0xe00c                	// #57356
   e0708:	8b010005 	add	x5, x0, x1
   e070c:	8b020003 	add	x3, x0, x2
   e0710:	d2800000 	mov	x0, #0x0                   	// #0
   e0714:	d503201f 	nop
   e0718:	b86068a1 	ldr	w1, [x5, x0]
   e071c:	b8606862 	ldr	w2, [x3, x0]
   e0720:	0b020021 	add	w1, w1, w2
   e0724:	b82068c1 	str	w1, [x6, x0]
   e0728:	91001000 	add	x0, x0, #0x4
   e072c:	eb00009f 	cmp	x4, x0
   e0730:	54ffff41 	b.ne	e0718 <example4b+0x28>  // b.any
   e0734:	d65f03c0 	ret
   e0738:	d503201f 	nop
   e073c:	d503201f 	nop

00000000000e0740 <example4c>:
   e0740:	7100003f 	cmp	w1, #0x0
   e0744:	5400016d 	b.le	e0770 <example4c+0x30>
   e0748:	91402800 	add	x0, x0, #0xa, lsl #12
   e074c:	8b21c802 	add	x2, x0, w1, sxtw #2
   e0750:	b9400001 	ldr	w1, [x0]
   e0754:	91001000 	add	x0, x0, #0x4
   e0758:	7100103f 	cmp	w1, #0x4
   e075c:	1a9fd7e1 	cset	w1, gt
   e0760:	531e7421 	lsl	w1, w1, #2
   e0764:	b91ffc01 	str	w1, [x0, #8188]
   e0768:	eb00005f 	cmp	x2, x0
   e076c:	54ffff21 	b.ne	e0750 <example4c+0x10>  // b.any
   e0770:	d65f03c0 	ret

00000000000e0774 <example5>:
   e0774:	2a0103e4 	mov	w4, w1
   e0778:	7100003f 	cmp	w1, #0x0
   e077c:	5400024d 	b.le	e07c4 <example5+0x50>
   e0780:	7100043f 	cmp	w1, #0x1
   e0784:	54000220 	b.eq	e07c8 <example5+0x54>  // b.none
   e0788:	53017c23 	lsr	w3, w1, #1
   e078c:	91402402 	add	x2, x0, #0x9, lsl #12
   e0790:	d28000a1 	mov	x1, #0x5                   	// #5
   e0794:	8b234c43 	add	x3, x2, w3, uxtw #3
   e0798:	f2c000a1 	movk	x1, #0x5, lsl #32
   e079c:	d503201f 	nop
   e07a0:	f8008441 	str	x1, [x2], #8
   e07a4:	eb03005f 	cmp	x2, x3
   e07a8:	54ffffc1 	b.ne	e07a0 <example5+0x2c>  // b.any
   e07ac:	121f7881 	and	w1, w4, #0xfffffffe
   e07b0:	360000a4 	tbz	w4, #0, e07c4 <example5+0x50>
   e07b4:	d2848003 	mov	x3, #0x2400                	// #9216
   e07b8:	528000a2 	mov	w2, #0x5                   	// #5
   e07bc:	8b21c061 	add	x1, x3, w1, sxtw
   e07c0:	b8217802 	str	w2, [x0, x1, lsl #2]
   e07c4:	d65f03c0 	ret
   e07c8:	52800001 	mov	w1, #0x0                   	// #0
   e07cc:	17fffffa 	b	e07b4 <example5+0x40>

00000000000e07d0 <example7>:
   e07d0:	93407c22 	sxtw	x2, w1
   e07d4:	91400c43 	add	x3, x2, #0x3, lsl #12
   e07d8:	d37ef463 	lsl	x3, x3, #2
   e07dc:	8b030001 	add	x1, x0, x3
   e07e0:	f240083f 	tst	x1, #0x7
   e07e4:	54000121 	b.ne	e0808 <example7+0x38>  // b.any
   e07e8:	91402803 	add	x3, x0, #0xa, lsl #12
   e07ec:	d2800000 	mov	x0, #0x0                   	// #0
   e07f0:	f8606822 	ldr	x2, [x1, x0]
   e07f4:	f8206862 	str	x2, [x3, x0]
   e07f8:	91002000 	add	x0, x0, #0x8
   e07fc:	f140041f 	cmp	x0, #0x1, lsl #12
   e0800:	54ffff81 	b.ne	e07f0 <example7+0x20>  // b.any
   e0804:	d65f03c0 	ret
   e0808:	8b030000 	add	x0, x0, x3
   e080c:	cb020be3 	neg	x3, x2, lsl #2
   e0810:	d1400863 	sub	x3, x3, #0x2, lsl #12
   e0814:	91400402 	add	x2, x0, #0x1, lsl #12
   e0818:	aa0103e0 	mov	x0, x1
   e081c:	d503201f 	nop
   e0820:	b9400001 	ldr	w1, [x0]
   e0824:	b8236801 	str	w1, [x0, x3]
   e0828:	91001000 	add	x0, x0, #0x4
   e082c:	eb02001f 	cmp	x0, x2
   e0830:	54ffff81 	b.ne	e0820 <example7+0x50>  // b.any
   e0834:	d65f03c0 	ret
   e0838:	d503201f 	nop
   e083c:	d503201f 	nop

00000000000e0840 <example8>:
   e0840:	2a0103e6 	mov	w6, w1
   e0844:	91404804 	add	x4, x0, #0x12, lsl #12
   e0848:	91404c02 	add	x2, x0, #0x13, lsl #12
   e084c:	9140cc05 	add	x5, x0, #0x33, lsl #12
   e0850:	d2800001 	mov	x1, #0x0                   	// #0
   e0854:	aa0403e0 	mov	x0, x4
   e0858:	b3407cc1 	bfxil	x1, x6, #0, #32
   e085c:	b3607cc1 	bfi	x1, x6, #32, #32
   e0860:	f8008401 	str	x1, [x0], #8
   e0864:	eb02001f 	cmp	x0, x2
   e0868:	54ffffc1 	b.ne	e0860 <example8+0x20>  // b.any
   e086c:	91400402 	add	x2, x0, #0x1, lsl #12
   e0870:	91400484 	add	x4, x4, #0x1, lsl #12
   e0874:	eb05005f 	cmp	x2, x5
   e0878:	54fffec1 	b.ne	e0850 <example8+0x10>  // b.any
   e087c:	d65f03c0 	ret

00000000000e0880 <example9>:
   e0880:	91401802 	add	x2, x0, #0x6, lsl #12
   e0884:	91401c05 	add	x5, x0, #0x7, lsl #12
   e0888:	52800003 	mov	w3, #0x0                   	// #0
   e088c:	d503201f 	nop
   e0890:	b9400040 	ldr	w0, [x2]
   e0894:	91001042 	add	x2, x2, #0x4
   e0898:	b94ffc44 	ldr	w4, [x2, #4092]
   e089c:	4b040000 	sub	w0, w0, w4
   e08a0:	0b000063 	add	w3, w3, w0
   e08a4:	eb0200bf 	cmp	x5, x2
   e08a8:	54ffff41 	b.ne	e0890 <example9+0x10>  // b.any
   e08ac:	b9000023 	str	w3, [x1]
   e08b0:	d65f03c0 	ret

00000000000e08b4 <example10a>:
   e08b4:	91400c02 	add	x2, x0, #0x3, lsl #12
   e08b8:	91200001 	add	x1, x0, #0x800
   e08bc:	91400406 	add	x6, x0, #0x1, lsl #12
   e08c0:	b9500043 	ldr	w3, [x2, #4096]
   e08c4:	b9600045 	ldr	w5, [x2, #8192]
   e08c8:	79500020 	ldrh	w0, [x1, #2048]
   e08cc:	79600024 	ldrh	w4, [x1, #4096]
   e08d0:	0b050063 	add	w3, w3, w5
   e08d4:	b8004443 	str	w3, [x2], #4
   e08d8:	0b040000 	add	w0, w0, w4
   e08dc:	78002420 	strh	w0, [x1], #2
   e08e0:	eb0100df 	cmp	x6, x1
   e08e4:	54fffee1 	b.ne	e08c0 <example10a+0xc>  // b.any
   e08e8:	d65f03c0 	ret
   e08ec:	d503201f 	nop

00000000000e08f0 <example10b>:
   e08f0:	91400c03 	add	x3, x0, #0x3, lsl #12
   e08f4:	91400402 	add	x2, x0, #0x1, lsl #12
   e08f8:	d2800001 	mov	x1, #0x0                   	// #0
   e08fc:	d503201f 	nop
   e0900:	78e17840 	ldrsh	w0, [x2, x1, lsl #1]
   e0904:	b8217860 	str	w0, [x3, x1, lsl #2]
   e0908:	91000421 	add	x1, x1, #0x1
   e090c:	f110003f 	cmp	x1, #0x400
   e0910:	54ffff81 	b.ne	e0900 <example10b+0x10>  // b.any
   e0914:	d65f03c0 	ret
   e0918:	d503201f 	nop
   e091c:	d503201f 	nop

00000000000e0920 <example11>:
   e0920:	91403001 	add	x1, x0, #0xc, lsl #12
   e0924:	91402808 	add	x8, x0, #0xa, lsl #12
   e0928:	91404007 	add	x7, x0, #0x10, lsl #12
   e092c:	d2800002 	mov	x2, #0x0                   	// #0
   e0930:	29401025 	ldp	w5, w4, [x1]
   e0934:	91002021 	add	x1, x1, #0x8
   e0938:	b95ffc20 	ldr	w0, [x1, #8188]
   e093c:	b95ff823 	ldr	w3, [x1, #8184]
   e0940:	1b007c86 	mul	w6, w4, w0
   e0944:	1b037c84 	mul	w4, w4, w3
   e0948:	1b0398a3 	msub	w3, w5, w3, w6
   e094c:	1b051000 	madd	w0, w0, w5, w4
   e0950:	b8227903 	str	w3, [x8, x2, lsl #2]
   e0954:	b82278e0 	str	w0, [x7, x2, lsl #2]
   e0958:	91000442 	add	x2, x2, #0x1
   e095c:	f108005f 	cmp	x2, #0x200
   e0960:	54fffe81 	b.ne	e0930 <example11+0x10>  // b.any
   e0964:	d65f03c0 	ret
   e0968:	d503201f 	nop
   e096c:	d503201f 	nop

00000000000e0970 <example12>:
   e0970:	90000001 	adrp	x1, e0000 <_start>
   e0974:	91402803 	add	x3, x0, #0xa, lsl #12
   e0978:	91402c09 	add	x9, x0, #0xb, lsl #12
   e097c:	d2c00022 	mov	x2, #0x100000000           	// #4294967296
   e0980:	f9471c21 	ldr	x1, [x1, #3640]
   e0984:	d503201f 	nop
   e0988:	11001048 	add	w8, w2, #0x4
   e098c:	11001027 	add	w7, w1, #0x4
   e0990:	9360fc46 	asr	x6, x2, #32
   e0994:	9360fc25 	asr	x5, x1, #32
   e0998:	d2800004 	mov	x4, #0x0                   	// #0
   e099c:	d2800000 	mov	x0, #0x0                   	// #0
   e09a0:	b3407d04 	bfxil	x4, x8, #0, #32
   e09a4:	110010c6 	add	w6, w6, #0x4
   e09a8:	b3407ce0 	bfxil	x0, x7, #0, #32
   e09ac:	110010a5 	add	w5, w5, #0x4
   e09b0:	a9000462 	stp	x2, x1, [x3]
   e09b4:	b3607cc4 	bfi	x4, x6, #32, #32
   e09b8:	b3607ca0 	bfi	x0, x5, #32, #32
   e09bc:	91004063 	add	x3, x3, #0x10
   e09c0:	aa0403e2 	mov	x2, x4
   e09c4:	aa0003e1 	mov	x1, x0
   e09c8:	eb09007f 	cmp	x3, x9
   e09cc:	54fffde1 	b.ne	e0988 <example12+0x18>  // b.any
   e09d0:	d65f03c0 	ret

00000000000e09d4 <example13>:
   e09d4:	aa0103e9 	mov	x9, x1
   e09d8:	aa0203e8 	mov	x8, x2
   e09dc:	aa0303e7 	mov	x7, x3
   e09e0:	d2800006 	mov	x6, #0x0                   	// #0
   e09e4:	d503201f 	nop
   e09e8:	f8667925 	ldr	x5, [x9, x6, lsl #3]
   e09ec:	d2800000 	mov	x0, #0x0                   	// #0
   e09f0:	f8667904 	ldr	x4, [x8, x6, lsl #3]
   e09f4:	52800002 	mov	w2, #0x0                   	// #0
   e09f8:	b86068a1 	ldr	w1, [x5, x0]
   e09fc:	b8606883 	ldr	w3, [x4, x0]
   e0a00:	91008000 	add	x0, x0, #0x20
   e0a04:	4b030021 	sub	w1, w1, w3
   e0a08:	0b010042 	add	w2, w2, w1
   e0a0c:	f140041f 	cmp	x0, #0x1, lsl #12
   e0a10:	54ffff41 	b.ne	e09f8 <example13+0x24>  // b.any
   e0a14:	b82678e2 	str	w2, [x7, x6, lsl #2]
   e0a18:	910004c6 	add	x6, x6, #0x1
   e0a1c:	f10080df 	cmp	x6, #0x20
   e0a20:	54fffe41 	b.ne	e09e8 <example13+0x14>  // b.any
   e0a24:	d65f03c0 	ret
   e0a28:	d503201f 	nop
   e0a2c:	d503201f 	nop

00000000000e0a30 <example14>:
   e0a30:	aa0103e5 	mov	x5, x1
   e0a34:	aa0203e6 	mov	x6, x2
   e0a38:	aa0303e8 	mov	x8, x3
   e0a3c:	d2800007 	mov	x7, #0x0                   	// #0
   e0a40:	d2800001 	mov	x1, #0x0                   	// #0
   e0a44:	52800002 	mov	w2, #0x0                   	// #0
   e0a48:	d2800000 	mov	x0, #0x0                   	// #0
   e0a4c:	d503201f 	nop
   e0a50:	f86068a4 	ldr	x4, [x5, x0]
   e0a54:	f86068c3 	ldr	x3, [x6, x0]
   e0a58:	91002000 	add	x0, x0, #0x8
   e0a5c:	b8616884 	ldr	w4, [x4, x1]
   e0a60:	b8616863 	ldr	w3, [x3, x1]
   e0a64:	1b030882 	madd	w2, w4, w3, w2
   e0a68:	f140081f 	cmp	x0, #0x2, lsl #12
   e0a6c:	54ffff21 	b.ne	e0a50 <example14+0x20>  // b.any
   e0a70:	91001021 	add	x1, x1, #0x4
   e0a74:	f102003f 	cmp	x1, #0x80
   e0a78:	54fffe81 	b.ne	e0a48 <example14+0x18>  // b.any
   e0a7c:	b8277902 	str	w2, [x8, x7, lsl #2]
   e0a80:	910004e7 	add	x7, x7, #0x1
   e0a84:	910020a5 	add	x5, x5, #0x8
   e0a88:	f10010ff 	cmp	x7, #0x4
   e0a8c:	54fffda1 	b.ne	e0a40 <example14+0x10>  // b.any
   e0a90:	d65f03c0 	ret

00000000000e0a94 <example23>:
   e0a94:	d2800000 	mov	x0, #0x0                   	// #0
   e0a98:	78607823 	ldrh	w3, [x1, x0, lsl #1]
   e0a9c:	53196063 	lsl	w3, w3, #7
   e0aa0:	b8207843 	str	w3, [x2, x0, lsl #2]
   e0aa4:	91000400 	add	x0, x0, #0x1
   e0aa8:	f104001f 	cmp	x0, #0x100
   e0aac:	54ffff61 	b.ne	e0a98 <example23+0x4>  // b.any
   e0ab0:	d65f03c0 	ret

00000000000e0ab4 <init_memory>:
   e0ab4:	eb01001f 	cmp	x0, x1
   e0ab8:	540001a0 	b.eq	e0aec <init_memory+0x38>  // b.none
   e0abc:	52800023 	mov	w3, #0x1                   	// #1
   e0ac0:	528004e4 	mov	w4, #0x27                  	// #39
   e0ac4:	d503201f 	nop
   e0ac8:	531d1062 	ubfiz	w2, w3, #3, #5
   e0acc:	4b030042 	sub	w2, w2, w3
   e0ad0:	12001c42 	and	w2, w2, #0xff
   e0ad4:	4a040042 	eor	w2, w2, w4
   e0ad8:	11000442 	add	w2, w2, #0x1
   e0adc:	12001c43 	and	w3, w2, #0xff
   e0ae0:	38001403 	strb	w3, [x0], #1
   e0ae4:	eb00003f 	cmp	x1, x0
   e0ae8:	54ffff01 	b.ne	e0ac8 <init_memory+0x14>  // b.any
   e0aec:	d65f03c0 	ret

00000000000e0af0 <digest_memory>:
   e0af0:	aa0003e3 	mov	x3, x0
   e0af4:	52800020 	mov	w0, #0x1                   	// #1
   e0af8:	eb01007f 	cmp	x3, x1
   e0afc:	54000100 	b.eq	e0b1c <digest_memory+0x2c>  // b.none
   e0b00:	38401462 	ldrb	w2, [x3], #1
   e0b04:	0b000400 	add	w0, w0, w0, lsl #1
   e0b08:	4a000042 	eor	w2, w2, w0
   e0b0c:	53185c40 	lsl	w0, w2, #8
   e0b10:	4a422000 	eor	w0, w0, w2, lsr #8
   e0b14:	eb03003f 	cmp	x1, x3
   e0b18:	54ffff41 	b.ne	e0b00 <digest_memory+0x10>  // b.any
   e0b1c:	d65f03c0 	ret

00000000000e0b20 <memcpy>:
   e0b20:	b4000222 	cbz	x2, e0b64 <memcpy+0x44>
   e0b24:	d1000443 	sub	x3, x2, #0x1
   e0b28:	f1001c7f 	cmp	x3, #0x7
   e0b2c:	54000729 	b.ls	e0c10 <memcpy+0xf0>  // b.plast
   e0b30:	aa010005 	orr	x5, x0, x1
   e0b34:	91000424 	add	x4, x1, #0x1
   e0b38:	cb040004 	sub	x4, x0, x4
   e0b3c:	d2800003 	mov	x3, #0x0                   	// #0
   e0b40:	f24008bf 	tst	x5, #0x7
   e0b44:	fa460880 	ccmp	x4, #0x6, #0x0, eq	// eq = none
   e0b48:	54000108 	b.hi	e0b68 <memcpy+0x48>  // b.pmore
   e0b4c:	d503201f 	nop
   e0b50:	38636824 	ldrb	w4, [x1, x3]
   e0b54:	38236804 	strb	w4, [x0, x3]
   e0b58:	91000463 	add	x3, x3, #0x1
   e0b5c:	eb03005f 	cmp	x2, x3
   e0b60:	54ffff81 	b.ne	e0b50 <memcpy+0x30>  // b.any
   e0b64:	d65f03c0 	ret
   e0b68:	927df044 	and	x4, x2, #0xfffffffffffffff8
   e0b6c:	d503201f 	nop
   e0b70:	f8636825 	ldr	x5, [x1, x3]
   e0b74:	f8236805 	str	x5, [x0, x3]
   e0b78:	91002063 	add	x3, x3, #0x8
   e0b7c:	eb03009f 	cmp	x4, x3
   e0b80:	54ffff81 	b.ne	e0b70 <memcpy+0x50>  // b.any
   e0b84:	eb04005f 	cmp	x2, x4
   e0b88:	54fffee0 	b.eq	e0b64 <memcpy+0x44>  // b.none
   e0b8c:	38646825 	ldrb	w5, [x1, x4]
   e0b90:	91000483 	add	x3, x4, #0x1
   e0b94:	38246805 	strb	w5, [x0, x4]
   e0b98:	eb03005f 	cmp	x2, x3
   e0b9c:	54fffe40 	b.eq	e0b64 <memcpy+0x44>  // b.none
   e0ba0:	38636826 	ldrb	w6, [x1, x3]
   e0ba4:	91000885 	add	x5, x4, #0x2
   e0ba8:	38236806 	strb	w6, [x0, x3]
   e0bac:	eb05005f 	cmp	x2, x5
   e0bb0:	54fffda0 	b.eq	e0b64 <memcpy+0x44>  // b.none
   e0bb4:	38656826 	ldrb	w6, [x1, x5]
   e0bb8:	91000c83 	add	x3, x4, #0x3
   e0bbc:	38256806 	strb	w6, [x0, x5]
   e0bc0:	eb03005f 	cmp	x2, x3
   e0bc4:	54fffd00 	b.eq	e0b64 <memcpy+0x44>  // b.none
   e0bc8:	38636826 	ldrb	w6, [x1, x3]
   e0bcc:	91001085 	add	x5, x4, #0x4
   e0bd0:	38236806 	strb	w6, [x0, x3]
   e0bd4:	eb05005f 	cmp	x2, x5
   e0bd8:	54fffc60 	b.eq	e0b64 <memcpy+0x44>  // b.none
   e0bdc:	38656826 	ldrb	w6, [x1, x5]
   e0be0:	91001483 	add	x3, x4, #0x5
   e0be4:	38256806 	strb	w6, [x0, x5]
   e0be8:	eb03005f 	cmp	x2, x3
   e0bec:	54fffbc0 	b.eq	e0b64 <memcpy+0x44>  // b.none
   e0bf0:	38636825 	ldrb	w5, [x1, x3]
   e0bf4:	91001884 	add	x4, x4, #0x6
   e0bf8:	38236805 	strb	w5, [x0, x3]
   e0bfc:	eb04005f 	cmp	x2, x4
   e0c00:	54fffb20 	b.eq	e0b64 <memcpy+0x44>  // b.none
   e0c04:	38646821 	ldrb	w1, [x1, x4]
   e0c08:	38246801 	strb	w1, [x0, x4]
   e0c0c:	d65f03c0 	ret
   e0c10:	d2800003 	mov	x3, #0x0                   	// #0
   e0c14:	38636824 	ldrb	w4, [x1, x3]
   e0c18:	38236804 	strb	w4, [x0, x3]
   e0c1c:	91000463 	add	x3, x3, #0x1
   e0c20:	eb03005f 	cmp	x2, x3
   e0c24:	54fff961 	b.ne	e0b50 <memcpy+0x30>  // b.any
   e0c28:	17ffffcf 	b	e0b64 <memcpy+0x44>
   e0c2c:	d503201f 	nop

00000000000e0c30 <memset>:
   e0c30:	b4000ce2 	cbz	x2, e0dcc <memset+0x19c>
   e0c34:	cb0003e7 	neg	x7, x0
   e0c38:	d2800168 	mov	x8, #0xb                   	// #11
   e0c3c:	924008e3 	and	x3, x7, #0x7
   e0c40:	d1000446 	sub	x6, x2, #0x1
   e0c44:	91001c65 	add	x5, x3, #0x7
   e0c48:	12001c24 	and	w4, w1, #0xff
   e0c4c:	eb0800bf 	cmp	x5, x8
   e0c50:	9a8820a5 	csel	x5, x5, x8, cs	// cs = hs, nlast
   e0c54:	eb0500df 	cmp	x6, x5
   e0c58:	54000c83 	b.cc	e0de8 <memset+0x1b8>  // b.lo, b.ul, b.last
   e0c5c:	b4000c23 	cbz	x3, e0de0 <memset+0x1b0>
   e0c60:	39000004 	strb	w4, [x0]
   e0c64:	f27f04ff 	tst	x7, #0x6
   e0c68:	54000b80 	b.eq	e0dd8 <memset+0x1a8>  // b.none
   e0c6c:	39000404 	strb	w4, [x0, #1]
   e0c70:	f100087f 	cmp	x3, #0x2
   e0c74:	54000be9 	b.ls	e0df0 <memset+0x1c0>  // b.plast
   e0c78:	39000804 	strb	w4, [x0, #2]
   e0c7c:	36100aa7 	tbz	w7, #2, e0dd0 <memset+0x1a0>
   e0c80:	39000c04 	strb	w4, [x0, #3]
   e0c84:	f100107f 	cmp	x3, #0x4
   e0c88:	54000b89 	b.ls	e0df8 <memset+0x1c8>  // b.plast
   e0c8c:	39001004 	strb	w4, [x0, #4]
   e0c90:	f100147f 	cmp	x3, #0x5
   e0c94:	54000b60 	b.eq	e0e00 <memset+0x1d0>  // b.none
   e0c98:	39001404 	strb	w4, [x0, #5]
   e0c9c:	f1001c7f 	cmp	x3, #0x7
   e0ca0:	54000b41 	b.ne	e0e08 <memset+0x1d8>  // b.any
   e0ca4:	aa0303e6 	mov	x6, x3
   e0ca8:	39001804 	strb	w4, [x0, #6]
   e0cac:	d2800005 	mov	x5, #0x0                   	// #0
   e0cb0:	cb030049 	sub	x9, x2, x3
   e0cb4:	b3401c85 	bfxil	x5, x4, #0, #8
   e0cb8:	8b030001 	add	x1, x0, x3
   e0cbc:	927df128 	and	x8, x9, #0xfffffffffffffff8
   e0cc0:	b3781c85 	bfi	x5, x4, #8, #8
   e0cc4:	8b080027 	add	x7, x1, x8
   e0cc8:	b3701c85 	bfi	x5, x4, #16, #8
   e0ccc:	b3681c85 	bfi	x5, x4, #24, #8
   e0cd0:	b3601c85 	bfi	x5, x4, #32, #8
   e0cd4:	b3581c85 	bfi	x5, x4, #40, #8
   e0cd8:	b3501c85 	bfi	x5, x4, #48, #8
   e0cdc:	b3481c85 	bfi	x5, x4, #56, #8
   e0ce0:	f8008425 	str	x5, [x1], #8
   e0ce4:	eb0100ff 	cmp	x7, x1
   e0ce8:	54ffffc1 	b.ne	e0ce0 <memset+0xb0>  // b.any
   e0cec:	8b0800c1 	add	x1, x6, x8
   e0cf0:	eb08013f 	cmp	x9, x8
   e0cf4:	540006c0 	b.eq	e0dcc <memset+0x19c>  // b.none
   e0cf8:	91000423 	add	x3, x1, #0x1
   e0cfc:	38216804 	strb	w4, [x0, x1]
   e0d00:	eb03005f 	cmp	x2, x3
   e0d04:	54000640 	b.eq	e0dcc <memset+0x19c>  // b.none
   e0d08:	91000825 	add	x5, x1, #0x2
   e0d0c:	38236804 	strb	w4, [x0, x3]
   e0d10:	eb05005f 	cmp	x2, x5
   e0d14:	540005c0 	b.eq	e0dcc <memset+0x19c>  // b.none
   e0d18:	91000c23 	add	x3, x1, #0x3
   e0d1c:	38256804 	strb	w4, [x0, x5]
   e0d20:	eb03005f 	cmp	x2, x3
   e0d24:	54000540 	b.eq	e0dcc <memset+0x19c>  // b.none
   e0d28:	91001025 	add	x5, x1, #0x4
   e0d2c:	38236804 	strb	w4, [x0, x3]
   e0d30:	eb05005f 	cmp	x2, x5
   e0d34:	540004c0 	b.eq	e0dcc <memset+0x19c>  // b.none
   e0d38:	91001423 	add	x3, x1, #0x5
   e0d3c:	38256804 	strb	w4, [x0, x5]
   e0d40:	eb03005f 	cmp	x2, x3
   e0d44:	54000440 	b.eq	e0dcc <memset+0x19c>  // b.none
   e0d48:	91001825 	add	x5, x1, #0x6
   e0d4c:	38236804 	strb	w4, [x0, x3]
   e0d50:	eb05005f 	cmp	x2, x5
   e0d54:	540003c0 	b.eq	e0dcc <memset+0x19c>  // b.none
   e0d58:	91001c23 	add	x3, x1, #0x7
   e0d5c:	38256804 	strb	w4, [x0, x5]
   e0d60:	eb03005f 	cmp	x2, x3
   e0d64:	54000340 	b.eq	e0dcc <memset+0x19c>  // b.none
   e0d68:	91002025 	add	x5, x1, #0x8
   e0d6c:	38236804 	strb	w4, [x0, x3]
   e0d70:	eb05005f 	cmp	x2, x5
   e0d74:	540002c0 	b.eq	e0dcc <memset+0x19c>  // b.none
   e0d78:	91002423 	add	x3, x1, #0x9
   e0d7c:	38256804 	strb	w4, [x0, x5]
   e0d80:	eb03005f 	cmp	x2, x3
   e0d84:	54000240 	b.eq	e0dcc <memset+0x19c>  // b.none
   e0d88:	91002825 	add	x5, x1, #0xa
   e0d8c:	38236804 	strb	w4, [x0, x3]
   e0d90:	eb05005f 	cmp	x2, x5
   e0d94:	540001c0 	b.eq	e0dcc <memset+0x19c>  // b.none
   e0d98:	91002c23 	add	x3, x1, #0xb
   e0d9c:	38256804 	strb	w4, [x0, x5]
   e0da0:	eb03005f 	cmp	x2, x3
   e0da4:	54000140 	b.eq	e0dcc <memset+0x19c>  // b.none
   e0da8:	91003025 	add	x5, x1, #0xc
   e0dac:	38236804 	strb	w4, [x0, x3]
   e0db0:	eb05005f 	cmp	x2, x5
   e0db4:	540000c0 	b.eq	e0dcc <memset+0x19c>  // b.none
   e0db8:	91003421 	add	x1, x1, #0xd
   e0dbc:	38256804 	strb	w4, [x0, x5]
   e0dc0:	eb01005f 	cmp	x2, x1
   e0dc4:	54000040 	b.eq	e0dcc <memset+0x19c>  // b.none
   e0dc8:	38216804 	strb	w4, [x0, x1]
   e0dcc:	d65f03c0 	ret
   e0dd0:	d2800066 	mov	x6, #0x3                   	// #3
   e0dd4:	17ffffb6 	b	e0cac <memset+0x7c>
   e0dd8:	d2800026 	mov	x6, #0x1                   	// #1
   e0ddc:	17ffffb4 	b	e0cac <memset+0x7c>
   e0de0:	d2800006 	mov	x6, #0x0                   	// #0
   e0de4:	17ffffb2 	b	e0cac <memset+0x7c>
   e0de8:	d2800001 	mov	x1, #0x0                   	// #0
   e0dec:	17ffffc3 	b	e0cf8 <memset+0xc8>
   e0df0:	d2800046 	mov	x6, #0x2                   	// #2
   e0df4:	17ffffae 	b	e0cac <memset+0x7c>
   e0df8:	d2800086 	mov	x6, #0x4                   	// #4
   e0dfc:	17ffffac 	b	e0cac <memset+0x7c>
   e0e00:	aa0303e6 	mov	x6, x3
   e0e04:	17ffffaa 	b	e0cac <memset+0x7c>
   e0e08:	d28000c6 	mov	x6, #0x6                   	// #6
   e0e0c:	17ffffa8 	b	e0cac <memset+0x7c>

00000000000e0e10 <memmove>:
   e0e10:	b40000c2 	cbz	x2, e0e28 <memmove+0x18>
   e0e14:	d503201f 	nop
   e0e18:	d1000442 	sub	x2, x2, #0x1
   e0e1c:	38626823 	ldrb	w3, [x1, x2]
   e0e20:	38226803 	strb	w3, [x0, x2]
   e0e24:	b5ffffa2 	cbnz	x2, e0e18 <memmove+0x8>
   e0e28:	d65f03c0 	ret
