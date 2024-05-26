
vectorization.c.elf:     file format elf64-littleaarch64


Disassembly of section .start:

00000000000e0000 <_start>:
   e0000:	d10083ff 	sub	sp, sp, #0x20
   e0004:	d140cbff 	sub	sp, sp, #0x32, lsl #12
   e0008:	a9007bfd 	stp	x29, x30, [sp]
   e000c:	910003fd 	mov	x29, sp
   e0010:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0014:	b920181f 	str	wzr, [x0, #8216]
   e0018:	52808000 	mov	w0, #0x400                 	// #1024
   e001c:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0020:	b9201420 	str	w0, [x1, #8212]
   e0024:	910043e0 	add	x0, sp, #0x10
   e0028:	91401001 	add	x1, x0, #0x4, lsl #12
   e002c:	910043e0 	add	x0, sp, #0x10
   e0030:	91400c00 	add	x0, x0, #0x3, lsl #12
   e0034:	940002ec 	bl	e0be4 <init_memory>
   e0038:	910043e0 	add	x0, sp, #0x10
   e003c:	91401401 	add	x1, x0, #0x5, lsl #12
   e0040:	910043e0 	add	x0, sp, #0x10
   e0044:	91401000 	add	x0, x0, #0x4, lsl #12
   e0048:	940002e7 	bl	e0be4 <init_memory>
   e004c:	910043e0 	add	x0, sp, #0x10
   e0050:	91401801 	add	x1, x0, #0x6, lsl #12
   e0054:	910043e0 	add	x0, sp, #0x10
   e0058:	91401400 	add	x0, x0, #0x5, lsl #12
   e005c:	940002e2 	bl	e0be4 <init_memory>
   e0060:	910043e0 	add	x0, sp, #0x10
   e0064:	91400401 	add	x1, x0, #0x1, lsl #12
   e0068:	910043e0 	add	x0, sp, #0x10
   e006c:	91200000 	add	x0, x0, #0x800
   e0070:	940002dd 	bl	e0be4 <init_memory>
   e0074:	910043e1 	add	x1, sp, #0x10
   e0078:	d2830000 	mov	x0, #0x1800                	// #6144
   e007c:	8b000021 	add	x1, x1, x0
   e0080:	910043e0 	add	x0, sp, #0x10
   e0084:	91400400 	add	x0, x0, #0x1, lsl #12
   e0088:	940002d7 	bl	e0be4 <init_memory>
   e008c:	910043e0 	add	x0, sp, #0x10
   e0090:	91400802 	add	x2, x0, #0x2, lsl #12
   e0094:	910043e1 	add	x1, sp, #0x10
   e0098:	d2830000 	mov	x0, #0x1800                	// #6144
   e009c:	8b000020 	add	x0, x1, x0
   e00a0:	aa0203e1 	mov	x1, x2
   e00a4:	940002d0 	bl	e0be4 <init_memory>
   e00a8:	910043e0 	add	x0, sp, #0x10
   e00ac:	91403001 	add	x1, x0, #0xc, lsl #12
   e00b0:	910043e0 	add	x0, sp, #0x10
   e00b4:	91402800 	add	x0, x0, #0xa, lsl #12
   e00b8:	940002cb 	bl	e0be4 <init_memory>
   e00bc:	910043e0 	add	x0, sp, #0x10
   e00c0:	91403801 	add	x1, x0, #0xe, lsl #12
   e00c4:	910043e0 	add	x0, sp, #0x10
   e00c8:	91403000 	add	x0, x0, #0xc, lsl #12
   e00cc:	940002c6 	bl	e0be4 <init_memory>
   e00d0:	910043e0 	add	x0, sp, #0x10
   e00d4:	91404001 	add	x1, x0, #0x10, lsl #12
   e00d8:	910043e0 	add	x0, sp, #0x10
   e00dc:	91403800 	add	x0, x0, #0xe, lsl #12
   e00e0:	940002c1 	bl	e0be4 <init_memory>
   e00e4:	910043e0 	add	x0, sp, #0x10
   e00e8:	91400c01 	add	x1, x0, #0x3, lsl #12
   e00ec:	910043e0 	add	x0, sp, #0x10
   e00f0:	91400800 	add	x0, x0, #0x2, lsl #12
   e00f4:	940002bc 	bl	e0be4 <init_memory>
   e00f8:	910043e0 	add	x0, sp, #0x10
   e00fc:	91401c01 	add	x1, x0, #0x7, lsl #12
   e0100:	910043e0 	add	x0, sp, #0x10
   e0104:	91401800 	add	x0, x0, #0x6, lsl #12
   e0108:	940002b7 	bl	e0be4 <init_memory>
   e010c:	910043e0 	add	x0, sp, #0x10
   e0110:	91402001 	add	x1, x0, #0x8, lsl #12
   e0114:	910043e0 	add	x0, sp, #0x10
   e0118:	91401c00 	add	x0, x0, #0x7, lsl #12
   e011c:	940002b2 	bl	e0be4 <init_memory>
   e0120:	910043e0 	add	x0, sp, #0x10
   e0124:	91404c01 	add	x1, x0, #0x13, lsl #12
   e0128:	910043e0 	add	x0, sp, #0x10
   e012c:	91404800 	add	x0, x0, #0x12, lsl #12
   e0130:	940002ad 	bl	e0be4 <init_memory>
   e0134:	910043e0 	add	x0, sp, #0x10
   e0138:	94000021 	bl	e01bc <example1>
   e013c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0140:	b9201c1f 	str	wzr, [x0, #8220]
   e0144:	14000008 	b	e0164 <_start+0x164>
   e0148:	910043e0 	add	x0, sp, #0x10
   e014c:	9400001c 	bl	e01bc <example1>
   e0150:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0154:	b9601c00 	ldr	w0, [x0, #8220]
   e0158:	11000400 	add	w0, w0, #0x1
   e015c:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0160:	b9201c20 	str	w0, [x1, #8220]
   e0164:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0168:	b9601401 	ldr	w1, [x0, #8212]
   e016c:	2a0103e0 	mov	w0, w1
   e0170:	531e7400 	lsl	w0, w0, #2
   e0174:	0b010000 	add	w0, w0, w1
   e0178:	531f7800 	lsl	w0, w0, #1
   e017c:	2a0003e1 	mov	w1, w0
   e0180:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0184:	b9601c00 	ldr	w0, [x0, #8220]
   e0188:	6b01001f 	cmp	w0, w1
   e018c:	54fffdeb 	b.lt	e0148 <_start+0x148>  // b.tstop
   e0190:	910043e1 	add	x1, sp, #0x10
   e0194:	d2948000 	mov	x0, #0xa400                	// #41984
   e0198:	8b000021 	add	x1, x1, x0
   e019c:	910043e0 	add	x0, sp, #0x10
   e01a0:	91402800 	add	x0, x0, #0xa, lsl #12
   e01a4:	940002b0 	bl	e0c64 <digest_memory>
   e01a8:	d2800000 	mov	x0, #0x0                   	// #0
   e01ac:	a9407bfd 	ldp	x29, x30, [sp]
   e01b0:	910083ff 	add	sp, sp, #0x20
   e01b4:	9140cbff 	add	sp, sp, #0x32, lsl #12
   e01b8:	d65f03c0 	ret

Disassembly of section .text:

00000000000e01bc <example1>:
   e01bc:	d10083ff 	sub	sp, sp, #0x20
   e01c0:	f90007e0 	str	x0, [sp, #8]
   e01c4:	b9001fff 	str	wzr, [sp, #28]
   e01c8:	14000013 	b	e0214 <example1+0x58>
   e01cc:	f94007e0 	ldr	x0, [sp, #8]
   e01d0:	b9801fe1 	ldrsw	x1, [sp, #28]
   e01d4:	91400c21 	add	x1, x1, #0x3, lsl #12
   e01d8:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e01dc:	f94007e0 	ldr	x0, [sp, #8]
   e01e0:	b9801fe3 	ldrsw	x3, [sp, #28]
   e01e4:	d2870002 	mov	x2, #0x3800                	// #14336
   e01e8:	8b020062 	add	x2, x3, x2
   e01ec:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e01f0:	0b000022 	add	w2, w1, w0
   e01f4:	f94007e0 	ldr	x0, [sp, #8]
   e01f8:	b9801fe3 	ldrsw	x3, [sp, #28]
   e01fc:	d2850001 	mov	x1, #0x2800                	// #10240
   e0200:	8b010061 	add	x1, x3, x1
   e0204:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0208:	b9401fe0 	ldr	w0, [sp, #28]
   e020c:	11000400 	add	w0, w0, #0x1
   e0210:	b9001fe0 	str	w0, [sp, #28]
   e0214:	b9401fe0 	ldr	w0, [sp, #28]
   e0218:	7103fc1f 	cmp	w0, #0xff
   e021c:	54fffd8d 	b.le	e01cc <example1+0x10>
   e0220:	d503201f 	nop
   e0224:	d503201f 	nop
   e0228:	910083ff 	add	sp, sp, #0x20
   e022c:	d65f03c0 	ret

00000000000e0230 <example2a>:
   e0230:	d10083ff 	sub	sp, sp, #0x20
   e0234:	f90007e0 	str	x0, [sp, #8]
   e0238:	b90007e1 	str	w1, [sp, #4]
   e023c:	b90003e2 	str	w2, [sp]
   e0240:	b9001fff 	str	wzr, [sp, #28]
   e0244:	14000009 	b	e0268 <example2a+0x38>
   e0248:	f94007e0 	ldr	x0, [sp, #8]
   e024c:	b9801fe1 	ldrsw	x1, [sp, #28]
   e0250:	91400c21 	add	x1, x1, #0x3, lsl #12
   e0254:	b94003e2 	ldr	w2, [sp]
   e0258:	b8217802 	str	w2, [x0, x1, lsl #2]
   e025c:	b9401fe0 	ldr	w0, [sp, #28]
   e0260:	11000400 	add	w0, w0, #0x1
   e0264:	b9001fe0 	str	w0, [sp, #28]
   e0268:	b9401fe1 	ldr	w1, [sp, #28]
   e026c:	b94007e0 	ldr	w0, [sp, #4]
   e0270:	6b00003f 	cmp	w1, w0
   e0274:	54fffeab 	b.lt	e0248 <example2a+0x18>  // b.tstop
   e0278:	d503201f 	nop
   e027c:	d503201f 	nop
   e0280:	910083ff 	add	sp, sp, #0x20
   e0284:	d65f03c0 	ret

00000000000e0288 <example2b>:
   e0288:	d10083ff 	sub	sp, sp, #0x20
   e028c:	f90007e0 	str	x0, [sp, #8]
   e0290:	b90007e1 	str	w1, [sp, #4]
   e0294:	b90003e2 	str	w2, [sp]
   e0298:	b9001fff 	str	wzr, [sp, #28]
   e029c:	14000013 	b	e02e8 <example2b+0x60>
   e02a0:	f94007e0 	ldr	x0, [sp, #8]
   e02a4:	b9801fe1 	ldrsw	x1, [sp, #28]
   e02a8:	91400c21 	add	x1, x1, #0x3, lsl #12
   e02ac:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e02b0:	f94007e0 	ldr	x0, [sp, #8]
   e02b4:	b9801fe3 	ldrsw	x3, [sp, #28]
   e02b8:	d2870002 	mov	x2, #0x3800                	// #14336
   e02bc:	8b020062 	add	x2, x3, x2
   e02c0:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e02c4:	0a000022 	and	w2, w1, w0
   e02c8:	f94007e0 	ldr	x0, [sp, #8]
   e02cc:	b9801fe3 	ldrsw	x3, [sp, #28]
   e02d0:	d2850001 	mov	x1, #0x2800                	// #10240
   e02d4:	8b010061 	add	x1, x3, x1
   e02d8:	b8217802 	str	w2, [x0, x1, lsl #2]
   e02dc:	b9401fe0 	ldr	w0, [sp, #28]
   e02e0:	11000400 	add	w0, w0, #0x1
   e02e4:	b9001fe0 	str	w0, [sp, #28]
   e02e8:	b94007e0 	ldr	w0, [sp, #4]
   e02ec:	51000401 	sub	w1, w0, #0x1
   e02f0:	b90007e1 	str	w1, [sp, #4]
   e02f4:	7100001f 	cmp	w0, #0x0
   e02f8:	54fffd41 	b.ne	e02a0 <example2b+0x18>  // b.any
   e02fc:	d503201f 	nop
   e0300:	d503201f 	nop
   e0304:	910083ff 	add	sp, sp, #0x20
   e0308:	d65f03c0 	ret

00000000000e030c <example3>:
   e030c:	d10083ff 	sub	sp, sp, #0x20
   e0310:	f9000fe0 	str	x0, [sp, #24]
   e0314:	b90017e1 	str	w1, [sp, #20]
   e0318:	f90007e2 	str	x2, [sp, #8]
   e031c:	f90003e3 	str	x3, [sp]
   e0320:	14000009 	b	e0344 <example3+0x38>
   e0324:	f94003e1 	ldr	x1, [sp]
   e0328:	91001020 	add	x0, x1, #0x4
   e032c:	f90003e0 	str	x0, [sp]
   e0330:	f94007e0 	ldr	x0, [sp, #8]
   e0334:	91001002 	add	x2, x0, #0x4
   e0338:	f90007e2 	str	x2, [sp, #8]
   e033c:	b9400021 	ldr	w1, [x1]
   e0340:	b9000001 	str	w1, [x0]
   e0344:	b94017e0 	ldr	w0, [sp, #20]
   e0348:	51000401 	sub	w1, w0, #0x1
   e034c:	b90017e1 	str	w1, [sp, #20]
   e0350:	7100001f 	cmp	w0, #0x0
   e0354:	54fffe81 	b.ne	e0324 <example3+0x18>  // b.any
   e0358:	d503201f 	nop
   e035c:	d503201f 	nop
   e0360:	910083ff 	add	sp, sp, #0x20
   e0364:	d65f03c0 	ret

00000000000e0368 <example4a>:
   e0368:	d10083ff 	sub	sp, sp, #0x20
   e036c:	f9000fe0 	str	x0, [sp, #24]
   e0370:	b90017e1 	str	w1, [sp, #20]
   e0374:	f90007e2 	str	x2, [sp, #8]
   e0378:	f90003e3 	str	x3, [sp]
   e037c:	1400000a 	b	e03a4 <example4a+0x3c>
   e0380:	f94003e0 	ldr	x0, [sp]
   e0384:	91001001 	add	x1, x0, #0x4
   e0388:	f90003e1 	str	x1, [sp]
   e038c:	b9400001 	ldr	w1, [x0]
   e0390:	f94007e0 	ldr	x0, [sp, #8]
   e0394:	91001002 	add	x2, x0, #0x4
   e0398:	f90007e2 	str	x2, [sp, #8]
   e039c:	11001421 	add	w1, w1, #0x5
   e03a0:	b9000001 	str	w1, [x0]
   e03a4:	b94017e0 	ldr	w0, [sp, #20]
   e03a8:	51000401 	sub	w1, w0, #0x1
   e03ac:	b90017e1 	str	w1, [sp, #20]
   e03b0:	7100001f 	cmp	w0, #0x0
   e03b4:	54fffe61 	b.ne	e0380 <example4a+0x18>  // b.any
   e03b8:	d503201f 	nop
   e03bc:	d503201f 	nop
   e03c0:	910083ff 	add	sp, sp, #0x20
   e03c4:	d65f03c0 	ret

00000000000e03c8 <example4b>:
   e03c8:	d100c3ff 	sub	sp, sp, #0x30
   e03cc:	f9000fe0 	str	x0, [sp, #24]
   e03d0:	b90017e1 	str	w1, [sp, #20]
   e03d4:	f90007e2 	str	x2, [sp, #8]
   e03d8:	f90003e3 	str	x3, [sp]
   e03dc:	b9002fff 	str	wzr, [sp, #44]
   e03e0:	14000017 	b	e043c <example4b+0x74>
   e03e4:	b9402fe0 	ldr	w0, [sp, #44]
   e03e8:	11000401 	add	w1, w0, #0x1
   e03ec:	f9400fe0 	ldr	x0, [sp, #24]
   e03f0:	93407c21 	sxtw	x1, w1
   e03f4:	91400c21 	add	x1, x1, #0x3, lsl #12
   e03f8:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e03fc:	b9402fe0 	ldr	w0, [sp, #44]
   e0400:	11000c02 	add	w2, w0, #0x3
   e0404:	f9400fe0 	ldr	x0, [sp, #24]
   e0408:	93407c43 	sxtw	x3, w2
   e040c:	d2870002 	mov	x2, #0x3800                	// #14336
   e0410:	8b020062 	add	x2, x3, x2
   e0414:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e0418:	0b000022 	add	w2, w1, w0
   e041c:	f9400fe0 	ldr	x0, [sp, #24]
   e0420:	b9802fe3 	ldrsw	x3, [sp, #44]
   e0424:	d2850001 	mov	x1, #0x2800                	// #10240
   e0428:	8b010061 	add	x1, x3, x1
   e042c:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0430:	b9402fe0 	ldr	w0, [sp, #44]
   e0434:	11000400 	add	w0, w0, #0x1
   e0438:	b9002fe0 	str	w0, [sp, #44]
   e043c:	b9402fe1 	ldr	w1, [sp, #44]
   e0440:	b94017e0 	ldr	w0, [sp, #20]
   e0444:	6b00003f 	cmp	w1, w0
   e0448:	54fffceb 	b.lt	e03e4 <example4b+0x1c>  // b.tstop
   e044c:	d503201f 	nop
   e0450:	d503201f 	nop
   e0454:	9100c3ff 	add	sp, sp, #0x30
   e0458:	d65f03c0 	ret

00000000000e045c <example4c>:
   e045c:	d100c3ff 	sub	sp, sp, #0x30
   e0460:	f9000fe0 	str	x0, [sp, #24]
   e0464:	b90017e1 	str	w1, [sp, #20]
   e0468:	f90007e2 	str	x2, [sp, #8]
   e046c:	f90003e3 	str	x3, [sp]
   e0470:	52800080 	mov	w0, #0x4                   	// #4
   e0474:	b9002be0 	str	w0, [sp, #40]
   e0478:	b9002fff 	str	wzr, [sp, #44]
   e047c:	14000015 	b	e04d0 <example4c+0x74>
   e0480:	f9400fe0 	ldr	x0, [sp, #24]
   e0484:	b9802fe2 	ldrsw	x2, [sp, #44]
   e0488:	d2850001 	mov	x1, #0x2800                	// #10240
   e048c:	8b010041 	add	x1, x2, x1
   e0490:	b8617800 	ldr	w0, [x0, x1, lsl #2]
   e0494:	b90027e0 	str	w0, [sp, #36]
   e0498:	b94027e1 	ldr	w1, [sp, #36]
   e049c:	b9402be0 	ldr	w0, [sp, #40]
   e04a0:	6b00003f 	cmp	w1, w0
   e04a4:	5400006d 	b.le	e04b0 <example4c+0x54>
   e04a8:	b9402be0 	ldr	w0, [sp, #40]
   e04ac:	14000002 	b	e04b4 <example4c+0x58>
   e04b0:	52800000 	mov	w0, #0x0                   	// #0
   e04b4:	f9400fe1 	ldr	x1, [sp, #24]
   e04b8:	b9802fe2 	ldrsw	x2, [sp, #44]
   e04bc:	91400c42 	add	x2, x2, #0x3, lsl #12
   e04c0:	b8227820 	str	w0, [x1, x2, lsl #2]
   e04c4:	b9402fe0 	ldr	w0, [sp, #44]
   e04c8:	11000400 	add	w0, w0, #0x1
   e04cc:	b9002fe0 	str	w0, [sp, #44]
   e04d0:	b9402fe1 	ldr	w1, [sp, #44]
   e04d4:	b94017e0 	ldr	w0, [sp, #20]
   e04d8:	6b00003f 	cmp	w1, w0
   e04dc:	54fffd2b 	b.lt	e0480 <example4c+0x24>  // b.tstop
   e04e0:	d503201f 	nop
   e04e4:	d503201f 	nop
   e04e8:	9100c3ff 	add	sp, sp, #0x30
   e04ec:	d65f03c0 	ret

00000000000e04f0 <example5>:
   e04f0:	d100c3ff 	sub	sp, sp, #0x30
   e04f4:	f9000fe0 	str	x0, [sp, #24]
   e04f8:	b90017e1 	str	w1, [sp, #20]
   e04fc:	f90007e2 	str	x2, [sp, #8]
   e0500:	b9002fff 	str	wzr, [sp, #44]
   e0504:	1400000a 	b	e052c <example5+0x3c>
   e0508:	f9400fe0 	ldr	x0, [sp, #24]
   e050c:	b9802fe2 	ldrsw	x2, [sp, #44]
   e0510:	d2848001 	mov	x1, #0x2400                	// #9216
   e0514:	8b010041 	add	x1, x2, x1
   e0518:	528000a2 	mov	w2, #0x5                   	// #5
   e051c:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0520:	b9402fe0 	ldr	w0, [sp, #44]
   e0524:	11000400 	add	w0, w0, #0x1
   e0528:	b9002fe0 	str	w0, [sp, #44]
   e052c:	b9402fe1 	ldr	w1, [sp, #44]
   e0530:	b94017e0 	ldr	w0, [sp, #20]
   e0534:	6b00003f 	cmp	w1, w0
   e0538:	54fffe8b 	b.lt	e0508 <example5+0x18>  // b.tstop
   e053c:	d503201f 	nop
   e0540:	d503201f 	nop
   e0544:	9100c3ff 	add	sp, sp, #0x30
   e0548:	d65f03c0 	ret

00000000000e054c <example7>:
   e054c:	d10083ff 	sub	sp, sp, #0x20
   e0550:	f90007e0 	str	x0, [sp, #8]
   e0554:	b90007e1 	str	w1, [sp, #4]
   e0558:	b9001fff 	str	wzr, [sp, #28]
   e055c:	14000010 	b	e059c <example7+0x50>
   e0560:	b9401fe1 	ldr	w1, [sp, #28]
   e0564:	b94007e0 	ldr	w0, [sp, #4]
   e0568:	0b000021 	add	w1, w1, w0
   e056c:	f94007e0 	ldr	x0, [sp, #8]
   e0570:	93407c21 	sxtw	x1, w1
   e0574:	91400c21 	add	x1, x1, #0x3, lsl #12
   e0578:	b8617802 	ldr	w2, [x0, x1, lsl #2]
   e057c:	f94007e0 	ldr	x0, [sp, #8]
   e0580:	b9801fe3 	ldrsw	x3, [sp, #28]
   e0584:	d2850001 	mov	x1, #0x2800                	// #10240
   e0588:	8b010061 	add	x1, x3, x1
   e058c:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0590:	b9401fe0 	ldr	w0, [sp, #28]
   e0594:	11000400 	add	w0, w0, #0x1
   e0598:	b9001fe0 	str	w0, [sp, #28]
   e059c:	b9401fe0 	ldr	w0, [sp, #28]
   e05a0:	710ffc1f 	cmp	w0, #0x3ff
   e05a4:	54fffded 	b.le	e0560 <example7+0x14>
   e05a8:	d503201f 	nop
   e05ac:	d503201f 	nop
   e05b0:	910083ff 	add	sp, sp, #0x20
   e05b4:	d65f03c0 	ret

00000000000e05b8 <example8>:
   e05b8:	d10083ff 	sub	sp, sp, #0x20
   e05bc:	f90007e0 	str	x0, [sp, #8]
   e05c0:	b90007e1 	str	w1, [sp, #4]
   e05c4:	b9001fff 	str	wzr, [sp, #28]
   e05c8:	14000015 	b	e061c <example8+0x64>
   e05cc:	b9001bff 	str	wzr, [sp, #24]
   e05d0:	1400000d 	b	e0604 <example8+0x4c>
   e05d4:	f94007e0 	ldr	x0, [sp, #8]
   e05d8:	b9801be1 	ldrsw	x1, [sp, #24]
   e05dc:	b9801fe2 	ldrsw	x2, [sp, #28]
   e05e0:	d376d442 	lsl	x2, x2, #10
   e05e4:	8b010042 	add	x2, x2, x1
   e05e8:	d2890001 	mov	x1, #0x4800                	// #18432
   e05ec:	8b010041 	add	x1, x2, x1
   e05f0:	b94007e2 	ldr	w2, [sp, #4]
   e05f4:	b8217802 	str	w2, [x0, x1, lsl #2]
   e05f8:	b9401be0 	ldr	w0, [sp, #24]
   e05fc:	11000400 	add	w0, w0, #0x1
   e0600:	b9001be0 	str	w0, [sp, #24]
   e0604:	b9401be0 	ldr	w0, [sp, #24]
   e0608:	710ffc1f 	cmp	w0, #0x3ff
   e060c:	54fffe4d 	b.le	e05d4 <example8+0x1c>
   e0610:	b9401fe0 	ldr	w0, [sp, #28]
   e0614:	11000400 	add	w0, w0, #0x1
   e0618:	b9001fe0 	str	w0, [sp, #28]
   e061c:	b9401fe0 	ldr	w0, [sp, #28]
   e0620:	71007c1f 	cmp	w0, #0x1f
   e0624:	54fffd4d 	b.le	e05cc <example8+0x14>
   e0628:	d503201f 	nop
   e062c:	d503201f 	nop
   e0630:	910083ff 	add	sp, sp, #0x20
   e0634:	d65f03c0 	ret

00000000000e0638 <example9>:
   e0638:	d10083ff 	sub	sp, sp, #0x20
   e063c:	f90007e0 	str	x0, [sp, #8]
   e0640:	f90003e1 	str	x1, [sp]
   e0644:	b9001bff 	str	wzr, [sp, #24]
   e0648:	b9001fff 	str	wzr, [sp, #28]
   e064c:	14000012 	b	e0694 <example9+0x5c>
   e0650:	f94007e0 	ldr	x0, [sp, #8]
   e0654:	b9801fe2 	ldrsw	x2, [sp, #28]
   e0658:	d2830001 	mov	x1, #0x1800                	// #6144
   e065c:	8b010041 	add	x1, x2, x1
   e0660:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e0664:	f94007e0 	ldr	x0, [sp, #8]
   e0668:	b9801fe3 	ldrsw	x3, [sp, #28]
   e066c:	d2838002 	mov	x2, #0x1c00                	// #7168
   e0670:	8b020062 	add	x2, x3, x2
   e0674:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e0678:	4b000020 	sub	w0, w1, w0
   e067c:	b9401be1 	ldr	w1, [sp, #24]
   e0680:	0b000020 	add	w0, w1, w0
   e0684:	b9001be0 	str	w0, [sp, #24]
   e0688:	b9401fe0 	ldr	w0, [sp, #28]
   e068c:	11000400 	add	w0, w0, #0x1
   e0690:	b9001fe0 	str	w0, [sp, #28]
   e0694:	b9401fe0 	ldr	w0, [sp, #28]
   e0698:	710ffc1f 	cmp	w0, #0x3ff
   e069c:	54fffdad 	b.le	e0650 <example9+0x18>
   e06a0:	f94003e0 	ldr	x0, [sp]
   e06a4:	b9401be1 	ldr	w1, [sp, #24]
   e06a8:	b9000001 	str	w1, [x0]
   e06ac:	d503201f 	nop
   e06b0:	910083ff 	add	sp, sp, #0x20
   e06b4:	d65f03c0 	ret

00000000000e06b8 <example10a>:
   e06b8:	d10143ff 	sub	sp, sp, #0x50
   e06bc:	f9001fe0 	str	x0, [sp, #56]
   e06c0:	f9001be1 	str	x1, [sp, #48]
   e06c4:	f90017e2 	str	x2, [sp, #40]
   e06c8:	f90013e3 	str	x3, [sp, #32]
   e06cc:	f9000fe4 	str	x4, [sp, #24]
   e06d0:	f9000be5 	str	x5, [sp, #16]
   e06d4:	f90007e6 	str	x6, [sp, #8]
   e06d8:	b9004fff 	str	wzr, [sp, #76]
   e06dc:	14000023 	b	e0768 <example10a+0xb0>
   e06e0:	f9401fe0 	ldr	x0, [sp, #56]
   e06e4:	b9804fe1 	ldrsw	x1, [sp, #76]
   e06e8:	91400421 	add	x1, x1, #0x1, lsl #12
   e06ec:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e06f0:	f9401fe0 	ldr	x0, [sp, #56]
   e06f4:	b9804fe3 	ldrsw	x3, [sp, #76]
   e06f8:	d2828002 	mov	x2, #0x1400                	// #5120
   e06fc:	8b020062 	add	x2, x3, x2
   e0700:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e0704:	0b000022 	add	w2, w1, w0
   e0708:	f9401fe0 	ldr	x0, [sp, #56]
   e070c:	b9804fe1 	ldrsw	x1, [sp, #76]
   e0710:	91300021 	add	x1, x1, #0xc00
   e0714:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0718:	f9401fe0 	ldr	x0, [sp, #56]
   e071c:	b9804fe1 	ldrsw	x1, [sp, #76]
   e0720:	91200021 	add	x1, x1, #0x800
   e0724:	78e17800 	ldrsh	w0, [x0, x1, lsl #1]
   e0728:	12003c01 	and	w1, w0, #0xffff
   e072c:	f9401fe0 	ldr	x0, [sp, #56]
   e0730:	b9804fe2 	ldrsw	x2, [sp, #76]
   e0734:	91300042 	add	x2, x2, #0xc00
   e0738:	78e27800 	ldrsh	w0, [x0, x2, lsl #1]
   e073c:	12003c00 	and	w0, w0, #0xffff
   e0740:	0b000020 	add	w0, w1, w0
   e0744:	12003c00 	and	w0, w0, #0xffff
   e0748:	13003c02 	sxth	w2, w0
   e074c:	f9401fe0 	ldr	x0, [sp, #56]
   e0750:	b9804fe1 	ldrsw	x1, [sp, #76]
   e0754:	91100021 	add	x1, x1, #0x400
   e0758:	78217802 	strh	w2, [x0, x1, lsl #1]
   e075c:	b9404fe0 	ldr	w0, [sp, #76]
   e0760:	11000400 	add	w0, w0, #0x1
   e0764:	b9004fe0 	str	w0, [sp, #76]
   e0768:	b9404fe0 	ldr	w0, [sp, #76]
   e076c:	710ffc1f 	cmp	w0, #0x3ff
   e0770:	54fffb8d 	b.le	e06e0 <example10a+0x28>
   e0774:	d503201f 	nop
   e0778:	d503201f 	nop
   e077c:	910143ff 	add	sp, sp, #0x50
   e0780:	d65f03c0 	ret

00000000000e0784 <example10b>:
   e0784:	d10143ff 	sub	sp, sp, #0x50
   e0788:	f9001fe0 	str	x0, [sp, #56]
   e078c:	f9001be1 	str	x1, [sp, #48]
   e0790:	f90017e2 	str	x2, [sp, #40]
   e0794:	f90013e3 	str	x3, [sp, #32]
   e0798:	f9000fe4 	str	x4, [sp, #24]
   e079c:	f9000be5 	str	x5, [sp, #16]
   e07a0:	f90007e6 	str	x6, [sp, #8]
   e07a4:	b9004fff 	str	wzr, [sp, #76]
   e07a8:	1400000d 	b	e07dc <example10b+0x58>
   e07ac:	f9401fe0 	ldr	x0, [sp, #56]
   e07b0:	b9804fe1 	ldrsw	x1, [sp, #76]
   e07b4:	91200021 	add	x1, x1, #0x800
   e07b8:	78e17800 	ldrsh	w0, [x0, x1, lsl #1]
   e07bc:	2a0003e2 	mov	w2, w0
   e07c0:	f9401fe0 	ldr	x0, [sp, #56]
   e07c4:	b9804fe1 	ldrsw	x1, [sp, #76]
   e07c8:	91300021 	add	x1, x1, #0xc00
   e07cc:	b8217802 	str	w2, [x0, x1, lsl #2]
   e07d0:	b9404fe0 	ldr	w0, [sp, #76]
   e07d4:	11000400 	add	w0, w0, #0x1
   e07d8:	b9004fe0 	str	w0, [sp, #76]
   e07dc:	b9404fe0 	ldr	w0, [sp, #76]
   e07e0:	710ffc1f 	cmp	w0, #0x3ff
   e07e4:	54fffe4d 	b.le	e07ac <example10b+0x28>
   e07e8:	d503201f 	nop
   e07ec:	d503201f 	nop
   e07f0:	910143ff 	add	sp, sp, #0x50
   e07f4:	d65f03c0 	ret

00000000000e07f8 <example11>:
   e07f8:	d10083ff 	sub	sp, sp, #0x20
   e07fc:	f90007e0 	str	x0, [sp, #8]
   e0800:	b9001fff 	str	wzr, [sp, #28]
   e0804:	1400004b 	b	e0930 <example11+0x138>
   e0808:	b9401fe0 	ldr	w0, [sp, #28]
   e080c:	531f7800 	lsl	w0, w0, #1
   e0810:	11000401 	add	w1, w0, #0x1
   e0814:	f94007e0 	ldr	x0, [sp, #8]
   e0818:	93407c21 	sxtw	x1, w1
   e081c:	91400c21 	add	x1, x1, #0x3, lsl #12
   e0820:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e0824:	b9401fe0 	ldr	w0, [sp, #28]
   e0828:	531f7800 	lsl	w0, w0, #1
   e082c:	11000402 	add	w2, w0, #0x1
   e0830:	f94007e0 	ldr	x0, [sp, #8]
   e0834:	93407c43 	sxtw	x3, w2
   e0838:	d2870002 	mov	x2, #0x3800                	// #14336
   e083c:	8b020062 	add	x2, x3, x2
   e0840:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e0844:	1b007c21 	mul	w1, w1, w0
   e0848:	b9401fe0 	ldr	w0, [sp, #28]
   e084c:	531f7802 	lsl	w2, w0, #1
   e0850:	f94007e0 	ldr	x0, [sp, #8]
   e0854:	93407c42 	sxtw	x2, w2
   e0858:	91400c42 	add	x2, x2, #0x3, lsl #12
   e085c:	b8627802 	ldr	w2, [x0, x2, lsl #2]
   e0860:	b9401fe0 	ldr	w0, [sp, #28]
   e0864:	531f7803 	lsl	w3, w0, #1
   e0868:	f94007e0 	ldr	x0, [sp, #8]
   e086c:	93407c64 	sxtw	x4, w3
   e0870:	d2870003 	mov	x3, #0x3800                	// #14336
   e0874:	8b030083 	add	x3, x4, x3
   e0878:	b8637800 	ldr	w0, [x0, x3, lsl #2]
   e087c:	1b007c40 	mul	w0, w2, w0
   e0880:	4b000022 	sub	w2, w1, w0
   e0884:	f94007e0 	ldr	x0, [sp, #8]
   e0888:	b9801fe3 	ldrsw	x3, [sp, #28]
   e088c:	d2850001 	mov	x1, #0x2800                	// #10240
   e0890:	8b010061 	add	x1, x3, x1
   e0894:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0898:	b9401fe0 	ldr	w0, [sp, #28]
   e089c:	531f7801 	lsl	w1, w0, #1
   e08a0:	f94007e0 	ldr	x0, [sp, #8]
   e08a4:	93407c21 	sxtw	x1, w1
   e08a8:	91400c21 	add	x1, x1, #0x3, lsl #12
   e08ac:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e08b0:	b9401fe0 	ldr	w0, [sp, #28]
   e08b4:	531f7800 	lsl	w0, w0, #1
   e08b8:	11000402 	add	w2, w0, #0x1
   e08bc:	f94007e0 	ldr	x0, [sp, #8]
   e08c0:	93407c43 	sxtw	x3, w2
   e08c4:	d2870002 	mov	x2, #0x3800                	// #14336
   e08c8:	8b020062 	add	x2, x3, x2
   e08cc:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e08d0:	1b007c21 	mul	w1, w1, w0
   e08d4:	b9401fe0 	ldr	w0, [sp, #28]
   e08d8:	531f7800 	lsl	w0, w0, #1
   e08dc:	11000402 	add	w2, w0, #0x1
   e08e0:	f94007e0 	ldr	x0, [sp, #8]
   e08e4:	93407c42 	sxtw	x2, w2
   e08e8:	91400c42 	add	x2, x2, #0x3, lsl #12
   e08ec:	b8627802 	ldr	w2, [x0, x2, lsl #2]
   e08f0:	b9401fe0 	ldr	w0, [sp, #28]
   e08f4:	531f7803 	lsl	w3, w0, #1
   e08f8:	f94007e0 	ldr	x0, [sp, #8]
   e08fc:	93407c64 	sxtw	x4, w3
   e0900:	d2870003 	mov	x3, #0x3800                	// #14336
   e0904:	8b030083 	add	x3, x4, x3
   e0908:	b8637800 	ldr	w0, [x0, x3, lsl #2]
   e090c:	1b007c40 	mul	w0, w2, w0
   e0910:	0b000022 	add	w2, w1, w0
   e0914:	f94007e0 	ldr	x0, [sp, #8]
   e0918:	b9801fe1 	ldrsw	x1, [sp, #28]
   e091c:	91401021 	add	x1, x1, #0x4, lsl #12
   e0920:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0924:	b9401fe0 	ldr	w0, [sp, #28]
   e0928:	11000400 	add	w0, w0, #0x1
   e092c:	b9001fe0 	str	w0, [sp, #28]
   e0930:	b9401fe0 	ldr	w0, [sp, #28]
   e0934:	7107fc1f 	cmp	w0, #0x1ff
   e0938:	54fff68d 	b.le	e0808 <example11+0x10>
   e093c:	d503201f 	nop
   e0940:	d503201f 	nop
   e0944:	910083ff 	add	sp, sp, #0x20
   e0948:	d65f03c0 	ret

00000000000e094c <example12>:
   e094c:	d10083ff 	sub	sp, sp, #0x20
   e0950:	f90007e0 	str	x0, [sp, #8]
   e0954:	b9001fff 	str	wzr, [sp, #28]
   e0958:	1400000a 	b	e0980 <example12+0x34>
   e095c:	f94007e0 	ldr	x0, [sp, #8]
   e0960:	b9801fe2 	ldrsw	x2, [sp, #28]
   e0964:	d2850001 	mov	x1, #0x2800                	// #10240
   e0968:	8b010041 	add	x1, x2, x1
   e096c:	b9401fe2 	ldr	w2, [sp, #28]
   e0970:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0974:	b9401fe0 	ldr	w0, [sp, #28]
   e0978:	11000400 	add	w0, w0, #0x1
   e097c:	b9001fe0 	str	w0, [sp, #28]
   e0980:	b9401fe0 	ldr	w0, [sp, #28]
   e0984:	710ffc1f 	cmp	w0, #0x3ff
   e0988:	54fffead 	b.le	e095c <example12+0x10>
   e098c:	d503201f 	nop
   e0990:	d503201f 	nop
   e0994:	910083ff 	add	sp, sp, #0x20
   e0998:	d65f03c0 	ret

00000000000e099c <example13>:
   e099c:	d100c3ff 	sub	sp, sp, #0x30
   e09a0:	f9000fe0 	str	x0, [sp, #24]
   e09a4:	f9000be1 	str	x1, [sp, #16]
   e09a8:	f90007e2 	str	x2, [sp, #8]
   e09ac:	f90003e3 	str	x3, [sp]
   e09b0:	b9002fff 	str	wzr, [sp, #44]
   e09b4:	14000029 	b	e0a58 <example13+0xbc>
   e09b8:	b90027ff 	str	wzr, [sp, #36]
   e09bc:	b9002bff 	str	wzr, [sp, #40]
   e09c0:	1400001a 	b	e0a28 <example13+0x8c>
   e09c4:	b9802fe0 	ldrsw	x0, [sp, #44]
   e09c8:	d37df000 	lsl	x0, x0, #3
   e09cc:	f9400be1 	ldr	x1, [sp, #16]
   e09d0:	8b000020 	add	x0, x1, x0
   e09d4:	f9400001 	ldr	x1, [x0]
   e09d8:	b9802be0 	ldrsw	x0, [sp, #40]
   e09dc:	d37ef400 	lsl	x0, x0, #2
   e09e0:	8b000020 	add	x0, x1, x0
   e09e4:	b9400001 	ldr	w1, [x0]
   e09e8:	b9802fe0 	ldrsw	x0, [sp, #44]
   e09ec:	d37df000 	lsl	x0, x0, #3
   e09f0:	f94007e2 	ldr	x2, [sp, #8]
   e09f4:	8b000040 	add	x0, x2, x0
   e09f8:	f9400002 	ldr	x2, [x0]
   e09fc:	b9802be0 	ldrsw	x0, [sp, #40]
   e0a00:	d37ef400 	lsl	x0, x0, #2
   e0a04:	8b000040 	add	x0, x2, x0
   e0a08:	b9400000 	ldr	w0, [x0]
   e0a0c:	4b000020 	sub	w0, w1, w0
   e0a10:	b94027e1 	ldr	w1, [sp, #36]
   e0a14:	0b000020 	add	w0, w1, w0
   e0a18:	b90027e0 	str	w0, [sp, #36]
   e0a1c:	b9402be0 	ldr	w0, [sp, #40]
   e0a20:	11002000 	add	w0, w0, #0x8
   e0a24:	b9002be0 	str	w0, [sp, #40]
   e0a28:	b9402be0 	ldr	w0, [sp, #40]
   e0a2c:	710ffc1f 	cmp	w0, #0x3ff
   e0a30:	54fffcad 	b.le	e09c4 <example13+0x28>
   e0a34:	b9802fe0 	ldrsw	x0, [sp, #44]
   e0a38:	d37ef400 	lsl	x0, x0, #2
   e0a3c:	f94003e1 	ldr	x1, [sp]
   e0a40:	8b000020 	add	x0, x1, x0
   e0a44:	b94027e1 	ldr	w1, [sp, #36]
   e0a48:	b9000001 	str	w1, [x0]
   e0a4c:	b9402fe0 	ldr	w0, [sp, #44]
   e0a50:	11000400 	add	w0, w0, #0x1
   e0a54:	b9002fe0 	str	w0, [sp, #44]
   e0a58:	b9402fe0 	ldr	w0, [sp, #44]
   e0a5c:	71007c1f 	cmp	w0, #0x1f
   e0a60:	54fffacd 	b.le	e09b8 <example13+0x1c>
   e0a64:	d503201f 	nop
   e0a68:	d503201f 	nop
   e0a6c:	9100c3ff 	add	sp, sp, #0x30
   e0a70:	d65f03c0 	ret

00000000000e0a74 <example14>:
   e0a74:	d100c3ff 	sub	sp, sp, #0x30
   e0a78:	f9000fe0 	str	x0, [sp, #24]
   e0a7c:	f9000be1 	str	x1, [sp, #16]
   e0a80:	f90007e2 	str	x2, [sp, #8]
   e0a84:	f90003e3 	str	x3, [sp]
   e0a88:	b90027ff 	str	wzr, [sp, #36]
   e0a8c:	b9002fff 	str	wzr, [sp, #44]
   e0a90:	14000034 	b	e0b60 <example14+0xec>
   e0a94:	b90023ff 	str	wzr, [sp, #32]
   e0a98:	b9002bff 	str	wzr, [sp, #40]
   e0a9c:	14000025 	b	e0b30 <example14+0xbc>
   e0aa0:	b90027ff 	str	wzr, [sp, #36]
   e0aa4:	1400001d 	b	e0b18 <example14+0xa4>
   e0aa8:	b94027e1 	ldr	w1, [sp, #36]
   e0aac:	b9402fe0 	ldr	w0, [sp, #44]
   e0ab0:	0b000020 	add	w0, w1, w0
   e0ab4:	93407c00 	sxtw	x0, w0
   e0ab8:	d37df000 	lsl	x0, x0, #3
   e0abc:	f9400be1 	ldr	x1, [sp, #16]
   e0ac0:	8b000020 	add	x0, x1, x0
   e0ac4:	f9400001 	ldr	x1, [x0]
   e0ac8:	b9802be0 	ldrsw	x0, [sp, #40]
   e0acc:	d37ef400 	lsl	x0, x0, #2
   e0ad0:	8b000020 	add	x0, x1, x0
   e0ad4:	b9400001 	ldr	w1, [x0]
   e0ad8:	b98027e0 	ldrsw	x0, [sp, #36]
   e0adc:	d37df000 	lsl	x0, x0, #3
   e0ae0:	f94007e2 	ldr	x2, [sp, #8]
   e0ae4:	8b000040 	add	x0, x2, x0
   e0ae8:	f9400002 	ldr	x2, [x0]
   e0aec:	b9802be0 	ldrsw	x0, [sp, #40]
   e0af0:	d37ef400 	lsl	x0, x0, #2
   e0af4:	8b000040 	add	x0, x2, x0
   e0af8:	b9400000 	ldr	w0, [x0]
   e0afc:	1b007c20 	mul	w0, w1, w0
   e0b00:	b94023e1 	ldr	w1, [sp, #32]
   e0b04:	0b000020 	add	w0, w1, w0
   e0b08:	b90023e0 	str	w0, [sp, #32]
   e0b0c:	b94027e0 	ldr	w0, [sp, #36]
   e0b10:	11000400 	add	w0, w0, #0x1
   e0b14:	b90027e0 	str	w0, [sp, #36]
   e0b18:	b94027e0 	ldr	w0, [sp, #36]
   e0b1c:	710ffc1f 	cmp	w0, #0x3ff
   e0b20:	54fffc4d 	b.le	e0aa8 <example14+0x34>
   e0b24:	b9402be0 	ldr	w0, [sp, #40]
   e0b28:	11000400 	add	w0, w0, #0x1
   e0b2c:	b9002be0 	str	w0, [sp, #40]
   e0b30:	b9402be0 	ldr	w0, [sp, #40]
   e0b34:	71007c1f 	cmp	w0, #0x1f
   e0b38:	54fffb4d 	b.le	e0aa0 <example14+0x2c>
   e0b3c:	b9802fe0 	ldrsw	x0, [sp, #44]
   e0b40:	d37ef400 	lsl	x0, x0, #2
   e0b44:	f94003e1 	ldr	x1, [sp]
   e0b48:	8b000020 	add	x0, x1, x0
   e0b4c:	b94023e1 	ldr	w1, [sp, #32]
   e0b50:	b9000001 	str	w1, [x0]
   e0b54:	b9402fe0 	ldr	w0, [sp, #44]
   e0b58:	11000400 	add	w0, w0, #0x1
   e0b5c:	b9002fe0 	str	w0, [sp, #44]
   e0b60:	b9402fe0 	ldr	w0, [sp, #44]
   e0b64:	71000c1f 	cmp	w0, #0x3
   e0b68:	54fff96d 	b.le	e0a94 <example14+0x20>
   e0b6c:	d503201f 	nop
   e0b70:	d503201f 	nop
   e0b74:	9100c3ff 	add	sp, sp, #0x30
   e0b78:	d65f03c0 	ret

00000000000e0b7c <example23>:
   e0b7c:	d100c3ff 	sub	sp, sp, #0x30
   e0b80:	f9000fe0 	str	x0, [sp, #24]
   e0b84:	f9000be1 	str	x1, [sp, #16]
   e0b88:	f90007e2 	str	x2, [sp, #8]
   e0b8c:	b9002fff 	str	wzr, [sp, #44]
   e0b90:	1400000e 	b	e0bc8 <example23+0x4c>
   e0b94:	f9400be0 	ldr	x0, [sp, #16]
   e0b98:	91000801 	add	x1, x0, #0x2
   e0b9c:	f9000be1 	str	x1, [sp, #16]
   e0ba0:	79400000 	ldrh	w0, [x0]
   e0ba4:	2a0003e2 	mov	w2, w0
   e0ba8:	f94007e0 	ldr	x0, [sp, #8]
   e0bac:	91001001 	add	x1, x0, #0x4
   e0bb0:	f90007e1 	str	x1, [sp, #8]
   e0bb4:	53196041 	lsl	w1, w2, #7
   e0bb8:	b9000001 	str	w1, [x0]
   e0bbc:	b9402fe0 	ldr	w0, [sp, #44]
   e0bc0:	11000400 	add	w0, w0, #0x1
   e0bc4:	b9002fe0 	str	w0, [sp, #44]
   e0bc8:	b9402fe0 	ldr	w0, [sp, #44]
   e0bcc:	7103fc1f 	cmp	w0, #0xff
   e0bd0:	54fffe2d 	b.le	e0b94 <example23+0x18>
   e0bd4:	d503201f 	nop
   e0bd8:	d503201f 	nop
   e0bdc:	9100c3ff 	add	sp, sp, #0x30
   e0be0:	d65f03c0 	ret

00000000000e0be4 <init_memory>:
   e0be4:	d10083ff 	sub	sp, sp, #0x20
   e0be8:	f90007e0 	str	x0, [sp, #8]
   e0bec:	f90003e1 	str	x1, [sp]
   e0bf0:	52800020 	mov	w0, #0x1                   	// #1
   e0bf4:	39007fe0 	strb	w0, [sp, #31]
   e0bf8:	14000013 	b	e0c44 <init_memory+0x60>
   e0bfc:	39407fe1 	ldrb	w1, [sp, #31]
   e0c00:	2a0103e0 	mov	w0, w1
   e0c04:	531d1000 	ubfiz	w0, w0, #3, #5
   e0c08:	4b010000 	sub	w0, w0, w1
   e0c0c:	39007fe0 	strb	w0, [sp, #31]
   e0c10:	39407fe1 	ldrb	w1, [sp, #31]
   e0c14:	528004e0 	mov	w0, #0x27                  	// #39
   e0c18:	4a000020 	eor	w0, w1, w0
   e0c1c:	39007fe0 	strb	w0, [sp, #31]
   e0c20:	39407fe0 	ldrb	w0, [sp, #31]
   e0c24:	11000400 	add	w0, w0, #0x1
   e0c28:	39007fe0 	strb	w0, [sp, #31]
   e0c2c:	f94007e0 	ldr	x0, [sp, #8]
   e0c30:	39407fe1 	ldrb	w1, [sp, #31]
   e0c34:	39000001 	strb	w1, [x0]
   e0c38:	f94007e0 	ldr	x0, [sp, #8]
   e0c3c:	91000400 	add	x0, x0, #0x1
   e0c40:	f90007e0 	str	x0, [sp, #8]
   e0c44:	f94007e1 	ldr	x1, [sp, #8]
   e0c48:	f94003e0 	ldr	x0, [sp]
   e0c4c:	eb00003f 	cmp	x1, x0
   e0c50:	54fffd61 	b.ne	e0bfc <init_memory+0x18>  // b.any
   e0c54:	d503201f 	nop
   e0c58:	d503201f 	nop
   e0c5c:	910083ff 	add	sp, sp, #0x20
   e0c60:	d65f03c0 	ret

00000000000e0c64 <digest_memory>:
   e0c64:	d10083ff 	sub	sp, sp, #0x20
   e0c68:	f90007e0 	str	x0, [sp, #8]
   e0c6c:	f90003e1 	str	x1, [sp]
   e0c70:	52800020 	mov	w0, #0x1                   	// #1
   e0c74:	b9001fe0 	str	w0, [sp, #28]
   e0c78:	14000015 	b	e0ccc <digest_memory+0x68>
   e0c7c:	b9401fe1 	ldr	w1, [sp, #28]
   e0c80:	2a0103e0 	mov	w0, w1
   e0c84:	531f7800 	lsl	w0, w0, #1
   e0c88:	0b010000 	add	w0, w0, w1
   e0c8c:	b9001fe0 	str	w0, [sp, #28]
   e0c90:	f94007e0 	ldr	x0, [sp, #8]
   e0c94:	39400000 	ldrb	w0, [x0]
   e0c98:	2a0003e1 	mov	w1, w0
   e0c9c:	b9401fe0 	ldr	w0, [sp, #28]
   e0ca0:	4a010000 	eor	w0, w0, w1
   e0ca4:	b9001fe0 	str	w0, [sp, #28]
   e0ca8:	b9401fe0 	ldr	w0, [sp, #28]
   e0cac:	53087c01 	lsr	w1, w0, #8
   e0cb0:	b9401fe0 	ldr	w0, [sp, #28]
   e0cb4:	53185c00 	lsl	w0, w0, #8
   e0cb8:	4a000020 	eor	w0, w1, w0
   e0cbc:	b9001fe0 	str	w0, [sp, #28]
   e0cc0:	f94007e0 	ldr	x0, [sp, #8]
   e0cc4:	91000400 	add	x0, x0, #0x1
   e0cc8:	f90007e0 	str	x0, [sp, #8]
   e0ccc:	f94007e1 	ldr	x1, [sp, #8]
   e0cd0:	f94003e0 	ldr	x0, [sp]
   e0cd4:	eb00003f 	cmp	x1, x0
   e0cd8:	54fffd21 	b.ne	e0c7c <digest_memory+0x18>  // b.any
   e0cdc:	b9401fe0 	ldr	w0, [sp, #28]
   e0ce0:	910083ff 	add	sp, sp, #0x20
   e0ce4:	d65f03c0 	ret

00000000000e0ce8 <memcpy>:
   e0ce8:	d100c3ff 	sub	sp, sp, #0x30
   e0cec:	f9000fe0 	str	x0, [sp, #24]
   e0cf0:	f9000be1 	str	x1, [sp, #16]
   e0cf4:	f90007e2 	str	x2, [sp, #8]
   e0cf8:	f90017ff 	str	xzr, [sp, #40]
   e0cfc:	1400000c 	b	e0d2c <memcpy+0x44>
   e0d00:	f9400be1 	ldr	x1, [sp, #16]
   e0d04:	f94017e0 	ldr	x0, [sp, #40]
   e0d08:	8b000021 	add	x1, x1, x0
   e0d0c:	f9400fe2 	ldr	x2, [sp, #24]
   e0d10:	f94017e0 	ldr	x0, [sp, #40]
   e0d14:	8b000040 	add	x0, x2, x0
   e0d18:	39400021 	ldrb	w1, [x1]
   e0d1c:	39000001 	strb	w1, [x0]
   e0d20:	f94017e0 	ldr	x0, [sp, #40]
   e0d24:	91000400 	add	x0, x0, #0x1
   e0d28:	f90017e0 	str	x0, [sp, #40]
   e0d2c:	f94017e1 	ldr	x1, [sp, #40]
   e0d30:	f94007e0 	ldr	x0, [sp, #8]
   e0d34:	eb00003f 	cmp	x1, x0
   e0d38:	54fffe41 	b.ne	e0d00 <memcpy+0x18>  // b.any
   e0d3c:	f9400fe0 	ldr	x0, [sp, #24]
   e0d40:	9100c3ff 	add	sp, sp, #0x30
   e0d44:	d65f03c0 	ret

00000000000e0d48 <memset>:
   e0d48:	d100c3ff 	sub	sp, sp, #0x30
   e0d4c:	f9000fe0 	str	x0, [sp, #24]
   e0d50:	b90017e1 	str	w1, [sp, #20]
   e0d54:	f90007e2 	str	x2, [sp, #8]
   e0d58:	f90017ff 	str	xzr, [sp, #40]
   e0d5c:	1400000a 	b	e0d84 <memset+0x3c>
   e0d60:	f9400fe1 	ldr	x1, [sp, #24]
   e0d64:	f94017e0 	ldr	x0, [sp, #40]
   e0d68:	8b000020 	add	x0, x1, x0
   e0d6c:	b94017e1 	ldr	w1, [sp, #20]
   e0d70:	12001c21 	and	w1, w1, #0xff
   e0d74:	39000001 	strb	w1, [x0]
   e0d78:	f94017e0 	ldr	x0, [sp, #40]
   e0d7c:	91000400 	add	x0, x0, #0x1
   e0d80:	f90017e0 	str	x0, [sp, #40]
   e0d84:	f94017e1 	ldr	x1, [sp, #40]
   e0d88:	f94007e0 	ldr	x0, [sp, #8]
   e0d8c:	eb00003f 	cmp	x1, x0
   e0d90:	54fffe81 	b.ne	e0d60 <memset+0x18>  // b.any
   e0d94:	f9400fe0 	ldr	x0, [sp, #24]
   e0d98:	9100c3ff 	add	sp, sp, #0x30
   e0d9c:	d65f03c0 	ret

00000000000e0da0 <memmove>:
   e0da0:	d100c3ff 	sub	sp, sp, #0x30
   e0da4:	f9000fe0 	str	x0, [sp, #24]
   e0da8:	f9000be1 	str	x1, [sp, #16]
   e0dac:	f90007e2 	str	x2, [sp, #8]
   e0db0:	f94007e0 	ldr	x0, [sp, #8]
   e0db4:	f90017e0 	str	x0, [sp, #40]
   e0db8:	1400000e 	b	e0df0 <memmove+0x50>
   e0dbc:	f94017e0 	ldr	x0, [sp, #40]
   e0dc0:	d1000400 	sub	x0, x0, #0x1
   e0dc4:	f9400be1 	ldr	x1, [sp, #16]
   e0dc8:	8b000021 	add	x1, x1, x0
   e0dcc:	f94017e0 	ldr	x0, [sp, #40]
   e0dd0:	d1000400 	sub	x0, x0, #0x1
   e0dd4:	f9400fe2 	ldr	x2, [sp, #24]
   e0dd8:	8b000040 	add	x0, x2, x0
   e0ddc:	39400021 	ldrb	w1, [x1]
   e0de0:	39000001 	strb	w1, [x0]
   e0de4:	f94017e0 	ldr	x0, [sp, #40]
   e0de8:	d1000400 	sub	x0, x0, #0x1
   e0dec:	f90017e0 	str	x0, [sp, #40]
   e0df0:	f94017e0 	ldr	x0, [sp, #40]
   e0df4:	f100001f 	cmp	x0, #0x0
   e0df8:	54fffe21 	b.ne	e0dbc <memmove+0x1c>  // b.any
   e0dfc:	f9400fe0 	ldr	x0, [sp, #24]
   e0e00:	9100c3ff 	add	sp, sp, #0x30
   e0e04:	d65f03c0 	ret
