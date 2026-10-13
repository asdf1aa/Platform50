;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module DefAnimHandler
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _GetSpriteAnimation
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
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/DefAnimHandler.c:9: const metasprite_t * GetSpriteAnimation(Sprite * sprite, UINT16 anim_idx) NAKED {
;	---------------------------------
; Function GetSpriteAnimation
; ---------------------------------
_GetSpriteAnimation::
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/DefAnimHandler.c:40: __endasm;
	.ez80
	ex	de, hl
	ld	iyl, e
	ld	iyh, d
	ld	a, (_MAP_FRAME1)
	ld	c, a
	ld	a, ___offset_Sprite__mt_sprite_bank(iy)
	ld	(_MAP_FRAME1), a
	ld	e, ___offset_Sprite__mt_sprite_info+0(iy)
	ld	d, ___offset_Sprite__mt_sprite_info+1(iy)
	ld	iyl, e
	ld	iyh, d
	ld	e, ___offset_MetaSpriteInfo__metasprites+0(iy)
	ld	d, ___offset_MetaSpriteInfo__metasprites+1(iy)
	ex	de, hl
	add	hl, de
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, c
	ld	(_MAP_FRAME1), a
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/DefAnimHandler.c:41: }
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
