
functions.c.elf:     file format elf64-littleaarch64


Disassembly of section .start:

00000000000e0000 <_start>:
   e0000:	52824680 	mov	w0, #0x1234                	// #4660
   e0004:	72b579a0 	movk	w0, #0xabcd, lsl #16
   e0008:	d65f03c0 	ret

Disassembly of section .text:

00000000000e0010 <test2>:
   e0010:	52824680 	mov	w0, #0x1234                	// #4660
   e0014:	72b579a0 	movk	w0, #0xabcd, lsl #16
   e0018:	d65f03c0 	ret
   e001c:	d503201f 	nop

00000000000e0020 <test>:
   e0020:	52824681 	mov	w1, #0x1234                	// #4660
   e0024:	72b579a1 	movk	w1, #0xabcd, lsl #16
   e0028:	b9000001 	str	w1, [x0]
   e002c:	d65f03c0 	ret

00000000000e0030 <memcpy>:
   e0030:	b4000222 	cbz	x2, e0074 <memcpy+0x44>
   e0034:	d1000443 	sub	x3, x2, #0x1
   e0038:	f1001c7f 	cmp	x3, #0x7
   e003c:	54000729 	b.ls	e0120 <memcpy+0xf0>  // b.plast
   e0040:	aa010005 	orr	x5, x0, x1
   e0044:	91000424 	add	x4, x1, #0x1
   e0048:	cb040004 	sub	x4, x0, x4
   e004c:	d2800003 	mov	x3, #0x0                   	// #0
   e0050:	f24008bf 	tst	x5, #0x7
   e0054:	fa460880 	ccmp	x4, #0x6, #0x0, eq	// eq = none
   e0058:	54000108 	b.hi	e0078 <memcpy+0x48>  // b.pmore
   e005c:	d503201f 	nop
   e0060:	38636824 	ldrb	w4, [x1, x3]
   e0064:	38236804 	strb	w4, [x0, x3]
   e0068:	91000463 	add	x3, x3, #0x1
   e006c:	eb03005f 	cmp	x2, x3
   e0070:	54ffff81 	b.ne	e0060 <memcpy+0x30>  // b.any
   e0074:	d65f03c0 	ret
   e0078:	927df044 	and	x4, x2, #0xfffffffffffffff8
   e007c:	d503201f 	nop
   e0080:	f8636825 	ldr	x5, [x1, x3]
   e0084:	f8236805 	str	x5, [x0, x3]
   e0088:	91002063 	add	x3, x3, #0x8
   e008c:	eb03009f 	cmp	x4, x3
   e0090:	54ffff81 	b.ne	e0080 <memcpy+0x50>  // b.any
   e0094:	eb04005f 	cmp	x2, x4
   e0098:	54fffee0 	b.eq	e0074 <memcpy+0x44>  // b.none
   e009c:	38646825 	ldrb	w5, [x1, x4]
   e00a0:	91000483 	add	x3, x4, #0x1
   e00a4:	38246805 	strb	w5, [x0, x4]
   e00a8:	eb03005f 	cmp	x2, x3
   e00ac:	54fffe40 	b.eq	e0074 <memcpy+0x44>  // b.none
   e00b0:	38636826 	ldrb	w6, [x1, x3]
   e00b4:	91000885 	add	x5, x4, #0x2
   e00b8:	38236806 	strb	w6, [x0, x3]
   e00bc:	eb05005f 	cmp	x2, x5
   e00c0:	54fffda0 	b.eq	e0074 <memcpy+0x44>  // b.none
   e00c4:	38656826 	ldrb	w6, [x1, x5]
   e00c8:	91000c83 	add	x3, x4, #0x3
   e00cc:	38256806 	strb	w6, [x0, x5]
   e00d0:	eb03005f 	cmp	x2, x3
   e00d4:	54fffd00 	b.eq	e0074 <memcpy+0x44>  // b.none
   e00d8:	38636826 	ldrb	w6, [x1, x3]
   e00dc:	91001085 	add	x5, x4, #0x4
   e00e0:	38236806 	strb	w6, [x0, x3]
   e00e4:	eb05005f 	cmp	x2, x5
   e00e8:	54fffc60 	b.eq	e0074 <memcpy+0x44>  // b.none
   e00ec:	38656826 	ldrb	w6, [x1, x5]
   e00f0:	91001483 	add	x3, x4, #0x5
   e00f4:	38256806 	strb	w6, [x0, x5]
   e00f8:	eb03005f 	cmp	x2, x3
   e00fc:	54fffbc0 	b.eq	e0074 <memcpy+0x44>  // b.none
   e0100:	38636825 	ldrb	w5, [x1, x3]
   e0104:	91001884 	add	x4, x4, #0x6
   e0108:	38236805 	strb	w5, [x0, x3]
   e010c:	eb04005f 	cmp	x2, x4
   e0110:	54fffb20 	b.eq	e0074 <memcpy+0x44>  // b.none
   e0114:	38646821 	ldrb	w1, [x1, x4]
   e0118:	38246801 	strb	w1, [x0, x4]
   e011c:	d65f03c0 	ret
   e0120:	d2800003 	mov	x3, #0x0                   	// #0
   e0124:	38636824 	ldrb	w4, [x1, x3]
   e0128:	38236804 	strb	w4, [x0, x3]
   e012c:	91000463 	add	x3, x3, #0x1
   e0130:	eb03005f 	cmp	x2, x3
   e0134:	54fff961 	b.ne	e0060 <memcpy+0x30>  // b.any
   e0138:	17ffffcf 	b	e0074 <memcpy+0x44>
   e013c:	d503201f 	nop

