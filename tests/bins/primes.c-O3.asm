
primes.c.elf:     file format elf64-littleaarch64


Disassembly of section .start:

00000000000e0000 <_start>:
   e0000:	d2884805 	mov	x5, #0x4240                	// #16960
   e0004:	b201f3e7 	mov	x7, #0xaaaaaaaaaaaaaaaa    	// #-6148914691236517206
   e0008:	d2800043 	mov	x3, #0x2                   	// #2
   e000c:	d2800000 	mov	x0, #0x0                   	// #0
   e0010:	f2a001e5 	movk	x5, #0xf, lsl #16
   e0014:	f2955567 	movk	x7, #0xaaab
   e0018:	b200f3e6 	mov	x6, #0x5555555555555555    	// #6148914691236517205
   e001c:	d503201f 	nop
   e0020:	f100087f 	cmp	x3, #0x2
   e0024:	1a9f07e1 	cset	w1, ne	// ne = any
   e0028:	6a23003f 	bics	wzr, w1, w3
   e002c:	54000201 	b.ne	e006c <_start+0x6c>  // b.any
   e0030:	d341fc64 	lsr	x4, x3, #1
   e0034:	f1001c7f 	cmp	x3, #0x7
   e0038:	54000229 	b.ls	e007c <_start+0x7c>  // b.plast
   e003c:	9b077c61 	mul	x1, x3, x7
   e0040:	eb06003f 	cmp	x1, x6
   e0044:	54000149 	b.ls	e006c <_start+0x6c>  // b.plast
   e0048:	d28000a1 	mov	x1, #0x5                   	// #5
   e004c:	14000005 	b	e0060 <_start+0x60>
   e0050:	9ac10862 	udiv	x2, x3, x1
   e0054:	9b018c42 	msub	x2, x2, x1, x3
   e0058:	91000821 	add	x1, x1, #0x2
   e005c:	b4000082 	cbz	x2, e006c <_start+0x6c>
   e0060:	eb01009f 	cmp	x4, x1
   e0064:	54ffff68 	b.hi	e0050 <_start+0x50>  // b.pmore
   e0068:	91000400 	add	x0, x0, #0x1
   e006c:	91000463 	add	x3, x3, #0x1
   e0070:	eb05007f 	cmp	x3, x5
   e0074:	54fffd61 	b.ne	e0020 <_start+0x20>  // b.any
   e0078:	d65f03c0 	ret
   e007c:	91000400 	add	x0, x0, #0x1
   e0080:	91000463 	add	x3, x3, #0x1
   e0084:	17ffffe7 	b	e0020 <_start+0x20>

Disassembly of section .text:

00000000000e0090 <is_prime_cpu>:
   e0090:	f100081f 	cmp	x0, #0x2
   e0094:	aa0003e2 	mov	x2, x0
   e0098:	1a9f97e0 	cset	w0, hi	// hi = pmore
   e009c:	6a22001f 	bics	wzr, w0, w2
   e00a0:	540002a1 	b.ne	e00f4 <is_prime_cpu+0x64>  // b.any
   e00a4:	d341fc43 	lsr	x3, x2, #1
   e00a8:	f1001c5f 	cmp	x2, #0x7
   e00ac:	54000209 	b.ls	e00ec <is_prime_cpu+0x5c>  // b.plast
   e00b0:	b201f3e1 	mov	x1, #0xaaaaaaaaaaaaaaaa    	// #-6148914691236517206
   e00b4:	f2955561 	movk	x1, #0xaaab
   e00b8:	9bc17c41 	umulh	x1, x2, x1
   e00bc:	927ff820 	and	x0, x1, #0xfffffffffffffffe
   e00c0:	8b410401 	add	x1, x0, x1, lsr #1
   e00c4:	eb010040 	subs	x0, x2, x1
   e00c8:	54000140 	b.eq	e00f0 <is_prime_cpu+0x60>  // b.none
   e00cc:	d28000a1 	mov	x1, #0x5                   	// #5
   e00d0:	14000005 	b	e00e4 <is_prime_cpu+0x54>
   e00d4:	9ac10840 	udiv	x0, x2, x1
   e00d8:	9b018800 	msub	x0, x0, x1, x2
   e00dc:	91000821 	add	x1, x1, #0x2
   e00e0:	b4000080 	cbz	x0, e00f0 <is_prime_cpu+0x60>
   e00e4:	eb01007f 	cmp	x3, x1
   e00e8:	54ffff68 	b.hi	e00d4 <is_prime_cpu+0x44>  // b.pmore
   e00ec:	d2800020 	mov	x0, #0x1                   	// #1
   e00f0:	d65f03c0 	ret
   e00f4:	d2800000 	mov	x0, #0x0                   	// #0
   e00f8:	d65f03c0 	ret
   e00fc:	00000000 	udf	#0

