
simplefunctions.s.elf:     file format elf64-littleaarch64


Disassembly of section .text:

00000000000e0000 <_start>:
   e0000:	f81e0ffe 	str	x30, [sp, #-32]!
   e0004:	94000003 	bl	e0010 <test>
   e0008:	f84207fe 	ldr	x30, [sp], #32
   e000c:	d65f03c0 	ret

00000000000e0010 <test>:
   e0010:	d65f03c0 	ret
	...

00000000000e0020 <memcpy>:
   e0020:	b4000222 	cbz	x2, e0064 <memcpy+0x44>
   e0024:	d1000443 	sub	x3, x2, #0x1
   e0028:	f1001c7f 	cmp	x3, #0x7
   e002c:	54000729 	b.ls	e0110 <memcpy+0xf0>  // b.plast
   e0030:	aa010005 	orr	x5, x0, x1
   e0034:	91000424 	add	x4, x1, #0x1
   e0038:	cb040004 	sub	x4, x0, x4
   e003c:	d2800003 	mov	x3, #0x0                   	// #0
   e0040:	f24008bf 	tst	x5, #0x7
   e0044:	fa460880 	ccmp	x4, #0x6, #0x0, eq	// eq = none
   e0048:	54000108 	b.hi	e0068 <memcpy+0x48>  // b.pmore
   e004c:	d503201f 	nop
   e0050:	38636824 	ldrb	w4, [x1, x3]
   e0054:	38236804 	strb	w4, [x0, x3]
   e0058:	91000463 	add	x3, x3, #0x1
   e005c:	eb03005f 	cmp	x2, x3
   e0060:	54ffff81 	b.ne	e0050 <memcpy+0x30>  // b.any
   e0064:	d65f03c0 	ret
   e0068:	927df044 	and	x4, x2, #0xfffffffffffffff8
   e006c:	d503201f 	nop
   e0070:	f8636825 	ldr	x5, [x1, x3]
   e0074:	f8236805 	str	x5, [x0, x3]
   e0078:	91002063 	add	x3, x3, #0x8
   e007c:	eb03009f 	cmp	x4, x3
   e0080:	54ffff81 	b.ne	e0070 <memcpy+0x50>  // b.any
   e0084:	eb04005f 	cmp	x2, x4
   e0088:	54fffee0 	b.eq	e0064 <memcpy+0x44>  // b.none
   e008c:	38646825 	ldrb	w5, [x1, x4]
   e0090:	91000483 	add	x3, x4, #0x1
   e0094:	38246805 	strb	w5, [x0, x4]
   e0098:	eb03005f 	cmp	x2, x3
   e009c:	54fffe40 	b.eq	e0064 <memcpy+0x44>  // b.none
   e00a0:	38636826 	ldrb	w6, [x1, x3]
   e00a4:	91000885 	add	x5, x4, #0x2
   e00a8:	38236806 	strb	w6, [x0, x3]
   e00ac:	eb05005f 	cmp	x2, x5
   e00b0:	54fffda0 	b.eq	e0064 <memcpy+0x44>  // b.none
   e00b4:	38656826 	ldrb	w6, [x1, x5]
   e00b8:	91000c83 	add	x3, x4, #0x3
   e00bc:	38256806 	strb	w6, [x0, x5]
   e00c0:	eb03005f 	cmp	x2, x3
   e00c4:	54fffd00 	b.eq	e0064 <memcpy+0x44>  // b.none
   e00c8:	38636826 	ldrb	w6, [x1, x3]
   e00cc:	91001085 	add	x5, x4, #0x4
   e00d0:	38236806 	strb	w6, [x0, x3]
   e00d4:	eb05005f 	cmp	x2, x5
   e00d8:	54fffc60 	b.eq	e0064 <memcpy+0x44>  // b.none
   e00dc:	38656826 	ldrb	w6, [x1, x5]
   e00e0:	91001483 	add	x3, x4, #0x5
   e00e4:	38256806 	strb	w6, [x0, x5]
   e00e8:	eb03005f 	cmp	x2, x3
   e00ec:	54fffbc0 	b.eq	e0064 <memcpy+0x44>  // b.none
   e00f0:	38636825 	ldrb	w5, [x1, x3]
   e00f4:	91001884 	add	x4, x4, #0x6
   e00f8:	38236805 	strb	w5, [x0, x3]
   e00fc:	eb04005f 	cmp	x2, x4
   e0100:	54fffb20 	b.eq	e0064 <memcpy+0x44>  // b.none
   e0104:	38646821 	ldrb	w1, [x1, x4]
   e0108:	38246801 	strb	w1, [x0, x4]
   e010c:	d65f03c0 	ret
   e0110:	d2800003 	mov	x3, #0x0                   	// #0
   e0114:	38636824 	ldrb	w4, [x1, x3]
   e0118:	38236804 	strb	w4, [x0, x3]
   e011c:	91000463 	add	x3, x3, #0x1
   e0120:	eb03005f 	cmp	x2, x3
   e0124:	54fff961 	b.ne	e0050 <memcpy+0x30>  // b.any
   e0128:	17ffffcf 	b	e0064 <memcpy+0x44>
   e012c:	d503201f 	nop

00000000000e0130 <memset>:
   e0130:	b4000ce2 	cbz	x2, e02cc <memset+0x19c>
   e0134:	cb0003e7 	neg	x7, x0
   e0138:	d2800168 	mov	x8, #0xb                   	// #11
   e013c:	924008e3 	and	x3, x7, #0x7
   e0140:	d1000446 	sub	x6, x2, #0x1
   e0144:	91001c65 	add	x5, x3, #0x7
   e0148:	12001c24 	and	w4, w1, #0xff
   e014c:	eb0800bf 	cmp	x5, x8
   e0150:	9a8820a5 	csel	x5, x5, x8, cs	// cs = hs, nlast
   e0154:	eb0500df 	cmp	x6, x5
   e0158:	54000c83 	b.cc	e02e8 <memset+0x1b8>  // b.lo, b.ul, b.last
   e015c:	b4000c23 	cbz	x3, e02e0 <memset+0x1b0>
   e0160:	39000004 	strb	w4, [x0]
   e0164:	f27f04ff 	tst	x7, #0x6
   e0168:	54000b80 	b.eq	e02d8 <memset+0x1a8>  // b.none
   e016c:	39000404 	strb	w4, [x0, #1]
   e0170:	f100087f 	cmp	x3, #0x2
   e0174:	54000be9 	b.ls	e02f0 <memset+0x1c0>  // b.plast
   e0178:	39000804 	strb	w4, [x0, #2]
   e017c:	36100aa7 	tbz	w7, #2, e02d0 <memset+0x1a0>
   e0180:	39000c04 	strb	w4, [x0, #3]
   e0184:	f100107f 	cmp	x3, #0x4
   e0188:	54000b89 	b.ls	e02f8 <memset+0x1c8>  // b.plast
   e018c:	39001004 	strb	w4, [x0, #4]
   e0190:	f100147f 	cmp	x3, #0x5
   e0194:	54000b60 	b.eq	e0300 <memset+0x1d0>  // b.none
   e0198:	39001404 	strb	w4, [x0, #5]
   e019c:	f1001c7f 	cmp	x3, #0x7
   e01a0:	54000b41 	b.ne	e0308 <memset+0x1d8>  // b.any
   e01a4:	aa0303e6 	mov	x6, x3
   e01a8:	39001804 	strb	w4, [x0, #6]
   e01ac:	d2800005 	mov	x5, #0x0                   	// #0
   e01b0:	cb030049 	sub	x9, x2, x3
   e01b4:	b3401c85 	bfxil	x5, x4, #0, #8
   e01b8:	8b030001 	add	x1, x0, x3
   e01bc:	927df128 	and	x8, x9, #0xfffffffffffffff8
   e01c0:	b3781c85 	bfi	x5, x4, #8, #8
   e01c4:	8b080027 	add	x7, x1, x8
   e01c8:	b3701c85 	bfi	x5, x4, #16, #8
   e01cc:	b3681c85 	bfi	x5, x4, #24, #8
   e01d0:	b3601c85 	bfi	x5, x4, #32, #8
   e01d4:	b3581c85 	bfi	x5, x4, #40, #8
   e01d8:	b3501c85 	bfi	x5, x4, #48, #8
   e01dc:	b3481c85 	bfi	x5, x4, #56, #8
   e01e0:	f8008425 	str	x5, [x1], #8
   e01e4:	eb0100ff 	cmp	x7, x1
   e01e8:	54ffffc1 	b.ne	e01e0 <memset+0xb0>  // b.any
   e01ec:	8b0800c1 	add	x1, x6, x8
   e01f0:	eb08013f 	cmp	x9, x8
   e01f4:	540006c0 	b.eq	e02cc <memset+0x19c>  // b.none
   e01f8:	91000423 	add	x3, x1, #0x1
   e01fc:	38216804 	strb	w4, [x0, x1]
   e0200:	eb03005f 	cmp	x2, x3
   e0204:	54000640 	b.eq	e02cc <memset+0x19c>  // b.none
   e0208:	91000825 	add	x5, x1, #0x2
   e020c:	38236804 	strb	w4, [x0, x3]
   e0210:	eb05005f 	cmp	x2, x5
   e0214:	540005c0 	b.eq	e02cc <memset+0x19c>  // b.none
   e0218:	91000c23 	add	x3, x1, #0x3
   e021c:	38256804 	strb	w4, [x0, x5]
   e0220:	eb03005f 	cmp	x2, x3
   e0224:	54000540 	b.eq	e02cc <memset+0x19c>  // b.none
   e0228:	91001025 	add	x5, x1, #0x4
   e022c:	38236804 	strb	w4, [x0, x3]
   e0230:	eb05005f 	cmp	x2, x5
   e0234:	540004c0 	b.eq	e02cc <memset+0x19c>  // b.none
   e0238:	91001423 	add	x3, x1, #0x5
   e023c:	38256804 	strb	w4, [x0, x5]
   e0240:	eb03005f 	cmp	x2, x3
   e0244:	54000440 	b.eq	e02cc <memset+0x19c>  // b.none
   e0248:	91001825 	add	x5, x1, #0x6
   e024c:	38236804 	strb	w4, [x0, x3]
   e0250:	eb05005f 	cmp	x2, x5
   e0254:	540003c0 	b.eq	e02cc <memset+0x19c>  // b.none
   e0258:	91001c23 	add	x3, x1, #0x7
   e025c:	38256804 	strb	w4, [x0, x5]
   e0260:	eb03005f 	cmp	x2, x3
   e0264:	54000340 	b.eq	e02cc <memset+0x19c>  // b.none
   e0268:	91002025 	add	x5, x1, #0x8
   e026c:	38236804 	strb	w4, [x0, x3]
   e0270:	eb05005f 	cmp	x2, x5
   e0274:	540002c0 	b.eq	e02cc <memset+0x19c>  // b.none
   e0278:	91002423 	add	x3, x1, #0x9
   e027c:	38256804 	strb	w4, [x0, x5]
   e0280:	eb03005f 	cmp	x2, x3
   e0284:	54000240 	b.eq	e02cc <memset+0x19c>  // b.none
   e0288:	91002825 	add	x5, x1, #0xa
   e028c:	38236804 	strb	w4, [x0, x3]
   e0290:	eb05005f 	cmp	x2, x5
   e0294:	540001c0 	b.eq	e02cc <memset+0x19c>  // b.none
   e0298:	91002c23 	add	x3, x1, #0xb
   e029c:	38256804 	strb	w4, [x0, x5]
   e02a0:	eb03005f 	cmp	x2, x3
   e02a4:	54000140 	b.eq	e02cc <memset+0x19c>  // b.none
   e02a8:	91003025 	add	x5, x1, #0xc
   e02ac:	38236804 	strb	w4, [x0, x3]
   e02b0:	eb05005f 	cmp	x2, x5
   e02b4:	540000c0 	b.eq	e02cc <memset+0x19c>  // b.none
   e02b8:	91003421 	add	x1, x1, #0xd
   e02bc:	38256804 	strb	w4, [x0, x5]
   e02c0:	eb01005f 	cmp	x2, x1
   e02c4:	54000040 	b.eq	e02cc <memset+0x19c>  // b.none
   e02c8:	38216804 	strb	w4, [x0, x1]
   e02cc:	d65f03c0 	ret
   e02d0:	d2800066 	mov	x6, #0x3                   	// #3
   e02d4:	17ffffb6 	b	e01ac <memset+0x7c>
   e02d8:	d2800026 	mov	x6, #0x1                   	// #1
   e02dc:	17ffffb4 	b	e01ac <memset+0x7c>
   e02e0:	d2800006 	mov	x6, #0x0                   	// #0
   e02e4:	17ffffb2 	b	e01ac <memset+0x7c>
   e02e8:	d2800001 	mov	x1, #0x0                   	// #0
   e02ec:	17ffffc3 	b	e01f8 <memset+0xc8>
   e02f0:	d2800046 	mov	x6, #0x2                   	// #2
   e02f4:	17ffffae 	b	e01ac <memset+0x7c>
   e02f8:	d2800086 	mov	x6, #0x4                   	// #4
   e02fc:	17ffffac 	b	e01ac <memset+0x7c>
   e0300:	aa0303e6 	mov	x6, x3
   e0304:	17ffffaa 	b	e01ac <memset+0x7c>
   e0308:	d28000c6 	mov	x6, #0x6                   	// #6
   e030c:	17ffffa8 	b	e01ac <memset+0x7c>

00000000000e0310 <memmove>:
   e0310:	b40000c2 	cbz	x2, e0328 <memmove+0x18>
   e0314:	d503201f 	nop
   e0318:	d1000442 	sub	x2, x2, #0x1
   e031c:	38626823 	ldrb	w3, [x1, x2]
   e0320:	38226803 	strb	w3, [x0, x2]
   e0324:	b5ffffa2 	cbnz	x2, e0318 <memmove+0x8>
   e0328:	d65f03c0 	ret
