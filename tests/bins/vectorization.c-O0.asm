
vectorization.c.elf:     file format elf64-littleaarch64


Disassembly of section .start:

00000000000e0000 <_start>:
   e0000:	d10203ff 	sub	sp, sp, #0x80
   e0004:	d140cbff 	sub	sp, sp, #0x32, lsl #12
   e0008:	a9007bfd 	stp	x29, x30, [sp]
   e000c:	910003fd 	mov	x29, sp
   e0010:	f9000bf3 	str	x19, [sp, #16]
   e0014:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0018:	b920401f 	str	wzr, [x0, #8256]
   e001c:	b9002fff 	str	wzr, [sp, #44]
   e0020:	52808000 	mov	w0, #0x400                 	// #1024
   e0024:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0028:	b9203c20 	str	w0, [x1, #8252]
   e002c:	9100c3e0 	add	x0, sp, #0x30
   e0030:	91401001 	add	x1, x0, #0x4, lsl #12
   e0034:	9100c3e0 	add	x0, sp, #0x30
   e0038:	91400c00 	add	x0, x0, #0x3, lsl #12
   e003c:	94000522 	bl	e14c4 <init_memory>
   e0040:	9100c3e0 	add	x0, sp, #0x30
   e0044:	91401401 	add	x1, x0, #0x5, lsl #12
   e0048:	9100c3e0 	add	x0, sp, #0x30
   e004c:	91401000 	add	x0, x0, #0x4, lsl #12
   e0050:	9400051d 	bl	e14c4 <init_memory>
   e0054:	9100c3e0 	add	x0, sp, #0x30
   e0058:	91401801 	add	x1, x0, #0x6, lsl #12
   e005c:	9100c3e0 	add	x0, sp, #0x30
   e0060:	91401400 	add	x0, x0, #0x5, lsl #12
   e0064:	94000518 	bl	e14c4 <init_memory>
   e0068:	9100c3e0 	add	x0, sp, #0x30
   e006c:	91400401 	add	x1, x0, #0x1, lsl #12
   e0070:	9100c3e0 	add	x0, sp, #0x30
   e0074:	91200000 	add	x0, x0, #0x800
   e0078:	94000513 	bl	e14c4 <init_memory>
   e007c:	9100c3e1 	add	x1, sp, #0x30
   e0080:	d2830000 	mov	x0, #0x1800                	// #6144
   e0084:	8b000021 	add	x1, x1, x0
   e0088:	9100c3e0 	add	x0, sp, #0x30
   e008c:	91400400 	add	x0, x0, #0x1, lsl #12
   e0090:	9400050d 	bl	e14c4 <init_memory>
   e0094:	9100c3e0 	add	x0, sp, #0x30
   e0098:	91400802 	add	x2, x0, #0x2, lsl #12
   e009c:	9100c3e1 	add	x1, sp, #0x30
   e00a0:	d2830000 	mov	x0, #0x1800                	// #6144
   e00a4:	8b000020 	add	x0, x1, x0
   e00a8:	aa0203e1 	mov	x1, x2
   e00ac:	94000506 	bl	e14c4 <init_memory>
   e00b0:	9100c3e0 	add	x0, sp, #0x30
   e00b4:	91403001 	add	x1, x0, #0xc, lsl #12
   e00b8:	9100c3e0 	add	x0, sp, #0x30
   e00bc:	91402800 	add	x0, x0, #0xa, lsl #12
   e00c0:	94000501 	bl	e14c4 <init_memory>
   e00c4:	9100c3e0 	add	x0, sp, #0x30
   e00c8:	91403801 	add	x1, x0, #0xe, lsl #12
   e00cc:	9100c3e0 	add	x0, sp, #0x30
   e00d0:	91403000 	add	x0, x0, #0xc, lsl #12
   e00d4:	940004fc 	bl	e14c4 <init_memory>
   e00d8:	9100c3e0 	add	x0, sp, #0x30
   e00dc:	91404001 	add	x1, x0, #0x10, lsl #12
   e00e0:	9100c3e0 	add	x0, sp, #0x30
   e00e4:	91403800 	add	x0, x0, #0xe, lsl #12
   e00e8:	940004f7 	bl	e14c4 <init_memory>
   e00ec:	9100c3e0 	add	x0, sp, #0x30
   e00f0:	91400c01 	add	x1, x0, #0x3, lsl #12
   e00f4:	9100c3e0 	add	x0, sp, #0x30
   e00f8:	91400800 	add	x0, x0, #0x2, lsl #12
   e00fc:	940004f2 	bl	e14c4 <init_memory>
   e0100:	9100c3e0 	add	x0, sp, #0x30
   e0104:	91401c01 	add	x1, x0, #0x7, lsl #12
   e0108:	9100c3e0 	add	x0, sp, #0x30
   e010c:	91401800 	add	x0, x0, #0x6, lsl #12
   e0110:	940004ed 	bl	e14c4 <init_memory>
   e0114:	9100c3e0 	add	x0, sp, #0x30
   e0118:	91402001 	add	x1, x0, #0x8, lsl #12
   e011c:	9100c3e0 	add	x0, sp, #0x30
   e0120:	91401c00 	add	x0, x0, #0x7, lsl #12
   e0124:	940004e8 	bl	e14c4 <init_memory>
   e0128:	9100c3e0 	add	x0, sp, #0x30
   e012c:	91404c01 	add	x1, x0, #0x13, lsl #12
   e0130:	9100c3e0 	add	x0, sp, #0x30
   e0134:	91404800 	add	x0, x0, #0x12, lsl #12
   e0138:	940004e3 	bl	e14c4 <init_memory>
   e013c:	9100c3e0 	add	x0, sp, #0x30
   e0140:	94000257 	bl	e0a9c <example1>
   e0144:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0148:	b9207c1f 	str	wzr, [x0, #8316]
   e014c:	14000008 	b	e016c <_start+0x16c>
   e0150:	9100c3e0 	add	x0, sp, #0x30
   e0154:	94000252 	bl	e0a9c <example1>
   e0158:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e015c:	b9607c00 	ldr	w0, [x0, #8316]
   e0160:	11000400 	add	w0, w0, #0x1
   e0164:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0168:	b9207c20 	str	w0, [x1, #8316]
   e016c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0170:	b9603c01 	ldr	w1, [x0, #8252]
   e0174:	2a0103e0 	mov	w0, w1
   e0178:	531e7400 	lsl	w0, w0, #2
   e017c:	0b010000 	add	w0, w0, w1
   e0180:	531f7800 	lsl	w0, w0, #1
   e0184:	2a0003e1 	mov	w1, w0
   e0188:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e018c:	b9607c00 	ldr	w0, [x0, #8316]
   e0190:	6b01001f 	cmp	w0, w1
   e0194:	54fffdeb 	b.lt	e0150 <_start+0x150>  // b.tstop
   e0198:	9100c3e1 	add	x1, sp, #0x30
   e019c:	d2948000 	mov	x0, #0xa400                	// #41984
   e01a0:	8b000021 	add	x1, x1, x0
   e01a4:	9100c3e0 	add	x0, sp, #0x30
   e01a8:	91402800 	add	x0, x0, #0xa, lsl #12
   e01ac:	940004e6 	bl	e1544 <digest_memory>
   e01b0:	2a0003e1 	mov	w1, w0
   e01b4:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e01b8:	b9604000 	ldr	w0, [x0, #8256]
   e01bc:	0b010000 	add	w0, w0, w1
   e01c0:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e01c4:	b9204020 	str	w0, [x1, #8256]
   e01c8:	9100c3e0 	add	x0, sp, #0x30
   e01cc:	52800042 	mov	w2, #0x2                   	// #2
   e01d0:	52808001 	mov	w1, #0x400                 	// #1024
   e01d4:	9400024f 	bl	e0b10 <example2a>
   e01d8:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e01dc:	b920781f 	str	wzr, [x0, #8312]
   e01e0:	1400000a 	b	e0208 <_start+0x208>
   e01e4:	9100c3e0 	add	x0, sp, #0x30
   e01e8:	52800042 	mov	w2, #0x2                   	// #2
   e01ec:	52808001 	mov	w1, #0x400                 	// #1024
   e01f0:	94000248 	bl	e0b10 <example2a>
   e01f4:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e01f8:	b9607800 	ldr	w0, [x0, #8312]
   e01fc:	11000400 	add	w0, w0, #0x1
   e0200:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0204:	b9207820 	str	w0, [x1, #8312]
   e0208:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e020c:	b9603c00 	ldr	w0, [x0, #8252]
   e0210:	531e7400 	lsl	w0, w0, #2
   e0214:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0218:	b9607821 	ldr	w1, [x1, #8312]
   e021c:	6b00003f 	cmp	w1, w0
   e0220:	54fffe2b 	b.lt	e01e4 <_start+0x1e4>  // b.tstop
   e0224:	9100c3e0 	add	x0, sp, #0x30
   e0228:	91403401 	add	x1, x0, #0xd, lsl #12
   e022c:	9100c3e0 	add	x0, sp, #0x30
   e0230:	91403000 	add	x0, x0, #0xc, lsl #12
   e0234:	940004c4 	bl	e1544 <digest_memory>
   e0238:	2a0003e1 	mov	w1, w0
   e023c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0240:	b9604000 	ldr	w0, [x0, #8256]
   e0244:	0b010000 	add	w0, w0, w1
   e0248:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e024c:	b9204020 	str	w0, [x1, #8256]
   e0250:	9100c3e0 	add	x0, sp, #0x30
   e0254:	52800042 	mov	w2, #0x2                   	// #2
   e0258:	52808001 	mov	w1, #0x400                 	// #1024
   e025c:	94000243 	bl	e0b68 <example2b>
   e0260:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0264:	b920741f 	str	wzr, [x0, #8308]
   e0268:	1400000a 	b	e0290 <_start+0x290>
   e026c:	9100c3e0 	add	x0, sp, #0x30
   e0270:	52800042 	mov	w2, #0x2                   	// #2
   e0274:	52808001 	mov	w1, #0x400                 	// #1024
   e0278:	9400023c 	bl	e0b68 <example2b>
   e027c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0280:	b9607400 	ldr	w0, [x0, #8308]
   e0284:	11000400 	add	w0, w0, #0x1
   e0288:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e028c:	b9207420 	str	w0, [x1, #8308]
   e0290:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0294:	b9603c00 	ldr	w0, [x0, #8252]
   e0298:	531f7800 	lsl	w0, w0, #1
   e029c:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e02a0:	b9607421 	ldr	w1, [x1, #8308]
   e02a4:	6b00003f 	cmp	w1, w0
   e02a8:	54fffe2b 	b.lt	e026c <_start+0x26c>  // b.tstop
   e02ac:	9100c3e0 	add	x0, sp, #0x30
   e02b0:	91402c01 	add	x1, x0, #0xb, lsl #12
   e02b4:	9100c3e0 	add	x0, sp, #0x30
   e02b8:	91402800 	add	x0, x0, #0xa, lsl #12
   e02bc:	940004a2 	bl	e1544 <digest_memory>
   e02c0:	2a0003e1 	mov	w1, w0
   e02c4:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e02c8:	b9604000 	ldr	w0, [x0, #8256]
   e02cc:	0b010000 	add	w0, w0, w1
   e02d0:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e02d4:	b9204020 	str	w0, [x1, #8256]
   e02d8:	9100c3e0 	add	x0, sp, #0x30
   e02dc:	91401002 	add	x2, x0, #0x4, lsl #12
   e02e0:	9100c3e0 	add	x0, sp, #0x30
   e02e4:	91400c01 	add	x1, x0, #0x3, lsl #12
   e02e8:	9100c3e0 	add	x0, sp, #0x30
   e02ec:	aa0203e3 	mov	x3, x2
   e02f0:	aa0103e2 	mov	x2, x1
   e02f4:	52808001 	mov	w1, #0x400                 	// #1024
   e02f8:	9400023d 	bl	e0bec <example3>
   e02fc:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0300:	b920701f 	str	wzr, [x0, #8304]
   e0304:	1400000f 	b	e0340 <_start+0x340>
   e0308:	9100c3e0 	add	x0, sp, #0x30
   e030c:	91401002 	add	x2, x0, #0x4, lsl #12
   e0310:	9100c3e0 	add	x0, sp, #0x30
   e0314:	91400c01 	add	x1, x0, #0x3, lsl #12
   e0318:	9100c3e0 	add	x0, sp, #0x30
   e031c:	aa0203e3 	mov	x3, x2
   e0320:	aa0103e2 	mov	x2, x1
   e0324:	52808001 	mov	w1, #0x400                 	// #1024
   e0328:	94000231 	bl	e0bec <example3>
   e032c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0330:	b9607000 	ldr	w0, [x0, #8304]
   e0334:	11000400 	add	w0, w0, #0x1
   e0338:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e033c:	b9207020 	str	w0, [x1, #8304]
   e0340:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0344:	b9603c00 	ldr	w0, [x0, #8252]
   e0348:	531f7800 	lsl	w0, w0, #1
   e034c:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0350:	b9607021 	ldr	w1, [x1, #8304]
   e0354:	6b00003f 	cmp	w1, w0
   e0358:	54fffd8b 	b.lt	e0308 <_start+0x308>  // b.tstop
   e035c:	9100c3e0 	add	x0, sp, #0x30
   e0360:	91401001 	add	x1, x0, #0x4, lsl #12
   e0364:	9100c3e0 	add	x0, sp, #0x30
   e0368:	91400c00 	add	x0, x0, #0x3, lsl #12
   e036c:	94000476 	bl	e1544 <digest_memory>
   e0370:	2a0003e1 	mov	w1, w0
   e0374:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0378:	b9604000 	ldr	w0, [x0, #8256]
   e037c:	0b010000 	add	w0, w0, w1
   e0380:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0384:	b9204020 	str	w0, [x1, #8256]
   e0388:	9100c3e0 	add	x0, sp, #0x30
   e038c:	91401002 	add	x2, x0, #0x4, lsl #12
   e0390:	9100c3e0 	add	x0, sp, #0x30
   e0394:	91400c01 	add	x1, x0, #0x3, lsl #12
   e0398:	9100c3e0 	add	x0, sp, #0x30
   e039c:	aa0203e3 	mov	x3, x2
   e03a0:	aa0103e2 	mov	x2, x1
   e03a4:	52808001 	mov	w1, #0x400                 	// #1024
   e03a8:	94000228 	bl	e0c48 <example4a>
   e03ac:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e03b0:	b9206c1f 	str	wzr, [x0, #8300]
   e03b4:	1400000f 	b	e03f0 <_start+0x3f0>
   e03b8:	9100c3e0 	add	x0, sp, #0x30
   e03bc:	91401002 	add	x2, x0, #0x4, lsl #12
   e03c0:	9100c3e0 	add	x0, sp, #0x30
   e03c4:	91400c01 	add	x1, x0, #0x3, lsl #12
   e03c8:	9100c3e0 	add	x0, sp, #0x30
   e03cc:	aa0203e3 	mov	x3, x2
   e03d0:	aa0103e2 	mov	x2, x1
   e03d4:	52808001 	mov	w1, #0x400                 	// #1024
   e03d8:	9400021c 	bl	e0c48 <example4a>
   e03dc:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e03e0:	b9606c00 	ldr	w0, [x0, #8300]
   e03e4:	11000400 	add	w0, w0, #0x1
   e03e8:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e03ec:	b9206c20 	str	w0, [x1, #8300]
   e03f0:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e03f4:	b9603c00 	ldr	w0, [x0, #8252]
   e03f8:	531f7800 	lsl	w0, w0, #1
   e03fc:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0400:	b9606c21 	ldr	w1, [x1, #8300]
   e0404:	6b00003f 	cmp	w1, w0
   e0408:	54fffd8b 	b.lt	e03b8 <_start+0x3b8>  // b.tstop
   e040c:	9100c3e0 	add	x0, sp, #0x30
   e0410:	91401001 	add	x1, x0, #0x4, lsl #12
   e0414:	9100c3e0 	add	x0, sp, #0x30
   e0418:	91400c00 	add	x0, x0, #0x3, lsl #12
   e041c:	9400044a 	bl	e1544 <digest_memory>
   e0420:	2a0003e1 	mov	w1, w0
   e0424:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0428:	b9604000 	ldr	w0, [x0, #8256]
   e042c:	0b010000 	add	w0, w0, w1
   e0430:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0434:	b9204020 	str	w0, [x1, #8256]
   e0438:	9100c3e0 	add	x0, sp, #0x30
   e043c:	91401002 	add	x2, x0, #0x4, lsl #12
   e0440:	9100c3e0 	add	x0, sp, #0x30
   e0444:	91400c01 	add	x1, x0, #0x3, lsl #12
   e0448:	9100c3e0 	add	x0, sp, #0x30
   e044c:	aa0203e3 	mov	x3, x2
   e0450:	aa0103e2 	mov	x2, x1
   e0454:	52807ec1 	mov	w1, #0x3f6                 	// #1014
   e0458:	94000214 	bl	e0ca8 <example4b>
   e045c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0460:	b920681f 	str	wzr, [x0, #8296]
   e0464:	1400000f 	b	e04a0 <_start+0x4a0>
   e0468:	9100c3e0 	add	x0, sp, #0x30
   e046c:	91401002 	add	x2, x0, #0x4, lsl #12
   e0470:	9100c3e0 	add	x0, sp, #0x30
   e0474:	91400c01 	add	x1, x0, #0x3, lsl #12
   e0478:	9100c3e0 	add	x0, sp, #0x30
   e047c:	aa0203e3 	mov	x3, x2
   e0480:	aa0103e2 	mov	x2, x1
   e0484:	52807ec1 	mov	w1, #0x3f6                 	// #1014
   e0488:	94000208 	bl	e0ca8 <example4b>
   e048c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0490:	b9606800 	ldr	w0, [x0, #8296]
   e0494:	11000400 	add	w0, w0, #0x1
   e0498:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e049c:	b9206820 	str	w0, [x1, #8296]
   e04a0:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e04a4:	b9603c00 	ldr	w0, [x0, #8252]
   e04a8:	531f7800 	lsl	w0, w0, #1
   e04ac:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e04b0:	b9606821 	ldr	w1, [x1, #8296]
   e04b4:	6b00003f 	cmp	w1, w0
   e04b8:	54fffd8b 	b.lt	e0468 <_start+0x468>  // b.tstop
   e04bc:	9100c3e0 	add	x0, sp, #0x30
   e04c0:	91401001 	add	x1, x0, #0x4, lsl #12
   e04c4:	9100c3e0 	add	x0, sp, #0x30
   e04c8:	91400c00 	add	x0, x0, #0x3, lsl #12
   e04cc:	9400041e 	bl	e1544 <digest_memory>
   e04d0:	2a0003e1 	mov	w1, w0
   e04d4:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e04d8:	b9604000 	ldr	w0, [x0, #8256]
   e04dc:	0b010000 	add	w0, w0, w1
   e04e0:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e04e4:	b9204020 	str	w0, [x1, #8256]
   e04e8:	9100c3e0 	add	x0, sp, #0x30
   e04ec:	91401002 	add	x2, x0, #0x4, lsl #12
   e04f0:	9100c3e0 	add	x0, sp, #0x30
   e04f4:	91400c01 	add	x1, x0, #0x3, lsl #12
   e04f8:	9100c3e0 	add	x0, sp, #0x30
   e04fc:	aa0203e3 	mov	x3, x2
   e0500:	aa0103e2 	mov	x2, x1
   e0504:	52808001 	mov	w1, #0x400                 	// #1024
   e0508:	9400020d 	bl	e0d3c <example4c>
   e050c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0510:	b920641f 	str	wzr, [x0, #8292]
   e0514:	1400000f 	b	e0550 <_start+0x550>
   e0518:	9100c3e0 	add	x0, sp, #0x30
   e051c:	91401002 	add	x2, x0, #0x4, lsl #12
   e0520:	9100c3e0 	add	x0, sp, #0x30
   e0524:	91400c01 	add	x1, x0, #0x3, lsl #12
   e0528:	9100c3e0 	add	x0, sp, #0x30
   e052c:	aa0203e3 	mov	x3, x2
   e0530:	aa0103e2 	mov	x2, x1
   e0534:	52808001 	mov	w1, #0x400                 	// #1024
   e0538:	94000201 	bl	e0d3c <example4c>
   e053c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0540:	b9606400 	ldr	w0, [x0, #8292]
   e0544:	11000400 	add	w0, w0, #0x1
   e0548:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e054c:	b9206420 	str	w0, [x1, #8292]
   e0550:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0554:	b9603c00 	ldr	w0, [x0, #8252]
   e0558:	531f7800 	lsl	w0, w0, #1
   e055c:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0560:	b9606421 	ldr	w1, [x1, #8292]
   e0564:	6b00003f 	cmp	w1, w0
   e0568:	54fffd8b 	b.lt	e0518 <_start+0x518>  // b.tstop
   e056c:	9100c3e0 	add	x0, sp, #0x30
   e0570:	91401401 	add	x1, x0, #0x5, lsl #12
   e0574:	9100c3e0 	add	x0, sp, #0x30
   e0578:	91401000 	add	x0, x0, #0x4, lsl #12
   e057c:	940003f2 	bl	e1544 <digest_memory>
   e0580:	2a0003e1 	mov	w1, w0
   e0584:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0588:	b9604000 	ldr	w0, [x0, #8256]
   e058c:	0b010000 	add	w0, w0, w1
   e0590:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0594:	b9204020 	str	w0, [x1, #8256]
   e0598:	9100c3e0 	add	x0, sp, #0x30
   e059c:	52800081 	mov	w1, #0x4                   	// #4
   e05a0:	94000223 	bl	e0e2c <example7>
   e05a4:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e05a8:	b920601f 	str	wzr, [x0, #8288]
   e05ac:	14000009 	b	e05d0 <_start+0x5d0>
   e05b0:	9100c3e0 	add	x0, sp, #0x30
   e05b4:	52800081 	mov	w1, #0x4                   	// #4
   e05b8:	9400021d 	bl	e0e2c <example7>
   e05bc:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e05c0:	b9606000 	ldr	w0, [x0, #8288]
   e05c4:	11000400 	add	w0, w0, #0x1
   e05c8:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e05cc:	b9206020 	str	w0, [x1, #8288]
   e05d0:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e05d4:	b9603c00 	ldr	w0, [x0, #8252]
   e05d8:	531e7400 	lsl	w0, w0, #2
   e05dc:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e05e0:	b9606021 	ldr	w1, [x1, #8288]
   e05e4:	6b00003f 	cmp	w1, w0
   e05e8:	54fffe4b 	b.lt	e05b0 <_start+0x5b0>  // b.tstop
   e05ec:	9100c3e0 	add	x0, sp, #0x30
   e05f0:	91402c01 	add	x1, x0, #0xb, lsl #12
   e05f4:	9100c3e0 	add	x0, sp, #0x30
   e05f8:	91402800 	add	x0, x0, #0xa, lsl #12
   e05fc:	940003d2 	bl	e1544 <digest_memory>
   e0600:	2a0003e1 	mov	w1, w0
   e0604:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0608:	b9604000 	ldr	w0, [x0, #8256]
   e060c:	0b010000 	add	w0, w0, w1
   e0610:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0614:	b9204020 	str	w0, [x1, #8256]
   e0618:	9100c3e0 	add	x0, sp, #0x30
   e061c:	52800101 	mov	w1, #0x8                   	// #8
   e0620:	9400021e 	bl	e0e98 <example8>
   e0624:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0628:	b9205c1f 	str	wzr, [x0, #8284]
   e062c:	14000009 	b	e0650 <_start+0x650>
   e0630:	9100c3e0 	add	x0, sp, #0x30
   e0634:	52800101 	mov	w1, #0x8                   	// #8
   e0638:	94000218 	bl	e0e98 <example8>
   e063c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0640:	b9605c00 	ldr	w0, [x0, #8284]
   e0644:	11000400 	add	w0, w0, #0x1
   e0648:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e064c:	b9205c20 	str	w0, [x1, #8284]
   e0650:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0654:	b9603c00 	ldr	w0, [x0, #8252]
   e0658:	11000c01 	add	w1, w0, #0x3
   e065c:	7100001f 	cmp	w0, #0x0
   e0660:	1a80b020 	csel	w0, w1, w0, lt	// lt = tstop
   e0664:	13027c00 	asr	w0, w0, #2
   e0668:	2a0003e1 	mov	w1, w0
   e066c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0670:	b9605c00 	ldr	w0, [x0, #8284]
   e0674:	6b01001f 	cmp	w0, w1
   e0678:	54fffdcb 	b.lt	e0630 <_start+0x630>  // b.tstop
   e067c:	9100c3e0 	add	x0, sp, #0x30
   e0680:	91404c01 	add	x1, x0, #0x13, lsl #12
   e0684:	9100c3e0 	add	x0, sp, #0x30
   e0688:	91404800 	add	x0, x0, #0x12, lsl #12
   e068c:	940003ae 	bl	e1544 <digest_memory>
   e0690:	2a0003e1 	mov	w1, w0
   e0694:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0698:	b9604000 	ldr	w0, [x0, #8256]
   e069c:	0b010000 	add	w0, w0, w1
   e06a0:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e06a4:	b9204020 	str	w0, [x1, #8256]
   e06a8:	9100b3e1 	add	x1, sp, #0x2c
   e06ac:	9100c3e0 	add	x0, sp, #0x30
   e06b0:	9400021a 	bl	e0f18 <example9>
   e06b4:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e06b8:	b920581f 	str	wzr, [x0, #8280]
   e06bc:	14000009 	b	e06e0 <_start+0x6e0>
   e06c0:	9100b3e1 	add	x1, sp, #0x2c
   e06c4:	9100c3e0 	add	x0, sp, #0x30
   e06c8:	94000214 	bl	e0f18 <example9>
   e06cc:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e06d0:	b9605800 	ldr	w0, [x0, #8280]
   e06d4:	11000400 	add	w0, w0, #0x1
   e06d8:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e06dc:	b9205820 	str	w0, [x1, #8280]
   e06e0:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e06e4:	b9603c00 	ldr	w0, [x0, #8252]
   e06e8:	531f7800 	lsl	w0, w0, #1
   e06ec:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e06f0:	b9605821 	ldr	w1, [x1, #8280]
   e06f4:	6b00003f 	cmp	w1, w0
   e06f8:	54fffe4b 	b.lt	e06c0 <_start+0x6c0>  // b.tstop
   e06fc:	b9402fe0 	ldr	w0, [sp, #44]
   e0700:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0704:	b9604021 	ldr	w1, [x1, #8256]
   e0708:	0b000020 	add	w0, w1, w0
   e070c:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0710:	b9204020 	str	w0, [x1, #8256]
   e0714:	9100c3e0 	add	x0, sp, #0x30
   e0718:	91401406 	add	x6, x0, #0x5, lsl #12
   e071c:	9100c3e0 	add	x0, sp, #0x30
   e0720:	91401005 	add	x5, x0, #0x4, lsl #12
   e0724:	9100c3e0 	add	x0, sp, #0x30
   e0728:	91400c04 	add	x4, x0, #0x3, lsl #12
   e072c:	9100c3e1 	add	x1, sp, #0x30
   e0730:	d2830000 	mov	x0, #0x1800                	// #6144
   e0734:	8b000023 	add	x3, x1, x0
   e0738:	9100c3e0 	add	x0, sp, #0x30
   e073c:	91400402 	add	x2, x0, #0x1, lsl #12
   e0740:	9100c3e0 	add	x0, sp, #0x30
   e0744:	91200001 	add	x1, x0, #0x800
   e0748:	9100c3e0 	add	x0, sp, #0x30
   e074c:	94000213 	bl	e0f98 <example10a>
   e0750:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0754:	b920541f 	str	wzr, [x0, #8276]
   e0758:	14000015 	b	e07ac <_start+0x7ac>
   e075c:	9100c3e0 	add	x0, sp, #0x30
   e0760:	91401406 	add	x6, x0, #0x5, lsl #12
   e0764:	9100c3e0 	add	x0, sp, #0x30
   e0768:	91401005 	add	x5, x0, #0x4, lsl #12
   e076c:	9100c3e0 	add	x0, sp, #0x30
   e0770:	91400c04 	add	x4, x0, #0x3, lsl #12
   e0774:	9100c3e1 	add	x1, sp, #0x30
   e0778:	d2830000 	mov	x0, #0x1800                	// #6144
   e077c:	8b000023 	add	x3, x1, x0
   e0780:	9100c3e0 	add	x0, sp, #0x30
   e0784:	91400402 	add	x2, x0, #0x1, lsl #12
   e0788:	9100c3e0 	add	x0, sp, #0x30
   e078c:	91200001 	add	x1, x0, #0x800
   e0790:	9100c3e0 	add	x0, sp, #0x30
   e0794:	94000201 	bl	e0f98 <example10a>
   e0798:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e079c:	b9605400 	ldr	w0, [x0, #8276]
   e07a0:	11000400 	add	w0, w0, #0x1
   e07a4:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e07a8:	b9205420 	str	w0, [x1, #8276]
   e07ac:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e07b0:	b9603c00 	ldr	w0, [x0, #8252]
   e07b4:	531f7800 	lsl	w0, w0, #1
   e07b8:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e07bc:	b9605421 	ldr	w1, [x1, #8276]
   e07c0:	6b00003f 	cmp	w1, w0
   e07c4:	54fffccb 	b.lt	e075c <_start+0x75c>  // b.tstop
   e07c8:	9100c3e0 	add	x0, sp, #0x30
   e07cc:	91401001 	add	x1, x0, #0x4, lsl #12
   e07d0:	9100c3e0 	add	x0, sp, #0x30
   e07d4:	91400c00 	add	x0, x0, #0x3, lsl #12
   e07d8:	9400035b 	bl	e1544 <digest_memory>
   e07dc:	2a0003f3 	mov	w19, w0
   e07e0:	9100c3e0 	add	x0, sp, #0x30
   e07e4:	91400401 	add	x1, x0, #0x1, lsl #12
   e07e8:	9100c3e0 	add	x0, sp, #0x30
   e07ec:	91200000 	add	x0, x0, #0x800
   e07f0:	94000355 	bl	e1544 <digest_memory>
   e07f4:	0b000260 	add	w0, w19, w0
   e07f8:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e07fc:	b9604021 	ldr	w1, [x1, #8256]
   e0800:	0b000020 	add	w0, w1, w0
   e0804:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0808:	b9204020 	str	w0, [x1, #8256]
   e080c:	9100c3e0 	add	x0, sp, #0x30
   e0810:	91401406 	add	x6, x0, #0x5, lsl #12
   e0814:	9100c3e0 	add	x0, sp, #0x30
   e0818:	91401005 	add	x5, x0, #0x4, lsl #12
   e081c:	9100c3e0 	add	x0, sp, #0x30
   e0820:	91400c04 	add	x4, x0, #0x3, lsl #12
   e0824:	9100c3e1 	add	x1, sp, #0x30
   e0828:	d2830000 	mov	x0, #0x1800                	// #6144
   e082c:	8b000023 	add	x3, x1, x0
   e0830:	9100c3e0 	add	x0, sp, #0x30
   e0834:	91400402 	add	x2, x0, #0x1, lsl #12
   e0838:	9100c3e0 	add	x0, sp, #0x30
   e083c:	91200001 	add	x1, x0, #0x800
   e0840:	9100c3e0 	add	x0, sp, #0x30
   e0844:	94000208 	bl	e1064 <example10b>
   e0848:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e084c:	b920501f 	str	wzr, [x0, #8272]
   e0850:	14000015 	b	e08a4 <_start+0x8a4>
   e0854:	9100c3e0 	add	x0, sp, #0x30
   e0858:	91401406 	add	x6, x0, #0x5, lsl #12
   e085c:	9100c3e0 	add	x0, sp, #0x30
   e0860:	91401005 	add	x5, x0, #0x4, lsl #12
   e0864:	9100c3e0 	add	x0, sp, #0x30
   e0868:	91400c04 	add	x4, x0, #0x3, lsl #12
   e086c:	9100c3e1 	add	x1, sp, #0x30
   e0870:	d2830000 	mov	x0, #0x1800                	// #6144
   e0874:	8b000023 	add	x3, x1, x0
   e0878:	9100c3e0 	add	x0, sp, #0x30
   e087c:	91400402 	add	x2, x0, #0x1, lsl #12
   e0880:	9100c3e0 	add	x0, sp, #0x30
   e0884:	91200001 	add	x1, x0, #0x800
   e0888:	9100c3e0 	add	x0, sp, #0x30
   e088c:	940001f6 	bl	e1064 <example10b>
   e0890:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0894:	b9605000 	ldr	w0, [x0, #8272]
   e0898:	11000400 	add	w0, w0, #0x1
   e089c:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e08a0:	b9205020 	str	w0, [x1, #8272]
   e08a4:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e08a8:	b9603c00 	ldr	w0, [x0, #8252]
   e08ac:	531e7400 	lsl	w0, w0, #2
   e08b0:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e08b4:	b9605021 	ldr	w1, [x1, #8272]
   e08b8:	6b00003f 	cmp	w1, w0
   e08bc:	54fffccb 	b.lt	e0854 <_start+0x854>  // b.tstop
   e08c0:	9100c3e0 	add	x0, sp, #0x30
   e08c4:	91401001 	add	x1, x0, #0x4, lsl #12
   e08c8:	9100c3e0 	add	x0, sp, #0x30
   e08cc:	91400c00 	add	x0, x0, #0x3, lsl #12
   e08d0:	9400031d 	bl	e1544 <digest_memory>
   e08d4:	2a0003e1 	mov	w1, w0
   e08d8:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e08dc:	b9604000 	ldr	w0, [x0, #8256]
   e08e0:	0b010000 	add	w0, w0, w1
   e08e4:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e08e8:	b9204020 	str	w0, [x1, #8256]
   e08ec:	9100c3e0 	add	x0, sp, #0x30
   e08f0:	940001fa 	bl	e10d8 <example11>
   e08f4:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e08f8:	b9204c1f 	str	wzr, [x0, #8268]
   e08fc:	14000008 	b	e091c <_start+0x91c>
   e0900:	9100c3e0 	add	x0, sp, #0x30
   e0904:	940001f5 	bl	e10d8 <example11>
   e0908:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e090c:	b9604c00 	ldr	w0, [x0, #8268]
   e0910:	11000400 	add	w0, w0, #0x1
   e0914:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0918:	b9204c20 	str	w0, [x1, #8268]
   e091c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0920:	b9603c00 	ldr	w0, [x0, #8252]
   e0924:	531f7800 	lsl	w0, w0, #1
   e0928:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e092c:	b9604c21 	ldr	w1, [x1, #8268]
   e0930:	6b00003f 	cmp	w1, w0
   e0934:	54fffe6b 	b.lt	e0900 <_start+0x900>  // b.tstop
   e0938:	9100c3e0 	add	x0, sp, #0x30
   e093c:	91404401 	add	x1, x0, #0x11, lsl #12
   e0940:	9100c3e0 	add	x0, sp, #0x30
   e0944:	91404000 	add	x0, x0, #0x10, lsl #12
   e0948:	940002ff 	bl	e1544 <digest_memory>
   e094c:	2a0003e1 	mov	w1, w0
   e0950:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0954:	b9604000 	ldr	w0, [x0, #8256]
   e0958:	0b010000 	add	w0, w0, w1
   e095c:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0960:	b9204020 	str	w0, [x1, #8256]
   e0964:	9100c3e0 	add	x0, sp, #0x30
   e0968:	94000231 	bl	e122c <example12>
   e096c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0970:	b920481f 	str	wzr, [x0, #8264]
   e0974:	14000008 	b	e0994 <_start+0x994>
   e0978:	9100c3e0 	add	x0, sp, #0x30
   e097c:	9400022c 	bl	e122c <example12>
   e0980:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0984:	b9604800 	ldr	w0, [x0, #8264]
   e0988:	11000400 	add	w0, w0, #0x1
   e098c:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0990:	b9204820 	str	w0, [x1, #8264]
   e0994:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0998:	b9603c00 	ldr	w0, [x0, #8252]
   e099c:	531e7400 	lsl	w0, w0, #2
   e09a0:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e09a4:	b9604821 	ldr	w1, [x1, #8264]
   e09a8:	6b00003f 	cmp	w1, w0
   e09ac:	54fffe6b 	b.lt	e0978 <_start+0x978>  // b.tstop
   e09b0:	9100c3e0 	add	x0, sp, #0x30
   e09b4:	91402c01 	add	x1, x0, #0xb, lsl #12
   e09b8:	9100c3e0 	add	x0, sp, #0x30
   e09bc:	91402800 	add	x0, x0, #0xa, lsl #12
   e09c0:	940002e1 	bl	e1544 <digest_memory>
   e09c4:	2a0003e1 	mov	w1, w0
   e09c8:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e09cc:	b9604000 	ldr	w0, [x0, #8256]
   e09d0:	0b010000 	add	w0, w0, w1
   e09d4:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e09d8:	b9204020 	str	w0, [x1, #8256]
   e09dc:	9100c3e0 	add	x0, sp, #0x30
   e09e0:	91400802 	add	x2, x0, #0x2, lsl #12
   e09e4:	9100c3e1 	add	x1, sp, #0x30
   e09e8:	9100c3e0 	add	x0, sp, #0x30
   e09ec:	9400029c 	bl	e145c <example23>
   e09f0:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e09f4:	b920441f 	str	wzr, [x0, #8260]
   e09f8:	1400000b 	b	e0a24 <_start+0xa24>
   e09fc:	9100c3e0 	add	x0, sp, #0x30
   e0a00:	91400802 	add	x2, x0, #0x2, lsl #12
   e0a04:	9100c3e1 	add	x1, sp, #0x30
   e0a08:	9100c3e0 	add	x0, sp, #0x30
   e0a0c:	94000294 	bl	e145c <example23>
   e0a10:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0a14:	b9604400 	ldr	w0, [x0, #8260]
   e0a18:	11000400 	add	w0, w0, #0x1
   e0a1c:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0a20:	b9204420 	str	w0, [x1, #8260]
   e0a24:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0a28:	b9603c00 	ldr	w0, [x0, #8252]
   e0a2c:	531d7000 	lsl	w0, w0, #3
   e0a30:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0a34:	b9604421 	ldr	w1, [x1, #8260]
   e0a38:	6b00003f 	cmp	w1, w0
   e0a3c:	54fffe0b 	b.lt	e09fc <_start+0x9fc>  // b.tstop
   e0a40:	9100c3e0 	add	x0, sp, #0x30
   e0a44:	91080001 	add	x1, x0, #0x200
   e0a48:	9100c3e0 	add	x0, sp, #0x30
   e0a4c:	940002be 	bl	e1544 <digest_memory>
   e0a50:	2a0003e1 	mov	w1, w0
   e0a54:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0a58:	b9604000 	ldr	w0, [x0, #8256]
   e0a5c:	0b010000 	add	w0, w0, w1
   e0a60:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0a64:	b9204020 	str	w0, [x1, #8256]
   e0a68:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0a6c:	b9604000 	ldr	w0, [x0, #8256]
   e0a70:	f9400bf3 	ldr	x19, [sp, #16]
   e0a74:	a9407bfd 	ldp	x29, x30, [sp]
   e0a78:	910203ff 	add	sp, sp, #0x80
   e0a7c:	9140cbff 	add	sp, sp, #0x32, lsl #12
   e0a80:	d65f03c0 	ret

Disassembly of section .text:

00000000000e0a84 <dump_regs>:
   e0a84:	d10043ff 	sub	sp, sp, #0x10
   e0a88:	f90007e0 	str	x0, [sp, #8]
   e0a8c:	d40000c1 	svc	#0x6
   e0a90:	d503201f 	nop
   e0a94:	910043ff 	add	sp, sp, #0x10
   e0a98:	d65f03c0 	ret

00000000000e0a9c <example1>:
   e0a9c:	d10083ff 	sub	sp, sp, #0x20
   e0aa0:	f90007e0 	str	x0, [sp, #8]
   e0aa4:	b9001fff 	str	wzr, [sp, #28]
   e0aa8:	14000013 	b	e0af4 <example1+0x58>
   e0aac:	f94007e0 	ldr	x0, [sp, #8]
   e0ab0:	b9801fe1 	ldrsw	x1, [sp, #28]
   e0ab4:	91400c21 	add	x1, x1, #0x3, lsl #12
   e0ab8:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e0abc:	f94007e0 	ldr	x0, [sp, #8]
   e0ac0:	b9801fe3 	ldrsw	x3, [sp, #28]
   e0ac4:	d2870002 	mov	x2, #0x3800                	// #14336
   e0ac8:	8b020062 	add	x2, x3, x2
   e0acc:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e0ad0:	0b000022 	add	w2, w1, w0
   e0ad4:	f94007e0 	ldr	x0, [sp, #8]
   e0ad8:	b9801fe3 	ldrsw	x3, [sp, #28]
   e0adc:	d2850001 	mov	x1, #0x2800                	// #10240
   e0ae0:	8b010061 	add	x1, x3, x1
   e0ae4:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0ae8:	b9401fe0 	ldr	w0, [sp, #28]
   e0aec:	11000400 	add	w0, w0, #0x1
   e0af0:	b9001fe0 	str	w0, [sp, #28]
   e0af4:	b9401fe0 	ldr	w0, [sp, #28]
   e0af8:	7103fc1f 	cmp	w0, #0xff
   e0afc:	54fffd8d 	b.le	e0aac <example1+0x10>
   e0b00:	d503201f 	nop
   e0b04:	d503201f 	nop
   e0b08:	910083ff 	add	sp, sp, #0x20
   e0b0c:	d65f03c0 	ret

00000000000e0b10 <example2a>:
   e0b10:	d10083ff 	sub	sp, sp, #0x20
   e0b14:	f90007e0 	str	x0, [sp, #8]
   e0b18:	b90007e1 	str	w1, [sp, #4]
   e0b1c:	b90003e2 	str	w2, [sp]
   e0b20:	b9001fff 	str	wzr, [sp, #28]
   e0b24:	14000009 	b	e0b48 <example2a+0x38>
   e0b28:	f94007e0 	ldr	x0, [sp, #8]
   e0b2c:	b9801fe1 	ldrsw	x1, [sp, #28]
   e0b30:	91400c21 	add	x1, x1, #0x3, lsl #12
   e0b34:	b94003e2 	ldr	w2, [sp]
   e0b38:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0b3c:	b9401fe0 	ldr	w0, [sp, #28]
   e0b40:	11000400 	add	w0, w0, #0x1
   e0b44:	b9001fe0 	str	w0, [sp, #28]
   e0b48:	b9401fe1 	ldr	w1, [sp, #28]
   e0b4c:	b94007e0 	ldr	w0, [sp, #4]
   e0b50:	6b00003f 	cmp	w1, w0
   e0b54:	54fffeab 	b.lt	e0b28 <example2a+0x18>  // b.tstop
   e0b58:	d503201f 	nop
   e0b5c:	d503201f 	nop
   e0b60:	910083ff 	add	sp, sp, #0x20
   e0b64:	d65f03c0 	ret

00000000000e0b68 <example2b>:
   e0b68:	d10083ff 	sub	sp, sp, #0x20
   e0b6c:	f90007e0 	str	x0, [sp, #8]
   e0b70:	b90007e1 	str	w1, [sp, #4]
   e0b74:	b90003e2 	str	w2, [sp]
   e0b78:	b9001fff 	str	wzr, [sp, #28]
   e0b7c:	14000013 	b	e0bc8 <example2b+0x60>
   e0b80:	f94007e0 	ldr	x0, [sp, #8]
   e0b84:	b9801fe1 	ldrsw	x1, [sp, #28]
   e0b88:	91400c21 	add	x1, x1, #0x3, lsl #12
   e0b8c:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e0b90:	f94007e0 	ldr	x0, [sp, #8]
   e0b94:	b9801fe3 	ldrsw	x3, [sp, #28]
   e0b98:	d2870002 	mov	x2, #0x3800                	// #14336
   e0b9c:	8b020062 	add	x2, x3, x2
   e0ba0:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e0ba4:	0a000022 	and	w2, w1, w0
   e0ba8:	f94007e0 	ldr	x0, [sp, #8]
   e0bac:	b9801fe3 	ldrsw	x3, [sp, #28]
   e0bb0:	d2850001 	mov	x1, #0x2800                	// #10240
   e0bb4:	8b010061 	add	x1, x3, x1
   e0bb8:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0bbc:	b9401fe0 	ldr	w0, [sp, #28]
   e0bc0:	11000400 	add	w0, w0, #0x1
   e0bc4:	b9001fe0 	str	w0, [sp, #28]
   e0bc8:	b94007e0 	ldr	w0, [sp, #4]
   e0bcc:	51000401 	sub	w1, w0, #0x1
   e0bd0:	b90007e1 	str	w1, [sp, #4]
   e0bd4:	7100001f 	cmp	w0, #0x0
   e0bd8:	54fffd41 	b.ne	e0b80 <example2b+0x18>  // b.any
   e0bdc:	d503201f 	nop
   e0be0:	d503201f 	nop
   e0be4:	910083ff 	add	sp, sp, #0x20
   e0be8:	d65f03c0 	ret

00000000000e0bec <example3>:
   e0bec:	d10083ff 	sub	sp, sp, #0x20
   e0bf0:	f9000fe0 	str	x0, [sp, #24]
   e0bf4:	b90017e1 	str	w1, [sp, #20]
   e0bf8:	f90007e2 	str	x2, [sp, #8]
   e0bfc:	f90003e3 	str	x3, [sp]
   e0c00:	14000009 	b	e0c24 <example3+0x38>
   e0c04:	f94003e1 	ldr	x1, [sp]
   e0c08:	91001020 	add	x0, x1, #0x4
   e0c0c:	f90003e0 	str	x0, [sp]
   e0c10:	f94007e0 	ldr	x0, [sp, #8]
   e0c14:	91001002 	add	x2, x0, #0x4
   e0c18:	f90007e2 	str	x2, [sp, #8]
   e0c1c:	b9400021 	ldr	w1, [x1]
   e0c20:	b9000001 	str	w1, [x0]
   e0c24:	b94017e0 	ldr	w0, [sp, #20]
   e0c28:	51000401 	sub	w1, w0, #0x1
   e0c2c:	b90017e1 	str	w1, [sp, #20]
   e0c30:	7100001f 	cmp	w0, #0x0
   e0c34:	54fffe81 	b.ne	e0c04 <example3+0x18>  // b.any
   e0c38:	d503201f 	nop
   e0c3c:	d503201f 	nop
   e0c40:	910083ff 	add	sp, sp, #0x20
   e0c44:	d65f03c0 	ret

00000000000e0c48 <example4a>:
   e0c48:	d10083ff 	sub	sp, sp, #0x20
   e0c4c:	f9000fe0 	str	x0, [sp, #24]
   e0c50:	b90017e1 	str	w1, [sp, #20]
   e0c54:	f90007e2 	str	x2, [sp, #8]
   e0c58:	f90003e3 	str	x3, [sp]
   e0c5c:	1400000a 	b	e0c84 <example4a+0x3c>
   e0c60:	f94003e0 	ldr	x0, [sp]
   e0c64:	91001001 	add	x1, x0, #0x4
   e0c68:	f90003e1 	str	x1, [sp]
   e0c6c:	b9400001 	ldr	w1, [x0]
   e0c70:	f94007e0 	ldr	x0, [sp, #8]
   e0c74:	91001002 	add	x2, x0, #0x4
   e0c78:	f90007e2 	str	x2, [sp, #8]
   e0c7c:	11001421 	add	w1, w1, #0x5
   e0c80:	b9000001 	str	w1, [x0]
   e0c84:	b94017e0 	ldr	w0, [sp, #20]
   e0c88:	51000401 	sub	w1, w0, #0x1
   e0c8c:	b90017e1 	str	w1, [sp, #20]
   e0c90:	7100001f 	cmp	w0, #0x0
   e0c94:	54fffe61 	b.ne	e0c60 <example4a+0x18>  // b.any
   e0c98:	d503201f 	nop
   e0c9c:	d503201f 	nop
   e0ca0:	910083ff 	add	sp, sp, #0x20
   e0ca4:	d65f03c0 	ret

00000000000e0ca8 <example4b>:
   e0ca8:	d100c3ff 	sub	sp, sp, #0x30
   e0cac:	f9000fe0 	str	x0, [sp, #24]
   e0cb0:	b90017e1 	str	w1, [sp, #20]
   e0cb4:	f90007e2 	str	x2, [sp, #8]
   e0cb8:	f90003e3 	str	x3, [sp]
   e0cbc:	b9002fff 	str	wzr, [sp, #44]
   e0cc0:	14000017 	b	e0d1c <example4b+0x74>
   e0cc4:	b9402fe0 	ldr	w0, [sp, #44]
   e0cc8:	11000401 	add	w1, w0, #0x1
   e0ccc:	f9400fe0 	ldr	x0, [sp, #24]
   e0cd0:	93407c21 	sxtw	x1, w1
   e0cd4:	91400c21 	add	x1, x1, #0x3, lsl #12
   e0cd8:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e0cdc:	b9402fe0 	ldr	w0, [sp, #44]
   e0ce0:	11000c02 	add	w2, w0, #0x3
   e0ce4:	f9400fe0 	ldr	x0, [sp, #24]
   e0ce8:	93407c43 	sxtw	x3, w2
   e0cec:	d2870002 	mov	x2, #0x3800                	// #14336
   e0cf0:	8b020062 	add	x2, x3, x2
   e0cf4:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e0cf8:	0b000022 	add	w2, w1, w0
   e0cfc:	f9400fe0 	ldr	x0, [sp, #24]
   e0d00:	b9802fe3 	ldrsw	x3, [sp, #44]
   e0d04:	d2850001 	mov	x1, #0x2800                	// #10240
   e0d08:	8b010061 	add	x1, x3, x1
   e0d0c:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0d10:	b9402fe0 	ldr	w0, [sp, #44]
   e0d14:	11000400 	add	w0, w0, #0x1
   e0d18:	b9002fe0 	str	w0, [sp, #44]
   e0d1c:	b9402fe1 	ldr	w1, [sp, #44]
   e0d20:	b94017e0 	ldr	w0, [sp, #20]
   e0d24:	6b00003f 	cmp	w1, w0
   e0d28:	54fffceb 	b.lt	e0cc4 <example4b+0x1c>  // b.tstop
   e0d2c:	d503201f 	nop
   e0d30:	d503201f 	nop
   e0d34:	9100c3ff 	add	sp, sp, #0x30
   e0d38:	d65f03c0 	ret

00000000000e0d3c <example4c>:
   e0d3c:	d100c3ff 	sub	sp, sp, #0x30
   e0d40:	f9000fe0 	str	x0, [sp, #24]
   e0d44:	b90017e1 	str	w1, [sp, #20]
   e0d48:	f90007e2 	str	x2, [sp, #8]
   e0d4c:	f90003e3 	str	x3, [sp]
   e0d50:	52800080 	mov	w0, #0x4                   	// #4
   e0d54:	b9002be0 	str	w0, [sp, #40]
   e0d58:	b9002fff 	str	wzr, [sp, #44]
   e0d5c:	14000015 	b	e0db0 <example4c+0x74>
   e0d60:	f9400fe0 	ldr	x0, [sp, #24]
   e0d64:	b9802fe2 	ldrsw	x2, [sp, #44]
   e0d68:	d2850001 	mov	x1, #0x2800                	// #10240
   e0d6c:	8b010041 	add	x1, x2, x1
   e0d70:	b8617800 	ldr	w0, [x0, x1, lsl #2]
   e0d74:	b90027e0 	str	w0, [sp, #36]
   e0d78:	b94027e1 	ldr	w1, [sp, #36]
   e0d7c:	b9402be0 	ldr	w0, [sp, #40]
   e0d80:	6b00003f 	cmp	w1, w0
   e0d84:	5400006d 	b.le	e0d90 <example4c+0x54>
   e0d88:	b9402be0 	ldr	w0, [sp, #40]
   e0d8c:	14000002 	b	e0d94 <example4c+0x58>
   e0d90:	52800000 	mov	w0, #0x0                   	// #0
   e0d94:	f9400fe1 	ldr	x1, [sp, #24]
   e0d98:	b9802fe2 	ldrsw	x2, [sp, #44]
   e0d9c:	91400c42 	add	x2, x2, #0x3, lsl #12
   e0da0:	b8227820 	str	w0, [x1, x2, lsl #2]
   e0da4:	b9402fe0 	ldr	w0, [sp, #44]
   e0da8:	11000400 	add	w0, w0, #0x1
   e0dac:	b9002fe0 	str	w0, [sp, #44]
   e0db0:	b9402fe1 	ldr	w1, [sp, #44]
   e0db4:	b94017e0 	ldr	w0, [sp, #20]
   e0db8:	6b00003f 	cmp	w1, w0
   e0dbc:	54fffd2b 	b.lt	e0d60 <example4c+0x24>  // b.tstop
   e0dc0:	d503201f 	nop
   e0dc4:	d503201f 	nop
   e0dc8:	9100c3ff 	add	sp, sp, #0x30
   e0dcc:	d65f03c0 	ret

00000000000e0dd0 <example5>:
   e0dd0:	d100c3ff 	sub	sp, sp, #0x30
   e0dd4:	f9000fe0 	str	x0, [sp, #24]
   e0dd8:	b90017e1 	str	w1, [sp, #20]
   e0ddc:	f90007e2 	str	x2, [sp, #8]
   e0de0:	b9002fff 	str	wzr, [sp, #44]
   e0de4:	1400000a 	b	e0e0c <example5+0x3c>
   e0de8:	f9400fe0 	ldr	x0, [sp, #24]
   e0dec:	b9802fe2 	ldrsw	x2, [sp, #44]
   e0df0:	d2848001 	mov	x1, #0x2400                	// #9216
   e0df4:	8b010041 	add	x1, x2, x1
   e0df8:	528000a2 	mov	w2, #0x5                   	// #5
   e0dfc:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0e00:	b9402fe0 	ldr	w0, [sp, #44]
   e0e04:	11000400 	add	w0, w0, #0x1
   e0e08:	b9002fe0 	str	w0, [sp, #44]
   e0e0c:	b9402fe1 	ldr	w1, [sp, #44]
   e0e10:	b94017e0 	ldr	w0, [sp, #20]
   e0e14:	6b00003f 	cmp	w1, w0
   e0e18:	54fffe8b 	b.lt	e0de8 <example5+0x18>  // b.tstop
   e0e1c:	d503201f 	nop
   e0e20:	d503201f 	nop
   e0e24:	9100c3ff 	add	sp, sp, #0x30
   e0e28:	d65f03c0 	ret

00000000000e0e2c <example7>:
   e0e2c:	d10083ff 	sub	sp, sp, #0x20
   e0e30:	f90007e0 	str	x0, [sp, #8]
   e0e34:	b90007e1 	str	w1, [sp, #4]
   e0e38:	b9001fff 	str	wzr, [sp, #28]
   e0e3c:	14000010 	b	e0e7c <example7+0x50>
   e0e40:	b9401fe1 	ldr	w1, [sp, #28]
   e0e44:	b94007e0 	ldr	w0, [sp, #4]
   e0e48:	0b000021 	add	w1, w1, w0
   e0e4c:	f94007e0 	ldr	x0, [sp, #8]
   e0e50:	93407c21 	sxtw	x1, w1
   e0e54:	91400c21 	add	x1, x1, #0x3, lsl #12
   e0e58:	b8617802 	ldr	w2, [x0, x1, lsl #2]
   e0e5c:	f94007e0 	ldr	x0, [sp, #8]
   e0e60:	b9801fe3 	ldrsw	x3, [sp, #28]
   e0e64:	d2850001 	mov	x1, #0x2800                	// #10240
   e0e68:	8b010061 	add	x1, x3, x1
   e0e6c:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0e70:	b9401fe0 	ldr	w0, [sp, #28]
   e0e74:	11000400 	add	w0, w0, #0x1
   e0e78:	b9001fe0 	str	w0, [sp, #28]
   e0e7c:	b9401fe0 	ldr	w0, [sp, #28]
   e0e80:	710ffc1f 	cmp	w0, #0x3ff
   e0e84:	54fffded 	b.le	e0e40 <example7+0x14>
   e0e88:	d503201f 	nop
   e0e8c:	d503201f 	nop
   e0e90:	910083ff 	add	sp, sp, #0x20
   e0e94:	d65f03c0 	ret

00000000000e0e98 <example8>:
   e0e98:	d10083ff 	sub	sp, sp, #0x20
   e0e9c:	f90007e0 	str	x0, [sp, #8]
   e0ea0:	b90007e1 	str	w1, [sp, #4]
   e0ea4:	b9001fff 	str	wzr, [sp, #28]
   e0ea8:	14000015 	b	e0efc <example8+0x64>
   e0eac:	b9001bff 	str	wzr, [sp, #24]
   e0eb0:	1400000d 	b	e0ee4 <example8+0x4c>
   e0eb4:	f94007e0 	ldr	x0, [sp, #8]
   e0eb8:	b9801be1 	ldrsw	x1, [sp, #24]
   e0ebc:	b9801fe2 	ldrsw	x2, [sp, #28]
   e0ec0:	d376d442 	lsl	x2, x2, #10
   e0ec4:	8b010042 	add	x2, x2, x1
   e0ec8:	d2890001 	mov	x1, #0x4800                	// #18432
   e0ecc:	8b010041 	add	x1, x2, x1
   e0ed0:	b94007e2 	ldr	w2, [sp, #4]
   e0ed4:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0ed8:	b9401be0 	ldr	w0, [sp, #24]
   e0edc:	11000400 	add	w0, w0, #0x1
   e0ee0:	b9001be0 	str	w0, [sp, #24]
   e0ee4:	b9401be0 	ldr	w0, [sp, #24]
   e0ee8:	710ffc1f 	cmp	w0, #0x3ff
   e0eec:	54fffe4d 	b.le	e0eb4 <example8+0x1c>
   e0ef0:	b9401fe0 	ldr	w0, [sp, #28]
   e0ef4:	11000400 	add	w0, w0, #0x1
   e0ef8:	b9001fe0 	str	w0, [sp, #28]
   e0efc:	b9401fe0 	ldr	w0, [sp, #28]
   e0f00:	71007c1f 	cmp	w0, #0x1f
   e0f04:	54fffd4d 	b.le	e0eac <example8+0x14>
   e0f08:	d503201f 	nop
   e0f0c:	d503201f 	nop
   e0f10:	910083ff 	add	sp, sp, #0x20
   e0f14:	d65f03c0 	ret

00000000000e0f18 <example9>:
   e0f18:	d10083ff 	sub	sp, sp, #0x20
   e0f1c:	f90007e0 	str	x0, [sp, #8]
   e0f20:	f90003e1 	str	x1, [sp]
   e0f24:	b9001bff 	str	wzr, [sp, #24]
   e0f28:	b9001fff 	str	wzr, [sp, #28]
   e0f2c:	14000012 	b	e0f74 <example9+0x5c>
   e0f30:	f94007e0 	ldr	x0, [sp, #8]
   e0f34:	b9801fe2 	ldrsw	x2, [sp, #28]
   e0f38:	d2830001 	mov	x1, #0x1800                	// #6144
   e0f3c:	8b010041 	add	x1, x2, x1
   e0f40:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e0f44:	f94007e0 	ldr	x0, [sp, #8]
   e0f48:	b9801fe3 	ldrsw	x3, [sp, #28]
   e0f4c:	d2838002 	mov	x2, #0x1c00                	// #7168
   e0f50:	8b020062 	add	x2, x3, x2
   e0f54:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e0f58:	4b000020 	sub	w0, w1, w0
   e0f5c:	b9401be1 	ldr	w1, [sp, #24]
   e0f60:	0b000020 	add	w0, w1, w0
   e0f64:	b9001be0 	str	w0, [sp, #24]
   e0f68:	b9401fe0 	ldr	w0, [sp, #28]
   e0f6c:	11000400 	add	w0, w0, #0x1
   e0f70:	b9001fe0 	str	w0, [sp, #28]
   e0f74:	b9401fe0 	ldr	w0, [sp, #28]
   e0f78:	710ffc1f 	cmp	w0, #0x3ff
   e0f7c:	54fffdad 	b.le	e0f30 <example9+0x18>
   e0f80:	f94003e0 	ldr	x0, [sp]
   e0f84:	b9401be1 	ldr	w1, [sp, #24]
   e0f88:	b9000001 	str	w1, [x0]
   e0f8c:	d503201f 	nop
   e0f90:	910083ff 	add	sp, sp, #0x20
   e0f94:	d65f03c0 	ret

00000000000e0f98 <example10a>:
   e0f98:	d10143ff 	sub	sp, sp, #0x50
   e0f9c:	f9001fe0 	str	x0, [sp, #56]
   e0fa0:	f9001be1 	str	x1, [sp, #48]
   e0fa4:	f90017e2 	str	x2, [sp, #40]
   e0fa8:	f90013e3 	str	x3, [sp, #32]
   e0fac:	f9000fe4 	str	x4, [sp, #24]
   e0fb0:	f9000be5 	str	x5, [sp, #16]
   e0fb4:	f90007e6 	str	x6, [sp, #8]
   e0fb8:	b9004fff 	str	wzr, [sp, #76]
   e0fbc:	14000023 	b	e1048 <example10a+0xb0>
   e0fc0:	f9401fe0 	ldr	x0, [sp, #56]
   e0fc4:	b9804fe1 	ldrsw	x1, [sp, #76]
   e0fc8:	91400421 	add	x1, x1, #0x1, lsl #12
   e0fcc:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e0fd0:	f9401fe0 	ldr	x0, [sp, #56]
   e0fd4:	b9804fe3 	ldrsw	x3, [sp, #76]
   e0fd8:	d2828002 	mov	x2, #0x1400                	// #5120
   e0fdc:	8b020062 	add	x2, x3, x2
   e0fe0:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e0fe4:	0b000022 	add	w2, w1, w0
   e0fe8:	f9401fe0 	ldr	x0, [sp, #56]
   e0fec:	b9804fe1 	ldrsw	x1, [sp, #76]
   e0ff0:	91300021 	add	x1, x1, #0xc00
   e0ff4:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0ff8:	f9401fe0 	ldr	x0, [sp, #56]
   e0ffc:	b9804fe1 	ldrsw	x1, [sp, #76]
   e1000:	91200021 	add	x1, x1, #0x800
   e1004:	78e17800 	ldrsh	w0, [x0, x1, lsl #1]
   e1008:	12003c01 	and	w1, w0, #0xffff
   e100c:	f9401fe0 	ldr	x0, [sp, #56]
   e1010:	b9804fe2 	ldrsw	x2, [sp, #76]
   e1014:	91300042 	add	x2, x2, #0xc00
   e1018:	78e27800 	ldrsh	w0, [x0, x2, lsl #1]
   e101c:	12003c00 	and	w0, w0, #0xffff
   e1020:	0b000020 	add	w0, w1, w0
   e1024:	12003c00 	and	w0, w0, #0xffff
   e1028:	13003c02 	sxth	w2, w0
   e102c:	f9401fe0 	ldr	x0, [sp, #56]
   e1030:	b9804fe1 	ldrsw	x1, [sp, #76]
   e1034:	91100021 	add	x1, x1, #0x400
   e1038:	78217802 	strh	w2, [x0, x1, lsl #1]
   e103c:	b9404fe0 	ldr	w0, [sp, #76]
   e1040:	11000400 	add	w0, w0, #0x1
   e1044:	b9004fe0 	str	w0, [sp, #76]
   e1048:	b9404fe0 	ldr	w0, [sp, #76]
   e104c:	710ffc1f 	cmp	w0, #0x3ff
   e1050:	54fffb8d 	b.le	e0fc0 <example10a+0x28>
   e1054:	d503201f 	nop
   e1058:	d503201f 	nop
   e105c:	910143ff 	add	sp, sp, #0x50
   e1060:	d65f03c0 	ret

00000000000e1064 <example10b>:
   e1064:	d10143ff 	sub	sp, sp, #0x50
   e1068:	f9001fe0 	str	x0, [sp, #56]
   e106c:	f9001be1 	str	x1, [sp, #48]
   e1070:	f90017e2 	str	x2, [sp, #40]
   e1074:	f90013e3 	str	x3, [sp, #32]
   e1078:	f9000fe4 	str	x4, [sp, #24]
   e107c:	f9000be5 	str	x5, [sp, #16]
   e1080:	f90007e6 	str	x6, [sp, #8]
   e1084:	b9004fff 	str	wzr, [sp, #76]
   e1088:	1400000d 	b	e10bc <example10b+0x58>
   e108c:	f9401fe0 	ldr	x0, [sp, #56]
   e1090:	b9804fe1 	ldrsw	x1, [sp, #76]
   e1094:	91200021 	add	x1, x1, #0x800
   e1098:	78e17800 	ldrsh	w0, [x0, x1, lsl #1]
   e109c:	2a0003e2 	mov	w2, w0
   e10a0:	f9401fe0 	ldr	x0, [sp, #56]
   e10a4:	b9804fe1 	ldrsw	x1, [sp, #76]
   e10a8:	91300021 	add	x1, x1, #0xc00
   e10ac:	b8217802 	str	w2, [x0, x1, lsl #2]
   e10b0:	b9404fe0 	ldr	w0, [sp, #76]
   e10b4:	11000400 	add	w0, w0, #0x1
   e10b8:	b9004fe0 	str	w0, [sp, #76]
   e10bc:	b9404fe0 	ldr	w0, [sp, #76]
   e10c0:	710ffc1f 	cmp	w0, #0x3ff
   e10c4:	54fffe4d 	b.le	e108c <example10b+0x28>
   e10c8:	d503201f 	nop
   e10cc:	d503201f 	nop
   e10d0:	910143ff 	add	sp, sp, #0x50
   e10d4:	d65f03c0 	ret

00000000000e10d8 <example11>:
   e10d8:	d10083ff 	sub	sp, sp, #0x20
   e10dc:	f90007e0 	str	x0, [sp, #8]
   e10e0:	b9001fff 	str	wzr, [sp, #28]
   e10e4:	1400004b 	b	e1210 <example11+0x138>
   e10e8:	b9401fe0 	ldr	w0, [sp, #28]
   e10ec:	531f7800 	lsl	w0, w0, #1
   e10f0:	11000401 	add	w1, w0, #0x1
   e10f4:	f94007e0 	ldr	x0, [sp, #8]
   e10f8:	93407c21 	sxtw	x1, w1
   e10fc:	91400c21 	add	x1, x1, #0x3, lsl #12
   e1100:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e1104:	b9401fe0 	ldr	w0, [sp, #28]
   e1108:	531f7800 	lsl	w0, w0, #1
   e110c:	11000402 	add	w2, w0, #0x1
   e1110:	f94007e0 	ldr	x0, [sp, #8]
   e1114:	93407c43 	sxtw	x3, w2
   e1118:	d2870002 	mov	x2, #0x3800                	// #14336
   e111c:	8b020062 	add	x2, x3, x2
   e1120:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e1124:	1b007c21 	mul	w1, w1, w0
   e1128:	b9401fe0 	ldr	w0, [sp, #28]
   e112c:	531f7802 	lsl	w2, w0, #1
   e1130:	f94007e0 	ldr	x0, [sp, #8]
   e1134:	93407c42 	sxtw	x2, w2
   e1138:	91400c42 	add	x2, x2, #0x3, lsl #12
   e113c:	b8627802 	ldr	w2, [x0, x2, lsl #2]
   e1140:	b9401fe0 	ldr	w0, [sp, #28]
   e1144:	531f7803 	lsl	w3, w0, #1
   e1148:	f94007e0 	ldr	x0, [sp, #8]
   e114c:	93407c64 	sxtw	x4, w3
   e1150:	d2870003 	mov	x3, #0x3800                	// #14336
   e1154:	8b030083 	add	x3, x4, x3
   e1158:	b8637800 	ldr	w0, [x0, x3, lsl #2]
   e115c:	1b007c40 	mul	w0, w2, w0
   e1160:	4b000022 	sub	w2, w1, w0
   e1164:	f94007e0 	ldr	x0, [sp, #8]
   e1168:	b9801fe3 	ldrsw	x3, [sp, #28]
   e116c:	d2850001 	mov	x1, #0x2800                	// #10240
   e1170:	8b010061 	add	x1, x3, x1
   e1174:	b8217802 	str	w2, [x0, x1, lsl #2]
   e1178:	b9401fe0 	ldr	w0, [sp, #28]
   e117c:	531f7801 	lsl	w1, w0, #1
   e1180:	f94007e0 	ldr	x0, [sp, #8]
   e1184:	93407c21 	sxtw	x1, w1
   e1188:	91400c21 	add	x1, x1, #0x3, lsl #12
   e118c:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e1190:	b9401fe0 	ldr	w0, [sp, #28]
   e1194:	531f7800 	lsl	w0, w0, #1
   e1198:	11000402 	add	w2, w0, #0x1
   e119c:	f94007e0 	ldr	x0, [sp, #8]
   e11a0:	93407c43 	sxtw	x3, w2
   e11a4:	d2870002 	mov	x2, #0x3800                	// #14336
   e11a8:	8b020062 	add	x2, x3, x2
   e11ac:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e11b0:	1b007c21 	mul	w1, w1, w0
   e11b4:	b9401fe0 	ldr	w0, [sp, #28]
   e11b8:	531f7800 	lsl	w0, w0, #1
   e11bc:	11000402 	add	w2, w0, #0x1
   e11c0:	f94007e0 	ldr	x0, [sp, #8]
   e11c4:	93407c42 	sxtw	x2, w2
   e11c8:	91400c42 	add	x2, x2, #0x3, lsl #12
   e11cc:	b8627802 	ldr	w2, [x0, x2, lsl #2]
   e11d0:	b9401fe0 	ldr	w0, [sp, #28]
   e11d4:	531f7803 	lsl	w3, w0, #1
   e11d8:	f94007e0 	ldr	x0, [sp, #8]
   e11dc:	93407c64 	sxtw	x4, w3
   e11e0:	d2870003 	mov	x3, #0x3800                	// #14336
   e11e4:	8b030083 	add	x3, x4, x3
   e11e8:	b8637800 	ldr	w0, [x0, x3, lsl #2]
   e11ec:	1b007c40 	mul	w0, w2, w0
   e11f0:	0b000022 	add	w2, w1, w0
   e11f4:	f94007e0 	ldr	x0, [sp, #8]
   e11f8:	b9801fe1 	ldrsw	x1, [sp, #28]
   e11fc:	91401021 	add	x1, x1, #0x4, lsl #12
   e1200:	b8217802 	str	w2, [x0, x1, lsl #2]
   e1204:	b9401fe0 	ldr	w0, [sp, #28]
   e1208:	11000400 	add	w0, w0, #0x1
   e120c:	b9001fe0 	str	w0, [sp, #28]
   e1210:	b9401fe0 	ldr	w0, [sp, #28]
   e1214:	7107fc1f 	cmp	w0, #0x1ff
   e1218:	54fff68d 	b.le	e10e8 <example11+0x10>
   e121c:	d503201f 	nop
   e1220:	d503201f 	nop
   e1224:	910083ff 	add	sp, sp, #0x20
   e1228:	d65f03c0 	ret

00000000000e122c <example12>:
   e122c:	d10083ff 	sub	sp, sp, #0x20
   e1230:	f90007e0 	str	x0, [sp, #8]
   e1234:	b9001fff 	str	wzr, [sp, #28]
   e1238:	1400000a 	b	e1260 <example12+0x34>
   e123c:	f94007e0 	ldr	x0, [sp, #8]
   e1240:	b9801fe2 	ldrsw	x2, [sp, #28]
   e1244:	d2850001 	mov	x1, #0x2800                	// #10240
   e1248:	8b010041 	add	x1, x2, x1
   e124c:	b9401fe2 	ldr	w2, [sp, #28]
   e1250:	b8217802 	str	w2, [x0, x1, lsl #2]
   e1254:	b9401fe0 	ldr	w0, [sp, #28]
   e1258:	11000400 	add	w0, w0, #0x1
   e125c:	b9001fe0 	str	w0, [sp, #28]
   e1260:	b9401fe0 	ldr	w0, [sp, #28]
   e1264:	710ffc1f 	cmp	w0, #0x3ff
   e1268:	54fffead 	b.le	e123c <example12+0x10>
   e126c:	d503201f 	nop
   e1270:	d503201f 	nop
   e1274:	910083ff 	add	sp, sp, #0x20
   e1278:	d65f03c0 	ret

00000000000e127c <example13>:
   e127c:	d100c3ff 	sub	sp, sp, #0x30
   e1280:	f9000fe0 	str	x0, [sp, #24]
   e1284:	f9000be1 	str	x1, [sp, #16]
   e1288:	f90007e2 	str	x2, [sp, #8]
   e128c:	f90003e3 	str	x3, [sp]
   e1290:	b9002fff 	str	wzr, [sp, #44]
   e1294:	14000029 	b	e1338 <example13+0xbc>
   e1298:	b90027ff 	str	wzr, [sp, #36]
   e129c:	b9002bff 	str	wzr, [sp, #40]
   e12a0:	1400001a 	b	e1308 <example13+0x8c>
   e12a4:	b9802fe0 	ldrsw	x0, [sp, #44]
   e12a8:	d37df000 	lsl	x0, x0, #3
   e12ac:	f9400be1 	ldr	x1, [sp, #16]
   e12b0:	8b000020 	add	x0, x1, x0
   e12b4:	f9400001 	ldr	x1, [x0]
   e12b8:	b9802be0 	ldrsw	x0, [sp, #40]
   e12bc:	d37ef400 	lsl	x0, x0, #2
   e12c0:	8b000020 	add	x0, x1, x0
   e12c4:	b9400001 	ldr	w1, [x0]
   e12c8:	b9802fe0 	ldrsw	x0, [sp, #44]
   e12cc:	d37df000 	lsl	x0, x0, #3
   e12d0:	f94007e2 	ldr	x2, [sp, #8]
   e12d4:	8b000040 	add	x0, x2, x0
   e12d8:	f9400002 	ldr	x2, [x0]
   e12dc:	b9802be0 	ldrsw	x0, [sp, #40]
   e12e0:	d37ef400 	lsl	x0, x0, #2
   e12e4:	8b000040 	add	x0, x2, x0
   e12e8:	b9400000 	ldr	w0, [x0]
   e12ec:	4b000020 	sub	w0, w1, w0
   e12f0:	b94027e1 	ldr	w1, [sp, #36]
   e12f4:	0b000020 	add	w0, w1, w0
   e12f8:	b90027e0 	str	w0, [sp, #36]
   e12fc:	b9402be0 	ldr	w0, [sp, #40]
   e1300:	11002000 	add	w0, w0, #0x8
   e1304:	b9002be0 	str	w0, [sp, #40]
   e1308:	b9402be0 	ldr	w0, [sp, #40]
   e130c:	710ffc1f 	cmp	w0, #0x3ff
   e1310:	54fffcad 	b.le	e12a4 <example13+0x28>
   e1314:	b9802fe0 	ldrsw	x0, [sp, #44]
   e1318:	d37ef400 	lsl	x0, x0, #2
   e131c:	f94003e1 	ldr	x1, [sp]
   e1320:	8b000020 	add	x0, x1, x0
   e1324:	b94027e1 	ldr	w1, [sp, #36]
   e1328:	b9000001 	str	w1, [x0]
   e132c:	b9402fe0 	ldr	w0, [sp, #44]
   e1330:	11000400 	add	w0, w0, #0x1
   e1334:	b9002fe0 	str	w0, [sp, #44]
   e1338:	b9402fe0 	ldr	w0, [sp, #44]
   e133c:	71007c1f 	cmp	w0, #0x1f
   e1340:	54fffacd 	b.le	e1298 <example13+0x1c>
   e1344:	d503201f 	nop
   e1348:	d503201f 	nop
   e134c:	9100c3ff 	add	sp, sp, #0x30
   e1350:	d65f03c0 	ret

00000000000e1354 <example14>:
   e1354:	d100c3ff 	sub	sp, sp, #0x30
   e1358:	f9000fe0 	str	x0, [sp, #24]
   e135c:	f9000be1 	str	x1, [sp, #16]
   e1360:	f90007e2 	str	x2, [sp, #8]
   e1364:	f90003e3 	str	x3, [sp]
   e1368:	b90027ff 	str	wzr, [sp, #36]
   e136c:	b9002fff 	str	wzr, [sp, #44]
   e1370:	14000034 	b	e1440 <example14+0xec>
   e1374:	b90023ff 	str	wzr, [sp, #32]
   e1378:	b9002bff 	str	wzr, [sp, #40]
   e137c:	14000025 	b	e1410 <example14+0xbc>
   e1380:	b90027ff 	str	wzr, [sp, #36]
   e1384:	1400001d 	b	e13f8 <example14+0xa4>
   e1388:	b94027e1 	ldr	w1, [sp, #36]
   e138c:	b9402fe0 	ldr	w0, [sp, #44]
   e1390:	0b000020 	add	w0, w1, w0
   e1394:	93407c00 	sxtw	x0, w0
   e1398:	d37df000 	lsl	x0, x0, #3
   e139c:	f9400be1 	ldr	x1, [sp, #16]
   e13a0:	8b000020 	add	x0, x1, x0
   e13a4:	f9400001 	ldr	x1, [x0]
   e13a8:	b9802be0 	ldrsw	x0, [sp, #40]
   e13ac:	d37ef400 	lsl	x0, x0, #2
   e13b0:	8b000020 	add	x0, x1, x0
   e13b4:	b9400001 	ldr	w1, [x0]
   e13b8:	b98027e0 	ldrsw	x0, [sp, #36]
   e13bc:	d37df000 	lsl	x0, x0, #3
   e13c0:	f94007e2 	ldr	x2, [sp, #8]
   e13c4:	8b000040 	add	x0, x2, x0
   e13c8:	f9400002 	ldr	x2, [x0]
   e13cc:	b9802be0 	ldrsw	x0, [sp, #40]
   e13d0:	d37ef400 	lsl	x0, x0, #2
   e13d4:	8b000040 	add	x0, x2, x0
   e13d8:	b9400000 	ldr	w0, [x0]
   e13dc:	1b007c20 	mul	w0, w1, w0
   e13e0:	b94023e1 	ldr	w1, [sp, #32]
   e13e4:	0b000020 	add	w0, w1, w0
   e13e8:	b90023e0 	str	w0, [sp, #32]
   e13ec:	b94027e0 	ldr	w0, [sp, #36]
   e13f0:	11000400 	add	w0, w0, #0x1
   e13f4:	b90027e0 	str	w0, [sp, #36]
   e13f8:	b94027e0 	ldr	w0, [sp, #36]
   e13fc:	710ffc1f 	cmp	w0, #0x3ff
   e1400:	54fffc4d 	b.le	e1388 <example14+0x34>
   e1404:	b9402be0 	ldr	w0, [sp, #40]
   e1408:	11000400 	add	w0, w0, #0x1
   e140c:	b9002be0 	str	w0, [sp, #40]
   e1410:	b9402be0 	ldr	w0, [sp, #40]
   e1414:	71007c1f 	cmp	w0, #0x1f
   e1418:	54fffb4d 	b.le	e1380 <example14+0x2c>
   e141c:	b9802fe0 	ldrsw	x0, [sp, #44]
   e1420:	d37ef400 	lsl	x0, x0, #2
   e1424:	f94003e1 	ldr	x1, [sp]
   e1428:	8b000020 	add	x0, x1, x0
   e142c:	b94023e1 	ldr	w1, [sp, #32]
   e1430:	b9000001 	str	w1, [x0]
   e1434:	b9402fe0 	ldr	w0, [sp, #44]
   e1438:	11000400 	add	w0, w0, #0x1
   e143c:	b9002fe0 	str	w0, [sp, #44]
   e1440:	b9402fe0 	ldr	w0, [sp, #44]
   e1444:	71000c1f 	cmp	w0, #0x3
   e1448:	54fff96d 	b.le	e1374 <example14+0x20>
   e144c:	d503201f 	nop
   e1450:	d503201f 	nop
   e1454:	9100c3ff 	add	sp, sp, #0x30
   e1458:	d65f03c0 	ret

00000000000e145c <example23>:
   e145c:	d100c3ff 	sub	sp, sp, #0x30
   e1460:	f9000fe0 	str	x0, [sp, #24]
   e1464:	f9000be1 	str	x1, [sp, #16]
   e1468:	f90007e2 	str	x2, [sp, #8]
   e146c:	b9002fff 	str	wzr, [sp, #44]
   e1470:	1400000e 	b	e14a8 <example23+0x4c>
   e1474:	f9400be0 	ldr	x0, [sp, #16]
   e1478:	91000801 	add	x1, x0, #0x2
   e147c:	f9000be1 	str	x1, [sp, #16]
   e1480:	79400000 	ldrh	w0, [x0]
   e1484:	2a0003e2 	mov	w2, w0
   e1488:	f94007e0 	ldr	x0, [sp, #8]
   e148c:	91001001 	add	x1, x0, #0x4
   e1490:	f90007e1 	str	x1, [sp, #8]
   e1494:	53196041 	lsl	w1, w2, #7
   e1498:	b9000001 	str	w1, [x0]
   e149c:	b9402fe0 	ldr	w0, [sp, #44]
   e14a0:	11000400 	add	w0, w0, #0x1
   e14a4:	b9002fe0 	str	w0, [sp, #44]
   e14a8:	b9402fe0 	ldr	w0, [sp, #44]
   e14ac:	7103fc1f 	cmp	w0, #0xff
   e14b0:	54fffe2d 	b.le	e1474 <example23+0x18>
   e14b4:	d503201f 	nop
   e14b8:	d503201f 	nop
   e14bc:	9100c3ff 	add	sp, sp, #0x30
   e14c0:	d65f03c0 	ret

00000000000e14c4 <init_memory>:
   e14c4:	d10083ff 	sub	sp, sp, #0x20
   e14c8:	f90007e0 	str	x0, [sp, #8]
   e14cc:	f90003e1 	str	x1, [sp]
   e14d0:	52800020 	mov	w0, #0x1                   	// #1
   e14d4:	39007fe0 	strb	w0, [sp, #31]
   e14d8:	14000013 	b	e1524 <init_memory+0x60>
   e14dc:	39407fe1 	ldrb	w1, [sp, #31]
   e14e0:	2a0103e0 	mov	w0, w1
   e14e4:	531d1000 	ubfiz	w0, w0, #3, #5
   e14e8:	4b010000 	sub	w0, w0, w1
   e14ec:	39007fe0 	strb	w0, [sp, #31]
   e14f0:	39407fe1 	ldrb	w1, [sp, #31]
   e14f4:	528004e0 	mov	w0, #0x27                  	// #39
   e14f8:	4a000020 	eor	w0, w1, w0
   e14fc:	39007fe0 	strb	w0, [sp, #31]
   e1500:	39407fe0 	ldrb	w0, [sp, #31]
   e1504:	11000400 	add	w0, w0, #0x1
   e1508:	39007fe0 	strb	w0, [sp, #31]
   e150c:	f94007e0 	ldr	x0, [sp, #8]
   e1510:	39407fe1 	ldrb	w1, [sp, #31]
   e1514:	39000001 	strb	w1, [x0]
   e1518:	f94007e0 	ldr	x0, [sp, #8]
   e151c:	91000400 	add	x0, x0, #0x1
   e1520:	f90007e0 	str	x0, [sp, #8]
   e1524:	f94007e1 	ldr	x1, [sp, #8]
   e1528:	f94003e0 	ldr	x0, [sp]
   e152c:	eb00003f 	cmp	x1, x0
   e1530:	54fffd61 	b.ne	e14dc <init_memory+0x18>  // b.any
   e1534:	d503201f 	nop
   e1538:	d503201f 	nop
   e153c:	910083ff 	add	sp, sp, #0x20
   e1540:	d65f03c0 	ret

00000000000e1544 <digest_memory>:
   e1544:	d10083ff 	sub	sp, sp, #0x20
   e1548:	f90007e0 	str	x0, [sp, #8]
   e154c:	f90003e1 	str	x1, [sp]
   e1550:	52800020 	mov	w0, #0x1                   	// #1
   e1554:	b9001fe0 	str	w0, [sp, #28]
   e1558:	14000015 	b	e15ac <digest_memory+0x68>
   e155c:	b9401fe1 	ldr	w1, [sp, #28]
   e1560:	2a0103e0 	mov	w0, w1
   e1564:	531f7800 	lsl	w0, w0, #1
   e1568:	0b010000 	add	w0, w0, w1
   e156c:	b9001fe0 	str	w0, [sp, #28]
   e1570:	f94007e0 	ldr	x0, [sp, #8]
   e1574:	39400000 	ldrb	w0, [x0]
   e1578:	2a0003e1 	mov	w1, w0
   e157c:	b9401fe0 	ldr	w0, [sp, #28]
   e1580:	4a010000 	eor	w0, w0, w1
   e1584:	b9001fe0 	str	w0, [sp, #28]
   e1588:	b9401fe0 	ldr	w0, [sp, #28]
   e158c:	53087c01 	lsr	w1, w0, #8
   e1590:	b9401fe0 	ldr	w0, [sp, #28]
   e1594:	53185c00 	lsl	w0, w0, #8
   e1598:	4a000020 	eor	w0, w1, w0
   e159c:	b9001fe0 	str	w0, [sp, #28]
   e15a0:	f94007e0 	ldr	x0, [sp, #8]
   e15a4:	91000400 	add	x0, x0, #0x1
   e15a8:	f90007e0 	str	x0, [sp, #8]
   e15ac:	f94007e1 	ldr	x1, [sp, #8]
   e15b0:	f94003e0 	ldr	x0, [sp]
   e15b4:	eb00003f 	cmp	x1, x0
   e15b8:	54fffd21 	b.ne	e155c <digest_memory+0x18>  // b.any
   e15bc:	b9401fe0 	ldr	w0, [sp, #28]
   e15c0:	910083ff 	add	sp, sp, #0x20
   e15c4:	d65f03c0 	ret

00000000000e15c8 <memcpy>:
   e15c8:	d100c3ff 	sub	sp, sp, #0x30
   e15cc:	f9000fe0 	str	x0, [sp, #24]
   e15d0:	f9000be1 	str	x1, [sp, #16]
   e15d4:	f90007e2 	str	x2, [sp, #8]
   e15d8:	f90017ff 	str	xzr, [sp, #40]
   e15dc:	1400000c 	b	e160c <memcpy+0x44>
   e15e0:	f9400be1 	ldr	x1, [sp, #16]
   e15e4:	f94017e0 	ldr	x0, [sp, #40]
   e15e8:	8b000021 	add	x1, x1, x0
   e15ec:	f9400fe2 	ldr	x2, [sp, #24]
   e15f0:	f94017e0 	ldr	x0, [sp, #40]
   e15f4:	8b000040 	add	x0, x2, x0
   e15f8:	39400021 	ldrb	w1, [x1]
   e15fc:	39000001 	strb	w1, [x0]
   e1600:	f94017e0 	ldr	x0, [sp, #40]
   e1604:	91000400 	add	x0, x0, #0x1
   e1608:	f90017e0 	str	x0, [sp, #40]
   e160c:	f94017e1 	ldr	x1, [sp, #40]
   e1610:	f94007e0 	ldr	x0, [sp, #8]
   e1614:	eb00003f 	cmp	x1, x0
   e1618:	54fffe41 	b.ne	e15e0 <memcpy+0x18>  // b.any
   e161c:	f9400fe0 	ldr	x0, [sp, #24]
   e1620:	9100c3ff 	add	sp, sp, #0x30
   e1624:	d65f03c0 	ret

00000000000e1628 <memset>:
   e1628:	d100c3ff 	sub	sp, sp, #0x30
   e162c:	f9000fe0 	str	x0, [sp, #24]
   e1630:	b90017e1 	str	w1, [sp, #20]
   e1634:	f90007e2 	str	x2, [sp, #8]
   e1638:	f90017ff 	str	xzr, [sp, #40]
   e163c:	1400000a 	b	e1664 <memset+0x3c>
   e1640:	f9400fe1 	ldr	x1, [sp, #24]
   e1644:	f94017e0 	ldr	x0, [sp, #40]
   e1648:	8b000020 	add	x0, x1, x0
   e164c:	b94017e1 	ldr	w1, [sp, #20]
   e1650:	12001c21 	and	w1, w1, #0xff
   e1654:	39000001 	strb	w1, [x0]
   e1658:	f94017e0 	ldr	x0, [sp, #40]
   e165c:	91000400 	add	x0, x0, #0x1
   e1660:	f90017e0 	str	x0, [sp, #40]
   e1664:	f94017e1 	ldr	x1, [sp, #40]
   e1668:	f94007e0 	ldr	x0, [sp, #8]
   e166c:	eb00003f 	cmp	x1, x0
   e1670:	54fffe81 	b.ne	e1640 <memset+0x18>  // b.any
   e1674:	f9400fe0 	ldr	x0, [sp, #24]
   e1678:	9100c3ff 	add	sp, sp, #0x30
   e167c:	d65f03c0 	ret

00000000000e1680 <memmove>:
   e1680:	d100c3ff 	sub	sp, sp, #0x30
   e1684:	f9000fe0 	str	x0, [sp, #24]
   e1688:	f9000be1 	str	x1, [sp, #16]
   e168c:	f90007e2 	str	x2, [sp, #8]
   e1690:	f94007e0 	ldr	x0, [sp, #8]
   e1694:	f90017e0 	str	x0, [sp, #40]
   e1698:	1400000e 	b	e16d0 <memmove+0x50>
   e169c:	f94017e0 	ldr	x0, [sp, #40]
   e16a0:	d1000400 	sub	x0, x0, #0x1
   e16a4:	f9400be1 	ldr	x1, [sp, #16]
   e16a8:	8b000021 	add	x1, x1, x0
   e16ac:	f94017e0 	ldr	x0, [sp, #40]
   e16b0:	d1000400 	sub	x0, x0, #0x1
   e16b4:	f9400fe2 	ldr	x2, [sp, #24]
   e16b8:	8b000040 	add	x0, x2, x0
   e16bc:	39400021 	ldrb	w1, [x1]
   e16c0:	39000001 	strb	w1, [x0]
   e16c4:	f94017e0 	ldr	x0, [sp, #40]
   e16c8:	d1000400 	sub	x0, x0, #0x1
   e16cc:	f90017e0 	str	x0, [sp, #40]
   e16d0:	f94017e0 	ldr	x0, [sp, #40]
   e16d4:	f100001f 	cmp	x0, #0x0
   e16d8:	54fffe21 	b.ne	e169c <memmove+0x1c>  // b.any
   e16dc:	f9400fe0 	ldr	x0, [sp, #24]
   e16e0:	9100c3ff 	add	sp, sp, #0x30
   e16e4:	d65f03c0 	ret
