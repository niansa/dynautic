
empty.c.elf:     file format elf64-littleaarch64


Disassembly of section .start:

00000000000e0000 <_start>:
   e0000:	52824680 	mov	w0, #0x1234                	// #4660
   e0004:	d65f03c0 	ret

Disassembly of section .text:

00000000000e0010 <memcpy>:
   e0010:	b4000222 	cbz	x2, e0054 <memcpy+0x44>
   e0014:	d1000443 	sub	x3, x2, #0x1
   e0018:	f1001c7f 	cmp	x3, #0x7
   e001c:	54000729 	b.ls	e0100 <memcpy+0xf0>  // b.plast
   e0020:	aa010005 	orr	x5, x0, x1
   e0024:	91000424 	add	x4, x1, #0x1
   e0028:	cb040004 	sub	x4, x0, x4
   e002c:	d2800003 	mov	x3, #0x0                   	// #0
   e0030:	f24008bf 	tst	x5, #0x7
   e0034:	fa460880 	ccmp	x4, #0x6, #0x0, eq	// eq = none
   e0038:	54000108 	b.hi	e0058 <memcpy+0x48>  // b.pmore
   e003c:	d503201f 	nop
   e0040:	38636824 	ldrb	w4, [x1, x3]
   e0044:	38236804 	strb	w4, [x0, x3]
   e0048:	91000463 	add	x3, x3, #0x1
   e004c:	eb03005f 	cmp	x2, x3
   e0050:	54ffff81 	b.ne	e0040 <memcpy+0x30>  // b.any
   e0054:	d65f03c0 	ret
   e0058:	927df044 	and	x4, x2, #0xfffffffffffffff8
   e005c:	d503201f 	nop
   e0060:	f8636825 	ldr	x5, [x1, x3]
   e0064:	f8236805 	str	x5, [x0, x3]
   e0068:	91002063 	add	x3, x3, #0x8
   e006c:	eb03009f 	cmp	x4, x3
   e0070:	54ffff81 	b.ne	e0060 <memcpy+0x50>  // b.any
   e0074:	eb04005f 	cmp	x2, x4
   e0078:	54fffee0 	b.eq	e0054 <memcpy+0x44>  // b.none
   e007c:	38646825 	ldrb	w5, [x1, x4]
   e0080:	91000483 	add	x3, x4, #0x1
   e0084:	38246805 	strb	w5, [x0, x4]
   e0088:	eb03005f 	cmp	x2, x3
   e008c:	54fffe40 	b.eq	e0054 <memcpy+0x44>  // b.none
   e0090:	38636826 	ldrb	w6, [x1, x3]
   e0094:	91000885 	add	x5, x4, #0x2
   e0098:	38236806 	strb	w6, [x0, x3]
   e009c:	eb05005f 	cmp	x2, x5
   e00a0:	54fffda0 	b.eq	e0054 <memcpy+0x44>  // b.none
   e00a4:	38656826 	ldrb	w6, [x1, x5]
   e00a8:	91000c83 	add	x3, x4, #0x3
   e00ac:	38256806 	strb	w6, [x0, x5]
   e00b0:	eb03005f 	cmp	x2, x3
   e00b4:	54fffd00 	b.eq	e0054 <memcpy+0x44>  // b.none
   e00b8:	38636826 	ldrb	w6, [x1, x3]
   e00bc:	91001085 	add	x5, x4, #0x4
   e00c0:	38236806 	strb	w6, [x0, x3]
   e00c4:	eb05005f 	cmp	x2, x5
   e00c8:	54fffc60 	b.eq	e0054 <memcpy+0x44>  // b.none
   e00cc:	38656826 	ldrb	w6, [x1, x5]
   e00d0:	91001483 	add	x3, x4, #0x5
   e00d4:	38256806 	strb	w6, [x0, x5]
   e00d8:	eb03005f 	cmp	x2, x3
   e00dc:	54fffbc0 	b.eq	e0054 <memcpy+0x44>  // b.none
   e00e0:	38636825 	ldrb	w5, [x1, x3]
   e00e4:	91001884 	add	x4, x4, #0x6
   e00e8:	38236805 	strb	w5, [x0, x3]
   e00ec:	eb04005f 	cmp	x2, x4
   e00f0:	54fffb20 	b.eq	e0054 <memcpy+0x44>  // b.none
   e00f4:	38646821 	ldrb	w1, [x1, x4]
   e00f8:	38246801 	strb	w1, [x0, x4]
   e00fc:	d65f03c0 	ret
   e0100:	d2800003 	mov	x3, #0x0                   	// #0
   e0104:	38636824 	ldrb	w4, [x1, x3]
   e0108:	38236804 	strb	w4, [x0, x3]
   e010c:	91000463 	add	x3, x3, #0x1
   e0110:	eb03005f 	cmp	x2, x3
   e0114:	54fff961 	b.ne	e0040 <memcpy+0x30>  // b.any
   e0118:	17ffffcf 	b	e0054 <memcpy+0x44>
   e011c:	d503201f 	nop

