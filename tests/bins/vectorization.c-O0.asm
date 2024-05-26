
vectorization.c.elf:     file format elf64-littleaarch64


Disassembly of section .start:

00000000000e0000 <_start>:
   e0000:	d10143ff 	sub	sp, sp, #0x50
   e0004:	d140cbff 	sub	sp, sp, #0x32, lsl #12
   e0008:	a9007bfd 	stp	x29, x30, [sp]
   e000c:	910003fd 	mov	x29, sp
   e0010:	b9001fff 	str	wzr, [sp, #28]
   e0014:	52808000 	mov	w0, #0x400                 	// #1024
   e0018:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e001c:	b9202820 	str	w0, [x1, #8232]
   e0020:	910083e0 	add	x0, sp, #0x20
   e0024:	91401001 	add	x1, x0, #0x4, lsl #12
   e0028:	910083e0 	add	x0, sp, #0x20
   e002c:	91400c00 	add	x0, x0, #0x3, lsl #12
   e0030:	940003f4 	bl	e1000 <init_memory>
   e0034:	910083e0 	add	x0, sp, #0x20
   e0038:	91401401 	add	x1, x0, #0x5, lsl #12
   e003c:	910083e0 	add	x0, sp, #0x20
   e0040:	91401000 	add	x0, x0, #0x4, lsl #12
   e0044:	940003ef 	bl	e1000 <init_memory>
   e0048:	910083e0 	add	x0, sp, #0x20
   e004c:	91401801 	add	x1, x0, #0x6, lsl #12
   e0050:	910083e0 	add	x0, sp, #0x20
   e0054:	91401400 	add	x0, x0, #0x5, lsl #12
   e0058:	940003ea 	bl	e1000 <init_memory>
   e005c:	910083e0 	add	x0, sp, #0x20
   e0060:	91400401 	add	x1, x0, #0x1, lsl #12
   e0064:	910083e0 	add	x0, sp, #0x20
   e0068:	91200000 	add	x0, x0, #0x800
   e006c:	940003e5 	bl	e1000 <init_memory>
   e0070:	910083e1 	add	x1, sp, #0x20
   e0074:	d2830000 	mov	x0, #0x1800                	// #6144
   e0078:	8b000021 	add	x1, x1, x0
   e007c:	910083e0 	add	x0, sp, #0x20
   e0080:	91400400 	add	x0, x0, #0x1, lsl #12
   e0084:	940003df 	bl	e1000 <init_memory>
   e0088:	910083e0 	add	x0, sp, #0x20
   e008c:	91400802 	add	x2, x0, #0x2, lsl #12
   e0090:	910083e1 	add	x1, sp, #0x20
   e0094:	d2830000 	mov	x0, #0x1800                	// #6144
   e0098:	8b000020 	add	x0, x1, x0
   e009c:	aa0203e1 	mov	x1, x2
   e00a0:	940003d8 	bl	e1000 <init_memory>
   e00a4:	910083e0 	add	x0, sp, #0x20
   e00a8:	91403001 	add	x1, x0, #0xc, lsl #12
   e00ac:	910083e0 	add	x0, sp, #0x20
   e00b0:	91402800 	add	x0, x0, #0xa, lsl #12
   e00b4:	940003d3 	bl	e1000 <init_memory>
   e00b8:	910083e0 	add	x0, sp, #0x20
   e00bc:	91403801 	add	x1, x0, #0xe, lsl #12
   e00c0:	910083e0 	add	x0, sp, #0x20
   e00c4:	91403000 	add	x0, x0, #0xc, lsl #12
   e00c8:	940003ce 	bl	e1000 <init_memory>
   e00cc:	910083e0 	add	x0, sp, #0x20
   e00d0:	91404001 	add	x1, x0, #0x10, lsl #12
   e00d4:	910083e0 	add	x0, sp, #0x20
   e00d8:	91403800 	add	x0, x0, #0xe, lsl #12
   e00dc:	940003c9 	bl	e1000 <init_memory>
   e00e0:	910083e0 	add	x0, sp, #0x20
   e00e4:	91400c01 	add	x1, x0, #0x3, lsl #12
   e00e8:	910083e0 	add	x0, sp, #0x20
   e00ec:	91400800 	add	x0, x0, #0x2, lsl #12
   e00f0:	940003c4 	bl	e1000 <init_memory>
   e00f4:	910083e0 	add	x0, sp, #0x20
   e00f8:	91401c01 	add	x1, x0, #0x7, lsl #12
   e00fc:	910083e0 	add	x0, sp, #0x20
   e0100:	91401800 	add	x0, x0, #0x6, lsl #12
   e0104:	940003bf 	bl	e1000 <init_memory>
   e0108:	910083e0 	add	x0, sp, #0x20
   e010c:	91402001 	add	x1, x0, #0x8, lsl #12
   e0110:	910083e0 	add	x0, sp, #0x20
   e0114:	91401c00 	add	x0, x0, #0x7, lsl #12
   e0118:	940003ba 	bl	e1000 <init_memory>
   e011c:	910083e0 	add	x0, sp, #0x20
   e0120:	91404c01 	add	x1, x0, #0x13, lsl #12
   e0124:	910083e0 	add	x0, sp, #0x20
   e0128:	91404800 	add	x0, x0, #0x12, lsl #12
   e012c:	940003b5 	bl	e1000 <init_memory>
   e0130:	910083e0 	add	x0, sp, #0x20
   e0134:	94000129 	bl	e05d8 <example1>
   e0138:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e013c:	b9204c1f 	str	wzr, [x0, #8268]
   e0140:	14000008 	b	e0160 <_start+0x160>
   e0144:	910083e0 	add	x0, sp, #0x20
   e0148:	94000124 	bl	e05d8 <example1>
   e014c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0150:	b9604c00 	ldr	w0, [x0, #8268]
   e0154:	11000400 	add	w0, w0, #0x1
   e0158:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e015c:	b9204c20 	str	w0, [x1, #8268]
   e0160:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0164:	b9602801 	ldr	w1, [x0, #8232]
   e0168:	2a0103e0 	mov	w0, w1
   e016c:	531e7400 	lsl	w0, w0, #2
   e0170:	0b010000 	add	w0, w0, w1
   e0174:	531f7800 	lsl	w0, w0, #1
   e0178:	2a0003e1 	mov	w1, w0
   e017c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0180:	b9604c00 	ldr	w0, [x0, #8268]
   e0184:	6b01001f 	cmp	w0, w1
   e0188:	54fffdeb 	b.lt	e0144 <_start+0x144>  // b.tstop
   e018c:	910083e1 	add	x1, sp, #0x20
   e0190:	d2948000 	mov	x0, #0xa400                	// #41984
   e0194:	8b000021 	add	x1, x1, x0
   e0198:	910083e0 	add	x0, sp, #0x20
   e019c:	91402800 	add	x0, x0, #0xa, lsl #12
   e01a0:	940003b8 	bl	e1080 <digest_memory>
   e01a4:	910083e0 	add	x0, sp, #0x20
   e01a8:	52800042 	mov	w2, #0x2                   	// #2
   e01ac:	52808001 	mov	w1, #0x400                 	// #1024
   e01b0:	94000127 	bl	e064c <example2a>
   e01b4:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e01b8:	b920481f 	str	wzr, [x0, #8264]
   e01bc:	1400000a 	b	e01e4 <_start+0x1e4>
   e01c0:	910083e0 	add	x0, sp, #0x20
   e01c4:	52800042 	mov	w2, #0x2                   	// #2
   e01c8:	52808001 	mov	w1, #0x400                 	// #1024
   e01cc:	94000120 	bl	e064c <example2a>
   e01d0:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e01d4:	b9604800 	ldr	w0, [x0, #8264]
   e01d8:	11000400 	add	w0, w0, #0x1
   e01dc:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e01e0:	b9204820 	str	w0, [x1, #8264]
   e01e4:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e01e8:	b9602800 	ldr	w0, [x0, #8232]
   e01ec:	531e7400 	lsl	w0, w0, #2
   e01f0:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e01f4:	b9604821 	ldr	w1, [x1, #8264]
   e01f8:	6b00003f 	cmp	w1, w0
   e01fc:	54fffe2b 	b.lt	e01c0 <_start+0x1c0>  // b.tstop
   e0200:	910083e0 	add	x0, sp, #0x20
   e0204:	91403401 	add	x1, x0, #0xd, lsl #12
   e0208:	910083e0 	add	x0, sp, #0x20
   e020c:	91403000 	add	x0, x0, #0xc, lsl #12
   e0210:	9400039c 	bl	e1080 <digest_memory>
   e0214:	910083e0 	add	x0, sp, #0x20
   e0218:	52800042 	mov	w2, #0x2                   	// #2
   e021c:	52808001 	mov	w1, #0x400                 	// #1024
   e0220:	94000121 	bl	e06a4 <example2b>
   e0224:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0228:	b920441f 	str	wzr, [x0, #8260]
   e022c:	1400000a 	b	e0254 <_start+0x254>
   e0230:	910083e0 	add	x0, sp, #0x20
   e0234:	52800042 	mov	w2, #0x2                   	// #2
   e0238:	52808001 	mov	w1, #0x400                 	// #1024
   e023c:	9400011a 	bl	e06a4 <example2b>
   e0240:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0244:	b9604400 	ldr	w0, [x0, #8260]
   e0248:	11000400 	add	w0, w0, #0x1
   e024c:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0250:	b9204420 	str	w0, [x1, #8260]
   e0254:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0258:	b9602800 	ldr	w0, [x0, #8232]
   e025c:	531f7800 	lsl	w0, w0, #1
   e0260:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0264:	b9604421 	ldr	w1, [x1, #8260]
   e0268:	6b00003f 	cmp	w1, w0
   e026c:	54fffe2b 	b.lt	e0230 <_start+0x230>  // b.tstop
   e0270:	910083e0 	add	x0, sp, #0x20
   e0274:	91402c01 	add	x1, x0, #0xb, lsl #12
   e0278:	910083e0 	add	x0, sp, #0x20
   e027c:	91402800 	add	x0, x0, #0xa, lsl #12
   e0280:	94000380 	bl	e1080 <digest_memory>
   e0284:	910083e0 	add	x0, sp, #0x20
   e0288:	91401002 	add	x2, x0, #0x4, lsl #12
   e028c:	910083e0 	add	x0, sp, #0x20
   e0290:	91400c01 	add	x1, x0, #0x3, lsl #12
   e0294:	910083e0 	add	x0, sp, #0x20
   e0298:	aa0203e3 	mov	x3, x2
   e029c:	aa0103e2 	mov	x2, x1
   e02a0:	52807ec1 	mov	w1, #0x3f6                 	// #1014
   e02a4:	94000150 	bl	e07e4 <example4b>
   e02a8:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e02ac:	b920401f 	str	wzr, [x0, #8256]
   e02b0:	1400000f 	b	e02ec <_start+0x2ec>
   e02b4:	910083e0 	add	x0, sp, #0x20
   e02b8:	91401002 	add	x2, x0, #0x4, lsl #12
   e02bc:	910083e0 	add	x0, sp, #0x20
   e02c0:	91400c01 	add	x1, x0, #0x3, lsl #12
   e02c4:	910083e0 	add	x0, sp, #0x20
   e02c8:	aa0203e3 	mov	x3, x2
   e02cc:	aa0103e2 	mov	x2, x1
   e02d0:	52807ec1 	mov	w1, #0x3f6                 	// #1014
   e02d4:	94000144 	bl	e07e4 <example4b>
   e02d8:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e02dc:	b9604000 	ldr	w0, [x0, #8256]
   e02e0:	11000400 	add	w0, w0, #0x1
   e02e4:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e02e8:	b9204020 	str	w0, [x1, #8256]
   e02ec:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e02f0:	b9602800 	ldr	w0, [x0, #8232]
   e02f4:	531f7800 	lsl	w0, w0, #1
   e02f8:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e02fc:	b9604021 	ldr	w1, [x1, #8256]
   e0300:	6b00003f 	cmp	w1, w0
   e0304:	54fffd8b 	b.lt	e02b4 <_start+0x2b4>  // b.tstop
   e0308:	910083e0 	add	x0, sp, #0x20
   e030c:	91401001 	add	x1, x0, #0x4, lsl #12
   e0310:	910083e0 	add	x0, sp, #0x20
   e0314:	91400c00 	add	x0, x0, #0x3, lsl #12
   e0318:	9400035a 	bl	e1080 <digest_memory>
   e031c:	910083e0 	add	x0, sp, #0x20
   e0320:	91401002 	add	x2, x0, #0x4, lsl #12
   e0324:	910083e0 	add	x0, sp, #0x20
   e0328:	91400c01 	add	x1, x0, #0x3, lsl #12
   e032c:	910083e0 	add	x0, sp, #0x20
   e0330:	aa0203e3 	mov	x3, x2
   e0334:	aa0103e2 	mov	x2, x1
   e0338:	52808001 	mov	w1, #0x400                 	// #1024
   e033c:	9400014f 	bl	e0878 <example4c>
   e0340:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0344:	b9203c1f 	str	wzr, [x0, #8252]
   e0348:	1400000f 	b	e0384 <_start+0x384>
   e034c:	910083e0 	add	x0, sp, #0x20
   e0350:	91401002 	add	x2, x0, #0x4, lsl #12
   e0354:	910083e0 	add	x0, sp, #0x20
   e0358:	91400c01 	add	x1, x0, #0x3, lsl #12
   e035c:	910083e0 	add	x0, sp, #0x20
   e0360:	aa0203e3 	mov	x3, x2
   e0364:	aa0103e2 	mov	x2, x1
   e0368:	52808001 	mov	w1, #0x400                 	// #1024
   e036c:	94000143 	bl	e0878 <example4c>
   e0370:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0374:	b9603c00 	ldr	w0, [x0, #8252]
   e0378:	11000400 	add	w0, w0, #0x1
   e037c:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0380:	b9203c20 	str	w0, [x1, #8252]
   e0384:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0388:	b9602800 	ldr	w0, [x0, #8232]
   e038c:	531f7800 	lsl	w0, w0, #1
   e0390:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0394:	b9603c21 	ldr	w1, [x1, #8252]
   e0398:	6b00003f 	cmp	w1, w0
   e039c:	54fffd8b 	b.lt	e034c <_start+0x34c>  // b.tstop
   e03a0:	910083e0 	add	x0, sp, #0x20
   e03a4:	91401401 	add	x1, x0, #0x5, lsl #12
   e03a8:	910083e0 	add	x0, sp, #0x20
   e03ac:	91401000 	add	x0, x0, #0x4, lsl #12
   e03b0:	94000334 	bl	e1080 <digest_memory>
   e03b4:	910083e0 	add	x0, sp, #0x20
   e03b8:	52800081 	mov	w1, #0x4                   	// #4
   e03bc:	9400016b 	bl	e0968 <example7>
   e03c0:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e03c4:	b920381f 	str	wzr, [x0, #8248]
   e03c8:	14000009 	b	e03ec <_start+0x3ec>
   e03cc:	910083e0 	add	x0, sp, #0x20
   e03d0:	52800081 	mov	w1, #0x4                   	// #4
   e03d4:	94000165 	bl	e0968 <example7>
   e03d8:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e03dc:	b9603800 	ldr	w0, [x0, #8248]
   e03e0:	11000400 	add	w0, w0, #0x1
   e03e4:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e03e8:	b9203820 	str	w0, [x1, #8248]
   e03ec:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e03f0:	b9602800 	ldr	w0, [x0, #8232]
   e03f4:	531e7400 	lsl	w0, w0, #2
   e03f8:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e03fc:	b9603821 	ldr	w1, [x1, #8248]
   e0400:	6b00003f 	cmp	w1, w0
   e0404:	54fffe4b 	b.lt	e03cc <_start+0x3cc>  // b.tstop
   e0408:	910083e0 	add	x0, sp, #0x20
   e040c:	91402c01 	add	x1, x0, #0xb, lsl #12
   e0410:	910083e0 	add	x0, sp, #0x20
   e0414:	91402800 	add	x0, x0, #0xa, lsl #12
   e0418:	9400031a 	bl	e1080 <digest_memory>
   e041c:	910083e0 	add	x0, sp, #0x20
   e0420:	52800101 	mov	w1, #0x8                   	// #8
   e0424:	9400016c 	bl	e09d4 <example8>
   e0428:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e042c:	b920341f 	str	wzr, [x0, #8244]
   e0430:	14000009 	b	e0454 <_start+0x454>
   e0434:	910083e0 	add	x0, sp, #0x20
   e0438:	52800101 	mov	w1, #0x8                   	// #8
   e043c:	94000166 	bl	e09d4 <example8>
   e0440:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0444:	b9603400 	ldr	w0, [x0, #8244]
   e0448:	11000400 	add	w0, w0, #0x1
   e044c:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0450:	b9203420 	str	w0, [x1, #8244]
   e0454:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0458:	b9602800 	ldr	w0, [x0, #8232]
   e045c:	11000c01 	add	w1, w0, #0x3
   e0460:	7100001f 	cmp	w0, #0x0
   e0464:	1a80b020 	csel	w0, w1, w0, lt	// lt = tstop
   e0468:	13027c00 	asr	w0, w0, #2
   e046c:	2a0003e1 	mov	w1, w0
   e0470:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0474:	b9603400 	ldr	w0, [x0, #8244]
   e0478:	6b01001f 	cmp	w0, w1
   e047c:	54fffdcb 	b.lt	e0434 <_start+0x434>  // b.tstop
   e0480:	910083e0 	add	x0, sp, #0x20
   e0484:	91404c01 	add	x1, x0, #0x13, lsl #12
   e0488:	910083e0 	add	x0, sp, #0x20
   e048c:	91404800 	add	x0, x0, #0x12, lsl #12
   e0490:	940002fc 	bl	e1080 <digest_memory>
   e0494:	910073e1 	add	x1, sp, #0x1c
   e0498:	910083e0 	add	x0, sp, #0x20
   e049c:	9400016e 	bl	e0a54 <example9>
   e04a0:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e04a4:	b920301f 	str	wzr, [x0, #8240]
   e04a8:	14000009 	b	e04cc <_start+0x4cc>
   e04ac:	910073e1 	add	x1, sp, #0x1c
   e04b0:	910083e0 	add	x0, sp, #0x20
   e04b4:	94000168 	bl	e0a54 <example9>
   e04b8:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e04bc:	b9603000 	ldr	w0, [x0, #8240]
   e04c0:	11000400 	add	w0, w0, #0x1
   e04c4:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e04c8:	b9203020 	str	w0, [x1, #8240]
   e04cc:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e04d0:	b9602800 	ldr	w0, [x0, #8232]
   e04d4:	531f7800 	lsl	w0, w0, #1
   e04d8:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e04dc:	b9603021 	ldr	w1, [x1, #8240]
   e04e0:	6b00003f 	cmp	w1, w0
   e04e4:	54fffe4b 	b.lt	e04ac <_start+0x4ac>  // b.tstop
   e04e8:	910083e0 	add	x0, sp, #0x20
   e04ec:	91401406 	add	x6, x0, #0x5, lsl #12
   e04f0:	910083e0 	add	x0, sp, #0x20
   e04f4:	91401005 	add	x5, x0, #0x4, lsl #12
   e04f8:	910083e0 	add	x0, sp, #0x20
   e04fc:	91400c04 	add	x4, x0, #0x3, lsl #12
   e0500:	910083e1 	add	x1, sp, #0x20
   e0504:	d2830000 	mov	x0, #0x1800                	// #6144
   e0508:	8b000023 	add	x3, x1, x0
   e050c:	910083e0 	add	x0, sp, #0x20
   e0510:	91400402 	add	x2, x0, #0x1, lsl #12
   e0514:	910083e0 	add	x0, sp, #0x20
   e0518:	91200001 	add	x1, x0, #0x800
   e051c:	910083e0 	add	x0, sp, #0x20
   e0520:	9400016d 	bl	e0ad4 <example10a>
   e0524:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0528:	b9202c1f 	str	wzr, [x0, #8236]
   e052c:	14000015 	b	e0580 <_start+0x580>
   e0530:	910083e0 	add	x0, sp, #0x20
   e0534:	91401406 	add	x6, x0, #0x5, lsl #12
   e0538:	910083e0 	add	x0, sp, #0x20
   e053c:	91401005 	add	x5, x0, #0x4, lsl #12
   e0540:	910083e0 	add	x0, sp, #0x20
   e0544:	91400c04 	add	x4, x0, #0x3, lsl #12
   e0548:	910083e1 	add	x1, sp, #0x20
   e054c:	d2830000 	mov	x0, #0x1800                	// #6144
   e0550:	8b000023 	add	x3, x1, x0
   e0554:	910083e0 	add	x0, sp, #0x20
   e0558:	91400402 	add	x2, x0, #0x1, lsl #12
   e055c:	910083e0 	add	x0, sp, #0x20
   e0560:	91200001 	add	x1, x0, #0x800
   e0564:	910083e0 	add	x0, sp, #0x20
   e0568:	9400015b 	bl	e0ad4 <example10a>
   e056c:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0570:	b9602c00 	ldr	w0, [x0, #8236]
   e0574:	11000400 	add	w0, w0, #0x1
   e0578:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e057c:	b9202c20 	str	w0, [x1, #8236]
   e0580:	9140c3e0 	add	x0, sp, #0x30, lsl #12
   e0584:	b9602800 	ldr	w0, [x0, #8232]
   e0588:	531f7800 	lsl	w0, w0, #1
   e058c:	9140c3e1 	add	x1, sp, #0x30, lsl #12
   e0590:	b9602c21 	ldr	w1, [x1, #8236]
   e0594:	6b00003f 	cmp	w1, w0
   e0598:	54fffccb 	b.lt	e0530 <_start+0x530>  // b.tstop
   e059c:	910083e0 	add	x0, sp, #0x20
   e05a0:	91401001 	add	x1, x0, #0x4, lsl #12
   e05a4:	910083e0 	add	x0, sp, #0x20
   e05a8:	91400c00 	add	x0, x0, #0x3, lsl #12
   e05ac:	940002b5 	bl	e1080 <digest_memory>
   e05b0:	910083e0 	add	x0, sp, #0x20
   e05b4:	91400401 	add	x1, x0, #0x1, lsl #12
   e05b8:	910083e0 	add	x0, sp, #0x20
   e05bc:	91200000 	add	x0, x0, #0x800
   e05c0:	940002b0 	bl	e1080 <digest_memory>
   e05c4:	d2800000 	mov	x0, #0x0                   	// #0
   e05c8:	a9407bfd 	ldp	x29, x30, [sp]
   e05cc:	910143ff 	add	sp, sp, #0x50
   e05d0:	9140cbff 	add	sp, sp, #0x32, lsl #12
   e05d4:	d65f03c0 	ret

Disassembly of section .text:

00000000000e05d8 <example1>:
   e05d8:	d10083ff 	sub	sp, sp, #0x20
   e05dc:	f90007e0 	str	x0, [sp, #8]
   e05e0:	b9001fff 	str	wzr, [sp, #28]
   e05e4:	14000013 	b	e0630 <example1+0x58>
   e05e8:	f94007e0 	ldr	x0, [sp, #8]
   e05ec:	b9801fe1 	ldrsw	x1, [sp, #28]
   e05f0:	91400c21 	add	x1, x1, #0x3, lsl #12
   e05f4:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e05f8:	f94007e0 	ldr	x0, [sp, #8]
   e05fc:	b9801fe3 	ldrsw	x3, [sp, #28]
   e0600:	d2870002 	mov	x2, #0x3800                	// #14336
   e0604:	8b020062 	add	x2, x3, x2
   e0608:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e060c:	0b000022 	add	w2, w1, w0
   e0610:	f94007e0 	ldr	x0, [sp, #8]
   e0614:	b9801fe3 	ldrsw	x3, [sp, #28]
   e0618:	d2850001 	mov	x1, #0x2800                	// #10240
   e061c:	8b010061 	add	x1, x3, x1
   e0620:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0624:	b9401fe0 	ldr	w0, [sp, #28]
   e0628:	11000400 	add	w0, w0, #0x1
   e062c:	b9001fe0 	str	w0, [sp, #28]
   e0630:	b9401fe0 	ldr	w0, [sp, #28]
   e0634:	7103fc1f 	cmp	w0, #0xff
   e0638:	54fffd8d 	b.le	e05e8 <example1+0x10>
   e063c:	d503201f 	nop
   e0640:	d503201f 	nop
   e0644:	910083ff 	add	sp, sp, #0x20
   e0648:	d65f03c0 	ret

00000000000e064c <example2a>:
   e064c:	d10083ff 	sub	sp, sp, #0x20
   e0650:	f90007e0 	str	x0, [sp, #8]
   e0654:	b90007e1 	str	w1, [sp, #4]
   e0658:	b90003e2 	str	w2, [sp]
   e065c:	b9001fff 	str	wzr, [sp, #28]
   e0660:	14000009 	b	e0684 <example2a+0x38>
   e0664:	f94007e0 	ldr	x0, [sp, #8]
   e0668:	b9801fe1 	ldrsw	x1, [sp, #28]
   e066c:	91400c21 	add	x1, x1, #0x3, lsl #12
   e0670:	b94003e2 	ldr	w2, [sp]
   e0674:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0678:	b9401fe0 	ldr	w0, [sp, #28]
   e067c:	11000400 	add	w0, w0, #0x1
   e0680:	b9001fe0 	str	w0, [sp, #28]
   e0684:	b9401fe1 	ldr	w1, [sp, #28]
   e0688:	b94007e0 	ldr	w0, [sp, #4]
   e068c:	6b00003f 	cmp	w1, w0
   e0690:	54fffeab 	b.lt	e0664 <example2a+0x18>  // b.tstop
   e0694:	d503201f 	nop
   e0698:	d503201f 	nop
   e069c:	910083ff 	add	sp, sp, #0x20
   e06a0:	d65f03c0 	ret

00000000000e06a4 <example2b>:
   e06a4:	d10083ff 	sub	sp, sp, #0x20
   e06a8:	f90007e0 	str	x0, [sp, #8]
   e06ac:	b90007e1 	str	w1, [sp, #4]
   e06b0:	b90003e2 	str	w2, [sp]
   e06b4:	b9001fff 	str	wzr, [sp, #28]
   e06b8:	14000013 	b	e0704 <example2b+0x60>
   e06bc:	f94007e0 	ldr	x0, [sp, #8]
   e06c0:	b9801fe1 	ldrsw	x1, [sp, #28]
   e06c4:	91400c21 	add	x1, x1, #0x3, lsl #12
   e06c8:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e06cc:	f94007e0 	ldr	x0, [sp, #8]
   e06d0:	b9801fe3 	ldrsw	x3, [sp, #28]
   e06d4:	d2870002 	mov	x2, #0x3800                	// #14336
   e06d8:	8b020062 	add	x2, x3, x2
   e06dc:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e06e0:	0a000022 	and	w2, w1, w0
   e06e4:	f94007e0 	ldr	x0, [sp, #8]
   e06e8:	b9801fe3 	ldrsw	x3, [sp, #28]
   e06ec:	d2850001 	mov	x1, #0x2800                	// #10240
   e06f0:	8b010061 	add	x1, x3, x1
   e06f4:	b8217802 	str	w2, [x0, x1, lsl #2]
   e06f8:	b9401fe0 	ldr	w0, [sp, #28]
   e06fc:	11000400 	add	w0, w0, #0x1
   e0700:	b9001fe0 	str	w0, [sp, #28]
   e0704:	b94007e0 	ldr	w0, [sp, #4]
   e0708:	51000401 	sub	w1, w0, #0x1
   e070c:	b90007e1 	str	w1, [sp, #4]
   e0710:	7100001f 	cmp	w0, #0x0
   e0714:	54fffd41 	b.ne	e06bc <example2b+0x18>  // b.any
   e0718:	d503201f 	nop
   e071c:	d503201f 	nop
   e0720:	910083ff 	add	sp, sp, #0x20
   e0724:	d65f03c0 	ret

00000000000e0728 <example3>:
   e0728:	d10083ff 	sub	sp, sp, #0x20
   e072c:	f9000fe0 	str	x0, [sp, #24]
   e0730:	b90017e1 	str	w1, [sp, #20]
   e0734:	f90007e2 	str	x2, [sp, #8]
   e0738:	f90003e3 	str	x3, [sp]
   e073c:	14000009 	b	e0760 <example3+0x38>
   e0740:	f94003e1 	ldr	x1, [sp]
   e0744:	91001020 	add	x0, x1, #0x4
   e0748:	f90003e0 	str	x0, [sp]
   e074c:	f94007e0 	ldr	x0, [sp, #8]
   e0750:	91001002 	add	x2, x0, #0x4
   e0754:	f90007e2 	str	x2, [sp, #8]
   e0758:	b9400021 	ldr	w1, [x1]
   e075c:	b9000001 	str	w1, [x0]
   e0760:	b94017e0 	ldr	w0, [sp, #20]
   e0764:	51000401 	sub	w1, w0, #0x1
   e0768:	b90017e1 	str	w1, [sp, #20]
   e076c:	7100001f 	cmp	w0, #0x0
   e0770:	54fffe81 	b.ne	e0740 <example3+0x18>  // b.any
   e0774:	d503201f 	nop
   e0778:	d503201f 	nop
   e077c:	910083ff 	add	sp, sp, #0x20
   e0780:	d65f03c0 	ret

00000000000e0784 <example4a>:
   e0784:	d10083ff 	sub	sp, sp, #0x20
   e0788:	f9000fe0 	str	x0, [sp, #24]
   e078c:	b90017e1 	str	w1, [sp, #20]
   e0790:	f90007e2 	str	x2, [sp, #8]
   e0794:	f90003e3 	str	x3, [sp]
   e0798:	1400000a 	b	e07c0 <example4a+0x3c>
   e079c:	f94003e0 	ldr	x0, [sp]
   e07a0:	91001001 	add	x1, x0, #0x4
   e07a4:	f90003e1 	str	x1, [sp]
   e07a8:	b9400001 	ldr	w1, [x0]
   e07ac:	f94007e0 	ldr	x0, [sp, #8]
   e07b0:	91001002 	add	x2, x0, #0x4
   e07b4:	f90007e2 	str	x2, [sp, #8]
   e07b8:	11001421 	add	w1, w1, #0x5
   e07bc:	b9000001 	str	w1, [x0]
   e07c0:	b94017e0 	ldr	w0, [sp, #20]
   e07c4:	51000401 	sub	w1, w0, #0x1
   e07c8:	b90017e1 	str	w1, [sp, #20]
   e07cc:	7100001f 	cmp	w0, #0x0
   e07d0:	54fffe61 	b.ne	e079c <example4a+0x18>  // b.any
   e07d4:	d503201f 	nop
   e07d8:	d503201f 	nop
   e07dc:	910083ff 	add	sp, sp, #0x20
   e07e0:	d65f03c0 	ret

00000000000e07e4 <example4b>:
   e07e4:	d100c3ff 	sub	sp, sp, #0x30
   e07e8:	f9000fe0 	str	x0, [sp, #24]
   e07ec:	b90017e1 	str	w1, [sp, #20]
   e07f0:	f90007e2 	str	x2, [sp, #8]
   e07f4:	f90003e3 	str	x3, [sp]
   e07f8:	b9002fff 	str	wzr, [sp, #44]
   e07fc:	14000017 	b	e0858 <example4b+0x74>
   e0800:	b9402fe0 	ldr	w0, [sp, #44]
   e0804:	11000401 	add	w1, w0, #0x1
   e0808:	f9400fe0 	ldr	x0, [sp, #24]
   e080c:	93407c21 	sxtw	x1, w1
   e0810:	91400c21 	add	x1, x1, #0x3, lsl #12
   e0814:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e0818:	b9402fe0 	ldr	w0, [sp, #44]
   e081c:	11000c02 	add	w2, w0, #0x3
   e0820:	f9400fe0 	ldr	x0, [sp, #24]
   e0824:	93407c43 	sxtw	x3, w2
   e0828:	d2870002 	mov	x2, #0x3800                	// #14336
   e082c:	8b020062 	add	x2, x3, x2
   e0830:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e0834:	0b000022 	add	w2, w1, w0
   e0838:	f9400fe0 	ldr	x0, [sp, #24]
   e083c:	b9802fe3 	ldrsw	x3, [sp, #44]
   e0840:	d2850001 	mov	x1, #0x2800                	// #10240
   e0844:	8b010061 	add	x1, x3, x1
   e0848:	b8217802 	str	w2, [x0, x1, lsl #2]
   e084c:	b9402fe0 	ldr	w0, [sp, #44]
   e0850:	11000400 	add	w0, w0, #0x1
   e0854:	b9002fe0 	str	w0, [sp, #44]
   e0858:	b9402fe1 	ldr	w1, [sp, #44]
   e085c:	b94017e0 	ldr	w0, [sp, #20]
   e0860:	6b00003f 	cmp	w1, w0
   e0864:	54fffceb 	b.lt	e0800 <example4b+0x1c>  // b.tstop
   e0868:	d503201f 	nop
   e086c:	d503201f 	nop
   e0870:	9100c3ff 	add	sp, sp, #0x30
   e0874:	d65f03c0 	ret

00000000000e0878 <example4c>:
   e0878:	d100c3ff 	sub	sp, sp, #0x30
   e087c:	f9000fe0 	str	x0, [sp, #24]
   e0880:	b90017e1 	str	w1, [sp, #20]
   e0884:	f90007e2 	str	x2, [sp, #8]
   e0888:	f90003e3 	str	x3, [sp]
   e088c:	52800080 	mov	w0, #0x4                   	// #4
   e0890:	b9002be0 	str	w0, [sp, #40]
   e0894:	b9002fff 	str	wzr, [sp, #44]
   e0898:	14000015 	b	e08ec <example4c+0x74>
   e089c:	f9400fe0 	ldr	x0, [sp, #24]
   e08a0:	b9802fe2 	ldrsw	x2, [sp, #44]
   e08a4:	d2850001 	mov	x1, #0x2800                	// #10240
   e08a8:	8b010041 	add	x1, x2, x1
   e08ac:	b8617800 	ldr	w0, [x0, x1, lsl #2]
   e08b0:	b90027e0 	str	w0, [sp, #36]
   e08b4:	b94027e1 	ldr	w1, [sp, #36]
   e08b8:	b9402be0 	ldr	w0, [sp, #40]
   e08bc:	6b00003f 	cmp	w1, w0
   e08c0:	5400006d 	b.le	e08cc <example4c+0x54>
   e08c4:	b9402be0 	ldr	w0, [sp, #40]
   e08c8:	14000002 	b	e08d0 <example4c+0x58>
   e08cc:	52800000 	mov	w0, #0x0                   	// #0
   e08d0:	f9400fe1 	ldr	x1, [sp, #24]
   e08d4:	b9802fe2 	ldrsw	x2, [sp, #44]
   e08d8:	91400c42 	add	x2, x2, #0x3, lsl #12
   e08dc:	b8227820 	str	w0, [x1, x2, lsl #2]
   e08e0:	b9402fe0 	ldr	w0, [sp, #44]
   e08e4:	11000400 	add	w0, w0, #0x1
   e08e8:	b9002fe0 	str	w0, [sp, #44]
   e08ec:	b9402fe1 	ldr	w1, [sp, #44]
   e08f0:	b94017e0 	ldr	w0, [sp, #20]
   e08f4:	6b00003f 	cmp	w1, w0
   e08f8:	54fffd2b 	b.lt	e089c <example4c+0x24>  // b.tstop
   e08fc:	d503201f 	nop
   e0900:	d503201f 	nop
   e0904:	9100c3ff 	add	sp, sp, #0x30
   e0908:	d65f03c0 	ret

00000000000e090c <example5>:
   e090c:	d100c3ff 	sub	sp, sp, #0x30
   e0910:	f9000fe0 	str	x0, [sp, #24]
   e0914:	b90017e1 	str	w1, [sp, #20]
   e0918:	f90007e2 	str	x2, [sp, #8]
   e091c:	b9002fff 	str	wzr, [sp, #44]
   e0920:	1400000a 	b	e0948 <example5+0x3c>
   e0924:	f9400fe0 	ldr	x0, [sp, #24]
   e0928:	b9802fe2 	ldrsw	x2, [sp, #44]
   e092c:	d2848001 	mov	x1, #0x2400                	// #9216
   e0930:	8b010041 	add	x1, x2, x1
   e0934:	528000a2 	mov	w2, #0x5                   	// #5
   e0938:	b8217802 	str	w2, [x0, x1, lsl #2]
   e093c:	b9402fe0 	ldr	w0, [sp, #44]
   e0940:	11000400 	add	w0, w0, #0x1
   e0944:	b9002fe0 	str	w0, [sp, #44]
   e0948:	b9402fe1 	ldr	w1, [sp, #44]
   e094c:	b94017e0 	ldr	w0, [sp, #20]
   e0950:	6b00003f 	cmp	w1, w0
   e0954:	54fffe8b 	b.lt	e0924 <example5+0x18>  // b.tstop
   e0958:	d503201f 	nop
   e095c:	d503201f 	nop
   e0960:	9100c3ff 	add	sp, sp, #0x30
   e0964:	d65f03c0 	ret

00000000000e0968 <example7>:
   e0968:	d10083ff 	sub	sp, sp, #0x20
   e096c:	f90007e0 	str	x0, [sp, #8]
   e0970:	b90007e1 	str	w1, [sp, #4]
   e0974:	b9001fff 	str	wzr, [sp, #28]
   e0978:	14000010 	b	e09b8 <example7+0x50>
   e097c:	b9401fe1 	ldr	w1, [sp, #28]
   e0980:	b94007e0 	ldr	w0, [sp, #4]
   e0984:	0b000021 	add	w1, w1, w0
   e0988:	f94007e0 	ldr	x0, [sp, #8]
   e098c:	93407c21 	sxtw	x1, w1
   e0990:	91400c21 	add	x1, x1, #0x3, lsl #12
   e0994:	b8617802 	ldr	w2, [x0, x1, lsl #2]
   e0998:	f94007e0 	ldr	x0, [sp, #8]
   e099c:	b9801fe3 	ldrsw	x3, [sp, #28]
   e09a0:	d2850001 	mov	x1, #0x2800                	// #10240
   e09a4:	8b010061 	add	x1, x3, x1
   e09a8:	b8217802 	str	w2, [x0, x1, lsl #2]
   e09ac:	b9401fe0 	ldr	w0, [sp, #28]
   e09b0:	11000400 	add	w0, w0, #0x1
   e09b4:	b9001fe0 	str	w0, [sp, #28]
   e09b8:	b9401fe0 	ldr	w0, [sp, #28]
   e09bc:	710ffc1f 	cmp	w0, #0x3ff
   e09c0:	54fffded 	b.le	e097c <example7+0x14>
   e09c4:	d503201f 	nop
   e09c8:	d503201f 	nop
   e09cc:	910083ff 	add	sp, sp, #0x20
   e09d0:	d65f03c0 	ret

00000000000e09d4 <example8>:
   e09d4:	d10083ff 	sub	sp, sp, #0x20
   e09d8:	f90007e0 	str	x0, [sp, #8]
   e09dc:	b90007e1 	str	w1, [sp, #4]
   e09e0:	b9001fff 	str	wzr, [sp, #28]
   e09e4:	14000015 	b	e0a38 <example8+0x64>
   e09e8:	b9001bff 	str	wzr, [sp, #24]
   e09ec:	1400000d 	b	e0a20 <example8+0x4c>
   e09f0:	f94007e0 	ldr	x0, [sp, #8]
   e09f4:	b9801be1 	ldrsw	x1, [sp, #24]
   e09f8:	b9801fe2 	ldrsw	x2, [sp, #28]
   e09fc:	d376d442 	lsl	x2, x2, #10
   e0a00:	8b010042 	add	x2, x2, x1
   e0a04:	d2890001 	mov	x1, #0x4800                	// #18432
   e0a08:	8b010041 	add	x1, x2, x1
   e0a0c:	b94007e2 	ldr	w2, [sp, #4]
   e0a10:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0a14:	b9401be0 	ldr	w0, [sp, #24]
   e0a18:	11000400 	add	w0, w0, #0x1
   e0a1c:	b9001be0 	str	w0, [sp, #24]
   e0a20:	b9401be0 	ldr	w0, [sp, #24]
   e0a24:	710ffc1f 	cmp	w0, #0x3ff
   e0a28:	54fffe4d 	b.le	e09f0 <example8+0x1c>
   e0a2c:	b9401fe0 	ldr	w0, [sp, #28]
   e0a30:	11000400 	add	w0, w0, #0x1
   e0a34:	b9001fe0 	str	w0, [sp, #28]
   e0a38:	b9401fe0 	ldr	w0, [sp, #28]
   e0a3c:	71007c1f 	cmp	w0, #0x1f
   e0a40:	54fffd4d 	b.le	e09e8 <example8+0x14>
   e0a44:	d503201f 	nop
   e0a48:	d503201f 	nop
   e0a4c:	910083ff 	add	sp, sp, #0x20
   e0a50:	d65f03c0 	ret

00000000000e0a54 <example9>:
   e0a54:	d10083ff 	sub	sp, sp, #0x20
   e0a58:	f90007e0 	str	x0, [sp, #8]
   e0a5c:	f90003e1 	str	x1, [sp]
   e0a60:	b9001bff 	str	wzr, [sp, #24]
   e0a64:	b9001fff 	str	wzr, [sp, #28]
   e0a68:	14000012 	b	e0ab0 <example9+0x5c>
   e0a6c:	f94007e0 	ldr	x0, [sp, #8]
   e0a70:	b9801fe2 	ldrsw	x2, [sp, #28]
   e0a74:	d2830001 	mov	x1, #0x1800                	// #6144
   e0a78:	8b010041 	add	x1, x2, x1
   e0a7c:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e0a80:	f94007e0 	ldr	x0, [sp, #8]
   e0a84:	b9801fe3 	ldrsw	x3, [sp, #28]
   e0a88:	d2838002 	mov	x2, #0x1c00                	// #7168
   e0a8c:	8b020062 	add	x2, x3, x2
   e0a90:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e0a94:	4b000020 	sub	w0, w1, w0
   e0a98:	b9401be1 	ldr	w1, [sp, #24]
   e0a9c:	0b000020 	add	w0, w1, w0
   e0aa0:	b9001be0 	str	w0, [sp, #24]
   e0aa4:	b9401fe0 	ldr	w0, [sp, #28]
   e0aa8:	11000400 	add	w0, w0, #0x1
   e0aac:	b9001fe0 	str	w0, [sp, #28]
   e0ab0:	b9401fe0 	ldr	w0, [sp, #28]
   e0ab4:	710ffc1f 	cmp	w0, #0x3ff
   e0ab8:	54fffdad 	b.le	e0a6c <example9+0x18>
   e0abc:	f94003e0 	ldr	x0, [sp]
   e0ac0:	b9401be1 	ldr	w1, [sp, #24]
   e0ac4:	b9000001 	str	w1, [x0]
   e0ac8:	d503201f 	nop
   e0acc:	910083ff 	add	sp, sp, #0x20
   e0ad0:	d65f03c0 	ret

00000000000e0ad4 <example10a>:
   e0ad4:	d10143ff 	sub	sp, sp, #0x50
   e0ad8:	f9001fe0 	str	x0, [sp, #56]
   e0adc:	f9001be1 	str	x1, [sp, #48]
   e0ae0:	f90017e2 	str	x2, [sp, #40]
   e0ae4:	f90013e3 	str	x3, [sp, #32]
   e0ae8:	f9000fe4 	str	x4, [sp, #24]
   e0aec:	f9000be5 	str	x5, [sp, #16]
   e0af0:	f90007e6 	str	x6, [sp, #8]
   e0af4:	b9004fff 	str	wzr, [sp, #76]
   e0af8:	14000023 	b	e0b84 <example10a+0xb0>
   e0afc:	f9401fe0 	ldr	x0, [sp, #56]
   e0b00:	b9804fe1 	ldrsw	x1, [sp, #76]
   e0b04:	91400421 	add	x1, x1, #0x1, lsl #12
   e0b08:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e0b0c:	f9401fe0 	ldr	x0, [sp, #56]
   e0b10:	b9804fe3 	ldrsw	x3, [sp, #76]
   e0b14:	d2828002 	mov	x2, #0x1400                	// #5120
   e0b18:	8b020062 	add	x2, x3, x2
   e0b1c:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e0b20:	0b000022 	add	w2, w1, w0
   e0b24:	f9401fe0 	ldr	x0, [sp, #56]
   e0b28:	b9804fe1 	ldrsw	x1, [sp, #76]
   e0b2c:	91300021 	add	x1, x1, #0xc00
   e0b30:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0b34:	f9401fe0 	ldr	x0, [sp, #56]
   e0b38:	b9804fe1 	ldrsw	x1, [sp, #76]
   e0b3c:	91200021 	add	x1, x1, #0x800
   e0b40:	78e17800 	ldrsh	w0, [x0, x1, lsl #1]
   e0b44:	12003c01 	and	w1, w0, #0xffff
   e0b48:	f9401fe0 	ldr	x0, [sp, #56]
   e0b4c:	b9804fe2 	ldrsw	x2, [sp, #76]
   e0b50:	91300042 	add	x2, x2, #0xc00
   e0b54:	78e27800 	ldrsh	w0, [x0, x2, lsl #1]
   e0b58:	12003c00 	and	w0, w0, #0xffff
   e0b5c:	0b000020 	add	w0, w1, w0
   e0b60:	12003c00 	and	w0, w0, #0xffff
   e0b64:	13003c02 	sxth	w2, w0
   e0b68:	f9401fe0 	ldr	x0, [sp, #56]
   e0b6c:	b9804fe1 	ldrsw	x1, [sp, #76]
   e0b70:	91100021 	add	x1, x1, #0x400
   e0b74:	78217802 	strh	w2, [x0, x1, lsl #1]
   e0b78:	b9404fe0 	ldr	w0, [sp, #76]
   e0b7c:	11000400 	add	w0, w0, #0x1
   e0b80:	b9004fe0 	str	w0, [sp, #76]
   e0b84:	b9404fe0 	ldr	w0, [sp, #76]
   e0b88:	710ffc1f 	cmp	w0, #0x3ff
   e0b8c:	54fffb8d 	b.le	e0afc <example10a+0x28>
   e0b90:	d503201f 	nop
   e0b94:	d503201f 	nop
   e0b98:	910143ff 	add	sp, sp, #0x50
   e0b9c:	d65f03c0 	ret

00000000000e0ba0 <example10b>:
   e0ba0:	d10143ff 	sub	sp, sp, #0x50
   e0ba4:	f9001fe0 	str	x0, [sp, #56]
   e0ba8:	f9001be1 	str	x1, [sp, #48]
   e0bac:	f90017e2 	str	x2, [sp, #40]
   e0bb0:	f90013e3 	str	x3, [sp, #32]
   e0bb4:	f9000fe4 	str	x4, [sp, #24]
   e0bb8:	f9000be5 	str	x5, [sp, #16]
   e0bbc:	f90007e6 	str	x6, [sp, #8]
   e0bc0:	b9004fff 	str	wzr, [sp, #76]
   e0bc4:	1400000d 	b	e0bf8 <example10b+0x58>
   e0bc8:	f9401fe0 	ldr	x0, [sp, #56]
   e0bcc:	b9804fe1 	ldrsw	x1, [sp, #76]
   e0bd0:	91200021 	add	x1, x1, #0x800
   e0bd4:	78e17800 	ldrsh	w0, [x0, x1, lsl #1]
   e0bd8:	2a0003e2 	mov	w2, w0
   e0bdc:	f9401fe0 	ldr	x0, [sp, #56]
   e0be0:	b9804fe1 	ldrsw	x1, [sp, #76]
   e0be4:	91300021 	add	x1, x1, #0xc00
   e0be8:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0bec:	b9404fe0 	ldr	w0, [sp, #76]
   e0bf0:	11000400 	add	w0, w0, #0x1
   e0bf4:	b9004fe0 	str	w0, [sp, #76]
   e0bf8:	b9404fe0 	ldr	w0, [sp, #76]
   e0bfc:	710ffc1f 	cmp	w0, #0x3ff
   e0c00:	54fffe4d 	b.le	e0bc8 <example10b+0x28>
   e0c04:	d503201f 	nop
   e0c08:	d503201f 	nop
   e0c0c:	910143ff 	add	sp, sp, #0x50
   e0c10:	d65f03c0 	ret

00000000000e0c14 <example11>:
   e0c14:	d10083ff 	sub	sp, sp, #0x20
   e0c18:	f90007e0 	str	x0, [sp, #8]
   e0c1c:	b9001fff 	str	wzr, [sp, #28]
   e0c20:	1400004b 	b	e0d4c <example11+0x138>
   e0c24:	b9401fe0 	ldr	w0, [sp, #28]
   e0c28:	531f7800 	lsl	w0, w0, #1
   e0c2c:	11000401 	add	w1, w0, #0x1
   e0c30:	f94007e0 	ldr	x0, [sp, #8]
   e0c34:	93407c21 	sxtw	x1, w1
   e0c38:	91400c21 	add	x1, x1, #0x3, lsl #12
   e0c3c:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e0c40:	b9401fe0 	ldr	w0, [sp, #28]
   e0c44:	531f7800 	lsl	w0, w0, #1
   e0c48:	11000402 	add	w2, w0, #0x1
   e0c4c:	f94007e0 	ldr	x0, [sp, #8]
   e0c50:	93407c43 	sxtw	x3, w2
   e0c54:	d2870002 	mov	x2, #0x3800                	// #14336
   e0c58:	8b020062 	add	x2, x3, x2
   e0c5c:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e0c60:	1b007c21 	mul	w1, w1, w0
   e0c64:	b9401fe0 	ldr	w0, [sp, #28]
   e0c68:	531f7802 	lsl	w2, w0, #1
   e0c6c:	f94007e0 	ldr	x0, [sp, #8]
   e0c70:	93407c42 	sxtw	x2, w2
   e0c74:	91400c42 	add	x2, x2, #0x3, lsl #12
   e0c78:	b8627802 	ldr	w2, [x0, x2, lsl #2]
   e0c7c:	b9401fe0 	ldr	w0, [sp, #28]
   e0c80:	531f7803 	lsl	w3, w0, #1
   e0c84:	f94007e0 	ldr	x0, [sp, #8]
   e0c88:	93407c64 	sxtw	x4, w3
   e0c8c:	d2870003 	mov	x3, #0x3800                	// #14336
   e0c90:	8b030083 	add	x3, x4, x3
   e0c94:	b8637800 	ldr	w0, [x0, x3, lsl #2]
   e0c98:	1b007c40 	mul	w0, w2, w0
   e0c9c:	4b000022 	sub	w2, w1, w0
   e0ca0:	f94007e0 	ldr	x0, [sp, #8]
   e0ca4:	b9801fe3 	ldrsw	x3, [sp, #28]
   e0ca8:	d2850001 	mov	x1, #0x2800                	// #10240
   e0cac:	8b010061 	add	x1, x3, x1
   e0cb0:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0cb4:	b9401fe0 	ldr	w0, [sp, #28]
   e0cb8:	531f7801 	lsl	w1, w0, #1
   e0cbc:	f94007e0 	ldr	x0, [sp, #8]
   e0cc0:	93407c21 	sxtw	x1, w1
   e0cc4:	91400c21 	add	x1, x1, #0x3, lsl #12
   e0cc8:	b8617801 	ldr	w1, [x0, x1, lsl #2]
   e0ccc:	b9401fe0 	ldr	w0, [sp, #28]
   e0cd0:	531f7800 	lsl	w0, w0, #1
   e0cd4:	11000402 	add	w2, w0, #0x1
   e0cd8:	f94007e0 	ldr	x0, [sp, #8]
   e0cdc:	93407c43 	sxtw	x3, w2
   e0ce0:	d2870002 	mov	x2, #0x3800                	// #14336
   e0ce4:	8b020062 	add	x2, x3, x2
   e0ce8:	b8627800 	ldr	w0, [x0, x2, lsl #2]
   e0cec:	1b007c21 	mul	w1, w1, w0
   e0cf0:	b9401fe0 	ldr	w0, [sp, #28]
   e0cf4:	531f7800 	lsl	w0, w0, #1
   e0cf8:	11000402 	add	w2, w0, #0x1
   e0cfc:	f94007e0 	ldr	x0, [sp, #8]
   e0d00:	93407c42 	sxtw	x2, w2
   e0d04:	91400c42 	add	x2, x2, #0x3, lsl #12
   e0d08:	b8627802 	ldr	w2, [x0, x2, lsl #2]
   e0d0c:	b9401fe0 	ldr	w0, [sp, #28]
   e0d10:	531f7803 	lsl	w3, w0, #1
   e0d14:	f94007e0 	ldr	x0, [sp, #8]
   e0d18:	93407c64 	sxtw	x4, w3
   e0d1c:	d2870003 	mov	x3, #0x3800                	// #14336
   e0d20:	8b030083 	add	x3, x4, x3
   e0d24:	b8637800 	ldr	w0, [x0, x3, lsl #2]
   e0d28:	1b007c40 	mul	w0, w2, w0
   e0d2c:	0b000022 	add	w2, w1, w0
   e0d30:	f94007e0 	ldr	x0, [sp, #8]
   e0d34:	b9801fe1 	ldrsw	x1, [sp, #28]
   e0d38:	91401021 	add	x1, x1, #0x4, lsl #12
   e0d3c:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0d40:	b9401fe0 	ldr	w0, [sp, #28]
   e0d44:	11000400 	add	w0, w0, #0x1
   e0d48:	b9001fe0 	str	w0, [sp, #28]
   e0d4c:	b9401fe0 	ldr	w0, [sp, #28]
   e0d50:	7107fc1f 	cmp	w0, #0x1ff
   e0d54:	54fff68d 	b.le	e0c24 <example11+0x10>
   e0d58:	d503201f 	nop
   e0d5c:	d503201f 	nop
   e0d60:	910083ff 	add	sp, sp, #0x20
   e0d64:	d65f03c0 	ret

00000000000e0d68 <example12>:
   e0d68:	d10083ff 	sub	sp, sp, #0x20
   e0d6c:	f90007e0 	str	x0, [sp, #8]
   e0d70:	b9001fff 	str	wzr, [sp, #28]
   e0d74:	1400000a 	b	e0d9c <example12+0x34>
   e0d78:	f94007e0 	ldr	x0, [sp, #8]
   e0d7c:	b9801fe2 	ldrsw	x2, [sp, #28]
   e0d80:	d2850001 	mov	x1, #0x2800                	// #10240
   e0d84:	8b010041 	add	x1, x2, x1
   e0d88:	b9401fe2 	ldr	w2, [sp, #28]
   e0d8c:	b8217802 	str	w2, [x0, x1, lsl #2]
   e0d90:	b9401fe0 	ldr	w0, [sp, #28]
   e0d94:	11000400 	add	w0, w0, #0x1
   e0d98:	b9001fe0 	str	w0, [sp, #28]
   e0d9c:	b9401fe0 	ldr	w0, [sp, #28]
   e0da0:	710ffc1f 	cmp	w0, #0x3ff
   e0da4:	54fffead 	b.le	e0d78 <example12+0x10>
   e0da8:	d503201f 	nop
   e0dac:	d503201f 	nop
   e0db0:	910083ff 	add	sp, sp, #0x20
   e0db4:	d65f03c0 	ret

00000000000e0db8 <example13>:
   e0db8:	d100c3ff 	sub	sp, sp, #0x30
   e0dbc:	f9000fe0 	str	x0, [sp, #24]
   e0dc0:	f9000be1 	str	x1, [sp, #16]
   e0dc4:	f90007e2 	str	x2, [sp, #8]
   e0dc8:	f90003e3 	str	x3, [sp]
   e0dcc:	b9002fff 	str	wzr, [sp, #44]
   e0dd0:	14000029 	b	e0e74 <example13+0xbc>
   e0dd4:	b90027ff 	str	wzr, [sp, #36]
   e0dd8:	b9002bff 	str	wzr, [sp, #40]
   e0ddc:	1400001a 	b	e0e44 <example13+0x8c>
   e0de0:	b9802fe0 	ldrsw	x0, [sp, #44]
   e0de4:	d37df000 	lsl	x0, x0, #3
   e0de8:	f9400be1 	ldr	x1, [sp, #16]
   e0dec:	8b000020 	add	x0, x1, x0
   e0df0:	f9400001 	ldr	x1, [x0]
   e0df4:	b9802be0 	ldrsw	x0, [sp, #40]
   e0df8:	d37ef400 	lsl	x0, x0, #2
   e0dfc:	8b000020 	add	x0, x1, x0
   e0e00:	b9400001 	ldr	w1, [x0]
   e0e04:	b9802fe0 	ldrsw	x0, [sp, #44]
   e0e08:	d37df000 	lsl	x0, x0, #3
   e0e0c:	f94007e2 	ldr	x2, [sp, #8]
   e0e10:	8b000040 	add	x0, x2, x0
   e0e14:	f9400002 	ldr	x2, [x0]
   e0e18:	b9802be0 	ldrsw	x0, [sp, #40]
   e0e1c:	d37ef400 	lsl	x0, x0, #2
   e0e20:	8b000040 	add	x0, x2, x0
   e0e24:	b9400000 	ldr	w0, [x0]
   e0e28:	4b000020 	sub	w0, w1, w0
   e0e2c:	b94027e1 	ldr	w1, [sp, #36]
   e0e30:	0b000020 	add	w0, w1, w0
   e0e34:	b90027e0 	str	w0, [sp, #36]
   e0e38:	b9402be0 	ldr	w0, [sp, #40]
   e0e3c:	11002000 	add	w0, w0, #0x8
   e0e40:	b9002be0 	str	w0, [sp, #40]
   e0e44:	b9402be0 	ldr	w0, [sp, #40]
   e0e48:	710ffc1f 	cmp	w0, #0x3ff
   e0e4c:	54fffcad 	b.le	e0de0 <example13+0x28>
   e0e50:	b9802fe0 	ldrsw	x0, [sp, #44]
   e0e54:	d37ef400 	lsl	x0, x0, #2
   e0e58:	f94003e1 	ldr	x1, [sp]
   e0e5c:	8b000020 	add	x0, x1, x0
   e0e60:	b94027e1 	ldr	w1, [sp, #36]
   e0e64:	b9000001 	str	w1, [x0]
   e0e68:	b9402fe0 	ldr	w0, [sp, #44]
   e0e6c:	11000400 	add	w0, w0, #0x1
   e0e70:	b9002fe0 	str	w0, [sp, #44]
   e0e74:	b9402fe0 	ldr	w0, [sp, #44]
   e0e78:	71007c1f 	cmp	w0, #0x1f
   e0e7c:	54fffacd 	b.le	e0dd4 <example13+0x1c>
   e0e80:	d503201f 	nop
   e0e84:	d503201f 	nop
   e0e88:	9100c3ff 	add	sp, sp, #0x30
   e0e8c:	d65f03c0 	ret

00000000000e0e90 <example14>:
   e0e90:	d100c3ff 	sub	sp, sp, #0x30
   e0e94:	f9000fe0 	str	x0, [sp, #24]
   e0e98:	f9000be1 	str	x1, [sp, #16]
   e0e9c:	f90007e2 	str	x2, [sp, #8]
   e0ea0:	f90003e3 	str	x3, [sp]
   e0ea4:	b90027ff 	str	wzr, [sp, #36]
   e0ea8:	b9002fff 	str	wzr, [sp, #44]
   e0eac:	14000034 	b	e0f7c <example14+0xec>
   e0eb0:	b90023ff 	str	wzr, [sp, #32]
   e0eb4:	b9002bff 	str	wzr, [sp, #40]
   e0eb8:	14000025 	b	e0f4c <example14+0xbc>
   e0ebc:	b90027ff 	str	wzr, [sp, #36]
   e0ec0:	1400001d 	b	e0f34 <example14+0xa4>
   e0ec4:	b94027e1 	ldr	w1, [sp, #36]
   e0ec8:	b9402fe0 	ldr	w0, [sp, #44]
   e0ecc:	0b000020 	add	w0, w1, w0
   e0ed0:	93407c00 	sxtw	x0, w0
   e0ed4:	d37df000 	lsl	x0, x0, #3
   e0ed8:	f9400be1 	ldr	x1, [sp, #16]
   e0edc:	8b000020 	add	x0, x1, x0
   e0ee0:	f9400001 	ldr	x1, [x0]
   e0ee4:	b9802be0 	ldrsw	x0, [sp, #40]
   e0ee8:	d37ef400 	lsl	x0, x0, #2
   e0eec:	8b000020 	add	x0, x1, x0
   e0ef0:	b9400001 	ldr	w1, [x0]
   e0ef4:	b98027e0 	ldrsw	x0, [sp, #36]
   e0ef8:	d37df000 	lsl	x0, x0, #3
   e0efc:	f94007e2 	ldr	x2, [sp, #8]
   e0f00:	8b000040 	add	x0, x2, x0
   e0f04:	f9400002 	ldr	x2, [x0]
   e0f08:	b9802be0 	ldrsw	x0, [sp, #40]
   e0f0c:	d37ef400 	lsl	x0, x0, #2
   e0f10:	8b000040 	add	x0, x2, x0
   e0f14:	b9400000 	ldr	w0, [x0]
   e0f18:	1b007c20 	mul	w0, w1, w0
   e0f1c:	b94023e1 	ldr	w1, [sp, #32]
   e0f20:	0b000020 	add	w0, w1, w0
   e0f24:	b90023e0 	str	w0, [sp, #32]
   e0f28:	b94027e0 	ldr	w0, [sp, #36]
   e0f2c:	11000400 	add	w0, w0, #0x1
   e0f30:	b90027e0 	str	w0, [sp, #36]
   e0f34:	b94027e0 	ldr	w0, [sp, #36]
   e0f38:	710ffc1f 	cmp	w0, #0x3ff
   e0f3c:	54fffc4d 	b.le	e0ec4 <example14+0x34>
   e0f40:	b9402be0 	ldr	w0, [sp, #40]
   e0f44:	11000400 	add	w0, w0, #0x1
   e0f48:	b9002be0 	str	w0, [sp, #40]
   e0f4c:	b9402be0 	ldr	w0, [sp, #40]
   e0f50:	71007c1f 	cmp	w0, #0x1f
   e0f54:	54fffb4d 	b.le	e0ebc <example14+0x2c>
   e0f58:	b9802fe0 	ldrsw	x0, [sp, #44]
   e0f5c:	d37ef400 	lsl	x0, x0, #2
   e0f60:	f94003e1 	ldr	x1, [sp]
   e0f64:	8b000020 	add	x0, x1, x0
   e0f68:	b94023e1 	ldr	w1, [sp, #32]
   e0f6c:	b9000001 	str	w1, [x0]
   e0f70:	b9402fe0 	ldr	w0, [sp, #44]
   e0f74:	11000400 	add	w0, w0, #0x1
   e0f78:	b9002fe0 	str	w0, [sp, #44]
   e0f7c:	b9402fe0 	ldr	w0, [sp, #44]
   e0f80:	71000c1f 	cmp	w0, #0x3
   e0f84:	54fff96d 	b.le	e0eb0 <example14+0x20>
   e0f88:	d503201f 	nop
   e0f8c:	d503201f 	nop
   e0f90:	9100c3ff 	add	sp, sp, #0x30
   e0f94:	d65f03c0 	ret

00000000000e0f98 <example23>:
   e0f98:	d100c3ff 	sub	sp, sp, #0x30
   e0f9c:	f9000fe0 	str	x0, [sp, #24]
   e0fa0:	f9000be1 	str	x1, [sp, #16]
   e0fa4:	f90007e2 	str	x2, [sp, #8]
   e0fa8:	b9002fff 	str	wzr, [sp, #44]
   e0fac:	1400000e 	b	e0fe4 <example23+0x4c>
   e0fb0:	f9400be0 	ldr	x0, [sp, #16]
   e0fb4:	91000801 	add	x1, x0, #0x2
   e0fb8:	f9000be1 	str	x1, [sp, #16]
   e0fbc:	79400000 	ldrh	w0, [x0]
   e0fc0:	2a0003e2 	mov	w2, w0
   e0fc4:	f94007e0 	ldr	x0, [sp, #8]
   e0fc8:	91001001 	add	x1, x0, #0x4
   e0fcc:	f90007e1 	str	x1, [sp, #8]
   e0fd0:	53196041 	lsl	w1, w2, #7
   e0fd4:	b9000001 	str	w1, [x0]
   e0fd8:	b9402fe0 	ldr	w0, [sp, #44]
   e0fdc:	11000400 	add	w0, w0, #0x1
   e0fe0:	b9002fe0 	str	w0, [sp, #44]
   e0fe4:	b9402fe0 	ldr	w0, [sp, #44]
   e0fe8:	7103fc1f 	cmp	w0, #0xff
   e0fec:	54fffe2d 	b.le	e0fb0 <example23+0x18>
   e0ff0:	d503201f 	nop
   e0ff4:	d503201f 	nop
   e0ff8:	9100c3ff 	add	sp, sp, #0x30
   e0ffc:	d65f03c0 	ret

00000000000e1000 <init_memory>:
   e1000:	d10083ff 	sub	sp, sp, #0x20
   e1004:	f90007e0 	str	x0, [sp, #8]
   e1008:	f90003e1 	str	x1, [sp]
   e100c:	52800020 	mov	w0, #0x1                   	// #1
   e1010:	39007fe0 	strb	w0, [sp, #31]
   e1014:	14000013 	b	e1060 <init_memory+0x60>
   e1018:	39407fe1 	ldrb	w1, [sp, #31]
   e101c:	2a0103e0 	mov	w0, w1
   e1020:	531d1000 	ubfiz	w0, w0, #3, #5
   e1024:	4b010000 	sub	w0, w0, w1
   e1028:	39007fe0 	strb	w0, [sp, #31]
   e102c:	39407fe1 	ldrb	w1, [sp, #31]
   e1030:	528004e0 	mov	w0, #0x27                  	// #39
   e1034:	4a000020 	eor	w0, w1, w0
   e1038:	39007fe0 	strb	w0, [sp, #31]
   e103c:	39407fe0 	ldrb	w0, [sp, #31]
   e1040:	11000400 	add	w0, w0, #0x1
   e1044:	39007fe0 	strb	w0, [sp, #31]
   e1048:	f94007e0 	ldr	x0, [sp, #8]
   e104c:	39407fe1 	ldrb	w1, [sp, #31]
   e1050:	39000001 	strb	w1, [x0]
   e1054:	f94007e0 	ldr	x0, [sp, #8]
   e1058:	91000400 	add	x0, x0, #0x1
   e105c:	f90007e0 	str	x0, [sp, #8]
   e1060:	f94007e1 	ldr	x1, [sp, #8]
   e1064:	f94003e0 	ldr	x0, [sp]
   e1068:	eb00003f 	cmp	x1, x0
   e106c:	54fffd61 	b.ne	e1018 <init_memory+0x18>  // b.any
   e1070:	d503201f 	nop
   e1074:	d503201f 	nop
   e1078:	910083ff 	add	sp, sp, #0x20
   e107c:	d65f03c0 	ret

00000000000e1080 <digest_memory>:
   e1080:	d10083ff 	sub	sp, sp, #0x20
   e1084:	f90007e0 	str	x0, [sp, #8]
   e1088:	f90003e1 	str	x1, [sp]
   e108c:	52800020 	mov	w0, #0x1                   	// #1
   e1090:	b9001fe0 	str	w0, [sp, #28]
   e1094:	14000015 	b	e10e8 <digest_memory+0x68>
   e1098:	b9401fe1 	ldr	w1, [sp, #28]
   e109c:	2a0103e0 	mov	w0, w1
   e10a0:	531f7800 	lsl	w0, w0, #1
   e10a4:	0b010000 	add	w0, w0, w1
   e10a8:	b9001fe0 	str	w0, [sp, #28]
   e10ac:	f94007e0 	ldr	x0, [sp, #8]
   e10b0:	39400000 	ldrb	w0, [x0]
   e10b4:	2a0003e1 	mov	w1, w0
   e10b8:	b9401fe0 	ldr	w0, [sp, #28]
   e10bc:	4a010000 	eor	w0, w0, w1
   e10c0:	b9001fe0 	str	w0, [sp, #28]
   e10c4:	b9401fe0 	ldr	w0, [sp, #28]
   e10c8:	53087c01 	lsr	w1, w0, #8
   e10cc:	b9401fe0 	ldr	w0, [sp, #28]
   e10d0:	53185c00 	lsl	w0, w0, #8
   e10d4:	4a000020 	eor	w0, w1, w0
   e10d8:	b9001fe0 	str	w0, [sp, #28]
   e10dc:	f94007e0 	ldr	x0, [sp, #8]
   e10e0:	91000400 	add	x0, x0, #0x1
   e10e4:	f90007e0 	str	x0, [sp, #8]
   e10e8:	f94007e1 	ldr	x1, [sp, #8]
   e10ec:	f94003e0 	ldr	x0, [sp]
   e10f0:	eb00003f 	cmp	x1, x0
   e10f4:	54fffd21 	b.ne	e1098 <digest_memory+0x18>  // b.any
   e10f8:	b9401fe0 	ldr	w0, [sp, #28]
   e10fc:	910083ff 	add	sp, sp, #0x20
   e1100:	d65f03c0 	ret

00000000000e1104 <memcpy>:
   e1104:	d100c3ff 	sub	sp, sp, #0x30
   e1108:	f9000fe0 	str	x0, [sp, #24]
   e110c:	f9000be1 	str	x1, [sp, #16]
   e1110:	f90007e2 	str	x2, [sp, #8]
   e1114:	f90017ff 	str	xzr, [sp, #40]
   e1118:	1400000c 	b	e1148 <memcpy+0x44>
   e111c:	f9400be1 	ldr	x1, [sp, #16]
   e1120:	f94017e0 	ldr	x0, [sp, #40]
   e1124:	8b000021 	add	x1, x1, x0
   e1128:	f9400fe2 	ldr	x2, [sp, #24]
   e112c:	f94017e0 	ldr	x0, [sp, #40]
   e1130:	8b000040 	add	x0, x2, x0
   e1134:	39400021 	ldrb	w1, [x1]
   e1138:	39000001 	strb	w1, [x0]
   e113c:	f94017e0 	ldr	x0, [sp, #40]
   e1140:	91000400 	add	x0, x0, #0x1
   e1144:	f90017e0 	str	x0, [sp, #40]
   e1148:	f94017e1 	ldr	x1, [sp, #40]
   e114c:	f94007e0 	ldr	x0, [sp, #8]
   e1150:	eb00003f 	cmp	x1, x0
   e1154:	54fffe41 	b.ne	e111c <memcpy+0x18>  // b.any
   e1158:	f9400fe0 	ldr	x0, [sp, #24]
   e115c:	9100c3ff 	add	sp, sp, #0x30
   e1160:	d65f03c0 	ret

00000000000e1164 <memset>:
   e1164:	d100c3ff 	sub	sp, sp, #0x30
   e1168:	f9000fe0 	str	x0, [sp, #24]
   e116c:	b90017e1 	str	w1, [sp, #20]
   e1170:	f90007e2 	str	x2, [sp, #8]
   e1174:	f90017ff 	str	xzr, [sp, #40]
   e1178:	1400000a 	b	e11a0 <memset+0x3c>
   e117c:	f9400fe1 	ldr	x1, [sp, #24]
   e1180:	f94017e0 	ldr	x0, [sp, #40]
   e1184:	8b000020 	add	x0, x1, x0
   e1188:	b94017e1 	ldr	w1, [sp, #20]
   e118c:	12001c21 	and	w1, w1, #0xff
   e1190:	39000001 	strb	w1, [x0]
   e1194:	f94017e0 	ldr	x0, [sp, #40]
   e1198:	91000400 	add	x0, x0, #0x1
   e119c:	f90017e0 	str	x0, [sp, #40]
   e11a0:	f94017e1 	ldr	x1, [sp, #40]
   e11a4:	f94007e0 	ldr	x0, [sp, #8]
   e11a8:	eb00003f 	cmp	x1, x0
   e11ac:	54fffe81 	b.ne	e117c <memset+0x18>  // b.any
   e11b0:	f9400fe0 	ldr	x0, [sp, #24]
   e11b4:	9100c3ff 	add	sp, sp, #0x30
   e11b8:	d65f03c0 	ret

00000000000e11bc <memmove>:
   e11bc:	d100c3ff 	sub	sp, sp, #0x30
   e11c0:	f9000fe0 	str	x0, [sp, #24]
   e11c4:	f9000be1 	str	x1, [sp, #16]
   e11c8:	f90007e2 	str	x2, [sp, #8]
   e11cc:	f94007e0 	ldr	x0, [sp, #8]
   e11d0:	f90017e0 	str	x0, [sp, #40]
   e11d4:	1400000e 	b	e120c <memmove+0x50>
   e11d8:	f94017e0 	ldr	x0, [sp, #40]
   e11dc:	d1000400 	sub	x0, x0, #0x1
   e11e0:	f9400be1 	ldr	x1, [sp, #16]
   e11e4:	8b000021 	add	x1, x1, x0
   e11e8:	f94017e0 	ldr	x0, [sp, #40]
   e11ec:	d1000400 	sub	x0, x0, #0x1
   e11f0:	f9400fe2 	ldr	x2, [sp, #24]
   e11f4:	8b000040 	add	x0, x2, x0
   e11f8:	39400021 	ldrb	w1, [x1]
   e11fc:	39000001 	strb	w1, [x0]
   e1200:	f94017e0 	ldr	x0, [sp, #40]
   e1204:	d1000400 	sub	x0, x0, #0x1
   e1208:	f90017e0 	str	x0, [sp, #40]
   e120c:	f94017e0 	ldr	x0, [sp, #40]
   e1210:	f100001f 	cmp	x0, #0x0
   e1214:	54fffe21 	b.ne	e11d8 <memmove+0x1c>  // b.any
   e1218:	f9400fe0 	ldr	x0, [sp, #24]
   e121c:	9100c3ff 	add	sp, sp, #0x30
   e1220:	d65f03c0 	ret
