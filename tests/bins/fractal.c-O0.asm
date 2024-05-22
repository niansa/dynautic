
fractal.c.elf:     file format elf64-littleaarch64


Disassembly of section .start:

00000000000e0000 <_start>:
   e0000:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
   e0004:	910003fd 	mov	x29, sp
   e0008:	f90027ff 	str	xzr, [sp, #72]
   e000c:	52800400 	mov	w0, #0x20                  	// #32
   e0010:	b9003be0 	str	w0, [sp, #56]
   e0014:	528002c0 	mov	w0, #0x16                  	// #22
   e0018:	b90037e0 	str	w0, [sp, #52]
   e001c:	52800060 	mov	w0, #0x3                   	// #3
   e0020:	b90033e0 	str	w0, [sp, #48]
   e0024:	528000c0 	mov	w0, #0x6                   	// #6
   e0028:	79005fe0 	strh	w0, [sp, #46]
   e002c:	52801c01 	mov	w1, #0xe0                  	// #224
   e0030:	b94033e0 	ldr	w0, [sp, #48]
   e0034:	1ac00c20 	sdiv	w0, w1, w0
   e0038:	79005be0 	strh	w0, [sp, #44]
   e003c:	52801200 	mov	w0, #0x90                  	// #144
   e0040:	790057e0 	strh	w0, [sp, #42]
   e0044:	52801801 	mov	w1, #0xc0                  	// #192
   e0048:	b94033e0 	ldr	w0, [sp, #48]
   e004c:	1ac00c20 	sdiv	w0, w1, w0
   e0050:	790053e0 	strh	w0, [sp, #40]
   e0054:	52800c00 	mov	w0, #0x60                  	// #96
   e0058:	79004fe0 	strh	w0, [sp, #38]
   e005c:	52802000 	mov	w0, #0x100                 	// #256
   e0060:	79004be0 	strh	w0, [sp, #36]
   e0064:	52800260 	mov	w0, #0x13                  	// #19
   e0068:	790047e0 	strh	w0, [sp, #34]
   e006c:	79008fff 	strh	wzr, [sp, #70]
   e0070:	1400008c 	b	e02a0 <_start+0x2a0>
   e0074:	79008bff 	strh	wzr, [sp, #68]
   e0078:	14000080 	b	e0278 <_start+0x278>
   e007c:	79408be1 	ldrh	w1, [sp, #68]
   e0080:	79405be0 	ldrh	w0, [sp, #44]
   e0084:	1b007c20 	mul	w0, w1, w0
   e0088:	12003c00 	and	w0, w0, #0xffff
   e008c:	13003c00 	sxth	w0, w0
   e0090:	9400008d 	bl	e02c4 <s>
   e0094:	13003c00 	sxth	w0, w0
   e0098:	2a0003e1 	mov	w1, w0
   e009c:	b9403be0 	ldr	w0, [sp, #56]
   e00a0:	1ac00c20 	sdiv	w0, w1, w0
   e00a4:	13003c00 	sxth	w0, w0
   e00a8:	94000087 	bl	e02c4 <s>
   e00ac:	13003c00 	sxth	w0, w0
   e00b0:	12003c01 	and	w1, w0, #0xffff
   e00b4:	794057e0 	ldrh	w0, [sp, #42]
   e00b8:	4b000020 	sub	w0, w1, w0
   e00bc:	12003c00 	and	w0, w0, #0xffff
   e00c0:	790043e0 	strh	w0, [sp, #32]
   e00c4:	79408fe1 	ldrh	w1, [sp, #70]
   e00c8:	794053e0 	ldrh	w0, [sp, #40]
   e00cc:	1b007c20 	mul	w0, w1, w0
   e00d0:	12003c00 	and	w0, w0, #0xffff
   e00d4:	13003c00 	sxth	w0, w0
   e00d8:	9400007b 	bl	e02c4 <s>
   e00dc:	13003c00 	sxth	w0, w0
   e00e0:	2a0003e1 	mov	w1, w0
   e00e4:	b94037e0 	ldr	w0, [sp, #52]
   e00e8:	1ac00c20 	sdiv	w0, w1, w0
   e00ec:	13003c00 	sxth	w0, w0
   e00f0:	94000075 	bl	e02c4 <s>
   e00f4:	13003c00 	sxth	w0, w0
   e00f8:	12003c01 	and	w1, w0, #0xffff
   e00fc:	79404fe0 	ldrh	w0, [sp, #38]
   e0100:	4b000020 	sub	w0, w1, w0
   e0104:	12003c00 	and	w0, w0, #0xffff
   e0108:	79003fe0 	strh	w0, [sp, #30]
   e010c:	790087ff 	strh	wzr, [sp, #66]
   e0110:	790083ff 	strh	wzr, [sp, #64]
   e0114:	79007fff 	strh	wzr, [sp, #62]
   e0118:	14000048 	b	e0238 <_start+0x238>
   e011c:	794087e1 	ldrh	w1, [sp, #66]
   e0120:	794087e0 	ldrh	w0, [sp, #66]
   e0124:	1b007c20 	mul	w0, w1, w0
   e0128:	12003c00 	and	w0, w0, #0xffff
   e012c:	13003c00 	sxth	w0, w0
   e0130:	94000065 	bl	e02c4 <s>
   e0134:	13003c00 	sxth	w0, w0
   e0138:	2a0003e1 	mov	w1, w0
   e013c:	79c05fe0 	ldrsh	w0, [sp, #46]
   e0140:	1ac02820 	asr	w0, w1, w0
   e0144:	79003be0 	strh	w0, [sp, #28]
   e0148:	794083e1 	ldrh	w1, [sp, #64]
   e014c:	794083e0 	ldrh	w0, [sp, #64]
   e0150:	1b007c20 	mul	w0, w1, w0
   e0154:	12003c00 	and	w0, w0, #0xffff
   e0158:	13003c00 	sxth	w0, w0
   e015c:	9400005a 	bl	e02c4 <s>
   e0160:	13003c00 	sxth	w0, w0
   e0164:	2a0003e1 	mov	w1, w0
   e0168:	79c05fe0 	ldrsh	w0, [sp, #46]
   e016c:	1ac02820 	asr	w0, w1, w0
   e0170:	790037e0 	strh	w0, [sp, #26]
   e0174:	79c03be1 	ldrsh	w1, [sp, #28]
   e0178:	79c037e0 	ldrsh	w0, [sp, #26]
   e017c:	0b000021 	add	w1, w1, w0
   e0180:	79c04be0 	ldrsh	w0, [sp, #36]
   e0184:	6b00003f 	cmp	w1, w0
   e0188:	5400060a 	b.ge	e0248 <_start+0x248>  // b.tcont
   e018c:	79c03be1 	ldrsh	w1, [sp, #28]
   e0190:	79c037e0 	ldrsh	w0, [sp, #26]
   e0194:	0b000020 	add	w0, w1, w0
   e0198:	7100001f 	cmp	w0, #0x0
   e019c:	5400056b 	b.lt	e0248 <_start+0x248>  // b.tstop
   e01a0:	79403be1 	ldrh	w1, [sp, #28]
   e01a4:	794037e0 	ldrh	w0, [sp, #26]
   e01a8:	4b000020 	sub	w0, w1, w0
   e01ac:	12003c01 	and	w1, w0, #0xffff
   e01b0:	794043e0 	ldrh	w0, [sp, #32]
   e01b4:	0b000020 	add	w0, w1, w0
   e01b8:	12003c00 	and	w0, w0, #0xffff
   e01bc:	790033e0 	strh	w0, [sp, #24]
   e01c0:	794087e1 	ldrh	w1, [sp, #66]
   e01c4:	794083e0 	ldrh	w0, [sp, #64]
   e01c8:	1b007c20 	mul	w0, w1, w0
   e01cc:	12003c00 	and	w0, w0, #0xffff
   e01d0:	13003c00 	sxth	w0, w0
   e01d4:	9400003c 	bl	e02c4 <s>
   e01d8:	13003c00 	sxth	w0, w0
   e01dc:	2a0003e1 	mov	w1, w0
   e01e0:	79c05fe0 	ldrsh	w0, [sp, #46]
   e01e4:	1ac02820 	asr	w0, w1, w0
   e01e8:	13003c00 	sxth	w0, w0
   e01ec:	94000036 	bl	e02c4 <s>
   e01f0:	13003c00 	sxth	w0, w0
   e01f4:	12003c00 	and	w0, w0, #0xffff
   e01f8:	531f3800 	ubfiz	w0, w0, #1, #15
   e01fc:	12003c00 	and	w0, w0, #0xffff
   e0200:	13003c00 	sxth	w0, w0
   e0204:	94000030 	bl	e02c4 <s>
   e0208:	13003c00 	sxth	w0, w0
   e020c:	12003c01 	and	w1, w0, #0xffff
   e0210:	79403fe0 	ldrh	w0, [sp, #30]
   e0214:	0b000020 	add	w0, w1, w0
   e0218:	12003c00 	and	w0, w0, #0xffff
   e021c:	790083e0 	strh	w0, [sp, #64]
   e0220:	794033e0 	ldrh	w0, [sp, #24]
   e0224:	790087e0 	strh	w0, [sp, #66]
   e0228:	79407fe0 	ldrh	w0, [sp, #62]
   e022c:	11000400 	add	w0, w0, #0x1
   e0230:	12003c00 	and	w0, w0, #0xffff
   e0234:	79007fe0 	strh	w0, [sp, #62]
   e0238:	79c07fe1 	ldrsh	w1, [sp, #62]
   e023c:	79c047e0 	ldrsh	w0, [sp, #34]
   e0240:	6b00003f 	cmp	w1, w0
   e0244:	54fff6cb 	b.lt	e011c <_start+0x11c>  // b.tstop
   e0248:	79407fe0 	ldrh	w0, [sp, #62]
   e024c:	51000400 	sub	w0, w0, #0x1
   e0250:	12003c00 	and	w0, w0, #0xffff
   e0254:	79007fe0 	strh	w0, [sp, #62]
   e0258:	79807fe0 	ldrsh	x0, [sp, #62]
   e025c:	f94027e1 	ldr	x1, [sp, #72]
   e0260:	8b000020 	add	x0, x1, x0
   e0264:	f90027e0 	str	x0, [sp, #72]
   e0268:	79408be0 	ldrh	w0, [sp, #68]
   e026c:	11000400 	add	w0, w0, #0x1
   e0270:	12003c00 	and	w0, w0, #0xffff
   e0274:	79008be0 	strh	w0, [sp, #68]
   e0278:	79c08be1 	ldrsh	w1, [sp, #68]
   e027c:	b9403be2 	ldr	w2, [sp, #56]
   e0280:	b94033e0 	ldr	w0, [sp, #48]
   e0284:	1b007c40 	mul	w0, w2, w0
   e0288:	6b00003f 	cmp	w1, w0
   e028c:	54ffef8b 	b.lt	e007c <_start+0x7c>  // b.tstop
   e0290:	79408fe0 	ldrh	w0, [sp, #70]
   e0294:	11000400 	add	w0, w0, #0x1
   e0298:	12003c00 	and	w0, w0, #0xffff
   e029c:	79008fe0 	strh	w0, [sp, #70]
   e02a0:	79c08fe1 	ldrsh	w1, [sp, #70]
   e02a4:	b94037e2 	ldr	w2, [sp, #52]
   e02a8:	b94033e0 	ldr	w0, [sp, #48]
   e02ac:	1b007c40 	mul	w0, w2, w0
   e02b0:	6b00003f 	cmp	w1, w0
   e02b4:	54ffee0b 	b.lt	e0074 <_start+0x74>  // b.tstop
   e02b8:	f94027e0 	ldr	x0, [sp, #72]
   e02bc:	a8c57bfd 	ldp	x29, x30, [sp], #80
   e02c0:	d65f03c0 	ret

Disassembly of section .text:

00000000000e02c4 <s>:
   e02c4:	d10043ff 	sub	sp, sp, #0x10
   e02c8:	79001fe0 	strh	w0, [sp, #14]
   e02cc:	79c01fe0 	ldrsh	w0, [sp, #14]
   e02d0:	910043ff 	add	sp, sp, #0x10
   e02d4:	d65f03c0 	ret

00000000000e02d8 <memcpy>:
   e02d8:	d100c3ff 	sub	sp, sp, #0x30
   e02dc:	f9000fe0 	str	x0, [sp, #24]
   e02e0:	f9000be1 	str	x1, [sp, #16]
   e02e4:	f90007e2 	str	x2, [sp, #8]
   e02e8:	f90017ff 	str	xzr, [sp, #40]
   e02ec:	1400000c 	b	e031c <memcpy+0x44>
   e02f0:	f9400be1 	ldr	x1, [sp, #16]
   e02f4:	f94017e0 	ldr	x0, [sp, #40]
   e02f8:	8b000021 	add	x1, x1, x0
   e02fc:	f9400fe2 	ldr	x2, [sp, #24]
   e0300:	f94017e0 	ldr	x0, [sp, #40]
   e0304:	8b000040 	add	x0, x2, x0
   e0308:	39400021 	ldrb	w1, [x1]
   e030c:	39000001 	strb	w1, [x0]
   e0310:	f94017e0 	ldr	x0, [sp, #40]
   e0314:	91000400 	add	x0, x0, #0x1
   e0318:	f90017e0 	str	x0, [sp, #40]
   e031c:	f94017e1 	ldr	x1, [sp, #40]
   e0320:	f94007e0 	ldr	x0, [sp, #8]
   e0324:	eb00003f 	cmp	x1, x0
   e0328:	54fffe41 	b.ne	e02f0 <memcpy+0x18>  // b.any
   e032c:	f9400fe0 	ldr	x0, [sp, #24]
   e0330:	9100c3ff 	add	sp, sp, #0x30
   e0334:	d65f03c0 	ret

00000000000e0338 <memset>:
   e0338:	d100c3ff 	sub	sp, sp, #0x30
   e033c:	f9000fe0 	str	x0, [sp, #24]
   e0340:	b90017e1 	str	w1, [sp, #20]
   e0344:	f90007e2 	str	x2, [sp, #8]
   e0348:	f90017ff 	str	xzr, [sp, #40]
   e034c:	1400000a 	b	e0374 <memset+0x3c>
   e0350:	f9400fe1 	ldr	x1, [sp, #24]
   e0354:	f94017e0 	ldr	x0, [sp, #40]
   e0358:	8b000020 	add	x0, x1, x0
   e035c:	b94017e1 	ldr	w1, [sp, #20]
   e0360:	12001c21 	and	w1, w1, #0xff
   e0364:	39000001 	strb	w1, [x0]
   e0368:	f94017e0 	ldr	x0, [sp, #40]
   e036c:	91000400 	add	x0, x0, #0x1
   e0370:	f90017e0 	str	x0, [sp, #40]
   e0374:	f94017e1 	ldr	x1, [sp, #40]
   e0378:	f94007e0 	ldr	x0, [sp, #8]
   e037c:	eb00003f 	cmp	x1, x0
   e0380:	54fffe81 	b.ne	e0350 <memset+0x18>  // b.any
   e0384:	f9400fe0 	ldr	x0, [sp, #24]
   e0388:	9100c3ff 	add	sp, sp, #0x30
   e038c:	d65f03c0 	ret

00000000000e0390 <memmove>:
   e0390:	d100c3ff 	sub	sp, sp, #0x30
   e0394:	f9000fe0 	str	x0, [sp, #24]
   e0398:	f9000be1 	str	x1, [sp, #16]
   e039c:	f90007e2 	str	x2, [sp, #8]
   e03a0:	f94007e0 	ldr	x0, [sp, #8]
   e03a4:	f90017e0 	str	x0, [sp, #40]
   e03a8:	1400000e 	b	e03e0 <memmove+0x50>
   e03ac:	f94017e0 	ldr	x0, [sp, #40]
   e03b0:	d1000400 	sub	x0, x0, #0x1
   e03b4:	f9400be1 	ldr	x1, [sp, #16]
   e03b8:	8b000021 	add	x1, x1, x0
   e03bc:	f94017e0 	ldr	x0, [sp, #40]
   e03c0:	d1000400 	sub	x0, x0, #0x1
   e03c4:	f9400fe2 	ldr	x2, [sp, #24]
   e03c8:	8b000040 	add	x0, x2, x0
   e03cc:	39400021 	ldrb	w1, [x1]
   e03d0:	39000001 	strb	w1, [x0]
   e03d4:	f94017e0 	ldr	x0, [sp, #40]
   e03d8:	d1000400 	sub	x0, x0, #0x1
   e03dc:	f90017e0 	str	x0, [sp, #40]
   e03e0:	f94017e0 	ldr	x0, [sp, #40]
   e03e4:	f100001f 	cmp	x0, #0x0
   e03e8:	54fffe21 	b.ne	e03ac <memmove+0x1c>  // b.any
   e03ec:	f9400fe0 	ldr	x0, [sp, #24]
   e03f0:	9100c3ff 	add	sp, sp, #0x30
   e03f4:	d65f03c0 	ret
