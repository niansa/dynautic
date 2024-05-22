
functions64_sx_from_32.c.elf:     file format elf64-littleaarch64


Disassembly of section .start:

00000000000e0000 <_start>:
   e0000:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   e0004:	910003fd 	mov	x29, sp
   e0008:	910063e0 	add	x0, sp, #0x18
   e000c:	94000007 	bl	e0028 <test>
   e0010:	f9400fe0 	ldr	x0, [sp, #24]
   e0014:	a8c27bfd 	ldp	x29, x30, [sp], #32
   e0018:	d65f03c0 	ret

Disassembly of section .text:

00000000000e001c <test2>:
   e001c:	5297dde0 	mov	w0, #0xbeef                	// #48879
   e0020:	72bbd5a0 	movk	w0, #0xdead, lsl #16
   e0024:	d65f03c0 	ret

00000000000e0028 <test>:
   e0028:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   e002c:	910003fd 	mov	x29, sp
   e0030:	f9000fe0 	str	x0, [sp, #24]
   e0034:	97fffffa 	bl	e001c <test2>
   e0038:	93407c01 	sxtw	x1, w0
   e003c:	f9400fe0 	ldr	x0, [sp, #24]
   e0040:	f9000001 	str	x1, [x0]
   e0044:	d503201f 	nop
   e0048:	a8c27bfd 	ldp	x29, x30, [sp], #32
   e004c:	d65f03c0 	ret

00000000000e0050 <memcpy>:
   e0050:	d100c3ff 	sub	sp, sp, #0x30
   e0054:	f9000fe0 	str	x0, [sp, #24]
   e0058:	f9000be1 	str	x1, [sp, #16]
   e005c:	f90007e2 	str	x2, [sp, #8]
   e0060:	f90017ff 	str	xzr, [sp, #40]
   e0064:	1400000c 	b	e0094 <memcpy+0x44>
   e0068:	f9400be1 	ldr	x1, [sp, #16]
   e006c:	f94017e0 	ldr	x0, [sp, #40]
   e0070:	8b000021 	add	x1, x1, x0
   e0074:	f9400fe2 	ldr	x2, [sp, #24]
   e0078:	f94017e0 	ldr	x0, [sp, #40]
   e007c:	8b000040 	add	x0, x2, x0
   e0080:	39400021 	ldrb	w1, [x1]
   e0084:	39000001 	strb	w1, [x0]
   e0088:	f94017e0 	ldr	x0, [sp, #40]
   e008c:	91000400 	add	x0, x0, #0x1
   e0090:	f90017e0 	str	x0, [sp, #40]
   e0094:	f94017e1 	ldr	x1, [sp, #40]
   e0098:	f94007e0 	ldr	x0, [sp, #8]
   e009c:	eb00003f 	cmp	x1, x0
   e00a0:	54fffe41 	b.ne	e0068 <memcpy+0x18>  // b.any
   e00a4:	f9400fe0 	ldr	x0, [sp, #24]
   e00a8:	9100c3ff 	add	sp, sp, #0x30
   e00ac:	d65f03c0 	ret

00000000000e00b0 <memset>:
   e00b0:	d100c3ff 	sub	sp, sp, #0x30
   e00b4:	f9000fe0 	str	x0, [sp, #24]
   e00b8:	b90017e1 	str	w1, [sp, #20]
   e00bc:	f90007e2 	str	x2, [sp, #8]
   e00c0:	f90017ff 	str	xzr, [sp, #40]
   e00c4:	1400000a 	b	e00ec <memset+0x3c>
   e00c8:	f9400fe1 	ldr	x1, [sp, #24]
   e00cc:	f94017e0 	ldr	x0, [sp, #40]
   e00d0:	8b000020 	add	x0, x1, x0
   e00d4:	b94017e1 	ldr	w1, [sp, #20]
   e00d8:	12001c21 	and	w1, w1, #0xff
   e00dc:	39000001 	strb	w1, [x0]
   e00e0:	f94017e0 	ldr	x0, [sp, #40]
   e00e4:	91000400 	add	x0, x0, #0x1
   e00e8:	f90017e0 	str	x0, [sp, #40]
   e00ec:	f94017e1 	ldr	x1, [sp, #40]
   e00f0:	f94007e0 	ldr	x0, [sp, #8]
   e00f4:	eb00003f 	cmp	x1, x0
   e00f8:	54fffe81 	b.ne	e00c8 <memset+0x18>  // b.any
   e00fc:	f9400fe0 	ldr	x0, [sp, #24]
   e0100:	9100c3ff 	add	sp, sp, #0x30
   e0104:	d65f03c0 	ret

00000000000e0108 <memmove>:
   e0108:	d100c3ff 	sub	sp, sp, #0x30
   e010c:	f9000fe0 	str	x0, [sp, #24]
   e0110:	f9000be1 	str	x1, [sp, #16]
   e0114:	f90007e2 	str	x2, [sp, #8]
   e0118:	f94007e0 	ldr	x0, [sp, #8]
   e011c:	f90017e0 	str	x0, [sp, #40]
   e0120:	1400000e 	b	e0158 <memmove+0x50>
   e0124:	f94017e0 	ldr	x0, [sp, #40]
   e0128:	d1000400 	sub	x0, x0, #0x1
   e012c:	f9400be1 	ldr	x1, [sp, #16]
   e0130:	8b000021 	add	x1, x1, x0
   e0134:	f94017e0 	ldr	x0, [sp, #40]
   e0138:	d1000400 	sub	x0, x0, #0x1
   e013c:	f9400fe2 	ldr	x2, [sp, #24]
   e0140:	8b000040 	add	x0, x2, x0
   e0144:	39400021 	ldrb	w1, [x1]
   e0148:	39000001 	strb	w1, [x0]
   e014c:	f94017e0 	ldr	x0, [sp, #40]
   e0150:	d1000400 	sub	x0, x0, #0x1
   e0154:	f90017e0 	str	x0, [sp, #40]
   e0158:	f94017e0 	ldr	x0, [sp, #40]
   e015c:	f100001f 	cmp	x0, #0x0
   e0160:	54fffe21 	b.ne	e0124 <memmove+0x1c>  // b.any
   e0164:	f9400fe0 	ldr	x0, [sp, #24]
   e0168:	9100c3ff 	add	sp, sp, #0x30
   e016c:	d65f03c0 	ret
