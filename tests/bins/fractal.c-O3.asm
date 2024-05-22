
fractal.c.elf:     file format elf64-littleaarch64


Disassembly of section .start:

00000000000e0000 <_start>:
   e0000:	5291746f 	mov	w15, #0x8ba3                	// #35747
   e0004:	5280000d 	mov	w13, #0x0                   	// #0
   e0008:	d2800000 	mov	x0, #0x0                   	// #0
   e000c:	72b745cf 	movk	w15, #0xba2e, lsl #16
   e0010:	5283780c 	mov	w12, #0x1bc0                	// #7104
   e0014:	5282100e 	mov	w14, #0x1080                	// #4224
   e0018:	9baf7daa 	umull	x10, w13, w15
   e001c:	5280000b 	mov	w11, #0x0                   	// #0
   e0020:	d364fd4a 	lsr	x10, x10, #36
   e0024:	5101814a 	sub	w10, w10, #0x60
   e0028:	12003d4a 	and	w10, w10, #0xffff
   e002c:	d503201f 	nop
   e0030:	13057d68 	asr	w8, w11, #5
   e0034:	52800006 	mov	w6, #0x0                   	// #0
   e0038:	51024108 	sub	w8, w8, #0x90
   e003c:	52800003 	mov	w3, #0x0                   	// #0
   e0040:	12003d08 	and	w8, w8, #0xffff
   e0044:	52800005 	mov	w5, #0x0                   	// #0
   e0048:	52800001 	mov	w1, #0x0                   	// #0
   e004c:	52800004 	mov	w4, #0x0                   	// #0
   e0050:	2a0403e2 	mov	w2, w4
   e0054:	0b010101 	add	w1, w8, w1
   e0058:	4b030021 	sub	w1, w1, w3
   e005c:	110004c7 	add	w7, w6, #0x1
   e0060:	12003c24 	and	w4, w1, #0xffff
   e0064:	12003ce3 	and	w3, w7, #0xffff
   e0068:	1b057c42 	mul	w2, w2, w5
   e006c:	2a0603e9 	mov	w9, w6
   e0070:	13003ce6 	sxth	w6, w7
   e0074:	1b047c81 	mul	w1, w4, w4
   e0078:	93463c42 	sbfx	x2, x2, #6, #10
   e007c:	0b020542 	add	w2, w10, w2, lsl #1
   e0080:	93463c21 	sbfx	x1, x1, #6, #10
   e0084:	12003c45 	and	w5, w2, #0xffff
   e0088:	71004c7f 	cmp	w3, #0x13
   e008c:	540001c0 	b.eq	e00c4 <_start+0xc4>  // b.none
   e0090:	1b057ca3 	mul	w3, w5, w5
   e0094:	93463c63 	sbfx	x3, x3, #6, #10
   e0098:	0b030022 	add	w2, w1, w3
   e009c:	7103fc5f 	cmp	w2, #0xff
   e00a0:	54fffd89 	b.ls	e0050 <_start+0x50>  // b.plast
   e00a4:	1101296b 	add	w11, w11, #0x4a
   e00a8:	8b29c000 	add	x0, x0, w9, sxtw
   e00ac:	6b0c017f 	cmp	w11, w12
   e00b0:	54fffc01 	b.ne	e0030 <_start+0x30>  // b.any
   e00b4:	110101ad 	add	w13, w13, #0x40
   e00b8:	6b0e01bf 	cmp	w13, w14
   e00bc:	54fffae1 	b.ne	e0018 <_start+0x18>  // b.any
   e00c0:	d65f03c0 	ret
   e00c4:	52800249 	mov	w9, #0x12                  	// #18
   e00c8:	1101296b 	add	w11, w11, #0x4a
   e00cc:	8b29c000 	add	x0, x0, w9, sxtw
   e00d0:	6b0c017f 	cmp	w11, w12
   e00d4:	54fffae1 	b.ne	e0030 <_start+0x30>  // b.any
   e00d8:	17fffff7 	b	e00b4 <_start+0xb4>

Disassembly of section .text:

00000000000e00e0 <s>:
   e00e0:	d65f03c0 	ret
	...

