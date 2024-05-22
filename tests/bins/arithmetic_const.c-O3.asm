
arithmetic_const.c.elf:     file format elf64-littleaarch64


Disassembly of section .start:

00000000000e0000 <start_>:
   e0000:	d2849263 	mov	x3, #0x2493                	// #9363
   e0004:	91003000 	add	x0, x0, #0xc
   e0008:	f2b24923 	movk	x3, #0x9249, lsl #16
   e000c:	b204cfe2 	mov	x2, #0xf0f0f0f0f0f0f0f0    	// #-1085102592571150096
   e0010:	f2c92483 	movk	x3, #0x4924, lsl #32
   e0014:	f29e1e22 	movk	x2, #0xf0f1
   e0018:	f2e49243 	movk	x3, #0x2492, lsl #48
   e001c:	9bc37c03 	umulh	x3, x0, x3
   e0020:	cb030001 	sub	x1, x0, x3
   e0024:	8b410461 	add	x1, x3, x1, lsr #1
   e0028:	d342fc21 	lsr	x1, x1, #2
   e002c:	8b010421 	add	x1, x1, x1, lsl #1
   e0030:	9bc27c20 	umulh	x0, x1, x2
   e0034:	927cec02 	and	x2, x0, #0xfffffffffffffff0
   e0038:	8b401040 	add	x0, x2, x0, lsr #4
   e003c:	cb000020 	sub	x0, x1, x0
   e0040:	d65f03c0 	ret

Disassembly of section .text:

00000000000e0050 <memcpy>:
   e0050:	b4000222 	cbz	x2, e0094 <memcpy+0x44>
   e0054:	d1000443 	sub	x3, x2, #0x1
   e0058:	f1001c7f 	cmp	x3, #0x7
   e005c:	54000729 	b.ls	e0140 <memcpy+0xf0>  // b.plast
   e0060:	aa010005 	orr	x5, x0, x1
   e0064:	91000424 	add	x4, x1, #0x1
   e0068:	cb040004 	sub	x4, x0, x4
   e006c:	d2800003 	mov	x3, #0x0                   	// #0
   e0070:	f24008bf 	tst	x5, #0x7
   e0074:	fa460880 	ccmp	x4, #0x6, #0x0, eq	// eq = none
   e0078:	54000108 	b.hi	e0098 <memcpy+0x48>  // b.pmore
   e007c:	d503201f 	nop
   e0080:	38636824 	ldrb	w4, [x1, x3]
   e0084:	38236804 	strb	w4, [x0, x3]
   e0088:	91000463 	add	x3, x3, #0x1
   e008c:	eb03005f 	cmp	x2, x3
   e0090:	54ffff81 	b.ne	e0080 <memcpy+0x30>  // b.any
   e0094:	d65f03c0 	ret
   e0098:	927df044 	and	x4, x2, #0xfffffffffffffff8
   e009c:	d503201f 	nop
   e00a0:	f8636825 	ldr	x5, [x1, x3]
   e00a4:	f8236805 	str	x5, [x0, x3]
   e00a8:	91002063 	add	x3, x3, #0x8
   e00ac:	eb03009f 	cmp	x4, x3
   e00b0:	54ffff81 	b.ne	e00a0 <memcpy+0x50>  // b.any
   e00b4:	eb04005f 	cmp	x2, x4
   e00b8:	54fffee0 	b.eq	e0094 <memcpy+0x44>  // b.none
   e00bc:	38646825 	ldrb	w5, [x1, x4]
   e00c0:	91000483 	add	x3, x4, #0x1
   e00c4:	38246805 	strb	w5, [x0, x4]
   e00c8:	eb03005f 	cmp	x2, x3
   e00cc:	54fffe40 	b.eq	e0094 <memcpy+0x44>  // b.none
   e00d0:	38636826 	ldrb	w6, [x1, x3]
   e00d4:	91000885 	add	x5, x4, #0x2
   e00d8:	38236806 	strb	w6, [x0, x3]
   e00dc:	eb05005f 	cmp	x2, x5
   e00e0:	54fffda0 	b.eq	e0094 <memcpy+0x44>  // b.none
   e00e4:	38656826 	ldrb	w6, [x1, x5]
   e00e8:	91000c83 	add	x3, x4, #0x3
   e00ec:	38256806 	strb	w6, [x0, x5]
   e00f0:	eb03005f 	cmp	x2, x3
   e00f4:	54fffd00 	b.eq	e0094 <memcpy+0x44>  // b.none
   e00f8:	38636826 	ldrb	w6, [x1, x3]
   e00fc:	91001085 	add	x5, x4, #0x4
   e0100:	38236806 	strb	w6, [x0, x3]
   e0104:	eb05005f 	cmp	x2, x5
   e0108:	54fffc60 	b.eq	e0094 <memcpy+0x44>  // b.none
   e010c:	38656826 	ldrb	w6, [x1, x5]
   e0110:	91001483 	add	x3, x4, #0x5
   e0114:	38256806 	strb	w6, [x0, x5]
   e0118:	eb03005f 	cmp	x2, x3
   e011c:	54fffbc0 	b.eq	e0094 <memcpy+0x44>  // b.none
   e0120:	38636825 	ldrb	w5, [x1, x3]
   e0124:	91001884 	add	x4, x4, #0x6
   e0128:	38236805 	strb	w5, [x0, x3]
   e012c:	eb04005f 	cmp	x2, x4
   e0130:	54fffb20 	b.eq	e0094 <memcpy+0x44>  // b.none
   e0134:	38646821 	ldrb	w1, [x1, x4]
   e0138:	38246801 	strb	w1, [x0, x4]
   e013c:	d65f03c0 	ret
   e0140:	d2800003 	mov	x3, #0x0                   	// #0
   e0144:	38636824 	ldrb	w4, [x1, x3]
   e0148:	38236804 	strb	w4, [x0, x3]
   e014c:	91000463 	add	x3, x3, #0x1
   e0150:	eb03005f 	cmp	x2, x3
   e0154:	54fff961 	b.ne	e0080 <memcpy+0x30>  // b.any
   e0158:	17ffffcf 	b	e0094 <memcpy+0x44>
   e015c:	d503201f 	nop

