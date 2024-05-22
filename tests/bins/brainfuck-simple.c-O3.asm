
brainfuck-simple.c.elf:     file format elf64-littleaarch64


Disassembly of section .start:

00000000000e0000 <_start>:
   e0000:	a9b77bfd 	stp	x29, x30, [sp, #-144]!
   e0004:	90000002 	adrp	x2, e0000 <_start>
   e0008:	911a0042 	add	x2, x2, #0x680
   e000c:	910063e0 	add	x0, sp, #0x18
   e0010:	910003fd 	mov	x29, sp
   e0014:	910043e1 	add	x1, sp, #0x10
   e0018:	a9461444 	ldp	x4, x5, [x2, #96]
   e001c:	a9061404 	stp	x4, x5, [x0, #96]
   e0020:	b846f043 	ldur	w3, [x2, #111]
   e0024:	a9401444 	ldp	x4, x5, [x2]
   e0028:	a90197e4 	stp	x4, x5, [sp, #24]
   e002c:	a9411c46 	ldp	x6, x7, [x2, #16]
   e0030:	a9011c06 	stp	x6, x7, [x0, #16]
   e0034:	a9421444 	ldp	x4, x5, [x2, #32]
   e0038:	a9021404 	stp	x4, x5, [x0, #32]
   e003c:	a9431c46 	ldp	x6, x7, [x2, #48]
   e0040:	b80873e3 	stur	w3, [sp, #135]
   e0044:	a9441444 	ldp	x4, x5, [x2, #64]
   e0048:	f9000bff 	str	xzr, [sp, #16]
   e004c:	a9450c42 	ldp	x2, x3, [x2, #80]
   e0050:	a9031c06 	stp	x6, x7, [x0, #48]
   e0054:	a9041404 	stp	x4, x5, [x0, #64]
   e0058:	a9050c02 	stp	x2, x3, [x0, #80]
   e005c:	9400007d 	bl	e0250 <interpret>
   e0060:	f9400be0 	ldr	x0, [sp, #16]
   e0064:	a8c97bfd 	ldp	x29, x30, [sp], #144
   e0068:	d65f03c0 	ret

Disassembly of section .text:

00000000000e0070 <zmem>:
   e0070:	34000bc1 	cbz	w1, e01e8 <zmem+0x178>
   e0074:	cb0003e5 	neg	x5, x0
   e0078:	52800166 	mov	w6, #0xb                   	// #11
   e007c:	120008a2 	and	w2, w5, #0x7
   e0080:	51000424 	sub	w4, w1, #0x1
   e0084:	11001c43 	add	w3, w2, #0x7
   e0088:	6b06007f 	cmp	w3, w6
   e008c:	1a862063 	csel	w3, w3, w6, cs	// cs = hs, nlast
   e0090:	6b03009f 	cmp	w4, w3
   e0094:	54000b83 	b.cc	e0204 <zmem+0x194>  // b.lo, b.ul, b.last
   e0098:	34000b22 	cbz	w2, e01fc <zmem+0x18c>
   e009c:	3900001f 	strb	wzr, [x0]
   e00a0:	f27f04bf 	tst	x5, #0x6
   e00a4:	54000a80 	b.eq	e01f4 <zmem+0x184>  // b.none
   e00a8:	3900041f 	strb	wzr, [x0, #1]
   e00ac:	7100085f 	cmp	w2, #0x2
   e00b0:	54000ae9 	b.ls	e020c <zmem+0x19c>  // b.plast
   e00b4:	3900081f 	strb	wzr, [x0, #2]
   e00b8:	361009a5 	tbz	w5, #2, e01ec <zmem+0x17c>
   e00bc:	39000c1f 	strb	wzr, [x0, #3]
   e00c0:	7100105f 	cmp	w2, #0x4
   e00c4:	54000a89 	b.ls	e0214 <zmem+0x1a4>  // b.plast
   e00c8:	3900101f 	strb	wzr, [x0, #4]
   e00cc:	7100145f 	cmp	w2, #0x5
   e00d0:	54000a60 	b.eq	e021c <zmem+0x1ac>  // b.none
   e00d4:	3900141f 	strb	wzr, [x0, #5]
   e00d8:	71001c5f 	cmp	w2, #0x7
   e00dc:	54000a41 	b.ne	e0224 <zmem+0x1b4>  // b.any
   e00e0:	2a0203e5 	mov	w5, w2
   e00e4:	3900181f 	strb	wzr, [x0, #6]
   e00e8:	4b020024 	sub	w4, w1, w2
   e00ec:	8b020002 	add	x2, x0, x2
   e00f0:	53037c83 	lsr	w3, w4, #3
   e00f4:	8b234c43 	add	x3, x2, w3, uxtw #3
   e00f8:	f800845f 	str	xzr, [x2], #8
   e00fc:	eb02007f 	cmp	x3, x2
   e0100:	54ffffc1 	b.ne	e00f8 <zmem+0x88>  // b.any
   e0104:	121d7082 	and	w2, w4, #0xfffffff8
   e0108:	0b050042 	add	w2, w2, w5
   e010c:	f240089f 	tst	x4, #0x7
   e0110:	540006c0 	b.eq	e01e8 <zmem+0x178>  // b.none
   e0114:	11000443 	add	w3, w2, #0x1
   e0118:	3822481f 	strb	wzr, [x0, w2, uxtw]
   e011c:	6b03003f 	cmp	w1, w3
   e0120:	54000640 	b.eq	e01e8 <zmem+0x178>  // b.none
   e0124:	11000844 	add	w4, w2, #0x2
   e0128:	3823481f 	strb	wzr, [x0, w3, uxtw]
   e012c:	6b04003f 	cmp	w1, w4
   e0130:	540005c0 	b.eq	e01e8 <zmem+0x178>  // b.none
   e0134:	11000c43 	add	w3, w2, #0x3
   e0138:	3824481f 	strb	wzr, [x0, w4, uxtw]
   e013c:	6b03003f 	cmp	w1, w3
   e0140:	54000540 	b.eq	e01e8 <zmem+0x178>  // b.none
   e0144:	11001044 	add	w4, w2, #0x4
   e0148:	3823481f 	strb	wzr, [x0, w3, uxtw]
   e014c:	6b04003f 	cmp	w1, w4
   e0150:	540004c0 	b.eq	e01e8 <zmem+0x178>  // b.none
   e0154:	11001443 	add	w3, w2, #0x5
   e0158:	3824481f 	strb	wzr, [x0, w4, uxtw]
   e015c:	6b03003f 	cmp	w1, w3
   e0160:	54000440 	b.eq	e01e8 <zmem+0x178>  // b.none
   e0164:	11001844 	add	w4, w2, #0x6
   e0168:	3823481f 	strb	wzr, [x0, w3, uxtw]
   e016c:	6b04003f 	cmp	w1, w4
   e0170:	540003c0 	b.eq	e01e8 <zmem+0x178>  // b.none
   e0174:	11001c43 	add	w3, w2, #0x7
   e0178:	3824481f 	strb	wzr, [x0, w4, uxtw]
   e017c:	6b03003f 	cmp	w1, w3
   e0180:	54000340 	b.eq	e01e8 <zmem+0x178>  // b.none
   e0184:	11002044 	add	w4, w2, #0x8
   e0188:	3823481f 	strb	wzr, [x0, w3, uxtw]
   e018c:	6b04003f 	cmp	w1, w4
   e0190:	540002c0 	b.eq	e01e8 <zmem+0x178>  // b.none
   e0194:	11002443 	add	w3, w2, #0x9
   e0198:	3824481f 	strb	wzr, [x0, w4, uxtw]
   e019c:	6b03003f 	cmp	w1, w3
   e01a0:	54000240 	b.eq	e01e8 <zmem+0x178>  // b.none
   e01a4:	11002844 	add	w4, w2, #0xa
   e01a8:	3823481f 	strb	wzr, [x0, w3, uxtw]
   e01ac:	6b04003f 	cmp	w1, w4
   e01b0:	540001c0 	b.eq	e01e8 <zmem+0x178>  // b.none
   e01b4:	11002c43 	add	w3, w2, #0xb
   e01b8:	3824481f 	strb	wzr, [x0, w4, uxtw]
   e01bc:	6b03003f 	cmp	w1, w3
   e01c0:	54000140 	b.eq	e01e8 <zmem+0x178>  // b.none
   e01c4:	11003044 	add	w4, w2, #0xc
   e01c8:	3823481f 	strb	wzr, [x0, w3, uxtw]
   e01cc:	6b04003f 	cmp	w1, w4
   e01d0:	540000c0 	b.eq	e01e8 <zmem+0x178>  // b.none
   e01d4:	11003442 	add	w2, w2, #0xd
   e01d8:	3824481f 	strb	wzr, [x0, w4, uxtw]
   e01dc:	6b02003f 	cmp	w1, w2
   e01e0:	54000040 	b.eq	e01e8 <zmem+0x178>  // b.none
   e01e4:	3822481f 	strb	wzr, [x0, w2, uxtw]
   e01e8:	d65f03c0 	ret
   e01ec:	52800065 	mov	w5, #0x3                   	// #3
   e01f0:	17ffffbe 	b	e00e8 <zmem+0x78>
   e01f4:	52800025 	mov	w5, #0x1                   	// #1
   e01f8:	17ffffbc 	b	e00e8 <zmem+0x78>
   e01fc:	52800005 	mov	w5, #0x0                   	// #0
   e0200:	17ffffba 	b	e00e8 <zmem+0x78>
   e0204:	52800002 	mov	w2, #0x0                   	// #0
   e0208:	17ffffc3 	b	e0114 <zmem+0xa4>
   e020c:	52800045 	mov	w5, #0x2                   	// #2
   e0210:	17ffffb6 	b	e00e8 <zmem+0x78>
   e0214:	52800085 	mov	w5, #0x4                   	// #4
   e0218:	17ffffb4 	b	e00e8 <zmem+0x78>
   e021c:	2a0203e5 	mov	w5, w2
   e0220:	17ffffb2 	b	e00e8 <zmem+0x78>
   e0224:	528000c5 	mov	w5, #0x6                   	// #6
   e0228:	17ffffb0 	b	e00e8 <zmem+0x78>
   e022c:	d503201f 	nop

00000000000e0230 <procchar>:
   e0230:	f9400022 	ldr	x2, [x1]
   e0234:	ca022842 	eor	x2, x2, x2, lsl #10
   e0238:	ca424842 	eor	x2, x2, x2, lsr #18
   e023c:	ca020842 	eor	x2, x2, x2, lsl #2
   e0240:	8b200042 	add	x2, x2, w0, uxtb
   e0244:	f9000022 	str	x2, [x1]
   e0248:	d65f03c0 	ret
   e024c:	d503201f 	nop

00000000000e0250 <interpret>:
   e0250:	d289000c 	mov	x12, #0x4800                	// #18432
   e0254:	cb2c63ff 	sub	sp, sp, x12
   e0258:	91400be3 	add	x3, sp, #0x2, lsl #12
   e025c:	d2890004 	mov	x4, #0x4800                	// #18432
   e0260:	aa0303e2 	mov	x2, x3
   e0264:	8b2463e4 	add	x4, sp, x4
   e0268:	f800845f 	str	xzr, [x2], #8
   e026c:	eb04005f 	cmp	x2, x4
   e0270:	54ffffc1 	b.ne	e0268 <interpret+0x18>  // b.any
   e0274:	39400002 	ldrb	w2, [x0]
   e0278:	340003e2 	cbz	w2, e02f4 <interpret+0xa4>
   e027c:	910003e4 	mov	x4, sp
   e0280:	1400000e 	b	e02b8 <interpret+0x68>
   e0284:	7100b45f 	cmp	w2, #0x2d
   e0288:	54000520 	b.eq	e032c <interpret+0xdc>  // b.none
   e028c:	7100b85f 	cmp	w2, #0x2e
   e0290:	540003c0 	b.eq	e0308 <interpret+0xb8>  // b.none
   e0294:	7100ac5f 	cmp	w2, #0x2b
   e0298:	54000241 	b.ne	e02e0 <interpret+0x90>  // b.any
   e029c:	39400065 	ldrb	w5, [x3]
   e02a0:	aa0003e2 	mov	x2, x0
   e02a4:	110004a0 	add	w0, w5, #0x1
   e02a8:	39000060 	strb	w0, [x3]
   e02ac:	91000440 	add	x0, x2, #0x1
   e02b0:	39400442 	ldrb	w2, [x2, #1]
   e02b4:	34000202 	cbz	w2, e02f4 <interpret+0xa4>
   e02b8:	7100f05f 	cmp	w2, #0x3c
   e02bc:	54000200 	b.eq	e02fc <interpret+0xac>  // b.none
   e02c0:	54fffe29 	b.ls	e0284 <interpret+0x34>  // b.plast
   e02c4:	71016c5f 	cmp	w2, #0x5b
   e02c8:	54000460 	b.eq	e0354 <interpret+0x104>  // b.none
   e02cc:	7101745f 	cmp	w2, #0x5d
   e02d0:	54000380 	b.eq	e0340 <interpret+0xf0>  // b.none
   e02d4:	7100f85f 	cmp	w2, #0x3e
   e02d8:	54000041 	b.ne	e02e0 <interpret+0x90>  // b.any
   e02dc:	91000463 	add	x3, x3, #0x1
   e02e0:	aa0003e2 	mov	x2, x0
   e02e4:	d503201f 	nop
   e02e8:	91000440 	add	x0, x2, #0x1
   e02ec:	39400442 	ldrb	w2, [x2, #1]
   e02f0:	35fffe42 	cbnz	w2, e02b8 <interpret+0x68>
   e02f4:	8b2c63ff 	add	sp, sp, x12
   e02f8:	d65f03c0 	ret
   e02fc:	d1000463 	sub	x3, x3, #0x1
   e0300:	aa0003e2 	mov	x2, x0
   e0304:	17ffffea 	b	e02ac <interpret+0x5c>
   e0308:	f9400022 	ldr	x2, [x1]
   e030c:	39400065 	ldrb	w5, [x3]
   e0310:	ca022842 	eor	x2, x2, x2, lsl #10
   e0314:	ca424842 	eor	x2, x2, x2, lsr #18
   e0318:	ca020842 	eor	x2, x2, x2, lsl #2
   e031c:	8b050042 	add	x2, x2, x5
   e0320:	f9000022 	str	x2, [x1]
   e0324:	aa0003e2 	mov	x2, x0
   e0328:	17fffff0 	b	e02e8 <interpret+0x98>
   e032c:	39400062 	ldrb	w2, [x3]
   e0330:	51000442 	sub	w2, w2, #0x1
   e0334:	39000062 	strb	w2, [x3]
   e0338:	aa0003e2 	mov	x2, x0
   e033c:	17ffffeb 	b	e02e8 <interpret+0x98>
   e0340:	39400062 	ldrb	w2, [x3]
   e0344:	350000e2 	cbnz	w2, e0360 <interpret+0x110>
   e0348:	d1002084 	sub	x4, x4, #0x8
   e034c:	aa0003e2 	mov	x2, x0
   e0350:	17ffffd7 	b	e02ac <interpret+0x5c>
   e0354:	aa0003e2 	mov	x2, x0
   e0358:	f8008480 	str	x0, [x4], #8
   e035c:	17ffffd4 	b	e02ac <interpret+0x5c>
   e0360:	f85f8082 	ldur	x2, [x4, #-8]
   e0364:	17ffffd2 	b	e02ac <interpret+0x5c>
	...

00000000000e0370 <memcpy>:
   e0370:	b4000222 	cbz	x2, e03b4 <memcpy+0x44>
   e0374:	d1000443 	sub	x3, x2, #0x1
   e0378:	f1001c7f 	cmp	x3, #0x7
   e037c:	54000729 	b.ls	e0460 <memcpy+0xf0>  // b.plast
   e0380:	aa010005 	orr	x5, x0, x1
   e0384:	91000424 	add	x4, x1, #0x1
   e0388:	cb040004 	sub	x4, x0, x4
   e038c:	d2800003 	mov	x3, #0x0                   	// #0
   e0390:	f24008bf 	tst	x5, #0x7
   e0394:	fa460880 	ccmp	x4, #0x6, #0x0, eq	// eq = none
   e0398:	54000108 	b.hi	e03b8 <memcpy+0x48>  // b.pmore
   e039c:	d503201f 	nop
   e03a0:	38636824 	ldrb	w4, [x1, x3]
   e03a4:	38236804 	strb	w4, [x0, x3]
   e03a8:	91000463 	add	x3, x3, #0x1
   e03ac:	eb03005f 	cmp	x2, x3
   e03b0:	54ffff81 	b.ne	e03a0 <memcpy+0x30>  // b.any
   e03b4:	d65f03c0 	ret
   e03b8:	927df044 	and	x4, x2, #0xfffffffffffffff8
   e03bc:	d503201f 	nop
   e03c0:	f8636825 	ldr	x5, [x1, x3]
   e03c4:	f8236805 	str	x5, [x0, x3]
   e03c8:	91002063 	add	x3, x3, #0x8
   e03cc:	eb03009f 	cmp	x4, x3
   e03d0:	54ffff81 	b.ne	e03c0 <memcpy+0x50>  // b.any
   e03d4:	eb04005f 	cmp	x2, x4
   e03d8:	54fffee0 	b.eq	e03b4 <memcpy+0x44>  // b.none
   e03dc:	38646825 	ldrb	w5, [x1, x4]
   e03e0:	91000483 	add	x3, x4, #0x1
   e03e4:	38246805 	strb	w5, [x0, x4]
   e03e8:	eb03005f 	cmp	x2, x3
   e03ec:	54fffe40 	b.eq	e03b4 <memcpy+0x44>  // b.none
   e03f0:	38636826 	ldrb	w6, [x1, x3]
   e03f4:	91000885 	add	x5, x4, #0x2
   e03f8:	38236806 	strb	w6, [x0, x3]
   e03fc:	eb05005f 	cmp	x2, x5
   e0400:	54fffda0 	b.eq	e03b4 <memcpy+0x44>  // b.none
   e0404:	38656826 	ldrb	w6, [x1, x5]
   e0408:	91000c83 	add	x3, x4, #0x3
   e040c:	38256806 	strb	w6, [x0, x5]
   e0410:	eb03005f 	cmp	x2, x3
   e0414:	54fffd00 	b.eq	e03b4 <memcpy+0x44>  // b.none
   e0418:	38636826 	ldrb	w6, [x1, x3]
   e041c:	91001085 	add	x5, x4, #0x4
   e0420:	38236806 	strb	w6, [x0, x3]
   e0424:	eb05005f 	cmp	x2, x5
   e0428:	54fffc60 	b.eq	e03b4 <memcpy+0x44>  // b.none
   e042c:	38656826 	ldrb	w6, [x1, x5]
   e0430:	91001483 	add	x3, x4, #0x5
   e0434:	38256806 	strb	w6, [x0, x5]
   e0438:	eb03005f 	cmp	x2, x3
   e043c:	54fffbc0 	b.eq	e03b4 <memcpy+0x44>  // b.none
   e0440:	38636825 	ldrb	w5, [x1, x3]
   e0444:	91001884 	add	x4, x4, #0x6
   e0448:	38236805 	strb	w5, [x0, x3]
   e044c:	eb04005f 	cmp	x2, x4
   e0450:	54fffb20 	b.eq	e03b4 <memcpy+0x44>  // b.none
   e0454:	38646821 	ldrb	w1, [x1, x4]
   e0458:	38246801 	strb	w1, [x0, x4]
   e045c:	d65f03c0 	ret
   e0460:	d2800003 	mov	x3, #0x0                   	// #0
   e0464:	38636824 	ldrb	w4, [x1, x3]
   e0468:	38236804 	strb	w4, [x0, x3]
   e046c:	91000463 	add	x3, x3, #0x1
   e0470:	eb03005f 	cmp	x2, x3
   e0474:	54fff961 	b.ne	e03a0 <memcpy+0x30>  // b.any
   e0478:	17ffffcf 	b	e03b4 <memcpy+0x44>
   e047c:	d503201f 	nop

00000000000e0480 <memset>:
   e0480:	b4000ce2 	cbz	x2, e061c <memset+0x19c>
   e0484:	cb0003e7 	neg	x7, x0
   e0488:	d2800168 	mov	x8, #0xb                   	// #11
   e048c:	924008e3 	and	x3, x7, #0x7
   e0490:	d1000446 	sub	x6, x2, #0x1
   e0494:	91001c65 	add	x5, x3, #0x7
   e0498:	12001c24 	and	w4, w1, #0xff
   e049c:	eb0800bf 	cmp	x5, x8
   e04a0:	9a8820a5 	csel	x5, x5, x8, cs	// cs = hs, nlast
   e04a4:	eb0500df 	cmp	x6, x5
   e04a8:	54000c83 	b.cc	e0638 <memset+0x1b8>  // b.lo, b.ul, b.last
   e04ac:	b4000c23 	cbz	x3, e0630 <memset+0x1b0>
   e04b0:	39000004 	strb	w4, [x0]
   e04b4:	f27f04ff 	tst	x7, #0x6
   e04b8:	54000b80 	b.eq	e0628 <memset+0x1a8>  // b.none
   e04bc:	39000404 	strb	w4, [x0, #1]
   e04c0:	f100087f 	cmp	x3, #0x2
   e04c4:	54000be9 	b.ls	e0640 <memset+0x1c0>  // b.plast
   e04c8:	39000804 	strb	w4, [x0, #2]
   e04cc:	36100aa7 	tbz	w7, #2, e0620 <memset+0x1a0>
   e04d0:	39000c04 	strb	w4, [x0, #3]
   e04d4:	f100107f 	cmp	x3, #0x4
   e04d8:	54000b89 	b.ls	e0648 <memset+0x1c8>  // b.plast
   e04dc:	39001004 	strb	w4, [x0, #4]
   e04e0:	f100147f 	cmp	x3, #0x5
   e04e4:	54000b60 	b.eq	e0650 <memset+0x1d0>  // b.none
   e04e8:	39001404 	strb	w4, [x0, #5]
   e04ec:	f1001c7f 	cmp	x3, #0x7
   e04f0:	54000b41 	b.ne	e0658 <memset+0x1d8>  // b.any
   e04f4:	aa0303e6 	mov	x6, x3
   e04f8:	39001804 	strb	w4, [x0, #6]
   e04fc:	d2800005 	mov	x5, #0x0                   	// #0
   e0500:	cb030049 	sub	x9, x2, x3
   e0504:	b3401c85 	bfxil	x5, x4, #0, #8
   e0508:	8b030001 	add	x1, x0, x3
   e050c:	927df128 	and	x8, x9, #0xfffffffffffffff8
   e0510:	b3781c85 	bfi	x5, x4, #8, #8
   e0514:	8b080027 	add	x7, x1, x8
   e0518:	b3701c85 	bfi	x5, x4, #16, #8
   e051c:	b3681c85 	bfi	x5, x4, #24, #8
   e0520:	b3601c85 	bfi	x5, x4, #32, #8
   e0524:	b3581c85 	bfi	x5, x4, #40, #8
   e0528:	b3501c85 	bfi	x5, x4, #48, #8
   e052c:	b3481c85 	bfi	x5, x4, #56, #8
   e0530:	f8008425 	str	x5, [x1], #8
   e0534:	eb0100ff 	cmp	x7, x1
   e0538:	54ffffc1 	b.ne	e0530 <memset+0xb0>  // b.any
   e053c:	8b0800c1 	add	x1, x6, x8
   e0540:	eb08013f 	cmp	x9, x8
   e0544:	540006c0 	b.eq	e061c <memset+0x19c>  // b.none
   e0548:	91000423 	add	x3, x1, #0x1
   e054c:	38216804 	strb	w4, [x0, x1]
   e0550:	eb03005f 	cmp	x2, x3
   e0554:	54000640 	b.eq	e061c <memset+0x19c>  // b.none
   e0558:	91000825 	add	x5, x1, #0x2
   e055c:	38236804 	strb	w4, [x0, x3]
   e0560:	eb05005f 	cmp	x2, x5
   e0564:	540005c0 	b.eq	e061c <memset+0x19c>  // b.none
   e0568:	91000c23 	add	x3, x1, #0x3
   e056c:	38256804 	strb	w4, [x0, x5]
   e0570:	eb03005f 	cmp	x2, x3
   e0574:	54000540 	b.eq	e061c <memset+0x19c>  // b.none
   e0578:	91001025 	add	x5, x1, #0x4
   e057c:	38236804 	strb	w4, [x0, x3]
   e0580:	eb05005f 	cmp	x2, x5
   e0584:	540004c0 	b.eq	e061c <memset+0x19c>  // b.none
   e0588:	91001423 	add	x3, x1, #0x5
   e058c:	38256804 	strb	w4, [x0, x5]
   e0590:	eb03005f 	cmp	x2, x3
   e0594:	54000440 	b.eq	e061c <memset+0x19c>  // b.none
   e0598:	91001825 	add	x5, x1, #0x6
   e059c:	38236804 	strb	w4, [x0, x3]
   e05a0:	eb05005f 	cmp	x2, x5
   e05a4:	540003c0 	b.eq	e061c <memset+0x19c>  // b.none
   e05a8:	91001c23 	add	x3, x1, #0x7
   e05ac:	38256804 	strb	w4, [x0, x5]
   e05b0:	eb03005f 	cmp	x2, x3
   e05b4:	54000340 	b.eq	e061c <memset+0x19c>  // b.none
   e05b8:	91002025 	add	x5, x1, #0x8
   e05bc:	38236804 	strb	w4, [x0, x3]
   e05c0:	eb05005f 	cmp	x2, x5
   e05c4:	540002c0 	b.eq	e061c <memset+0x19c>  // b.none
   e05c8:	91002423 	add	x3, x1, #0x9
   e05cc:	38256804 	strb	w4, [x0, x5]
   e05d0:	eb03005f 	cmp	x2, x3
   e05d4:	54000240 	b.eq	e061c <memset+0x19c>  // b.none
   e05d8:	91002825 	add	x5, x1, #0xa
   e05dc:	38236804 	strb	w4, [x0, x3]
   e05e0:	eb05005f 	cmp	x2, x5
   e05e4:	540001c0 	b.eq	e061c <memset+0x19c>  // b.none
   e05e8:	91002c23 	add	x3, x1, #0xb
   e05ec:	38256804 	strb	w4, [x0, x5]
   e05f0:	eb03005f 	cmp	x2, x3
   e05f4:	54000140 	b.eq	e061c <memset+0x19c>  // b.none
   e05f8:	91003025 	add	x5, x1, #0xc
   e05fc:	38236804 	strb	w4, [x0, x3]
   e0600:	eb05005f 	cmp	x2, x5
   e0604:	540000c0 	b.eq	e061c <memset+0x19c>  // b.none
   e0608:	91003421 	add	x1, x1, #0xd
   e060c:	38256804 	strb	w4, [x0, x5]
   e0610:	eb01005f 	cmp	x2, x1
   e0614:	54000040 	b.eq	e061c <memset+0x19c>  // b.none
   e0618:	38216804 	strb	w4, [x0, x1]
   e061c:	d65f03c0 	ret
   e0620:	d2800066 	mov	x6, #0x3                   	// #3
   e0624:	17ffffb6 	b	e04fc <memset+0x7c>
   e0628:	d2800026 	mov	x6, #0x1                   	// #1
   e062c:	17ffffb4 	b	e04fc <memset+0x7c>
   e0630:	d2800006 	mov	x6, #0x0                   	// #0
   e0634:	17ffffb2 	b	e04fc <memset+0x7c>
   e0638:	d2800001 	mov	x1, #0x0                   	// #0
   e063c:	17ffffc3 	b	e0548 <memset+0xc8>
   e0640:	d2800046 	mov	x6, #0x2                   	// #2
   e0644:	17ffffae 	b	e04fc <memset+0x7c>
   e0648:	d2800086 	mov	x6, #0x4                   	// #4
   e064c:	17ffffac 	b	e04fc <memset+0x7c>
   e0650:	aa0303e6 	mov	x6, x3
   e0654:	17ffffaa 	b	e04fc <memset+0x7c>
   e0658:	d28000c6 	mov	x6, #0x6                   	// #6
   e065c:	17ffffa8 	b	e04fc <memset+0x7c>

00000000000e0660 <memmove>:
   e0660:	b40000c2 	cbz	x2, e0678 <memmove+0x18>
   e0664:	d503201f 	nop
   e0668:	d1000442 	sub	x2, x2, #0x1
   e066c:	38626823 	ldrb	w3, [x1, x2]
   e0670:	38226803 	strb	w3, [x0, x2]
   e0674:	b5ffffa2 	cbnz	x2, e0668 <memmove+0x8>
   e0678:	d65f03c0 	ret