00000000000e00f0 <memcpy>:
   e00f0:	b4000222 	cbz	x2, e0134 <memcpy+0x44>
   e00f4:	d1000443 	sub	x3, x2, #0x1
   e00f8:	f1001c7f 	cmp	x3, #0x7
   e00fc:	54000729 	b.ls	e01e0 <memcpy+0xf0>  // b.plast
   e0100:	aa010005 	orr	x5, x0, x1
   e0104:	91000424 	add	x4, x1, #0x1
   e0108:	cb040004 	sub	x4, x0, x4
   e010c:	d2800003 	mov	x3, #0x0                   	// #0
   e0110:	f24008bf 	tst	x5, #0x7
   e0114:	fa460880 	ccmp	x4, #0x6, #0x0, eq	// eq = none
   e0118:	54000108 	b.hi	e0138 <memcpy+0x48>  // b.pmore
   e011c:	d503201f 	nop
   e0120:	38636824 	ldrb	w4, [x1, x3]
   e0124:	38236804 	strb	w4, [x0, x3]
   e0128:	91000463 	add	x3, x3, #0x1
   e012c:	eb03005f 	cmp	x2, x3
   e0130:	54ffff81 	b.ne	e0120 <memcpy+0x30>  // b.any
   e0134:	d65f03c0 	ret
   e0138:	927df044 	and	x4, x2, #0xfffffffffffffff8
   e013c:	d503201f 	nop
   e0140:	f8636825 	ldr	x5, [x1, x3]
   e0144:	f8236805 	str	x5, [x0, x3]
   e0148:	91002063 	add	x3, x3, #0x8
   e014c:	eb03009f 	cmp	x4, x3
   e0150:	54ffff81 	b.ne	e0140 <memcpy+0x50>  // b.any
   e0154:	eb04005f 	cmp	x2, x4
   e0158:	54fffee0 	b.eq	e0134 <memcpy+0x44>  // b.none
   e015c:	38646825 	ldrb	w5, [x1, x4]
   e0160:	91000483 	add	x3, x4, #0x1
   e0164:	38246805 	strb	w5, [x0, x4]
   e0168:	eb03005f 	cmp	x2, x3
   e016c:	54fffe40 	b.eq	e0134 <memcpy+0x44>  // b.none
   e0170:	38636826 	ldrb	w6, [x1, x3]
   e0174:	91000885 	add	x5, x4, #0x2
   e0178:	38236806 	strb	w6, [x0, x3]
   e017c:	eb05005f 	cmp	x2, x5
   e0180:	54fffda0 	b.eq	e0134 <memcpy+0x44>  // b.none
   e0184:	38656826 	ldrb	w6, [x1, x5]
   e0188:	91000c83 	add	x3, x4, #0x3
   e018c:	38256806 	strb	w6, [x0, x5]
   e0190:	eb03005f 	cmp	x2, x3
   e0194:	54fffd00 	b.eq	e0134 <memcpy+0x44>  // b.none
   e0198:	38636826 	ldrb	w6, [x1, x3]
   e019c:	91001085 	add	x5, x4, #0x4
   e01a0:	38236806 	strb	w6, [x0, x3]
   e01a4:	eb05005f 	cmp	x2, x5
   e01a8:	54fffc60 	b.eq	e0134 <memcpy+0x44>  // b.none
   e01ac:	38656826 	ldrb	w6, [x1, x5]
   e01b0:	91001483 	add	x3, x4, #0x5
   e01b4:	38256806 	strb	w6, [x0, x5]
   e01b8:	eb03005f 	cmp	x2, x3
   e01bc:	54fffbc0 	b.eq	e0134 <memcpy+0x44>  // b.none
   e01c0:	38636825 	ldrb	w5, [x1, x3]
   e01c4:	91001884 	add	x4, x4, #0x6
   e01c8:	38236805 	strb	w5, [x0, x3]
   e01cc:	eb04005f 	cmp	x2, x4
   e01d0:	54fffb20 	b.eq	e0134 <memcpy+0x44>  // b.none
   e01d4:	38646821 	ldrb	w1, [x1, x4]
   e01d8:	38246801 	strb	w1, [x0, x4]
   e01dc:	d65f03c0 	ret
   e01e0:	d2800003 	mov	x3, #0x0                   	// #0
   e01e4:	38636824 	ldrb	w4, [x1, x3]
   e01e8:	38236804 	strb	w4, [x0, x3]
   e01ec:	91000463 	add	x3, x3, #0x1
   e01f0:	eb03005f 	cmp	x2, x3
   e01f4:	54fff961 	b.ne	e0120 <memcpy+0x30>  // b.any
   e01f8:	17ffffcf 	b	e0134 <memcpy+0x44>
   e01fc:	d503201f 	nop

