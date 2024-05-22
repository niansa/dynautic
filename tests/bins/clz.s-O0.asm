
clz.s.elf:     file format elf64-littleaarch64


Disassembly of section .text:

00000000000e0000 <loop-0xc>:
   e0000:	2a0003e1 	mov	w1, w0
   e0004:	52800000 	mov	w0, #0x0                   	// #0
   e0008:	37f80081 	tbnz	w1, #31, e0018 <done>

00000000000e000c <loop>:
   e000c:	531f7821 	lsl	w1, w1, #1
   e0010:	11000400 	add	w0, w0, #0x1
   e0014:	36ffffc1 	tbz	w1, #31, e000c <loop>

00000000000e0018 <done>:
   e0018:	d65f03c0 	ret

00000000000e001c <memcpy>:
   e001c:	d100c3ff 	sub	sp, sp, #0x30
   e0020:	f9000fe0 	str	x0, [sp, #24]
   e0024:	f9000be1 	str	x1, [sp, #16]
   e0028:	f90007e2 	str	x2, [sp, #8]
   e002c:	f90017ff 	str	xzr, [sp, #40]
   e0030:	1400000c 	b	e0060 <memcpy+0x44>
   e0034:	f9400be1 	ldr	x1, [sp, #16]
   e0038:	f94017e0 	ldr	x0, [sp, #40]
   e003c:	8b000021 	add	x1, x1, x0
   e0040:	f9400fe2 	ldr	x2, [sp, #24]
   e0044:	f94017e0 	ldr	x0, [sp, #40]
   e0048:	8b000040 	add	x0, x2, x0
   e004c:	39400021 	ldrb	w1, [x1]
   e0050:	39000001 	strb	w1, [x0]
   e0054:	f94017e0 	ldr	x0, [sp, #40]
   e0058:	91000400 	add	x0, x0, #0x1
   e005c:	f90017e0 	str	x0, [sp, #40]
   e0060:	f94017e1 	ldr	x1, [sp, #40]
   e0064:	f94007e0 	ldr	x0, [sp, #8]
   e0068:	eb00003f 	cmp	x1, x0
   e006c:	54fffe41 	b.ne	e0034 <memcpy+0x18>  // b.any
   e0070:	f9400fe0 	ldr	x0, [sp, #24]
   e0074:	9100c3ff 	add	sp, sp, #0x30
   e0078:	d65f03c0 	ret

00000000000e007c <memset>:
   e007c:	d100c3ff 	sub	sp, sp, #0x30
   e0080:	f9000fe0 	str	x0, [sp, #24]
   e0084:	b90017e1 	str	w1, [sp, #20]
   e0088:	f90007e2 	str	x2, [sp, #8]
   e008c:	f90017ff 	str	xzr, [sp, #40]
   e0090:	1400000a 	b	e00b8 <memset+0x3c>
   e0094:	f9400fe1 	ldr	x1, [sp, #24]
   e0098:	f94017e0 	ldr	x0, [sp, #40]
   e009c:	8b000020 	add	x0, x1, x0
   e00a0:	b94017e1 	ldr	w1, [sp, #20]
   e00a4:	12001c21 	and	w1, w1, #0xff
   e00a8:	39000001 	strb	w1, [x0]
   e00ac:	f94017e0 	ldr	x0, [sp, #40]
   e00b0:	91000400 	add	x0, x0, #0x1
   e00b4:	f90017e0 	str	x0, [sp, #40]
   e00b8:	f94017e1 	ldr	x1, [sp, #40]
   e00bc:	f94007e0 	ldr	x0, [sp, #8]
   e00c0:	eb00003f 	cmp	x1, x0
   e00c4:	54fffe81 	b.ne	e0094 <memset+0x18>  // b.any
   e00c8:	f9400fe0 	ldr	x0, [sp, #24]
   e00cc:	9100c3ff 	add	sp, sp, #0x30
   e00d0:	d65f03c0 	ret

00000000000e00d4 <memmove>:
   e00d4:	d100c3ff 	sub	sp, sp, #0x30
   e00d8:	f9000fe0 	str	x0, [sp, #24]
   e00dc:	f9000be1 	str	x1, [sp, #16]
   e00e0:	f90007e2 	str	x2, [sp, #8]
   e00e4:	f94007e0 	ldr	x0, [sp, #8]
   e00e8:	f90017e0 	str	x0, [sp, #40]
   e00ec:	1400000e 	b	e0124 <memmove+0x50>
   e00f0:	f94017e0 	ldr	x0, [sp, #40]
   e00f4:	d1000400 	sub	x0, x0, #0x1
   e00f8:	f9400be1 	ldr	x1, [sp, #16]
   e00fc:	8b000021 	add	x1, x1, x0
   e0100:	f94017e0 	ldr	x0, [sp, #40]
   e0104:	d1000400 	sub	x0, x0, #0x1
   e0108:	f9400fe2 	ldr	x2, [sp, #24]
   e010c:	8b000040 	add	x0, x2, x0
   e0110:	39400021 	ldrb	w1, [x1]
   e0114:	39000001 	strb	w1, [x0]
   e0118:	f94017e0 	ldr	x0, [sp, #40]
   e011c:	d1000400 	sub	x0, x0, #0x1
   e0120:	f90017e0 	str	x0, [sp, #40]
   e0124:	f94017e0 	ldr	x0, [sp, #40]
   e0128:	f100001f 	cmp	x0, #0x0
   e012c:	54fffe21 	b.ne	e00f0 <memmove+0x1c>  // b.any
   e0130:	f9400fe0 	ldr	x0, [sp, #24]
   e0134:	9100c3ff 	add	sp, sp, #0x30
   e0138:	d65f03c0 	ret
