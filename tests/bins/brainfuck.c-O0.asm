
brainfuck.c.elf:     file format elf64-littleaarch64


Disassembly of section .start:

00000000000e0000 <_start>:
   e0000:	d10903ff 	sub	sp, sp, #0x240
   e0004:	a9007bfd 	stp	x29, x30, [sp]
   e0008:	910003fd 	mov	x29, sp
   e000c:	90000000 	adrp	x0, e0000 <_start>
   e0010:	910fa001 	add	x1, x0, #0x3e8
   e0014:	910063e0 	add	x0, sp, #0x18
   e0018:	aa0103e3 	mov	x3, x1
   e001c:	d2804501 	mov	x1, #0x228                 	// #552
   e0020:	aa0103e2 	mov	x2, x1
   e0024:	aa0303e1 	mov	x1, x3
   e0028:	940000a8 	bl	e02c8 <memcpy>
   e002c:	f9000bff 	str	xzr, [sp, #16]
   e0030:	910043e1 	add	x1, sp, #0x10
   e0034:	910063e0 	add	x0, sp, #0x18
   e0038:	9400003d 	bl	e012c <interpret>
   e003c:	f9400be0 	ldr	x0, [sp, #16]
   e0040:	a9407bfd 	ldp	x29, x30, [sp]
   e0044:	910903ff 	add	sp, sp, #0x240
   e0048:	d65f03c0 	ret

Disassembly of section .text:

00000000000e004c <zmem>:
   e004c:	d10083ff 	sub	sp, sp, #0x20
   e0050:	f90007e0 	str	x0, [sp, #8]
   e0054:	b90007e1 	str	w1, [sp, #4]
   e0058:	b9001fff 	str	wzr, [sp, #28]
   e005c:	14000008 	b	e007c <zmem+0x30>
   e0060:	b9401fe0 	ldr	w0, [sp, #28]
   e0064:	f94007e1 	ldr	x1, [sp, #8]
   e0068:	8b000020 	add	x0, x1, x0
   e006c:	3900001f 	strb	wzr, [x0]
   e0070:	b9401fe0 	ldr	w0, [sp, #28]
   e0074:	11000400 	add	w0, w0, #0x1
   e0078:	b9001fe0 	str	w0, [sp, #28]
   e007c:	b9401fe1 	ldr	w1, [sp, #28]
   e0080:	b94007e0 	ldr	w0, [sp, #4]
   e0084:	6b00003f 	cmp	w1, w0
   e0088:	54fffec1 	b.ne	e0060 <zmem+0x14>  // b.any
   e008c:	d503201f 	nop
   e0090:	d503201f 	nop
   e0094:	910083ff 	add	sp, sp, #0x20
   e0098:	d65f03c0 	ret

00000000000e009c <procchar>:
   e009c:	d10043ff 	sub	sp, sp, #0x10
   e00a0:	39003fe0 	strb	w0, [sp, #15]
   e00a4:	f90003e1 	str	x1, [sp]
   e00a8:	f94003e0 	ldr	x0, [sp]
   e00ac:	f9400001 	ldr	x1, [x0]
   e00b0:	f94003e0 	ldr	x0, [sp]
   e00b4:	f9400000 	ldr	x0, [x0]
   e00b8:	d376d400 	lsl	x0, x0, #10
   e00bc:	ca000021 	eor	x1, x1, x0
   e00c0:	f94003e0 	ldr	x0, [sp]
   e00c4:	f9000001 	str	x1, [x0]
   e00c8:	f94003e0 	ldr	x0, [sp]
   e00cc:	f9400001 	ldr	x1, [x0]
   e00d0:	f94003e0 	ldr	x0, [sp]
   e00d4:	f9400000 	ldr	x0, [x0]
   e00d8:	d352fc00 	lsr	x0, x0, #18
   e00dc:	ca000021 	eor	x1, x1, x0
   e00e0:	f94003e0 	ldr	x0, [sp]
   e00e4:	f9000001 	str	x1, [x0]
   e00e8:	f94003e0 	ldr	x0, [sp]
   e00ec:	f9400001 	ldr	x1, [x0]
   e00f0:	f94003e0 	ldr	x0, [sp]
   e00f4:	f9400000 	ldr	x0, [x0]
   e00f8:	d37ef400 	lsl	x0, x0, #2
   e00fc:	ca000021 	eor	x1, x1, x0
   e0100:	f94003e0 	ldr	x0, [sp]
   e0104:	f9000001 	str	x1, [x0]
   e0108:	f94003e0 	ldr	x0, [sp]
   e010c:	f9400001 	ldr	x1, [x0]
   e0110:	39403fe0 	ldrb	w0, [sp, #15]
   e0114:	8b000021 	add	x1, x1, x0
   e0118:	f94003e0 	ldr	x0, [sp]
   e011c:	f9000001 	str	x1, [x0]
   e0120:	d503201f 	nop
   e0124:	910043ff 	add	sp, sp, #0x10
   e0128:	d65f03c0 	ret

00000000000e012c <interpret>:
   e012c:	d289080c 	mov	x12, #0x4840                	// #18496
   e0130:	cb2c63ff 	sub	sp, sp, x12
   e0134:	a9007bfd 	stp	x29, x30, [sp]
   e0138:	910003fd 	mov	x29, sp
   e013c:	f9000fe0 	str	x0, [sp, #24]
   e0140:	f9000be1 	str	x1, [sp, #16]
   e0144:	91400be0 	add	x0, sp, #0x2, lsl #12
   e0148:	9100a000 	add	x0, x0, #0x28
   e014c:	52850001 	mov	w1, #0x2800                	// #10240
   e0150:	97ffffbf 	bl	e004c <zmem>
   e0154:	91400be0 	add	x0, sp, #0x2, lsl #12
   e0158:	9100a000 	add	x0, x0, #0x28
   e015c:	f9241fe0 	str	x0, [sp, #18488]
   e0160:	9100a3e0 	add	x0, sp, #0x28
   e0164:	f9241be0 	str	x0, [sp, #18480]
   e0168:	f9400fe0 	ldr	x0, [sp, #24]
   e016c:	f92417e0 	str	x0, [sp, #18472]
   e0170:	1400004c 	b	e02a0 <interpret+0x174>
   e0174:	f96417e0 	ldr	x0, [sp, #18472]
   e0178:	39400000 	ldrb	w0, [x0]
   e017c:	7101741f 	cmp	w0, #0x5d
   e0180:	54000720 	b.eq	e0264 <interpret+0x138>  // b.none
   e0184:	7101741f 	cmp	w0, #0x5d
   e0188:	5400086c 	b.gt	e0294 <interpret+0x168>
   e018c:	71016c1f 	cmp	w0, #0x5b
   e0190:	540005e0 	b.eq	e024c <interpret+0x120>  // b.none
   e0194:	71016c1f 	cmp	w0, #0x5b
   e0198:	540007ec 	b.gt	e0294 <interpret+0x168>
   e019c:	7100f81f 	cmp	w0, #0x3e
   e01a0:	54000280 	b.eq	e01f0 <interpret+0xc4>  // b.none
   e01a4:	7100f81f 	cmp	w0, #0x3e
   e01a8:	5400076c 	b.gt	e0294 <interpret+0x168>
   e01ac:	7100f01f 	cmp	w0, #0x3c
   e01b0:	54000180 	b.eq	e01e0 <interpret+0xb4>  // b.none
   e01b4:	7100f01f 	cmp	w0, #0x3c
   e01b8:	540006ec 	b.gt	e0294 <interpret+0x168>
   e01bc:	7100b81f 	cmp	w0, #0x2e
   e01c0:	540003c0 	b.eq	e0238 <interpret+0x10c>  // b.none
   e01c4:	7100b81f 	cmp	w0, #0x2e
   e01c8:	5400066c 	b.gt	e0294 <interpret+0x168>
   e01cc:	7100ac1f 	cmp	w0, #0x2b
   e01d0:	54000180 	b.eq	e0200 <interpret+0xd4>  // b.none
   e01d4:	7100b41f 	cmp	w0, #0x2d
   e01d8:	54000220 	b.eq	e021c <interpret+0xf0>  // b.none
   e01dc:	1400002e 	b	e0294 <interpret+0x168>
   e01e0:	f9641fe0 	ldr	x0, [sp, #18488]
   e01e4:	d1000400 	sub	x0, x0, #0x1
   e01e8:	f9241fe0 	str	x0, [sp, #18488]
   e01ec:	1400002a 	b	e0294 <interpret+0x168>
   e01f0:	f9641fe0 	ldr	x0, [sp, #18488]
   e01f4:	91000400 	add	x0, x0, #0x1
   e01f8:	f9241fe0 	str	x0, [sp, #18488]
   e01fc:	14000026 	b	e0294 <interpret+0x168>
   e0200:	f9641fe0 	ldr	x0, [sp, #18488]
   e0204:	39400000 	ldrb	w0, [x0]
   e0208:	11000400 	add	w0, w0, #0x1
   e020c:	12001c01 	and	w1, w0, #0xff
   e0210:	f9641fe0 	ldr	x0, [sp, #18488]
   e0214:	39000001 	strb	w1, [x0]
   e0218:	1400001f 	b	e0294 <interpret+0x168>
   e021c:	f9641fe0 	ldr	x0, [sp, #18488]
   e0220:	39400000 	ldrb	w0, [x0]
   e0224:	51000400 	sub	w0, w0, #0x1
   e0228:	12001c01 	and	w1, w0, #0xff
   e022c:	f9641fe0 	ldr	x0, [sp, #18488]
   e0230:	39000001 	strb	w1, [x0]
   e0234:	14000018 	b	e0294 <interpret+0x168>
   e0238:	f9641fe0 	ldr	x0, [sp, #18488]
   e023c:	39400000 	ldrb	w0, [x0]
   e0240:	f9400be1 	ldr	x1, [sp, #16]
   e0244:	97ffff96 	bl	e009c <procchar>
   e0248:	14000013 	b	e0294 <interpret+0x168>
   e024c:	f9641be0 	ldr	x0, [sp, #18480]
   e0250:	91002001 	add	x1, x0, #0x8
   e0254:	f9241be1 	str	x1, [sp, #18480]
   e0258:	f96417e1 	ldr	x1, [sp, #18472]
   e025c:	f9000001 	str	x1, [x0]
   e0260:	1400000d 	b	e0294 <interpret+0x168>
   e0264:	f9641fe0 	ldr	x0, [sp, #18488]
   e0268:	39400000 	ldrb	w0, [x0]
   e026c:	7100001f 	cmp	w0, #0x0
   e0270:	540000a1 	b.ne	e0284 <interpret+0x158>  // b.any
   e0274:	f9641be0 	ldr	x0, [sp, #18480]
   e0278:	d1002000 	sub	x0, x0, #0x8
   e027c:	f9241be0 	str	x0, [sp, #18480]
   e0280:	14000004 	b	e0290 <interpret+0x164>
   e0284:	f9641be0 	ldr	x0, [sp, #18480]
   e0288:	f85f8000 	ldur	x0, [x0, #-8]
   e028c:	f92417e0 	str	x0, [sp, #18472]
   e0290:	d503201f 	nop
   e0294:	f96417e0 	ldr	x0, [sp, #18472]
   e0298:	91000400 	add	x0, x0, #0x1
   e029c:	f92417e0 	str	x0, [sp, #18472]
   e02a0:	f96417e0 	ldr	x0, [sp, #18472]
   e02a4:	39400000 	ldrb	w0, [x0]
   e02a8:	7100001f 	cmp	w0, #0x0
   e02ac:	54fff641 	b.ne	e0174 <interpret+0x48>  // b.any
   e02b0:	d503201f 	nop
   e02b4:	d503201f 	nop
   e02b8:	a9407bfd 	ldp	x29, x30, [sp]
   e02bc:	d289080c 	mov	x12, #0x4840                	// #18496
   e02c0:	8b2c63ff 	add	sp, sp, x12
   e02c4:	d65f03c0 	ret

00000000000e02c8 <memcpy>:
   e02c8:	d100c3ff 	sub	sp, sp, #0x30
   e02cc:	f9000fe0 	str	x0, [sp, #24]
   e02d0:	f9000be1 	str	x1, [sp, #16]
   e02d4:	f90007e2 	str	x2, [sp, #8]
   e02d8:	f90017ff 	str	xzr, [sp, #40]
   e02dc:	1400000c 	b	e030c <memcpy+0x44>
   e02e0:	f9400be1 	ldr	x1, [sp, #16]
   e02e4:	f94017e0 	ldr	x0, [sp, #40]
   e02e8:	8b000021 	add	x1, x1, x0
   e02ec:	f9400fe2 	ldr	x2, [sp, #24]
   e02f0:	f94017e0 	ldr	x0, [sp, #40]
   e02f4:	8b000040 	add	x0, x2, x0
   e02f8:	39400021 	ldrb	w1, [x1]
   e02fc:	39000001 	strb	w1, [x0]
   e0300:	f94017e0 	ldr	x0, [sp, #40]
   e0304:	91000400 	add	x0, x0, #0x1
   e0308:	f90017e0 	str	x0, [sp, #40]
   e030c:	f94017e1 	ldr	x1, [sp, #40]
   e0310:	f94007e0 	ldr	x0, [sp, #8]
   e0314:	eb00003f 	cmp	x1, x0
   e0318:	54fffe41 	b.ne	e02e0 <memcpy+0x18>  // b.any
   e031c:	f9400fe0 	ldr	x0, [sp, #24]
   e0320:	9100c3ff 	add	sp, sp, #0x30
   e0324:	d65f03c0 	ret

00000000000e0328 <memset>:
   e0328:	d100c3ff 	sub	sp, sp, #0x30
   e032c:	f9000fe0 	str	x0, [sp, #24]
   e0330:	b90017e1 	str	w1, [sp, #20]
   e0334:	f90007e2 	str	x2, [sp, #8]
   e0338:	f90017ff 	str	xzr, [sp, #40]
   e033c:	1400000a 	b	e0364 <memset+0x3c>
   e0340:	f9400fe1 	ldr	x1, [sp, #24]
   e0344:	f94017e0 	ldr	x0, [sp, #40]
   e0348:	8b000020 	add	x0, x1, x0
   e034c:	b94017e1 	ldr	w1, [sp, #20]
   e0350:	12001c21 	and	w1, w1, #0xff
   e0354:	39000001 	strb	w1, [x0]
   e0358:	f94017e0 	ldr	x0, [sp, #40]
   e035c:	91000400 	add	x0, x0, #0x1
   e0360:	f90017e0 	str	x0, [sp, #40]
   e0364:	f94017e1 	ldr	x1, [sp, #40]
   e0368:	f94007e0 	ldr	x0, [sp, #8]
   e036c:	eb00003f 	cmp	x1, x0
   e0370:	54fffe81 	b.ne	e0340 <memset+0x18>  // b.any
   e0374:	f9400fe0 	ldr	x0, [sp, #24]
   e0378:	9100c3ff 	add	sp, sp, #0x30
   e037c:	d65f03c0 	ret

00000000000e0380 <memmove>:
   e0380:	d100c3ff 	sub	sp, sp, #0x30
   e0384:	f9000fe0 	str	x0, [sp, #24]
   e0388:	f9000be1 	str	x1, [sp, #16]
   e038c:	f90007e2 	str	x2, [sp, #8]
   e0390:	f94007e0 	ldr	x0, [sp, #8]
   e0394:	f90017e0 	str	x0, [sp, #40]
   e0398:	1400000e 	b	e03d0 <memmove+0x50>
   e039c:	f94017e0 	ldr	x0, [sp, #40]
   e03a0:	d1000400 	sub	x0, x0, #0x1
   e03a4:	f9400be1 	ldr	x1, [sp, #16]
   e03a8:	8b000021 	add	x1, x1, x0
   e03ac:	f94017e0 	ldr	x0, [sp, #40]
   e03b0:	d1000400 	sub	x0, x0, #0x1
   e03b4:	f9400fe2 	ldr	x2, [sp, #24]
   e03b8:	8b000040 	add	x0, x2, x0
   e03bc:	39400021 	ldrb	w1, [x1]
   e03c0:	39000001 	strb	w1, [x0]
   e03c4:	f94017e0 	ldr	x0, [sp, #40]
   e03c8:	d1000400 	sub	x0, x0, #0x1
   e03cc:	f90017e0 	str	x0, [sp, #40]
   e03d0:	f94017e0 	ldr	x0, [sp, #40]
   e03d4:	f100001f 	cmp	x0, #0x0
   e03d8:	54fffe21 	b.ne	e039c <memmove+0x1c>  // b.any
   e03dc:	f9400fe0 	ldr	x0, [sp, #24]
   e03e0:	9100c3ff 	add	sp, sp, #0x30
   e03e4:	d65f03c0 	ret
