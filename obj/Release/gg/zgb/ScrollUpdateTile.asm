;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module ScrollUpdateTile
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _UPDATE_TILE
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
___x:
	.ds 2
___y:
	.ds 2
___type:
	.ds 1
___save:
	.ds 1
___i:
	.ds 1
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
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/ScrollUpdateTile.c:20: void UPDATE_TILE(INT16 x, INT16 y) NAKED {
;	---------------------------------
; Function UPDATE_TILE
; ---------------------------------
_UPDATE_TILE::
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/ScrollUpdateTile.c:164: __endasm;
	.ez80
	ld	(___x), hl
	ld	(___y), de
	ld	hl, (___x)
	ld	de, (_scroll_tiles_w)
	or	a
	sbc	hl, de
	jr	nc, 0$
	ld	hl, (___y)
	ld	de, (_scroll_tiles_h)
	or	a
	sbc	hl, de
	jr	c, 1$
0$:
	ld	hl, (_dest_ptr)
	ld	(hl), #0
	jp	2$
1$:
	ld	hl, (_scroll_ptr)
	ld	de, (_dest_ptr)
	ld	a, (hl)
	ld	(de), a
	call	_GetTileReplacement
	ld	(___type), a
	inc	a
	jp	z, 2$
	ld	bc, #_sprite_manager_updatables
	ld	a, (bc)
	or	a
	jp	z, 4$
	ld	hl, #___i
	ld	(hl), a
5$:
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	ld	de, #_sprite_manager_sprites
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	iyl, e
	ld	iyh, d
	ld	a, (___type)
	cp	___offset_Sprite__type(iy)
	jp	nz, 6$
	ld	a, (_scroll_ptr+0)
	cp	___offset_Sprite__unique_id+0(iy)
	jp	nz, 6$
	ld	a, (_scroll_ptr+1)
	cp	___offset_Sprite__unique_id+1(iy)
	jp	z, 2$
6$:
	ld	hl, #___i
	dec	(hl)
	ld	a, (hl)
	or	a
	jp	nz, 5$
4$:
	ld	a, (_MAP_FRAME1)
	ld	(___save), a
	ld	hl, #_spriteDataBanks
	ld	a, (___type)
	ld	e, a
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	ld	(_MAP_FRAME1), a
	ld	hl, (___y)
	inc	hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	h, #0x00
	ld	a, (___type)
	ld	l, a
	add	hl, hl
	ld	bc, #_spriteDatas
	add	hl, bc
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	add	#___offset_MetaSpriteInfo__height
	ld	l, a
	adc	h
	sub	l
	ld	h, a
	ld	c, (hl)
	ld	b, #0x00
	ex	de, hl
	or	a
	sbc	hl, bc
	ld	a, (___save)
	ld	(_MAP_FRAME1), a
	ld	de, (_scroll_ptr)
	push	de ; scroll_ptr
	push	hl ; sprite_y
	ld	hl, (___x)
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl ; sprite_x
	ld	a, (___type)
	call	_SpriteManagerAddEx
2$:
	ld	hl, (_scroll_cptr)
	ld	a, h
	or	l
	ld	a, (hl)
	jp	nz, 3$
	ld	de, #_scroll_tile_info
	ld	hl, (_dest_ptr)
	ld	l, (hl)
	ld	h, #0
	add	hl, de
	ld	a, (hl)
3$:
	ld	bc, (_dest_cptr)
	ld	(bc), a
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/ScrollUpdateTile.c:165: }
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
