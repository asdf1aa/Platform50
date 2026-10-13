;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module SpriteRender
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _RenderSprite
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
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteRender.c:11: void RenderSprite(void) NAKED {
;	---------------------------------
; Function RenderSprite
; ---------------------------------
_RenderSprite::
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteRender.c:126: __endasm;
	ld	a, (_MAP_FRAME1)
	push	af
	ld	iy, (_THIS)
	ld	a, ___offset_Sprite__mt_sprite_bank(iy)
	ld	(_MAP_FRAME1), a
	ld	a, (_shadow_VDP_R1)
	and	#0b00000010
	jp	z, 7$
	ld	bc, #-16
	jp	8$
7$:
	ld	bc, #-8
8$:
	ld	l, ___offset_Sprite__mt_sprite+0(iy)
	ld	h, ___offset_Sprite__mt_sprite+1(iy)
	ld	(___current_metasprite), hl
	ld	d, #0
	ld	e, ___offset_Sprite__mirror(iy)
	ld	a, #4
	sub	e
	jp	c, 6$
	ld	hl, #0$
	add	hl, de
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	jp	(hl)
0$:
	.dw	1$
	.dw	2$
	.dw	3$
	.dw	4$
	.dw	4$
1$:
	ld	a, ___offset_Sprite__first_tile(iy)
	ld	(___current_base_tile), a
	ld	de, (_sprite_screen_y)
	push	de
	ld	de, (_sprite_screen_x)
	ld	a, (_next_oam_idx)
	call	___move_metasprite
	jp	5$
2$:
	ld	a, ___offset_Sprite__first_tile_H(iy)
	ld	(___current_base_tile), a
	ld	hl, (_sprite_screen_y)
	ld	d, #0
	ld	e, ___offset_Sprite__coll_h+0(iy)
	add	hl, de
	add	hl, bc
	push	hl
	ld	de, (_sprite_screen_x)
	ld	a, (_next_oam_idx)
	call	___move_metasprite_flipy
	jp	5$
3$:
	ld	a, ___offset_Sprite__first_tile_V(iy)
	ld	(___current_base_tile), a
	ld	de, (_sprite_screen_y)
	push	de
	ld	hl, (_sprite_screen_x)
	ld	d, #0
	ld	e, ___offset_Sprite__coll_w+0(iy)
	add	hl, de
	ld	de, #-8
	add	hl, de
	ex	de, hl
	ld	a, (_next_oam_idx)
	call	___move_metasprite_flipx
	jp	5$
4$:
	ld	a, ___offset_Sprite__first_tile_HV(iy)
	ld	(___current_base_tile), a
	ld	hl, (_sprite_screen_y)
	ld	d, #0
	ld	e, ___offset_Sprite__coll_h+0(iy)
	add	hl, de
	add	hl, bc
	push	hl
	ld	hl, (_sprite_screen_x)
	ld	d, #0
	ld	e, ___offset_Sprite__coll_w+0(iy)
	add	hl, de
	ld	de, #-8
	add	hl, de
	ex	de, hl
	ld	a, (_next_oam_idx)
	call	___move_metasprite_flipxy
5$:
	ld	hl, #_next_oam_idx
	add	(hl)
	ld	(hl), a
6$:
	pop	af
	ld	(_MAP_FRAME1), a
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteRender.c:127: }
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
