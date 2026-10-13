;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module Fade
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _FadeStepColor
	.globl _UpdateColor
	.globl _SyncVBlank
	.globl _set_palette
	.globl _ZGB_Fading_SPal
	.globl _ZGB_Fading_BPal
	.globl b_FadeIn
	.globl _FadeIn
	.globl b_FadeOut
	.globl _FadeOut
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_GG_STATE	=	0x0000
_GG_EXT_7BIT	=	0x0001
_GG_EXT_CTL	=	0x0002
_GG_SIO_SEND	=	0x0003
_GG_SIO_RECV	=	0x0004
_GG_SIO_CTL	=	0x0005
_GG_SOUND_PAN	=	0x0006
_MEMORY_CTL	=	0x003e
_JOY_CTL	=	0x003f
_VCOUNTER	=	0x007e
_PSG	=	0x007f
_HCOUNTER	=	0x007f
_VDP_DATA	=	0x00be
_VDP_CMD	=	0x00bf
_VDP_STATUS	=	0x00bf
_JOY_PORT1	=	0x00dc
_JOY_PORT2	=	0x00dd
_FMADDRESS	=	0x00f0
_FMDATA	=	0x00f1
_AUDIOCTRL	=	0x00f2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_RAM_CONTROL	=	0xfffc
_GLASSES_3D	=	0xfff8
_MAP_FRAME0	=	0xfffd
_MAP_FRAME1	=	0xfffe
_MAP_FRAME2	=	0xffff
_ZGB_Fading_BPal::
	.ds 16
_ZGB_Fading_SPal::
	.ds 16
_FadeStepColor_palette_10000_252:
	.ds 16
