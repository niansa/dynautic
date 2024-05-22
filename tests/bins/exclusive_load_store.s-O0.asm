
exclusive_load_store.s.elf:     file format elf64-littleaarch64


Disassembly of section .text:

00000000000e0000 <_start>:
   e0000:	c85f7f00 	ldxr	x0, [x24]
   e0004:	c8027f00 	stxr	w2, x0, [x24]
   e0008:	91002318 	add	x24, x24, #0x8
   e000c:	085f7f00 	ldxrb	w0, [x24]
   e0010:	08047f00 	stxrb	w4, w0, [x24]
   e0014:	91002318 	add	x24, x24, #0x8
   e0018:	485f7f00 	ldxrh	w0, [x24]
   e001c:	48067f00 	stxrh	w6, w0, [x24]
   e0020:	91004318 	add	x24, x24, #0x10
   e0024:	c87f0700 	ldxp	x0, x1, [x24]
   e0028:	c8280700 	stxp	w8, x0, x1, [x24]
   e002c:	d65f03c0 	ret

00000000000e0030 <memcpy>:
   e0030:	d100c3ff 	sub	sp, sp, #0x30
   e0034:	f9000fe0 	str	x0, [sp, #24]
   e0038:	f9000be1 	str	x1, [sp, #16]
   e003c:	f90007e2 	str	x2, [sp, #8]
   e0040:	f90017ff 	str	xzr, [sp, #40]
   e0044:	1400000c 	b	e0074 <memcpy+0x44>
   e0048:	f9400be1 	ldr	x1, [sp, #16]
   e004c:	f94017e0 	ldr	x0, [sp, #40]
   e0050:	8b000021 	add	x1, x1, x0
   e0054:	f9400fe2 	ldr	x2, [sp, #24]
   e0058:	f94017e0 	ldr	x0, [sp, #40]
   e005c:	8b000040 	add	x0, x2, x0
   e0060:	39400021 	ldrb	w1, [x1]
   e0064:	39000001 	strb	w1, [x0]
   e0068:	f94017e0 	ldr	x0, [sp, #40]
   e006c:	91000400 	add	x0, x0, #0x1
   e0070:	f90017e0 	str	x0, [sp, #40]
   e0074:	f94017e1 	ldr	x1, [sp, #40]
   e0078:	f94007e0 	ldr	x0, [sp, #8]
   e007c:	eb00003f 	cmp	x1, x0
   e0080:	54fffe41 	b.ne	e0048 <memcpy+0x18>  // b.any
   e0084:	f9400fe0 	ldr	x0, [sp, #24]
   e0088:	9100c3ff 	add	sp, sp, #0x30
   e008c:	d65f03c0 	ret

00000000000e0090 <memset>:
   e0090:	d100c3ff 	sub	sp, sp, #0x30
   e0094:	f9000fe0 	str	x0, [sp, #24]
   e0098:	b90017e1 	str	w1, [sp, #20]
   e009c:	f90007e2 	str	x2, [sp, #8]
   e00a0:	f90017ff 	str	xzr, [sp, #40]
   e00a4:	1400000a 	b	e00cc <memset+0x3c>
   e00a8:	f9400fe1 	ldr	x1, [sp, #24]
   e00ac:	f94017e0 	ldr	x0, [sp, #40]
   e00b0:	8b000020 	add	x0, x1, x0
   e00b4:	b94017e1 	ldr	w1, [sp, #20]
   e00b8:	12001c21 	and	w1, w1, #0xff
   e00bc:	39000001 	strb	w1, [x0]
   e00c0:	f94017e0 	ldr	x0, [sp, #40]
   e00c4:	91000400 	add	x0, x0, #0x1
   e00c8:	f90017e0 	str	x0, [sp, #40]
   e00cc:	f94017e1 	ldr	x1, [sp, #40]
   e00d0:	f94007e0 	ldr	x0, [sp, #8]
   e00d4:	eb00003f 	cmp	x1, x0
   e00d8:	54fffe81 	b.ne	e00a8 <memset+0x18>  // b.any
   e00dc:	f9400fe0 	ldr	x0, [sp, #24]
   e00e0:	9100c3ff 	add	sp, sp, #0x30
   e00e4:	d65f03c0 	ret

00000000000e00e8 <memmove>:
   e00e8:	d100c3ff 	sub	sp, sp, #0x30
   e00ec:	f9000fe0 	str	x0, [sp, #24]
   e00f0:	f9000be1 	str	x1, [sp, #16]
   e00f4:	f90007e2 	str	x2, [sp, #8]
   e00f8:	f94007e0 	ldr	x0, [sp, #8]
   e00fc:	f90017e0 	str	x0, [sp, #40]
   e0100:	1400000e 	b	e0138 <memmove+0x50>
   e0104:	f94017e0 	ldr	x0, [sp, #40]
   e0108:	d1000400 	sub	x0, x0, #0x1
   e010c:	f9400be1 	ldr	x1, [sp, #16]
   e0110:	8b000021 	add	x1, x1, x0
   e0114:	f94017e0 	ldr	x0, [sp, #40]
   e0118:	d1000400 	sub	x0, x0, #0x1
   e011c:	f9400fe2 	ldr	x2, [sp, #24]
   e0120:	8b000040 	add	x0, x2, x0
   e0124:	39400021 	ldrb	w1, [x1]
   e0128:	39000001 	strb	w1, [x0]
   e012c:	f94017e0 	ldr	x0, [sp, #40]
   e0130:	d1000400 	sub	x0, x0, #0x1
   e0134:	f90017e0 	str	x0, [sp, #40]
   e0138:	f94017e0 	ldr	x0, [sp, #40]
   e013c:	f100001f 	cmp	x0, #0x0
   e0140:	54fffe21 	b.ne	e0104 <memmove+0x1c>  // b.any
   e0144:	f9400fe0 	ldr	x0, [sp, #24]
   e0148:	9100c3ff 	add	sp, sp, #0x30
   e014c:	d65f03c0 	ret
