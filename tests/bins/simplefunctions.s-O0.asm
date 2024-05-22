
simplefunctions.s.elf:     file format elf64-littleaarch64


Disassembly of section .text:

00000000000e0000 <_start>:
   e0000:	f81e0ffe 	str	x30, [sp, #-32]!
   e0004:	94000003 	bl	e0010 <test>
   e0008:	f84207fe 	ldr	x30, [sp], #32
   e000c:	d65f03c0 	ret

00000000000e0010 <test>:
   e0010:	d65f03c0 	ret

00000000000e0014 <memcpy>:
   e0014:	d100c3ff 	sub	sp, sp, #0x30
   e0018:	f9000fe0 	str	x0, [sp, #24]
   e001c:	f9000be1 	str	x1, [sp, #16]
   e0020:	f90007e2 	str	x2, [sp, #8]
   e0024:	f90017ff 	str	xzr, [sp, #40]
   e0028:	1400000c 	b	e0058 <memcpy+0x44>
   e002c:	f9400be1 	ldr	x1, [sp, #16]
   e0030:	f94017e0 	ldr	x0, [sp, #40]
   e0034:	8b000021 	add	x1, x1, x0
   e0038:	f9400fe2 	ldr	x2, [sp, #24]
   e003c:	f94017e0 	ldr	x0, [sp, #40]
   e0040:	8b000040 	add	x0, x2, x0
   e0044:	39400021 	ldrb	w1, [x1]
   e0048:	39000001 	strb	w1, [x0]
   e004c:	f94017e0 	ldr	x0, [sp, #40]
   e0050:	91000400 	add	x0, x0, #0x1
   e0054:	f90017e0 	str	x0, [sp, #40]
   e0058:	f94017e1 	ldr	x1, [sp, #40]
   e005c:	f94007e0 	ldr	x0, [sp, #8]
   e0060:	eb00003f 	cmp	x1, x0
   e0064:	54fffe41 	b.ne	e002c <memcpy+0x18>  // b.any
   e0068:	f9400fe0 	ldr	x0, [sp, #24]
   e006c:	9100c3ff 	add	sp, sp, #0x30
   e0070:	d65f03c0 	ret

00000000000e0074 <memset>:
   e0074:	d100c3ff 	sub	sp, sp, #0x30
   e0078:	f9000fe0 	str	x0, [sp, #24]
   e007c:	b90017e1 	str	w1, [sp, #20]
   e0080:	f90007e2 	str	x2, [sp, #8]
   e0084:	f90017ff 	str	xzr, [sp, #40]
   e0088:	1400000a 	b	e00b0 <memset+0x3c>
   e008c:	f9400fe1 	ldr	x1, [sp, #24]
   e0090:	f94017e0 	ldr	x0, [sp, #40]
   e0094:	8b000020 	add	x0, x1, x0
   e0098:	b94017e1 	ldr	w1, [sp, #20]
   e009c:	12001c21 	and	w1, w1, #0xff
   e00a0:	39000001 	strb	w1, [x0]
   e00a4:	f94017e0 	ldr	x0, [sp, #40]
   e00a8:	91000400 	add	x0, x0, #0x1
   e00ac:	f90017e0 	str	x0, [sp, #40]
   e00b0:	f94017e1 	ldr	x1, [sp, #40]
   e00b4:	f94007e0 	ldr	x0, [sp, #8]
   e00b8:	eb00003f 	cmp	x1, x0
   e00bc:	54fffe81 	b.ne	e008c <memset+0x18>  // b.any
   e00c0:	f9400fe0 	ldr	x0, [sp, #24]
   e00c4:	9100c3ff 	add	sp, sp, #0x30
   e00c8:	d65f03c0 	ret

00000000000e00cc <memmove>:
   e00cc:	d100c3ff 	sub	sp, sp, #0x30
   e00d0:	f9000fe0 	str	x0, [sp, #24]
   e00d4:	f9000be1 	str	x1, [sp, #16]
   e00d8:	f90007e2 	str	x2, [sp, #8]
   e00dc:	f94007e0 	ldr	x0, [sp, #8]
   e00e0:	f90017e0 	str	x0, [sp, #40]
   e00e4:	1400000e 	b	e011c <memmove+0x50>
   e00e8:	f94017e0 	ldr	x0, [sp, #40]
   e00ec:	d1000400 	sub	x0, x0, #0x1
   e00f0:	f9400be1 	ldr	x1, [sp, #16]
   e00f4:	8b000021 	add	x1, x1, x0
   e00f8:	f94017e0 	ldr	x0, [sp, #40]
   e00fc:	d1000400 	sub	x0, x0, #0x1
   e0100:	f9400fe2 	ldr	x2, [sp, #24]
   e0104:	8b000040 	add	x0, x2, x0
   e0108:	39400021 	ldrb	w1, [x1]
   e010c:	39000001 	strb	w1, [x0]
   e0110:	f94017e0 	ldr	x0, [sp, #40]
   e0114:	d1000400 	sub	x0, x0, #0x1
   e0118:	f90017e0 	str	x0, [sp, #40]
   e011c:	f94017e0 	ldr	x0, [sp, #40]
   e0120:	f100001f 	cmp	x0, #0x0
   e0124:	54fffe21 	b.ne	e00e8 <memmove+0x1c>  // b.any
   e0128:	f9400fe0 	ldr	x0, [sp, #24]
   e012c:	9100c3ff 	add	sp, sp, #0x30
   e0130:	d65f03c0 	ret
