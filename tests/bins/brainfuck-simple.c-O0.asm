
brainfuck-simple.c.elf:     file format elf64-littleaarch64


Disassembly of section .start:

00000000000e0000 <_start>:
   e0000:	a9b77bfd 	stp	x29, x30, [sp, #-144]!
   e0004:	910003fd 	mov	x29, sp
   e0008:	90000000 	adrp	x0, e0000 <_start>
   e000c:	91106001 	add	x1, x0, #0x418
   e0010:	910063e0 	add	x0, sp, #0x18
   e0014:	a9400c22 	ldp	x2, x3, [x1]
   e0018:	a9000c02 	stp	x2, x3, [x0]
   e001c:	a9410c22 	ldp	x2, x3, [x1, #16]
   e0020:	a9010c02 	stp	x2, x3, [x0, #16]
   e0024:	a9420c22 	ldp	x2, x3, [x1, #32]
   e0028:	a9020c02 	stp	x2, x3, [x0, #32]
   e002c:	a9430c22 	ldp	x2, x3, [x1, #48]
   e0030:	a9030c02 	stp	x2, x3, [x0, #48]
   e0034:	a9440c22 	ldp	x2, x3, [x1, #64]
   e0038:	a9040c02 	stp	x2, x3, [x0, #64]
   e003c:	a9450c22 	ldp	x2, x3, [x1, #80]
   e0040:	a9050c02 	stp	x2, x3, [x0, #80]
   e0044:	a9460c22 	ldp	x2, x3, [x1, #96]
   e0048:	a9060c02 	stp	x2, x3, [x0, #96]
   e004c:	9101bc21 	add	x1, x1, #0x6f
   e0050:	9101bc00 	add	x0, x0, #0x6f
   e0054:	b9400021 	ldr	w1, [x1]
   e0058:	b9000001 	str	w1, [x0]
   e005c:	f9000bff 	str	xzr, [sp, #16]
   e0060:	910043e1 	add	x1, sp, #0x10
   e0064:	910063e0 	add	x0, sp, #0x18
   e0068:	9400003c 	bl	e0158 <interpret>
   e006c:	f9400be0 	ldr	x0, [sp, #16]
   e0070:	a8c97bfd 	ldp	x29, x30, [sp], #144
   e0074:	d65f03c0 	ret

Disassembly of section .text:

00000000000e0078 <zmem>:
   e0078:	d10083ff 	sub	sp, sp, #0x20
   e007c:	f90007e0 	str	x0, [sp, #8]
   e0080:	b90007e1 	str	w1, [sp, #4]
   e0084:	b9001fff 	str	wzr, [sp, #28]
   e0088:	14000008 	b	e00a8 <zmem+0x30>
   e008c:	b9401fe0 	ldr	w0, [sp, #28]
   e0090:	f94007e1 	ldr	x1, [sp, #8]
   e0094:	8b000020 	add	x0, x1, x0
   e0098:	3900001f 	strb	wzr, [x0]
   e009c:	b9401fe0 	ldr	w0, [sp, #28]
   e00a0:	11000400 	add	w0, w0, #0x1
   e00a4:	b9001fe0 	str	w0, [sp, #28]
   e00a8:	b9401fe1 	ldr	w1, [sp, #28]
   e00ac:	b94007e0 	ldr	w0, [sp, #4]
   e00b0:	6b00003f 	cmp	w1, w0
   e00b4:	54fffec1 	b.ne	e008c <zmem+0x14>  // b.any
   e00b8:	d503201f 	nop
   e00bc:	d503201f 	nop
   e00c0:	910083ff 	add	sp, sp, #0x20
   e00c4:	d65f03c0 	ret

00000000000e00c8 <procchar>:
   e00c8:	d10043ff 	sub	sp, sp, #0x10
   e00cc:	39003fe0 	strb	w0, [sp, #15]
   e00d0:	f90003e1 	str	x1, [sp]
   e00d4:	f94003e0 	ldr	x0, [sp]
   e00d8:	f9400001 	ldr	x1, [x0]
   e00dc:	f94003e0 	ldr	x0, [sp]
   e00e0:	f9400000 	ldr	x0, [x0]
   e00e4:	d376d400 	lsl	x0, x0, #10
   e00e8:	ca000021 	eor	x1, x1, x0
   e00ec:	f94003e0 	ldr	x0, [sp]
   e00f0:	f9000001 	str	x1, [x0]
   e00f4:	f94003e0 	ldr	x0, [sp]
   e00f8:	f9400001 	ldr	x1, [x0]
   e00fc:	f94003e0 	ldr	x0, [sp]
   e0100:	f9400000 	ldr	x0, [x0]
   e0104:	d352fc00 	lsr	x0, x0, #18
   e0108:	ca000021 	eor	x1, x1, x0
   e010c:	f94003e0 	ldr	x0, [sp]
   e0110:	f9000001 	str	x1, [x0]
   e0114:	f94003e0 	ldr	x0, [sp]
   e0118:	f9400001 	ldr	x1, [x0]
   e011c:	f94003e0 	ldr	x0, [sp]
   e0120:	f9400000 	ldr	x0, [x0]
   e0124:	d37ef400 	lsl	x0, x0, #2
   e0128:	ca000021 	eor	x1, x1, x0
   e012c:	f94003e0 	ldr	x0, [sp]
   e0130:	f9000001 	str	x1, [x0]
   e0134:	f94003e0 	ldr	x0, [sp]
   e0138:	f9400001 	ldr	x1, [x0]
   e013c:	39403fe0 	ldrb	w0, [sp, #15]
   e0140:	8b000021 	add	x1, x1, x0
   e0144:	f94003e0 	ldr	x0, [sp]
   e0148:	f9000001 	str	x1, [x0]
   e014c:	d503201f 	nop
   e0150:	910043ff 	add	sp, sp, #0x10
   e0154:	d65f03c0 	ret

00000000000e0158 <interpret>:
   e0158:	d289080c 	mov	x12, #0x4840                	// #18496
   e015c:	cb2c63ff 	sub	sp, sp, x12
   e0160:	a9007bfd 	stp	x29, x30, [sp]
   e0164:	910003fd 	mov	x29, sp
   e0168:	f9000fe0 	str	x0, [sp, #24]
   e016c:	f9000be1 	str	x1, [sp, #16]
   e0170:	91400be0 	add	x0, sp, #0x2, lsl #12
   e0174:	9100a000 	add	x0, x0, #0x28
   e0178:	52850001 	mov	w1, #0x2800                	// #10240
   e017c:	97ffffbf 	bl	e0078 <zmem>
   e0180:	91400be0 	add	x0, sp, #0x2, lsl #12
   e0184:	9100a000 	add	x0, x0, #0x28
   e0188:	f9241fe0 	str	x0, [sp, #18488]
   e018c:	9100a3e0 	add	x0, sp, #0x28
   e0190:	f9241be0 	str	x0, [sp, #18480]
   e0194:	f9400fe0 	ldr	x0, [sp, #24]
   e0198:	f92417e0 	str	x0, [sp, #18472]
   e019c:	1400004c 	b	e02cc <interpret+0x174>
   e01a0:	f96417e0 	ldr	x0, [sp, #18472]
   e01a4:	39400000 	ldrb	w0, [x0]
   e01a8:	7101741f 	cmp	w0, #0x5d
   e01ac:	54000720 	b.eq	e0290 <interpret+0x138>  // b.none
   e01b0:	7101741f 	cmp	w0, #0x5d
   e01b4:	5400086c 	b.gt	e02c0 <interpret+0x168>
   e01b8:	71016c1f 	cmp	w0, #0x5b
   e01bc:	540005e0 	b.eq	e0278 <interpret+0x120>  // b.none
   e01c0:	71016c1f 	cmp	w0, #0x5b
   e01c4:	540007ec 	b.gt	e02c0 <interpret+0x168>
   e01c8:	7100f81f 	cmp	w0, #0x3e
   e01cc:	54000280 	b.eq	e021c <interpret+0xc4>  // b.none
   e01d0:	7100f81f 	cmp	w0, #0x3e
   e01d4:	5400076c 	b.gt	e02c0 <interpret+0x168>
   e01d8:	7100f01f 	cmp	w0, #0x3c
   e01dc:	54000180 	b.eq	e020c <interpret+0xb4>  // b.none
   e01e0:	7100f01f 	cmp	w0, #0x3c
   e01e4:	540006ec 	b.gt	e02c0 <interpret+0x168>
   e01e8:	7100b81f 	cmp	w0, #0x2e
   e01ec:	540003c0 	b.eq	e0264 <interpret+0x10c>  // b.none
   e01f0:	7100b81f 	cmp	w0, #0x2e
   e01f4:	5400066c 	b.gt	e02c0 <interpret+0x168>
   e01f8:	7100ac1f 	cmp	w0, #0x2b
   e01fc:	54000180 	b.eq	e022c <interpret+0xd4>  // b.none
   e0200:	7100b41f 	cmp	w0, #0x2d
   e0204:	54000220 	b.eq	e0248 <interpret+0xf0>  // b.none
   e0208:	1400002e 	b	e02c0 <interpret+0x168>
   e020c:	f9641fe0 	ldr	x0, [sp, #18488]
   e0210:	d1000400 	sub	x0, x0, #0x1
   e0214:	f9241fe0 	str	x0, [sp, #18488]
   e0218:	1400002a 	b	e02c0 <interpret+0x168>
   e021c:	f9641fe0 	ldr	x0, [sp, #18488]
   e0220:	91000400 	add	x0, x0, #0x1
   e0224:	f9241fe0 	str	x0, [sp, #18488]
   e0228:	14000026 	b	e02c0 <interpret+0x168>
   e022c:	f9641fe0 	ldr	x0, [sp, #18488]
   e0230:	39400000 	ldrb	w0, [x0]
   e0234:	11000400 	add	w0, w0, #0x1
   e0238:	12001c01 	and	w1, w0, #0xff
   e023c:	f9641fe0 	ldr	x0, [sp, #18488]
   e0240:	39000001 	strb	w1, [x0]
   e0244:	1400001f 	b	e02c0 <interpret+0x168>
   e0248:	f9641fe0 	ldr	x0, [sp, #18488]
   e024c:	39400000 	ldrb	w0, [x0]
   e0250:	51000400 	sub	w0, w0, #0x1
   e0254:	12001c01 	and	w1, w0, #0xff
   e0258:	f9641fe0 	ldr	x0, [sp, #18488]
   e025c:	39000001 	strb	w1, [x0]
   e0260:	14000018 	b	e02c0 <interpret+0x168>
   e0264:	f9641fe0 	ldr	x0, [sp, #18488]
   e0268:	39400000 	ldrb	w0, [x0]
   e026c:	f9400be1 	ldr	x1, [sp, #16]
   e0270:	97ffff96 	bl	e00c8 <procchar>
   e0274:	14000013 	b	e02c0 <interpret+0x168>
   e0278:	f9641be0 	ldr	x0, [sp, #18480]
   e027c:	91002001 	add	x1, x0, #0x8
   e0280:	f9241be1 	str	x1, [sp, #18480]
   e0284:	f96417e1 	ldr	x1, [sp, #18472]
   e0288:	f9000001 	str	x1, [x0]
   e028c:	1400000d 	b	e02c0 <interpret+0x168>
   e0290:	f9641fe0 	ldr	x0, [sp, #18488]
   e0294:	39400000 	ldrb	w0, [x0]
   e0298:	7100001f 	cmp	w0, #0x0
   e029c:	540000a1 	b.ne	e02b0 <interpret+0x158>  // b.any
   e02a0:	f9641be0 	ldr	x0, [sp, #18480]
   e02a4:	d1002000 	sub	x0, x0, #0x8
   e02a8:	f9241be0 	str	x0, [sp, #18480]
   e02ac:	14000004 	b	e02bc <interpret+0x164>
   e02b0:	f9641be0 	ldr	x0, [sp, #18480]
   e02b4:	f85f8000 	ldur	x0, [x0, #-8]
   e02b8:	f92417e0 	str	x0, [sp, #18472]
   e02bc:	d503201f 	nop
   e02c0:	f96417e0 	ldr	x0, [sp, #18472]
   e02c4:	91000400 	add	x0, x0, #0x1
   e02c8:	f92417e0 	str	x0, [sp, #18472]
   e02cc:	f96417e0 	ldr	x0, [sp, #18472]
   e02d0:	39400000 	ldrb	w0, [x0]
   e02d4:	7100001f 	cmp	w0, #0x0
   e02d8:	54fff641 	b.ne	e01a0 <interpret+0x48>  // b.any
   e02dc:	d503201f 	nop
   e02e0:	d503201f 	nop
   e02e4:	a9407bfd 	ldp	x29, x30, [sp]
   e02e8:	d289080c 	mov	x12, #0x4840                	// #18496
   e02ec:	8b2c63ff 	add	sp, sp, x12
   e02f0:	d65f03c0 	ret

00000000000e02f4 <memcpy>:
   e02f4:	d100c3ff 	sub	sp, sp, #0x30
   e02f8:	f9000fe0 	str	x0, [sp, #24]
   e02fc:	f9000be1 	str	x1, [sp, #16]
   e0300:	f90007e2 	str	x2, [sp, #8]
   e0304:	f90017ff 	str	xzr, [sp, #40]
   e0308:	1400000c 	b	e0338 <memcpy+0x44>
   e030c:	f9400be1 	ldr	x1, [sp, #16]
   e0310:	f94017e0 	ldr	x0, [sp, #40]
   e0314:	8b000021 	add	x1, x1, x0
   e0318:	f9400fe2 	ldr	x2, [sp, #24]
   e031c:	f94017e0 	ldr	x0, [sp, #40]
   e0320:	8b000040 	add	x0, x2, x0
   e0324:	39400021 	ldrb	w1, [x1]
   e0328:	39000001 	strb	w1, [x0]
   e032c:	f94017e0 	ldr	x0, [sp, #40]
   e0330:	91000400 	add	x0, x0, #0x1
   e0334:	f90017e0 	str	x0, [sp, #40]
   e0338:	f94017e1 	ldr	x1, [sp, #40]
   e033c:	f94007e0 	ldr	x0, [sp, #8]
   e0340:	eb00003f 	cmp	x1, x0
   e0344:	54fffe41 	b.ne	e030c <memcpy+0x18>  // b.any
   e0348:	f9400fe0 	ldr	x0, [sp, #24]
   e034c:	9100c3ff 	add	sp, sp, #0x30
   e0350:	d65f03c0 	ret

00000000000e0354 <memset>:
   e0354:	d100c3ff 	sub	sp, sp, #0x30
   e0358:	f9000fe0 	str	x0, [sp, #24]
   e035c:	b90017e1 	str	w1, [sp, #20]
   e0360:	f90007e2 	str	x2, [sp, #8]
   e0364:	f90017ff 	str	xzr, [sp, #40]
   e0368:	1400000a 	b	e0390 <memset+0x3c>
   e036c:	f9400fe1 	ldr	x1, [sp, #24]
   e0370:	f94017e0 	ldr	x0, [sp, #40]
   e0374:	8b000020 	add	x0, x1, x0
   e0378:	b94017e1 	ldr	w1, [sp, #20]
   e037c:	12001c21 	and	w1, w1, #0xff
   e0380:	39000001 	strb	w1, [x0]
   e0384:	f94017e0 	ldr	x0, [sp, #40]
   e0388:	91000400 	add	x0, x0, #0x1
   e038c:	f90017e0 	str	x0, [sp, #40]
   e0390:	f94017e1 	ldr	x1, [sp, #40]
   e0394:	f94007e0 	ldr	x0, [sp, #8]
   e0398:	eb00003f 	cmp	x1, x0
   e039c:	54fffe81 	b.ne	e036c <memset+0x18>  // b.any
   e03a0:	f9400fe0 	ldr	x0, [sp, #24]
   e03a4:	9100c3ff 	add	sp, sp, #0x30
   e03a8:	d65f03c0 	ret

00000000000e03ac <memmove>:
   e03ac:	d100c3ff 	sub	sp, sp, #0x30
   e03b0:	f9000fe0 	str	x0, [sp, #24]
   e03b4:	f9000be1 	str	x1, [sp, #16]
   e03b8:	f90007e2 	str	x2, [sp, #8]
   e03bc:	f94007e0 	ldr	x0, [sp, #8]
   e03c0:	f90017e0 	str	x0, [sp, #40]
   e03c4:	1400000e 	b	e03fc <memmove+0x50>
   e03c8:	f94017e0 	ldr	x0, [sp, #40]
   e03cc:	d1000400 	sub	x0, x0, #0x1
   e03d0:	f9400be1 	ldr	x1, [sp, #16]
   e03d4:	8b000021 	add	x1, x1, x0
   e03d8:	f94017e0 	ldr	x0, [sp, #40]
   e03dc:	d1000400 	sub	x0, x0, #0x1
   e03e0:	f9400fe2 	ldr	x2, [sp, #24]
   e03e4:	8b000040 	add	x0, x2, x0
   e03e8:	39400021 	ldrb	w1, [x1]
   e03ec:	39000001 	strb	w1, [x0]
   e03f0:	f94017e0 	ldr	x0, [sp, #40]
   e03f4:	d1000400 	sub	x0, x0, #0x1
   e03f8:	f90017e0 	str	x0, [sp, #40]
   e03fc:	f94017e0 	ldr	x0, [sp, #40]
   e0400:	f100001f 	cmp	x0, #0x0
   e0404:	54fffe21 	b.ne	e03c8 <memmove+0x1c>  // b.any
   e0408:	f9400fe0 	ldr	x0, [sp, #24]
   e040c:	9100c3ff 	add	sp, sp, #0x30
   e0410:	d65f03c0 	ret
