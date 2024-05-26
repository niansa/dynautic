
vectorization.c.elf:     file format elf64-littleaarch64


Disassembly of section .start:

00000000000e0000 <_start>:
   e0000:	d10183ff 	sub	sp, sp, #0x60
   e0004:	d140cbff 	sub	sp, sp, #0x32, lsl #12
   e0008:	a9007bfd 	stp	x29, x30, [sp]
   e000c:	910003fd 	mov	x29, sp
   e0010:	f9000bf3 	str	x19, [sp, #16]
   e0014:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0018:	b920381f 	str	wzr, [x0, #8248]
   e001c:	b9002fff 	str	wzr, [sp, #44]
   e0020:	52808000 	mov	w0, #0x400                 	// #1024
   e0024:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0028:	b9203420 	str	w0, [x1, #8244]
   e002c:	9100c3e0 	add	x0, sp, #0x30
   e0030:	91401001 	add	x1, x0, #0x4, lsl #12
   e0034:	9100c3e0 	add	x0, sp, #0x30
   e0038:	91400c00 	add	x0, x0, #0x3, lsl #12
   e003c:	9400042d 	bl	e10f0 <init_memory>
   e0040:	9100c3e0 	add	x0, sp, #0x30
   e0044:	91401401 	add	x1, x0, #0x5, lsl #12
   e0048:	9100c3e0 	add	x0, sp, #0x30
   e004c:	91401000 	add	x0, x0, #0x4, lsl #12
   e0050:	94000428 	bl	e10f0 <init_memory>
   e0054:	9100c3e0 	add	x0, sp, #0x30
   e0058:	91401801 	add	x1, x0, #0x6, lsl #12
   e005c:	9100c3e0 	add	x0, sp, #0x30
   e0060:	91401400 	add	x0, x0, #0x5, lsl #12
   e0064:	94000423 	bl	e10f0 <init_memory>
   e0068:	9100c3e0 	add	x0, sp, #0x30
   e006c:	91400401 	add	x1, x0, #0x1, lsl #12
   e0070:	9100c3e0 	add	x0, sp, #0x30
   e0074:	91200000 	add	x0, x0, #0x800
   e0078:	9400041e 	bl	e10f0 <init_memory>
   e007c:	9100c3e1 	add	x1, sp, #0x30
   e0080:	d2830000 	mov	x0, #0x1800                	// #6144
   e0084:	8b000021 	add	x1, x1, x0
   e0088:	9100c3e0 	add	x0, sp, #0x30
   e008c:	91400400 	add	x0, x0, #0x1, lsl #12
   e0090:	94000418 	bl	e10f0 <init_memory>
   e0094:	9100c3e0 	add	x0, sp, #0x30
   e0098:	91400802 	add	x2, x0, #0x2, lsl #12
   e009c:	9100c3e1 	add	x1, sp, #0x30
   e00a0:	d2830000 	mov	x0, #0x1800                	// #6144
   e00a4:	8b000020 	add	x0, x1, x0
   e00a8:	aa0203e1 	mov	x1, x2
   e00ac:	94000411 	bl	e10f0 <init_memory>
   e00b0:	9100c3e0 	add	x0, sp, #0x30
   e00b4:	91403001 	add	x1, x0, #0xc, lsl #12
   e00b8:	9100c3e0 	add	x0, sp, #0x30
   e00bc:	91402800 	add	x0, x0, #0xa, lsl #12
   e00c0:	9400040c 	bl	e10f0 <init_memory>
   e00c4:	9100c3e0 	add	x0, sp, #0x30
   e00c8:	91403801 	add	x1, x0, #0xe, lsl #12
   e00cc:	9100c3e0 	add	x0, sp, #0x30
   e00d0:	91403000 	add	x0, x0, #0xc, lsl #12
   e00d4:	94000407 	bl	e10f0 <init_memory>
   e00d8:	9100c3e0 	add	x0, sp, #0x30
   e00dc:	91404001 	add	x1, x0, #0x10, lsl #12
   e00e0:	9100c3e0 	add	x0, sp, #0x30
   e00e4:	91403800 	add	x0, x0, #0xe, lsl #12
   e00e8:	94000402 	bl	e10f0 <init_memory>
   e00ec:	9100c3e0 	add	x0, sp, #0x30
   e00f0:	91400c01 	add	x1, x0, #0x3, lsl #12
   e00f4:	9100c3e0 	add	x0, sp, #0x30
   e00f8:	91400800 	add	x0, x0, #0x2, lsl #12
   e00fc:	940003fd 	bl	e10f0 <init_memory>
   e0100:	9100c3e0 	add	x0, sp, #0x30
   e0104:	91401c01 	add	x1, x0, #0x7, lsl #12
   e0108:	9100c3e0 	add	x0, sp, #0x30
   e010c:	91401800 	add	x0, x0, #0x6, lsl #12
   e0110:	940003f8 	bl	e10f0 <init_memory>
   e0114:	9100c3e0 	add	x0, sp, #0x30
   e0118:	91402001 	add	x1, x0, #0x8, lsl #12
   e011c:	9100c3e0 	add	x0, sp, #0x30
   e0120:	91401c00 	add	x0, x0, #0x7, lsl #12
   e0124:	940003f3 	bl	e10f0 <init_memory>
   e0128:	9100c3e0 	add	x0, sp, #0x30
   e012c:	91404c01 	add	x1, x0, #0x13, lsl #12
   e0130:	9100c3e0 	add	x0, sp, #0x30
   e0134:	91404800 	add	x0, x0, #0x12, lsl #12
   e0138:	940003ee 	bl	e10f0 <init_memory>
   e013c:	9100c3e0 	add	x0, sp, #0x30
   e0140:	94000162 	bl	e06c8 <example1>
   e0144:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0148:	b9205c1f 	str	wzr, [x0, #8284]
   e014c:	14000008 	b	e016c <_start+0x16c>
   e0150:	9100c3e0 	add	x0, sp, #0x30
   e0154:	9400015d 	bl	e06c8 <example1>
   e0158:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e015c:	b9605c00 	ldr	w0, [x0, #8284]
   e0160:	11000400 	add	w0, w0, #0x1
   e0164:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0168:	b9205c20 	str	w0, [x1, #8284]
   e016c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0170:	b9603401 	ldr	w1, [x0, #8244]
   e0174:	2a0103e0 	mov	w0, w1
   e0178:	531e7400 	lsl	w0, w0, #2
   e017c:	0b010000 	add	w0, w0, w1
   e0180:	531f7800 	lsl	w0, w0, #1
   e0184:	2a0003e1 	mov	w1, w0
   e0188:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e018c:	b9605c00 	ldr	w0, [x0, #8284]
   e0190:	6b01001f 	cmp	w0, w1
   e0194:	54fffdeb 	b.lt	e0150 <_start+0x150>  // b.tstop
   e0198:	9100c3e1 	add	x1, sp, #0x30
   e019c:	d2948000 	mov	x0, #0xa400                	// #41984
   e01a0:	8b000021 	add	x1, x1, x0
   e01a4:	9100c3e0 	add	x0, sp, #0x30
   e01a8:	91402800 	add	x0, x0, #0xa, lsl #12
   e01ac:	940003f1 	bl	e1170 <digest_memory>
   e01b0:	2a0003e1 	mov	w1, w0
   e01b4:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e01b8:	b9603800 	ldr	w0, [x0, #8248]
   e01bc:	0b010000 	add	w0, w0, w1
   e01c0:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e01c4:	b9203820 	str	w0, [x1, #8248]
   e01c8:	9100c3e0 	add	x0, sp, #0x30
   e01cc:	52800042 	mov	w2, #0x2                   	// #2
   e01d0:	52808001 	mov	w1, #0x400                 	// #1024
   e01d4:	9400015a 	bl	e073c <example2a>
   e01d8:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e01dc:	b920581f 	str	wzr, [x0, #8280]
   e01e0:	1400000a 	b	e0208 <_start+0x208>
   e01e4:	9100c3e0 	add	x0, sp, #0x30
   e01e8:	52800042 	mov	w2, #0x2                   	// #2
   e01ec:	52808001 	mov	w1, #0x400                 	// #1024
   e01f0:	94000153 	bl	e073c <example2a>
   e01f4:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e01f8:	b9605800 	ldr	w0, [x0, #8280]
   e01fc:	11000400 	add	w0, w0, #0x1
   e0200:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0204:	b9205820 	str	w0, [x1, #8280]
   e0208:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e020c:	b9603400 	ldr	w0, [x0, #8244]
   e0210:	531e7400 	lsl	w0, w0, #2
   e0214:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0218:	b9605821 	ldr	w1, [x1, #8280]
   e021c:	6b00003f 	cmp	w1, w0
   e0220:	54fffe2b 	b.lt	e01e4 <_start+0x1e4>  // b.tstop
   e0224:	9100c3e0 	add	x0, sp, #0x30
   e0228:	91403401 	add	x1, x0, #0xd, lsl #12
   e022c:	9100c3e0 	add	x0, sp, #0x30
   e0230:	91403000 	add	x0, x0, #0xc, lsl #12
   e0234:	940003cf 	bl	e1170 <digest_memory>
   e0238:	2a0003e1 	mov	w1, w0
   e023c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0240:	b9603800 	ldr	w0, [x0, #8248]
   e0244:	0b010000 	add	w0, w0, w1
   e0248:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e024c:	b9203820 	str	w0, [x1, #8248]
   e0250:	9100c3e0 	add	x0, sp, #0x30
   e0254:	52800042 	mov	w2, #0x2                   	// #2
   e0258:	52808001 	mov	w1, #0x400                 	// #1024
   e025c:	9400014e 	bl	e0794 <example2b>
   e0260:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0264:	b920541f 	str	wzr, [x0, #8276]
   e0268:	1400000a 	b	e0290 <_start+0x290>
   e026c:	9100c3e0 	add	x0, sp, #0x30
   e0270:	52800042 	mov	w2, #0x2                   	// #2
   e0274:	52808001 	mov	w1, #0x400                 	// #1024
   e0278:	94000147 	bl	e0794 <example2b>
   e027c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0280:	b9605400 	ldr	w0, [x0, #8276]
   e0284:	11000400 	add	w0, w0, #0x1
   e0288:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e028c:	b9205420 	str	w0, [x1, #8276]
   e0290:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0294:	b9603400 	ldr	w0, [x0, #8244]
   e0298:	531f7800 	lsl	w0, w0, #1
   e029c:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e02a0:	b9605421 	ldr	w1, [x1, #8276]
   e02a4:	6b00003f 	cmp	w1, w0
   e02a8:	54fffe2b 	b.lt	e026c <_start+0x26c>  // b.tstop
   e02ac:	9100c3e0 	add	x0, sp, #0x30
   e02b0:	91402c01 	add	x1, x0, #0xb, lsl #12
   e02b4:	9100c3e0 	add	x0, sp, #0x30
   e02b8:	91402800 	add	x0, x0, #0xa, lsl #12
   e02bc:	940003ad 	bl	e1170 <digest_memory>
   e02c0:	2a0003e1 	mov	w1, w0
   e02c4:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e02c8:	b9603800 	ldr	w0, [x0, #8248]
   e02cc:	0b010000 	add	w0, w0, w1
   e02d0:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e02d4:	b9203820 	str	w0, [x1, #8248]
   e02d8:	9100c3e0 	add	x0, sp, #0x30
   e02dc:	91401002 	add	x2, x0, #0x4, lsl #12
   e02e0:	9100c3e0 	add	x0, sp, #0x30
   e02e4:	91400c01 	add	x1, x0, #0x3, lsl #12
   e02e8:	9100c3e0 	add	x0, sp, #0x30
   e02ec:	aa0203e3 	mov	x3, x2
   e02f0:	aa0103e2 	mov	x2, x1
   e02f4:	52807ec1 	mov	w1, #0x3f6                 	// #1014
   e02f8:	94000177 	bl	e08d4 <example4b>
   e02fc:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0300:	b920501f 	str	wzr, [x0, #8272]
   e0304:	1400000f 	b	e0340 <_start+0x340>
   e0308:	9100c3e0 	add	x0, sp, #0x30
   e030c:	91401002 	add	x2, x0, #0x4, lsl #12
   e0310:	9100c3e0 	add	x0, sp, #0x30
   e0314:	91400c01 	add	x1, x0, #0x3, lsl #12
   e0318:	9100c3e0 	add	x0, sp, #0x30
   e031c:	aa0203e3 	mov	x3, x2
   e0320:	aa0103e2 	mov	x2, x1
   e0324:	52807ec1 	mov	w1, #0x3f6                 	// #1014
   e0328:	9400016b 	bl	e08d4 <example4b>
   e032c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0330:	b9605000 	ldr	w0, [x0, #8272]
   e0334:	11000400 	add	w0, w0, #0x1
   e0338:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e033c:	b9205020 	str	w0, [x1, #8272]
   e0340:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0344:	b9603400 	ldr	w0, [x0, #8244]
   e0348:	531f7800 	lsl	w0, w0, #1
   e034c:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0350:	b9605021 	ldr	w1, [x1, #8272]
   e0354:	6b00003f 	cmp	w1, w0
   e0358:	54fffd8b 	b.lt	e0308 <_start+0x308>  // b.tstop
   e035c:	9100c3e0 	add	x0, sp, #0x30
   e0360:	91401001 	add	x1, x0, #0x4, lsl #12
   e0364:	9100c3e0 	add	x0, sp, #0x30
   e0368:	91400c00 	add	x0, x0, #0x3, lsl #12
   e036c:	94000381 	bl	e1170 <digest_memory>
   e0370:	2a0003e1 	mov	w1, w0
   e0374:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0378:	b9603800 	ldr	w0, [x0, #8248]
   e037c:	0b010000 	add	w0, w0, w1
   e0380:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0384:	b9203820 	str	w0, [x1, #8248]
   e0388:	9100c3e0 	add	x0, sp, #0x30
   e038c:	91401002 	add	x2, x0, #0x4, lsl #12
   e0390:	9100c3e0 	add	x0, sp, #0x30
   e0394:	91400c01 	add	x1, x0, #0x3, lsl #12
   e0398:	9100c3e0 	add	x0, sp, #0x30
   e039c:	aa0203e3 	mov	x3, x2
   e03a0:	aa0103e2 	mov	x2, x1
   e03a4:	52808001 	mov	w1, #0x400                 	// #1024
   e03a8:	94000170 	bl	e0968 <example4c>
   e03ac:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e03b0:	b9204c1f 	str	wzr, [x0, #8268]
   e03b4:	1400000f 	b	e03f0 <_start+0x3f0>
   e03b8:	9100c3e0 	add	x0, sp, #0x30
   e03bc:	91401002 	add	x2, x0, #0x4, lsl #12
   e03c0:	9100c3e0 	add	x0, sp, #0x30
   e03c4:	91400c01 	add	x1, x0, #0x3, lsl #12
   e03c8:	9100c3e0 	add	x0, sp, #0x30
   e03cc:	aa0203e3 	mov	x3, x2
   e03d0:	aa0103e2 	mov	x2, x1
   e03d4:	52808001 	mov	w1, #0x400                 	// #1024
   e03d8:	94000164 	bl	e0968 <example4c>
   e03dc:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e03e0:	b9604c00 	ldr	w0, [x0, #8268]
   e03e4:	11000400 	add	w0, w0, #0x1
   e03e8:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e03ec:	b9204c20 	str	w0, [x1, #8268]
   e03f0:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e03f4:	b9603400 	ldr	w0, [x0, #8244]
   e03f8:	531f7800 	lsl	w0, w0, #1
   e03fc:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0400:	b9604c21 	ldr	w1, [x1, #8268]
   e0404:	6b00003f 	cmp	w1, w0
   e0408:	54fffd8b 	b.lt	e03b8 <_start+0x3b8>  // b.tstop
   e040c:	9100c3e0 	add	x0, sp, #0x30
   e0410:	91401401 	add	x1, x0, #0x5, lsl #12
   e0414:	9100c3e0 	add	x0, sp, #0x30
   e0418:	91401000 	add	x0, x0, #0x4, lsl #12
   e041c:	94000355 	bl	e1170 <digest_memory>
   e0420:	2a0003e1 	mov	w1, w0
   e0424:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0428:	b9603800 	ldr	w0, [x0, #8248]
   e042c:	0b010000 	add	w0, w0, w1
   e0430:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0434:	b9203820 	str	w0, [x1, #8248]
   e0438:	9100c3e0 	add	x0, sp, #0x30
   e043c:	52800081 	mov	w1, #0x4                   	// #4
   e0440:	94000186 	bl	e0a58 <example7>
   e0444:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0448:	b920481f 	str	wzr, [x0, #8264]
   e044c:	14000009 	b	e0470 <_start+0x470>
   e0450:	9100c3e0 	add	x0, sp, #0x30
   e0454:	52800081 	mov	w1, #0x4                   	// #4
   e0458:	94000180 	bl	e0a58 <example7>
   e045c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0460:	b9604800 	ldr	w0, [x0, #8264]
   e0464:	11000400 	add	w0, w0, #0x1
   e0468:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e046c:	b9204820 	str	w0, [x1, #8264]
   e0470:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0474:	b9603400 	ldr	w0, [x0, #8244]
   e0478:	531e7400 	lsl	w0, w0, #2
   e047c:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0480:	b9604821 	ldr	w1, [x1, #8264]
   e0484:	6b00003f 	cmp	w1, w0
   e0488:	54fffe4b 	b.lt	e0450 <_start+0x450>  // b.tstop
   e048c:	9100c3e0 	add	x0, sp, #0x30
   e0490:	91402c01 	add	x1, x0, #0xb, lsl #12
   e0494:	9100c3e0 	add	x0, sp, #0x30
   e0498:	91402800 	add	x0, x0, #0xa, lsl #12
   e049c:	94000335 	bl	e1170 <digest_memory>
   e04a0:	2a0003e1 	mov	w1, w0
   e04a4:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e04a8:	b9603800 	ldr	w0, [x0, #8248]
   e04ac:	0b010000 	add	w0, w0, w1
   e04b0:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e04b4:	b9203820 	str	w0, [x1, #8248]
   e04b8:	9100c3e0 	add	x0, sp, #0x30
   e04bc:	52800101 	mov	w1, #0x8                   	// #8
   e04c0:	94000181 	bl	e0ac4 <example8>
   e04c4:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e04c8:	b920441f 	str	wzr, [x0, #8260]
   e04cc:	14000009 	b	e04f0 <_start+0x4f0>
   e04d0:	9100c3e0 	add	x0, sp, #0x30
   e04d4:	52800101 	mov	w1, #0x8                   	// #8
   e04d8:	9400017b 	bl	e0ac4 <example8>
   e04dc:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e04e0:	b9604400 	ldr	w0, [x0, #8260]
   e04e4:	11000400 	add	w0, w0, #0x1
   e04e8:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e04ec:	b9204420 	str	w0, [x1, #8260]
   e04f0:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e04f4:	b9603400 	ldr	w0, [x0, #8244]
   e04f8:	11000c01 	add	w1, w0, #0x3
   e04fc:	7100001f 	cmp	w0, #0x0
   e0500:	1a80b020 	csel	w0, w1, w0, lt	// lt = tstop
   e0504:	13027c00 	asr	w0, w0, #2
   e0508:	2a0003e1 	mov	w1, w0
   e050c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0510:	b9604400 	ldr	w0, [x0, #8260]
   e0514:	6b01001f 	cmp	w0, w1
   e0518:	54fffdcb 	b.lt	e04d0 <_start+0x4d0>  // b.tstop
   e051c:	9100c3e0 	add	x0, sp, #0x30
   e0520:	91404c01 	add	x1, x0, #0x13, lsl #12
   e0524:	9100c3e0 	add	x0, sp, #0x30
   e0528:	91404800 	add	x0, x0, #0x12, lsl #12
   e052c:	94000311 	bl	e1170 <digest_memory>
   e0530:	2a0003e1 	mov	w1, w0
   e0534:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0538:	b9603800 	ldr	w0, [x0, #8248]
   e053c:	0b010000 	add	w0, w0, w1
   e0540:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0544:	b9203820 	str	w0, [x1, #8248]
   e0548:	9100b3e1 	add	x1, sp, #0x2c
   e054c:	9100c3e0 	add	x0, sp, #0x30
   e0550:	9400017d 	bl	e0b44 <example9>
   e0554:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0558:	b920401f 	str	wzr, [x0, #8256]
   e055c:	14000009 	b	e0580 <_start+0x580>
   e0560:	9100b3e1 	add	x1, sp, #0x2c
   e0564:	9100c3e0 	add	x0, sp, #0x30
   e0568:	94000177 	bl	e0b44 <example9>
   e056c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0570:	b9604000 	ldr	w0, [x0, #8256]
   e0574:	11000400 	add	w0, w0, #0x1
   e0578:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e057c:	b9204020 	str	w0, [x1, #8256]
   e0580:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0584:	b9603400 	ldr	w0, [x0, #8244]
   e0588:	531f7800 	lsl	w0, w0, #1
   e058c:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0590:	b9604021 	ldr	w1, [x1, #8256]
   e0594:	6b00003f 	cmp	w1, w0
   e0598:	54fffe4b 	b.lt	e0560 <_start+0x560>  // b.tstop
   e059c:	b9402fe0 	ldr	w0, [sp, #44]
   e05a0:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e05a4:	b9603821 	ldr	w1, [x1, #8248]
   e05a8:	0b000020 	add	w0, w1, w0
   e05ac:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e05b0:	b9203820 	str	w0, [x1, #8248]
   e05b4:	9100c3e0 	add	x0, sp, #0x30
   e05b8:	91401406 	add	x6, x0, #0x5, lsl #12
   e05bc:	9100c3e0 	add	x0, sp, #0x30
   e05c0:	91401005 	add	x5, x0, #0x4, lsl #12
   e05c4:	9100c3e0 	add	x0, sp, #0x30
   e05c8:	91400c04 	add	x4, x0, #0x3, lsl #12
   e05cc:	9100c3e1 	add	x1, sp, #0x30
   e05d0:	d2830000 	mov	x0, #0x1800                	// #6144
   e05d4:	8b000023 	add	x3, x1, x0
   e05d8:	9100c3e0 	add	x0, sp, #0x30
   e05dc:	91400402 	add	x2, x0, #0x1, lsl #12
   e05e0:	9100c3e0 	add	x0, sp, #0x30
   e05e4:	91200001 	add	x1, x0, #0x800
   e05e8:	9100c3e0 	add	x0, sp, #0x30
   e05ec:	94000176 	bl	e0bc4 <example10a>
   e05f0:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e05f4:	b9203c1f 	str	wzr, [x0, #8252]
   e05f8:	14000015 	b	e064c <_start+0x64c>
   e05fc:	9100c3e0 	add	x0, sp, #0x30
   e0600:	91401406 	add	x6, x0, #0x5, lsl #12
   e0604:	9100c3e0 	add	x0, sp, #0x30
   e0608:	91401005 	add	x5, x0, #0x4, lsl #12
   e060c:	9100c3e0 	add	x0, sp, #0x30
   e0610:	91400c04 	add	x4, x0, #0x3, lsl #12
   e0614:	9100c3e1 	add	x1, sp, #0x30
   e0618:	d2830000 	mov	x0, #0x1800                	// #6144
   e061c:	8b000023 	add	x3, x1, x0
   e0620:	9100c3e0 	add	x0, sp, #0x30
   e0624:	91400402 	add	x2, x0, #0x1, lsl #12
   e0628:	9100c3e0 	add	x0, sp, #0x30
   e062c:	91200001 	add	x1, x0, #0x800
   e0630:	9100c3e0 	add	x0, sp, #0x30
   e0634:	94000164 	bl	e0bc4 <example10a>
   e0638:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e063c:	b9603c00 	ldr	w0, [x0, #8252]
   e0640:	11000400 	add	w0, w0, #0x1
   e0644:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0648:	b9203c20 	str	w0, [x1, #8252]
   e064c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0650:	b9603400 	ldr	w0, [x0, #8244]
   e0654:	531f7800 	lsl	w0, w0, #1
   e0658:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e065c:	b9603c21 	ldr	w1, [x1, #8252]
   e0660:	6b00003f 	cmp	w1, w0
   e0664:	54fffccb 	b.lt	e05fc <_start+0x5fc>  // b.tstop
   e0668:	9100c3e0 	add	x0, sp, #0x30
   e066c:	91401001 	add	x1, x0, #0x4, lsl #12
   e0670:	9100c3e0 	add	x0, sp, #0x30
   e0674:	91400c00 	add	x0, x0, #0x3, lsl #12
   e0678:	940002be 	bl	e1170 <digest_memory>
   e067c:	2a0003f3 	mov	w19, w0
   e0680:	9100c3e0 	add	x0, sp, #0x30
   e0684:	91400401 	add	x1, x0, #0x1, lsl #12
   e0688:	9100c3e0 	add	x0, sp, #0x30
   e068c:	91200000 	add	x0, x0, #0x800
   e0690:	940002b8 	bl	e1170 <digest_memory>
   e0694:	0b000260 	add	w0, w19, w0
   e0698:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e069c:	b9603821 	ldr	w1, [x1, #8248]
   e06a0:	0b000020 	add	w0, w1, w0
   e06a4:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e06a8:	b9203820 	str	w0, [x1, #8248]
   e06ac:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e06b0:	b9603800 	ldr	w0, [x0, #8248]
   e06b4:	f9400bf3 	ldr	x19, [sp, #16]
   e06b8:	a9407bfd 	ldp	x29, x30, [sp]
   e06bc:	910183ff 	add	sp, sp, #0x60
   e06c0:	9140cbff 	add	sp, sp, #0x32, lsl #12
   e06c4:	d65f03c0 	ret

Disassembly of section .text:

00000000000e06c8 <example1>:
   e06c8:	d10083ff 	sub	sp, sp, #0x20
   e06cc:	f90007e0 	str	x0, [sp, #8]
   e06d0:	b9001fff 	str	wzr, [sp, #28]
   e06d4:	14000013 	b	e0720 <example1+0x58>
   e06d8:	f94007e0 	ldr	x0, [sp, #8]
   e06dc:	b9801fe1 	ldrsw	x1, [sp, #28]
   e06e0:	91400c21 	add	x1, x1, #0x3, lsl #12
   e06e4:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e06e8:	f94007e0 	ldr	x0, [sp, #8]
   e06ec:	b9801fe3 	ldrsw	x3, [sp, #28]
   e06f0:	d2870002 	mov	x2, #0x3800                	// #14336
   e06f4:	8b020062 	add	x2, x3, x2
   e06f8:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e06fc:	0b000022 	add	w2, w1, w0
   e0700:	f94007e0 	ldr	x0, [sp, #8]
   e0704:	b9801fe3 	ldrsw	x3, [sp, #28]
   e0708:	d2850001 	mov	x1, #0x2800                	// #10240
   e070c:	8b010061 	add	x1, x3, x1
   e0710:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0714:	b9401fe0 	ldr	w0, [sp, #28]
   e0718:	11000400 	add	w0, w0, #0x1
   e071c:	b9001fe0 	str	w0, [sp, #28]
   e0720:	b9401fe0 	ldr	w0, [sp, #28]
   e0724:	7103fc1f 	cmp	w0, #0xff
   e0728:	54fffd8d 	b.le	e06d8 <example1+0x10>
   e072c:	d503201f 	nop
   e0730:	d503201f 	nop
   e0734:	910083ff 	add	sp, sp, #0x20
   e0738:	d65f03c0 	ret

00000000000e073c <example2a>:
   e073c:	d10083ff 	sub	sp, sp, #0x20
   e0740:	f90007e0 	str	x0, [sp, #8]
   e0744:	b90007e1 	str	w1, [sp, #4]
   e0748:	b90003e2 	str	w2, [sp]
   e074c:	b9001fff 	str	wzr, [sp, #28]
   e0750:	14000009 	b	e0774 <example2a+0x38>
   e0754:	f94007e0 	ldr	x0, [sp, #8]
   e0758:	b9801fe1 	ldrsw	x1, [sp, #28]
   e075c:	91400c21 	add	x1, x1, #0x3, lsl #12
   e0760:	b94003e2 	ldr	w2, [sp]
   e0764:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0768:	b9401fe0 	ldr	w0, [sp, #28]
   e076c:	11000400 	add	w0, w0, #0x1
   e0770:	b9001fe0 	str	w0, [sp, #28]
   e0774:	b9401fe1 	ldr	w1, [sp, #28]
   e0778:	b94007e0 	ldr	w0, [sp, #4]
   e077c:	6b00003f 	cmp	w1, w0
   e0780:	54fffeab 	b.lt	e0754 <example2a+0x18>  // b.tstop
   e0784:	d503201f 	nop
   e0788:	d503201f 	nop
   e078c:	910083ff 	add	sp, sp, #0x20
   e0790:	d65f03c0 	ret

00000000000e0794 <example2b>:
   e0794:	d10083ff 	sub	sp, sp, #0x20
   e0798:	f90007e0 	str	x0, [sp, #8]
   e079c:	b90007e1 	str	w1, [sp, #4]
   e07a0:	b90003e2 	str	w2, [sp]
   e07a4:	b9001fff 	str	wzr, [sp, #28]
   e07a8:	14000013 	b	e07f4 <example2b+0x60>
   e07ac:	f94007e0 	ldr	x0, [sp, #8]
   e07b0:	b9801fe1 	ldrsw	x1, [sp, #28]
   e07b4:	91400c21 	add	x1, x1, #0x3, lsl #12
   e07b8:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e07bc:	f94007e0 	ldr	x0, [sp, #8]
   e07c0:	b9801fe3 	ldrsw	x3, [sp, #28]
   e07c4:	d2870002 	mov	x2, #0x3800                	// #14336
   e07c8:	8b020062 	add	x2, x3, x2
   e07cc:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e07d0:	0a000022 	and	w2, w1, w0
   e07d4:	f94007e0 	ldr	x0, [sp, #8]
   e07d8:	b9801fe3 	ldrsw	x3, [sp, #28]
   e07dc:	d2850001 	mov	x1, #0x2800                	// #10240
   e07e0:	8b010061 	add	x1, x3, x1
   e07e4:	b8217802 	str	w2, [x0, x1, lsl #2]
   e07e8:	b9401fe0 	ldr	w0, [sp, #28]
   e07ec:	11000400 	add	w0, w0, #0x1
   e07f0:	b9001fe0 	str	w0, [sp, #28]
   e07f4:	b94007e0 	ldr	w0, [sp, #4]
   e07f8:	51000401 	sub	w1, w0, #0x1
   e07fc:	b90007e1 	str	w1, [sp, #4]
   e0800:	7100001f 	cmp	w0, #0x0
   e0804:	54fffd41 	b.ne	e07ac <example2b+0x18>  // b.any
   e0808:	d503201f 	nop
   e080c:	d503201f 	nop
   e0810:	910083ff 	add	sp, sp, #0x20
   e0814:	d65f03c0 	ret

00000000000e0818 <example3>:
   e0818:	d10083ff 	sub	sp, sp, #0x20
   e081c:	f9000fe0 	str	x0, [sp, #24]
   e0820:	b90017e1 	str	w1, [sp, #20]
   e0824:	f90007e2 	str	x2, [sp, #8]
   e0828:	f90003e3 	str	x3, [sp]
   e082c:	14000009 	b	e0850 <example3+0x38>
   e0830:	f94003e1 	ldr	x1, [sp]
   e0834:	91001020 	add	x0, x1, #0x4
   e0838:	f90003e0 	str	x0, [sp]
   e083c:	f94007e0 	ldr	x0, [sp, #8]
   e0840:	91001002 	add	x2, x0, #0x4
   e0844:	f90007e2 	str	x2, [sp, #8]
   e0848:	b9400021 	ldr	w1, [x1]
   e084c:	b9000001 	str	w1, [x0]
   e0850:	b94017e0 	ldr	w0, [sp, #20]
   e0854:	51000401 	sub	w1, w0, #0x1
   e0858:	b90017e1 	str	w1, [sp, #20]
   e085c:	7100001f 	cmp	w0, #0x0
   e0860:	54fffe81 	b.ne	e0830 <example3+0x18>  // b.any
   e0864:	d503201f 	nop
   e0868:	d503201f 	nop
   e086c:	910083ff 	add	sp, sp, #0x20
   e0870:	d65f03c0 	ret

00000000000e0874 <example4a>:
   e0874:	d10083ff 	sub	sp, sp, #0x20
   e0878:	f9000fe0 	str	x0, [sp, #24]
   e087c:	b90017e1 	str	w1, [sp, #20]
   e0880:	f90007e2 	str	x2, [sp, #8]
   e0884:	f90003e3 	str	x3, [sp]
   e0888:	1400000a 	b	e08b0 <example4a+0x3c>
   e088c:	f94003e0 	ldr	x0, [sp]
   e0890:	91001001 	add	x1, x0, #0x4
   e0894:	f90003e1 	str	x1, [sp]
   e0898:	b9400001 	ldr	w1, [x0]
   e089c:	f94007e0 	ldr	x0, [sp, #8]
   e08a0:	91001002 	add	x2, x0, #0x4
   e08a4:	f90007e2 	str	x2, [sp, #8]
   e08a8:	11001421 	add	w1, w1, #0x5
   e08ac:	b9000001 	str	w1, [x0]
   e08b0:	b94017e0 	ldr	w0, [sp, #20]
   e08b4:	51000401 	sub	w1, w0, #0x1
   e08b8:	b90017e1 	str	w1, [sp, #20]
   e08bc:	7100001f 	cmp	w0, #0x0
   e08c0:	54fffe61 	b.ne	e088c <example4a+0x18>  // b.any
   e08c4:	d503201f 	nop
   e08c8:	d503201f 	nop
   e08cc:	910083ff 	add	sp, sp, #0x20
   e08d0:	d65f03c0 	ret

00000000000e08d4 <example4b>:
   e08d4:	d100c3ff 	sub	sp, sp, #0x30
   e08d8:	f9000fe0 	str	x0, [sp, #24]
   e08dc:	b90017e1 	str	w1, [sp, #20]
   e08e0:	f90007e2 	str	x2, [sp, #8]
   e08e4:	f90003e3 	str	x3, [sp]
   e08e8:	b9002fff 	str	wzr, [sp, #44]
   e08ec:	14000017 	b	e0948 <example4b+0x74>
   e08f0:	b9402fe0 	ldr	w0, [sp, #44]
   e08f4:	11000401 	add	w1, w0, #0x1
   e08f8:	f9400fe0 	ldr	x0, [sp, #24]
   e08fc:	93407c21 	sxtw	x1, w1
   e0900:	91400c21 	add	x1, x1, #0x3, lsl #12
   e0904:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e0908:	b9402fe0 	ldr	w0, [sp, #44]
   e090c:	11000c02 	add	w2, w0, #0x3
   e0910:	f9400fe0 	ldr	x0, [sp, #24]
   e0914:	93407c43 	sxtw	x3, w2
   e0918:	d2870002 	mov	x2, #0x3800                	// #14336
   e091c:	8b020062 	add	x2, x3, x2
   e0920:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e0924:	0b000022 	add	w2, w1, w0
   e0928:	f9400fe0 	ldr	x0, [sp, #24]
   e092c:	b9802fe3 	ldrsw	x3, [sp, #44]
   e0930:	d2850001 	mov	x1, #0x2800                	// #10240
   e0934:	8b010061 	add	x1, x3, x1
   e0938:	b8217802 	str	w2, [x0, x1, lsl #2]
   e093c:	b9402fe0 	ldr	w0, [sp, #44]
   e0940:	11000400 	add	w0, w0, #0x1
   e0944:	b9002fe0 	str	w0, [sp, #44]
   e0948:	b9402fe1 	ldr	w1, [sp, #44]
   e094c:	b94017e0 	ldr	w0, [sp, #20]
   e0950:	6b00003f 	cmp	w1, w0
   e0954:	54fffceb 	b.lt	e08f0 <example4b+0x1c>  // b.tstop
   e0958:	d503201f 	nop
   e095c:	d503201f 	nop
   e0960:	9100c3ff 	add	sp, sp, #0x30
   e0964:	d65f03c0 	ret

00000000000e0968 <example4c>:
   e0968:	d100c3ff 	sub	sp, sp, #0x30
   e096c:	f9000fe0 	str	x0, [sp, #24]
   e0970:	b90017e1 	str	w1, [sp, #20]
   e0974:	f90007e2 	str	x2, [sp, #8]
   e0978:	f90003e3 	str	x3, [sp]
   e097c:	52800080 	mov	w0, #0x4                   	// #4
   e0980:	b9002be0 	str	w0, [sp, #40]
   e0984:	b9002fff 	str	wzr, [sp, #44]
   e0988:	14000015 	b	e09dc <example4c+0x74>
   e098c:	f9400fe0 	ldr	x0, [sp, #24]
   e0990:	b9802fe2 	ldrsw	x2, [sp, #44]
   e0994:	d2850001 	mov	x1, #0x2800                	// #10240
   e0998:	8b010041 	add	x1, x2, x1
   e099c:	b8617800 	ldr	w0, [x0, x1, lsl #2]
   e09a0:	b90027e0 	str	w0, [sp, #36]
   e09a4:	b94027e1 	ldr	w1, [sp, #36]
   e09a8:	b9402be0 	ldr	w0, [sp, #40]
   e09ac:	6b00003f 	cmp	w1, w0
   e09b0:	5400006d 	b.le	e09bc <example4c+0x54>
   e09b4:	b9402be0 	ldr	w0, [sp, #40]
   e09b8:	14000002 	b	e09c0 <example4c+0x58>
   e09bc:	52800000 	mov	w0, #0x0                   	// #0
   e09c0:	f9400fe1 	ldr	x1, [sp, #24]
   e09c4:	b9802fe2 	ldrsw	x2, [sp, #44]
   e09c8:	91400c42 	add	x2, x2, #0x3, lsl #12
   e09cc:	b8227820 	str	w0, [x1, x2, lsl #2]
   e09d0:	b9402fe0 	ldr	w0, [sp, #44]
   e09d4:	11000400 	add	w0, w0, #0x1
   e09d8:	b9002fe0 	str	w0, [sp, #44]
   e09dc:	b9402fe1 	ldr	w1, [sp, #44]
   e09e0:	b94017e0 	ldr	w0, [sp, #20]
   e09e4:	6b00003f 	cmp	w1, w0
   e09e8:	54fffd2b 	b.lt	e098c <example4c+0x24>  // b.tstop
   e09ec:	d503201f 	nop
   e09f0:	d503201f 	nop
   e09f4:	9100c3ff 	add	sp, sp, #0x30
   e09f8:	d65f03c0 	ret

00000000000e09fc <example5>:
   e09fc:	d100c3ff 	sub	sp, sp, #0x30
   e0a00:	f9000fe0 	str	x0, [sp, #24]
   e0a04:	b90017e1 	str	w1, [sp, #20]
   e0a08:	f90007e2 	str	x2, [sp, #8]
   e0a0c:	b9002fff 	str	wzr, [sp, #44]
   e0a10:	1400000a 	b	e0a38 <example5+0x3c>
   e0a14:	f9400fe0 	ldr	x0, [sp, #24]
   e0a18:	b9802fe2 	ldrsw	x2, [sp, #44]
   e0a1c:	d2848001 	mov	x1, #0x2400                	// #9216
   e0a20:	8b010041 	add	x1, x2, x1
   e0a24:	528000a2 	mov	w2, #0x5                   	// #5
   e0a28:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0a2c:	b9402fe0 	ldr	w0, [sp, #44]
   e0a30:	11000400 	add	w0, w0, #0x1
   e0a34:	b9002fe0 	str	w0, [sp, #44]
   e0a38:	b9402fe1 	ldr	w1, [sp, #44]
   e0a3c:	b94017e0 	ldr	w0, [sp, #20]
   e0a40:	6b00003f 	cmp	w1, w0
   e0a44:	54fffe8b 	b.lt	e0a14 <example5+0x18>  // b.tstop
   e0a48:	d503201f 	nop
   e0a4c:	d503201f 	nop
   e0a50:	9100c3ff 	add	sp, sp, #0x30
   e0a54:	d65f03c0 	ret

00000000000e0a58 <example7>:
   e0a58:	d10083ff 	sub	sp, sp, #0x20
   e0a5c:	f90007e0 	str	x0, [sp, #8]
   e0a60:	b90007e1 	str	w1, [sp, #4]
   e0a64:	b9001fff 	str	wzr, [sp, #28]
   e0a68:	14000010 	b	e0aa8 <example7+0x50>
   e0a6c:	b9401fe1 	ldr	w1, [sp, #28]
   e0a70:	b94007e0 	ldr	w0, [sp, #4]
   e0a74:	0b000021 	add	w1, w1, w0
   e0a78:	f94007e0 	ldr	x0, [sp, #8]
   e0a7c:	93407c21 	sxtw	x1, w1
   e0a80:	91400c21 	add	x1, x1, #0x3, lsl #12
   e0a84:	b8617802 	ldr	w2, [x0, x1, lsl #2]
   e0a88:	f94007e0 	ldr	x0, [sp, #8]
   e0a8c:	b9801fe3 	ldrsw	x3, [sp, #28]
   e0a90:	d2850001 	mov	x1, #0x2800                	// #10240
   e0a94:	8b010061 	add	x1, x3, x1
   e0a98:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0a9c:	b9401fe0 	ldr	w0, [sp, #28]
   e0aa0:	11000400 	add	w0, w0, #0x1
   e0aa4:	b9001fe0 	str	w0, [sp, #28]
   e0aa8:	b9401fe0 	ldr	w0, [sp, #28]
   e0aac:	710ffc1f 	cmp	w0, #0x3ff
   e0ab0:	54fffded 	b.le	e0a6c <example7+0x14>
   e0ab4:	d503201f 	nop
   e0ab8:	d503201f 	nop
   e0abc:	910083ff 	add	sp, sp, #0x20
   e0ac0:	d65f03c0 	ret

00000000000e0ac4 <example8>:
   e0ac4:	d10083ff 	sub	sp, sp, #0x20
   e0ac8:	f90007e0 	str	x0, [sp, #8]
   e0acc:	b90007e1 	str	w1, [sp, #4]
   e0ad0:	b9001fff 	str	wzr, [sp, #28]
   e0ad4:	14000015 	b	e0b28 <example8+0x64>
   e0ad8:	b9001bff 	str	wzr, [sp, #24]
   e0adc:	1400000d 	b	e0b10 <example8+0x4c>
   e0ae0:	f94007e0 	ldr	x0, [sp, #8]
   e0ae4:	b9801be1 	ldrsw	x1, [sp, #24]
   e0ae8:	b9801fe2 	ldrsw	x2, [sp, #28]
   e0aec:	d376d442 	lsl	x2, x2, #10
   e0af0:	8b010042 	add	x2, x2, x1
   e0af4:	d2890001 	mov	x1, #0x4800                	// #18432
   e0af8:	8b010041 	add	x1, x2, x1
   e0afc:	b94007e2 	ldr	w2, [sp, #4]
   e0b00:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0b04:	b9401be0 	ldr	w0, [sp, #24]
   e0b08:	11000400 	add	w0, w0, #0x1
   e0b0c:	b9001be0 	str	w0, [sp, #24]
   e0b10:	b9401be0 	ldr	w0, [sp, #24]
   e0b14:	710ffc1f 	cmp	w0, #0x3ff
   e0b18:	54fffe4d 	b.le	e0ae0 <example8+0x1c>
   e0b1c:	b9401fe0 	ldr	w0, [sp, #28]
   e0b20:	11000400 	add	w0, w0, #0x1
   e0b24:	b9001fe0 	str	w0, [sp, #28]
   e0b28:	b9401fe0 	ldr	w0, [sp, #28]
   e0b2c:	71007c1f 	cmp	w0, #0x1f
   e0b30:	54fffd4d 	b.le	e0ad8 <example8+0x14>
   e0b34:	d503201f 	nop
   e0b38:	d503201f 	nop
   e0b3c:	910083ff 	add	sp, sp, #0x20
   e0b40:	d65f03c0 	ret

00000000000e0b44 <example9>:
   e0b44:	d10083ff 	sub	sp, sp, #0x20
   e0b48:	f90007e0 	str	x0, [sp, #8]
   e0b4c:	f90003e1 	str	x1, [sp]
   e0b50:	b9001bff 	str	wzr, [sp, #24]
   e0b54:	b9001fff 	str	wzr, [sp, #28]
   e0b58:	14000012 	b	e0ba0 <example9+0x5c>
   e0b5c:	f94007e0 	ldr	x0, [sp, #8]
   e0b60:	b9801fe2 	ldrsw	x2, [sp, #28]
   e0b64:	d2830001 	mov	x1, #0x1800                	// #6144
   e0b68:	8b010041 	add	x1, x2, x1
   e0b6c:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e0b70:	f94007e0 	ldr	x0, [sp, #8]
   e0b74:	b9801fe3 	ldrsw	x3, [sp, #28]
   e0b78:	d2838002 	mov	x2, #0x1c00                	// #7168
   e0b7c:	8b020062 	add	x2, x3, x2
   e0b80:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e0b84:	4b000020 	sub	w0, w1, w0
   e0b88:	b9401be1 	ldr	w1, [sp, #24]
   e0b8c:	0b000020 	add	w0, w1, w0
   e0b90:	b9001be0 	str	w0, [sp, #24]
   e0b94:	b9401fe0 	ldr	w0, [sp, #28]
   e0b98:	11000400 	add	w0, w0, #0x1
   e0b9c:	b9001fe0 	str	w0, [sp, #28]
   e0ba0:	b9401fe0 	ldr	w0, [sp, #28]
   e0ba4:	710ffc1f 	cmp	w0, #0x3ff
   e0ba8:	54fffdad 	b.le	e0b5c <example9+0x18>
   e0bac:	f94003e0 	ldr	x0, [sp]
   e0bb0:	b9401be1 	ldr	w1, [sp, #24]
   e0bb4:	b9000001 	str	w1, [x0]
   e0bb8:	d503201f 	nop
   e0bbc:	910083ff 	add	sp, sp, #0x20
   e0bc0:	d65f03c0 	ret

00000000000e0bc4 <example10a>:
   e0bc4:	d10143ff 	sub	sp, sp, #0x50
   e0bc8:	f9001fe0 	str	x0, [sp, #56]
   e0bcc:	f9001be1 	str	x1, [sp, #48]
   e0bd0:	f90017e2 	str	x2, [sp, #40]
   e0bd4:	f90013e3 	str	x3, [sp, #32]
   e0bd8:	f9000fe4 	str	x4, [sp, #24]
   e0bdc:	f9000be5 	str	x5, [sp, #16]
   e0be0:	f90007e6 	str	x6, [sp, #8]
   e0be4:	b9004fff 	str	wzr, [sp, #76]
   e0be8:	14000023 	b	e0c74 <example10a+0xb0>
   e0bec:	f9401fe0 	ldr	x0, [sp, #56]
   e0bf0:	b9804fe1 	ldrsw	x1, [sp, #76]
   e0bf4:	91400421 	add	x1, x1, #0x1, lsl #12
   e0bf8:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e0bfc:	f9401fe0 	ldr	x0, [sp, #56]
   e0c00:	b9804fe3 	ldrsw	x3, [sp, #76]
   e0c04:	d2828002 	mov	x2, #0x1400                	// #5120
   e0c08:	8b020062 	add	x2, x3, x2
   e0c0c:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e0c10:	0b000022 	add	w2, w1, w0
   e0c14:	f9401fe0 	ldr	x0, [sp, #56]
   e0c18:	b9804fe1 	ldrsw	x1, [sp, #76]
   e0c1c:	91300021 	add	x1, x1, #0xc00
   e0c20:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0c24:	f9401fe0 	ldr	x0, [sp, #56]
   e0c28:	b9804fe1 	ldrsw	x1, [sp, #76]
   e0c2c:	91200021 	add	x1, x1, #0x800
   e0c30:	78e17800 	ldrsh	w0, [x0, x1, lsl #1]
   e0c34:	12003c01 	and	w1, w0, #0xffff
   e0c38:	f9401fe0 	ldr	x0, [sp, #56]
   e0c3c:	b9804fe2 	ldrsw	x2, [sp, #76]
   e0c40:	91300042 	add	x2, x2, #0xc00
   e0c44:	78e27800 	ldrsh	w0, [x0, x2, lsl #1]
   e0c48:	12003c00 	and	w0, w0, #0xffff
   e0c4c:	0b000020 	add	w0, w1, w0
   e0c50:	12003c00 	and	w0, w0, #0xffff
   e0c54:	13003c02 	sxth	w2, w0
   e0c58:	f9401fe0 	ldr	x0, [sp, #56]
   e0c5c:	b9804fe1 	ldrsw	x1, [sp, #76]
   e0c60:	91100021 	add	x1, x1, #0x400
   e0c64:	78217802 	strh	w2, [x0, x1, lsl #1]
   e0c68:	b9404fe0 	ldr	w0, [sp, #76]
   e0c6c:	11000400 	add	w0, w0, #0x1
   e0c70:	b9004fe0 	str	w0, [sp, #76]
   e0c74:	b9404fe0 	ldr	w0, [sp, #76]
   e0c78:	710ffc1f 	cmp	w0, #0x3ff
   e0c7c:	54fffb8d 	b.le	e0bec <example10a+0x28>
   e0c80:	d503201f 	nop
   e0c84:	d503201f 	nop
   e0c88:	910143ff 	add	sp, sp, #0x50
   e0c8c:	d65f03c0 	ret

00000000000e0c90 <example10b>:
   e0c90:	d10143ff 	sub	sp, sp, #0x50
   e0c94:	f9001fe0 	str	x0, [sp, #56]
   e0c98:	f9001be1 	str	x1, [sp, #48]
   e0c9c:	f90017e2 	str	x2, [sp, #40]
   e0ca0:	f90013e3 	str	x3, [sp, #32]
   e0ca4:	f9000fe4 	str	x4, [sp, #24]
   e0ca8:	f9000be5 	str	x5, [sp, #16]
   e0cac:	f90007e6 	str	x6, [sp, #8]
   e0cb0:	b9004fff 	str	wzr, [sp, #76]
   e0cb4:	1400000d 	b	e0ce8 <example10b+0x58>
   e0cb8:	f9401fe0 	ldr	x0, [sp, #56]
   e0cbc:	b9804fe1 	ldrsw	x1, [sp, #76]
   e0cc0:	91200021 	add	x1, x1, #0x800
   e0cc4:	78e17800 	ldrsh	w0, [x0, x1, lsl #1]
   e0cc8:	2a0003e2 	mov	w2, w0
   e0ccc:	f9401fe0 	ldr	x0, [sp, #56]
   e0cd0:	b9804fe1 	ldrsw	x1, [sp, #76]
   e0cd4:	91300021 	add	x1, x1, #0xc00
   e0cd8:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0cdc:	b9404fe0 	ldr	w0, [sp, #76]
   e0ce0:	11000400 	add	w0, w0, #0x1
   e0ce4:	b9004fe0 	str	w0, [sp, #76]
   e0ce8:	b9404fe0 	ldr	w0, [sp, #76]
   e0cec:	710ffc1f 	cmp	w0, #0x3ff
   e0cf0:	54fffe4d 	b.le	e0cb8 <example10b+0x28>
   e0cf4:	d503201f 	nop
   e0cf8:	d503201f 	nop
   e0cfc:	910143ff 	add	sp, sp, #0x50
   e0d00:	d65f03c0 	ret

00000000000e0d04 <example11>:
   e0d04:	d10083ff 	sub	sp, sp, #0x20
   e0d08:	f90007e0 	str	x0, [sp, #8]
   e0d0c:	b9001fff 	str	wzr, [sp, #28]
   e0d10:	1400004b 	b	e0e3c <example11+0x138>
   e0d14:	b9401fe0 	ldr	w0, [sp, #28]
   e0d18:	531f7800 	lsl	w0, w0, #1
   e0d1c:	11000401 	add	w1, w0, #0x1
   e0d20:	f94007e0 	ldr	x0, [sp, #8]
   e0d24:	93407c21 	sxtw	x1, w1
   e0d28:	91400c21 	add	x1, x1, #0x3, lsl #12
   e0d2c:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e0d30:	b9401fe0 	ldr	w0, [sp, #28]
   e0d34:	531f7800 	lsl	w0, w0, #1
   e0d38:	11000402 	add	w2, w0, #0x1
   e0d3c:	f94007e0 	ldr	x0, [sp, #8]
   e0d40:	93407c43 	sxtw	x3, w2
   e0d44:	d2870002 	mov	x2, #0x3800                	// #14336
   e0d48:	8b020062 	add	x2, x3, x2
   e0d4c:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e0d50:	1b007c21 	mul	w1, w1, w0
   e0d54:	b9401fe0 	ldr	w0, [sp, #28]
   e0d58:	531f7802 	lsl	w2, w0, #1
   e0d5c:	f94007e0 	ldr	x0, [sp, #8]
   e0d60:	93407c42 	sxtw	x2, w2
   e0d64:	91400c42 	add	x2, x2, #0x3, lsl #12
   e0d68:	b8627802 	ldr	w2, [x0, x2, lsl #2]
   e0d6c:	b9401fe0 	ldr	w0, [sp, #28]
   e0d70:	531f7803 	lsl	w3, w0, #1
   e0d74:	f94007e0 	ldr	x0, [sp, #8]
   e0d78:	93407c64 	sxtw	x4, w3
   e0d7c:	d2870003 	mov	x3, #0x3800                	// #14336
   e0d80:	8b030083 	add	x3, x4, x3
   e0d84:	b8637800 	ldr	w0, [x0, x3, lsl #2]
   e0d88:	1b007c40 	mul	w0, w2, w0
   e0d8c:	4b000022 	sub	w2, w1, w0
   e0d90:	f94007e0 	ldr	x0, [sp, #8]
   e0d94:	b9801fe3 	ldrsw	x3, [sp, #28]
   e0d98:	d2850001 	mov	x1, #0x2800                	// #10240
   e0d9c:	8b010061 	add	x1, x3, x1
   e0da0:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0da4:	b9401fe0 	ldr	w0, [sp, #28]
   e0da8:	531f7801 	lsl	w1, w0, #1
   e0dac:	f94007e0 	ldr	x0, [sp, #8]
   e0db0:	93407c21 	sxtw	x1, w1
   e0db4:	91400c21 	add	x1, x1, #0x3, lsl #12
   e0db8:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e0dbc:	b9401fe0 	ldr	w0, [sp, #28]
   e0dc0:	531f7800 	lsl	w0, w0, #1
   e0dc4:	11000402 	add	w2, w0, #0x1
   e0dc8:	f94007e0 	ldr	x0, [sp, #8]
   e0dcc:	93407c43 	sxtw	x3, w2
   e0dd0:	d2870002 	mov	x2, #0x3800                	// #14336
   e0dd4:	8b020062 	add	x2, x3, x2
   e0dd8:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e0ddc:	1b007c21 	mul	w1, w1, w0
   e0de0:	b9401fe0 	ldr	w0, [sp, #28]
   e0de4:	531f7800 	lsl	w0, w0, #1
   e0de8:	11000402 	add	w2, w0, #0x1
   e0dec:	f94007e0 	ldr	x0, [sp, #8]
   e0df0:	93407c42 	sxtw	x2, w2
   e0df4:	91400c42 	add	x2, x2, #0x3, lsl #12
   e0df8:	b8627802 	ldr	w2, [x0, x2, lsl #2]
   e0dfc:	b9401fe0 	ldr	w0, [sp, #28]
   e0e00:	531f7803 	lsl	w3, w0, #1
   e0e04:	f94007e0 	ldr	x0, [sp, #8]
   e0e08:	93407c64 	sxtw	x4, w3
   e0e0c:	d2870003 	mov	x3, #0x3800                	// #14336
   e0e10:	8b030083 	add	x3, x4, x3
   e0e14:	b8637800 	ldr	w0, [x0, x3, lsl #2]
   e0e18:	1b007c40 	mul	w0, w2, w0
   e0e1c:	0b000022 	add	w2, w1, w0
   e0e20:	f94007e0 	ldr	x0, [sp, #8]
   e0e24:	b9801fe1 	ldrsw	x1, [sp, #28]
   e0e28:	91401021 	add	x1, x1, #0x4, lsl #12
   e0e2c:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0e30:	b9401fe0 	ldr	w0, [sp, #28]
   e0e34:	11000400 	add	w0, w0, #0x1
   e0e38:	b9001fe0 	str	w0, [sp, #28]
   e0e3c:	b9401fe0 	ldr	w0, [sp, #28]
   e0e40:	7107fc1f 	cmp	w0, #0x1ff
   e0e44:	54fff68d 	b.le	e0d14 <example11+0x10>
   e0e48:	d503201f 	nop
   e0e4c:	d503201f 	nop
   e0e50:	910083ff 	add	sp, sp, #0x20
   e0e54:	d65f03c0 	ret

00000000000e0e58 <example12>:
   e0e58:	d10083ff 	sub	sp, sp, #0x20
   e0e5c:	f90007e0 	str	x0, [sp, #8]
   e0e60:	b9001fff 	str	wzr, [sp, #28]
   e0e64:	1400000a 	b	e0e8c <example12+0x34>
   e0e68:	f94007e0 	ldr	x0, [sp, #8]
   e0e6c:	b9801fe2 	ldrsw	x2, [sp, #28]
   e0e70:	d2850001 	mov	x1, #0x2800                	// #10240
   e0e74:	8b010041 	add	x1, x2, x1
   e0e78:	b9401fe2 	ldr	w2, [sp, #28]
   e0e7c:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0e80:	b9401fe0 	ldr	w0, [sp, #28]
   e0e84:	11000400 	add	w0, w0, #0x1
   e0e88:	b9001fe0 	str	w0, [sp, #28]
   e0e8c:	b9401fe0 	ldr	w0, [sp, #28]
   e0e90:	710ffc1f 	cmp	w0, #0x3ff
   e0e94:	54fffead 	b.le	e0e68 <example12+0x10>
   e0e98:	d503201f 	nop
   e0e9c:	d503201f 	nop
   e0ea0:	910083ff 	add	sp, sp, #0x20
   e0ea4:	d65f03c0 	ret

00000000000e0ea8 <example13>:
   e0ea8:	d100c3ff 	sub	sp, sp, #0x30
   e0eac:	f9000fe0 	str	x0, [sp, #24]
   e0eb0:	f9000be1 	str	x1, [sp, #16]
   e0eb4:	f90007e2 	str	x2, [sp, #8]
   e0eb8:	f90003e3 	str	x3, [sp]
   e0ebc:	b9002fff 	str	wzr, [sp, #44]
   e0ec0:	14000029 	b	e0f64 <example13+0xbc>
   e0ec4:	b90027ff 	str	wzr, [sp, #36]
   e0ec8:	b9002bff 	str	wzr, [sp, #40]
   e0ecc:	1400001a 	b	e0f34 <example13+0x8c>
   e0ed0:	b9802fe0 	ldrsw	x0, [sp, #44]
   e0ed4:	d37df000 	lsl	x0, x0, #3
   e0ed8:	f9400be1 	ldr	x1, [sp, #16]
   e0edc:	8b000020 	add	x0, x1, x0
   e0ee0:	f9400001 	ldr	x1, [x0]
   e0ee4:	b9802be0 	ldrsw	x0, [sp, #40]
   e0ee8:	d37ef400 	lsl	x0, x0, #2
   e0eec:	8b000020 	add	x0, x1, x0
   e0ef0:	b9400001 	ldr	w1, [x0]
   e0ef4:	b9802fe0 	ldrsw	x0, [sp, #44]
   e0ef8:	d37df000 	lsl	x0, x0, #3
   e0efc:	f94007e2 	ldr	x2, [sp, #8]
   e0f00:	8b000040 	add	x0, x2, x0
   e0f04:	f9400002 	ldr	x2, [x0]
   e0f08:	b9802be0 	ldrsw	x0, [sp, #40]
   e0f0c:	d37ef400 	lsl	x0, x0, #2
   e0f10:	8b000040 	add	x0, x2, x0
   e0f14:	b9400000 	ldr	w0, [x0]
   e0f18:	4b000020 	sub	w0, w1, w0
   e0f1c:	b94027e1 	ldr	w1, [sp, #36]
   e0f20:	0b000020 	add	w0, w1, w0
   e0f24:	b90027e0 	str	w0, [sp, #36]
   e0f28:	b9402be0 	ldr	w0, [sp, #40]
   e0f2c:	11002000 	add	w0, w0, #0x8
   e0f30:	b9002be0 	str	w0, [sp, #40]
   e0f34:	b9402be0 	ldr	w0, [sp, #40]
   e0f38:	710ffc1f 	cmp	w0, #0x3ff
   e0f3c:	54fffcad 	b.le	e0ed0 <example13+0x28>
   e0f40:	b9802fe0 	ldrsw	x0, [sp, #44]
   e0f44:	d37ef400 	lsl	x0, x0, #2
   e0f48:	f94003e1 	ldr	x1, [sp]
   e0f4c:	8b000020 	add	x0, x1, x0
   e0f50:	b94027e1 	ldr	w1, [sp, #36]
   e0f54:	b9000001 	str	w1, [x0]
   e0f58:	b9402fe0 	ldr	w0, [sp, #44]
   e0f5c:	11000400 	add	w0, w0, #0x1
   e0f60:	b9002fe0 	str	w0, [sp, #44]
   e0f64:	b9402fe0 	ldr	w0, [sp, #44]
   e0f68:	71007c1f 	cmp	w0, #0x1f
   e0f6c:	54fffacd 	b.le	e0ec4 <example13+0x1c>
   e0f70:	d503201f 	nop
   e0f74:	d503201f 	nop
   e0f78:	9100c3ff 	add	sp, sp, #0x30
   e0f7c:	d65f03c0 	ret

00000000000e0f80 <example14>:
   e0f80:	d100c3ff 	sub	sp, sp, #0x30
   e0f84:	f9000fe0 	str	x0, [sp, #24]
   e0f88:	f9000be1 	str	x1, [sp, #16]
   e0f8c:	f90007e2 	str	x2, [sp, #8]
   e0f90:	f90003e3 	str	x3, [sp]
   e0f94:	b90027ff 	str	wzr, [sp, #36]
   e0f98:	b9002fff 	str	wzr, [sp, #44]
   e0f9c:	14000034 	b	e106c <example14+0xec>
   e0fa0:	b90023ff 	str	wzr, [sp, #32]
   e0fa4:	b9002bff 	str	wzr, [sp, #40]
   e0fa8:	14000025 	b	e103c <example14+0xbc>
   e0fac:	b90027ff 	str	wzr, [sp, #36]
   e0fb0:	1400001d 	b	e1024 <example14+0xa4>
   e0fb4:	b94027e1 	ldr	w1, [sp, #36]
   e0fb8:	b9402fe0 	ldr	w0, [sp, #44]
   e0fbc:	0b000020 	add	w0, w1, w0
   e0fc0:	93407c00 	sxtw	x0, w0
   e0fc4:	d37df000 	lsl	x0, x0, #3
   e0fc8:	f9400be1 	ldr	x1, [sp, #16]
   e0fcc:	8b000020 	add	x0, x1, x0
   e0fd0:	f9400001 	ldr	x1, [x0]
   e0fd4:	b9802be0 	ldrsw	x0, [sp, #40]
   e0fd8:	d37ef400 	lsl	x0, x0, #2
   e0fdc:	8b000020 	add	x0, x1, x0
   e0fe0:	b9400001 	ldr	w1, [x0]
   e0fe4:	b98027e0 	ldrsw	x0, [sp, #36]
   e0fe8:	d37df000 	lsl	x0, x0, #3
   e0fec:	f94007e2 	ldr	x2, [sp, #8]
   e0ff0:	8b000040 	add	x0, x2, x0
   e0ff4:	f9400002 	ldr	x2, [x0]
   e0ff8:	b9802be0 	ldrsw	x0, [sp, #40]
   e0ffc:	d37ef400 	lsl	x0, x0, #2
   e1000:	8b000040 	add	x0, x2, x0
   e1004:	b9400000 	ldr	w0, [x0]
   e1008:	1b007c20 	mul	w0, w1, w0
   e100c:	b94023e1 	ldr	w1, [sp, #32]
   e1010:	0b000020 	add	w0, w1, w0
   e1014:	b90023e0 	str	w0, [sp, #32]
   e1018:	b94027e0 	ldr	w0, [sp, #36]
   e101c:	11000400 	add	w0, w0, #0x1
   e1020:	b90027e0 	str	w0, [sp, #36]
   e1024:	b94027e0 	ldr	w0, [sp, #36]
   e1028:	710ffc1f 	cmp	w0, #0x3ff
   e102c:	54fffc4d 	b.le	e0fb4 <example14+0x34>
   e1030:	b9402be0 	ldr	w0, [sp, #40]
   e1034:	11000400 	add	w0, w0, #0x1
   e1038:	b9002be0 	str	w0, [sp, #40]
   e103c:	b9402be0 	ldr	w0, [sp, #40]
   e1040:	71007c1f 	cmp	w0, #0x1f
   e1044:	54fffb4d 	b.le	e0fac <example14+0x2c>
   e1048:	b9802fe0 	ldrsw	x0, [sp, #44]
   e104c:	d37ef400 	lsl	x0, x0, #2
   e1050:	f94003e1 	ldr	x1, [sp]
   e1054:	8b000020 	add	x0, x1, x0
   e1058:	b94023e1 	ldr	w1, [sp, #32]
   e105c:	b9000001 	str	w1, [x0]
   e1060:	b9402fe0 	ldr	w0, [sp, #44]
   e1064:	11000400 	add	w0, w0, #0x1
   e1068:	b9002fe0 	str	w0, [sp, #44]
   e106c:	b9402fe0 	ldr	w0, [sp, #44]
   e1070:	71000c1f 	cmp	w0, #0x3
   e1074:	54fff96d 	b.le	e0fa0 <example14+0x20>
   e1078:	d503201f 	nop
   e107c:	d503201f 	nop
   e1080:	9100c3ff 	add	sp, sp, #0x30
   e1084:	d65f03c0 	ret

00000000000e1088 <example23>:
   e1088:	d100c3ff 	sub	sp, sp, #0x30
   e108c:	f9000fe0 	str	x0, [sp, #24]
   e1090:	f9000be1 	str	x1, [sp, #16]
   e1094:	f90007e2 	str	x2, [sp, #8]
   e1098:	b9002fff 	str	wzr, [sp, #44]
   e109c:	1400000e 	b	e10d4 <example23+0x4c>
   e10a0:	f9400be0 	ldr	x0, [sp, #16]
   e10a4:	91000801 	add	x1, x0, #0x2
   e10a8:	f9000be1 	str	x1, [sp, #16]
   e10ac:	79400000 	ldrh	w0, [x0]
   e10b0:	2a0003e2 	mov	w2, w0
   e10b4:	f94007e0 	ldr	x0, [sp, #8]
   e10b8:	91001001 	add	x1, x0, #0x4
   e10bc:	f90007e1 	str	x1, [sp, #8]
   e10c0:	53196041 	lsl	w1, w2, #7
   e10c4:	b9000001 	str	w1, [x0]
   e10c8:	b9402fe0 	ldr	w0, [sp, #44]
   e10cc:	11000400 	add	w0, w0, #0x1
   e10d0:	b9002fe0 	str	w0, [sp, #44]
   e10d4:	b9402fe0 	ldr	w0, [sp, #44]
   e10d8:	7103fc1f 	cmp	w0, #0xff
   e10dc:	54fffe2d 	b.le	e10a0 <example23+0x18>
   e10e0:	d503201f 	nop
   e10e4:	d503201f 	nop
   e10e8:	9100c3ff 	add	sp, sp, #0x30
   e10ec:	d65f03c0 	ret

00000000000e10f0 <init_memory>:
   e10f0:	d10083ff 	sub	sp, sp, #0x20
   e10f4:	f90007e0 	str	x0, [sp, #8]
   e10f8:	f90003e1 	str	x1, [sp]
   e10fc:	52800020 	mov	w0, #0x1                   	// #1
   e1100:	39007fe0 	strb	w0, [sp, #31]
   e1104:	14000013 	b	e1150 <init_memory+0x60>
   e1108:	39407fe1 	ldrb	w1, [sp, #31]
   e110c:	2a0103e0 	mov	w0, w1
   e1110:	531d1000 	ubfiz	w0, w0, #3, #5
   e1114:	4b010000 	sub	w0, w0, w1
   e1118:	39007fe0 	strb	w0, [sp, #31]
   e111c:	39407fe1 	ldrb	w1, [sp, #31]
   e1120:	528004e0 	mov	w0, #0x27                  	// #39
   e1124:	4a000020 	eor	w0, w1, w0
   e1128:	39007fe0 	strb	w0, [sp, #31]
   e112c:	39407fe0 	ldrb	w0, [sp, #31]
   e1130:	11000400 	add	w0, w0, #0x1
   e1134:	39007fe0 	strb	w0, [sp, #31]
   e1138:	f94007e0 	ldr	x0, [sp, #8]
   e113c:	39407fe1 	ldrb	w1, [sp, #31]
   e1140:	39000001 	strb	w1, [x0]
   e1144:	f94007e0 	ldr	x0, [sp, #8]
   e1148:	91000400 	add	x0, x0, #0x1
   e114c:	f90007e0 	str	x0, [sp, #8]
   e1150:	f94007e1 	ldr	x1, [sp, #8]
   e1154:	f94003e0 	ldr	x0, [sp]
   e1158:	eb00003f 	cmp	x1, x0
   e115c:	54fffd61 	b.ne	e1108 <init_memory+0x18>  // b.any
   e1160:	d503201f 	nop
   e1164:	d503201f 	nop
   e1168:	910083ff 	add	sp, sp, #0x20
   e116c:	d65f03c0 	ret

00000000000e1170 <digest_memory>:
   e1170:	d10083ff 	sub	sp, sp, #0x20
   e1174:	f90007e0 	str	x0, [sp, #8]
   e1178:	f90003e1 	str	x1, [sp]
   e117c:	52800020 	mov	w0, #0x1                   	// #1
   e1180:	b9001fe0 	str	w0, [sp, #28]
   e1184:	14000015 	b	e11d8 <digest_memory+0x68>
   e1188:	b9401fe1 	ldr	w1, [sp, #28]
   e118c:	2a0103e0 	mov	w0, w1
   e1190:	531f7800 	lsl	w0, w0, #1
   e1194:	0b010000 	add	w0, w0, w1
   e1198:	b9001fe0 	str	w0, [sp, #28]
   e119c:	f94007e0 	ldr	x0, [sp, #8]
   e11a0:	39400000 	ldrb	w0, [x0]
   e11a4:	2a0003e1 	mov	w1, w0
   e11a8:	b9401fe0 	ldr	w0, [sp, #28]
   e11ac:	4a010000 	eor	w0, w0, w1
   e11b0:	b9001fe0 	str	w0, [sp, #28]
   e11b4:	b9401fe0 	ldr	w0, [sp, #28]
   e11b8:	53087c01 	lsr	w1, w0, #8
   e11bc:	b9401fe0 	ldr	w0, [sp, #28]
   e11c0:	53185c00 	lsl	w0, w0, #8
   e11c4:	4a000020 	eor	w0, w1, w0
   e11c8:	b9001fe0 	str	w0, [sp, #28]
   e11cc:	f94007e0 	ldr	x0, [sp, #8]
   e11d0:	91000400 	add	x0, x0, #0x1
   e11d4:	f90007e0 	str	x0, [sp, #8]
   e11d8:	f94007e1 	ldr	x1, [sp, #8]
   e11dc:	f94003e0 	ldr	x0, [sp]
   e11e0:	eb00003f 	cmp	x1, x0
   e11e4:	54fffd21 	b.ne	e1188 <digest_memory+0x18>  // b.any
   e11e8:	b9401fe0 	ldr	w0, [sp, #28]
   e11ec:	910083ff 	add	sp, sp, #0x20
   e11f0:	d65f03c0 	ret

00000000000e11f4 <memcpy>:
   e11f4:	d100c3ff 	sub	sp, sp, #0x30
   e11f8:	f9000fe0 	str	x0, [sp, #24]
   e11fc:	f9000be1 	str	x1, [sp, #16]
   e1200:	f90007e2 	str	x2, [sp, #8]
   e1204:	f90017ff 	str	xzr, [sp, #40]
   e1208:	1400000c 	b	e1238 <memcpy+0x44>
   e120c:	f9400be1 	ldr	x1, [sp, #16]
   e1210:	f94017e0 	ldr	x0, [sp, #40]
   e1214:	8b000021 	add	x1, x1, x0
   e1218:	f9400fe2 	ldr	x2, [sp, #24]
   e121c:	f94017e0 	ldr	x0, [sp, #40]
   e1220:	8b000040 	add	x0, x2, x0
   e1224:	39400021 	ldrb	w1, [x1]
   e1228:	39000001 	strb	w1, [x0]
   e122c:	f94017e0 	ldr	x0, [sp, #40]
   e1230:	91000400 	add	x0, x0, #0x1
   e1234:	f90017e0 	str	x0, [sp, #40]
   e1238:	f94017e1 	ldr	x1, [sp, #40]
   e123c:	f94007e0 	ldr	x0, [sp, #8]
   e1240:	eb00003f 	cmp	x1, x0
   e1244:	54fffe41 	b.ne	e120c <memcpy+0x18>  // b.any
   e1248:	f9400fe0 	ldr	x0, [sp, #24]
   e124c:	9100c3ff 	add	sp, sp, #0x30
   e1250:	d65f03c0 	ret

00000000000e1254 <memset>:
   e1254:	d100c3ff 	sub	sp, sp, #0x30
   e1258:	f9000fe0 	str	x0, [sp, #24]
   e125c:	b90017e1 	str	w1, [sp, #20]
   e1260:	f90007e2 	str	x2, [sp, #8]
   e1264:	f90017ff 	str	xzr, [sp, #40]
   e1268:	1400000a 	b	e1290 <memset+0x3c>
   e126c:	f9400fe1 	ldr	x1, [sp, #24]
   e1270:	f94017e0 	ldr	x0, [sp, #40]
   e1274:	8b000020 	add	x0, x1, x0
   e1278:	b94017e1 	ldr	w1, [sp, #20]
   e127c:	12001c21 	and	w1, w1, #0xff
   e1280:	39000001 	strb	w1, [x0]
   e1284:	f94017e0 	ldr	x0, [sp, #40]
   e1288:	91000400 	add	x0, x0, #0x1
   e128c:	f90017e0 	str	x0, [sp, #40]
   e1290:	f94017e1 	ldr	x1, [sp, #40]
   e1294:	f94007e0 	ldr	x0, [sp, #8]
   e1298:	eb00003f 	cmp	x1, x0
   e129c:	54fffe81 	b.ne	e126c <memset+0x18>  // b.any
   e12a0:	f9400fe0 	ldr	x0, [sp, #24]
   e12a4:	9100c3ff 	add	sp, sp, #0x30
   e12a8:	d65f03c0 	ret

00000000000e12ac <memmove>:
   e12ac:	d100c3ff 	sub	sp, sp, #0x30
   e12b0:	f9000fe0 	str	x0, [sp, #24]
   e12b4:	f9000be1 	str	x1, [sp, #16]
   e12b8:	f90007e2 	str	x2, [sp, #8]
   e12bc:	f94007e0 	ldr	x0, [sp, #8]
   e12c0:	f90017e0 	str	x0, [sp, #40]
   e12c4:	1400000e 	b	e12fc <memmove+0x50>
   e12c8:	f94017e0 	ldr	x0, [sp, #40]
   e12cc:	d1000400 	sub	x0, x0, #0x1
   e12d0:	f9400be1 	ldr	x1, [sp, #16]
   e12d4:	8b000021 	add	x1, x1, x0
   e12d8:	f94017e0 	ldr	x0, [sp, #40]
   e12dc:	d1000400 	sub	x0, x0, #0x1
   e12e0:	f9400fe2 	ldr	x2, [sp, #24]
   e12e4:	8b000040 	add	x0, x2, x0
   e12e8:	39400021 	ldrb	w1, [x1]
   e12ec:	39000001 	strb	w1, [x0]
   e12f0:	f94017e0 	ldr	x0, [sp, #40]
   e12f4:	d1000400 	sub	x0, x0, #0x1
   e12f8:	f90017e0 	str	x0, [sp, #40]
   e12fc:	f94017e0 	ldr	x0, [sp, #40]
   e1300:	f100001f 	cmp	x0, #0x0
   e1304:	54fffe21 	b.ne	e12c8 <memmove+0x1c>  // b.any
   e1308:	f9400fe0 	ldr	x0, [sp, #24]
   e130c:	9100c3ff 	add	sp, sp, #0x30
   e1310:	d65f03c0 	ret