00000000000e0200 <memset>:
   e0200:	b4000ce2 	cbz	x2, e039c <memset+0x19c>
   e0204:	cb0003e7 	neg	x7, x0
   e0208:	d2800168 	mov	x8, #0xb                   	// #11
   e020c:	924008e3 	and	x3, x7, #0x7
   e0210:	d1000446 	sub	x6, x2, #0x1
   e0214:	91001c65 	add	x5, x3, #0x7
   e0218:	12001c24 	and	w4, w1, #0xff
   e021c:	eb0800bf 	cmp	x5, x8
   e0220:	9a8820a5 	csel	x5, x5, x8, cs	// cs = hs, nlast
   e0224:	eb0500df 	cmp	x6, x5
   e0228:	54000c83 	b.cc	e03b8 <memset+0x1b8>  // b.lo, b.ul, b.last
   e022c:	b4000c23 	cbz	x3, e03b0 <memset+0x1b0>
   e0230:	39000004 	strb	w4, [x0]
   e0234:	f27f04ff 	tst	x7, #0x6
   e0238:	54000b80 	b.eq	e03a8 <memset+0x1a8>  // b.none
   e023c:	39000404 	strb	w4, [x0, #1]
   e0240:	f100087f 	cmp	x3, #0x2
   e0244:	54000be9 	b.ls	e03c0 <memset+0x1c0>  // b.plast
   e0248:	39000804 	strb	w4, [x0, #2]
   e024c:	36100aa7 	tbz	w7, #2, e03a0 <memset+0x1a0>
   e0250:	39000c04 	strb	w4, [x0, #3]
   e0254:	f100107f 	cmp	x3, #0x4
   e0258:	54000b89 	b.ls	e03c8 <memset+0x1c8>  // b.plast
   e025c:	39001004 	strb	w4, [x0, #4]
   e0260:	f100147f 	cmp	x3, #0x5
   e0264:	54000b60 	b.eq	e03d0 <memset+0x1d0>  // b.none
   e0268:	39001404 	strb	w4, [x0, #5]
   e026c:	f1001c7f 	cmp	x3, #0x7
   e0270:	54000b41 	b.ne	e03d8 <memset+0x1d8>  // b.any
   e0274:	aa0303e6 	mov	x6, x3
   e0278:	39001804 	strb	w4, [x0, #6]
   e027c:	d2800005 	mov	x5, #0x0                   	// #0
   e0280:	cb030049 	sub	x9, x2, x3
   e0284:	b3401c85 	bfxil	x5, x4, #0, #8
   e0288:	8b030001 	add	x1, x0, x3
   e028c:	927df128 	and	x8, x9, #0xfffffffffffffff8
   e0290:	b3781c85 	bfi	x5, x4, #8, #8
   e0294:	8b080027 	add	x7, x1, x8
   e0298:	b3701c85 	bfi	x5, x4, #16, #8
   e029c:	b3681c85 	bfi	x5, x4, #24, #8
   e02a0:	b3601c85 	bfi	x5, x4, #32, #8
   e02a4:	b3581c85 	bfi	x5, x4, #40, #8
   e02a8:	b3501c85 	bfi	x5, x4, #48, #8
   e02ac:	b3481c85 	bfi	x5, x4, #56, #8
   e02b0:	f8008425 	str	x5, [x1], #8
   e02b4:	eb0100ff 	cmp	x7, x1
   e02b8:	54ffffc1 	b.ne	e02b0 <memset+0xb0>  // b.any
   e02bc:	8b0800c1 	add	x1, x6, x8
   e02c0:	eb08013f 	cmp	x9, x8
   e02c4:	540006c0 	b.eq	e039c <memset+0x19c>  // b.none
   e02c8:	91000423 	add	x3, x1, #0x1
   e02cc:	38216804 	strb	w4, [x0, x1]
   e02d0:	eb03005f 	cmp	x2, x3
   e02d4:	54000640 	b.eq	e039c <memset+0x19c>  // b.none
   e02d8:	91000825 	add	x5, x1, #0x2
   e02dc:	38236804 	strb	w4, [x0, x3]
   e02e0:	eb05005f 	cmp	x2, x5
   e02e4:	540005c0 	b.eq	e039c <memset+0x19c>  // b.none
   e02e8:	91000c23 	add	x3, x1, #0x3
   e02ec:	38256804 	strb	w4, [x0, x5]
   e02f0:	eb03005f 	cmp	x2, x3
   e02f4:	54000540 	b.eq	e039c <memset+0x19c>  // b.none
   e02f8:	91001025 	add	x5, x1, #0x4
   e02fc:	38236804 	strb	w4, [x0, x3]
   e0300:	eb05005f 	cmp	x2, x5
   e0304:	540004c0 	b.eq	e039c <memset+0x19c>  // b.none
   e0308:	91001423 	add	x3, x1, #0x5
   e030c:	38256804 	strb	w4, [x0, x5]
   e0310:	eb03005f 	cmp	x2, x3
   e0314:	54000440 	b.eq	e039c <memset+0x19c>  // b.none
   e0318:	91001825 	add	x5, x1, #0x6
   e031c:	38236804 	strb	w4, [x0, x3]
   e0320:	eb05005f 	cmp	x2, x5
   e0324:	540003c0 	b.eq	e039c <memset+0x19c>  // b.none
   e0328:	91001c23 	add	x3, x1, #0x7
   e032c:	38256804 	strb	w4, [x0, x5]
   e0330:	eb03005f 	cmp	x2, x3
   e0334:	54000340 	b.eq	e039c <memset+0x19c>  // b.none
   e0338:	91002025 	add	x5, x1, #0x8
   e033c:	38236804 	strb	w4, [x0, x3]
   e0340:	eb05005f 	cmp	x2, x5
   e0344:	540002c0 	b.eq	e039c <memset+0x19c>  // b.none
   e0348:	91002423 	add	x3, x1, #0x9
   e034c:	38256804 	strb	w4, [x0, x5]
   e0350:	eb03005f 	cmp	x2, x3
   e0354:	54000240 	b.eq	e039c <memset+0x19c>  // b.none
   e0358:	91002825 	add	x5, x1, #0xa
   e035c:	38236804 	strb	w4, [x0, x3]
   e0360:	eb05005f 	cmp	x2, x5
   e0364:	540001c0 	b.eq	e039c <memset+0x19c>  // b.none
   e0368:	91002c23 	add	x3, x1, #0xb
   e036c:	38256804 	strb	w4, [x0, x5]
   e0370:	eb03005f 	cmp	x2, x3
   e0374:	54000140 	b.eq	e039c <memset+0x19c>  // b.none
   e0378:	91003025 	add	x5, x1, #0xc
   e037c:	38236804 	strb	w4, [x0, x3]
   e0380:	eb05005f 	cmp	x2, x5
   e0384:	540000c0 	b.eq	e039c <memset+0x19c>  // b.none
   e0388:	91003421 	add	x1, x1, #0xd
   e038c:	38256804 	strb	w4, [x0, x5]
   e0390:	eb01005f 	cmp	x2, x1
   e0394:	54000040 	b.eq	e039c <memset+0x19c>  // b.none
   e0398:	38216804 	strb	w4, [x0, x1]
   e039c:	d65f03c0 	ret
   e03a0:	d2800066 	mov	x6, #0x3                   	// #3
   e03a4:	17ffffb6 	b	e027c <memset+0x7c>
   e03a8:	d2800026 	mov	x6, #0x1                   	// #1
   e03ac:	17ffffb4 	b	e027c <memset+0x7c>
   e03b0:	d2800006 	mov	x6, #0x0                   	// #0
   e03b4:	17ffffb2 	b	e027c <memset+0x7c>
   e03b8:	d2800001 	mov	x1, #0x0                   	// #0
   e03bc:	17ffffc3 	b	e02c8 <memset+0xc8>
   e03c0:	d2800046 	mov	x6, #0x2                   	// #2
   e03c4:	17ffffae 	b	e027c <memset+0x7c>
   e03c8:	d2800086 	mov	x6, #0x4                   	// #4
   e03cc:	17ffffac 	b	e027c <memset+0x7c>
   e03d0:	aa0303e6 	mov	x6, x3
   e03d4:	17ffffaa 	b	e027c <memset+0x7c>
   e03d8:	d28000c6 	mov	x6, #0x6                   	// #6
   e03dc:	17ffffa8 	b	e027c <memset+0x7c>

00000000000e03e0 <memmove>:
   e03e0:	b40000c2 	cbz	x2, e03f8 <memmove+0x18>
   e03e4:	d503201f 	nop
   e03e8:	d1000442 	sub	x2, x2, #0x1
   e03ec:	38626823 	ldrb	w3, [x1, x2]
   e03f0:	38226803 	strb	w3, [x0, x2]
   e03f4:	b5ffffa2 	cbnz	x2, e03e8 <memmove+0x8>
   e03f8:	d65f03c0 	ret