00000000000e0120 <memset>:
   e0120:	b4000ce2 	cbz	x2, e02bc <memset+0x19c>
   e0124:	cb0003e7 	neg	x7, x0
   e0128:	d2800168 	mov	x8, #0xb                   	// #11
   e012c:	924008e3 	and	x3, x7, #0x7
   e0130:	d1000446 	sub	x6, x2, #0x1
   e0134:	91001c65 	add	x5, x3, #0x7
   e0138:	12001c24 	and	w4, w1, #0xff
   e013c:	eb0800bf 	cmp	x5, x8
   e0140:	9a8820a5 	csel	x5, x5, x8, cs	// cs = hs, nlast
   e0144:	eb0500df 	cmp	x6, x5
   e0148:	54000c83 	b.cc	e02d8 <memset+0x1b8>  // b.lo, b.ul, b.last
   e014c:	b4000c23 	cbz	x3, e02d0 <memset+0x1b0>
   e0150:	39000004 	strb	w4, [x0]
   e0154:	f27f04ff 	tst	x7, #0x6
   e0158:	54000b80 	b.eq	e02c8 <memset+0x1a8>  // b.none
   e015c:	39000404 	strb	w4, [x0, #1]
   e0160:	f100087f 	cmp	x3, #0x2
   e0164:	54000be9 	b.ls	e02e0 <memset+0x1c0>  // b.plast
   e0168:	39000804 	strb	w4, [x0, #2]
   e016c:	36100aa7 	tbz	w7, #2, e02c0 <memset+0x1a0>
   e0170:	39000c04 	strb	w4, [x0, #3]
   e0174:	f100107f 	cmp	x3, #0x4
   e0178:	54000b89 	b.ls	e02e8 <memset+0x1c8>  // b.plast
   e017c:	39001004 	strb	w4, [x0, #4]
   e0180:	f100147f 	cmp	x3, #0x5
   e0184:	54000b60 	b.eq	e02f0 <memset+0x1d0>  // b.none
   e0188:	39001404 	strb	w4, [x0, #5]
   e018c:	f1001c7f 	cmp	x3, #0x7
   e0190:	54000b41 	b.ne	e02f8 <memset+0x1d8>  // b.any
   e0194:	aa0303e6 	mov	x6, x3
   e0198:	39001804 	strb	w4, [x0, #6]
   e019c:	d2800005 	mov	x5, #0x0                   	// #0
   e01a0:	cb030049 	sub	x9, x2, x3
   e01a4:	b3401c85 	bfxil	x5, x4, #0, #8
   e01a8:	8b030001 	add	x1, x0, x3
   e01ac:	927df128 	and	x8, x9, #0xfffffffffffffff8
   e01b0:	b3781c85 	bfi	x5, x4, #8, #8
   e01b4:	8b080027 	add	x7, x1, x8
   e01b8:	b3701c85 	bfi	x5, x4, #16, #8
   e01bc:	b3681c85 	bfi	x5, x4, #24, #8
   e01c0:	b3601c85 	bfi	x5, x4, #32, #8
   e01c4:	b3581c85 	bfi	x5, x4, #40, #8
   e01c8:	b3501c85 	bfi	x5, x4, #48, #8
   e01cc:	b3481c85 	bfi	x5, x4, #56, #8
   e01d0:	f8008425 	str	x5, [x1], #8
   e01d4:	eb0100ff 	cmp	x7, x1
   e01d8:	54ffffc1 	b.ne	e01d0 <memset+0xb0>  // b.any
   e01dc:	8b0800c1 	add	x1, x6, x8
   e01e0:	eb08013f 	cmp	x9, x8
   e01e4:	540006c0 	b.eq	e02bc <memset+0x19c>  // b.none
   e01e8:	91000423 	add	x3, x1, #0x1
   e01ec:	38216804 	strb	w4, [x0, x1]
   e01f0:	eb03005f 	cmp	x2, x3
   e01f4:	54000640 	b.eq	e02bc <memset+0x19c>  // b.none
   e01f8:	91000825 	add	x5, x1, #0x2
   e01fc:	38236804 	strb	w4, [x0, x3]
   e0200:	eb05005f 	cmp	x2, x5
   e0204:	540005c0 	b.eq	e02bc <memset+0x19c>  // b.none
   e0208:	91000c23 	add	x3, x1, #0x3
   e020c:	38256804 	strb	w4, [x0, x5]
   e0210:	eb03005f 	cmp	x2, x3
   e0214:	54000540 	b.eq	e02bc <memset+0x19c>  // b.none
   e0218:	91001025 	add	x5, x1, #0x4
   e021c:	38236804 	strb	w4, [x0, x3]
   e0220:	eb05005f 	cmp	x2, x5
   e0224:	540004c0 	b.eq	e02bc <memset+0x19c>  // b.none
   e0228:	91001423 	add	x3, x1, #0x5
   e022c:	38256804 	strb	w4, [x0, x5]
   e0230:	eb03005f 	cmp	x2, x3
   e0234:	54000440 	b.eq	e02bc <memset+0x19c>  // b.none
   e0238:	91001825 	add	x5, x1, #0x6
   e023c:	38236804 	strb	w4, [x0, x3]
   e0240:	eb05005f 	cmp	x2, x5
   e0244:	540003c0 	b.eq	e02bc <memset+0x19c>  // b.none
   e0248:	91001c23 	add	x3, x1, #0x7
   e024c:	38256804 	strb	w4, [x0, x5]
   e0250:	eb03005f 	cmp	x2, x3
   e0254:	54000340 	b.eq	e02bc <memset+0x19c>  // b.none
   e0258:	91002025 	add	x5, x1, #0x8
   e025c:	38236804 	strb	w4, [x0, x3]
   e0260:	eb05005f 	cmp	x2, x5
   e0264:	540002c0 	b.eq	e02bc <memset+0x19c>  // b.none
   e0268:	91002423 	add	x3, x1, #0x9
   e026c:	38256804 	strb	w4, [x0, x5]
   e0270:	eb03005f 	cmp	x2, x3
   e0274:	54000240 	b.eq	e02bc <memset+0x19c>  // b.none
   e0278:	91002825 	add	x5, x1, #0xa
   e027c:	38236804 	strb	w4, [x0, x3]
   e0280:	eb05005f 	cmp	x2, x5
   e0284:	540001c0 	b.eq	e02bc <memset+0x19c>  // b.none
   e0288:	91002c23 	add	x3, x1, #0xb
   e028c:	38256804 	strb	w4, [x0, x5]
   e0290:	eb03005f 	cmp	x2, x3
   e0294:	54000140 	b.eq	e02bc <memset+0x19c>  // b.none
   e0298:	91003025 	add	x5, x1, #0xc
   e029c:	38236804 	strb	w4, [x0, x3]
   e02a0:	eb05005f 	cmp	x2, x5
   e02a4:	540000c0 	b.eq	e02bc <memset+0x19c>  // b.none
   e02a8:	91003421 	add	x1, x1, #0xd
   e02ac:	38256804 	strb	w4, [x0, x5]
   e02b0:	eb01005f 	cmp	x2, x1
   e02b4:	54000040 	b.eq	e02bc <memset+0x19c>  // b.none
   e02b8:	38216804 	strb	w4, [x0, x1]
   e02bc:	d65f03c0 	ret
   e02c0:	d2800066 	mov	x6, #0x3                   	// #3
   e02c4:	17ffffb6 	b	e019c <memset+0x7c>
   e02c8:	d2800026 	mov	x6, #0x1                   	// #1
   e02cc:	17ffffb4 	b	e019c <memset+0x7c>
   e02d0:	d2800006 	mov	x6, #0x0                   	// #0
   e02d4:	17ffffb2 	b	e019c <memset+0x7c>
   e02d8:	d2800001 	mov	x1, #0x0                   	// #0
   e02dc:	17ffffc3 	b	e01e8 <memset+0xc8>
   e02e0:	d2800046 	mov	x6, #0x2                   	// #2
   e02e4:	17ffffae 	b	e019c <memset+0x7c>
   e02e8:	d2800086 	mov	x6, #0x4                   	// #4
   e02ec:	17ffffac 	b	e019c <memset+0x7c>
   e02f0:	aa0303e6 	mov	x6, x3
   e02f4:	17ffffaa 	b	e019c <memset+0x7c>
   e02f8:	d28000c6 	mov	x6, #0x6                   	// #6
   e02fc:	17ffffa8 	b	e019c <memset+0x7c>

00000000000e0300 <memmove>:
   e0300:	b40000c2 	cbz	x2, e0318 <memmove+0x18>
   e0304:	d503201f 	nop
   e0308:	d1000442 	sub	x2, x2, #0x1
   e030c:	38626823 	ldrb	w3, [x1, x2]
   e0310:	38226803 	strb	w3, [x0, x2]
   e0314:	b5ffffa2 	cbnz	x2, e0308 <memmove+0x8>
   e0318:	d65f03c0 	ret
