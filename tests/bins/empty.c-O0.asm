
empty.c.elf:     file format elf64-littleaarch64


Disassembly of section .start:

00000000000e0000 <_start>:
   e0000:	52824680 	mov	w0, #0x1234                	// #4660
   e0004:	d65f03c0 	ret

Disassembly of section .text:

00000000000e0008 <memcpy>:
   e0008:	d100c3ff 	sub	sp, sp, #0x30
   e000c:	f9000fe0 	str	x0, [sp, #24]
   e0010:	f9000be1 	str	x1, [sp, #16]
   e0014:	f90007e2 	str	x2, [sp, #8]
   e0018:	f90017ff 	str	xzr, [sp, #40]
   e001c:	1400000c 	b	e004c <memcpy+0x44>
   e0020:	f9400be1 	ldr	x1, [sp, #16]
   e0024:	f94017e0 	ldr	x0, [sp, #40]
   e0028:	8b000021 	add	x1, x1, x0
   e002c:	f9400fe2 	ldr	x2, [sp, #24]
   e0030:	f94017e0 	ldr	x0, [sp, #40]
   e0034:	8b000040 	add	x0, x2, x0
   e0038:	39400021 	ldrb	w1, [x1]
   e003c:	39000001 	strb	w1, [x0]
   e0040:	f94017e0 	ldr	x0, [sp, #40]
   e0044:	91000400 	add	x0, x0, #0x1
   e0048:	f90017e0 	str	x0, [sp, #40]
   e004c:	f94017e1 	ldr	x1, [sp, #40]
   e0050:	f94007e0 	ldr	x0, [sp, #8]
   e0054:	eb00003f 	cmp	x1, x0
   e0058:	54fffe41 	b.ne	e0020 <memcpy+0x18>  // b.any
   e005c:	f9400fe0 	ldr	x0, [sp, #24]
   e0060:	9100c3ff 	add	sp, sp, #0x30
   e0064:	d65f03c0 	ret

00000000000e0068 <memset>:
   e0068:	d100c3ff 	sub	sp, sp, #0x30
   e006c:	f9000fe0 	str	x0, [sp, #24]
   e0070:	b90017e1 	str	w1, [sp, #20]
   e0074:	f90007e2 	str	x2, [sp, #8]
   e0078:	f90017ff 	str	xzr, [sp, #40]
   e007c:	1400000a 	b	e00a4 <memset+0x3c>
   e0080:	f9400fe1 	ldr	x1, [sp, #24]
   e0084:	f94017e0 	ldr	x0, [sp, #40]
   e0088:	8b000020 	add	x0, x1, x0
   e008c:	b94017e1 	ldr	w1, [sp, #20]
   e0090:	12001c21 	and	w1, w1, #0xff
   e0094:	39000001 	strb	w1, [x0]
   e0098:	f94017e0 	ldr	x0, [sp, #40]
   e009c:	91000400 	add	x0, x0, #0x1
   e00a0:	f90017e0 	str	x0, [sp, #40]
   e00a4:	f94017e1 	ldr	x1, [sp, #40]
   e00a8:	f94007e0 	ldr	x0, [sp, #8]
   e00ac:	eb00003f 	cmp	x1, x0
   e00b0:	54fffe81 	b.ne	e0080 <memset+0x18>  // b.any
   e00b4:	f9400fe0 	ldr	x0, [sp, #24]
   e00b8:	9100c3ff 	add	sp, sp, #0x30
   e00bc:	d65f03c0 	ret

00000000000e00c0 <memmove>:
   e00c0:	d100c3ff 	sub	sp, sp, #0x30
   e00c4:	f9000fe0 	str	x0, [sp, #24]
   e00c8:	f9000be1 	str	x1, [sp, #16]
   e00cc:	f90007e2 	str	x2, [sp, #8]
   e00d0:	f94007e0 	ldr	x0, [sp, #8]
   e00d4:	f90017e0 	str	x0, [sp, #40]
   e00d8:	1400000e 	b	e0110 <memmove+0x50>
   e00dc:	f94017e0 	ldr	x0, [sp, #40]
   e00e0:	d1000400 	sub	x0, x0, #0x1
   e00e4:	f9400be1 	ldr	x1, [sp, #16]
   e00e8:	8b000021 	add	x1, x1, x0
   e00ec:	f94017e0 	ldr	x0, [sp, #40]
   e00f0:	d1000400 	sub	x0, x0, #0x1
   e00f4:	f9400fe2 	ldr	x2, [sp, #24]
   e00f8:	8b000040 	add	x0, x2, x0
   e00fc:	39400021 	ldrb	w1, [x1]
   e0100:	39000001 	strb	w1, [x0]
   e0104:	f94017e0 	ldr	x0, [sp, #40]
   e0108:	d1000400 	sub	x0, x0, #0x1
   e010c:	f90017e0 	str	x0, [sp, #40]
   e0110:	f94017e0 	ldr	x0, [sp, #40]
   e0114:	f100001f 	cmp	x0, #0x0
   e0118:	54fffe21 	b.ne	e00dc <memmove+0x1c>  // b.any
   e011c:	f9400fe0 	ldr	x0, [sp, #24]
   e0120:	9100c3ff 	add	sp, sp, #0x30
   e0124:	d65f03c0 	ret