00000000000e0140 <memset>:
   e0140:	b4000ce2 	cbz	x2, e02dc <memset+0x19c>
   e0144:	cb0003e7 	neg	x7, x0
   e0148:	d2800168 	mov	x8, #0xb                   	// #11
   e014c:	924008e3 	and	x3, x7, #0x7
   e0150:	d1000446 	sub	x6, x2, #0x1
   e0154:	91001c65 	add	x5, x3, #0x7
   e0158:	12001c24 	and	w4, w1, #0xff
   e015c:	eb0800bf 	cmp	x5, x8
   e0160:	9a8820a5 	csel	x5, x5, x8, cs	// cs = hs, nlast
   e0164:	eb0500df 	cmp	x6, x5
   e0168:	54000c83 	b.cc	e02f8 <memset+0x1b8>  // b.lo, b.ul, b.last
   e016c:	b4000c23 	cbz	x3, e02f0 <memset+0x1b0>
   e0170:	39000004 	strb	w4, [x0]
   e0174:	f27f04ff 	tst	x7, #0x6
   e0178:	54000b80 	b.eq	e02e8 <memset+0x1a8>  // b.none
   e017c:	39000404 	strb	w4, [x0, #1]
   e0180:	f100087f 	cmp	x3, #0x2
   e0184:	54000be9 	b.ls	e0300 <memset+0x1c0>  // b.plast
   e0188:	39000804 	strb	w4, [x0, #2]
   e018c:	36100aa7 	tbz	w7, #2, e02e0 <memset+0x1a0>
   e0190:	39000c04 	strb	w4, [x0, #3]
   e0194:	f100107f 	cmp	x3, #0x4
   e0198:	54000b89 	b.ls	e0308 <memset+0x1c8>  // b.plast
   e019c:	39001004 	strb	w4, [x0, #4]
   e01a0:	f100147f 	cmp	x3, #0x5
   e01a4:	54000b60 	b.eq	e0310 <memset+0x1d0>  // b.none
   e01a8:	39001404 	strb	w4, [x0, #5]
   e01ac:	f1001c7f 	cmp	x3, #0x7
   e01b0:	54000b41 	b.ne	e0318 <memset+0x1d8>  // b.any
   e01b4:	aa0303e6 	mov	x6, x3
   e01b8:	39001804 	strb	w4, [x0, #6]
   e01bc:	d2800005 	mov	x5, #0x0                   	// #0
   e01c0:	cb030049 	sub	x9, x2, x3
   e01c4:	b3401c85 	bfxil	x5, x4, #0, #8
   e01c8:	8b030001 	add	x1, x0, x3
   e01cc:	927df128 	and	x8, x9, #0xfffffffffffffff8
   e01d0:	b3781c85 	bfi	x5, x4, #8, #8
   e01d4:	8b080027 	add	x7, x1, x8
   e01d8:	b3701c85 	bfi	x5, x4, #16, #8
   e01dc:	b3681c85 	bfi	x5, x4, #24, #8
   e01e0:	b3601c85 	bfi	x5, x4, #32, #8
   e01e4:	b3581c85 	bfi	x5, x4, #40, #8
   e01e8:	b3501c85 	bfi	x5, x4, #48, #8
   e01ec:	b3481c85 	bfi	x5, x4, #56, #8
   e01f0:	f8008425 	str	x5, [x1], #8
   e01f4:	eb0100ff 	cmp	x7, x1
   e01f8:	54ffffc1 	b.ne	e01f0 <memset+0xb0>  // b.any
   e01fc:	8b0800c1 	add	x1, x6, x8
   e0200:	eb08013f 	cmp	x9, x8
   e0204:	540006c0 	b.eq	e02dc <memset+0x19c>  // b.none
   e0208:	91000423 	add	x3, x1, #0x1
   e020c:	38216804 	strb	w4, [x0, x1]
   e0210:	eb03005f 	cmp	x2, x3
   e0214:	54000640 	b.eq	e02dc <memset+0x19c>  // b.none
   e0218:	91000825 	add	x5, x1, #0x2
   e021c:	38236804 	strb	w4, [x0, x3]
   e0220:	eb05005f 	cmp	x2, x5
   e0224:	540005c0 	b.eq	e02dc <memset+0x19c>  // b.none
   e0228:	91000c23 	add	x3, x1, #0x3
   e022c:	38256804 	strb	w4, [x0, x5]
   e0230:	eb03005f 	cmp	x2, x3
   e0234:	54000540 	b.eq	e02dc <memset+0x19c>  // b.none
   e0238:	91001025 	add	x5, x1, #0x4
   e023c:	38236804 	strb	w4, [x0, x3]
   e0240:	eb05005f 	cmp	x2, x5
   e0244:	540004c0 	b.eq	e02dc <memset+0x19c>  // b.none
   e0248:	91001423 	add	x3, x1, #0x5
   e024c:	38256804 	strb	w4, [x0, x5]
   e0250:	eb03005f 	cmp	x2, x3
   e0254:	54000440 	b.eq	e02dc <memset+0x19c>  // b.none
   e0258:	91001825 	add	x5, x1, #0x6
   e025c:	38236804 	strb	w4, [x0, x3]
   e0260:	eb05005f 	cmp	x2, x5
   e0264:	540003c0 	b.eq	e02dc <memset+0x19c>  // b.none
   e0268:	91001c23 	add	x3, x1, #0x7
   e026c:	38256804 	strb	w4, [x0, x5]
   e0270:	eb03005f 	cmp	x2, x3
   e0274:	54000340 	b.eq	e02dc <memset+0x19c>  // b.none
   e0278:	91002025 	add	x5, x1, #0x8
   e027c:	38236804 	strb	w4, [x0, x3]
   e0280:	eb05005f 	cmp	x2, x5
   e0284:	540002c0 	b.eq	e02dc <memset+0x19c>  // b.none
   e0288:	91002423 	add	x3, x1, #0x9
   e028c:	38256804 	strb	w4, [x0, x5]
   e0290:	eb03005f 	cmp	x2, x3
   e0294:	54000240 	b.eq	e02dc <memset+0x19c>  // b.none
   e0298:	91002825 	add	x5, x1, #0xa
   e029c:	38236804 	strb	w4, [x0, x3]
   e02a0:	eb05005f 	cmp	x2, x5
   e02a4:	540001c0 	b.eq	e02dc <memset+0x19c>  // b.none
   e02a8:	91002c23 	add	x3, x1, #0xb
   e02ac:	38256804 	strb	w4, [x0, x5]
   e02b0:	eb03005f 	cmp	x2, x3
   e02b4:	54000140 	b.eq	e02dc <memset+0x19c>  // b.none
   e02b8:	91003025 	add	x5, x1, #0xc
   e02bc:	38236804 	strb	w4, [x0, x3]
   e02c0:	eb05005f 	cmp	x2, x5
   e02c4:	540000c0 	b.eq	e02dc <memset+0x19c>  // b.none
   e02c8:	91003421 	add	x1, x1, #0xd
   e02cc:	38256804 	strb	w4, [x0, x5]
   e02d0:	eb01005f 	cmp	x2, x1
   e02d4:	54000040 	b.eq	e02dc <memset+0x19c>  // b.none
   e02d8:	38216804 	strb	w4, [x0, x1]
   e02dc:	d65f03c0 	ret
   e02e0:	d2800066 	mov	x6, #0x3                   	// #3
   e02e4:	17ffffb6 	b	e01bc <memset+0x7c>
   e02e8:	d2800026 	mov	x6, #0x1                   	// #1
   e02ec:	17ffffb4 	b	e01bc <memset+0x7c>
   e02f0:	d2800006 	mov	x6, #0x0                   	// #0
   e02f4:	17ffffb2 	b	e01bc <memset+0x7c>
   e02f8:	d2800001 	mov	x1, #0x0                   	// #0
   e02fc:	17ffffc3 	b	e0208 <memset+0xc8>
   e0300:	d2800046 	mov	x6, #0x2                   	// #2
   e0304:	17ffffae 	b	e01bc <memset+0x7c>
   e0308:	d2800086 	mov	x6, #0x4                   	// #4
   e030c:	17ffffac 	b	e01bc <memset+0x7c>
   e0310:	aa0303e6 	mov	x6, x3
   e0314:	17ffffaa 	b	e01bc <memset+0x7c>
   e0318:	d28000c6 	mov	x6, #0x6                   	// #6
   e031c:	17ffffa8 	b	e01bc <memset+0x7c>

00000000000e0320 <memmove>:
   e0320:	b40000c2 	cbz	x2, e0338 <memmove+0x18>
   e0324:	d503201f 	nop
   e0328:	d1000442 	sub	x2, x2, #0x1
   e032c:	38626823 	ldrb	w3, [x1, x2]
   e0330:	38226803 	strb	w3, [x0, x2]
   e0334:	b5ffffa2 	cbnz	x2, e0328 <memmove+0x8>
   e0338:	d65f03c0 	ret
