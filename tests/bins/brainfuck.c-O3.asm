
brainfuck.c.elf:     file format elf64-littleaarch64


Disassembly of section .start:

00000000000e0000 <_start>:
   e0000:	d10903ff 	sub	sp, sp, #0x240
   e0004:	d2804502 	mov	x2, #0x228                 	// #552
   e0008:	910063e3 	add	x3, sp, #0x18
   e000c:	90000001 	adrp	x1, e0000 <_start>
   e0010:	aa0303e0 	mov	x0, x3
   e0014:	91194021 	add	x1, x1, #0x650
   e0018:	a9007bfd 	stp	x29, x30, [sp]
   e001c:	910003fd 	mov	x29, sp
   e0020:	940000c8 	bl	e0340 <memcpy>
   e0024:	910043e1 	add	x1, sp, #0x10
   e0028:	f9000bff 	str	xzr, [sp, #16]
   e002c:	9400007d 	bl	e0220 <interpret>
   e0030:	a9407bfd 	ldp	x29, x30, [sp]
   e0034:	f9400be0 	ldr	x0, [sp, #16]
   e0038:	910903ff 	add	sp, sp, #0x240
   e003c:	d65f03c0 	ret

Disassembly of section .text:

00000000000e0040 <zmem>:
   e0040:	34000bc1 	cbz	w1, e01b8 <zmem+0x178>
   e0044:	cb0003e5 	neg	x5, x0
   e0048:	52800166 	mov	w6, #0xb                   	// #11
   e004c:	120008a2 	and	w2, w5, #0x7
   e0050:	51000424 	sub	w4, w1, #0x1
   e0054:	11001c43 	add	w3, w2, #0x7
   e0058:	6b06007f 	cmp	w3, w6
   e005c:	1a862063 	csel	w3, w3, w6, cs	// cs = hs, nlast
   e0060:	6b03009f 	cmp	w4, w3
   e0064:	54000b83 	b.cc	e01d4 <zmem+0x194>  // b.lo, b.ul, b.last
   e0068:	34000b22 	cbz	w2, e01cc <zmem+0x18c>
   e006c:	3900001f 	strb	wzr, [x0]
   e0070:	f27f04bf 	tst	x5, #0x6
   e0074:	54000a80 	b.eq	e01c4 <zmem+0x184>  // b.none
   e0078:	3900041f 	strb	wzr, [x0, #1]
   e007c:	7100085f 	cmp	w2, #0x2
   e0080:	54000ae9 	b.ls	e01dc <zmem+0x19c>  // b.plast
   e0084:	3900081f 	strb	wzr, [x0, #2]
   e0088:	361009a5 	tbz	w5, #2, e01bc <zmem+0x17c>
   e008c:	39000c1f 	strb	wzr, [x0, #3]
   e0090:	7100105f 	cmp	w2, #0x4
   e0094:	54000a89 	b.ls	e01e4 <zmem+0x1a4>  // b.plast
   e0098:	3900101f 	strb	wzr, [x0, #4]
   e009c:	7100145f 	cmp	w2, #0x5
   e00a0:	54000a60 	b.eq	e01ec <zmem+0x1ac>  // b.none
   e00a4:	3900141f 	strb	wzr, [x0, #5]
   e00a8:	71001c5f 	cmp	w2, #0x7
   e00ac:	54000a41 	b.ne	e01f4 <zmem+0x1b4>  // b.any
   e00b0:	2a0203e5 	mov	w5, w2
   e00b4:	3900181f 	strb	wzr, [x0, #6]
   e00b8:	4b020024 	sub	w4, w1, w2
   e00bc:	8b020002 	add	x2, x0, x2
   e00c0:	53037c83 	lsr	w3, w4, #3
   e00c4:	8b234c43 	add	x3, x2, w3, uxtw #3
   e00c8:	f800845f 	str	xzr, [x2], #8
   e00cc:	eb02007f 	cmp	x3, x2
   e00d0:	54ffffc1 	b.ne	e00c8 <zmem+0x88>  // b.any
   e00d4:	121d7082 	and	w2, w4, #0xfffffff8
   e00d8:	0b050042 	add	w2, w2, w5
   e00dc:	f240089f 	tst	x4, #0x7
   e00e0:	540006c0 	b.eq	e01b8 <zmem+0x178>  // b.none
   e00e4:	11000443 	add	w3, w2, #0x1
   e00e8:	3822481f 	strb	wzr, [x0, w2, uxtw]
   e00ec:	6b03003f 	cmp	w1, w3
   e00f0:	54000640 	b.eq	e01b8 <zmem+0x178>  // b.none
   e00f4:	11000844 	add	w4, w2, #0x2
   e00f8:	3823481f 	strb	wzr, [x0, w3, uxtw]
   e00fc:	6b04003f 	cmp	w1, w4
   e0100:	540005c0 	b.eq	e01b8 <zmem+0x178>  // b.none
   e0104:	11000c43 	add	w3, w2, #0x3
   e0108:	3824481f 	strb	wzr, [x0, w4, uxtw]
   e010c:	6b03003f 	cmp	w1, w3
   e0110:	54000540 	b.eq	e01b8 <zmem+0x178>  // b.none
   e0114:	11001044 	add	w4, w2, #0x4
   e0118:	3823481f 	strb	wzr, [x0, w3, uxtw]
   e011c:	6b04003f 	cmp	w1, w4
   e0120:	540004c0 	b.eq	e01b8 <zmem+0x178>  // b.none
   e0124:	11001443 	add	w3, w2, #0x5
   e0128:	3824481f 	strb	wzr, [x0, w4, uxtw]
   e012c:	6b03003f 	cmp	w1, w3
   e0130:	54000440 	b.eq	e01b8 <zmem+0x178>  // b.none
   e0134:	11001844 	add	w4, w2, #0x6
   e0138:	3823481f 	strb	wzr, [x0, w3, uxtw]
   e013c:	6b04003f 	cmp	w1, w4
   e0140:	540003c0 	b.eq	e01b8 <zmem+0x178>  // b.none
   e0144:	11001c43 	add	w3, w2, #0x7
   e0148:	3824481f 	strb	wzr, [x0, w4, uxtw]
   e014c:	6b03003f 	cmp	w1, w3
   e0150:	54000340 	b.eq	e01b8 <zmem+0x178>  // b.none
   e0154:	11002044 	add	w4, w2, #0x8
   e0158:	3823481f 	strb	wzr, [x0, w3, uxtw]
   e015c:	6b04003f 	cmp	w1, w4
   e0160:	540002c0 	b.eq	e01b8 <zmem+0x178>  // b.none
   e0164:	11002443 	add	w3, w2, #0x9
   e0168:	3824481f 	strb	wzr, [x0, w4, uxtw]
   e016c:	6b03003f 	cmp	w1, w3
   e0170:	54000240 	b.eq	e01b8 <zmem+0x178>  // b.none
   e0174:	11002844 	add	w4, w2, #0xa
   e0178:	3823481f 	strb	wzr, [x0, w3, uxtw]
   e017c:	6b04003f 	cmp	w1, w4
   e0180:	540001c0 	b.eq	e01b8 <zmem+0x178>  // b.none
   e0184:	11002c43 	add	w3, w2, #0xb
   e0188:	3824481f 	strb	wzr, [x0, w4, uxtw]
   e018c:	6b03003f 	cmp	w1, w3
   e0190:	54000140 	b.eq	e01b8 <zmem+0x178>  // b.none
   e0194:	11003044 	add	w4, w2, #0xc
   e0198:	3823481f 	strb	wzr, [x0, w3, uxtw]
   e019c:	6b04003f 	cmp	w1, w4
   e01a0:	540000c0 	b.eq	e01b8 <zmem+0x178>  // b.none
   e01a4:	11003442 	add	w2, w2, #0xd
   e01a8:	3824481f 	strb	wzr, [x0, w4, uxtw]
   e01ac:	6b02003f 	cmp	w1, w2
   e01b0:	54000040 	b.eq	e01b8 <zmem+0x178>  // b.none
   e01b4:	3822481f 	strb	wzr, [x0, w2, uxtw]
   e01b8:	d65f03c0 	ret
   e01bc:	52800065 	mov	w5, #0x3                   	// #3
   e01c0:	17ffffbe 	b	e00b8 <zmem+0x78>
   e01c4:	52800025 	mov	w5, #0x1                   	// #1
   e01c8:	17ffffbc 	b	e00b8 <zmem+0x78>
   e01cc:	52800005 	mov	w5, #0x0                   	// #0
   e01d0:	17ffffba 	b	e00b8 <zmem+0x78>
   e01d4:	52800002 	mov	w2, #0x0                   	// #0
   e01d8:	17ffffc3 	b	e00e4 <zmem+0xa4>
   e01dc:	52800045 	mov	w5, #0x2                   	// #2
   e01e0:	17ffffb6 	b	e00b8 <zmem+0x78>
   e01e4:	52800085 	mov	w5, #0x4                   	// #4
   e01e8:	17ffffb4 	b	e00b8 <zmem+0x78>
   e01ec:	2a0203e5 	mov	w5, w2
   e01f0:	17ffffb2 	b	e00b8 <zmem+0x78>
   e01f4:	528000c5 	mov	w5, #0x6                   	// #6
   e01f8:	17ffffb0 	b	e00b8 <zmem+0x78>
   e01fc:	d503201f 	nop

00000000000e0200 <procchar>:
   e0200:	f9400022 	ldr	x2, [x1]
   e0204:	ca022842 	eor	x2, x2, x2, lsl #10
   e0208:	ca424842 	eor	x2, x2, x2, lsr #18
   e020c:	ca020842 	eor	x2, x2, x2, lsl #2
   e0210:	8b200042 	add	x2, x2, w0, uxtb
   e0214:	f9000022 	str	x2, [x1]
   e0218:	d65f03c0 	ret
   e021c:	d503201f 	nop

00000000000e0220 <interpret>:
   e0220:	d289000c 	mov	x12, #0x4800                	// #18432
   e0224:	cb2c63ff 	sub	sp, sp, x12
   e0228:	91400be3 	add	x3, sp, #0x2, lsl #12
   e022c:	d2890004 	mov	x4, #0x4800                	// #18432
   e0230:	aa0303e2 	mov	x2, x3
   e0234:	8b2463e4 	add	x4, sp, x4
   e0238:	f800845f 	str	xzr, [x2], #8
   e023c:	eb04005f 	cmp	x2, x4
   e0240:	54ffffc1 	b.ne	e0238 <interpret+0x18>  // b.any
   e0244:	39400002 	ldrb	w2, [x0]
   e0248:	340003e2 	cbz	w2, e02c4 <interpret+0xa4>
   e024c:	910003e4 	mov	x4, sp
   e0250:	1400000e 	b	e0288 <interpret+0x68>
   e0254:	7100b45f 	cmp	w2, #0x2d
   e0258:	54000520 	b.eq	e02fc <interpret+0xdc>  // b.none
   e025c:	7100b85f 	cmp	w2, #0x2e
   e0260:	540003c0 	b.eq	e02d8 <interpret+0xb8>  // b.none
   e0264:	7100ac5f 	cmp	w2, #0x2b
   e0268:	54000241 	b.ne	e02b0 <interpret+0x90>  // b.any
   e026c:	39400065 	ldrb	w5, [x3]
   e0270:	aa0003e2 	mov	x2, x0
   e0274:	110004a0 	add	w0, w5, #0x1
   e0278:	39000060 	strb	w0, [x3]
   e027c:	91000440 	add	x0, x2, #0x1
   e0280:	39400442 	ldrb	w2, [x2, #1]
   e0284:	34000202 	cbz	w2, e02c4 <interpret+0xa4>
   e0288:	7100f05f 	cmp	w2, #0x3c
   e028c:	54000200 	b.eq	e02cc <interpret+0xac>  // b.none
   e0290:	54fffe29 	b.ls	e0254 <interpret+0x34>  // b.plast
   e0294:	71016c5f 	cmp	w2, #0x5b
   e0298:	54000460 	b.eq	e0324 <interpret+0x104>  // b.none
   e029c:	7101745f 	cmp	w2, #0x5d
   e02a0:	54000380 	b.eq	e0310 <interpret+0xf0>  // b.none
   e02a4:	7100f85f 	cmp	w2, #0x3e
   e02a8:	54000041 	b.ne	e02b0 <interpret+0x90>  // b.any
   e02ac:	91000463 	add	x3, x3, #0x1
   e02b0:	aa0003e2 	mov	x2, x0
   e02b4:	d503201f 	nop
   e02b8:	91000440 	add	x0, x2, #0x1
   e02bc:	39400442 	ldrb	w2, [x2, #1]
   e02c0:	35fffe42 	cbnz	w2, e0288 <interpret+0x68>
   e02c4:	8b2c63ff 	add	sp, sp, x12
   e02c8:	d65f03c0 	ret
   e02cc:	d1000463 	sub	x3, x3, #0x1
   e02d0:	aa0003e2 	mov	x2, x0
   e02d4:	17ffffea 	b	e027c <interpret+0x5c>
   e02d8:	f9400022 	ldr	x2, [x1]
   e02dc:	39400065 	ldrb	w5, [x3]
   e02e0:	ca022842 	eor	x2, x2, x2, lsl #10
   e02e4:	ca424842 	eor	x2, x2, x2, lsr #18
   e02e8:	ca020842 	eor	x2, x2, x2, lsl #2
   e02ec:	8b050042 	add	x2, x2, x5
   e02f0:	f9000022 	str	x2, [x1]
   e02f4:	aa0003e2 	mov	x2, x0
   e02f8:	17fffff0 	b	e02b8 <interpret+0x98>
   e02fc:	39400062 	ldrb	w2, [x3]
   e0300:	51000442 	sub	w2, w2, #0x1
   e0304:	39000062 	strb	w2, [x3]
   e0308:	aa0003e2 	mov	x2, x0
   e030c:	17ffffeb 	b	e02b8 <interpret+0x98>
   e0310:	39400062 	ldrb	w2, [x3]
   e0314:	350000e2 	cbnz	w2, e0330 <interpret+0x110>
   e0318:	d1002084 	sub	x4, x4, #0x8
   e031c:	aa0003e2 	mov	x2, x0
   e0320:	17ffffd7 	b	e027c <interpret+0x5c>
   e0324:	aa0003e2 	mov	x2, x0
   e0328:	f8008480 	str	x0, [x4], #8
   e032c:	17ffffd4 	b	e027c <interpret+0x5c>
   e0330:	f85f8082 	ldur	x2, [x4, #-8]
   e0334:	17ffffd2 	b	e027c <interpret+0x5c>
	...

00000000000e0340 <memcpy>:
   e0340:	b4000222 	cbz	x2, e0384 <memcpy+0x44>
   e0344:	d1000443 	sub	x3, x2, #0x1
   e0348:	f1001c7f 	cmp	x3, #0x7
   e034c:	54000729 	b.ls	e0430 <memcpy+0xf0>  // b.plast
   e0350:	aa010005 	orr	x5, x0, x1
   e0354:	91000424 	add	x4, x1, #0x1
   e0358:	cb040004 	sub	x4, x0, x4
   e035c:	d2800003 	mov	x3, #0x0                   	// #0
   e0360:	f24008bf 	tst	x5, #0x7
   e0364:	fa460880 	ccmp	x4, #0x6, #0x0, eq	// eq = none
   e0368:	54000108 	b.hi	e0388 <memcpy+0x48>  // b.pmore
   e036c:	d503201f 	nop
   e0370:	38636824 	ldrb	w4, [x1, x3]
   e0374:	38236804 	strb	w4, [x0, x3]
   e0378:	91000463 	add	x3, x3, #0x1
   e037c:	eb03005f 	cmp	x2, x3
   e0380:	54ffff81 	b.ne	e0370 <memcpy+0x30>  // b.any
   e0384:	d65f03c0 	ret
   e0388:	927df044 	and	x4, x2, #0xfffffffffffffff8
   e038c:	d503201f 	nop
   e0390:	f8636825 	ldr	x5, [x1, x3]
   e0394:	f8236805 	str	x5, [x0, x3]
   e0398:	91002063 	add	x3, x3, #0x8
   e039c:	eb03009f 	cmp	x4, x3
   e03a0:	54ffff81 	b.ne	e0390 <memcpy+0x50>  // b.any
   e03a4:	eb04005f 	cmp	x2, x4
   e03a8:	54fffee0 	b.eq	e0384 <memcpy+0x44>  // b.none
   e03ac:	38646825 	ldrb	w5, [x1, x4]
   e03b0:	91000483 	add	x3, x4, #0x1
   e03b4:	38246805 	strb	w5, [x0, x4]
   e03b8:	eb03005f 	cmp	x2, x3
   e03bc:	54fffe40 	b.eq	e0384 <memcpy+0x44>  // b.none
   e03c0:	38636826 	ldrb	w6, [x1, x3]
   e03c4:	91000885 	add	x5, x4, #0x2
   e03c8:	38236806 	strb	w6, [x0, x3]
   e03cc:	eb05005f 	cmp	x2, x5
   e03d0:	54fffda0 	b.eq	e0384 <memcpy+0x44>  // b.none
   e03d4:	38656826 	ldrb	w6, [x1, x5]
   e03d8:	91000c83 	add	x3, x4, #0x3
   e03dc:	38256806 	strb	w6, [x0, x5]
   e03e0:	eb03005f 	cmp	x2, x3
   e03e4:	54fffd00 	b.eq	e0384 <memcpy+0x44>  // b.none
   e03e8:	38636826 	ldrb	w6, [x1, x3]
   e03ec:	91001085 	add	x5, x4, #0x4
   e03f0:	38236806 	strb	w6, [x0, x3]
   e03f4:	eb05005f 	cmp	x2, x5
   e03f8:	54fffc60 	b.eq	e0384 <memcpy+0x44>  // b.none
   e03fc:	38656826 	ldrb	w6, [x1, x5]
   e0400:	91001483 	add	x3, x4, #0x5
   e0404:	38256806 	strb	w6, [x0, x5]
   e0408:	eb03005f 	cmp	x2, x3
   e040c:	54fffbc0 	b.eq	e0384 <memcpy+0x44>  // b.none
   e0410:	38636825 	ldrb	w5, [x1, x3]
   e0414:	91001884 	add	x4, x4, #0x6
   e0418:	38236805 	strb	w5, [x0, x3]
   e041c:	eb04005f 	cmp	x2, x4
   e0420:	54fffb20 	b.eq	e0384 <memcpy+0x44>  // b.none
   e0424:	38646821 	ldrb	w1, [x1, x4]
   e0428:	38246801 	strb	w1, [x0, x4]
   e042c:	d65f03c0 	ret
   e0430:	d2800003 	mov	x3, #0x0                   	// #0
   e0434:	38636824 	ldrb	w4, [x1, x3]
   e0438:	38236804 	strb	w4, [x0, x3]
   e043c:	91000463 	add	x3, x3, #0x1
   e0440:	eb03005f 	cmp	x2, x3
   e0444:	54fff961 	b.ne	e0370 <memcpy+0x30>  // b.any
   e0448:	17ffffcf 	b	e0384 <memcpy+0x44>
   e044c:	d503201f 	nop

00000000000e0450 <memset>:
   e0450:	b4000ce2 	cbz	x2, e05ec <memset+0x19c>
   e0454:	cb0003e7 	neg	x7, x0
   e0458:	d2800168 	mov	x8, #0xb                   	// #11
   e045c:	924008e3 	and	x3, x7, #0x7
   e0460:	d1000446 	sub	x6, x2, #0x1
   e0464:	91001c65 	add	x5, x3, #0x7
   e0468:	12001c24 	and	w4, w1, #0xff
   e046c:	eb0800bf 	cmp	x5, x8
   e0470:	9a8820a5 	csel	x5, x5, x8, cs	// cs = hs, nlast
   e0474:	eb0500df 	cmp	x6, x5
   e0478:	54000c83 	b.cc	e0608 <memset+0x1b8>  // b.lo, b.ul, b.last
   e047c:	b4000c23 	cbz	x3, e0600 <memset+0x1b0>
   e0480:	39000004 	strb	w4, [x0]
   e0484:	f27f04ff 	tst	x7, #0x6
   e0488:	54000b80 	b.eq	e05f8 <memset+0x1a8>  // b.none
   e048c:	39000404 	strb	w4, [x0, #1]
   e0490:	f100087f 	cmp	x3, #0x2
   e0494:	54000be9 	b.ls	e0610 <memset+0x1c0>  // b.plast
   e0498:	39000804 	strb	w4, [x0, #2]
   e049c:	36100aa7 	tbz	w7, #2, e05f0 <memset+0x1a0>
   e04a0:	39000c04 	strb	w4, [x0, #3]
   e04a4:	f100107f 	cmp	x3, #0x4
   e04a8:	54000b89 	b.ls	e0618 <memset+0x1c8>  // b.plast
   e04ac:	39001004 	strb	w4, [x0, #4]
   e04b0:	f100147f 	cmp	x3, #0x5
   e04b4:	54000b60 	b.eq	e0620 <memset+0x1d0>  // b.none
   e04b8:	39001404 	strb	w4, [x0, #5]
   e04bc:	f1001c7f 	cmp	x3, #0x7
   e04c0:	54000b41 	b.ne	e0628 <memset+0x1d8>  // b.any
   e04c4:	aa0303e6 	mov	x6, x3
   e04c8:	39001804 	strb	w4, [x0, #6]
   e04cc:	d2800005 	mov	x5, #0x0                   	// #0
   e04d0:	cb030049 	sub	x9, x2, x3
   e04d4:	b3401c85 	bfxil	x5, x4, #0, #8
   e04d8:	8b030001 	add	x1, x0, x3
   e04dc:	927df128 	and	x8, x9, #0xfffffffffffffff8
   e04e0:	b3781c85 	bfi	x5, x4, #8, #8
   e04e4:	8b080027 	add	x7, x1, x8
   e04e8:	b3701c85 	bfi	x5, x4, #16, #8
   e04ec:	b3681c85 	bfi	x5, x4, #24, #8
   e04f0:	b3601c85 	bfi	x5, x4, #32, #8
   e04f4:	b3581c85 	bfi	x5, x4, #40, #8
   e04f8:	b3501c85 	bfi	x5, x4, #48, #8
   e04fc:	b3481c85 	bfi	x5, x4, #56, #8
   e0500:	f8008425 	str	x5, [x1], #8
   e0504:	eb0100ff 	cmp	x7, x1
   e0508:	54ffffc1 	b.ne	e0500 <memset+0xb0>  // b.any
   e050c:	8b0800c1 	add	x1, x6, x8
   e0510:	eb08013f 	cmp	x9, x8
   e0514:	540006c0 	b.eq	e05ec <memset+0x19c>  // b.none
   e0518:	91000423 	add	x3, x1, #0x1
   e051c:	38216804 	strb	w4, [x0, x1]
   e0520:	eb03005f 	cmp	x2, x3
   e0524:	54000640 	b.eq	e05ec <memset+0x19c>  // b.none
   e0528:	91000825 	add	x5, x1, #0x2
   e052c:	38236804 	strb	w4, [x0, x3]
   e0530:	eb05005f 	cmp	x2, x5
   e0534:	540005c0 	b.eq	e05ec <memset+0x19c>  // b.none
   e0538:	91000c23 	add	x3, x1, #0x3
   e053c:	38256804 	strb	w4, [x0, x5]
   e0540:	eb03005f 	cmp	x2, x3
   e0544:	54000540 	b.eq	e05ec <memset+0x19c>  // b.none
   e0548:	91001025 	add	x5, x1, #0x4
   e054c:	38236804 	strb	w4, [x0, x3]
   e0550:	eb05005f 	cmp	x2, x5
   e0554:	540004c0 	b.eq	e05ec <memset+0x19c>  // b.none
   e0558:	91001423 	add	x3, x1, #0x5
   e055c:	38256804 	strb	w4, [x0, x5]
   e0560:	eb03005f 	cmp	x2, x3
   e0564:	54000440 	b.eq	e05ec <memset+0x19c>  // b.none
   e0568:	91001825 	add	x5, x1, #0x6
   e056c:	38236804 	strb	w4, [x0, x3]
   e0570:	eb05005f 	cmp	x2, x5
   e0574:	540003c0 	b.eq	e05ec <memset+0x19c>  // b.none
   e0578:	91001c23 	add	x3, x1, #0x7
   e057c:	38256804 	strb	w4, [x0, x5]
   e0580:	eb03005f 	cmp	x2, x3
   e0584:	54000340 	b.eq	e05ec <memset+0x19c>  // b.none
   e0588:	91002025 	add	x5, x1, #0x8
   e058c:	38236804 	strb	w4, [x0, x3]
   e0590:	eb05005f 	cmp	x2, x5
   e0594:	540002c0 	b.eq	e05ec <memset+0x19c>  // b.none
   e0598:	91002423 	add	x3, x1, #0x9
   e059c:	38256804 	strb	w4, [x0, x5]
   e05a0:	eb03005f 	cmp	x2, x3
   e05a4:	54000240 	b.eq	e05ec <memset+0x19c>  // b.none
   e05a8:	91002825 	add	x5, x1, #0xa
   e05ac:	38236804 	strb	w4, [x0, x3]
   e05b0:	eb05005f 	cmp	x2, x5
   e05b4:	540001c0 	b.eq	e05ec <memset+0x19c>  // b.none
   e05b8:	91002c23 	add	x3, x1, #0xb
   e05bc:	38256804 	strb	w4, [x0, x5]
   e05c0:	eb03005f 	cmp	x2, x3
   e05c4:	54000140 	b.eq	e05ec <memset+0x19c>  // b.none
   e05c8:	91003025 	add	x5, x1, #0xc
   e05cc:	38236804 	strb	w4, [x0, x3]
   e05d0:	eb05005f 	cmp	x2, x5
   e05d4:	540000c0 	b.eq	e05ec <memset+0x19c>  // b.none
   e05d8:	91003421 	add	x1, x1, #0xd
   e05dc:	38256804 	strb	w4, [x0, x5]
   e05e0:	eb01005f 	cmp	x2, x1
   e05e4:	54000040 	b.eq	e05ec <memset+0x19c>  // b.none
   e05e8:	38216804 	strb	w4, [x0, x1]
   e05ec:	d65f03c0 	ret
   e05f0:	d2800066 	mov	x6, #0x3                   	// #3
   e05f4:	17ffffb6 	b	e04cc <memset+0x7c>
   e05f8:	d2800026 	mov	x6, #0x1                   	// #1
   e05fc:	17ffffb4 	b	e04cc <memset+0x7c>
   e0600:	d2800006 	mov	x6, #0x0                   	// #0
   e0604:	17ffffb2 	b	e04cc <memset+0x7c>
   e0608:	d2800001 	mov	x1, #0x0                   	// #0
   e060c:	17ffffc3 	b	e0518 <memset+0xc8>
   e0610:	d2800046 	mov	x6, #0x2                   	// #2
   e0614:	17ffffae 	b	e04cc <memset+0x7c>
   e0618:	d2800086 	mov	x6, #0x4                   	// #4
   e061c:	17ffffac 	b	e04cc <memset+0x7c>
   e0620:	aa0303e6 	mov	x6, x3
   e0624:	17ffffaa 	b	e04cc <memset+0x7c>
   e0628:	d28000c6 	mov	x6, #0x6                   	// #6
   e062c:	17ffffa8 	b	e04cc <memset+0x7c>

00000000000e0630 <memmove>:
   e0630:	b40000c2 	cbz	x2, e0648 <memmove+0x18>
   e0634:	d503201f 	nop
   e0638:	d1000442 	sub	x2, x2, #0x1
   e063c:	38626823 	ldrb	w3, [x1, x2]
   e0640:	38226803 	strb	w3, [x0, x2]
   e0644:	b5ffffa2 	cbnz	x2, e0638 <memmove+0x8>
   e0648:	d65f03c0 	ret