00000000000e0160 <memset>:
   e0160:	b4000ce2 	cbz	x2, e02fc <memset+0x19c>
   e0164:	cb0003e7 	neg	x7, x0
   e0168:	d2800168 	mov	x8, #0xb                   	// #11
   e016c:	924008e3 	and	x3, x7, #0x7
   e0170:	d1000446 	sub	x6, x2, #0x1
   e0174:	91001c65 	add	x5, x3, #0x7
   e0178:	12001c24 	and	w4, w1, #0xff
   e017c:	eb0800bf 	cmp	x5, x8
   e0180:	9a8820a5 	csel	x5, x5, x8, cs	// cs = hs, nlast
   e0184:	eb0500df 	cmp	x6, x5
   e0188:	54000c83 	b.cc	e0318 <memset+0x1b8>  // b.lo, b.ul, b.last
   e018c:	b4000c23 	cbz	x3, e0310 <memset+0x1b0>
   e0190:	39000004 	strb	w4, [x0]
   e0194:	f27f04ff 	tst	x7, #0x6
   e0198:	54000b80 	b.eq	e0308 <memset+0x1a8>  // b.none
   e019c:	39000404 	strb	w4, [x0, #1]
   e01a0:	f100087f 	cmp	x3, #0x2
   e01a4:	54000be9 	b.ls	e0320 <memset+0x1c0>  // b.plast
   e01a8:	39000804 	strb	w4, [x0, #2]
   e01ac:	36100aa7 	tbz	w7, #2, e0300 <memset+0x1a0>
   e01b0:	39000c04 	strb	w4, [x0, #3]
   e01b4:	f100107f 	cmp	x3, #0x4
   e01b8:	54000b89 	b.ls	e0328 <memset+0x1c8>  // b.plast
   e01bc:	39001004 	strb	w4, [x0, #4]
   e01c0:	f100147f 	cmp	x3, #0x5
   e01c4:	54000b60 	b.eq	e0330 <memset+0x1d0>  // b.none
   e01c8:	39001404 	strb	w4, [x0, #5]
   e01cc:	f1001c7f 	cmp	x3, #0x7
   e01d0:	54000b41 	b.ne	e0338 <memset+0x1d8>  // b.any
   e01d4:	aa0303e6 	mov	x6, x3
   e01d8:	39001804 	strb	w4, [x0, #6]
   e01dc:	d2800005 	mov	x5, #0x0                   	// #0
   e01e0:	cb030049 	sub	x9, x2, x3
   e01e4:	b3401c85 	bfxil	x5, x4, #0, #8
   e01e8:	8b030001 	add	x1, x0, x3
   e01ec:	927df128 	and	x8, x9, #0xfffffffffffffff8
   e01f0:	b3781c85 	bfi	x5, x4, #8, #8
   e01f4:	8b080027 	add	x7, x1, x8
   e01f8:	b3701c85 	bfi	x5, x4, #16, #8
   e01fc:	b3681c85 	bfi	x5, x4, #24, #8
   e0200:	b3601c85 	bfi	x5, x4, #32, #8
   e0204:	b3581c85 	bfi	x5, x4, #40, #8
   e0208:	b3501c85 	bfi	x5, x4, #48, #8
   e020c:	b3481c85 	bfi	x5, x4, #56, #8
   e0210:	f8008425 	str	x5, [x1], #8
   e0214:	eb0100ff 	cmp	x7, x1
   e0218:	54ffffc1 	b.ne	e0210 <memset+0xb0>  // b.any
   e021c:	8b0800c1 	add	x1, x6, x8
   e0220:	eb08013f 	cmp	x9, x8
   e0224:	540006c0 	b.eq	e02fc <memset+0x19c>  // b.none
   e0228:	91000423 	add	x3, x1, #0x1
   e022c:	38216804 	strb	w4, [x0, x1]
   e0230:	eb03005f 	cmp	x2, x3
   e0234:	54000640 	b.eq	e02fc <memset+0x19c>  // b.none
   e0238:	91000825 	add	x5, x1, #0x2
   e023c:	38236804 	strb	w4, [x0, x3]
   e0240:	eb05005f 	cmp	x2, x5
   e0244:	540005c0 	b.eq	e02fc <memset+0x19c>  // b.none
   e0248:	91000c23 	add	x3, x1, #0x3
   e024c:	38256804 	strb	w4, [x0, x5]
   e0250:	eb03005f 	cmp	x2, x3
   e0254:	54000540 	b.eq	e02fc <memset+0x19c>  // b.none
   e0258:	91001025 	add	x5, x1, #0x4
   e025c:	38236804 	strb	w4, [x0, x3]
   e0260:	eb05005f 	cmp	x2, x5
   e0264:	540004c0 	b.eq	e02fc <memset+0x19c>  // b.none
   e0268:	91001423 	add	x3, x1, #0x5
   e026c:	38256804 	strb	w4, [x0, x5]
   e0270:	eb03005f 	cmp	x2, x3
   e0274:	54000440 	b.eq	e02fc <memset+0x19c>  // b.none
   e0278:	91001825 	add	x5, x1, #0x6
   e027c:	38236804 	strb	w4, [x0, x3]
   e0280:	eb05005f 	cmp	x2, x5
   e0284:	540003c0 	b.eq	e02fc <memset+0x19c>  // b.none
   e0288:	91001c23 	add	x3, x1, #0x7
   e028c:	38256804 	strb	w4, [x0, x5]
   e0290:	eb03005f 	cmp	x2, x3
   e0294:	54000340 	b.eq	e02fc <memset+0x19c>  // b.none
   e0298:	91002025 	add	x5, x1, #0x8
   e029c:	38236804 	strb	w4, [x0, x3]
   e02a0:	eb05005f 	cmp	x2, x5
   e02a4:	540002c0 	b.eq	e02fc <memset+0x19c>  // b.none
   e02a8:	91002423 	add	x3, x1, #0x9
   e02ac:	38256804 	strb	w4, [x0, x5]
   e02b0:	eb03005f 	cmp	x2, x3
   e02b4:	54000240 	b.eq	e02fc <memset+0x19c>  // b.none
   e02b8:	91002825 	add	x5, x1, #0xa
   e02bc:	38236804 	strb	w4, [x0, x3]
   e02c0:	eb05005f 	cmp	x2, x5
   e02c4:	540001c0 	b.eq	e02fc <memset+0x19c>  // b.none
   e02c8:	91002c23 	add	x3, x1, #0xb
   e02cc:	38256804 	strb	w4, [x0, x5]
   e02d0:	eb03005f 	cmp	x2, x3
   e02d4:	54000140 	b.eq	e02fc <memset+0x19c>  // b.none
   e02d8:	91003025 	add	x5, x1, #0xc
   e02dc:	38236804 	strb	w4, [x0, x3]
   e02e0:	eb05005f 	cmp	x2, x5
   e02e4:	540000c0 	b.eq	e02fc <memset+0x19c>  // b.none
   e02e8:	91003421 	add	x1, x1, #0xd
   e02ec:	38256804 	strb	w4, [x0, x5]
   e02f0:	eb01005f 	cmp	x2, x1
   e02f4:	54000040 	b.eq	e02fc <memset+0x19c>  // b.none
   e02f8:	38216804 	strb	w4, [x0, x1]
   e02fc:	d65f03c0 	ret
   e0300:	d2800066 	mov	x6, #0x3                   	// #3
   e0304:	17ffffb6 	b	e01dc <memset+0x7c>
   e0308:	d2800026 	mov	x6, #0x1                   	// #1
   e030c:	17ffffb4 	b	e01dc <memset+0x7c>
   e0310:	d2800006 	mov	x6, #0x0                   	// #0
   e0314:	17ffffb2 	b	e01dc <memset+0x7c>
   e0318:	d2800001 	mov	x1, #0x0                   	// #0
   e031c:	17ffffc3 	b	e0228 <memset+0xc8>
   e0320:	d2800046 	mov	x6, #0x2                   	// #2
   e0324:	17ffffae 	b	e01dc <memset+0x7c>
   e0328:	d2800086 	mov	x6, #0x4                   	// #4
   e032c:	17ffffac 	b	e01dc <memset+0x7c>
   e0330:	aa0303e6 	mov	x6, x3
   e0334:	17ffffaa 	b	e01dc <memset+0x7c>
   e0338:	d28000c6 	mov	x6, #0x6                   	// #6
   e033c:	17ffffa8 	b	e01dc <memset+0x7c>

00000000000e0340 <memmove>:
   e0340:	b40000c2 	cbz	x2, e0358 <memmove+0x18>
   e0344:	d503201f 	nop
   e0348:	d1000442 	sub	x2, x2, #0x1
   e034c:	38626823 	ldrb	w3, [x1, x2]
   e0350:	38226803 	strb	w3, [x0, x2]
   e0354:	b5ffffa2 	cbnz	x2, e0348 <memmove+0x8>
   e0358:	d65f03c0 	ret