00000000000e0100 <memcpy>:
   e0100:	b4000222 	cbz	x2, e0144 <memcpy+0x44>
   e0104:	d1000443 	sub	x3, x2, #0x1
   e0108:	f1001c7f 	cmp	x3, #0x7
   e010c:	54000729 	b.ls	e01f0 <memcpy+0xf0>  // b.plast
   e0110:	aa010005 	orr	x5, x0, x1
   e0114:	91000424 	add	x4, x1, #0x1
   e0118:	cb040004 	sub	x4, x0, x4
   e011c:	d2800003 	mov	x3, #0x0                   	// #0
   e0120:	f24008bf 	tst	x5, #0x7
   e0124:	fa460880 	ccmp	x4, #0x6, #0x0, eq	// eq = none
   e0128:	54000108 	b.hi	e0148 <memcpy+0x48>  // b.pmore
   e012c:	d503201f 	nop
   e0130:	38636824 	ldrb	w4, [x1, x3]
   e0134:	38236804 	strb	w4, [x0, x3]
   e0138:	91000463 	add	x3, x3, #0x1
   e013c:	eb03005f 	cmp	x2, x3
   e0140:	54ffff81 	b.ne	e0130 <memcpy+0x30>  // b.any
   e0144:	d65f03c0 	ret
   e0148:	927df044 	and	x4, x2, #0xfffffffffffffff8
   e014c:	d503201f 	nop
   e0150:	f8636825 	ldr	x5, [x1, x3]
   e0154:	f8236805 	str	x5, [x0, x3]
   e0158:	91002063 	add	x3, x3, #0x8
   e015c:	eb03009f 	cmp	x4, x3
   e0160:	54ffff81 	b.ne	e0150 <memcpy+0x50>  // b.any
   e0164:	eb04005f 	cmp	x2, x4
   e0168:	54fffee0 	b.eq	e0144 <memcpy+0x44>  // b.none
   e016c:	38646825 	ldrb	w5, [x1, x4]
   e0170:	91000483 	add	x3, x4, #0x1
   e0174:	38246805 	strb	w5, [x0, x4]
   e0178:	eb03005f 	cmp	x2, x3
   e017c:	54fffe40 	b.eq	e0144 <memcpy+0x44>  // b.none
   e0180:	38636826 	ldrb	w6, [x1, x3]
   e0184:	91000885 	add	x5, x4, #0x2
   e0188:	38236806 	strb	w6, [x0, x3]
   e018c:	eb05005f 	cmp	x2, x5
   e0190:	54fffda0 	b.eq	e0144 <memcpy+0x44>  // b.none
   e0194:	38656826 	ldrb	w6, [x1, x5]
   e0198:	91000c83 	add	x3, x4, #0x3
   e019c:	38256806 	strb	w6, [x0, x5]
   e01a0:	eb03005f 	cmp	x2, x3
   e01a4:	54fffd00 	b.eq	e0144 <memcpy+0x44>  // b.none
   e01a8:	38636826 	ldrb	w6, [x1, x3]
   e01ac:	91001085 	add	x5, x4, #0x4
   e01b0:	38236806 	strb	w6, [x0, x3]
   e01b4:	eb05005f 	cmp	x2, x5
   e01b8:	54fffc60 	b.eq	e0144 <memcpy+0x44>  // b.none
   e01bc:	38656826 	ldrb	w6, [x1, x5]
   e01c0:	91001483 	add	x3, x4, #0x5
   e01c4:	38256806 	strb	w6, [x0, x5]
   e01c8:	eb03005f 	cmp	x2, x3
   e01cc:	54fffbc0 	b.eq	e0144 <memcpy+0x44>  // b.none
   e01d0:	38636825 	ldrb	w5, [x1, x3]
   e01d4:	91001884 	add	x4, x4, #0x6
   e01d8:	38236805 	strb	w5, [x0, x3]
   e01dc:	eb04005f 	cmp	x2, x4
   e01e0:	54fffb20 	b.eq	e0144 <memcpy+0x44>  // b.none
   e01e4:	38646821 	ldrb	w1, [x1, x4]
   e01e8:	38246801 	strb	w1, [x0, x4]
   e01ec:	d65f03c0 	ret
   e01f0:	d2800003 	mov	x3, #0x0                   	// #0
   e01f4:	38636824 	ldrb	w4, [x1, x3]
   e01f8:	38236804 	strb	w4, [x0, x3]
   e01fc:	91000463 	add	x3, x3, #0x1
   e0200:	eb03005f 	cmp	x2, x3
   e0204:	54fff961 	b.ne	e0130 <memcpy+0x30>  // b.any
   e0208:	17ffffcf 	b	e0144 <memcpy+0x44>
   e020c:	d503201f 	nop

