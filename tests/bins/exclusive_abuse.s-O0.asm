
exclusive_abuse.s.elf:     file format elf64-littleaarch64


Disassembly of section .text:

00000000000e0000 <_start>:
   e0000:	c85f7f00 	ldxr	x0, [x24]
   e0004:	f9000701 	str	x1, [x24, #8]
   e0008:	c8027f00 	stxr	w2, x0, [x24]
   e000c:	d65f03c0 	ret

00000000000e0010 <memcpy>:
   e0010:	d100c3ff 	sub	sp, sp, #0x30
   e0014:	f9000fe0 	str	x0, [sp, #24]
   e0018:	f9000be1 	str	x1, [sp, #16]
   e001c:	f90007e2 	str	x2, [sp, #8]
   e0020:	f90017ff 	str	xzr, [sp, #40]
   e0024:	1400000c 	b	e0054 <memcpy+0x44>
   e0028:	f9400be1 	ldr	x1, [sp, #16]
   e002c:	f94017e0 	ldr	x0, [sp, #40]
   e0030:	8b000021 	add	x1, x1, x0
   e0034:	f9400fe2 	ldr	x2, [sp, #24]
   e0038:	f94017e0 	ldr	x0, [sp, #40]
   e003c:	8b000040 	add	x0, x2, x0
   e0040:	39400021 	ldrb	w1, [x1]
   e0044:	39000001 	strb	w1, [x0]
   e0048:	f94017e0 	ldr	x0, [sp, #40]
   e004c:	91000400 	add	x0, x0, #0x1
   e0050:	f90017e0 	str	x0, [sp, #40]
   e0054:	f94017e1 	ldr	x1, [sp, #40]
   e0058:	f94007e0 	ldr	x0, [sp, #8]
   e005c:	eb00003f 	cmp	x1, x0
   e0060:	54fffe41 	b.ne	e0028 <memcpy+0x18>  // b.any
   e0064:	f9400fe0 	ldr	x0, [sp, #24]
   e0068:	9100c3ff 	add	sp, sp, #0x30
   e006c:	d65f03c0 	ret

00000000000e0070 <memset>:
   e0070:	d100c3ff 	sub	sp, sp, #0x30
   e0074:	f9000fe0 	str	x0, [sp, #24]
   e0078:	b90017e1 	str	w1, [sp, #20]
   e007c:	f90007e2 	str	x2, [sp, #8]
   e0080:	f90017ff 	str	xzr, [sp, #40]
   e0084:	1400000a 	b	e00ac <memset+0x3c>
   e0088:	f9400fe1 	ldr	x1, [sp, #24]
   e008c:	f94017e0 	ldr	x0, [sp, #40]
   e0090:	8b000020 	add	x0, x1, x0
   e0094:	b94017e1 	ldr	w1, [sp, #20]
   e0098:	12001c21 	and	w1, w1, #0xff
   e009c:	39000001 	strb	w1, [x0]
   e00a0:	f94017e0 	ldr	x0, [sp, #40]
   e00a4:	91000400 	add	x0, x0, #0x1
   e00a8:	f90017e0 	str	x0, [sp, #40]
   e00ac:	f94017e1 	ldr	x1, [sp, #40]
   e00b0:	f94007e0 	ldr	x0, [sp, #8]
   e00b4:	eb00003f 	cmp	x1, x0
   e00b8:	54fffe81 	b.ne	e0088 <memset+0x18>  // b.any
   e00bc:	f9400fe0 	ldr	x0, [sp, #24]
   e00c0:	9100c3ff 	add	sp, sp, #0x30
   e00c4:	d65f03c0 	ret

00000000000e00c8 <memmove>:
   e00c8:	d100c3ff 	sub	sp, sp, #0x30
   e00cc:	f9000fe0 	str	x0, [sp, #24]
   e00d0:	f9000be1 	str	x1, [sp, #16]
   e00d4:	f90007e2 	str	x2, [sp, #8]
   e00d8:	f94007e0 	ldr	x0, [sp, #8]
   e00dc:	f90017e0 	str	x0, [sp, #40]
   e00e0:	1400000e 	b	e0118 <memmove+0x50>
   e00e4:	f94017e0 	ldr	x0, [sp, #40]
   e00e8:	d1000400 	sub	x0, x0, #0x1
   e00ec:	f9400be1 	ldr	x1, [sp, #16]
   e00f0:	8b000021 	add	x1, x1, x0
   e00f4:	f94017e0 	ldr	x0, [sp, #40]
   e00f8:	d1000400 	sub	x0, x0, #0x1
   e00fc:	f9400fe2 	ldr	x2, [sp, #24]
   e0100:	8b000040 	add	x0, x2, x0
   e0104:	39400021 	ldrb	w1, [x1]
   e0108:	39000001 	strb	w1, [x0]
   e010c:	f94017e0 	ldr	x0, [sp, #40]
   e0110:	d1000400 	sub	x0, x0, #0x1
   e0114:	f90017e0 	str	x0, [sp, #40]
   e0118:	f94017e0 	ldr	x0, [sp, #40]
   e011c:	f100001f 	cmp	x0, #0x0
   e0120:	54fffe21 	b.ne	e00e4 <memmove+0x1c>  // b.any
   e0124:	f9400fe0 	ldr	x0, [sp, #24]
   e0128:	9100c3ff 	add	sp, sp, #0x30
   e012c:	d65f03c0 	ret
