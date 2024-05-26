
vectorization.c.elf:     file format elf64-littleaarch64


Disassembly of section .start:

00000000000e0000 <_start>:
   e0000:	d101c3ff 	sub	sp, sp, #0x70
   e0004:	d140cbff 	sub	sp, sp, #0x32, lsl #12
   e0008:	a9007bfd 	stp	x29, x30, [sp]
   e000c:	910003fd 	mov	x29, sp
   e0010:	f9000bf3 	str	x19, [sp, #16]
   e0014:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0018:	b9203c1f 	str	wzr, [x0, #8252]
   e001c:	b9002fff 	str	wzr, [sp, #44]
   e0020:	52808000 	mov	w0, #0x400                 	// #1024
   e0024:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0028:	b9203820 	str	w0, [x1, #8248]
   e002c:	9100c3e0 	add	x0, sp, #0x30
   e0030:	91401001 	add	x1, x0, #0x4, lsl #12
   e0034:	9100c3e0 	add	x0, sp, #0x30
   e0038:	91400c00 	add	x0, x0, #0x3, lsl #12
   e003c:	940004a6 	bl	e12d4 <init_memory>
   e0040:	9100c3e0 	add	x0, sp, #0x30
   e0044:	91401401 	add	x1, x0, #0x5, lsl #12
   e0048:	9100c3e0 	add	x0, sp, #0x30
   e004c:	91401000 	add	x0, x0, #0x4, lsl #12
   e0050:	940004a1 	bl	e12d4 <init_memory>
   e0054:	9100c3e0 	add	x0, sp, #0x30
   e0058:	91401801 	add	x1, x0, #0x6, lsl #12
   e005c:	9100c3e0 	add	x0, sp, #0x30
   e0060:	91401400 	add	x0, x0, #0x5, lsl #12
   e0064:	9400049c 	bl	e12d4 <init_memory>
   e0068:	9100c3e0 	add	x0, sp, #0x30
   e006c:	91400401 	add	x1, x0, #0x1, lsl #12
   e0070:	9100c3e0 	add	x0, sp, #0x30
   e0074:	91200000 	add	x0, x0, #0x800
   e0078:	94000497 	bl	e12d4 <init_memory>
   e007c:	9100c3e1 	add	x1, sp, #0x30
   e0080:	d2830000 	mov	x0, #0x1800                	// #6144
   e0084:	8b000021 	add	x1, x1, x0
   e0088:	9100c3e0 	add	x0, sp, #0x30
   e008c:	91400400 	add	x0, x0, #0x1, lsl #12
   e0090:	94000491 	bl	e12d4 <init_memory>
   e0094:	9100c3e0 	add	x0, sp, #0x30
   e0098:	91400802 	add	x2, x0, #0x2, lsl #12
   e009c:	9100c3e1 	add	x1, sp, #0x30
   e00a0:	d2830000 	mov	x0, #0x1800                	// #6144
   e00a4:	8b000020 	add	x0, x1, x0
   e00a8:	aa0203e1 	mov	x1, x2
   e00ac:	9400048a 	bl	e12d4 <init_memory>
   e00b0:	9100c3e0 	add	x0, sp, #0x30
   e00b4:	91403001 	add	x1, x0, #0xc, lsl #12
   e00b8:	9100c3e0 	add	x0, sp, #0x30
   e00bc:	91402800 	add	x0, x0, #0xa, lsl #12
   e00c0:	94000485 	bl	e12d4 <init_memory>
   e00c4:	9100c3e0 	add	x0, sp, #0x30
   e00c8:	91403801 	add	x1, x0, #0xe, lsl #12
   e00cc:	9100c3e0 	add	x0, sp, #0x30
   e00d0:	91403000 	add	x0, x0, #0xc, lsl #12
   e00d4:	94000480 	bl	e12d4 <init_memory>
   e00d8:	9100c3e0 	add	x0, sp, #0x30
   e00dc:	91404001 	add	x1, x0, #0x10, lsl #12
   e00e0:	9100c3e0 	add	x0, sp, #0x30
   e00e4:	91403800 	add	x0, x0, #0xe, lsl #12
   e00e8:	9400047b 	bl	e12d4 <init_memory>
   e00ec:	9100c3e0 	add	x0, sp, #0x30
   e00f0:	91400c01 	add	x1, x0, #0x3, lsl #12
   e00f4:	9100c3e0 	add	x0, sp, #0x30
   e00f8:	91400800 	add	x0, x0, #0x2, lsl #12
   e00fc:	94000476 	bl	e12d4 <init_memory>
   e0100:	9100c3e0 	add	x0, sp, #0x30
   e0104:	91401c01 	add	x1, x0, #0x7, lsl #12
   e0108:	9100c3e0 	add	x0, sp, #0x30
   e010c:	91401800 	add	x0, x0, #0x6, lsl #12
   e0110:	94000471 	bl	e12d4 <init_memory>
   e0114:	9100c3e0 	add	x0, sp, #0x30
   e0118:	91402001 	add	x1, x0, #0x8, lsl #12
   e011c:	9100c3e0 	add	x0, sp, #0x30
   e0120:	91401c00 	add	x0, x0, #0x7, lsl #12
   e0124:	9400046c 	bl	e12d4 <init_memory>
   e0128:	9100c3e0 	add	x0, sp, #0x30
   e012c:	91404c01 	add	x1, x0, #0x13, lsl #12
   e0130:	9100c3e0 	add	x0, sp, #0x30
   e0134:	91404800 	add	x0, x0, #0x12, lsl #12
   e0138:	94000467 	bl	e12d4 <init_memory>
   e013c:	9100c3e0 	add	x0, sp, #0x30
   e0140:	940001db 	bl	e08ac <example1>
   e0144:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0148:	b9206c1f 	str	wzr, [x0, #8300]
   e014c:	14000008 	b	e016c <_start+0x16c>
   e0150:	9100c3e0 	add	x0, sp, #0x30
   e0154:	940001d6 	bl	e08ac <example1>
   e0158:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e015c:	b9606c00 	ldr	w0, [x0, #8300]
   e0160:	11000400 	add	w0, w0, #0x1
   e0164:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0168:	b9206c20 	str	w0, [x1, #8300]
   e016c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0170:	b9603801 	ldr	w1, [x0, #8248]
   e0174:	2a0103e0 	mov	w0, w1
   e0178:	531e7400 	lsl	w0, w0, #2
   e017c:	0b010000 	add	w0, w0, w1
   e0180:	531f7800 	lsl	w0, w0, #1
   e0184:	2a0003e1 	mov	w1, w0
   e0188:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e018c:	b9606c00 	ldr	w0, [x0, #8300]
   e0190:	6b01001f 	cmp	w0, w1
   e0194:	54fffdeb 	b.lt	e0150 <_start+0x150>  // b.tstop
   e0198:	9100c3e1 	add	x1, sp, #0x30
   e019c:	d2948000 	mov	x0, #0xa400                	// #41984
   e01a0:	8b000021 	add	x1, x1, x0
   e01a4:	9100c3e0 	add	x0, sp, #0x30
   e01a8:	91402800 	add	x0, x0, #0xa, lsl #12
   e01ac:	9400046a 	bl	e1354 <digest_memory>
   e01b0:	2a0003e1 	mov	w1, w0
   e01b4:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e01b8:	b9603c00 	ldr	w0, [x0, #8252]
   e01bc:	0b010000 	add	w0, w0, w1
   e01c0:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e01c4:	b9203c20 	str	w0, [x1, #8252]
   e01c8:	9100c3e0 	add	x0, sp, #0x30
   e01cc:	52800042 	mov	w2, #0x2                   	// #2
   e01d0:	52808001 	mov	w1, #0x400                 	// #1024
   e01d4:	940001d3 	bl	e0920 <example2a>
   e01d8:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e01dc:	b920681f 	str	wzr, [x0, #8296]
   e01e0:	1400000a 	b	e0208 <_start+0x208>
   e01e4:	9100c3e0 	add	x0, sp, #0x30
   e01e8:	52800042 	mov	w2, #0x2                   	// #2
   e01ec:	52808001 	mov	w1, #0x400                 	// #1024
   e01f0:	940001cc 	bl	e0920 <example2a>
   e01f4:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e01f8:	b9606800 	ldr	w0, [x0, #8296]
   e01fc:	11000400 	add	w0, w0, #0x1
   e0200:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0204:	b9206820 	str	w0, [x1, #8296]
   e0208:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e020c:	b9603800 	ldr	w0, [x0, #8248]
   e0210:	531e7400 	lsl	w0, w0, #2
   e0214:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0218:	b9606821 	ldr	w1, [x1, #8296]
   e021c:	6b00003f 	cmp	w1, w0
   e0220:	54fffe2b 	b.lt	e01e4 <_start+0x1e4>  // b.tstop
   e0224:	9100c3e0 	add	x0, sp, #0x30
   e0228:	91403401 	add	x1, x0, #0xd, lsl #12
   e022c:	9100c3e0 	add	x0, sp, #0x30
   e0230:	91403000 	add	x0, x0, #0xc, lsl #12
   e0234:	94000448 	bl	e1354 <digest_memory>
   e0238:	2a0003e1 	mov	w1, w0
   e023c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0240:	b9603c00 	ldr	w0, [x0, #8252]
   e0244:	0b010000 	add	w0, w0, w1
   e0248:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e024c:	b9203c20 	str	w0, [x1, #8252]
   e0250:	9100c3e0 	add	x0, sp, #0x30
   e0254:	52800042 	mov	w2, #0x2                   	// #2
   e0258:	52808001 	mov	w1, #0x400                 	// #1024
   e025c:	940001c7 	bl	e0978 <example2b>
   e0260:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0264:	b920641f 	str	wzr, [x0, #8292]
   e0268:	1400000a 	b	e0290 <_start+0x290>
   e026c:	9100c3e0 	add	x0, sp, #0x30
   e0270:	52800042 	mov	w2, #0x2                   	// #2
   e0274:	52808001 	mov	w1, #0x400                 	// #1024
   e0278:	940001c0 	bl	e0978 <example2b>
   e027c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0280:	b9606400 	ldr	w0, [x0, #8292]
   e0284:	11000400 	add	w0, w0, #0x1
   e0288:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e028c:	b9206420 	str	w0, [x1, #8292]
   e0290:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0294:	b9603800 	ldr	w0, [x0, #8248]
   e0298:	531f7800 	lsl	w0, w0, #1
   e029c:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e02a0:	b9606421 	ldr	w1, [x1, #8292]
   e02a4:	6b00003f 	cmp	w1, w0
   e02a8:	54fffe2b 	b.lt	e026c <_start+0x26c>  // b.tstop
   e02ac:	9100c3e0 	add	x0, sp, #0x30
   e02b0:	91402c01 	add	x1, x0, #0xb, lsl #12
   e02b4:	9100c3e0 	add	x0, sp, #0x30
   e02b8:	91402800 	add	x0, x0, #0xa, lsl #12
   e02bc:	94000426 	bl	e1354 <digest_memory>
   e02c0:	2a0003e1 	mov	w1, w0
   e02c4:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e02c8:	b9603c00 	ldr	w0, [x0, #8252]
   e02cc:	0b010000 	add	w0, w0, w1
   e02d0:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e02d4:	b9203c20 	str	w0, [x1, #8252]
   e02d8:	9100c3e0 	add	x0, sp, #0x30
   e02dc:	91401002 	add	x2, x0, #0x4, lsl #12
   e02e0:	9100c3e0 	add	x0, sp, #0x30
   e02e4:	91400c01 	add	x1, x0, #0x3, lsl #12
   e02e8:	9100c3e0 	add	x0, sp, #0x30
   e02ec:	aa0203e3 	mov	x3, x2
   e02f0:	aa0103e2 	mov	x2, x1
   e02f4:	52807ec1 	mov	w1, #0x3f6                 	// #1014
   e02f8:	940001f0 	bl	e0ab8 <example4b>
   e02fc:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0300:	b920601f 	str	wzr, [x0, #8288]
   e0304:	1400000f 	b	e0340 <_start+0x340>
   e0308:	9100c3e0 	add	x0, sp, #0x30
   e030c:	91401002 	add	x2, x0, #0x4, lsl #12
   e0310:	9100c3e0 	add	x0, sp, #0x30
   e0314:	91400c01 	add	x1, x0, #0x3, lsl #12
   e0318:	9100c3e0 	add	x0, sp, #0x30
   e031c:	aa0203e3 	mov	x3, x2
   e0320:	aa0103e2 	mov	x2, x1
   e0324:	52807ec1 	mov	w1, #0x3f6                 	// #1014
   e0328:	940001e4 	bl	e0ab8 <example4b>
   e032c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0330:	b9606000 	ldr	w0, [x0, #8288]
   e0334:	11000400 	add	w0, w0, #0x1
   e0338:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e033c:	b9206020 	str	w0, [x1, #8288]
   e0340:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0344:	b9603800 	ldr	w0, [x0, #8248]
   e0348:	531f7800 	lsl	w0, w0, #1
   e034c:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0350:	b9606021 	ldr	w1, [x1, #8288]
   e0354:	6b00003f 	cmp	w1, w0
   e0358:	54fffd8b 	b.lt	e0308 <_start+0x308>  // b.tstop
   e035c:	9100c3e0 	add	x0, sp, #0x30
   e0360:	91401001 	add	x1, x0, #0x4, lsl #12
   e0364:	9100c3e0 	add	x0, sp, #0x30
   e0368:	91400c00 	add	x0, x0, #0x3, lsl #12
   e036c:	940003fa 	bl	e1354 <digest_memory>
   e0370:	2a0003e1 	mov	w1, w0
   e0374:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0378:	b9603c00 	ldr	w0, [x0, #8252]
   e037c:	0b010000 	add	w0, w0, w1
   e0380:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0384:	b9203c20 	str	w0, [x1, #8252]
   e0388:	9100c3e0 	add	x0, sp, #0x30
   e038c:	91401002 	add	x2, x0, #0x4, lsl #12
   e0390:	9100c3e0 	add	x0, sp, #0x30
   e0394:	91400c01 	add	x1, x0, #0x3, lsl #12
   e0398:	9100c3e0 	add	x0, sp, #0x30
   e039c:	aa0203e3 	mov	x3, x2
   e03a0:	aa0103e2 	mov	x2, x1
   e03a4:	52808001 	mov	w1, #0x400                 	// #1024
   e03a8:	940001e9 	bl	e0b4c <example4c>
   e03ac:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e03b0:	b9205c1f 	str	wzr, [x0, #8284]
   e03b4:	1400000f 	b	e03f0 <_start+0x3f0>
   e03b8:	9100c3e0 	add	x0, sp, #0x30
   e03bc:	91401002 	add	x2, x0, #0x4, lsl #12
   e03c0:	9100c3e0 	add	x0, sp, #0x30
   e03c4:	91400c01 	add	x1, x0, #0x3, lsl #12
   e03c8:	9100c3e0 	add	x0, sp, #0x30
   e03cc:	aa0203e3 	mov	x3, x2
   e03d0:	aa0103e2 	mov	x2, x1
   e03d4:	52808001 	mov	w1, #0x400                 	// #1024
   e03d8:	940001dd 	bl	e0b4c <example4c>
   e03dc:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e03e0:	b9605c00 	ldr	w0, [x0, #8284]
   e03e4:	11000400 	add	w0, w0, #0x1
   e03e8:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e03ec:	b9205c20 	str	w0, [x1, #8284]
   e03f0:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e03f4:	b9603800 	ldr	w0, [x0, #8248]
   e03f8:	531f7800 	lsl	w0, w0, #1
   e03fc:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0400:	b9605c21 	ldr	w1, [x1, #8284]
   e0404:	6b00003f 	cmp	w1, w0
   e0408:	54fffd8b 	b.lt	e03b8 <_start+0x3b8>  // b.tstop
   e040c:	9100c3e0 	add	x0, sp, #0x30
   e0410:	91401401 	add	x1, x0, #0x5, lsl #12
   e0414:	9100c3e0 	add	x0, sp, #0x30
   e0418:	91401000 	add	x0, x0, #0x4, lsl #12
   e041c:	940003ce 	bl	e1354 <digest_memory>
   e0420:	2a0003e1 	mov	w1, w0
   e0424:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0428:	b9603c00 	ldr	w0, [x0, #8252]
   e042c:	0b010000 	add	w0, w0, w1
   e0430:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0434:	b9203c20 	str	w0, [x1, #8252]
   e0438:	9100c3e0 	add	x0, sp, #0x30
   e043c:	52800081 	mov	w1, #0x4                   	// #4
   e0440:	940001ff 	bl	e0c3c <example7>
   e0444:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0448:	b920581f 	str	wzr, [x0, #8280]
   e044c:	14000009 	b	e0470 <_start+0x470>
   e0450:	9100c3e0 	add	x0, sp, #0x30
   e0454:	52800081 	mov	w1, #0x4                   	// #4
   e0458:	940001f9 	bl	e0c3c <example7>
   e045c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0460:	b9605800 	ldr	w0, [x0, #8280]
   e0464:	11000400 	add	w0, w0, #0x1
   e0468:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e046c:	b9205820 	str	w0, [x1, #8280]
   e0470:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0474:	b9603800 	ldr	w0, [x0, #8248]
   e0478:	531e7400 	lsl	w0, w0, #2
   e047c:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0480:	b9605821 	ldr	w1, [x1, #8280]
   e0484:	6b00003f 	cmp	w1, w0
   e0488:	54fffe4b 	b.lt	e0450 <_start+0x450>  // b.tstop
   e048c:	9100c3e0 	add	x0, sp, #0x30
   e0490:	91402c01 	add	x1, x0, #0xb, lsl #12
   e0494:	9100c3e0 	add	x0, sp, #0x30
   e0498:	91402800 	add	x0, x0, #0xa, lsl #12
   e049c:	940003ae 	bl	e1354 <digest_memory>
   e04a0:	2a0003e1 	mov	w1, w0
   e04a4:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e04a8:	b9603c00 	ldr	w0, [x0, #8252]
   e04ac:	0b010000 	add	w0, w0, w1
   e04b0:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e04b4:	b9203c20 	str	w0, [x1, #8252]
   e04b8:	9100c3e0 	add	x0, sp, #0x30
   e04bc:	52800101 	mov	w1, #0x8                   	// #8
   e04c0:	940001fa 	bl	e0ca8 <example8>
   e04c4:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e04c8:	b920541f 	str	wzr, [x0, #8276]
   e04cc:	14000009 	b	e04f0 <_start+0x4f0>
   e04d0:	9100c3e0 	add	x0, sp, #0x30
   e04d4:	52800101 	mov	w1, #0x8                   	// #8
   e04d8:	940001f4 	bl	e0ca8 <example8>
   e04dc:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e04e0:	b9605400 	ldr	w0, [x0, #8276]
   e04e4:	11000400 	add	w0, w0, #0x1
   e04e8:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e04ec:	b9205420 	str	w0, [x1, #8276]
   e04f0:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e04f4:	b9603800 	ldr	w0, [x0, #8248]
   e04f8:	11000c01 	add	w1, w0, #0x3
   e04fc:	7100001f 	cmp	w0, #0x0
   e0500:	1a80b020 	csel	w0, w1, w0, lt	// lt = tstop
   e0504:	13027c00 	asr	w0, w0, #2
   e0508:	2a0003e1 	mov	w1, w0
   e050c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0510:	b9605400 	ldr	w0, [x0, #8276]
   e0514:	6b01001f 	cmp	w0, w1
   e0518:	54fffdcb 	b.lt	e04d0 <_start+0x4d0>  // b.tstop
   e051c:	9100c3e0 	add	x0, sp, #0x30
   e0520:	91404c01 	add	x1, x0, #0x13, lsl #12
   e0524:	9100c3e0 	add	x0, sp, #0x30
   e0528:	91404800 	add	x0, x0, #0x12, lsl #12
   e052c:	9400038a 	bl	e1354 <digest_memory>
   e0530:	2a0003e1 	mov	w1, w0
   e0534:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0538:	b9603c00 	ldr	w0, [x0, #8252]
   e053c:	0b010000 	add	w0, w0, w1
   e0540:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0544:	b9203c20 	str	w0, [x1, #8252]
   e0548:	9100b3e1 	add	x1, sp, #0x2c
   e054c:	9100c3e0 	add	x0, sp, #0x30
   e0550:	940001f6 	bl	e0d28 <example9>
   e0554:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0558:	b920501f 	str	wzr, [x0, #8272]
   e055c:	14000009 	b	e0580 <_start+0x580>
   e0560:	9100b3e1 	add	x1, sp, #0x2c
   e0564:	9100c3e0 	add	x0, sp, #0x30
   e0568:	940001f0 	bl	e0d28 <example9>
   e056c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0570:	b9605000 	ldr	w0, [x0, #8272]
   e0574:	11000400 	add	w0, w0, #0x1
   e0578:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e057c:	b9205020 	str	w0, [x1, #8272]
   e0580:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0584:	b9603800 	ldr	w0, [x0, #8248]
   e0588:	531f7800 	lsl	w0, w0, #1
   e058c:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0590:	b9605021 	ldr	w1, [x1, #8272]
   e0594:	6b00003f 	cmp	w1, w0
   e0598:	54fffe4b 	b.lt	e0560 <_start+0x560>  // b.tstop
   e059c:	b9402fe0 	ldr	w0, [sp, #44]
   e05a0:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e05a4:	b9603c21 	ldr	w1, [x1, #8252]
   e05a8:	0b000020 	add	w0, w1, w0
   e05ac:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e05b0:	b9203c20 	str	w0, [x1, #8252]
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
   e05ec:	940001ef 	bl	e0da8 <example10a>
   e05f0:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e05f4:	b9204c1f 	str	wzr, [x0, #8268]
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
   e0634:	940001dd 	bl	e0da8 <example10a>
   e0638:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e063c:	b9604c00 	ldr	w0, [x0, #8268]
   e0640:	11000400 	add	w0, w0, #0x1
   e0644:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0648:	b9204c20 	str	w0, [x1, #8268]
   e064c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0650:	b9603800 	ldr	w0, [x0, #8248]
   e0654:	531f7800 	lsl	w0, w0, #1
   e0658:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e065c:	b9604c21 	ldr	w1, [x1, #8268]
   e0660:	6b00003f 	cmp	w1, w0
   e0664:	54fffccb 	b.lt	e05fc <_start+0x5fc>  // b.tstop
   e0668:	9100c3e0 	add	x0, sp, #0x30
   e066c:	91401001 	add	x1, x0, #0x4, lsl #12
   e0670:	9100c3e0 	add	x0, sp, #0x30
   e0674:	91400c00 	add	x0, x0, #0x3, lsl #12
   e0678:	94000337 	bl	e1354 <digest_memory>
   e067c:	2a0003f3 	mov	w19, w0
   e0680:	9100c3e0 	add	x0, sp, #0x30
   e0684:	91400401 	add	x1, x0, #0x1, lsl #12
   e0688:	9100c3e0 	add	x0, sp, #0x30
   e068c:	91200000 	add	x0, x0, #0x800
   e0690:	94000331 	bl	e1354 <digest_memory>
   e0694:	0b000260 	add	w0, w19, w0
   e0698:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e069c:	b9603c21 	ldr	w1, [x1, #8252]
   e06a0:	0b000020 	add	w0, w1, w0
   e06a4:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e06a8:	b9203c20 	str	w0, [x1, #8252]
   e06ac:	9100c3e0 	add	x0, sp, #0x30
   e06b0:	91401406 	add	x6, x0, #0x5, lsl #12
   e06b4:	9100c3e0 	add	x0, sp, #0x30
   e06b8:	91401005 	add	x5, x0, #0x4, lsl #12
   e06bc:	9100c3e0 	add	x0, sp, #0x30
   e06c0:	91400c04 	add	x4, x0, #0x3, lsl #12
   e06c4:	9100c3e1 	add	x1, sp, #0x30
   e06c8:	d2830000 	mov	x0, #0x1800                	// #6144
   e06cc:	8b000023 	add	x3, x1, x0
   e06d0:	9100c3e0 	add	x0, sp, #0x30
   e06d4:	91400402 	add	x2, x0, #0x1, lsl #12
   e06d8:	9100c3e0 	add	x0, sp, #0x30
   e06dc:	91200001 	add	x1, x0, #0x800
   e06e0:	9100c3e0 	add	x0, sp, #0x30
   e06e4:	940001e4 	bl	e0e74 <example10b>
   e06e8:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e06ec:	b920481f 	str	wzr, [x0, #8264]
   e06f0:	14000015 	b	e0744 <_start+0x744>
   e06f4:	9100c3e0 	add	x0, sp, #0x30
   e06f8:	91401406 	add	x6, x0, #0x5, lsl #12
   e06fc:	9100c3e0 	add	x0, sp, #0x30
   e0700:	91401005 	add	x5, x0, #0x4, lsl #12
   e0704:	9100c3e0 	add	x0, sp, #0x30
   e0708:	91400c04 	add	x4, x0, #0x3, lsl #12
   e070c:	9100c3e1 	add	x1, sp, #0x30
   e0710:	d2830000 	mov	x0, #0x1800                	// #6144
   e0714:	8b000023 	add	x3, x1, x0
   e0718:	9100c3e0 	add	x0, sp, #0x30
   e071c:	91400402 	add	x2, x0, #0x1, lsl #12
   e0720:	9100c3e0 	add	x0, sp, #0x30
   e0724:	91200001 	add	x1, x0, #0x800
   e0728:	9100c3e0 	add	x0, sp, #0x30
   e072c:	940001d2 	bl	e0e74 <example10b>
   e0730:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0734:	b9604800 	ldr	w0, [x0, #8264]
   e0738:	11000400 	add	w0, w0, #0x1
   e073c:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0740:	b9204820 	str	w0, [x1, #8264]
   e0744:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0748:	b9603800 	ldr	w0, [x0, #8248]
   e074c:	531e7400 	lsl	w0, w0, #2
   e0750:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0754:	b9604821 	ldr	w1, [x1, #8264]
   e0758:	6b00003f 	cmp	w1, w0
   e075c:	54fffccb 	b.lt	e06f4 <_start+0x6f4>  // b.tstop
   e0760:	9100c3e0 	add	x0, sp, #0x30
   e0764:	91401001 	add	x1, x0, #0x4, lsl #12
   e0768:	9100c3e0 	add	x0, sp, #0x30
   e076c:	91400c00 	add	x0, x0, #0x3, lsl #12
   e0770:	940002f9 	bl	e1354 <digest_memory>
   e0774:	2a0003e1 	mov	w1, w0
   e0778:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e077c:	b9603c00 	ldr	w0, [x0, #8252]
   e0780:	0b010000 	add	w0, w0, w1
   e0784:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0788:	b9203c20 	str	w0, [x1, #8252]
   e078c:	9100c3e0 	add	x0, sp, #0x30
   e0790:	940001d6 	bl	e0ee8 <example11>
   e0794:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0798:	b920441f 	str	wzr, [x0, #8260]
   e079c:	14000008 	b	e07bc <_start+0x7bc>
   e07a0:	9100c3e0 	add	x0, sp, #0x30
   e07a4:	940001d1 	bl	e0ee8 <example11>
   e07a8:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e07ac:	b9604400 	ldr	w0, [x0, #8260]
   e07b0:	11000400 	add	w0, w0, #0x1
   e07b4:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e07b8:	b9204420 	str	w0, [x1, #8260]
   e07bc:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e07c0:	b9603800 	ldr	w0, [x0, #8248]
   e07c4:	531f7800 	lsl	w0, w0, #1
   e07c8:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e07cc:	b9604421 	ldr	w1, [x1, #8260]
   e07d0:	6b00003f 	cmp	w1, w0
   e07d4:	54fffe6b 	b.lt	e07a0 <_start+0x7a0>  // b.tstop
   e07d8:	9100c3e0 	add	x0, sp, #0x30
   e07dc:	91404401 	add	x1, x0, #0x11, lsl #12
   e07e0:	9100c3e0 	add	x0, sp, #0x30
   e07e4:	91404000 	add	x0, x0, #0x10, lsl #12
   e07e8:	940002db 	bl	e1354 <digest_memory>
   e07ec:	2a0003e1 	mov	w1, w0
   e07f0:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e07f4:	b9603c00 	ldr	w0, [x0, #8252]
   e07f8:	0b010000 	add	w0, w0, w1
   e07fc:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0800:	b9203c20 	str	w0, [x1, #8252]
   e0804:	9100c3e0 	add	x0, sp, #0x30
   e0808:	91400802 	add	x2, x0, #0x2, lsl #12
   e080c:	9100c3e1 	add	x1, sp, #0x30
   e0810:	9100c3e0 	add	x0, sp, #0x30
   e0814:	94000296 	bl	e126c <example23>
   e0818:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e081c:	b920401f 	str	wzr, [x0, #8256]
   e0820:	1400000b 	b	e084c <_start+0x84c>
   e0824:	9100c3e0 	add	x0, sp, #0x30
   e0828:	91400802 	add	x2, x0, #0x2, lsl #12
   e082c:	9100c3e1 	add	x1, sp, #0x30
   e0830:	9100c3e0 	add	x0, sp, #0x30
   e0834:	9400028e 	bl	e126c <example23>
   e0838:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e083c:	b9604000 	ldr	w0, [x0, #8256]
   e0840:	11000400 	add	w0, w0, #0x1
   e0844:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0848:	b9204020 	str	w0, [x1, #8256]
   e084c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0850:	b9603800 	ldr	w0, [x0, #8248]
   e0854:	531d7000 	lsl	w0, w0, #3
   e0858:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e085c:	b9604021 	ldr	w1, [x1, #8256]
   e0860:	6b00003f 	cmp	w1, w0
   e0864:	54fffe0b 	b.lt	e0824 <_start+0x824>  // b.tstop
   e0868:	9100c3e0 	add	x0, sp, #0x30
   e086c:	91080001 	add	x1, x0, #0x200
   e0870:	9100c3e0 	add	x0, sp, #0x30
   e0874:	940002b8 	bl	e1354 <digest_memory>
   e0878:	2a0003e1 	mov	w1, w0
   e087c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0880:	b9603c00 	ldr	w0, [x0, #8252]
   e0884:	0b010000 	add	w0, w0, w1
   e0888:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e088c:	b9203c20 	str	w0, [x1, #8252]
   e0890:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0894:	b9603c00 	ldr	w0, [x0, #8252]
   e0898:	f9400bf3 	ldr	x19, [sp, #16]
   e089c:	a9407bfd 	ldp	x29, x30, [sp]
   e08a0:	9101c3ff 	add	sp, sp, #0x70
   e08a4:	9140cbff 	add	sp, sp, #0x32, lsl #12
   e08a8:	d65f03c0 	ret

Disassembly of section .text:

00000000000e08ac <example1>:
   e08ac:	d10083ff 	sub	sp, sp, #0x20
   e08b0:	f90007e0 	str	x0, [sp, #8]
   e08b4:	b9001fff 	str	wzr, [sp, #28]
   e08b8:	14000013 	b	e0904 <example1+0x58>
   e08bc:	f94007e0 	ldr	x0, [sp, #8]
   e08c0:	b9801fe1 	ldrsw	x1, [sp, #28]
   e08c4:	91400c21 	add	x1, x1, #0x3, lsl #12
   e08c8:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e08cc:	f94007e0 	ldr	x0, [sp, #8]
   e08d0:	b9801fe3 	ldrsw	x3, [sp, #28]
   e08d4:	d2870002 	mov	x2, #0x3800                	// #14336
   e08d8:	8b020062 	add	x2, x3, x2
   e08dc:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e08e0:	0b000022 	add	w2, w1, w0
   e08e4:	f94007e0 	ldr	x0, [sp, #8]
   e08e8:	b9801fe3 	ldrsw	x3, [sp, #28]
   e08ec:	d2850001 	mov	x1, #0x2800                	// #10240
   e08f0:	8b010061 	add	x1, x3, x1
   e08f4:	b8217802 	str	w2, [x0, x1, lsl #2]
   e08f8:	b9401fe0 	ldr	w0, [sp, #28]
   e08fc:	11000400 	add	w0, w0, #0x1
   e0900:	b9001fe0 	str	w0, [sp, #28]
   e0904:	b9401fe0 	ldr	w0, [sp, #28]
   e0908:	7103fc1f 	cmp	w0, #0xff
   e090c:	54fffd8d 	b.le	e08bc <example1+0x10>
   e0910:	d503201f 	nop
   e0914:	d503201f 	nop
   e0918:	910083ff 	add	sp, sp, #0x20
   e091c:	d65f03c0 	ret

00000000000e0920 <example2a>:
   e0920:	d10083ff 	sub	sp, sp, #0x20
   e0924:	f90007e0 	str	x0, [sp, #8]
   e0928:	b90007e1 	str	w1, [sp, #4]
   e092c:	b90003e2 	str	w2, [sp]
   e0930:	b9001fff 	str	wzr, [sp, #28]
   e0934:	14000009 	b	e0958 <example2a+0x38>
   e0938:	f94007e0 	ldr	x0, [sp, #8]
   e093c:	b9801fe1 	ldrsw	x1, [sp, #28]
   e0940:	91400c21 	add	x1, x1, #0x3, lsl #12
   e0944:	b94003e2 	ldr	w2, [sp]
   e0948:	b8217802 	str	w2, [x0, x1, lsl #2]
   e094c:	b9401fe0 	ldr	w0, [sp, #28]
   e0950:	11000400 	add	w0, w0, #0x1
   e0954:	b9001fe0 	str	w0, [sp, #28]
   e0958:	b9401fe1 	ldr	w1, [sp, #28]
   e095c:	b94007e0 	ldr	w0, [sp, #4]
   e0960:	6b00003f 	cmp	w1, w0
   e0964:	54fffeab 	b.lt	e0938 <example2a+0x18>  // b.tstop
   e0968:	d503201f 	nop
   e096c:	d503201f 	nop
   e0970:	910083ff 	add	sp, sp, #0x20
   e0974:	d65f03c0 	ret

00000000000e0978 <example2b>:
   e0978:	d10083ff 	sub	sp, sp, #0x20
   e097c:	f90007e0 	str	x0, [sp, #8]
   e0980:	b90007e1 	str	w1, [sp, #4]
   e0984:	b90003e2 	str	w2, [sp]
   e0988:	b9001fff 	str	wzr, [sp, #28]
   e098c:	14000013 	b	e09d8 <example2b+0x60>
   e0990:	f94007e0 	ldr	x0, [sp, #8]
   e0994:	b9801fe1 	ldrsw	x1, [sp, #28]
   e0998:	91400c21 	add	x1, x1, #0x3, lsl #12
   e099c:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e09a0:	f94007e0 	ldr	x0, [sp, #8]
   e09a4:	b9801fe3 	ldrsw	x3, [sp, #28]
   e09a8:	d2870002 	mov	x2, #0x3800                	// #14336
   e09ac:	8b020062 	add	x2, x3, x2
   e09b0:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e09b4:	0a000022 	and	w2, w1, w0
   e09b8:	f94007e0 	ldr	x0, [sp, #8]
   e09bc:	b9801fe3 	ldrsw	x3, [sp, #28]
   e09c0:	d2850001 	mov	x1, #0x2800                	// #10240
   e09c4:	8b010061 	add	x1, x3, x1
   e09c8:	b8217802 	str	w2, [x0, x1, lsl #2]
   e09cc:	b9401fe0 	ldr	w0, [sp, #28]
   e09d0:	11000400 	add	w0, w0, #0x1
   e09d4:	b9001fe0 	str	w0, [sp, #28]
   e09d8:	b94007e0 	ldr	w0, [sp, #4]
   e09dc:	51000401 	sub	w1, w0, #0x1
   e09e0:	b90007e1 	str	w1, [sp, #4]
   e09e4:	7100001f 	cmp	w0, #0x0
   e09e8:	54fffd41 	b.ne	e0990 <example2b+0x18>  // b.any
   e09ec:	d503201f 	nop
   e09f0:	d503201f 	nop
   e09f4:	910083ff 	add	sp, sp, #0x20
   e09f8:	d65f03c0 	ret

00000000000e09fc <example3>:
   e09fc:	d10083ff 	sub	sp, sp, #0x20
   e0a00:	f9000fe0 	str	x0, [sp, #24]
   e0a04:	b90017e1 	str	w1, [sp, #20]
   e0a08:	f90007e2 	str	x2, [sp, #8]
   e0a0c:	f90003e3 	str	x3, [sp]
   e0a10:	14000009 	b	e0a34 <example3+0x38>
   e0a14:	f94003e1 	ldr	x1, [sp]
   e0a18:	91001020 	add	x0, x1, #0x4
   e0a1c:	f90003e0 	str	x0, [sp]
   e0a20:	f94007e0 	ldr	x0, [sp, #8]
   e0a24:	91001002 	add	x2, x0, #0x4
   e0a28:	f90007e2 	str	x2, [sp, #8]
   e0a2c:	b9400021 	ldr	w1, [x1]
   e0a30:	b9000001 	str	w1, [x0]
   e0a34:	b94017e0 	ldr	w0, [sp, #20]
   e0a38:	51000401 	sub	w1, w0, #0x1
   e0a3c:	b90017e1 	str	w1, [sp, #20]
   e0a40:	7100001f 	cmp	w0, #0x0
   e0a44:	54fffe81 	b.ne	e0a14 <example3+0x18>  // b.any
   e0a48:	d503201f 	nop
   e0a4c:	d503201f 	nop
   e0a50:	910083ff 	add	sp, sp, #0x20
   e0a54:	d65f03c0 	ret

00000000000e0a58 <example4a>:
   e0a58:	d10083ff 	sub	sp, sp, #0x20
   e0a5c:	f9000fe0 	str	x0, [sp, #24]
   e0a60:	b90017e1 	str	w1, [sp, #20]
   e0a64:	f90007e2 	str	x2, [sp, #8]
   e0a68:	f90003e3 	str	x3, [sp]
   e0a6c:	1400000a 	b	e0a94 <example4a+0x3c>
   e0a70:	f94003e0 	ldr	x0, [sp]
   e0a74:	91001001 	add	x1, x0, #0x4
   e0a78:	f90003e1 	str	x1, [sp]
   e0a7c:	b9400001 	ldr	w1, [x0]
   e0a80:	f94007e0 	ldr	x0, [sp, #8]
   e0a84:	91001002 	add	x2, x0, #0x4
   e0a88:	f90007e2 	str	x2, [sp, #8]
   e0a8c:	11001421 	add	w1, w1, #0x5
   e0a90:	b9000001 	str	w1, [x0]
   e0a94:	b94017e0 	ldr	w0, [sp, #20]
   e0a98:	51000401 	sub	w1, w0, #0x1
   e0a9c:	b90017e1 	str	w1, [sp, #20]
   e0aa0:	7100001f 	cmp	w0, #0x0
   e0aa4:	54fffe61 	b.ne	e0a70 <example4a+0x18>  // b.any
   e0aa8:	d503201f 	nop
   e0aac:	d503201f 	nop
   e0ab0:	910083ff 	add	sp, sp, #0x20
   e0ab4:	d65f03c0 	ret

00000000000e0ab8 <example4b>:
   e0ab8:	d100c3ff 	sub	sp, sp, #0x30
   e0abc:	f9000fe0 	str	x0, [sp, #24]
   e0ac0:	b90017e1 	str	w1, [sp, #20]
   e0ac4:	f90007e2 	str	x2, [sp, #8]
   e0ac8:	f90003e3 	str	x3, [sp]
   e0acc:	b9002fff 	str	wzr, [sp, #44]
   e0ad0:	14000017 	b	e0b2c <example4b+0x74>
   e0ad4:	b9402fe0 	ldr	w0, [sp, #44]
   e0ad8:	11000401 	add	w1, w0, #0x1
   e0adc:	f9400fe0 	ldr	x0, [sp, #24]
   e0ae0:	93407c21 	sxtw	x1, w1
   e0ae4:	91400c21 	add	x1, x1, #0x3, lsl #12
   e0ae8:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e0aec:	b9402fe0 	ldr	w0, [sp, #44]
   e0af0:	11000c02 	add	w2, w0, #0x3
   e0af4:	f9400fe0 	ldr	x0, [sp, #24]
   e0af8:	93407c43 	sxtw	x3, w2
   e0afc:	d2870002 	mov	x2, #0x3800                	// #14336
   e0b00:	8b020062 	add	x2, x3, x2
   e0b04:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e0b08:	0b000022 	add	w2, w1, w0
   e0b0c:	f9400fe0 	ldr	x0, [sp, #24]
   e0b10:	b9802fe3 	ldrsw	x3, [sp, #44]
   e0b14:	d2850001 	mov	x1, #0x2800                	// #10240
   e0b18:	8b010061 	add	x1, x3, x1
   e0b1c:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0b20:	b9402fe0 	ldr	w0, [sp, #44]
   e0b24:	11000400 	add	w0, w0, #0x1
   e0b28:	b9002fe0 	str	w0, [sp, #44]
   e0b2c:	b9402fe1 	ldr	w1, [sp, #44]
   e0b30:	b94017e0 	ldr	w0, [sp, #20]
   e0b34:	6b00003f 	cmp	w1, w0
   e0b38:	54fffceb 	b.lt	e0ad4 <example4b+0x1c>  // b.tstop
   e0b3c:	d503201f 	nop
   e0b40:	d503201f 	nop
   e0b44:	9100c3ff 	add	sp, sp, #0x30
   e0b48:	d65f03c0 	ret

00000000000e0b4c <example4c>:
   e0b4c:	d100c3ff 	sub	sp, sp, #0x30
   e0b50:	f9000fe0 	str	x0, [sp, #24]
   e0b54:	b90017e1 	str	w1, [sp, #20]
   e0b58:	f90007e2 	str	x2, [sp, #8]
   e0b5c:	f90003e3 	str	x3, [sp]
   e0b60:	52800080 	mov	w0, #0x4                   	// #4
   e0b64:	b9002be0 	str	w0, [sp, #40]
   e0b68:	b9002fff 	str	wzr, [sp, #44]
   e0b6c:	14000015 	b	e0bc0 <example4c+0x74>
   e0b70:	f9400fe0 	ldr	x0, [sp, #24]
   e0b74:	b9802fe2 	ldrsw	x2, [sp, #44]
   e0b78:	d2850001 	mov	x1, #0x2800                	// #10240
   e0b7c:	8b010041 	add	x1, x2, x1
   e0b80:	b8617800 	ldr	w0, [x0, x1, lsl #2]
   e0b84:	b90027e0 	str	w0, [sp, #36]
   e0b88:	b94027e1 	ldr	w1, [sp, #36]
   e0b8c:	b9402be0 	ldr	w0, [sp, #40]
   e0b90:	6b00003f 	cmp	w1, w0
   e0b94:	5400006d 	b.le	e0ba0 <example4c+0x54>
   e0b98:	b9402be0 	ldr	w0, [sp, #40]
   e0b9c:	14000002 	b	e0ba4 <example4c+0x58>
   e0ba0:	52800000 	mov	w0, #0x0                   	// #0
   e0ba4:	f9400fe1 	ldr	x1, [sp, #24]
   e0ba8:	b9802fe2 	ldrsw	x2, [sp, #44]
   e0bac:	91400c42 	add	x2, x2, #0x3, lsl #12
   e0bb0:	b8227820 	str	w0, [x1, x2, lsl #2]
   e0bb4:	b9402fe0 	ldr	w0, [sp, #44]
   e0bb8:	11000400 	add	w0, w0, #0x1
   e0bbc:	b9002fe0 	str	w0, [sp, #44]
   e0bc0:	b9402fe1 	ldr	w1, [sp, #44]
   e0bc4:	b94017e0 	ldr	w0, [sp, #20]
   e0bc8:	6b00003f 	cmp	w1, w0
   e0bcc:	54fffd2b 	b.lt	e0b70 <example4c+0x24>  // b.tstop
   e0bd0:	d503201f 	nop
   e0bd4:	d503201f 	nop
   e0bd8:	9100c3ff 	add	sp, sp, #0x30
   e0bdc:	d65f03c0 	ret

00000000000e0be0 <example5>:
   e0be0:	d100c3ff 	sub	sp, sp, #0x30
   e0be4:	f9000fe0 	str	x0, [sp, #24]
   e0be8:	b90017e1 	str	w1, [sp, #20]
   e0bec:	f90007e2 	str	x2, [sp, #8]
   e0bf0:	b9002fff 	str	wzr, [sp, #44]
   e0bf4:	1400000a 	b	e0c1c <example5+0x3c>
   e0bf8:	f9400fe0 	ldr	x0, [sp, #24]
   e0bfc:	b9802fe2 	ldrsw	x2, [sp, #44]
   e0c00:	d2848001 	mov	x1, #0x2400                	// #9216
   e0c04:	8b010041 	add	x1, x2, x1
   e0c08:	528000a2 	mov	w2, #0x5                   	// #5
   e0c0c:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0c10:	b9402fe0 	ldr	w0, [sp, #44]
   e0c14:	11000400 	add	w0, w0, #0x1
   e0c18:	b9002fe0 	str	w0, [sp, #44]
   e0c1c:	b9402fe1 	ldr	w1, [sp, #44]
   e0c20:	b94017e0 	ldr	w0, [sp, #20]
   e0c24:	6b00003f 	cmp	w1, w0
   e0c28:	54fffe8b 	b.lt	e0bf8 <example5+0x18>  // b.tstop
   e0c2c:	d503201f 	nop
   e0c30:	d503201f 	nop
   e0c34:	9100c3ff 	add	sp, sp, #0x30
   e0c38:	d65f03c0 	ret

00000000000e0c3c <example7>:
   e0c3c:	d10083ff 	sub	sp, sp, #0x20
   e0c40:	f90007e0 	str	x0, [sp, #8]
   e0c44:	b90007e1 	str	w1, [sp, #4]
   e0c48:	b9001fff 	str	wzr, [sp, #28]
   e0c4c:	14000010 	b	e0c8c <example7+0x50>
   e0c50:	b9401fe1 	ldr	w1, [sp, #28]
   e0c54:	b94007e0 	ldr	w0, [sp, #4]
   e0c58:	0b000021 	add	w1, w1, w0
   e0c5c:	f94007e0 	ldr	x0, [sp, #8]
   e0c60:	93407c21 	sxtw	x1, w1
   e0c64:	91400c21 	add	x1, x1, #0x3, lsl #12
   e0c68:	b8617802 	ldr	w2, [x0, x1, lsl #2]
   e0c6c:	f94007e0 	ldr	x0, [sp, #8]
   e0c70:	b9801fe3 	ldrsw	x3, [sp, #28]
   e0c74:	d2850001 	mov	x1, #0x2800                	// #10240
   e0c78:	8b010061 	add	x1, x3, x1
   e0c7c:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0c80:	b9401fe0 	ldr	w0, [sp, #28]
   e0c84:	11000400 	add	w0, w0, #0x1
   e0c88:	b9001fe0 	str	w0, [sp, #28]
   e0c8c:	b9401fe0 	ldr	w0, [sp, #28]
   e0c90:	710ffc1f 	cmp	w0, #0x3ff
   e0c94:	54fffded 	b.le	e0c50 <example7+0x14>
   e0c98:	d503201f 	nop
   e0c9c:	d503201f 	nop
   e0ca0:	910083ff 	add	sp, sp, #0x20
   e0ca4:	d65f03c0 	ret

00000000000e0ca8 <example8>:
   e0ca8:	d10083ff 	sub	sp, sp, #0x20
   e0cac:	f90007e0 	str	x0, [sp, #8]
   e0cb0:	b90007e1 	str	w1, [sp, #4]
   e0cb4:	b9001fff 	str	wzr, [sp, #28]
   e0cb8:	14000015 	b	e0d0c <example8+0x64>
   e0cbc:	b9001bff 	str	wzr, [sp, #24]
   e0cc0:	1400000d 	b	e0cf4 <example8+0x4c>
   e0cc4:	f94007e0 	ldr	x0, [sp, #8]
   e0cc8:	b9801be1 	ldrsw	x1, [sp, #24]
   e0ccc:	b9801fe2 	ldrsw	x2, [sp, #28]
   e0cd0:	d376d442 	lsl	x2, x2, #10
   e0cd4:	8b010042 	add	x2, x2, x1
   e0cd8:	d2890001 	mov	x1, #0x4800                	// #18432
   e0cdc:	8b010041 	add	x1, x2, x1
   e0ce0:	b94007e2 	ldr	w2, [sp, #4]
   e0ce4:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0ce8:	b9401be0 	ldr	w0, [sp, #24]
   e0cec:	11000400 	add	w0, w0, #0x1
   e0cf0:	b9001be0 	str	w0, [sp, #24]
   e0cf4:	b9401be0 	ldr	w0, [sp, #24]
   e0cf8:	710ffc1f 	cmp	w0, #0x3ff
   e0cfc:	54fffe4d 	b.le	e0cc4 <example8+0x1c>
   e0d00:	b9401fe0 	ldr	w0, [sp, #28]
   e0d04:	11000400 	add	w0, w0, #0x1
   e0d08:	b9001fe0 	str	w0, [sp, #28]
   e0d0c:	b9401fe0 	ldr	w0, [sp, #28]
   e0d10:	71007c1f 	cmp	w0, #0x1f
   e0d14:	54fffd4d 	b.le	e0cbc <example8+0x14>
   e0d18:	d503201f 	nop
   e0d1c:	d503201f 	nop
   e0d20:	910083ff 	add	sp, sp, #0x20
   e0d24:	d65f03c0 	ret

00000000000e0d28 <example9>:
   e0d28:	d10083ff 	sub	sp, sp, #0x20
   e0d2c:	f90007e0 	str	x0, [sp, #8]
   e0d30:	f90003e1 	str	x1, [sp]
   e0d34:	b9001bff 	str	wzr, [sp, #24]
   e0d38:	b9001fff 	str	wzr, [sp, #28]
   e0d3c:	14000012 	b	e0d84 <example9+0x5c>
   e0d40:	f94007e0 	ldr	x0, [sp, #8]
   e0d44:	b9801fe2 	ldrsw	x2, [sp, #28]
   e0d48:	d2830001 	mov	x1, #0x1800                	// #6144
   e0d4c:	8b010041 	add	x1, x2, x1
   e0d50:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e0d54:	f94007e0 	ldr	x0, [sp, #8]
   e0d58:	b9801fe3 	ldrsw	x3, [sp, #28]
   e0d5c:	d2838002 	mov	x2, #0x1c00                	// #7168
   e0d60:	8b020062 	add	x2, x3, x2
   e0d64:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e0d68:	4b000020 	sub	w0, w1, w0
   e0d6c:	b9401be1 	ldr	w1, [sp, #24]
   e0d70:	0b000020 	add	w0, w1, w0
   e0d74:	b9001be0 	str	w0, [sp, #24]
   e0d78:	b9401fe0 	ldr	w0, [sp, #28]
   e0d7c:	11000400 	add	w0, w0, #0x1
   e0d80:	b9001fe0 	str	w0, [sp, #28]
   e0d84:	b9401fe0 	ldr	w0, [sp, #28]
   e0d88:	710ffc1f 	cmp	w0, #0x3ff
   e0d8c:	54fffdad 	b.le	e0d40 <example9+0x18>
   e0d90:	f94003e0 	ldr	x0, [sp]
   e0d94:	b9401be1 	ldr	w1, [sp, #24]
   e0d98:	b9000001 	str	w1, [x0]
   e0d9c:	d503201f 	nop
   e0da0:	910083ff 	add	sp, sp, #0x20
   e0da4:	d65f03c0 	ret

00000000000e0da8 <example10a>:
   e0da8:	d10143ff 	sub	sp, sp, #0x50
   e0dac:	f9001fe0 	str	x0, [sp, #56]
   e0db0:	f9001be1 	str	x1, [sp, #48]
   e0db4:	f90017e2 	str	x2, [sp, #40]
   e0db8:	f90013e3 	str	x3, [sp, #32]
   e0dbc:	f9000fe4 	str	x4, [sp, #24]
   e0dc0:	f9000be5 	str	x5, [sp, #16]
   e0dc4:	f90007e6 	str	x6, [sp, #8]
   e0dc8:	b9004fff 	str	wzr, [sp, #76]
   e0dcc:	14000023 	b	e0e58 <example10a+0xb0>
   e0dd0:	f9401fe0 	ldr	x0, [sp, #56]
   e0dd4:	b9804fe1 	ldrsw	x1, [sp, #76]
   e0dd8:	91400421 	add	x1, x1, #0x1, lsl #12
   e0ddc:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e0de0:	f9401fe0 	ldr	x0, [sp, #56]
   e0de4:	b9804fe3 	ldrsw	x3, [sp, #76]
   e0de8:	d2828002 	mov	x2, #0x1400                	// #5120
   e0dec:	8b020062 	add	x2, x3, x2
   e0df0:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e0df4:	0b000022 	add	w2, w1, w0
   e0df8:	f9401fe0 	ldr	x0, [sp, #56]
   e0dfc:	b9804fe1 	ldrsw	x1, [sp, #76]
   e0e00:	91300021 	add	x1, x1, #0xc00
   e0e04:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0e08:	f9401fe0 	ldr	x0, [sp, #56]
   e0e0c:	b9804fe1 	ldrsw	x1, [sp, #76]
   e0e10:	91200021 	add	x1, x1, #0x800
   e0e14:	78e17800 	ldrsh	w0, [x0, x1, lsl #1]
   e0e18:	12003c01 	and	w1, w0, #0xffff
   e0e1c:	f9401fe0 	ldr	x0, [sp, #56]
   e0e20:	b9804fe2 	ldrsw	x2, [sp, #76]
   e0e24:	91300042 	add	x2, x2, #0xc00
   e0e28:	78e27800 	ldrsh	w0, [x0, x2, lsl #1]
   e0e2c:	12003c00 	and	w0, w0, #0xffff
   e0e30:	0b000020 	add	w0, w1, w0
   e0e34:	12003c00 	and	w0, w0, #0xffff
   e0e38:	13003c02 	sxth	w2, w0
   e0e3c:	f9401fe0 	ldr	x0, [sp, #56]
   e0e40:	b9804fe1 	ldrsw	x1, [sp, #76]
   e0e44:	91100021 	add	x1, x1, #0x400
   e0e48:	78217802 	strh	w2, [x0, x1, lsl #1]
   e0e4c:	b9404fe0 	ldr	w0, [sp, #76]
   e0e50:	11000400 	add	w0, w0, #0x1
   e0e54:	b9004fe0 	str	w0, [sp, #76]
   e0e58:	b9404fe0 	ldr	w0, [sp, #76]
   e0e5c:	710ffc1f 	cmp	w0, #0x3ff
   e0e60:	54fffb8d 	b.le	e0dd0 <example10a+0x28>
   e0e64:	d503201f 	nop
   e0e68:	d503201f 	nop
   e0e6c:	910143ff 	add	sp, sp, #0x50
   e0e70:	d65f03c0 	ret

00000000000e0e74 <example10b>:
   e0e74:	d10143ff 	sub	sp, sp, #0x50
   e0e78:	f9001fe0 	str	x0, [sp, #56]
   e0e7c:	f9001be1 	str	x1, [sp, #48]
   e0e80:	f90017e2 	str	x2, [sp, #40]
   e0e84:	f90013e3 	str	x3, [sp, #32]
   e0e88:	f9000fe4 	str	x4, [sp, #24]
   e0e8c:	f9000be5 	str	x5, [sp, #16]
   e0e90:	f90007e6 	str	x6, [sp, #8]
   e0e94:	b9004fff 	str	wzr, [sp, #76]
   e0e98:	1400000d 	b	e0ecc <example10b+0x58>
   e0e9c:	f9401fe0 	ldr	x0, [sp, #56]
   e0ea0:	b9804fe1 	ldrsw	x1, [sp, #76]
   e0ea4:	91200021 	add	x1, x1, #0x800
   e0ea8:	78e17800 	ldrsh	w0, [x0, x1, lsl #1]
   e0eac:	2a0003e2 	mov	w2, w0
   e0eb0:	f9401fe0 	ldr	x0, [sp, #56]
   e0eb4:	b9804fe1 	ldrsw	x1, [sp, #76]
   e0eb8:	91300021 	add	x1, x1, #0xc00
   e0ebc:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0ec0:	b9404fe0 	ldr	w0, [sp, #76]
   e0ec4:	11000400 	add	w0, w0, #0x1
   e0ec8:	b9004fe0 	str	w0, [sp, #76]
   e0ecc:	b9404fe0 	ldr	w0, [sp, #76]
   e0ed0:	710ffc1f 	cmp	w0, #0x3ff
   e0ed4:	54fffe4d 	b.le	e0e9c <example10b+0x28>
   e0ed8:	d503201f 	nop
   e0edc:	d503201f 	nop
   e0ee0:	910143ff 	add	sp, sp, #0x50
   e0ee4:	d65f03c0 	ret

00000000000e0ee8 <example11>:
   e0ee8:	d10083ff 	sub	sp, sp, #0x20
   e0eec:	f90007e0 	str	x0, [sp, #8]
   e0ef0:	b9001fff 	str	wzr, [sp, #28]
   e0ef4:	1400004b 	b	e1020 <example11+0x138>
   e0ef8:	b9401fe0 	ldr	w0, [sp, #28]
   e0efc:	531f7800 	lsl	w0, w0, #1
   e0f00:	11000401 	add	w1, w0, #0x1
   e0f04:	f94007e0 	ldr	x0, [sp, #8]
   e0f08:	93407c21 	sxtw	x1, w1
   e0f0c:	91400c21 	add	x1, x1, #0x3, lsl #12
   e0f10:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e0f14:	b9401fe0 	ldr	w0, [sp, #28]
   e0f18:	531f7800 	lsl	w0, w0, #1
   e0f1c:	11000402 	add	w2, w0, #0x1
   e0f20:	f94007e0 	ldr	x0, [sp, #8]
   e0f24:	93407c43 	sxtw	x3, w2
   e0f28:	d2870002 	mov	x2, #0x3800                	// #14336
   e0f2c:	8b020062 	add	x2, x3, x2
   e0f30:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e0f34:	1b007c21 	mul	w1, w1, w0
   e0f38:	b9401fe0 	ldr	w0, [sp, #28]
   e0f3c:	531f7802 	lsl	w2, w0, #1
   e0f40:	f94007e0 	ldr	x0, [sp, #8]
   e0f44:	93407c42 	sxtw	x2, w2
   e0f48:	91400c42 	add	x2, x2, #0x3, lsl #12
   e0f4c:	b8627802 	ldr	w2, [x0, x2, lsl #2]
   e0f50:	b9401fe0 	ldr	w0, [sp, #28]
   e0f54:	531f7803 	lsl	w3, w0, #1
   e0f58:	f94007e0 	ldr	x0, [sp, #8]
   e0f5c:	93407c64 	sxtw	x4, w3
   e0f60:	d2870003 	mov	x3, #0x3800                	// #14336
   e0f64:	8b030083 	add	x3, x4, x3
   e0f68:	b8637800 	ldr	w0, [x0, x3, lsl #2]
   e0f6c:	1b007c40 	mul	w0, w2, w0
   e0f70:	4b000022 	sub	w2, w1, w0
   e0f74:	f94007e0 	ldr	x0, [sp, #8]
   e0f78:	b9801fe3 	ldrsw	x3, [sp, #28]
   e0f7c:	d2850001 	mov	x1, #0x2800                	// #10240
   e0f80:	8b010061 	add	x1, x3, x1
   e0f84:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0f88:	b9401fe0 	ldr	w0, [sp, #28]
   e0f8c:	531f7801 	lsl	w1, w0, #1
   e0f90:	f94007e0 	ldr	x0, [sp, #8]
   e0f94:	93407c21 	sxtw	x1, w1
   e0f98:	91400c21 	add	x1, x1, #0x3, lsl #12
   e0f9c:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e0fa0:	b9401fe0 	ldr	w0, [sp, #28]
   e0fa4:	531f7800 	lsl	w0, w0, #1
   e0fa8:	11000402 	add	w2, w0, #0x1
   e0fac:	f94007e0 	ldr	x0, [sp, #8]
   e0fb0:	93407c43 	sxtw	x3, w2
   e0fb4:	d2870002 	mov	x2, #0x3800                	// #14336
   e0fb8:	8b020062 	add	x2, x3, x2
   e0fbc:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e0fc0:	1b007c21 	mul	w1, w1, w0
   e0fc4:	b9401fe0 	ldr	w0, [sp, #28]
   e0fc8:	531f7800 	lsl	w0, w0, #1
   e0fcc:	11000402 	add	w2, w0, #0x1
   e0fd0:	f94007e0 	ldr	x0, [sp, #8]
   e0fd4:	93407c42 	sxtw	x2, w2
   e0fd8:	91400c42 	add	x2, x2, #0x3, lsl #12
   e0fdc:	b8627802 	ldr	w2, [x0, x2, lsl #2]
   e0fe0:	b9401fe0 	ldr	w0, [sp, #28]
   e0fe4:	531f7803 	lsl	w3, w0, #1
   e0fe8:	f94007e0 	ldr	x0, [sp, #8]
   e0fec:	93407c64 	sxtw	x4, w3
   e0ff0:	d2870003 	mov	x3, #0x3800                	// #14336
   e0ff4:	8b030083 	add	x3, x4, x3
   e0ff8:	b8637800 	ldr	w0, [x0, x3, lsl #2]
   e0ffc:	1b007c40 	mul	w0, w2, w0
   e1000:	0b000022 	add	w2, w1, w0
   e1004:	f94007e0 	ldr	x0, [sp, #8]
   e1008:	b9801fe1 	ldrsw	x1, [sp, #28]
   e100c:	91401021 	add	x1, x1, #0x4, lsl #12
   e1010:	b8217802 	str	w2, [x0, x1, lsl #2]
   e1014:	b9401fe0 	ldr	w0, [sp, #28]
   e1018:	11000400 	add	w0, w0, #0x1
   e101c:	b9001fe0 	str	w0, [sp, #28]
   e1020:	b9401fe0 	ldr	w0, [sp, #28]
   e1024:	7107fc1f 	cmp	w0, #0x1ff
   e1028:	54fff68d 	b.le	e0ef8 <example11+0x10>
   e102c:	d503201f 	nop
   e1030:	d503201f 	nop
   e1034:	910083ff 	add	sp, sp, #0x20
   e1038:	d65f03c0 	ret

00000000000e103c <example12>:
   e103c:	d10083ff 	sub	sp, sp, #0x20
   e1040:	f90007e0 	str	x0, [sp, #8]
   e1044:	b9001fff 	str	wzr, [sp, #28]
   e1048:	1400000a 	b	e1070 <example12+0x34>
   e104c:	f94007e0 	ldr	x0, [sp, #8]
   e1050:	b9801fe2 	ldrsw	x2, [sp, #28]
   e1054:	d2850001 	mov	x1, #0x2800                	// #10240
   e1058:	8b010041 	add	x1, x2, x1
   e105c:	b9401fe2 	ldr	w2, [sp, #28]
   e1060:	b8217802 	str	w2, [x0, x1, lsl #2]
   e1064:	b9401fe0 	ldr	w0, [sp, #28]
   e1068:	11000400 	add	w0, w0, #0x1
   e106c:	b9001fe0 	str	w0, [sp, #28]
   e1070:	b9401fe0 	ldr	w0, [sp, #28]
   e1074:	710ffc1f 	cmp	w0, #0x3ff
   e1078:	54fffead 	b.le	e104c <example12+0x10>
   e107c:	d503201f 	nop
   e1080:	d503201f 	nop
   e1084:	910083ff 	add	sp, sp, #0x20
   e1088:	d65f03c0 	ret

00000000000e108c <example13>:
   e108c:	d100c3ff 	sub	sp, sp, #0x30
   e1090:	f9000fe0 	str	x0, [sp, #24]
   e1094:	f9000be1 	str	x1, [sp, #16]
   e1098:	f90007e2 	str	x2, [sp, #8]
   e109c:	f90003e3 	str	x3, [sp]
   e10a0:	b9002fff 	str	wzr, [sp, #44]
   e10a4:	14000029 	b	e1148 <example13+0xbc>
   e10a8:	b90027ff 	str	wzr, [sp, #36]
   e10ac:	b9002bff 	str	wzr, [sp, #40]
   e10b0:	1400001a 	b	e1118 <example13+0x8c>
   e10b4:	b9802fe0 	ldrsw	x0, [sp, #44]
   e10b8:	d37df000 	lsl	x0, x0, #3
   e10bc:	f9400be1 	ldr	x1, [sp, #16]
   e10c0:	8b000020 	add	x0, x1, x0
   e10c4:	f9400001 	ldr	x1, [x0]
   e10c8:	b9802be0 	ldrsw	x0, [sp, #40]
   e10cc:	d37ef400 	lsl	x0, x0, #2
   e10d0:	8b000020 	add	x0, x1, x0
   e10d4:	b9400001 	ldr	w1, [x0]
   e10d8:	b9802fe0 	ldrsw	x0, [sp, #44]
   e10dc:	d37df000 	lsl	x0, x0, #3
   e10e0:	f94007e2 	ldr	x2, [sp, #8]
   e10e4:	8b000040 	add	x0, x2, x0
   e10e8:	f9400002 	ldr	x2, [x0]
   e10ec:	b9802be0 	ldrsw	x0, [sp, #40]
   e10f0:	d37ef400 	lsl	x0, x0, #2
   e10f4:	8b000040 	add	x0, x2, x0
   e10f8:	b9400000 	ldr	w0, [x0]
   e10fc:	4b000020 	sub	w0, w1, w0
   e1100:	b94027e1 	ldr	w1, [sp, #36]
   e1104:	0b000020 	add	w0, w1, w0
   e1108:	b90027e0 	str	w0, [sp, #36]
   e110c:	b9402be0 	ldr	w0, [sp, #40]
   e1110:	11002000 	add	w0, w0, #0x8
   e1114:	b9002be0 	str	w0, [sp, #40]
   e1118:	b9402be0 	ldr	w0, [sp, #40]
   e111c:	710ffc1f 	cmp	w0, #0x3ff
   e1120:	54fffcad 	b.le	e10b4 <example13+0x28>
   e1124:	b9802fe0 	ldrsw	x0, [sp, #44]
   e1128:	d37ef400 	lsl	x0, x0, #2
   e112c:	f94003e1 	ldr	x1, [sp]
   e1130:	8b000020 	add	x0, x1, x0
   e1134:	b94027e1 	ldr	w1, [sp, #36]
   e1138:	b9000001 	str	w1, [x0]
   e113c:	b9402fe0 	ldr	w0, [sp, #44]
   e1140:	11000400 	add	w0, w0, #0x1
   e1144:	b9002fe0 	str	w0, [sp, #44]
   e1148:	b9402fe0 	ldr	w0, [sp, #44]
   e114c:	71007c1f 	cmp	w0, #0x1f
   e1150:	54fffacd 	b.le	e10a8 <example13+0x1c>
   e1154:	d503201f 	nop
   e1158:	d503201f 	nop
   e115c:	9100c3ff 	add	sp, sp, #0x30
   e1160:	d65f03c0 	ret

00000000000e1164 <example14>:
   e1164:	d100c3ff 	sub	sp, sp, #0x30
   e1168:	f9000fe0 	str	x0, [sp, #24]
   e116c:	f9000be1 	str	x1, [sp, #16]
   e1170:	f90007e2 	str	x2, [sp, #8]
   e1174:	f90003e3 	str	x3, [sp]
   e1178:	b90027ff 	str	wzr, [sp, #36]
   e117c:	b9002fff 	str	wzr, [sp, #44]
   e1180:	14000034 	b	e1250 <example14+0xec>
   e1184:	b90023ff 	str	wzr, [sp, #32]
   e1188:	b9002bff 	str	wzr, [sp, #40]
   e118c:	14000025 	b	e1220 <example14+0xbc>
   e1190:	b90027ff 	str	wzr, [sp, #36]
   e1194:	1400001d 	b	e1208 <example14+0xa4>
   e1198:	b94027e1 	ldr	w1, [sp, #36]
   e119c:	b9402fe0 	ldr	w0, [sp, #44]
   e11a0:	0b000020 	add	w0, w1, w0
   e11a4:	93407c00 	sxtw	x0, w0
   e11a8:	d37df000 	lsl	x0, x0, #3
   e11ac:	f9400be1 	ldr	x1, [sp, #16]
   e11b0:	8b000020 	add	x0, x1, x0
   e11b4:	f9400001 	ldr	x1, [x0]
   e11b8:	b9802be0 	ldrsw	x0, [sp, #40]
   e11bc:	d37ef400 	lsl	x0, x0, #2
   e11c0:	8b000020 	add	x0, x1, x0
   e11c4:	b9400001 	ldr	w1, [x0]
   e11c8:	b98027e0 	ldrsw	x0, [sp, #36]
   e11cc:	d37df000 	lsl	x0, x0, #3
   e11d0:	f94007e2 	ldr	x2, [sp, #8]
   e11d4:	8b000040 	add	x0, x2, x0
   e11d8:	f9400002 	ldr	x2, [x0]
   e11dc:	b9802be0 	ldrsw	x0, [sp, #40]
   e11e0:	d37ef400 	lsl	x0, x0, #2
   e11e4:	8b000040 	add	x0, x2, x0
   e11e8:	b9400000 	ldr	w0, [x0]
   e11ec:	1b007c20 	mul	w0, w1, w0
   e11f0:	b94023e1 	ldr	w1, [sp, #32]
   e11f4:	0b000020 	add	w0, w1, w0
   e11f8:	b90023e0 	str	w0, [sp, #32]
   e11fc:	b94027e0 	ldr	w0, [sp, #36]
   e1200:	11000400 	add	w0, w0, #0x1
   e1204:	b90027e0 	str	w0, [sp, #36]
   e1208:	b94027e0 	ldr	w0, [sp, #36]
   e120c:	710ffc1f 	cmp	w0, #0x3ff
   e1210:	54fffc4d 	b.le	e1198 <example14+0x34>
   e1214:	b9402be0 	ldr	w0, [sp, #40]
   e1218:	11000400 	add	w0, w0, #0x1
   e121c:	b9002be0 	str	w0, [sp, #40]
   e1220:	b9402be0 	ldr	w0, [sp, #40]
   e1224:	71007c1f 	cmp	w0, #0x1f
   e1228:	54fffb4d 	b.le	e1190 <example14+0x2c>
   e122c:	b9802fe0 	ldrsw	x0, [sp, #44]
   e1230:	d37ef400 	lsl	x0, x0, #2
   e1234:	f94003e1 	ldr	x1, [sp]
   e1238:	8b000020 	add	x0, x1, x0
   e123c:	b94023e1 	ldr	w1, [sp, #32]
   e1240:	b9000001 	str	w1, [x0]
   e1244:	b9402fe0 	ldr	w0, [sp, #44]
   e1248:	11000400 	add	w0, w0, #0x1
   e124c:	b9002fe0 	str	w0, [sp, #44]
   e1250:	b9402fe0 	ldr	w0, [sp, #44]
   e1254:	71000c1f 	cmp	w0, #0x3
   e1258:	54fff96d 	b.le	e1184 <example14+0x20>
   e125c:	d503201f 	nop
   e1260:	d503201f 	nop
   e1264:	9100c3ff 	add	sp, sp, #0x30
   e1268:	d65f03c0 	ret

00000000000e126c <example23>:
   e126c:	d100c3ff 	sub	sp, sp, #0x30
   e1270:	f9000fe0 	str	x0, [sp, #24]
   e1274:	f9000be1 	str	x1, [sp, #16]
   e1278:	f90007e2 	str	x2, [sp, #8]
   e127c:	b9002fff 	str	wzr, [sp, #44]
   e1280:	1400000e 	b	e12b8 <example23+0x4c>
   e1284:	f9400be0 	ldr	x0, [sp, #16]
   e1288:	91000801 	add	x1, x0, #0x2
   e128c:	f9000be1 	str	x1, [sp, #16]
   e1290:	79400000 	ldrh	w0, [x0]
   e1294:	2a0003e2 	mov	w2, w0
   e1298:	f94007e0 	ldr	x0, [sp, #8]
   e129c:	91001001 	add	x1, x0, #0x4
   e12a0:	f90007e1 	str	x1, [sp, #8]
   e12a4:	53196041 	lsl	w1, w2, #7
   e12a8:	b9000001 	str	w1, [x0]
   e12ac:	b9402fe0 	ldr	w0, [sp, #44]
   e12b0:	11000400 	add	w0, w0, #0x1
   e12b4:	b9002fe0 	str	w0, [sp, #44]
   e12b8:	b9402fe0 	ldr	w0, [sp, #44]
   e12bc:	7103fc1f 	cmp	w0, #0xff
   e12c0:	54fffe2d 	b.le	e1284 <example23+0x18>
   e12c4:	d503201f 	nop
   e12c8:	d503201f 	nop
   e12cc:	9100c3ff 	add	sp, sp, #0x30
   e12d0:	d65f03c0 	ret

00000000000e12d4 <init_memory>:
   e12d4:	d10083ff 	sub	sp, sp, #0x20
   e12d8:	f90007e0 	str	x0, [sp, #8]
   e12dc:	f90003e1 	str	x1, [sp]
   e12e0:	52800020 	mov	w0, #0x1                   	// #1
   e12e4:	39007fe0 	strb	w0, [sp, #31]
   e12e8:	14000013 	b	e1334 <init_memory+0x60>
   e12ec:	39407fe1 	ldrb	w1, [sp, #31]
   e12f0:	2a0103e0 	mov	w0, w1
   e12f4:	531d1000 	ubfiz	w0, w0, #3, #5
   e12f8:	4b010000 	sub	w0, w0, w1
   e12fc:	39007fe0 	strb	w0, [sp, #31]
   e1300:	39407fe1 	ldrb	w1, [sp, #31]
   e1304:	528004e0 	mov	w0, #0x27                  	// #39
   e1308:	4a000020 	eor	w0, w1, w0
   e130c:	39007fe0 	strb	w0, [sp, #31]
   e1310:	39407fe0 	ldrb	w0, [sp, #31]
   e1314:	11000400 	add	w0, w0, #0x1
   e1318:	39007fe0 	strb	w0, [sp, #31]
   e131c:	f94007e0 	ldr	x0, [sp, #8]
   e1320:	39407fe1 	ldrb	w1, [sp, #31]
   e1324:	39000001 	strb	w1, [x0]
   e1328:	f94007e0 	ldr	x0, [sp, #8]
   e132c:	91000400 	add	x0, x0, #0x1
   e1330:	f90007e0 	str	x0, [sp, #8]
   e1334:	f94007e1 	ldr	x1, [sp, #8]
   e1338:	f94003e0 	ldr	x0, [sp]
   e133c:	eb00003f 	cmp	x1, x0
   e1340:	54fffd61 	b.ne	e12ec <init_memory+0x18>  // b.any
   e1344:	d503201f 	nop
   e1348:	d503201f 	nop
   e134c:	910083ff 	add	sp, sp, #0x20
   e1350:	d65f03c0 	ret

00000000000e1354 <digest_memory>:
   e1354:	d10083ff 	sub	sp, sp, #0x20
   e1358:	f90007e0 	str	x0, [sp, #8]
   e135c:	f90003e1 	str	x1, [sp]
   e1360:	52800020 	mov	w0, #0x1                   	// #1
   e1364:	b9001fe0 	str	w0, [sp, #28]
   e1368:	14000015 	b	e13bc <digest_memory+0x68>
   e136c:	b9401fe1 	ldr	w1, [sp, #28]
   e1370:	2a0103e0 	mov	w0, w1
   e1374:	531f7800 	lsl	w0, w0, #1
   e1378:	0b010000 	add	w0, w0, w1
   e137c:	b9001fe0 	str	w0, [sp, #28]
   e1380:	f94007e0 	ldr	x0, [sp, #8]
   e1384:	39400000 	ldrb	w0, [x0]
   e1388:	2a0003e1 	mov	w1, w0
   e138c:	b9401fe0 	ldr	w0, [sp, #28]
   e1390:	4a010000 	eor	w0, w0, w1
   e1394:	b9001fe0 	str	w0, [sp, #28]
   e1398:	b9401fe0 	ldr	w0, [sp, #28]
   e139c:	53087c01 	lsr	w1, w0, #8
   e13a0:	b9401fe0 	ldr	w0, [sp, #28]
   e13a4:	53185c00 	lsl	w0, w0, #8
   e13a8:	4a000020 	eor	w0, w1, w0
   e13ac:	b9001fe0 	str	w0, [sp, #28]
   e13b0:	f94007e0 	ldr	x0, [sp, #8]
   e13b4:	91000400 	add	x0, x0, #0x1
   e13b8:	f90007e0 	str	x0, [sp, #8]
   e13bc:	f94007e1 	ldr	x1, [sp, #8]
   e13c0:	f94003e0 	ldr	x0, [sp]
   e13c4:	eb00003f 	cmp	x1, x0
   e13c8:	54fffd21 	b.ne	e136c <digest_memory+0x18>  // b.any
   e13cc:	b9401fe0 	ldr	w0, [sp, #28]
   e13d0:	910083ff 	add	sp, sp, #0x20
   e13d4:	d65f03c0 	ret

00000000000e13d8 <memcpy>:
   e13d8:	d100c3ff 	sub	sp, sp, #0x30
   e13dc:	f9000fe0 	str	x0, [sp, #24]
   e13e0:	f9000be1 	str	x1, [sp, #16]
   e13e4:	f90007e2 	str	x2, [sp, #8]
   e13e8:	f90017ff 	str	xzr, [sp, #40]
   e13ec:	1400000c 	b	e141c <memcpy+0x44>
   e13f0:	f9400be1 	ldr	x1, [sp, #16]
   e13f4:	f94017e0 	ldr	x0, [sp, #40]
   e13f8:	8b000021 	add	x1, x1, x0
   e13fc:	f9400fe2 	ldr	x2, [sp, #24]
   e1400:	f94017e0 	ldr	x0, [sp, #40]
   e1404:	8b000040 	add	x0, x2, x0
   e1408:	39400021 	ldrb	w1, [x1]
   e140c:	39000001 	strb	w1, [x0]
   e1410:	f94017e0 	ldr	x0, [sp, #40]
   e1414:	91000400 	add	x0, x0, #0x1
   e1418:	f90017e0 	str	x0, [sp, #40]
   e141c:	f94017e1 	ldr	x1, [sp, #40]
   e1420:	f94007e0 	ldr	x0, [sp, #8]
   e1424:	eb00003f 	cmp	x1, x0
   e1428:	54fffe41 	b.ne	e13f0 <memcpy+0x18>  // b.any
   e142c:	f9400fe0 	ldr	x0, [sp, #24]
   e1430:	9100c3ff 	add	sp, sp, #0x30
   e1434:	d65f03c0 	ret

00000000000e1438 <memset>:
   e1438:	d100c3ff 	sub	sp, sp, #0x30
   e143c:	f9000fe0 	str	x0, [sp, #24]
   e1440:	b90017e1 	str	w1, [sp, #20]
   e1444:	f90007e2 	str	x2, [sp, #8]
   e1448:	f90017ff 	str	xzr, [sp, #40]
   e144c:	1400000a 	b	e1474 <memset+0x3c>
   e1450:	f9400fe1 	ldr	x1, [sp, #24]
   e1454:	f94017e0 	ldr	x0, [sp, #40]
   e1458:	8b000020 	add	x0, x1, x0
   e145c:	b94017e1 	ldr	w1, [sp, #20]
   e1460:	12001c21 	and	w1, w1, #0xff
   e1464:	39000001 	strb	w1, [x0]
   e1468:	f94017e0 	ldr	x0, [sp, #40]
   e146c:	91000400 	add	x0, x0, #0x1
   e1470:	f90017e0 	str	x0, [sp, #40]
   e1474:	f94017e1 	ldr	x1, [sp, #40]
   e1478:	f94007e0 	ldr	x0, [sp, #8]
   e147c:	eb00003f 	cmp	x1, x0
   e1480:	54fffe81 	b.ne	e1450 <memset+0x18>  // b.any
   e1484:	f9400fe0 	ldr	x0, [sp, #24]
   e1488:	9100c3ff 	add	sp, sp, #0x30
   e148c:	d65f03c0 	ret

00000000000e1490 <memmove>:
   e1490:	d100c3ff 	sub	sp, sp, #0x30
   e1494:	f9000fe0 	str	x0, [sp, #24]
   e1498:	f9000be1 	str	x1, [sp, #16]
   e149c:	f90007e2 	str	x2, [sp, #8]
   e14a0:	f94007e0 	ldr	x0, [sp, #8]
   e14a4:	f90017e0 	str	x0, [sp, #40]
   e14a8:	1400000e 	b	e14e0 <memmove+0x50>
   e14ac:	f94017e0 	ldr	x0, [sp, #40]
   e14b0:	d1000400 	sub	x0, x0, #0x1
   e14b4:	f9400be1 	ldr	x1, [sp, #16]
   e14b8:	8b000021 	add	x1, x1, x0
   e14bc:	f94017e0 	ldr	x0, [sp, #40]
   e14c0:	d1000400 	sub	x0, x0, #0x1
   e14c4:	f9400fe2 	ldr	x2, [sp, #24]
   e14c8:	8b000040 	add	x0, x2, x0
   e14cc:	39400021 	ldrb	w1, [x1]
   e14d0:	39000001 	strb	w1, [x0]
   e14d4:	f94017e0 	ldr	x0, [sp, #40]
   e14d8:	d1000400 	sub	x0, x0, #0x1
   e14dc:	f90017e0 	str	x0, [sp, #40]
   e14e0:	f94017e0 	ldr	x0, [sp, #40]
   e14e4:	f100001f 	cmp	x0, #0x0
   e14e8:	54fffe21 	b.ne	e14ac <memmove+0x1c>  // b.any
   e14ec:	f9400fe0 	ldr	x0, [sp, #24]
   e14f0:	9100c3ff 	add	sp, sp, #0x30
   e14f4:	d65f03c0 	ret
