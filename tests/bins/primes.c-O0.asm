
primes.c.elf:     file format elf64-littleaarch64


Disassembly of section .start:

00000000000e0000 <_start>:
   e0000:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   e0004:	910003fd 	mov	x29, sp
   e0008:	f9000fff 	str	xzr, [sp, #24]
   e000c:	d2800040 	mov	x0, #0x2                   	// #2
   e0010:	f9000be0 	str	x0, [sp, #16]
   e0014:	1400000a 	b	e003c <_start+0x3c>
   e0018:	f9400be0 	ldr	x0, [sp, #16]
   e001c:	94000010 	bl	e005c <is_prime_cpu>
   e0020:	aa0003e1 	mov	x1, x0
   e0024:	f9400fe0 	ldr	x0, [sp, #24]
   e0028:	8b010000 	add	x0, x0, x1
   e002c:	f9000fe0 	str	x0, [sp, #24]
   e0030:	f9400be0 	ldr	x0, [sp, #16]
   e0034:	91000400 	add	x0, x0, #0x1
   e0038:	f9000be0 	str	x0, [sp, #16]
   e003c:	f9400be1 	ldr	x1, [sp, #16]
   e0040:	d2884800 	mov	x0, #0x4240                	// #16960
   e0044:	f2a001e0 	movk	x0, #0xf, lsl #16
   e0048:	eb00003f 	cmp	x1, x0
   e004c:	54fffe61 	b.ne	e0018 <_start+0x18>  // b.any
   e0050:	f9400fe0 	ldr	x0, [sp, #24]
   e0054:	a8c27bfd 	ldp	x29, x30, [sp], #32
   e0058:	d65f03c0 	ret

Disassembly of section .text:

00000000000e005c <is_prime_cpu>:
   e005c:	d10083ff 	sub	sp, sp, #0x20
   e0060:	f90007e0 	str	x0, [sp, #8]
   e0064:	f94007e0 	ldr	x0, [sp, #8]
   e0068:	92400000 	and	x0, x0, #0x1
   e006c:	f100001f 	cmp	x0, #0x0
   e0070:	540000c1 	b.ne	e0088 <is_prime_cpu+0x2c>  // b.any
   e0074:	f94007e0 	ldr	x0, [sp, #8]
   e0078:	f100081f 	cmp	x0, #0x2
   e007c:	54000069 	b.ls	e0088 <is_prime_cpu+0x2c>  // b.plast
   e0080:	d2800000 	mov	x0, #0x0                   	// #0
   e0084:	14000016 	b	e00dc <is_prime_cpu+0x80>
   e0088:	52800060 	mov	w0, #0x3                   	// #3
   e008c:	b9001fe0 	str	w0, [sp, #28]
   e0090:	1400000d 	b	e00c4 <is_prime_cpu+0x68>
   e0094:	b9801fe1 	ldrsw	x1, [sp, #28]
   e0098:	f94007e0 	ldr	x0, [sp, #8]
   e009c:	9ac10802 	udiv	x2, x0, x1
   e00a0:	9b017c41 	mul	x1, x2, x1
   e00a4:	cb010000 	sub	x0, x0, x1
   e00a8:	f100001f 	cmp	x0, #0x0
   e00ac:	54000061 	b.ne	e00b8 <is_prime_cpu+0x5c>  // b.any
   e00b0:	d2800000 	mov	x0, #0x0                   	// #0
   e00b4:	1400000a 	b	e00dc <is_prime_cpu+0x80>
   e00b8:	b9401fe0 	ldr	w0, [sp, #28]
   e00bc:	11000800 	add	w0, w0, #0x2
   e00c0:	b9001fe0 	str	w0, [sp, #28]
   e00c4:	b9801fe1 	ldrsw	x1, [sp, #28]
   e00c8:	f94007e0 	ldr	x0, [sp, #8]
   e00cc:	d341fc00 	lsr	x0, x0, #1
   e00d0:	eb00003f 	cmp	x1, x0
   e00d4:	54fffe03 	b.cc	e0094 <is_prime_cpu+0x38>  // b.lo, b.ul, b.last
   e00d8:	d2800020 	mov	x0, #0x1                   	// #1
   e00dc:	910083ff 	add	sp, sp, #0x20
   e00e0:	d65f03c0 	ret

00000000000e00e4 <memcpy>:
   e00e4:	d100c3ff 	sub	sp, sp, #0x30
   e00e8:	f9000fe0 	str	x0, [sp, #24]
   e00ec:	f9000be1 	str	x1, [sp, #16]
   e00f0:	f90007e2 	str	x2, [sp, #8]
   e00f4:	f90017ff 	str	xzr, [sp, #40]
   e00f8:	1400000c 	b	e0128 <memcpy+0x44>
   e00fc:	f9400be1 	ldr	x1, [sp, #16]
   e0100:	f94017e0 	ldr	x0, [sp, #40]
   e0104:	8b000021 	add	x1, x1, x0
   e0108:	f9400fe2 	ldr	x2, [sp, #24]
   e010c:	f94017e0 	ldr	x0, [sp, #40]
   e0110:	8b000040 	add	x0, x2, x0
   e0114:	39400021 	ldrb	w1, [x1]
   e0118:	39000001 	strb	w1, [x0]
   e011c:	f94017e0 	ldr	x0, [sp, #40]
   e0120:	91000400 	add	x0, x0, #0x1
   e0124:	f90017e0 	str	x0, [sp, #40]
   e0128:	f94017e1 	ldr	x1, [sp, #40]
   e012c:	f94007e0 	ldr	x0, [sp, #8]
   e0130:	eb00003f 	cmp	x1, x0
   e0134:	54fffe41 	b.ne	e00fc <memcpy+0x18>  // b.any
   e0138:	f9400fe0 	ldr	x0, [sp, #24]
   e013c:	9100c3ff 	add	sp, sp, #0x30
   e0140:	d65f03c0 	ret

00000000000e0144 <memset>:
   e0144:	d100c3ff 	sub	sp, sp, #0x30
   e0148:	f9000fe0 	str	x0, [sp, #24]
   e014c:	b90017e1 	str	w1, [sp, #20]
   e0150:	f90007e2 	str	x2, [sp, #8]
   e0154:	f90017ff 	str	xzr, [sp, #40]
   e0158:	1400000a 	b	e0180 <memset+0x3c>
   e015c:	f9400fe1 	ldr	x1, [sp, #24]
   e0160:	f94017e0 	ldr	x0, [sp, #40]
   e0164:	8b000020 	add	x0, x1, x0
   e0168:	b94017e1 	ldr	w1, [sp, #20]
   e016c:	12001c21 	and	w1, w1, #0xff
   e0170:	39000001 	strb	w1, [x0]
   e0174:	f94017e0 	ldr	x0, [sp, #40]
   e0178:	91000400 	add	x0, x0, #0x1
   e017c:	f90017e0 	str	x0, [sp, #40]
   e0180:	f94017e1 	ldr	x1, [sp, #40]
   e0184:	f94007e0 	ldr	x0, [sp, #8]
   e0188:	eb00003f 	cmp	x1, x0
   e018c:	54fffe81 	b.ne	e015c <memset+0x18>  // b.any
   e0190:	f9400fe0 	ldr	x0, [sp, #24]
   e0194:	9100c3ff 	add	sp, sp, #0x30
   e0198:	d65f03c0 	ret

00000000000e019c <memmove>:
   e019c:	d100c3ff 	sub	sp, sp, #0x30
   e01a0:	f9000fe0 	str	x0, [sp, #24]
   e01a4:	f9000be1 	str	x1, [sp, #16]
   e01a8:	f90007e2 	str	x2, [sp, #8]
   e01ac:	f94007e0 	ldr	x0, [sp, #8]
   e01b0:	f90017e0 	str	x0, [sp, #40]
   e01b4:	1400000e 	b	e01ec <memmove+0x50>
   e01b8:	f94017e0 	ldr	x0, [sp, #40]
   e01bc:	d1000400 	sub	x0, x0, #0x1
   e01c0:	f9400be1 	ldr	x1, [sp, #16]
   e01c4:	8b000021 	add	x1, x1, x0
   e01c8:	f94017e0 	ldr	x0, [sp, #40]
   e01cc:	d1000400 	sub	x0, x0, #0x1
   e01d0:	f9400fe2 	ldr	x2, [sp, #24]
   e01d4:	8b000040 	add	x0, x2, x0
   e01d8:	39400021 	ldrb	w1, [x1]
   e01dc:	39000001 	strb	w1, [x0]
   e01e0:	f94017e0 	ldr	x0, [sp, #40]
   e01e4:	d1000400 	sub	x0, x0, #0x1
   e01e8:	f90017e0 	str	x0, [sp, #40]
   e01ec:	f94017e0 	ldr	x0, [sp, #40]
   e01f0:	f100001f 	cmp	x0, #0x0
   e01f4:	54fffe21 	b.ne	e01b8 <memmove+0x1c>  // b.any
   e01f8:	f9400fe0 	ldr	x0, [sp, #24]
   e01fc:	9100c3ff 	add	sp, sp, #0x30
   e0200:	d65f03c0 	ret
