
arithmetic_const.c.elf:     file format elf64-littleaarch64


Disassembly of section .start:

00000000000e0000 <start_>:
   e0000:	d10043ff 	sub	sp, sp, #0x10
   e0004:	f90007e0 	str	x0, [sp, #8]
   e0008:	f94007e0 	ldr	x0, [sp, #8]
   e000c:	91003000 	add	x0, x0, #0xc
   e0010:	f90007e0 	str	x0, [sp, #8]
   e0014:	f94007e1 	ldr	x1, [sp, #8]
   e0018:	d2849260 	mov	x0, #0x2493                	// #9363
   e001c:	f2b24920 	movk	x0, #0x9249, lsl #16
   e0020:	f2c92480 	movk	x0, #0x4924, lsl #32
   e0024:	f2e49240 	movk	x0, #0x2492, lsl #48
   e0028:	9bc07c20 	umulh	x0, x1, x0
   e002c:	cb000021 	sub	x1, x1, x0
   e0030:	d341fc21 	lsr	x1, x1, #1
   e0034:	8b010000 	add	x0, x0, x1
   e0038:	d342fc00 	lsr	x0, x0, #2
   e003c:	f90007e0 	str	x0, [sp, #8]
   e0040:	f94007e1 	ldr	x1, [sp, #8]
   e0044:	aa0103e0 	mov	x0, x1
   e0048:	d37ff800 	lsl	x0, x0, #1
   e004c:	8b010000 	add	x0, x0, x1
   e0050:	f90007e0 	str	x0, [sp, #8]
   e0054:	f94007e1 	ldr	x1, [sp, #8]
   e0058:	b204cfe0 	mov	x0, #0xf0f0f0f0f0f0f0f0    	// #-1085102592571150096
   e005c:	f29e1e20 	movk	x0, #0xf0f1
   e0060:	9bc07c20 	umulh	x0, x1, x0
   e0064:	d344fc02 	lsr	x2, x0, #4
   e0068:	aa0203e0 	mov	x0, x2
   e006c:	d37cec00 	lsl	x0, x0, #4
   e0070:	8b020000 	add	x0, x0, x2
   e0074:	cb000020 	sub	x0, x1, x0
   e0078:	f90007e0 	str	x0, [sp, #8]
   e007c:	f94007e0 	ldr	x0, [sp, #8]
   e0080:	910043ff 	add	sp, sp, #0x10
   e0084:	d65f03c0 	ret

Disassembly of section .text:

00000000000e0088 <memcpy>:
   e0088:	d100c3ff 	sub	sp, sp, #0x30
   e008c:	f9000fe0 	str	x0, [sp, #24]
   e0090:	f9000be1 	str	x1, [sp, #16]
   e0094:	f90007e2 	str	x2, [sp, #8]
   e0098:	f90017ff 	str	xzr, [sp, #40]
   e009c:	1400000c 	b	e00cc <memcpy+0x44>
   e00a0:	f9400be1 	ldr	x1, [sp, #16]
   e00a4:	f94017e0 	ldr	x0, [sp, #40]
   e00a8:	8b000021 	add	x1, x1, x0
   e00ac:	f9400fe2 	ldr	x2, [sp, #24]
   e00b0:	f94017e0 	ldr	x0, [sp, #40]
   e00b4:	8b000040 	add	x0, x2, x0
   e00b8:	39400021 	ldrb	w1, [x1]
   e00bc:	39000001 	strb	w1, [x0]
   e00c0:	f94017e0 	ldr	x0, [sp, #40]
   e00c4:	91000400 	add	x0, x0, #0x1
   e00c8:	f90017e0 	str	x0, [sp, #40]
   e00cc:	f94017e1 	ldr	x1, [sp, #40]
   e00d0:	f94007e0 	ldr	x0, [sp, #8]
   e00d4:	eb00003f 	cmp	x1, x0
   e00d8:	54fffe41 	b.ne	e00a0 <memcpy+0x18>  // b.any
   e00dc:	f9400fe0 	ldr	x0, [sp, #24]
   e00e0:	9100c3ff 	add	sp, sp, #0x30
   e00e4:	d65f03c0 	ret

00000000000e00e8 <memset>:
   e00e8:	d100c3ff 	sub	sp, sp, #0x30
   e00ec:	f9000fe0 	str	x0, [sp, #24]
   e00f0:	b90017e1 	str	w1, [sp, #20]
   e00f4:	f90007e2 	str	x2, [sp, #8]
   e00f8:	f90017ff 	str	xzr, [sp, #40]
   e00fc:	1400000a 	b	e0124 <memset+0x3c>
   e0100:	f9400fe1 	ldr	x1, [sp, #24]
   e0104:	f94017e0 	ldr	x0, [sp, #40]
   e0108:	8b000020 	add	x0, x1, x0
   e010c:	b94017e1 	ldr	w1, [sp, #20]
   e0110:	12001c21 	and	w1, w1, #0xff
   e0114:	39000001 	strb	w1, [x0]
   e0118:	f94017e0 	ldr	x0, [sp, #40]
   e011c:	91000400 	add	x0, x0, #0x1
   e0120:	f90017e0 	str	x0, [sp, #40]
   e0124:	f94017e1 	ldr	x1, [sp, #40]
   e0128:	f94007e0 	ldr	x0, [sp, #8]
   e012c:	eb00003f 	cmp	x1, x0
   e0130:	54fffe81 	b.ne	e0100 <memset+0x18>  // b.any
   e0134:	f9400fe0 	ldr	x0, [sp, #24]
   e0138:	9100c3ff 	add	sp, sp, #0x30
   e013c:	d65f03c0 	ret

00000000000e0140 <memmove>:
   e0140:	d100c3ff 	sub	sp, sp, #0x30
   e0144:	f9000fe0 	str	x0, [sp, #24]
   e0148:	f9000be1 	str	x1, [sp, #16]
   e014c:	f90007e2 	str	x2, [sp, #8]
   e0150:	f94007e0 	ldr	x0, [sp, #8]
   e0154:	f90017e0 	str	x0, [sp, #40]
   e0158:	1400000e 	b	e0190 <memmove+0x50>
   e015c:	f94017e0 	ldr	x0, [sp, #40]
   e0160:	d1000400 	sub	x0, x0, #0x1
   e0164:	f9400be1 	ldr	x1, [sp, #16]
   e0168:	8b000021 	add	x1, x1, x0
   e016c:	f94017e0 	ldr	x0, [sp, #40]
   e0170:	d1000400 	sub	x0, x0, #0x1
   e0174:	f9400fe2 	ldr	x2, [sp, #24]
   e0178:	8b000040 	add	x0, x2, x0
   e017c:	39400021 	ldrb	w1, [x1]
   e0180:	39000001 	strb	w1, [x0]
   e0184:	f94017e0 	ldr	x0, [sp, #40]
   e0188:	d1000400 	sub	x0, x0, #0x1
   e018c:	f90017e0 	str	x0, [sp, #40]
   e0190:	f94017e0 	ldr	x0, [sp, #40]
   e0194:	f100001f 	cmp	x0, #0x0
   e0198:	54fffe21 	b.ne	e015c <memmove+0x1c>  // b.any
   e019c:	f9400fe0 	ldr	x0, [sp, #24]
   e01a0:	9100c3ff 	add	sp, sp, #0x30
   e01a4:	d65f03c0 	ret
