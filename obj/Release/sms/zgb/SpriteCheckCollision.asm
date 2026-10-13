;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module SpriteCheckCollision
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _CheckCollision
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
	.area _CODE
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteCheckCollision.c:12: UINT8 CheckCollision(Sprite* sprite1, Sprite* sprite2) NAKED {
;	---------------------------------
; Function CheckCollision
; ---------------------------------
_CheckCollision::
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteCheckCollision.c:78: __endasm;
	.ez80
	push	ix
	ld	iyh, d
	ld	iyl, e ; iy: sprite2
	ex	de, hl
	ld	ixh, d
	ld	ixl, e ; ix: sprite1
;if	((sprite1->x + sprite1->coll_w) < sprite2->x) return 0;
	ld	e, ___offset_Sprite__x+0(ix)
	ld	d, ___offset_Sprite__x+1(ix)
	ld	h, #0
	ld	l, ___offset_Sprite__coll_w(ix)
	add	hl, de
	ld	c, ___offset_Sprite__x+0(iy)
	ld	b, ___offset_Sprite__x+1(iy)
	xor	a
	sbc	hl, bc
	jp	c, 0$ ; return 0
;if	((sprite2->x + sprite2->coll_w) < sprite1->x) return 0;
	ld	h, a
	ld	l, ___offset_Sprite__coll_w(iy)
	add	hl, bc
	xor	a
	sbc	hl, de
	jp	c, 0$ ; return 0
;if	((sprite1->y + sprite1->coll_h) < sprite2->y) return 0;
	ld	e, ___offset_Sprite__y+0(ix)
	ld	d, ___offset_Sprite__y+1(ix)
	ld	h, a
	ld	l, ___offset_Sprite__coll_h(ix)
	add	hl, de
	ld	c, ___offset_Sprite__y+0(iy)
	ld	b, ___offset_Sprite__y+1(iy)
	xor	a
	sbc	hl, bc
	jp	c, 0$ ; return 0
;if	((sprite2->y + sprite2->coll_h) < sprite1->y) return 0;
	ld	h, a
	ld	l, ___offset_Sprite__coll_h(iy)
	add	hl, bc
	xor	a
	sbc	hl, de
	jp	c, 0$ ; return 0
	inc	a ; return 1
0$:
	pop	ix
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteCheckCollision.c:79: }
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
