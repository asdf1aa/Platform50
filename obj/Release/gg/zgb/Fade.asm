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
	.ds 32
_ZGB_Fading_SPal::
	.ds 32
_BR:
	.ds 1
_BB:
	.ds 1
_BG:
	.ds 1
_FadeStepColor_palette_10000_253:
	.ds 32
_FadeStepColor_palette_s_10000_253:
	.ds 32
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
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:12: palette_color_t UpdateColor(UINT8 i, palette_color_t col) {
;	---------------------------------
; Function UpdateColor
; ---------------------------------
_UpdateColor::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:13: if (i == 0) return col;
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:15: if (i == 3) return ZGB_Fading_SPal[0];
	ld	b,a
	or	a,a
	jp	Z,00107$
	sub	a, #0x03
	jr	NZ, 00104$
	ld	de, (#_ZGB_Fading_SPal + 0)
	jp	00107$
00104$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:17: INT8 R = (PAL_RED(col) << 3), G = (PAL_GREEN(col) << 3), B = (PAL_BLUE(col) << 3);
	ld	a, e
	and	a, #0x0f
	add	a, a
	add	a, a
	add	a, a
	ld	c, a
	ld	l, e
	ld	h, d
	srl	h
	rr	l
	srl	h
	rr	l
	srl	h
	rr	l
	srl	h
	rr	l
	ld	a, l
	and	a, #0x0f
	add	a, a
	add	a, a
	add	a, a
	ld	-3 (ix), a
	ld	a, d
	and	a, #0x0f
	add	a, a
	add	a, a
	add	a, a
	ld	d, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:19: INT8 DR = (INT8)(BR - R) >> 2, DG = (INT8)(BG - G) >> 2, DB = (INT8)(BB - B) >> 2;
	ld	a, (_BR+0)
	sub	a, c
	sra	a
	sra	a
	ld	-2 (ix), a
	ld	a, (_BG+0)
	sub	a, -3 (ix)
	ld	e, a
	sra	e
	sra	e
	ld	a, (_BB+0)
	sub	a, d
	sra	a
	sra	a
	ld	-1 (ix), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:21: R += DR, G += DG, B += DB;
	ld	a, c
	add	a, -2 (ix)
	ld	c, a
	ld	a, -3 (ix)
	add	a, e
	ld	l, a
	ld	a, d
	add	a, -1 (ix)
	ld	d, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:22: if (i == 2) R += DR, G += DG, B += DB;
	ld	a, b
	sub	a, #0x02
	jr	NZ, 00106$
	ld	a, c
	add	a, -2 (ix)
	ld	c, a
	add	hl, de
	ld	a, d
	add	a, -1 (ix)
	ld	d, a
00106$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:24: return RGB(R >> 3, G >> 3, B >> 3);
	sra	c
	sra	c
	sra	c
	ld	a, c
	rlca
	sbc	a, a
	ld	b, a
	sra	l
	sra	l
	sra	l
	ld	a, l
	rlca
	sbc	a, a
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	or	a, c
	ld	c, a
	ld	a, h
	or	a, b
	ld	b, a
	ld	a, d
	sra	a
	sra	a
	sra	a
	ld	l, a
	xor	a, a
	or	a, c
	ld	e, a
	ld	a, l
	or	a, b
	ld	d, a
00107$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:25: }
	ld	sp, ix
	pop	ix
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:27: void FadeStepColor(UINT8 i) {
;	---------------------------------
; Function FadeStepColor
; ---------------------------------
_FadeStepColor::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
	ld	-3 (ix), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:31: for (palette_color_t *src = ZGB_Fading_BPal, *dest = palette; src < ZGB_Fading_BPal + 16; ) {
	ld	bc, #_ZGB_Fading_BPal
	ld	-2 (ix), #<(_FadeStepColor_palette_10000_253)
	ld	-1 (ix), #>(_FadeStepColor_palette_10000_253)
00107$:
	ld	a, c
	sub	a, #<((_ZGB_Fading_BPal + 32))
	ld	a, b
	sbc	a, #>((_ZGB_Fading_BPal + 32))
	jr	NC, 00101$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:32: *dest++ = UpdateColor(i, *src++);
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	bc
	inc	bc
	push	bc
	ld	a, -3 (ix)
	call	_UpdateColor
	pop	bc
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
	ld	a, -2 (ix)
	add	a, #0x02
	ld	-2 (ix), a
	jr	NC, 00107$
	inc	-1 (ix)
	jr	00107$
00101$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:34: for (palette_color_t *src = ZGB_Fading_SPal, *dest = palette_s; src < ZGB_Fading_SPal + 16; ) {
	ld	bc, #_ZGB_Fading_SPal
	ld	-2 (ix), #<(_FadeStepColor_palette_s_10000_253)
	ld	-1 (ix), #>(_FadeStepColor_palette_s_10000_253)
00110$:
	ld	a, c
	sub	a, #<((_ZGB_Fading_SPal + 32))
	ld	a, b
	sbc	a, #>((_ZGB_Fading_SPal + 32))
	jr	NC, 00103$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:35: *dest++ = UpdateColor(i, *src++);
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	bc
	inc	bc
	push	bc
	ld	a, -3 (ix)
	call	_UpdateColor
	pop	bc
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
	ld	a, -2 (ix)
	add	a, #0x02
	ld	-2 (ix), a
	jr	NC, 00110$
	inc	-1 (ix)
	jr	00110$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:38: WAIT_WRITABLE_CRAM;	// avoid snow on screen
00103$:
	in	a, (_VCOUNTER)
	sub	a, #0xd8
	jr	C, 00103$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:40: set_bkg_palette(0, 1, palette);
	ld	hl, #_FadeStepColor_palette_10000_253
	push	hl
	ld	hl, #0x100
	push	hl
	call	_set_palette
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:41: set_sprite_palette(0, 1, palette_s);
	ld	hl, #_FadeStepColor_palette_s_10000_253
	push	hl
	ld	hl, #0x101
	push	hl
	call	_set_palette
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:43: DISPLAY_ON;
	ld	a, (_shadow_VDP_R1+0)
	or	a, #0x40
	ld	(_shadow_VDP_R1+0), a
	di
	ld	a, (_shadow_VDP_R1+0)
	out	(_VDP_CMD), a
	ld	a, #0x81
	out	(_VDP_CMD), a
	ei
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:44: SyncVBlank();
	call	_SyncVBlank
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:45: SyncVBlank();
	call	_SyncVBlank
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:46: }
	ld	sp, ix
	pop	ix
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:48: void FadeIn(void) BANKED {
;	---------------------------------
; Function FadeIn
; ---------------------------------
	b_FadeIn	= 1
_FadeIn::
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:49: BR = (PAL_RED(ZGB_Fading_SPal[0]) << 3), BG = (PAL_GREEN(ZGB_Fading_SPal[0]) << 3), BB = (PAL_BLUE(ZGB_Fading_SPal[0]) << 3);
	ld	a, (#_ZGB_Fading_SPal + 0)
	and	a, #0x0f
	add	a, a
	add	a, a
	add	a, a
	ld	(_BR+0), a
	ld	hl, (#_ZGB_Fading_SPal + 0)
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, h
	and	a, #0x0f
	add	a, a
	add	a, a
	add	a, a
	ld	(_BG+0), a
	ld	hl, (#_ZGB_Fading_SPal + 0)
	ld	a, h
	and	a, #0x0f
	add	a, a
	add	a, a
	add	a, a
	ld	(_BB+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:50: FadeStepColor(0);
	xor	a, a
	call	_FadeStepColor
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:51: FadeStepColor(1);
	ld	a, #0x01
	call	_FadeStepColor
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:52: FadeStepColor(2);
	ld	a, #0x02
	call	_FadeStepColor
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:53: FadeStepColor(3);
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
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:54: DISPLAY_OFF;
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:55: }
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:57: void FadeOut(void) BANKED {
;	---------------------------------
; Function FadeOut
; ---------------------------------
	b_FadeOut	= 1
_FadeOut::
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:58: BR = (PAL_RED(ZGB_Fading_SPal[0]) << 3), BG = (PAL_GREEN(ZGB_Fading_SPal[0]) << 3), BB = (PAL_BLUE(ZGB_Fading_SPal[0]) << 3);
	ld	a, (#_ZGB_Fading_SPal + 0)
	and	a, #0x0f
	add	a, a
	add	a, a
	add	a, a
	ld	(_BR+0), a
	ld	hl, (#_ZGB_Fading_SPal + 0)
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, h
	and	a, #0x0f
	add	a, a
	add	a, a
	add	a, a
	ld	(_BG+0), a
	ld	hl, (#_ZGB_Fading_SPal + 0)
	ld	a, h
	and	a, #0x0f
	add	a, a
	add	a, a
	add	a, a
	ld	(_BB+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:59: FadeStepColor(3);
	ld	a, #0x03
	call	_FadeStepColor
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:60: FadeStepColor(2);
	ld	a, #0x02
	call	_FadeStepColor
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:61: FadeStepColor(1);
	ld	a, #0x01
	call	_FadeStepColor
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:62: FadeStepColor(0);
	xor	a, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/gg/Fade.c:63: }
	jp	_FadeStepColor
	.area _CODE_1
	.area _INITIALIZER
	.area _CABS (ABS)
