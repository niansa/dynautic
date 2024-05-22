
functions64.c.elf:     file format elf64-littleaarch64


Disassembly of section .start:

00000000000e0000 <_start>:
   e0000:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   e0004:	910003fd 	mov	x29, sp
   e0008:	910063e0 	add	x0, sp, #0x18
   e000c:	94000009 	bl	e0030 <test>
   e0010:	f9400fe0 	ldr	x0, [sp, #24]
   e0014:	a8c27bfd 	ldp	x29, x30, [sp], #32
   e0018:	d65f03c0 	ret

Disassembly of section .text:

00000000000e001c <test2>:
   e001c:	d297dde0 	mov	x0, #0xbeef                	// #48879
   e0020:	f2bbd5a0 	movk	x0, #0xdead, lsl #16
   e0024:	f2c24680 	movk	x0, #0x1234, lsl #32
   e0028:	f2f579a0 	movk	x0, #0xabcd, lsl #48
   e002c:	d65f03c0 	ret

00000000000e0030 <test>:
   e0030:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   e0034:	910003fd 	mov	x29, sp
   e0038:	f9000fe0 	str	x0, [sp, #24]
   e003c:	97fffff8 	bl	e001c <test2>
   e0040:	aa0003e1 	mov	x1, x0
   e0044:	f9400fe0 	ldr	x0, [sp, #24]
   e0048:	f9000001 	str	x1, [x0]
   e004c:	d503201f 	nop
   e0050:	a8c27bfd 	ldp	x29, x30, [sp], #32
   e0054:	d65f03c0 	ret

00000000000e0058 <memcpy>:
   e0058:	d100c3ff 	sub	sp, sp, #0x30
   e005c:	f9000fe0 	str	x0, [sp, #24]
   e0060:	f9000be1 	str	x1, [sp, #16]
   e0064:	f90007e2 	str	x2, [sp, #8]
   e0068:	f90017ff 	str	xzr, [sp, #40]
   e006c:	1400000c 	b	e009c <memcpy+0x44>
   e0070:	f9400be1 	ldr	x1, [sp, #16]
   e0074:	f94017e0 	ldr	x0, [sp, #40]
   e0078:	8b000021 	add	x1, x1, x0
   e007c:	f9400fe2 	ldr	x2, [sp, #24]
   e0080:	f94017e0 	ldr	x0, [sp, #40]
   e0084:	8b000040 	add	x0, x2, x0
   e0088:	39400021 	ldrb	w1, [x1]
   e008c:	39000001 	strb	w1, [x0]
   e0090:	f94017e0 	ldr	x0, [sp, #40]
   e0094:	91000400 	add	x0, x0, #0x1
   e0098:	f90017e0 	str	x0, [sp, #40]
   e009c:	f94017e1 	ldr	x1, [sp, #40]
   e00a0:	f94007e0 	ldr	x0, [sp, #8]
   e00a4:	eb00003f 	cmp	x1, x0
   e00a8:	54fffe41 	b.ne	e0070 <memcpy+0x18>  // b.any
   e00ac:	f9400fe0 	ldr	x0, [sp, #24]
   e00b0:	9100c3ff 	add	sp, sp, #0x30
   e00b4:	d65f03c0 	ret

00000000000e00b8 <memset>:
   e00b8:	d100c3ff 	sub	sp, sp, #0x30
   e00bc:	f9000fe0 	str	x0, [sp, #24]
   e00c0:	b90017e1 	str	w1, [sp, #20]
   e00c4:	f90007e2 	str	x2, [sp, #8]
   e00c8:	f90017ff 	str	xzr, [sp, #40]
   e00cc:	1400000a 	b	e00f4 <memset+0x3c>
   e00d0:	f9400fe1 	ldr	x1, [sp, #24]
   e00d4:	f94017e0 	ldr	x0, [sp, #40]
   e00d8:	8b000020 	add	x0, x1, x0
   e00dc:	b94017e1 	ldr	w1, [sp, #20]
   e00e0:	12001c21 	and	w1, w1, #0xff
   e00e4:	39000001 	strb	w1, [x0]
   e00e8:	f94017e0 	ldr	x0, [sp, #40]
   e00ec:	91000400 	add	x0, x0, #0x1
   e00f0:	f90017e0 	str	x0, [sp, #40]
   e00f4:	f94017e1 	ldr	x1, [sp, #40]
   e00f8:	f94007e0 	ldr	x0, [sp, #8]
   e00fc:	eb00003f 	cmp	x1, x0
   e0100:	54fffe81 	b.ne	e00d0 <memset+0x18>  // b.any
   e0104:	f9400fe0 	ldr	x0, [sp, #24]
   e0108:	9100c3ff 	add	sp, sp, #0x30
   e010c:	d65f03c0 	ret

00000000000e0110 <memmove>:
   e0110:	d100c3ff 	sub	sp, sp, #0x30
   e0114:	f9000fe0 	str	x0, [sp, #24]
   e0118:	f9000be1 	str	x1, [sp, #16]
   e011c:	f90007e2 	str	x2, [sp, #8]
   e0120:	f94007e0 	ldr	x0, [sp, #8]
   e0124:	f90017e0 	str	x0, [sp, #40]
   e0128:	1400000e 	b	e0160 <memmove+0x50>
   e012c:	f94017e0 	ldr	x0, [sp, #40]
   e0130:	d1000400 	sub	x0, x0, #0x1
   e0134:	f9400be1 	ldr	x1, [sp, #16]
   e0138:	8b000021 	add	x1, x1, x0
   e013c:	f94017e0 	ldr	x0, [sp, #40]
   e0140:	d1000400 	sub	x0, x0, #0x1
   e0144:	f9400fe2 	ldr	x2, [sp, #24]
   e0148:	8b000040 	add	x0, x2, x0
   e014c:	39400021 	ldrb	w1, [x1]
   e0150:	39000001 	strb	w1, [x0]
   e0154:	f94017e0 	ldr	x0, [sp, #40]
   e0158:	d1000400 	sub	x0, x0, #0x1
   e015c:	f90017e0 	str	x0, [sp, #40]
   e0160:	f94017e0 	ldr	x0, [sp, #40]
   e0164:	f100001f 	cmp	x0, #0x0
   e0168:	54fffe21 	b.ne	e012c <memmove+0x1c>  // b.any
   e016c:	f9400fe0 	ldr	x0, [sp, #24]
   e0170:	9100c3ff 	add	sp, sp, #0x30
   e0174:	d65f03c0 	ret
