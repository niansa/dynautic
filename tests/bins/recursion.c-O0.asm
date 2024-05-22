
recursion.c.elf:     file format elf64-littleaarch64


Disassembly of section .start:

00000000000e0000 <_start>:
   e0000:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   e0004:	910003fd 	mov	x29, sp
   e0008:	b9001fe0 	str	w0, [sp, #28]
   e000c:	910073e0 	add	x0, sp, #0x1c
   e0010:	94000004 	bl	e0020 <test>
   e0014:	b9401fe0 	ldr	w0, [sp, #28]
   e0018:	a8c27bfd 	ldp	x29, x30, [sp], #32
   e001c:	d65f03c0 	ret

Disassembly of section .text:

00000000000e0020 <test>:
   e0020:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   e0024:	910003fd 	mov	x29, sp
   e0028:	f9000fe0 	str	x0, [sp, #24]
   e002c:	f9400fe0 	ldr	x0, [sp, #24]
   e0030:	b9400000 	ldr	w0, [x0]
   e0034:	11000402 	add	w2, w0, #0x1
   e0038:	f9400fe1 	ldr	x1, [sp, #24]
   e003c:	b9000022 	str	w2, [x1]
   e0040:	71018c1f 	cmp	w0, #0x63
   e0044:	54000068 	b.hi	e0050 <test+0x30>  // b.pmore
   e0048:	f9400fe0 	ldr	x0, [sp, #24]
   e004c:	97fffff5 	bl	e0020 <test>
   e0050:	d503201f 	nop
   e0054:	a8c27bfd 	ldp	x29, x30, [sp], #32
   e0058:	d65f03c0 	ret

00000000000e005c <memcpy>:
   e005c:	d100c3ff 	sub	sp, sp, #0x30
   e0060:	f9000fe0 	str	x0, [sp, #24]
   e0064:	f9000be1 	str	x1, [sp, #16]
   e0068:	f90007e2 	str	x2, [sp, #8]
   e006c:	f90017ff 	str	xzr, [sp, #40]
   e0070:	1400000c 	b	e00a0 <memcpy+0x44>
   e0074:	f9400be1 	ldr	x1, [sp, #16]
   e0078:	f94017e0 	ldr	x0, [sp, #40]
   e007c:	8b000021 	add	x1, x1, x0
   e0080:	f9400fe2 	ldr	x2, [sp, #24]
   e0084:	f94017e0 	ldr	x0, [sp, #40]
   e0088:	8b000040 	add	x0, x2, x0
   e008c:	39400021 	ldrb	w1, [x1]
   e0090:	39000001 	strb	w1, [x0]
   e0094:	f94017e0 	ldr	x0, [sp, #40]
   e0098:	91000400 	add	x0, x0, #0x1
   e009c:	f90017e0 	str	x0, [sp, #40]
   e00a0:	f94017e1 	ldr	x1, [sp, #40]
   e00a4:	f94007e0 	ldr	x0, [sp, #8]
   e00a8:	eb00003f 	cmp	x1, x0
   e00ac:	54fffe41 	b.ne	e0074 <memcpy+0x18>  // b.any
   e00b0:	f9400fe0 	ldr	x0, [sp, #24]
   e00b4:	9100c3ff 	add	sp, sp, #0x30
   e00b8:	d65f03c0 	ret

00000000000e00bc <memset>:
   e00bc:	d100c3ff 	sub	sp, sp, #0x30
   e00c0:	f9000fe0 	str	x0, [sp, #24]
   e00c4:	b90017e1 	str	w1, [sp, #20]
   e00c8:	f90007e2 	str	x2, [sp, #8]
   e00cc:	f90017ff 	str	xzr, [sp, #40]
   e00d0:	1400000a 	b	e00f8 <memset+0x3c>
   e00d4:	f9400fe1 	ldr	x1, [sp, #24]
   e00d8:	f94017e0 	ldr	x0, [sp, #40]
   e00dc:	8b000020 	add	x0, x1, x0
   e00e0:	b94017e1 	ldr	w1, [sp, #20]
   e00e4:	12001c21 	and	w1, w1, #0xff
   e00e8:	39000001 	strb	w1, [x0]
   e00ec:	f94017e0 	ldr	x0, [sp, #40]
   e00f0:	91000400 	add	x0, x0, #0x1
   e00f4:	f90017e0 	str	x0, [sp, #40]
   e00f8:	f94017e1 	ldr	x1, [sp, #40]
   e00fc:	f94007e0 	ldr	x0, [sp, #8]
   e0100:	eb00003f 	cmp	x1, x0
   e0104:	54fffe81 	b.ne	e00d4 <memset+0x18>  // b.any
   e0108:	f9400fe0 	ldr	x0, [sp, #24]
   e010c:	9100c3ff 	add	sp, sp, #0x30
   e0110:	d65f03c0 	ret

00000000000e0114 <memmove>:
   e0114:	d100c3ff 	sub	sp, sp, #0x30
   e0118:	f9000fe0 	str	x0, [sp, #24]
   e011c:	f9000be1 	str	x1, [sp, #16]
   e0120:	f90007e2 	str	x2, [sp, #8]
   e0124:	f94007e0 	ldr	x0, [sp, #8]
   e0128:	f90017e0 	str	x0, [sp, #40]
   e012c:	1400000e 	b	e0164 <memmove+0x50>
   e0130:	f94017e0 	ldr	x0, [sp, #40]
   e0134:	d1000400 	sub	x0, x0, #0x1
   e0138:	f9400be1 	ldr	x1, [sp, #16]
   e013c:	8b000021 	add	x1, x1, x0
   e0140:	f94017e0 	ldr	x0, [sp, #40]
   e0144:	d1000400 	sub	x0, x0, #0x1
   e0148:	f9400fe2 	ldr	x2, [sp, #24]
   e014c:	8b000040 	add	x0, x2, x0
   e0150:	39400021 	ldrb	w1, [x1]
   e0154:	39000001 	strb	w1, [x0]
   e0158:	f94017e0 	ldr	x0, [sp, #40]
   e015c:	d1000400 	sub	x0, x0, #0x1
   e0160:	f90017e0 	str	x0, [sp, #40]
   e0164:	f94017e0 	ldr	x0, [sp, #40]
   e0168:	f100001f 	cmp	x0, #0x0
   e016c:	54fffe21 	b.ne	e0130 <memmove+0x1c>  // b.any
   e0170:	f9400fe0 	ldr	x0, [sp, #24]
   e0174:	9100c3ff 	add	sp, sp, #0x30
   e0178:	d65f03c0 	ret