00000000000e0210 <memset>:
   e0210:	b4000ce2 	cbz	x2, e03ac <memset+0x19c>
   e0214:	cb0003e7 	neg	x7, x0
   e0218:	d2800168 	mov	x8, #0xb                   	// #11
   e021c:	924008e3 	and	x3, x7, #0x7
   e0220:	d1000446 	sub	x6, x2, #0x1
   e0224:	91001c65 	add	x5, x3, #0x7
   e0228:	12001c24 	and	w4, w1, #0xff
   e022c:	eb0800bf 	cmp	x5, x8
   e0230:	9a8820a5 	csel	x5, x5, x8, cs	// cs = hs, nlast
   e0234:	eb0500df 	cmp	x6, x5
   e0238:	54000c83 	b.cc	e03c8 <memset+0x1b8>  // b.lo, b.ul, b.last
   e023c:	b4000c23 	cbz	x3, e03c0 <memset+0x1b0>
   e0240:	39000004 	strb	w4, [x0]
   e0244:	f27f04ff 	tst	x7, #0x6
   e0248:	54000b80 	b.eq	e03b8 <memset+0x1a8>  // b.none
   e024c:	39000404 	strb	w4, [x0, #1]
   e0250:	f100087f 	cmp	x3, #0x2
   e0254:	54000be9 	b.ls	e03d0 <memset+0x1c0>  // b.plast
   e0258:	39000804 	strb	w4, [x0, #2]
   e025c:	36100aa7 	tbz	w7, #2, e03b0 <memset+0x1a0>
   e0260:	39000c04 	strb	w4, [x0, #3]
   e0264:	f100107f 	cmp	x3, #0x4
   e0268:	54000b89 	b.ls	e03d8 <memset+0x1c8>  // b.plast
   e026c:	39001004 	strb	w4, [x0, #4]
   e0270:	f100147f 	cmp	x3, #0x5
   e0274:	54000b60 	b.eq	e03e0 <memset+0x1d0>  // b.none
   e0278:	39001404 	strb	w4, [x0, #5]
   e027c:	f1001c7f 	cmp	x3, #0x7
   e0280:	54000b41 	b.ne	e03e8 <memset+0x1d8>  // b.any
   e0284:	aa0303e6 	mov	x6, x3
   e0288:	39001804 	strb	w4, [x0, #6]
   e028c:	d2800005 	mov	x5, #0x0                   	// #0
   e0290:	cb030049 	sub	x9, x2, x3
   e0294:	b3401c85 	bfxil	x5, x4, #0, #8
   e0298:	8b030001 	add	x1, x0, x3
   e029c:	927df128 	and	x8, x9, #0xfffffffffffffff8
   e02a0:	b3781c85 	bfi	x5, x4, #8, #8
   e02a4:	8b080027 	add	x7, x1, x8
   e02a8:	b3701c85 	bfi	x5, x4, #16, #8
   e02ac:	b3681c85 	bfi	x5, x4, #24, #8
   e02b0:	b3601c85 	bfi	x5, x4, #32, #8
   e02b4:	b3581c85 	bfi	x5, x4, #40, #8
   e02b8:	b3501c85 	bfi	x5, x4, #48, #8
   e02bc:	b3481c85 	bfi	x5, x4, #56, #8
   e02c0:	f8008425 	str	x5, [x1], #8
   e02c4:	eb0100ff 	cmp	x7, x1
   e02c8:	54ffffc1 	b.ne	e02c0 <memset+0xb0>  // b.any
   e02cc:	8b0800c1 	add	x1, x6, x8
   e02d0:	eb08013f 	cmp	x9, x8
   e02d4:	540006c0 	b.eq	e03ac <memset+0x19c>  // b.none
   e02d8:	91000423 	add	x3, x1, #0x1
   e02dc:	38216804 	strb	w4, [x0, x1]
   e02e0:	eb03005f 	cmp	x2, x3
   e02e4:	54000640 	b.eq	e03ac <memset+0x19c>  // b.none
   e02e8:	91000825 	add	x5, x1, #0x2
   e02ec:	38236804 	strb	w4, [x0, x3]
   e02f0:	eb05005f 	cmp	x2, x5
   e02f4:	540005c0 	b.eq	e03ac <memset+0x19c>  // b.none
   e02f8:	91000c23 	add	x3, x1, #0x3
   e02fc:	38256804 	strb	w4, [x0, x5]
   e0300:	eb03005f 	cmp	x2, x3
   e0304:	54000540 	b.eq	e03ac <memset+0x19c>  // b.none
   e0308:	91001025 	add	x5, x1, #0x4
   e030c:	38236804 	strb	w4, [x0, x3]
   e0310:	eb05005f 	cmp	x2, x5
   e0314:	540004c0 	b.eq	e03ac <memset+0x19c>  // b.none
   e0318:	91001423 	add	x3, x1, #0x5
   e031c:	38256804 	strb	w4, [x0, x5]
   e0320:	eb03005f 	cmp	x2, x3
   e0324:	54000440 	b.eq	e03ac <memset+0x19c>  // b.none
   e0328:	91001825 	add	x5, x1, #0x6
   e032c:	38236804 	strb	w4, [x0, x3]
   e0330:	eb05005f 	cmp	x2, x5
   e0334:	540003c0 	b.eq	e03ac <memset+0x19c>  // b.none
   e0338:	91001c23 	add	x3, x1, #0x7
   e033c:	38256804 	strb	w4, [x0, x5]
   e0340:	eb03005f 	cmp	x2, x3
   e0344:	54000340 	b.eq	e03ac <memset+0x19c>  // b.none
   e0348:	91002025 	add	x5, x1, #0x8
   e034c:	38236804 	strb	w4, [x0, x3]
   e0350:	eb05005f 	cmp	x2, x5
   e0354:	540002c0 	b.eq	e03ac <memset+0x19c>  // b.none
   e0358:	91002423 	add	x3, x1, #0x9
   e035c:	38256804 	strb	w4, [x0, x5]
   e0360:	eb03005f 	cmp	x2, x3
   e0364:	54000240 	b.eq	e03ac <memset+0x19c>  // b.none
   e0368:	91002825 	add	x5, x1, #0xa
   e036c:	38236804 	strb	w4, [x0, x3]
   e0370:	eb05005f 	cmp	x2, x5
   e0374:	540001c0 	b.eq	e03ac <memset+0x19c>  // b.none
   e0378:	91002c23 	add	x3, x1, #0xb
   e037c:	38256804 	strb	w4, [x0, x5]
   e0380:	eb03005f 	cmp	x2, x3
   e0384:	54000140 	b.eq	e03ac <memset+0x19c>  // b.none
   e0388:	91003025 	add	x5, x1, #0xc
   e038c:	38236804 	strb	w4, [x0, x3]
   e0390:	eb05005f 	cmp	x2, x5
   e0394:	540000c0 	b.eq	e03ac <memset+0x19c>  // b.none
   e0398:	91003421 	add	x1, x1, #0xd
   e039c:	38256804 	strb	w4, [x0, x5]
   e03a0:	eb01005f 	cmp	x2, x1
   e03a4:	54000040 	b.eq	e03ac <memset+0x19c>  // b.none
   e03a8:	38216804 	strb	w4, [x0, x1]
   e03ac:	d65f03c0 	ret
   e03b0:	d2800066 	mov	x6, #0x3                   	// #3
   e03b4:	17ffffb6 	b	e028c <memset+0x7c>
   e03b8:	d2800026 	mov	x6, #0x1                   	// #1
   e03bc:	17ffffb4 	b	e028c <memset+0x7c>
   e03c0:	d2800006 	mov	x6, #0x0                   	// #0
   e03c4:	17ffffb2 	b	e028c <memset+0x7c>
   e03c8:	d2800001 	mov	x1, #0x0                   	// #0
   e03cc:	17ffffc3 	b	e02d8 <memset+0xc8>
   e03d0:	d2800046 	mov	x6, #0x2                   	// #2
   e03d4:	17ffffae 	b	e028c <memset+0x7c>
   e03d8:	d2800086 	mov	x6, #0x4                   	// #4
   e03dc:	17ffffac 	b	e028c <memset+0x7c>
   e03e0:	aa0303e6 	mov	x6, x3
   e03e4:	17ffffaa 	b	e028c <memset+0x7c>
   e03e8:	d28000c6 	mov	x6, #0x6                   	// #6
   e03ec:	17ffffa8 	b	e028c <memset+0x7c>

00000000000e03f0 <memmove>:
   e03f0:	b40000c2 	cbz	x2, e0408 <memmove+0x18>
   e03f4:	d503201f 	nop
   e03f8:	d1000442 	sub	x2, x2, #0x1
   e03fc:	38626823 	ldrb	w3, [x1, x2]
   e0400:	38226803 	strb	w3, [x0, x2]
   e0404:	b5ffffa2 	cbnz	x2, e03f8 <memmove+0x8>
   e0408:	d65f03c0 	ret
