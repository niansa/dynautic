
arithmetic.c.elf:     file format elf64-littleaarch64


Disassembly of section .start:

00000000000e0000 <start_>:
   e0000:	d10083ff 	sub	sp, sp, #0x20
   e0004:	f90007e0 	str	x0, [sp, #8]
   e0008:	f90003e1 	str	x1, [sp]
   e000c:	f94007e0 	ldr	x0, [sp, #8]
   e0010:	f9000fe0 	str	x0, [sp, #24]
   e0014:	f94007e1 	ldr	x1, [sp, #8]
   e0018:	f94003e0 	ldr	x0, [sp]
   e001c:	8b000020 	add	x0, x1, x0
   e0020:	f90007e0 	str	x0, [sp, #8]
   e0024:	f94003e0 	ldr	x0, [sp]
   e0028:	91001c00 	add	x0, x0, #0x7
   e002c:	f94007e1 	ldr	x1, [sp, #8]
   e0030:	9ac00820 	udiv	x0, x1, x0
   e0034:	f90007e0 	str	x0, [sp, #8]
   e0038:	f94007e1 	ldr	x1, [sp, #8]
   e003c:	f94003e0 	ldr	x0, [sp]
   e0040:	9b007c20 	mul	x0, x1, x0
   e0044:	f90007e0 	str	x0, [sp, #8]
   e0048:	f94007e0 	ldr	x0, [sp, #8]
   e004c:	f9400fe1 	ldr	x1, [sp, #24]
   e0050:	9ac10802 	udiv	x2, x0, x1
   e0054:	f9400fe1 	ldr	x1, [sp, #24]
   e0058:	9b017c41 	mul	x1, x2, x1
   e005c:	cb010000 	sub	x0, x0, x1
   e0060:	f90007e0 	str	x0, [sp, #8]
   e0064:	f94007e0 	ldr	x0, [sp, #8]
   e0068:	910083ff 	add	sp, sp, #0x20
   e006c:	d65f03c0 	ret

Disassembly of section .text:

00000000000e0070 <memcpy>:
   e0070:	d100c3ff 	sub	sp, sp, #0x30
   e0074:	f9000fe0 	str	x0, [sp, #24]
   e0078:	f9000be1 	str	x1, [sp, #16]
   e007c:	f90007e2 	str	x2, [sp, #8]
   e0080:	f90017ff 	str	xzr, [sp, #40]
   e0084:	1400000c 	b	e00b4 <memcpy+0x44>
   e0088:	f9400be1 	ldr	x1, [sp, #16]
   e008c:	f94017e0 	ldr	x0, [sp, #40]
   e0090:	8b000021 	add	x1, x1, x0
   e0094:	f9400fe2 	ldr	x2, [sp, #24]
   e0098:	f94017e0 	ldr	x0, [sp, #40]
   e009c:	8b000040 	add	x0, x2, x0
   e00a0:	39400021 	ldrb	w1, [x1]
   e00a4:	39000001 	strb	w1, [x0]
   e00a8:	f94017e0 	ldr	x0, [sp, #40]
   e00ac:	91000400 	add	x0, x0, #0x1
   e00b0:	f90017e0 	str	x0, [sp, #40]
   e00b4:	f94017e1 	ldr	x1, [sp, #40]
   e00b8:	f94007e0 	ldr	x0, [sp, #8]
   e00bc:	eb00003f 	cmp	x1, x0
   e00c0:	54fffe41 	b.ne	e0088 <memcpy+0x18>  // b.any
   e00c4:	f9400fe0 	ldr	x0, [sp, #24]
   e00c8:	9100c3ff 	add	sp, sp, #0x30
   e00cc:	d65f03c0 	ret

00000000000e00d0 <memset>:
   e00d0:	d100c3ff 	sub	sp, sp, #0x30
   e00d4:	f9000fe0 	str	x0, [sp, #24]
   e00d8:	b90017e1 	str	w1, [sp, #20]
   e00dc:	f90007e2 	str	x2, [sp, #8]
   e00e0:	f90017ff 	str	xzr, [sp, #40]
   e00e4:	1400000a 	b	e010c <memset+0x3c>
   e00e8:	f9400fe1 	ldr	x1, [sp, #24]
   e00ec:	f94017e0 	ldr	x0, [sp, #40]
   e00f0:	8b000020 	add	x0, x1, x0
   e00f4:	b94017e1 	ldr	w1, [sp, #20]
   e00f8:	12001c21 	and	w1, w1, #0xff
   e00fc:	39000001 	strb	w1, [x0]
   e0100:	f94017e0 	ldr	x0, [sp, #40]
   e0104:	91000400 	add	x0, x0, #0x1
   e0108:	f90017e0 	str	x0, [sp, #40]
   e010c:	f94017e1 	ldr	x1, [sp, #40]
   e0110:	f94007e0 	ldr	x0, [sp, #8]
   e0114:	eb00003f 	cmp	x1, x0
   e0118:	54fffe81 	b.ne	e00e8 <memset+0x18>  // b.any
   e011c:	f9400fe0 	ldr	x0, [sp, #24]
   e0120:	9100c3ff 	add	sp, sp, #0x30
   e0124:	d65f03c0 	ret

00000000000e0128 <memmove>:
   e0128:	d100c3ff 	sub	sp, sp, #0x30
   e012c:	f9000fe0 	str	x0, [sp, #24]
   e0130:	f9000be1 	str	x1, [sp, #16]
   e0134:	f90007e2 	str	x2, [sp, #8]
   e0138:	f94007e0 	ldr	x0, [sp, #8]
   e013c:	f90017e0 	str	x0, [sp, #40]
   e0140:	1400000e 	b	e0178 <memmove+0x50>
   e0144:	f94017e0 	ldr	x0, [sp, #40]
   e0148:	d1000400 	sub	x0, x0, #0x1
   e014c:	f9400be1 	ldr	x1, [sp, #16]
   e0150:	8b000021 	add	x1, x1, x0
   e0154:	f94017e0 	ldr	x0, [sp, #40]
   e0158:	d1000400 	sub	x0, x0, #0x1
   e015c:	f9400fe2 	ldr	x2, [sp, #24]
   e0160:	8b000040 	add	x0, x2, x0
   e0164:	39400021 	ldrb	w1, [x1]
   e0168:	39000001 	strb	w1, [x0]
   e016c:	f94017e0 	ldr	x0, [sp, #40]
   e0170:	d1000400 	sub	x0, x0, #0x1
   e0174:	f90017e0 	str	x0, [sp, #40]
   e0178:	f94017e0 	ldr	x0, [sp, #40]
   e017c:	f100001f 	cmp	x0, #0x0
   e0180:	54fffe21 	b.ne	e0144 <memmove+0x1c>  // b.any
   e0184:	f9400fe0 	ldr	x0, [sp, #24]
   e0188:	9100c3ff 	add	sp, sp, #0x30
   e018c:	d65f03c0 	ret
