
arithmetic_signed.c.elf:     file format elf64-littleaarch64


Disassembly of section .start:

00000000000e0000 <start_>:
   e0000:	d10083ff 	sub	sp, sp, #0x20
   e0004:	f90007e0 	str	x0, [sp, #8]
   e0008:	f90003e1 	str	x1, [sp]
   e000c:	f94007e0 	ldr	x0, [sp, #8]
   e0010:	f9000fe0 	str	x0, [sp, #24]
   e0014:	f94007e0 	ldr	x0, [sp, #8]
   e0018:	cb0003e0 	neg	x0, x0
   e001c:	f90007e0 	str	x0, [sp, #8]
   e0020:	f94007e1 	ldr	x1, [sp, #8]
   e0024:	f94003e0 	ldr	x0, [sp]
   e0028:	8b000020 	add	x0, x1, x0
   e002c:	f90007e0 	str	x0, [sp, #8]
   e0030:	f94003e0 	ldr	x0, [sp]
   e0034:	91001c00 	add	x0, x0, #0x7
   e0038:	f94007e1 	ldr	x1, [sp, #8]
   e003c:	9ac00c20 	sdiv	x0, x1, x0
   e0040:	f90007e0 	str	x0, [sp, #8]
   e0044:	f94007e1 	ldr	x1, [sp, #8]
   e0048:	f94003e0 	ldr	x0, [sp]
   e004c:	9b007c20 	mul	x0, x1, x0
   e0050:	f90007e0 	str	x0, [sp, #8]
   e0054:	f94007e0 	ldr	x0, [sp, #8]
   e0058:	f9400fe1 	ldr	x1, [sp, #24]
   e005c:	9ac10c02 	sdiv	x2, x0, x1
   e0060:	f9400fe1 	ldr	x1, [sp, #24]
   e0064:	9b017c41 	mul	x1, x2, x1
   e0068:	cb010000 	sub	x0, x0, x1
   e006c:	f90007e0 	str	x0, [sp, #8]
   e0070:	f94007e0 	ldr	x0, [sp, #8]
   e0074:	910083ff 	add	sp, sp, #0x20
   e0078:	d65f03c0 	ret

Disassembly of section .text:

00000000000e007c <memcpy>:
   e007c:	d100c3ff 	sub	sp, sp, #0x30
   e0080:	f9000fe0 	str	x0, [sp, #24]
   e0084:	f9000be1 	str	x1, [sp, #16]
   e0088:	f90007e2 	str	x2, [sp, #8]
   e008c:	f90017ff 	str	xzr, [sp, #40]
   e0090:	1400000c 	b	e00c0 <memcpy+0x44>
   e0094:	f9400be1 	ldr	x1, [sp, #16]
   e0098:	f94017e0 	ldr	x0, [sp, #40]
   e009c:	8b000021 	add	x1, x1, x0
   e00a0:	f9400fe2 	ldr	x2, [sp, #24]
   e00a4:	f94017e0 	ldr	x0, [sp, #40]
   e00a8:	8b000040 	add	x0, x2, x0
   e00ac:	39400021 	ldrb	w1, [x1]
   e00b0:	39000001 	strb	w1, [x0]
   e00b4:	f94017e0 	ldr	x0, [sp, #40]
   e00b8:	91000400 	add	x0, x0, #0x1
   e00bc:	f90017e0 	str	x0, [sp, #40]
   e00c0:	f94017e1 	ldr	x1, [sp, #40]
   e00c4:	f94007e0 	ldr	x0, [sp, #8]
   e00c8:	eb00003f 	cmp	x1, x0
   e00cc:	54fffe41 	b.ne	e0094 <memcpy+0x18>  // b.any
   e00d0:	f9400fe0 	ldr	x0, [sp, #24]
   e00d4:	9100c3ff 	add	sp, sp, #0x30
   e00d8:	d65f03c0 	ret

00000000000e00dc <memset>:
   e00dc:	d100c3ff 	sub	sp, sp, #0x30
   e00e0:	f9000fe0 	str	x0, [sp, #24]
   e00e4:	b90017e1 	str	w1, [sp, #20]
   e00e8:	f90007e2 	str	x2, [sp, #8]
   e00ec:	f90017ff 	str	xzr, [sp, #40]
   e00f0:	1400000a 	b	e0118 <memset+0x3c>
   e00f4:	f9400fe1 	ldr	x1, [sp, #24]
   e00f8:	f94017e0 	ldr	x0, [sp, #40]
   e00fc:	8b000020 	add	x0, x1, x0
   e0100:	b94017e1 	ldr	w1, [sp, #20]
   e0104:	12001c21 	and	w1, w1, #0xff
   e0108:	39000001 	strb	w1, [x0]
   e010c:	f94017e0 	ldr	x0, [sp, #40]
   e0110:	91000400 	add	x0, x0, #0x1
   e0114:	f90017e0 	str	x0, [sp, #40]
   e0118:	f94017e1 	ldr	x1, [sp, #40]
   e011c:	f94007e0 	ldr	x0, [sp, #8]
   e0120:	eb00003f 	cmp	x1, x0
   e0124:	54fffe81 	b.ne	e00f4 <memset+0x18>  // b.any
   e0128:	f9400fe0 	ldr	x0, [sp, #24]
   e012c:	9100c3ff 	add	sp, sp, #0x30
   e0130:	d65f03c0 	ret

00000000000e0134 <memmove>:
   e0134:	d100c3ff 	sub	sp, sp, #0x30
   e0138:	f9000fe0 	str	x0, [sp, #24]
   e013c:	f9000be1 	str	x1, [sp, #16]
   e0140:	f90007e2 	str	x2, [sp, #8]
   e0144:	f94007e0 	ldr	x0, [sp, #8]
   e0148:	f90017e0 	str	x0, [sp, #40]
   e014c:	1400000e 	b	e0184 <memmove+0x50>
   e0150:	f94017e0 	ldr	x0, [sp, #40]
   e0154:	d1000400 	sub	x0, x0, #0x1
   e0158:	f9400be1 	ldr	x1, [sp, #16]
   e015c:	8b000021 	add	x1, x1, x0
   e0160:	f94017e0 	ldr	x0, [sp, #40]
   e0164:	d1000400 	sub	x0, x0, #0x1
   e0168:	f9400fe2 	ldr	x2, [sp, #24]
   e016c:	8b000040 	add	x0, x2, x0
   e0170:	39400021 	ldrb	w1, [x1]
   e0174:	39000001 	strb	w1, [x0]
   e0178:	f94017e0 	ldr	x0, [sp, #40]
   e017c:	d1000400 	sub	x0, x0, #0x1
   e0180:	f90017e0 	str	x0, [sp, #40]
   e0184:	f94017e0 	ldr	x0, [sp, #40]
   e0188:	f100001f 	cmp	x0, #0x0
   e018c:	54fffe21 	b.ne	e0150 <memmove+0x1c>  // b.any
   e0190:	f9400fe0 	ldr	x0, [sp, #24]
   e0194:	9100c3ff 	add	sp, sp, #0x30
   e0198:	d65f03c0 	ret