_FadeStepColor_palette_s_10000_252:
	.ds 16
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_1
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:11: palette_color_t UpdateColor(UINT8 i, palette_color_t col) {
;	---------------------------------
; Function UpdateColor
; ---------------------------------
_UpdateColor::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-10
	add	iy, sp
	ld	sp, iy
	ld	b, a
	ld	-1 (ix), l
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:14: tmp = PAL_RED(ZGB_Fading_SPal[0]); 
	ld	de, #_ZGB_Fading_SPal+0
	ld	a, (de)
	ld	-2 (ix), a
	and	a, #0x03
	ld	c, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:15: INT8 R = PAL_RED(col); 
	ld	a, -1 (ix)
	and	a, #0x03
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:16: R = (R > tmp) ? MAX(tmp, R - i) : MIN(tmp, R + i);
	ld	e, a
	ld	-4 (ix), a
	rlca
	sbc	a, a
	ld	-3 (ix), a
	ld	-10 (ix), b
	ld	-9 (ix), #0x00
	ld	a, c
	ld	l, a
	rlca
	sbc	a, a
	ld	h, a
	ld	-8 (ix), b
	ld	a, c
	sub	a, e
	jr	NC, 00103$
	ld	a, -4 (ix)
	sub	a, -10 (ix)
	ld	b, a
	sbc	a, a
	sub	a, -9 (ix)
	ld	d, a
	ld	a, b
	sub	a, l
	ld	a, d
	sbc	a, h
	jp	PO, 00184$
	xor	a, #0x80
00184$:
	jp	P, 00105$
	jr	00104$
00105$:
	ld	a, e
	sub	a, -8 (ix)
	ld	c, a
	jr	00104$
00103$:
	ld	a, -10 (ix)
	add	a, -4 (ix)
	ld	b, a
	ld	a, #0x00
	adc	a, -3 (ix)
	ld	d, a
	ld	a, l
	sub	a, b
	ld	a, h
	sbc	a, d
	jr	C, 00108$
	ld	a, -8 (ix)
	add	a, e
	ld	c, a
00108$:
00104$:
	ld	-7 (ix), c
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:18: tmp = PAL_GREEN(ZGB_Fading_SPal[0]);
	ld	a, -2 (ix)
	rrca
	rrca
	and	a, #0x3
	ld	b, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:19: INT8 G = PAL_GREEN(col); 
	ld	a, -1 (ix)
	rrca
	rrca
	and	a, #0x3
	ld	c, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:16: R = (R > tmp) ? MAX(tmp, R - i) : MIN(tmp, R + i);
	ld	a, b
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:20: G = (G > tmp) ? MAX(tmp, G - i) : MIN(tmp, G + i);
	ld	a, c
	ld	l, a
	rlca
	sbc	a, a
	ld	h, a
	ld	a, b
	sub	a, c
	jr	NC, 00109$
	ld	a, l
	sub	a, -10 (ix)
	ld	l, a
	sbc	a, a
	sub	a, -9 (ix)
	ld	h, a
	ld	a, l
	sub	a, e
	ld	a, h
	sbc	a, d
	jp	PO, 00185$
	xor	a, #0x80
00185$:
	jp	P, 00111$
	jr	00110$
00111$:
	ld	a, c
	sub	a, -8 (ix)
	ld	b, a
	jr	00110$
00109$:
	ld	a, l
	add	a, -10 (ix)
	ld	l, a
	jr	NC, 00186$
	inc	h
00186$:
	ld	a, e
	sub	a, l
	ld	a, d
	sbc	a, h
	jr	C, 00114$
	ld	a, c
	add	a, -8 (ix)
	ld	b, a
00114$:
00110$:
	ld	-6 (ix), b
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:22: tmp = PAL_BLUE(ZGB_Fading_SPal[0]);
	ld	a, -2 (ix)
	rlca
	rlca
	rlca
	rlca
	and	a, #0x3
	ld	c, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:23: INT8 B = PAL_BLUE(col);
	ld	a, -1 (ix)
	rlca
	rlca
	rlca
	rlca
	and	a, #0x3
	ld	e, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:16: R = (R > tmp) ? MAX(tmp, R - i) : MIN(tmp, R + i);
	ld	a, c
	ld	-5 (ix), a
	rlca
	sbc	a, a
	ld	-4 (ix), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:24: B = (B > tmp) ? MAX(tmp, B - i) : MIN(tmp, B + i);
	ld	a, e
	ld	-3 (ix), a
	rlca
	sbc	a, a
	ld	-2 (ix), a
	ld	a, c
	sub	a, e
	jr	NC, 00115$
	ld	a, -3 (ix)
	sub	a, -10 (ix)
	ld	b, a
	sbc	a, a
	sub	a, -9 (ix)
	ld	d, a
	ld	a, b
	sub	a, -5 (ix)
	ld	a, d
	sbc	a, -4 (ix)
	jp	PO, 00187$
	xor	a, #0x80
00187$:
	jp	P, 00117$
	jr	00116$
00117$:
	ld	a, e
	sub	a, -8 (ix)
	ld	c, a
	jr	00116$
00115$:
	ld	a, -3 (ix)
	add	a, -10 (ix)
	ld	b, a
	ld	a, #0x00
	adc	a, -9 (ix)
	ld	d, a
	ld	a, -5 (ix)
	sub	a, b
	ld	a, #0x00
	sbc	a, d
	jr	C, 00120$
	ld	a, e
	add	a, -8 (ix)
	ld	c, a
00120$:
00116$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:26: return RGB(R, G, B);
	ld	a, -6 (ix)
	add	a, a
	add	a, a
	or	a, -7 (ix)
	ld	b, a
	ld	a, c
	add	a, a
	add	a, a
	add	a, a
	add	a, a
	or	a, b
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:27: }
	ld	sp, ix
	pop	ix
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:29: void FadeStepColor(UINT8 i) {
;	---------------------------------
; Function FadeStepColor
; ---------------------------------
_FadeStepColor::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	ld	-1 (ix), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:33: for (palette_color_t *src = ZGB_Fading_BPal, *dest = palette; src < ZGB_Fading_BPal + 16; ) {
	ld	bc, #_ZGB_Fading_BPal
	ld	de, #_FadeStepColor_palette_10000_252
00107$:
	ld	a, c
	sub	a, #<((_ZGB_Fading_BPal + 16))
	ld	a, b
	sbc	a, #>((_ZGB_Fading_BPal + 16))
	jr	NC, 00101$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:34: *dest++ = UpdateColor(i, *src++);
	ld	a, (bc)
	inc	bc
	push	bc
	push	de
	ld	l, a
	ld	a, -1 (ix)
	call	_UpdateColor
	pop	de
	pop	bc
	ld	(de), a
	inc	de
	jr	00107$
00101$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:36: for (palette_color_t *src = ZGB_Fading_SPal, *dest = palette_s; src < ZGB_Fading_SPal + 16; ) {
	ld	bc, #_ZGB_Fading_SPal
	ld	de, #_FadeStepColor_palette_s_10000_252
00110$:
	ld	a, c
	sub	a, #<((_ZGB_Fading_SPal + 16))
	ld	a, b
	sbc	a, #>((_ZGB_Fading_SPal + 16))
	jr	NC, 00103$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:37: *dest++ = UpdateColor(i, *src++);
	ld	a, (bc)
	inc	bc
	push	bc
	push	de
	ld	l, a
	ld	a, -1 (ix)
	call	_UpdateColor
	pop	de
	pop	bc
	ld	(de), a
	inc	de
	jr	00110$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:40: WAIT_WRITABLE_CRAM;	// avoid snow on screen
00103$:
	in	a, (_VCOUNTER)
	sub	a, #0xd8
	jr	C, 00103$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:42: set_bkg_palette(0, 1, palette);
	ld	hl, #_FadeStepColor_palette_10000_252
	push	hl
	ld	hl, #0x100
	push	hl
	call	_set_palette
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:43: set_sprite_palette(0, 1, palette_s);
	ld	hl, #_FadeStepColor_palette_s_10000_252
	push	hl
	ld	hl, #0x101
	push	hl
	call	_set_palette
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:45: DISPLAY_ON;
	ld	a, (_shadow_VDP_R1+0)
	or	a, #0x40
	ld	(_shadow_VDP_R1+0), a
	di
	ld	a, (_shadow_VDP_R1+0)
	out	(_VDP_CMD), a
	ld	a, #0x81
	out	(_VDP_CMD), a
	ei
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:46: SyncVBlank();
	call	_SyncVBlank
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:47: SyncVBlank();
	call	_SyncVBlank
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:48: }
	inc	sp
	pop	ix
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:50: void FadeIn(void) BANKED {
;	---------------------------------
; Function FadeIn
; ---------------------------------
	b_FadeIn	= 1
_FadeIn::
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:51: FadeStepColor(0);
	xor	a, a
	call	_FadeStepColor
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:52: FadeStepColor(1);
	ld	a, #0x01
	call	_FadeStepColor
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:53: FadeStepColor(2);
	ld	a, #0x02
	call	_FadeStepColor
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:54: FadeStepColor(3);
	ld	a, #0x03
	call	_FadeStepColor
;c:\users\karas\onedrive\documents\github\gbdk\include\sms\sms.h:254: __WRITE_VDP_REG(VDP_R1, __READ_VDP_REG(VDP_R1) &= (~R1_DISP_ON));
	ld	a, (_shadow_VDP_R1+0)
	and	a, #0xbf
	ld	(_shadow_VDP_R1+0), a
	di
	ld	a, (_shadow_VDP_R1+0)
	out	(_VDP_CMD), a
	ld	a, #0x81
	out	(_VDP_CMD), a
	ei
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:55: DISPLAY_OFF;
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:56: }
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:58: void FadeOut(void) BANKED {
;	---------------------------------
; Function FadeOut
; ---------------------------------
	b_FadeOut	= 1
_FadeOut::
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:59: FadeStepColor(3);
	ld	a, #0x03
	call	_FadeStepColor
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:60: FadeStepColor(2);
	ld	a, #0x02
	call	_FadeStepColor
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:61: FadeStepColor(1);
	ld	a, #0x01
	call	_FadeStepColor
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:62: FadeStepColor(0);
	xor	a, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/sms/Fade.c:63: }
	jp	_FadeStepColor
	.area _CODE_1
	.area _INITIALIZER
	.area _CABS (ABS)
