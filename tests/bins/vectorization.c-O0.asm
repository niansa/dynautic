
vectorization.c.elf:     file format elf64-littleaarch64


Disassembly of section .start:

00000000000e0000 <_start>:
   e0000:	d101c3ff 	sub	sp, sp, #0x70
   e0004:	d140cbff 	sub	sp, sp, #0x32, lsl #12
   e0008:	a9007bfd 	stp	x29, x30, [sp]
   e000c:	910003fd 	mov	x29, sp
   e0010:	f9000bf3 	str	x19, [sp, #16]
   e0014:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0018:	b920341f 	str	wzr, [x0, #8244]
   e001c:	b9002fff 	str	wzr, [sp, #44]
   e0020:	52808000 	mov	w0, #0x400                 	// #1024
   e0024:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0028:	b9203020 	str	w0, [x1, #8240]
   e002c:	9100c3e0 	add	x0, sp, #0x30
   e0030:	91401001 	add	x1, x0, #0x4, lsl #12
   e0034:	9100c3e0 	add	x0, sp, #0x30
   e0038:	91400c00 	add	x0, x0, #0x3, lsl #12
   e003c:	94000504 	bl	e144c <init_memory>
   e0040:	9100c3e0 	add	x0, sp, #0x30
   e0044:	91401401 	add	x1, x0, #0x5, lsl #12
   e0048:	9100c3e0 	add	x0, sp, #0x30
   e004c:	91401000 	add	x0, x0, #0x4, lsl #12
   e0050:	940004ff 	bl	e144c <init_memory>
   e0054:	9100c3e0 	add	x0, sp, #0x30
   e0058:	91401801 	add	x1, x0, #0x6, lsl #12
   e005c:	9100c3e0 	add	x0, sp, #0x30
   e0060:	91401400 	add	x0, x0, #0x5, lsl #12
   e0064:	940004fa 	bl	e144c <init_memory>
   e0068:	9100c3e0 	add	x0, sp, #0x30
   e006c:	91400401 	add	x1, x0, #0x1, lsl #12
   e0070:	9100c3e0 	add	x0, sp, #0x30
   e0074:	91200000 	add	x0, x0, #0x800
   e0078:	940004f5 	bl	e144c <init_memory>
   e007c:	9100c3e1 	add	x1, sp, #0x30
   e0080:	d2830000 	mov	x0, #0x1800                	// #6144
   e0084:	8b000021 	add	x1, x1, x0
   e0088:	9100c3e0 	add	x0, sp, #0x30
   e008c:	91400400 	add	x0, x0, #0x1, lsl #12
   e0090:	940004ef 	bl	e144c <init_memory>
   e0094:	9100c3e0 	add	x0, sp, #0x30
   e0098:	91400802 	add	x2, x0, #0x2, lsl #12
   e009c:	9100c3e1 	add	x1, sp, #0x30
   e00a0:	d2830000 	mov	x0, #0x1800                	// #6144
   e00a4:	8b000020 	add	x0, x1, x0
   e00a8:	aa0203e1 	mov	x1, x2
   e00ac:	940004e8 	bl	e144c <init_memory>
   e00b0:	9100c3e0 	add	x0, sp, #0x30
   e00b4:	91403001 	add	x1, x0, #0xc, lsl #12
   e00b8:	9100c3e0 	add	x0, sp, #0x30
   e00bc:	91402800 	add	x0, x0, #0xa, lsl #12
   e00c0:	940004e3 	bl	e144c <init_memory>
   e00c4:	9100c3e0 	add	x0, sp, #0x30
   e00c8:	91403801 	add	x1, x0, #0xe, lsl #12
   e00cc:	9100c3e0 	add	x0, sp, #0x30
   e00d0:	91403000 	add	x0, x0, #0xc, lsl #12
   e00d4:	940004de 	bl	e144c <init_memory>
   e00d8:	9100c3e0 	add	x0, sp, #0x30
   e00dc:	91404001 	add	x1, x0, #0x10, lsl #12
   e00e0:	9100c3e0 	add	x0, sp, #0x30
   e00e4:	91403800 	add	x0, x0, #0xe, lsl #12
   e00e8:	940004d9 	bl	e144c <init_memory>
   e00ec:	9100c3e0 	add	x0, sp, #0x30
   e00f0:	91400c01 	add	x1, x0, #0x3, lsl #12
   e00f4:	9100c3e0 	add	x0, sp, #0x30
   e00f8:	91400800 	add	x0, x0, #0x2, lsl #12
   e00fc:	940004d4 	bl	e144c <init_memory>
   e0100:	9100c3e0 	add	x0, sp, #0x30
   e0104:	91401c01 	add	x1, x0, #0x7, lsl #12
   e0108:	9100c3e0 	add	x0, sp, #0x30
   e010c:	91401800 	add	x0, x0, #0x6, lsl #12
   e0110:	940004cf 	bl	e144c <init_memory>
   e0114:	9100c3e0 	add	x0, sp, #0x30
   e0118:	91402001 	add	x1, x0, #0x8, lsl #12
   e011c:	9100c3e0 	add	x0, sp, #0x30
   e0120:	91401c00 	add	x0, x0, #0x7, lsl #12
   e0124:	940004ca 	bl	e144c <init_memory>
   e0128:	9100c3e0 	add	x0, sp, #0x30
   e012c:	91404c01 	add	x1, x0, #0x13, lsl #12
   e0130:	9100c3e0 	add	x0, sp, #0x30
   e0134:	91404800 	add	x0, x0, #0x12, lsl #12
   e0138:	940004c5 	bl	e144c <init_memory>
   e013c:	9100c3e0 	add	x0, sp, #0x30
   e0140:	94000239 	bl	e0a24 <example1>
   e0144:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0148:	b9206c1f 	str	wzr, [x0, #8300]
   e014c:	14000008 	b	e016c <_start+0x16c>
   e0150:	9100c3e0 	add	x0, sp, #0x30
   e0154:	94000234 	bl	e0a24 <example1>
   e0158:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e015c:	b9606c00 	ldr	w0, [x0, #8300]
   e0160:	11000400 	add	w0, w0, #0x1
   e0164:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0168:	b9206c20 	str	w0, [x1, #8300]
   e016c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0170:	b9603001 	ldr	w1, [x0, #8240]
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
   e01ac:	940004c8 	bl	e14cc <digest_memory>
   e01b0:	2a0003e1 	mov	w1, w0
   e01b4:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e01b8:	b9603400 	ldr	w0, [x0, #8244]
   e01bc:	0b010000 	add	w0, w0, w1
   e01c0:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e01c4:	b9203420 	str	w0, [x1, #8244]
   e01c8:	9100c3e0 	add	x0, sp, #0x30
   e01cc:	52800042 	mov	w2, #0x2                   	// #2
   e01d0:	52808001 	mov	w1, #0x400                 	// #1024
   e01d4:	94000231 	bl	e0a98 <example2a>
   e01d8:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e01dc:	b920681f 	str	wzr, [x0, #8296]
   e01e0:	1400000a 	b	e0208 <_start+0x208>
   e01e4:	9100c3e0 	add	x0, sp, #0x30
   e01e8:	52800042 	mov	w2, #0x2                   	// #2
   e01ec:	52808001 	mov	w1, #0x400                 	// #1024
   e01f0:	9400022a 	bl	e0a98 <example2a>
   e01f4:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e01f8:	b9606800 	ldr	w0, [x0, #8296]
   e01fc:	11000400 	add	w0, w0, #0x1
   e0200:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0204:	b9206820 	str	w0, [x1, #8296]
   e0208:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e020c:	b9603000 	ldr	w0, [x0, #8240]
   e0210:	531e7400 	lsl	w0, w0, #2
   e0214:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0218:	b9606821 	ldr	w1, [x1, #8296]
   e021c:	6b00003f 	cmp	w1, w0
   e0220:	54fffe2b 	b.lt	e01e4 <_start+0x1e4>  // b.tstop
   e0224:	9100c3e0 	add	x0, sp, #0x30
   e0228:	91403401 	add	x1, x0, #0xd, lsl #12
   e022c:	9100c3e0 	add	x0, sp, #0x30
   e0230:	91403000 	add	x0, x0, #0xc, lsl #12
   e0234:	940004a6 	bl	e14cc <digest_memory>
   e0238:	2a0003e1 	mov	w1, w0
   e023c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0240:	b9603400 	ldr	w0, [x0, #8244]
   e0244:	0b010000 	add	w0, w0, w1
   e0248:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e024c:	b9203420 	str	w0, [x1, #8244]
   e0250:	9100c3e0 	add	x0, sp, #0x30
   e0254:	52800042 	mov	w2, #0x2                   	// #2
   e0258:	52808001 	mov	w1, #0x400                 	// #1024
   e025c:	94000225 	bl	e0af0 <example2b>
   e0260:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0264:	b920641f 	str	wzr, [x0, #8292]
   e0268:	1400000a 	b	e0290 <_start+0x290>
   e026c:	9100c3e0 	add	x0, sp, #0x30
   e0270:	52800042 	mov	w2, #0x2                   	// #2
   e0274:	52808001 	mov	w1, #0x400                 	// #1024
   e0278:	9400021e 	bl	e0af0 <example2b>
   e027c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0280:	b9606400 	ldr	w0, [x0, #8292]
   e0284:	11000400 	add	w0, w0, #0x1
   e0288:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e028c:	b9206420 	str	w0, [x1, #8292]
   e0290:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0294:	b9603000 	ldr	w0, [x0, #8240]
   e0298:	531f7800 	lsl	w0, w0, #1
   e029c:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e02a0:	b9606421 	ldr	w1, [x1, #8292]
   e02a4:	6b00003f 	cmp	w1, w0
   e02a8:	54fffe2b 	b.lt	e026c <_start+0x26c>  // b.tstop
   e02ac:	9100c3e0 	add	x0, sp, #0x30
   e02b0:	91402c01 	add	x1, x0, #0xb, lsl #12
   e02b4:	9100c3e0 	add	x0, sp, #0x30
   e02b8:	91402800 	add	x0, x0, #0xa, lsl #12
   e02bc:	94000484 	bl	e14cc <digest_memory>
   e02c0:	2a0003e1 	mov	w1, w0
   e02c4:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e02c8:	b9603400 	ldr	w0, [x0, #8244]
   e02cc:	0b010000 	add	w0, w0, w1
   e02d0:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e02d4:	b9203420 	str	w0, [x1, #8244]
   e02d8:	9100c3e0 	add	x0, sp, #0x30
   e02dc:	91401002 	add	x2, x0, #0x4, lsl #12
   e02e0:	9100c3e0 	add	x0, sp, #0x30
   e02e4:	91400c01 	add	x1, x0, #0x3, lsl #12
   e02e8:	9100c3e0 	add	x0, sp, #0x30
   e02ec:	aa0203e3 	mov	x3, x2
   e02f0:	aa0103e2 	mov	x2, x1
   e02f4:	52808001 	mov	w1, #0x400                 	// #1024
   e02f8:	9400021f 	bl	e0b74 <example3>
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
   e0324:	52808001 	mov	w1, #0x400                 	// #1024
   e0328:	94000213 	bl	e0b74 <example3>
   e032c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0330:	b9606000 	ldr	w0, [x0, #8288]
   e0334:	11000400 	add	w0, w0, #0x1
   e0338:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e033c:	b9206020 	str	w0, [x1, #8288]
   e0340:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0344:	b9603000 	ldr	w0, [x0, #8240]
   e0348:	531f7800 	lsl	w0, w0, #1
   e034c:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0350:	b9606021 	ldr	w1, [x1, #8288]
   e0354:	6b00003f 	cmp	w1, w0
   e0358:	54fffd8b 	b.lt	e0308 <_start+0x308>  // b.tstop
   e035c:	9100c3e0 	add	x0, sp, #0x30
   e0360:	91401001 	add	x1, x0, #0x4, lsl #12
   e0364:	9100c3e0 	add	x0, sp, #0x30
   e0368:	91400c00 	add	x0, x0, #0x3, lsl #12
   e036c:	94000458 	bl	e14cc <digest_memory>
   e0370:	2a0003e1 	mov	w1, w0
   e0374:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0378:	b9603400 	ldr	w0, [x0, #8244]
   e037c:	0b010000 	add	w0, w0, w1
   e0380:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0384:	b9203420 	str	w0, [x1, #8244]
   e0388:	9100c3e0 	add	x0, sp, #0x30
   e038c:	91401002 	add	x2, x0, #0x4, lsl #12
   e0390:	9100c3e0 	add	x0, sp, #0x30
   e0394:	91400c01 	add	x1, x0, #0x3, lsl #12
   e0398:	9100c3e0 	add	x0, sp, #0x30
   e039c:	aa0203e3 	mov	x3, x2
   e03a0:	aa0103e2 	mov	x2, x1
   e03a4:	52808001 	mov	w1, #0x400                 	// #1024
   e03a8:	9400020a 	bl	e0bd0 <example4a>
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
   e03d8:	940001fe 	bl	e0bd0 <example4a>
   e03dc:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e03e0:	b9605c00 	ldr	w0, [x0, #8284]
   e03e4:	11000400 	add	w0, w0, #0x1
   e03e8:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e03ec:	b9205c20 	str	w0, [x1, #8284]
   e03f0:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e03f4:	b9603000 	ldr	w0, [x0, #8240]
   e03f8:	531f7800 	lsl	w0, w0, #1
   e03fc:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0400:	b9605c21 	ldr	w1, [x1, #8284]
   e0404:	6b00003f 	cmp	w1, w0
   e0408:	54fffd8b 	b.lt	e03b8 <_start+0x3b8>  // b.tstop
   e040c:	9100c3e0 	add	x0, sp, #0x30
   e0410:	91401001 	add	x1, x0, #0x4, lsl #12
   e0414:	9100c3e0 	add	x0, sp, #0x30
   e0418:	91400c00 	add	x0, x0, #0x3, lsl #12
   e041c:	9400042c 	bl	e14cc <digest_memory>
   e0420:	2a0003e1 	mov	w1, w0
   e0424:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0428:	b9603400 	ldr	w0, [x0, #8244]
   e042c:	0b010000 	add	w0, w0, w1
   e0430:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0434:	b9203420 	str	w0, [x1, #8244]
   e0438:	9100c3e0 	add	x0, sp, #0x30
   e043c:	91401002 	add	x2, x0, #0x4, lsl #12
   e0440:	9100c3e0 	add	x0, sp, #0x30
   e0444:	91400c01 	add	x1, x0, #0x3, lsl #12
   e0448:	9100c3e0 	add	x0, sp, #0x30
   e044c:	aa0203e3 	mov	x3, x2
   e0450:	aa0103e2 	mov	x2, x1
   e0454:	52807ec1 	mov	w1, #0x3f6                 	// #1014
   e0458:	940001f6 	bl	e0c30 <example4b>
   e045c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0460:	b920581f 	str	wzr, [x0, #8280]
   e0464:	1400000f 	b	e04a0 <_start+0x4a0>
   e0468:	9100c3e0 	add	x0, sp, #0x30
   e046c:	91401002 	add	x2, x0, #0x4, lsl #12
   e0470:	9100c3e0 	add	x0, sp, #0x30
   e0474:	91400c01 	add	x1, x0, #0x3, lsl #12
   e0478:	9100c3e0 	add	x0, sp, #0x30
   e047c:	aa0203e3 	mov	x3, x2
   e0480:	aa0103e2 	mov	x2, x1
   e0484:	52807ec1 	mov	w1, #0x3f6                 	// #1014
   e0488:	940001ea 	bl	e0c30 <example4b>
   e048c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0490:	b9605800 	ldr	w0, [x0, #8280]
   e0494:	11000400 	add	w0, w0, #0x1
   e0498:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e049c:	b9205820 	str	w0, [x1, #8280]
   e04a0:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e04a4:	b9603000 	ldr	w0, [x0, #8240]
   e04a8:	531f7800 	lsl	w0, w0, #1
   e04ac:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e04b0:	b9605821 	ldr	w1, [x1, #8280]
   e04b4:	6b00003f 	cmp	w1, w0
   e04b8:	54fffd8b 	b.lt	e0468 <_start+0x468>  // b.tstop
   e04bc:	9100c3e0 	add	x0, sp, #0x30
   e04c0:	91401001 	add	x1, x0, #0x4, lsl #12
   e04c4:	9100c3e0 	add	x0, sp, #0x30
   e04c8:	91400c00 	add	x0, x0, #0x3, lsl #12
   e04cc:	94000400 	bl	e14cc <digest_memory>
   e04d0:	2a0003e1 	mov	w1, w0
   e04d4:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e04d8:	b9603400 	ldr	w0, [x0, #8244]
   e04dc:	0b010000 	add	w0, w0, w1
   e04e0:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e04e4:	b9203420 	str	w0, [x1, #8244]
   e04e8:	9100c3e0 	add	x0, sp, #0x30
   e04ec:	91401002 	add	x2, x0, #0x4, lsl #12
   e04f0:	9100c3e0 	add	x0, sp, #0x30
   e04f4:	91400c01 	add	x1, x0, #0x3, lsl #12
   e04f8:	9100c3e0 	add	x0, sp, #0x30
   e04fc:	aa0203e3 	mov	x3, x2
   e0500:	aa0103e2 	mov	x2, x1
   e0504:	52808001 	mov	w1, #0x400                 	// #1024
   e0508:	940001ef 	bl	e0cc4 <example4c>
   e050c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0510:	b920541f 	str	wzr, [x0, #8276]
   e0514:	1400000f 	b	e0550 <_start+0x550>
   e0518:	9100c3e0 	add	x0, sp, #0x30
   e051c:	91401002 	add	x2, x0, #0x4, lsl #12
   e0520:	9100c3e0 	add	x0, sp, #0x30
   e0524:	91400c01 	add	x1, x0, #0x3, lsl #12
   e0528:	9100c3e0 	add	x0, sp, #0x30
   e052c:	aa0203e3 	mov	x3, x2
   e0530:	aa0103e2 	mov	x2, x1
   e0534:	52808001 	mov	w1, #0x400                 	// #1024
   e0538:	940001e3 	bl	e0cc4 <example4c>
   e053c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0540:	b9605400 	ldr	w0, [x0, #8276]
   e0544:	11000400 	add	w0, w0, #0x1
   e0548:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e054c:	b9205420 	str	w0, [x1, #8276]
   e0550:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0554:	b9603000 	ldr	w0, [x0, #8240]
   e0558:	531f7800 	lsl	w0, w0, #1
   e055c:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0560:	b9605421 	ldr	w1, [x1, #8276]
   e0564:	6b00003f 	cmp	w1, w0
   e0568:	54fffd8b 	b.lt	e0518 <_start+0x518>  // b.tstop
   e056c:	9100c3e0 	add	x0, sp, #0x30
   e0570:	91401401 	add	x1, x0, #0x5, lsl #12
   e0574:	9100c3e0 	add	x0, sp, #0x30
   e0578:	91401000 	add	x0, x0, #0x4, lsl #12
   e057c:	940003d4 	bl	e14cc <digest_memory>
   e0580:	2a0003e1 	mov	w1, w0
   e0584:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0588:	b9603400 	ldr	w0, [x0, #8244]
   e058c:	0b010000 	add	w0, w0, w1
   e0590:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0594:	b9203420 	str	w0, [x1, #8244]
   e0598:	9100c3e0 	add	x0, sp, #0x30
   e059c:	52800081 	mov	w1, #0x4                   	// #4
   e05a0:	94000205 	bl	e0db4 <example7>
   e05a4:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e05a8:	b920501f 	str	wzr, [x0, #8272]
   e05ac:	14000009 	b	e05d0 <_start+0x5d0>
   e05b0:	9100c3e0 	add	x0, sp, #0x30
   e05b4:	52800081 	mov	w1, #0x4                   	// #4
   e05b8:	940001ff 	bl	e0db4 <example7>
   e05bc:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e05c0:	b9605000 	ldr	w0, [x0, #8272]
   e05c4:	11000400 	add	w0, w0, #0x1
   e05c8:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e05cc:	b9205020 	str	w0, [x1, #8272]
   e05d0:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e05d4:	b9603000 	ldr	w0, [x0, #8240]
   e05d8:	531e7400 	lsl	w0, w0, #2
   e05dc:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e05e0:	b9605021 	ldr	w1, [x1, #8272]
   e05e4:	6b00003f 	cmp	w1, w0
   e05e8:	54fffe4b 	b.lt	e05b0 <_start+0x5b0>  // b.tstop
   e05ec:	9100c3e0 	add	x0, sp, #0x30
   e05f0:	91402c01 	add	x1, x0, #0xb, lsl #12
   e05f4:	9100c3e0 	add	x0, sp, #0x30
   e05f8:	91402800 	add	x0, x0, #0xa, lsl #12
   e05fc:	940003b4 	bl	e14cc <digest_memory>
   e0600:	2a0003e1 	mov	w1, w0
   e0604:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0608:	b9603400 	ldr	w0, [x0, #8244]
   e060c:	0b010000 	add	w0, w0, w1
   e0610:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0614:	b9203420 	str	w0, [x1, #8244]
   e0618:	9100c3e0 	add	x0, sp, #0x30
   e061c:	52800101 	mov	w1, #0x8                   	// #8
   e0620:	94000200 	bl	e0e20 <example8>
   e0624:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0628:	b9204c1f 	str	wzr, [x0, #8268]
   e062c:	14000009 	b	e0650 <_start+0x650>
   e0630:	9100c3e0 	add	x0, sp, #0x30
   e0634:	52800101 	mov	w1, #0x8                   	// #8
   e0638:	940001fa 	bl	e0e20 <example8>
   e063c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0640:	b9604c00 	ldr	w0, [x0, #8268]
   e0644:	11000400 	add	w0, w0, #0x1
   e0648:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e064c:	b9204c20 	str	w0, [x1, #8268]
   e0650:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0654:	b9603000 	ldr	w0, [x0, #8240]
   e0658:	11000c01 	add	w1, w0, #0x3
   e065c:	7100001f 	cmp	w0, #0x0
   e0660:	1a80b020 	csel	w0, w1, w0, lt	// lt = tstop
   e0664:	13027c00 	asr	w0, w0, #2
   e0668:	2a0003e1 	mov	w1, w0
   e066c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0670:	b9604c00 	ldr	w0, [x0, #8268]
   e0674:	6b01001f 	cmp	w0, w1
   e0678:	54fffdcb 	b.lt	e0630 <_start+0x630>  // b.tstop
   e067c:	9100c3e0 	add	x0, sp, #0x30
   e0680:	91404c01 	add	x1, x0, #0x13, lsl #12
   e0684:	9100c3e0 	add	x0, sp, #0x30
   e0688:	91404800 	add	x0, x0, #0x12, lsl #12
   e068c:	94000390 	bl	e14cc <digest_memory>
   e0690:	2a0003e1 	mov	w1, w0
   e0694:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0698:	b9603400 	ldr	w0, [x0, #8244]
   e069c:	0b010000 	add	w0, w0, w1
   e06a0:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e06a4:	b9203420 	str	w0, [x1, #8244]
   e06a8:	9100b3e1 	add	x1, sp, #0x2c
   e06ac:	9100c3e0 	add	x0, sp, #0x30
   e06b0:	940001fc 	bl	e0ea0 <example9>
   e06b4:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e06b8:	b920481f 	str	wzr, [x0, #8264]
   e06bc:	14000009 	b	e06e0 <_start+0x6e0>
   e06c0:	9100b3e1 	add	x1, sp, #0x2c
   e06c4:	9100c3e0 	add	x0, sp, #0x30
   e06c8:	940001f6 	bl	e0ea0 <example9>
   e06cc:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e06d0:	b9604800 	ldr	w0, [x0, #8264]
   e06d4:	11000400 	add	w0, w0, #0x1
   e06d8:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e06dc:	b9204820 	str	w0, [x1, #8264]
   e06e0:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e06e4:	b9603000 	ldr	w0, [x0, #8240]
   e06e8:	531f7800 	lsl	w0, w0, #1
   e06ec:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e06f0:	b9604821 	ldr	w1, [x1, #8264]
   e06f4:	6b00003f 	cmp	w1, w0
   e06f8:	54fffe4b 	b.lt	e06c0 <_start+0x6c0>  // b.tstop
   e06fc:	b9402fe0 	ldr	w0, [sp, #44]
   e0700:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0704:	b9603421 	ldr	w1, [x1, #8244]
   e0708:	0b000020 	add	w0, w1, w0
   e070c:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0710:	b9203420 	str	w0, [x1, #8244]
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
   e074c:	940001f5 	bl	e0f20 <example10a>
   e0750:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0754:	b920441f 	str	wzr, [x0, #8260]
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
   e0794:	940001e3 	bl	e0f20 <example10a>
   e0798:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e079c:	b9604400 	ldr	w0, [x0, #8260]
   e07a0:	11000400 	add	w0, w0, #0x1
   e07a4:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e07a8:	b9204420 	str	w0, [x1, #8260]
   e07ac:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e07b0:	b9603000 	ldr	w0, [x0, #8240]
   e07b4:	531f7800 	lsl	w0, w0, #1
   e07b8:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e07bc:	b9604421 	ldr	w1, [x1, #8260]
   e07c0:	6b00003f 	cmp	w1, w0
   e07c4:	54fffccb 	b.lt	e075c <_start+0x75c>  // b.tstop
   e07c8:	9100c3e0 	add	x0, sp, #0x30
   e07cc:	91401001 	add	x1, x0, #0x4, lsl #12
   e07d0:	9100c3e0 	add	x0, sp, #0x30
   e07d4:	91400c00 	add	x0, x0, #0x3, lsl #12
   e07d8:	9400033d 	bl	e14cc <digest_memory>
   e07dc:	2a0003f3 	mov	w19, w0
   e07e0:	9100c3e0 	add	x0, sp, #0x30
   e07e4:	91400401 	add	x1, x0, #0x1, lsl #12
   e07e8:	9100c3e0 	add	x0, sp, #0x30
   e07ec:	91200000 	add	x0, x0, #0x800
   e07f0:	94000337 	bl	e14cc <digest_memory>
   e07f4:	0b000260 	add	w0, w19, w0
   e07f8:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e07fc:	b9603421 	ldr	w1, [x1, #8244]
   e0800:	0b000020 	add	w0, w1, w0
   e0804:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0808:	b9203420 	str	w0, [x1, #8244]
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
   e0844:	940001ea 	bl	e0fec <example10b>
   e0848:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e084c:	b920401f 	str	wzr, [x0, #8256]
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
   e088c:	940001d8 	bl	e0fec <example10b>
   e0890:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0894:	b9604000 	ldr	w0, [x0, #8256]
   e0898:	11000400 	add	w0, w0, #0x1
   e089c:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e08a0:	b9204020 	str	w0, [x1, #8256]
   e08a4:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e08a8:	b9603000 	ldr	w0, [x0, #8240]
   e08ac:	531e7400 	lsl	w0, w0, #2
   e08b0:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e08b4:	b9604021 	ldr	w1, [x1, #8256]
   e08b8:	6b00003f 	cmp	w1, w0
   e08bc:	54fffccb 	b.lt	e0854 <_start+0x854>  // b.tstop
   e08c0:	9100c3e0 	add	x0, sp, #0x30
   e08c4:	91401001 	add	x1, x0, #0x4, lsl #12
   e08c8:	9100c3e0 	add	x0, sp, #0x30
   e08cc:	91400c00 	add	x0, x0, #0x3, lsl #12
   e08d0:	940002ff 	bl	e14cc <digest_memory>
   e08d4:	2a0003e1 	mov	w1, w0
   e08d8:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e08dc:	b9603400 	ldr	w0, [x0, #8244]
   e08e0:	0b010000 	add	w0, w0, w1
   e08e4:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e08e8:	b9203420 	str	w0, [x1, #8244]
   e08ec:	9100c3e0 	add	x0, sp, #0x30
   e08f0:	940001dc 	bl	e1060 <example11>
   e08f4:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e08f8:	b9203c1f 	str	wzr, [x0, #8252]
   e08fc:	14000008 	b	e091c <_start+0x91c>
   e0900:	9100c3e0 	add	x0, sp, #0x30
   e0904:	940001d7 	bl	e1060 <example11>
   e0908:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e090c:	b9603c00 	ldr	w0, [x0, #8252]
   e0910:	11000400 	add	w0, w0, #0x1
   e0914:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0918:	b9203c20 	str	w0, [x1, #8252]
   e091c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0920:	b9603000 	ldr	w0, [x0, #8240]
   e0924:	531f7800 	lsl	w0, w0, #1
   e0928:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e092c:	b9603c21 	ldr	w1, [x1, #8252]
   e0930:	6b00003f 	cmp	w1, w0
   e0934:	54fffe6b 	b.lt	e0900 <_start+0x900>  // b.tstop
   e0938:	9100c3e0 	add	x0, sp, #0x30
   e093c:	91404401 	add	x1, x0, #0x11, lsl #12
   e0940:	9100c3e0 	add	x0, sp, #0x30
   e0944:	91404000 	add	x0, x0, #0x10, lsl #12
   e0948:	940002e1 	bl	e14cc <digest_memory>
   e094c:	2a0003e1 	mov	w1, w0
   e0950:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0954:	b9603400 	ldr	w0, [x0, #8244]
   e0958:	0b010000 	add	w0, w0, w1
   e095c:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0960:	b9203420 	str	w0, [x1, #8244]
   e0964:	9100c3e0 	add	x0, sp, #0x30
   e0968:	91400802 	add	x2, x0, #0x2, lsl #12
   e096c:	9100c3e1 	add	x1, sp, #0x30
   e0970:	9100c3e0 	add	x0, sp, #0x30
   e0974:	9400029c 	bl	e13e4 <example23>
   e0978:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e097c:	b920381f 	str	wzr, [x0, #8248]
   e0980:	1400000b 	b	e09ac <_start+0x9ac>
   e0984:	9100c3e0 	add	x0, sp, #0x30
   e0988:	91400802 	add	x2, x0, #0x2, lsl #12
   e098c:	9100c3e1 	add	x1, sp, #0x30
   e0990:	9100c3e0 	add	x0, sp, #0x30
   e0994:	94000294 	bl	e13e4 <example23>
   e0998:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e099c:	b9603800 	ldr	w0, [x0, #8248]
   e09a0:	11000400 	add	w0, w0, #0x1
   e09a4:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e09a8:	b9203820 	str	w0, [x1, #8248]
   e09ac:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e09b0:	b9603000 	ldr	w0, [x0, #8240]
   e09b4:	531d7000 	lsl	w0, w0, #3
   e09b8:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e09bc:	b9603821 	ldr	w1, [x1, #8248]
   e09c0:	6b00003f 	cmp	w1, w0
   e09c4:	54fffe0b 	b.lt	e0984 <_start+0x984>  // b.tstop
   e09c8:	9100c3e0 	add	x0, sp, #0x30
   e09cc:	91080001 	add	x1, x0, #0x200
   e09d0:	9100c3e0 	add	x0, sp, #0x30
   e09d4:	940002be 	bl	e14cc <digest_memory>
   e09d8:	2a0003e1 	mov	w1, w0
   e09dc:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e09e0:	b9603400 	ldr	w0, [x0, #8244]
   e09e4:	0b010000 	add	w0, w0, w1
   e09e8:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e09ec:	b9203420 	str	w0, [x1, #8244]
   e09f0:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e09f4:	b9603400 	ldr	w0, [x0, #8244]
   e09f8:	f9400bf3 	ldr	x19, [sp, #16]
   e09fc:	a9407bfd 	ldp	x29, x30, [sp]
   e0a00:	9101c3ff 	add	sp, sp, #0x70
   e0a04:	9140cbff 	add	sp, sp, #0x32, lsl #12
   e0a08:	d65f03c0 	ret

Disassembly of section .text:

00000000000e0a0c <dump_regs>:
   e0a0c:	d10043ff 	sub	sp, sp, #0x10
   e0a10:	f90007e0 	str	x0, [sp, #8]
   e0a14:	d40000c1 	svc	#0x6
   e0a18:	d503201f 	nop
   e0a1c:	910043ff 	add	sp, sp, #0x10
   e0a20:	d65f03c0 	ret

00000000000e0a24 <example1>:
   e0a24:	d10083ff 	sub	sp, sp, #0x20
   e0a28:	f90007e0 	str	x0, [sp, #8]
   e0a2c:	b9001fff 	str	wzr, [sp, #28]
   e0a30:	14000013 	b	e0a7c <example1+0x58>
   e0a34:	f94007e0 	ldr	x0, [sp, #8]
   e0a38:	b9801fe1 	ldrsw	x1, [sp, #28]
   e0a3c:	91400c21 	add	x1, x1, #0x3, lsl #12
   e0a40:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e0a44:	f94007e0 	ldr	x0, [sp, #8]
   e0a48:	b9801fe3 	ldrsw	x3, [sp, #28]
   e0a4c:	d2870002 	mov	x2, #0x3800                	// #14336
   e0a50:	8b020062 	add	x2, x3, x2
   e0a54:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e0a58:	0b000022 	add	w2, w1, w0
   e0a5c:	f94007e0 	ldr	x0, [sp, #8]
   e0a60:	b9801fe3 	ldrsw	x3, [sp, #28]
   e0a64:	d2850001 	mov	x1, #0x2800                	// #10240
   e0a68:	8b010061 	add	x1, x3, x1
   e0a6c:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0a70:	b9401fe0 	ldr	w0, [sp, #28]
   e0a74:	11000400 	add	w0, w0, #0x1
   e0a78:	b9001fe0 	str	w0, [sp, #28]
   e0a7c:	b9401fe0 	ldr	w0, [sp, #28]
   e0a80:	7103fc1f 	cmp	w0, #0xff
   e0a84:	54fffd8d 	b.le	e0a34 <example1+0x10>
   e0a88:	d503201f 	nop
   e0a8c:	d503201f 	nop
   e0a90:	910083ff 	add	sp, sp, #0x20
   e0a94:	d65f03c0 	ret

00000000000e0a98 <example2a>:
   e0a98:	d10083ff 	sub	sp, sp, #0x20
   e0a9c:	f90007e0 	str	x0, [sp, #8]
   e0aa0:	b90007e1 	str	w1, [sp, #4]
   e0aa4:	b90003e2 	str	w2, [sp]
   e0aa8:	b9001fff 	str	wzr, [sp, #28]
   e0aac:	14000009 	b	e0ad0 <example2a+0x38>
   e0ab0:	f94007e0 	ldr	x0, [sp, #8]
   e0ab4:	b9801fe1 	ldrsw	x1, [sp, #28]
   e0ab8:	91400c21 	add	x1, x1, #0x3, lsl #12
   e0abc:	b94003e2 	ldr	w2, [sp]
   e0ac0:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0ac4:	b9401fe0 	ldr	w0, [sp, #28]
   e0ac8:	11000400 	add	w0, w0, #0x1
   e0acc:	b9001fe0 	str	w0, [sp, #28]
   e0ad0:	b9401fe1 	ldr	w1, [sp, #28]
   e0ad4:	b94007e0 	ldr	w0, [sp, #4]
   e0ad8:	6b00003f 	cmp	w1, w0
   e0adc:	54fffeab 	b.lt	e0ab0 <example2a+0x18>  // b.tstop
   e0ae0:	d503201f 	nop
   e0ae4:	d503201f 	nop
   e0ae8:	910083ff 	add	sp, sp, #0x20
   e0aec:	d65f03c0 	ret

00000000000e0af0 <example2b>:
   e0af0:	d10083ff 	sub	sp, sp, #0x20
   e0af4:	f90007e0 	str	x0, [sp, #8]
   e0af8:	b90007e1 	str	w1, [sp, #4]
   e0afc:	b90003e2 	str	w2, [sp]
   e0b00:	b9001fff 	str	wzr, [sp, #28]
   e0b04:	14000013 	b	e0b50 <example2b+0x60>
   e0b08:	f94007e0 	ldr	x0, [sp, #8]
   e0b0c:	b9801fe1 	ldrsw	x1, [sp, #28]
   e0b10:	91400c21 	add	x1, x1, #0x3, lsl #12
   e0b14:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e0b18:	f94007e0 	ldr	x0, [sp, #8]
   e0b1c:	b9801fe3 	ldrsw	x3, [sp, #28]
   e0b20:	d2870002 	mov	x2, #0x3800                	// #14336
   e0b24:	8b020062 	add	x2, x3, x2
   e0b28:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e0b2c:	0a000022 	and	w2, w1, w0
   e0b30:	f94007e0 	ldr	x0, [sp, #8]
   e0b34:	b9801fe3 	ldrsw	x3, [sp, #28]
   e0b38:	d2850001 	mov	x1, #0x2800                	// #10240
   e0b3c:	8b010061 	add	x1, x3, x1
   e0b40:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0b44:	b9401fe0 	ldr	w0, [sp, #28]
   e0b48:	11000400 	add	w0, w0, #0x1
   e0b4c:	b9001fe0 	str	w0, [sp, #28]
   e0b50:	b94007e0 	ldr	w0, [sp, #4]
   e0b54:	51000401 	sub	w1, w0, #0x1
   e0b58:	b90007e1 	str	w1, [sp, #4]
   e0b5c:	7100001f 	cmp	w0, #0x0
   e0b60:	54fffd41 	b.ne	e0b08 <example2b+0x18>  // b.any
   e0b64:	d503201f 	nop
   e0b68:	d503201f 	nop
   e0b6c:	910083ff 	add	sp, sp, #0x20
   e0b70:	d65f03c0 	ret

00000000000e0b74 <example3>:
   e0b74:	d10083ff 	sub	sp, sp, #0x20
   e0b78:	f9000fe0 	str	x0, [sp, #24]
   e0b7c:	b90017e1 	str	w1, [sp, #20]
   e0b80:	f90007e2 	str	x2, [sp, #8]
   e0b84:	f90003e3 	str	x3, [sp]
   e0b88:	14000009 	b	e0bac <example3+0x38>
   e0b8c:	f94003e1 	ldr	x1, [sp]
   e0b90:	91001020 	add	x0, x1, #0x4
   e0b94:	f90003e0 	str	x0, [sp]
   e0b98:	f94007e0 	ldr	x0, [sp, #8]
   e0b9c:	91001002 	add	x2, x0, #0x4
   e0ba0:	f90007e2 	str	x2, [sp, #8]
   e0ba4:	b9400021 	ldr	w1, [x1]
   e0ba8:	b9000001 	str	w1, [x0]
   e0bac:	b94017e0 	ldr	w0, [sp, #20]
   e0bb0:	51000401 	sub	w1, w0, #0x1
   e0bb4:	b90017e1 	str	w1, [sp, #20]
   e0bb8:	7100001f 	cmp	w0, #0x0
   e0bbc:	54fffe81 	b.ne	e0b8c <example3+0x18>  // b.any
   e0bc0:	d503201f 	nop
   e0bc4:	d503201f 	nop
   e0bc8:	910083ff 	add	sp, sp, #0x20
   e0bcc:	d65f03c0 	ret

00000000000e0bd0 <example4a>:
   e0bd0:	d10083ff 	sub	sp, sp, #0x20
   e0bd4:	f9000fe0 	str	x0, [sp, #24]
   e0bd8:	b90017e1 	str	w1, [sp, #20]
   e0bdc:	f90007e2 	str	x2, [sp, #8]
   e0be0:	f90003e3 	str	x3, [sp]
   e0be4:	1400000a 	b	e0c0c <example4a+0x3c>
   e0be8:	f94003e0 	ldr	x0, [sp]
   e0bec:	91001001 	add	x1, x0, #0x4
   e0bf0:	f90003e1 	str	x1, [sp]
   e0bf4:	b9400001 	ldr	w1, [x0]
   e0bf8:	f94007e0 	ldr	x0, [sp, #8]
   e0bfc:	91001002 	add	x2, x0, #0x4
   e0c00:	f90007e2 	str	x2, [sp, #8]
   e0c04:	11001421 	add	w1, w1, #0x5
   e0c08:	b9000001 	str	w1, [x0]
   e0c0c:	b94017e0 	ldr	w0, [sp, #20]
   e0c10:	51000401 	sub	w1, w0, #0x1
   e0c14:	b90017e1 	str	w1, [sp, #20]
   e0c18:	7100001f 	cmp	w0, #0x0
   e0c1c:	54fffe61 	b.ne	e0be8 <example4a+0x18>  // b.any
   e0c20:	d503201f 	nop
   e0c24:	d503201f 	nop
   e0c28:	910083ff 	add	sp, sp, #0x20
   e0c2c:	d65f03c0 	ret

00000000000e0c30 <example4b>:
   e0c30:	d100c3ff 	sub	sp, sp, #0x30
   e0c34:	f9000fe0 	str	x0, [sp, #24]
   e0c38:	b90017e1 	str	w1, [sp, #20]
   e0c3c:	f90007e2 	str	x2, [sp, #8]
   e0c40:	f90003e3 	str	x3, [sp]
   e0c44:	b9002fff 	str	wzr, [sp, #44]
   e0c48:	14000017 	b	e0ca4 <example4b+0x74>
   e0c4c:	b9402fe0 	ldr	w0, [sp, #44]
   e0c50:	11000401 	add	w1, w0, #0x1
   e0c54:	f9400fe0 	ldr	x0, [sp, #24]
   e0c58:	93407c21 	sxtw	x1, w1
   e0c5c:	91400c21 	add	x1, x1, #0x3, lsl #12
   e0c60:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e0c64:	b9402fe0 	ldr	w0, [sp, #44]
   e0c68:	11000c02 	add	w2, w0, #0x3
   e0c6c:	f9400fe0 	ldr	x0, [sp, #24]
   e0c70:	93407c43 	sxtw	x3, w2
   e0c74:	d2870002 	mov	x2, #0x3800                	// #14336
   e0c78:	8b020062 	add	x2, x3, x2
   e0c7c:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e0c80:	0b000022 	add	w2, w1, w0
   e0c84:	f9400fe0 	ldr	x0, [sp, #24]
   e0c88:	b9802fe3 	ldrsw	x3, [sp, #44]
   e0c8c:	d2850001 	mov	x1, #0x2800                	// #10240
   e0c90:	8b010061 	add	x1, x3, x1
   e0c94:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0c98:	b9402fe0 	ldr	w0, [sp, #44]
   e0c9c:	11000400 	add	w0, w0, #0x1
   e0ca0:	b9002fe0 	str	w0, [sp, #44]
   e0ca4:	b9402fe1 	ldr	w1, [sp, #44]
   e0ca8:	b94017e0 	ldr	w0, [sp, #20]
   e0cac:	6b00003f 	cmp	w1, w0
   e0cb0:	54fffceb 	b.lt	e0c4c <example4b+0x1c>  // b.tstop
   e0cb4:	d503201f 	nop
   e0cb8:	d503201f 	nop
   e0cbc:	9100c3ff 	add	sp, sp, #0x30
   e0cc0:	d65f03c0 	ret

00000000000e0cc4 <example4c>:
   e0cc4:	d100c3ff 	sub	sp, sp, #0x30
   e0cc8:	f9000fe0 	str	x0, [sp, #24]
   e0ccc:	b90017e1 	str	w1, [sp, #20]
   e0cd0:	f90007e2 	str	x2, [sp, #8]
   e0cd4:	f90003e3 	str	x3, [sp]
   e0cd8:	52800080 	mov	w0, #0x4                   	// #4
   e0cdc:	b9002be0 	str	w0, [sp, #40]
   e0ce0:	b9002fff 	str	wzr, [sp, #44]
   e0ce4:	14000015 	b	e0d38 <example4c+0x74>
   e0ce8:	f9400fe0 	ldr	x0, [sp, #24]
   e0cec:	b9802fe2 	ldrsw	x2, [sp, #44]
   e0cf0:	d2850001 	mov	x1, #0x2800                	// #10240
   e0cf4:	8b010041 	add	x1, x2, x1
   e0cf8:	b8617800 	ldr	w0, [x0, x1, lsl #2]
   e0cfc:	b90027e0 	str	w0, [sp, #36]
   e0d00:	b94027e1 	ldr	w1, [sp, #36]
   e0d04:	b9402be0 	ldr	w0, [sp, #40]
   e0d08:	6b00003f 	cmp	w1, w0
   e0d0c:	5400006d 	b.le	e0d18 <example4c+0x54>
   e0d10:	b9402be0 	ldr	w0, [sp, #40]
   e0d14:	14000002 	b	e0d1c <example4c+0x58>
   e0d18:	52800000 	mov	w0, #0x0                   	// #0
   e0d1c:	f9400fe1 	ldr	x1, [sp, #24]
   e0d20:	b9802fe2 	ldrsw	x2, [sp, #44]
   e0d24:	91400c42 	add	x2, x2, #0x3, lsl #12
   e0d28:	b8227820 	str	w0, [x1, x2, lsl #2]
   e0d2c:	b9402fe0 	ldr	w0, [sp, #44]
   e0d30:	11000400 	add	w0, w0, #0x1
   e0d34:	b9002fe0 	str	w0, [sp, #44]
   e0d38:	b9402fe1 	ldr	w1, [sp, #44]
   e0d3c:	b94017e0 	ldr	w0, [sp, #20]
   e0d40:	6b00003f 	cmp	w1, w0
   e0d44:	54fffd2b 	b.lt	e0ce8 <example4c+0x24>  // b.tstop
   e0d48:	d503201f 	nop
   e0d4c:	d503201f 	nop
   e0d50:	9100c3ff 	add	sp, sp, #0x30
   e0d54:	d65f03c0 	ret

00000000000e0d58 <example5>:
   e0d58:	d100c3ff 	sub	sp, sp, #0x30
   e0d5c:	f9000fe0 	str	x0, [sp, #24]
   e0d60:	b90017e1 	str	w1, [sp, #20]
   e0d64:	f90007e2 	str	x2, [sp, #8]
   e0d68:	b9002fff 	str	wzr, [sp, #44]
   e0d6c:	1400000a 	b	e0d94 <example5+0x3c>
   e0d70:	f9400fe0 	ldr	x0, [sp, #24]
   e0d74:	b9802fe2 	ldrsw	x2, [sp, #44]
   e0d78:	d2848001 	mov	x1, #0x2400                	// #9216
   e0d7c:	8b010041 	add	x1, x2, x1
   e0d80:	528000a2 	mov	w2, #0x5                   	// #5
   e0d84:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0d88:	b9402fe0 	ldr	w0, [sp, #44]
   e0d8c:	11000400 	add	w0, w0, #0x1
   e0d90:	b9002fe0 	str	w0, [sp, #44]
   e0d94:	b9402fe1 	ldr	w1, [sp, #44]
   e0d98:	b94017e0 	ldr	w0, [sp, #20]
   e0d9c:	6b00003f 	cmp	w1, w0
   e0da0:	54fffe8b 	b.lt	e0d70 <example5+0x18>  // b.tstop
   e0da4:	d503201f 	nop
   e0da8:	d503201f 	nop
   e0dac:	9100c3ff 	add	sp, sp, #0x30
   e0db0:	d65f03c0 	ret

00000000000e0db4 <example7>:
   e0db4:	d10083ff 	sub	sp, sp, #0x20
   e0db8:	f90007e0 	str	x0, [sp, #8]
   e0dbc:	b90007e1 	str	w1, [sp, #4]
   e0dc0:	b9001fff 	str	wzr, [sp, #28]
   e0dc4:	14000010 	b	e0e04 <example7+0x50>
   e0dc8:	b9401fe1 	ldr	w1, [sp, #28]
   e0dcc:	b94007e0 	ldr	w0, [sp, #4]
   e0dd0:	0b000021 	add	w1, w1, w0
   e0dd4:	f94007e0 	ldr	x0, [sp, #8]
   e0dd8:	93407c21 	sxtw	x1, w1
   e0ddc:	91400c21 	add	x1, x1, #0x3, lsl #12
   e0de0:	b8617802 	ldr	w2, [x0, x1, lsl #2]
   e0de4:	f94007e0 	ldr	x0, [sp, #8]
   e0de8:	b9801fe3 	ldrsw	x3, [sp, #28]
   e0dec:	d2850001 	mov	x1, #0x2800                	// #10240
   e0df0:	8b010061 	add	x1, x3, x1
   e0df4:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0df8:	b9401fe0 	ldr	w0, [sp, #28]
   e0dfc:	11000400 	add	w0, w0, #0x1
   e0e00:	b9001fe0 	str	w0, [sp, #28]
   e0e04:	b9401fe0 	ldr	w0, [sp, #28]
   e0e08:	710ffc1f 	cmp	w0, #0x3ff
   e0e0c:	54fffded 	b.le	e0dc8 <example7+0x14>
   e0e10:	d503201f 	nop
   e0e14:	d503201f 	nop
   e0e18:	910083ff 	add	sp, sp, #0x20
   e0e1c:	d65f03c0 	ret

00000000000e0e20 <example8>:
   e0e20:	d10083ff 	sub	sp, sp, #0x20
   e0e24:	f90007e0 	str	x0, [sp, #8]
   e0e28:	b90007e1 	str	w1, [sp, #4]
   e0e2c:	b9001fff 	str	wzr, [sp, #28]
   e0e30:	14000015 	b	e0e84 <example8+0x64>
   e0e34:	b9001bff 	str	wzr, [sp, #24]
   e0e38:	1400000d 	b	e0e6c <example8+0x4c>
   e0e3c:	f94007e0 	ldr	x0, [sp, #8]
   e0e40:	b9801be1 	ldrsw	x1, [sp, #24]
   e0e44:	b9801fe2 	ldrsw	x2, [sp, #28]
   e0e48:	d376d442 	lsl	x2, x2, #10
   e0e4c:	8b010042 	add	x2, x2, x1
   e0e50:	d2890001 	mov	x1, #0x4800                	// #18432
   e0e54:	8b010041 	add	x1, x2, x1
   e0e58:	b94007e2 	ldr	w2, [sp, #4]
   e0e5c:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0e60:	b9401be0 	ldr	w0, [sp, #24]
   e0e64:	11000400 	add	w0, w0, #0x1
   e0e68:	b9001be0 	str	w0, [sp, #24]
   e0e6c:	b9401be0 	ldr	w0, [sp, #24]
   e0e70:	710ffc1f 	cmp	w0, #0x3ff
   e0e74:	54fffe4d 	b.le	e0e3c <example8+0x1c>
   e0e78:	b9401fe0 	ldr	w0, [sp, #28]
   e0e7c:	11000400 	add	w0, w0, #0x1
   e0e80:	b9001fe0 	str	w0, [sp, #28]
   e0e84:	b9401fe0 	ldr	w0, [sp, #28]
   e0e88:	71007c1f 	cmp	w0, #0x1f
   e0e8c:	54fffd4d 	b.le	e0e34 <example8+0x14>
   e0e90:	d503201f 	nop
   e0e94:	d503201f 	nop
   e0e98:	910083ff 	add	sp, sp, #0x20
   e0e9c:	d65f03c0 	ret

00000000000e0ea0 <example9>:
   e0ea0:	d10083ff 	sub	sp, sp, #0x20
   e0ea4:	f90007e0 	str	x0, [sp, #8]
   e0ea8:	f90003e1 	str	x1, [sp]
   e0eac:	b9001bff 	str	wzr, [sp, #24]
   e0eb0:	b9001fff 	str	wzr, [sp, #28]
   e0eb4:	14000012 	b	e0efc <example9+0x5c>
   e0eb8:	f94007e0 	ldr	x0, [sp, #8]
   e0ebc:	b9801fe2 	ldrsw	x2, [sp, #28]
   e0ec0:	d2830001 	mov	x1, #0x1800                	// #6144
   e0ec4:	8b010041 	add	x1, x2, x1
   e0ec8:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e0ecc:	f94007e0 	ldr	x0, [sp, #8]
   e0ed0:	b9801fe3 	ldrsw	x3, [sp, #28]
   e0ed4:	d2838002 	mov	x2, #0x1c00                	// #7168
   e0ed8:	8b020062 	add	x2, x3, x2
   e0edc:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e0ee0:	4b000020 	sub	w0, w1, w0
   e0ee4:	b9401be1 	ldr	w1, [sp, #24]
   e0ee8:	0b000020 	add	w0, w1, w0
   e0eec:	b9001be0 	str	w0, [sp, #24]
   e0ef0:	b9401fe0 	ldr	w0, [sp, #28]
   e0ef4:	11000400 	add	w0, w0, #0x1
   e0ef8:	b9001fe0 	str	w0, [sp, #28]
   e0efc:	b9401fe0 	ldr	w0, [sp, #28]
   e0f00:	710ffc1f 	cmp	w0, #0x3ff
   e0f04:	54fffdad 	b.le	e0eb8 <example9+0x18>
   e0f08:	f94003e0 	ldr	x0, [sp]
   e0f0c:	b9401be1 	ldr	w1, [sp, #24]
   e0f10:	b9000001 	str	w1, [x0]
   e0f14:	d503201f 	nop
   e0f18:	910083ff 	add	sp, sp, #0x20
   e0f1c:	d65f03c0 	ret

00000000000e0f20 <example10a>:
   e0f20:	d10143ff 	sub	sp, sp, #0x50
   e0f24:	f9001fe0 	str	x0, [sp, #56]
   e0f28:	f9001be1 	str	x1, [sp, #48]
   e0f2c:	f90017e2 	str	x2, [sp, #40]
   e0f30:	f90013e3 	str	x3, [sp, #32]
   e0f34:	f9000fe4 	str	x4, [sp, #24]
   e0f38:	f9000be5 	str	x5, [sp, #16]
   e0f3c:	f90007e6 	str	x6, [sp, #8]
   e0f40:	b9004fff 	str	wzr, [sp, #76]
   e0f44:	14000023 	b	e0fd0 <example10a+0xb0>
   e0f48:	f9401fe0 	ldr	x0, [sp, #56]
   e0f4c:	b9804fe1 	ldrsw	x1, [sp, #76]
   e0f50:	91400421 	add	x1, x1, #0x1, lsl #12
   e0f54:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e0f58:	f9401fe0 	ldr	x0, [sp, #56]
   e0f5c:	b9804fe3 	ldrsw	x3, [sp, #76]
   e0f60:	d2828002 	mov	x2, #0x1400                	// #5120
   e0f64:	8b020062 	add	x2, x3, x2
   e0f68:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e0f6c:	0b000022 	add	w2, w1, w0
   e0f70:	f9401fe0 	ldr	x0, [sp, #56]
   e0f74:	b9804fe1 	ldrsw	x1, [sp, #76]
   e0f78:	91300021 	add	x1, x1, #0xc00
   e0f7c:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0f80:	f9401fe0 	ldr	x0, [sp, #56]
   e0f84:	b9804fe1 	ldrsw	x1, [sp, #76]
   e0f88:	91200021 	add	x1, x1, #0x800
   e0f8c:	78e17800 	ldrsh	w0, [x0, x1, lsl #1]
   e0f90:	12003c01 	and	w1, w0, #0xffff
   e0f94:	f9401fe0 	ldr	x0, [sp, #56]
   e0f98:	b9804fe2 	ldrsw	x2, [sp, #76]
   e0f9c:	91300042 	add	x2, x2, #0xc00
   e0fa0:	78e27800 	ldrsh	w0, [x0, x2, lsl #1]
   e0fa4:	12003c00 	and	w0, w0, #0xffff
   e0fa8:	0b000020 	add	w0, w1, w0
   e0fac:	12003c00 	and	w0, w0, #0xffff
   e0fb0:	13003c02 	sxth	w2, w0
   e0fb4:	f9401fe0 	ldr	x0, [sp, #56]
   e0fb8:	b9804fe1 	ldrsw	x1, [sp, #76]
   e0fbc:	91100021 	add	x1, x1, #0x400
   e0fc0:	78217802 	strh	w2, [x0, x1, lsl #1]
   e0fc4:	b9404fe0 	ldr	w0, [sp, #76]
   e0fc8:	11000400 	add	w0, w0, #0x1
   e0fcc:	b9004fe0 	str	w0, [sp, #76]
   e0fd0:	b9404fe0 	ldr	w0, [sp, #76]
   e0fd4:	710ffc1f 	cmp	w0, #0x3ff
   e0fd8:	54fffb8d 	b.le	e0f48 <example10a+0x28>
   e0fdc:	d503201f 	nop
   e0fe0:	d503201f 	nop
   e0fe4:	910143ff 	add	sp, sp, #0x50
   e0fe8:	d65f03c0 	ret

00000000000e0fec <example10b>:
   e0fec:	d10143ff 	sub	sp, sp, #0x50
   e0ff0:	f9001fe0 	str	x0, [sp, #56]
   e0ff4:	f9001be1 	str	x1, [sp, #48]
   e0ff8:	f90017e2 	str	x2, [sp, #40]
   e0ffc:	f90013e3 	str	x3, [sp, #32]
   e1000:	f9000fe4 	str	x4, [sp, #24]
   e1004:	f9000be5 	str	x5, [sp, #16]
   e1008:	f90007e6 	str	x6, [sp, #8]
   e100c:	b9004fff 	str	wzr, [sp, #76]
   e1010:	1400000d 	b	e1044 <example10b+0x58>
   e1014:	f9401fe0 	ldr	x0, [sp, #56]
   e1018:	b9804fe1 	ldrsw	x1, [sp, #76]
   e101c:	91200021 	add	x1, x1, #0x800
   e1020:	78e17800 	ldrsh	w0, [x0, x1, lsl #1]
   e1024:	2a0003e2 	mov	w2, w0
   e1028:	f9401fe0 	ldr	x0, [sp, #56]
   e102c:	b9804fe1 	ldrsw	x1, [sp, #76]
   e1030:	91300021 	add	x1, x1, #0xc00
   e1034:	b8217802 	str	w2, [x0, x1, lsl #2]
   e1038:	b9404fe0 	ldr	w0, [sp, #76]
   e103c:	11000400 	add	w0, w0, #0x1
   e1040:	b9004fe0 	str	w0, [sp, #76]
   e1044:	b9404fe0 	ldr	w0, [sp, #76]
   e1048:	710ffc1f 	cmp	w0, #0x3ff
   e104c:	54fffe4d 	b.le	e1014 <example10b+0x28>
   e1050:	d503201f 	nop
   e1054:	d503201f 	nop
   e1058:	910143ff 	add	sp, sp, #0x50
   e105c:	d65f03c0 	ret

00000000000e1060 <example11>:
   e1060:	d10083ff 	sub	sp, sp, #0x20
   e1064:	f90007e0 	str	x0, [sp, #8]
   e1068:	b9001fff 	str	wzr, [sp, #28]
   e106c:	1400004b 	b	e1198 <example11+0x138>
   e1070:	b9401fe0 	ldr	w0, [sp, #28]
   e1074:	531f7800 	lsl	w0, w0, #1
   e1078:	11000401 	add	w1, w0, #0x1
   e107c:	f94007e0 	ldr	x0, [sp, #8]
   e1080:	93407c21 	sxtw	x1, w1
   e1084:	91400c21 	add	x1, x1, #0x3, lsl #12
   e1088:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e108c:	b9401fe0 	ldr	w0, [sp, #28]
   e1090:	531f7800 	lsl	w0, w0, #1
   e1094:	11000402 	add	w2, w0, #0x1
   e1098:	f94007e0 	ldr	x0, [sp, #8]
   e109c:	93407c43 	sxtw	x3, w2
   e10a0:	d2870002 	mov	x2, #0x3800                	// #14336
   e10a4:	8b020062 	add	x2, x3, x2
   e10a8:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e10ac:	1b007c21 	mul	w1, w1, w0
   e10b0:	b9401fe0 	ldr	w0, [sp, #28]
   e10b4:	531f7802 	lsl	w2, w0, #1
   e10b8:	f94007e0 	ldr	x0, [sp, #8]
   e10bc:	93407c42 	sxtw	x2, w2
   e10c0:	91400c42 	add	x2, x2, #0x3, lsl #12
   e10c4:	b8627802 	ldr	w2, [x0, x2, lsl #2]
   e10c8:	b9401fe0 	ldr	w0, [sp, #28]
   e10cc:	531f7803 	lsl	w3, w0, #1
   e10d0:	f94007e0 	ldr	x0, [sp, #8]
   e10d4:	93407c64 	sxtw	x4, w3
   e10d8:	d2870003 	mov	x3, #0x3800                	// #14336
   e10dc:	8b030083 	add	x3, x4, x3
   e10e0:	b8637800 	ldr	w0, [x0, x3, lsl #2]
   e10e4:	1b007c40 	mul	w0, w2, w0
   e10e8:	4b000022 	sub	w2, w1, w0
   e10ec:	f94007e0 	ldr	x0, [sp, #8]
   e10f0:	b9801fe3 	ldrsw	x3, [sp, #28]
   e10f4:	d2850001 	mov	x1, #0x2800                	// #10240
   e10f8:	8b010061 	add	x1, x3, x1
   e10fc:	b8217802 	str	w2, [x0, x1, lsl #2]
   e1100:	b9401fe0 	ldr	w0, [sp, #28]
   e1104:	531f7801 	lsl	w1, w0, #1
   e1108:	f94007e0 	ldr	x0, [sp, #8]
   e110c:	93407c21 	sxtw	x1, w1
   e1110:	91400c21 	add	x1, x1, #0x3, lsl #12
   e1114:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e1118:	b9401fe0 	ldr	w0, [sp, #28]
   e111c:	531f7800 	lsl	w0, w0, #1
   e1120:	11000402 	add	w2, w0, #0x1
   e1124:	f94007e0 	ldr	x0, [sp, #8]
   e1128:	93407c43 	sxtw	x3, w2
   e112c:	d2870002 	mov	x2, #0x3800                	// #14336
   e1130:	8b020062 	add	x2, x3, x2
   e1134:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e1138:	1b007c21 	mul	w1, w1, w0
   e113c:	b9401fe0 	ldr	w0, [sp, #28]
   e1140:	531f7800 	lsl	w0, w0, #1
   e1144:	11000402 	add	w2, w0, #0x1
   e1148:	f94007e0 	ldr	x0, [sp, #8]
   e114c:	93407c42 	sxtw	x2, w2
   e1150:	91400c42 	add	x2, x2, #0x3, lsl #12
   e1154:	b8627802 	ldr	w2, [x0, x2, lsl #2]
   e1158:	b9401fe0 	ldr	w0, [sp, #28]
   e115c:	531f7803 	lsl	w3, w0, #1
   e1160:	f94007e0 	ldr	x0, [sp, #8]
   e1164:	93407c64 	sxtw	x4, w3
   e1168:	d2870003 	mov	x3, #0x3800                	// #14336
   e116c:	8b030083 	add	x3, x4, x3
   e1170:	b8637800 	ldr	w0, [x0, x3, lsl #2]
   e1174:	1b007c40 	mul	w0, w2, w0
   e1178:	0b000022 	add	w2, w1, w0
   e117c:	f94007e0 	ldr	x0, [sp, #8]
   e1180:	b9801fe1 	ldrsw	x1, [sp, #28]
   e1184:	91401021 	add	x1, x1, #0x4, lsl #12
   e1188:	b8217802 	str	w2, [x0, x1, lsl #2]
   e118c:	b9401fe0 	ldr	w0, [sp, #28]
   e1190:	11000400 	add	w0, w0, #0x1
   e1194:	b9001fe0 	str	w0, [sp, #28]
   e1198:	b9401fe0 	ldr	w0, [sp, #28]
   e119c:	7107fc1f 	cmp	w0, #0x1ff
   e11a0:	54fff68d 	b.le	e1070 <example11+0x10>
   e11a4:	d503201f 	nop
   e11a8:	d503201f 	nop
   e11ac:	910083ff 	add	sp, sp, #0x20
   e11b0:	d65f03c0 	ret

00000000000e11b4 <example12>:
   e11b4:	d10083ff 	sub	sp, sp, #0x20
   e11b8:	f90007e0 	str	x0, [sp, #8]
   e11bc:	b9001fff 	str	wzr, [sp, #28]
   e11c0:	1400000a 	b	e11e8 <example12+0x34>
   e11c4:	f94007e0 	ldr	x0, [sp, #8]
   e11c8:	b9801fe2 	ldrsw	x2, [sp, #28]
   e11cc:	d2850001 	mov	x1, #0x2800                	// #10240
   e11d0:	8b010041 	add	x1, x2, x1
   e11d4:	b9401fe2 	ldr	w2, [sp, #28]
   e11d8:	b8217802 	str	w2, [x0, x1, lsl #2]
   e11dc:	b9401fe0 	ldr	w0, [sp, #28]
   e11e0:	11000400 	add	w0, w0, #0x1
   e11e4:	b9001fe0 	str	w0, [sp, #28]
   e11e8:	b9401fe0 	ldr	w0, [sp, #28]
   e11ec:	710ffc1f 	cmp	w0, #0x3ff
   e11f0:	54fffead 	b.le	e11c4 <example12+0x10>
   e11f4:	d503201f 	nop
   e11f8:	d503201f 	nop
   e11fc:	910083ff 	add	sp, sp, #0x20
   e1200:	d65f03c0 	ret

00000000000e1204 <example13>:
   e1204:	d100c3ff 	sub	sp, sp, #0x30
   e1208:	f9000fe0 	str	x0, [sp, #24]
   e120c:	f9000be1 	str	x1, [sp, #16]
   e1210:	f90007e2 	str	x2, [sp, #8]
   e1214:	f90003e3 	str	x3, [sp]
   e1218:	b9002fff 	str	wzr, [sp, #44]
   e121c:	14000029 	b	e12c0 <example13+0xbc>
   e1220:	b90027ff 	str	wzr, [sp, #36]
   e1224:	b9002bff 	str	wzr, [sp, #40]
   e1228:	1400001a 	b	e1290 <example13+0x8c>
   e122c:	b9802fe0 	ldrsw	x0, [sp, #44]
   e1230:	d37df000 	lsl	x0, x0, #3
   e1234:	f9400be1 	ldr	x1, [sp, #16]
   e1238:	8b000020 	add	x0, x1, x0
   e123c:	f9400001 	ldr	x1, [x0]
   e1240:	b9802be0 	ldrsw	x0, [sp, #40]
   e1244:	d37ef400 	lsl	x0, x0, #2
   e1248:	8b000020 	add	x0, x1, x0
   e124c:	b9400001 	ldr	w1, [x0]
   e1250:	b9802fe0 	ldrsw	x0, [sp, #44]
   e1254:	d37df000 	lsl	x0, x0, #3
   e1258:	f94007e2 	ldr	x2, [sp, #8]
   e125c:	8b000040 	add	x0, x2, x0
   e1260:	f9400002 	ldr	x2, [x0]
   e1264:	b9802be0 	ldrsw	x0, [sp, #40]
   e1268:	d37ef400 	lsl	x0, x0, #2
   e126c:	8b000040 	add	x0, x2, x0
   e1270:	b9400000 	ldr	w0, [x0]
   e1274:	4b000020 	sub	w0, w1, w0
   e1278:	b94027e1 	ldr	w1, [sp, #36]
   e127c:	0b000020 	add	w0, w1, w0
   e1280:	b90027e0 	str	w0, [sp, #36]
   e1284:	b9402be0 	ldr	w0, [sp, #40]
   e1288:	11002000 	add	w0, w0, #0x8
   e128c:	b9002be0 	str	w0, [sp, #40]
   e1290:	b9402be0 	ldr	w0, [sp, #40]
   e1294:	710ffc1f 	cmp	w0, #0x3ff
   e1298:	54fffcad 	b.le	e122c <example13+0x28>
   e129c:	b9802fe0 	ldrsw	x0, [sp, #44]
   e12a0:	d37ef400 	lsl	x0, x0, #2
   e12a4:	f94003e1 	ldr	x1, [sp]
   e12a8:	8b000020 	add	x0, x1, x0
   e12ac:	b94027e1 	ldr	w1, [sp, #36]
   e12b0:	b9000001 	str	w1, [x0]
   e12b4:	b9402fe0 	ldr	w0, [sp, #44]
   e12b8:	11000400 	add	w0, w0, #0x1
   e12bc:	b9002fe0 	str	w0, [sp, #44]
   e12c0:	b9402fe0 	ldr	w0, [sp, #44]
   e12c4:	71007c1f 	cmp	w0, #0x1f
   e12c8:	54fffacd 	b.le	e1220 <example13+0x1c>
   e12cc:	d503201f 	nop
   e12d0:	d503201f 	nop
   e12d4:	9100c3ff 	add	sp, sp, #0x30
   e12d8:	d65f03c0 	ret

00000000000e12dc <example14>:
   e12dc:	d100c3ff 	sub	sp, sp, #0x30
   e12e0:	f9000fe0 	str	x0, [sp, #24]
   e12e4:	f9000be1 	str	x1, [sp, #16]
   e12e8:	f90007e2 	str	x2, [sp, #8]
   e12ec:	f90003e3 	str	x3, [sp]
   e12f0:	b90027ff 	str	wzr, [sp, #36]
   e12f4:	b9002fff 	str	wzr, [sp, #44]
   e12f8:	14000034 	b	e13c8 <example14+0xec>
   e12fc:	b90023ff 	str	wzr, [sp, #32]
   e1300:	b9002bff 	str	wzr, [sp, #40]
   e1304:	14000025 	b	e1398 <example14+0xbc>
   e1308:	b90027ff 	str	wzr, [sp, #36]
   e130c:	1400001d 	b	e1380 <example14+0xa4>
   e1310:	b94027e1 	ldr	w1, [sp, #36]
   e1314:	b9402fe0 	ldr	w0, [sp, #44]
   e1318:	0b000020 	add	w0, w1, w0
   e131c:	93407c00 	sxtw	x0, w0
   e1320:	d37df000 	lsl	x0, x0, #3
   e1324:	f9400be1 	ldr	x1, [sp, #16]
   e1328:	8b000020 	add	x0, x1, x0
   e132c:	f9400001 	ldr	x1, [x0]
   e1330:	b9802be0 	ldrsw	x0, [sp, #40]
   e1334:	d37ef400 	lsl	x0, x0, #2
   e1338:	8b000020 	add	x0, x1, x0
   e133c:	b9400001 	ldr	w1, [x0]
   e1340:	b98027e0 	ldrsw	x0, [sp, #36]
   e1344:	d37df000 	lsl	x0, x0, #3
   e1348:	f94007e2 	ldr	x2, [sp, #8]
   e134c:	8b000040 	add	x0, x2, x0
   e1350:	f9400002 	ldr	x2, [x0]
   e1354:	b9802be0 	ldrsw	x0, [sp, #40]
   e1358:	d37ef400 	lsl	x0, x0, #2
   e135c:	8b000040 	add	x0, x2, x0
   e1360:	b9400000 	ldr	w0, [x0]
   e1364:	1b007c20 	mul	w0, w1, w0
   e1368:	b94023e1 	ldr	w1, [sp, #32]
   e136c:	0b000020 	add	w0, w1, w0
   e1370:	b90023e0 	str	w0, [sp, #32]
   e1374:	b94027e0 	ldr	w0, [sp, #36]
   e1378:	11000400 	add	w0, w0, #0x1
   e137c:	b90027e0 	str	w0, [sp, #36]
   e1380:	b94027e0 	ldr	w0, [sp, #36]
   e1384:	710ffc1f 	cmp	w0, #0x3ff
   e1388:	54fffc4d 	b.le	e1310 <example14+0x34>
   e138c:	b9402be0 	ldr	w0, [sp, #40]
   e1390:	11000400 	add	w0, w0, #0x1
   e1394:	b9002be0 	str	w0, [sp, #40]
   e1398:	b9402be0 	ldr	w0, [sp, #40]
   e139c:	71007c1f 	cmp	w0, #0x1f
   e13a0:	54fffb4d 	b.le	e1308 <example14+0x2c>
   e13a4:	b9802fe0 	ldrsw	x0, [sp, #44]
   e13a8:	d37ef400 	lsl	x0, x0, #2
   e13ac:	f94003e1 	ldr	x1, [sp]
   e13b0:	8b000020 	add	x0, x1, x0
   e13b4:	b94023e1 	ldr	w1, [sp, #32]
   e13b8:	b9000001 	str	w1, [x0]
   e13bc:	b9402fe0 	ldr	w0, [sp, #44]
   e13c0:	11000400 	add	w0, w0, #0x1
   e13c4:	b9002fe0 	str	w0, [sp, #44]
   e13c8:	b9402fe0 	ldr	w0, [sp, #44]
   e13cc:	71000c1f 	cmp	w0, #0x3
   e13d0:	54fff96d 	b.le	e12fc <example14+0x20>
   e13d4:	d503201f 	nop
   e13d8:	d503201f 	nop
   e13dc:	9100c3ff 	add	sp, sp, #0x30
   e13e0:	d65f03c0 	ret

00000000000e13e4 <example23>:
   e13e4:	d100c3ff 	sub	sp, sp, #0x30
   e13e8:	f9000fe0 	str	x0, [sp, #24]
   e13ec:	f9000be1 	str	x1, [sp, #16]
   e13f0:	f90007e2 	str	x2, [sp, #8]
   e13f4:	b9002fff 	str	wzr, [sp, #44]
   e13f8:	1400000e 	b	e1430 <example23+0x4c>
   e13fc:	f9400be0 	ldr	x0, [sp, #16]
   e1400:	91000801 	add	x1, x0, #0x2
   e1404:	f9000be1 	str	x1, [sp, #16]
   e1408:	79400000 	ldrh	w0, [x0]
   e140c:	2a0003e2 	mov	w2, w0
   e1410:	f94007e0 	ldr	x0, [sp, #8]
   e1414:	91001001 	add	x1, x0, #0x4
   e1418:	f90007e1 	str	x1, [sp, #8]
   e141c:	53196041 	lsl	w1, w2, #7
   e1420:	b9000001 	str	w1, [x0]
   e1424:	b9402fe0 	ldr	w0, [sp, #44]
   e1428:	11000400 	add	w0, w0, #0x1
   e142c:	b9002fe0 	str	w0, [sp, #44]
   e1430:	b9402fe0 	ldr	w0, [sp, #44]
   e1434:	7103fc1f 	cmp	w0, #0xff
   e1438:	54fffe2d 	b.le	e13fc <example23+0x18>
   e143c:	d503201f 	nop
   e1440:	d503201f 	nop
   e1444:	9100c3ff 	add	sp, sp, #0x30
   e1448:	d65f03c0 	ret

00000000000e144c <init_memory>:
   e144c:	d10083ff 	sub	sp, sp, #0x20
   e1450:	f90007e0 	str	x0, [sp, #8]
   e1454:	f90003e1 	str	x1, [sp]
   e1458:	52800020 	mov	w0, #0x1                   	// #1
   e145c:	39007fe0 	strb	w0, [sp, #31]
   e1460:	14000013 	b	e14ac <init_memory+0x60>
   e1464:	39407fe1 	ldrb	w1, [sp, #31]
   e1468:	2a0103e0 	mov	w0, w1
   e146c:	531d1000 	ubfiz	w0, w0, #3, #5
   e1470:	4b010000 	sub	w0, w0, w1
   e1474:	39007fe0 	strb	w0, [sp, #31]
   e1478:	39407fe1 	ldrb	w1, [sp, #31]
   e147c:	528004e0 	mov	w0, #0x27                  	// #39
   e1480:	4a000020 	eor	w0, w1, w0
   e1484:	39007fe0 	strb	w0, [sp, #31]
   e1488:	39407fe0 	ldrb	w0, [sp, #31]
   e148c:	11000400 	add	w0, w0, #0x1
   e1490:	39007fe0 	strb	w0, [sp, #31]
   e1494:	f94007e0 	ldr	x0, [sp, #8]
   e1498:	39407fe1 	ldrb	w1, [sp, #31]
   e149c:	39000001 	strb	w1, [x0]
   e14a0:	f94007e0 	ldr	x0, [sp, #8]
   e14a4:	91000400 	add	x0, x0, #0x1
   e14a8:	f90007e0 	str	x0, [sp, #8]
   e14ac:	f94007e1 	ldr	x1, [sp, #8]
   e14b0:	f94003e0 	ldr	x0, [sp]
   e14b4:	eb00003f 	cmp	x1, x0
   e14b8:	54fffd61 	b.ne	e1464 <init_memory+0x18>  // b.any
   e14bc:	d503201f 	nop
   e14c0:	d503201f 	nop
   e14c4:	910083ff 	add	sp, sp, #0x20
   e14c8:	d65f03c0 	ret

00000000000e14cc <digest_memory>:
   e14cc:	d10083ff 	sub	sp, sp, #0x20
   e14d0:	f90007e0 	str	x0, [sp, #8]
   e14d4:	f90003e1 	str	x1, [sp]
   e14d8:	52800020 	mov	w0, #0x1                   	// #1
   e14dc:	b9001fe0 	str	w0, [sp, #28]
   e14e0:	14000015 	b	e1534 <digest_memory+0x68>
   e14e4:	b9401fe1 	ldr	w1, [sp, #28]
   e14e8:	2a0103e0 	mov	w0, w1
   e14ec:	531f7800 	lsl	w0, w0, #1
   e14f0:	0b010000 	add	w0, w0, w1
   e14f4:	b9001fe0 	str	w0, [sp, #28]
   e14f8:	f94007e0 	ldr	x0, [sp, #8]
   e14fc:	39400000 	ldrb	w0, [x0]
   e1500:	2a0003e1 	mov	w1, w0
   e1504:	b9401fe0 	ldr	w0, [sp, #28]
   e1508:	4a010000 	eor	w0, w0, w1
   e150c:	b9001fe0 	str	w0, [sp, #28]
   e1510:	b9401fe0 	ldr	w0, [sp, #28]
   e1514:	53087c01 	lsr	w1, w0, #8
   e1518:	b9401fe0 	ldr	w0, [sp, #28]
   e151c:	53185c00 	lsl	w0, w0, #8
   e1520:	4a000020 	eor	w0, w1, w0
   e1524:	b9001fe0 	str	w0, [sp, #28]
   e1528:	f94007e0 	ldr	x0, [sp, #8]
   e152c:	91000400 	add	x0, x0, #0x1
   e1530:	f90007e0 	str	x0, [sp, #8]
   e1534:	f94007e1 	ldr	x1, [sp, #8]
   e1538:	f94003e0 	ldr	x0, [sp]
   e153c:	eb00003f 	cmp	x1, x0
   e1540:	54fffd21 	b.ne	e14e4 <digest_memory+0x18>  // b.any
   e1544:	b9401fe0 	ldr	w0, [sp, #28]
   e1548:	910083ff 	add	sp, sp, #0x20
   e154c:	d65f03c0 	ret

00000000000e1550 <memcpy>:
   e1550:	d100c3ff 	sub	sp, sp, #0x30
   e1554:	f9000fe0 	str	x0, [sp, #24]
   e1558:	f9000be1 	str	x1, [sp, #16]
   e155c:	f90007e2 	str	x2, [sp, #8]
   e1560:	f90017ff 	str	xzr, [sp, #40]
   e1564:	1400000c 	b	e1594 <memcpy+0x44>
   e1568:	f9400be1 	ldr	x1, [sp, #16]
   e156c:	f94017e0 	ldr	x0, [sp, #40]
   e1570:	8b000021 	add	x1, x1, x0
   e1574:	f9400fe2 	ldr	x2, [sp, #24]
   e1578:	f94017e0 	ldr	x0, [sp, #40]
   e157c:	8b000040 	add	x0, x2, x0
   e1580:	39400021 	ldrb	w1, [x1]
   e1584:	39000001 	strb	w1, [x0]
   e1588:	f94017e0 	ldr	x0, [sp, #40]
   e158c:	91000400 	add	x0, x0, #0x1
   e1590:	f90017e0 	str	x0, [sp, #40]
   e1594:	f94017e1 	ldr	x1, [sp, #40]
   e1598:	f94007e0 	ldr	x0, [sp, #8]
   e159c:	eb00003f 	cmp	x1, x0
   e15a0:	54fffe41 	b.ne	e1568 <memcpy+0x18>  // b.any
   e15a4:	f9400fe0 	ldr	x0, [sp, #24]
   e15a8:	9100c3ff 	add	sp, sp, #0x30
   e15ac:	d65f03c0 	ret

00000000000e15b0 <memset>:
   e15b0:	d100c3ff 	sub	sp, sp, #0x30
   e15b4:	f9000fe0 	str	x0, [sp, #24]
   e15b8:	b90017e1 	str	w1, [sp, #20]
   e15bc:	f90007e2 	str	x2, [sp, #8]
   e15c0:	f90017ff 	str	xzr, [sp, #40]
   e15c4:	1400000a 	b	e15ec <memset+0x3c>
   e15c8:	f9400fe1 	ldr	x1, [sp, #24]
   e15cc:	f94017e0 	ldr	x0, [sp, #40]
   e15d0:	8b000020 	add	x0, x1, x0
   e15d4:	b94017e1 	ldr	w1, [sp, #20]
   e15d8:	12001c21 	and	w1, w1, #0xff
   e15dc:	39000001 	strb	w1, [x0]
   e15e0:	f94017e0 	ldr	x0, [sp, #40]
   e15e4:	91000400 	add	x0, x0, #0x1
   e15e8:	f90017e0 	str	x0, [sp, #40]
   e15ec:	f94017e1 	ldr	x1, [sp, #40]
   e15f0:	f94007e0 	ldr	x0, [sp, #8]
   e15f4:	eb00003f 	cmp	x1, x0
   e15f8:	54fffe81 	b.ne	e15c8 <memset+0x18>  // b.any
   e15fc:	f9400fe0 	ldr	x0, [sp, #24]
   e1600:	9100c3ff 	add	sp, sp, #0x30
   e1604:	d65f03c0 	ret

00000000000e1608 <memmove>:
   e1608:	d100c3ff 	sub	sp, sp, #0x30
   e160c:	f9000fe0 	str	x0, [sp, #24]
   e1610:	f9000be1 	str	x1, [sp, #16]
   e1614:	f90007e2 	str	x2, [sp, #8]
   e1618:	f94007e0 	ldr	x0, [sp, #8]
   e161c:	f90017e0 	str	x0, [sp, #40]
   e1620:	1400000e 	b	e1658 <memmove+0x50>
   e1624:	f94017e0 	ldr	x0, [sp, #40]
   e1628:	d1000400 	sub	x0, x0, #0x1
   e162c:	f9400be1 	ldr	x1, [sp, #16]
   e1630:	8b000021 	add	x1, x1, x0
   e1634:	f94017e0 	ldr	x0, [sp, #40]
   e1638:	d1000400 	sub	x0, x0, #0x1
   e163c:	f9400fe2 	ldr	x2, [sp, #24]
   e1640:	8b000040 	add	x0, x2, x0
   e1644:	39400021 	ldrb	w1, [x1]
   e1648:	39000001 	strb	w1, [x0]
   e164c:	f94017e0 	ldr	x0, [sp, #40]
   e1650:	d1000400 	sub	x0, x0, #0x1
   e1654:	f90017e0 	str	x0, [sp, #40]
   e1658:	f94017e0 	ldr	x0, [sp, #40]
   e165c:	f100001f 	cmp	x0, #0x0
   e1660:	54fffe21 	b.ne	e1624 <memmove+0x1c>  // b.any
   e1664:	f9400fe0 	ldr	x0, [sp, #24]
   e1668:	9100c3ff 	add	sp, sp, #0x30
   e166c:	d65f03c0 	ret
