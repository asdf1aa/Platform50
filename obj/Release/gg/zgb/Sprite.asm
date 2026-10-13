;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module Sprite
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TickAnimSprite
	.globl _RenderSprite
	.globl _SpriteManagerRemoveSprite
	.globl _sprite_screen_y
	.globl _sprite_screen_x
	.globl _InitSprite
	.globl _DrawSprite
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
_sprite_screen_x::
	.ds 2
_sprite_screen_y::
	.ds 2
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
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:20: void InitSprite(Sprite* sprite, UINT8 sprite_type) NAKED {
;	---------------------------------
; Function InitSprite
; ---------------------------------
_InitSprite::
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:119: __endasm;
	.ez80
	pop	de
	dec	sp
	ex	de, hl ; de: sprite
	ex	(sp), hl
	ld	c, h
	ld	b, #0 ; bc: sprite_type
	ld	iyl, e
	ld	iyh, d ; iy: sprite
	ld	hl, #_spriteDatas
	add	hl, bc
	add	hl, bc
	ld	e, (hl)
	inc	hl
	ld	d, (hl) ; de: mt_sprite_info
	ld	___offset_Sprite__mt_sprite_info+0(iy), e
	ld	___offset_Sprite__mt_sprite_info+1(iy), d
	push	de
	ex	(sp), ix ; ix: mt_sprite_info
	ld	hl, #_spriteDataBanks
	add	hl, bc
	ld	a, (hl)
	ld	___offset_Sprite__mt_sprite_bank(iy), a
	ld	hl, #_spriteFlips
	add	hl, bc
	ld	a, (hl)
	ld	___offset_Sprite__flips(iy), a
	ld	hl, #_spriteIdxs
	add	hl, bc
	ld	a, (hl)
	ld	___offset_Sprite__first_tile(iy), a
	ld	hl, #_spriteIdxsH
	add	hl, bc
	ld	a, (hl)
	ld	___offset_Sprite__first_tile_H(iy), a
	ld	hl, #_spriteIdxsV
	add	hl, bc
	ld	a, (hl)
	ld	___offset_Sprite__first_tile_V(iy), a
	ld	hl, #_spriteIdxsHV
	add	hl, bc
	ld	a, (hl)
	ld	___offset_Sprite__first_tile_HV(iy), a
	ld	___offset_Sprite__anim_data+0(iy), #0
	ld	___offset_Sprite__anim_data+1(iy), #0
	ld	___offset_Sprite__anim_speed(iy), #33
	push	iy
	ld	hl, #0
	ld	e, iyl
	ld	d, iyh
	ex	de, hl
	call	_GetSpriteAnimation
	pop	iy
	ld	___offset_Sprite__mt_sprite+0(iy), e
	ld	___offset_Sprite__mt_sprite+1(iy), d
	ld	___offset_Sprite__anim_frame(iy), #0
	ld	___offset_Sprite__ctx+0(iy), #0
	ld	___offset_Sprite__ctx+1(iy), #0
	ld	___offset_Sprite__x+0(iy), #0
	ld	___offset_Sprite__x+1(iy), #0
	ld	___offset_Sprite__y+0(iy), #0
	ld	___offset_Sprite__y+1(iy), #0
	ld	___offset_Sprite__coll_group(iy), #0x01
	ld	___offset_Sprite__coll_group_down(iy), #0x080
	ld	___offset_Sprite__flags(iy), #0b00000101
	ld	a, (_MAP_FRAME1)
	ld	e, a
	ld	a, ___offset_Sprite__mt_sprite_bank(iy)
	ld	(_MAP_FRAME1), a
	ld	a, ___offset_MetaSpriteInfo__width(ix)
	ld	___offset_Sprite__coll_w(iy), a
	ld	a, ___offset_MetaSpriteInfo__height(ix)
	ld	___offset_Sprite__coll_h(iy), a
	ld	a, e
	ld	(_MAP_FRAME1), a
	pop	ix
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:120: }
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:169: void DrawSprite(void) {
;	---------------------------------
; Function DrawSprite
; ---------------------------------
_DrawSprite::
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:171: sprite_screen_x = THIS->x - scroll_x;
	ld	hl, (_THIS)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	de, (_scroll_x)
	ld	hl, #_sprite_screen_x
	ld	a, c
	sub	a, e
	ld	(hl), a
	inc	hl
	ld	a, b
	sbc	a, d
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:172: sprite_screen_y = THIS->y - scroll_y;
	ld	hl, (_THIS)
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	de, (_scroll_y)
	ld	hl, #_sprite_screen_y
	ld	a, c
	sub	a, e
	ld	(hl), a
	inc	hl
	ld	a, b
	sbc	a, d
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:175: TickAnimSprite();
	call	_TickAnimSprite
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:172: sprite_screen_y = THIS->y - scroll_y;
	ld	iy, (_THIS)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:178: if (THIS->visible) {
	push	iy
	pop	bc
	ld	hl, #33
	add	hl, bc
	ld	a, (hl)
	and	a, #0x01
	jr	Z, 00105$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:181: ((UINT16)(sprite_screen_x + MAXIMUM_SPRITES_SIZE) < (UINT16)(DEVICE_SCREEN_PX_WIDTH + (MAXIMUM_SPRITES_SIZE << 1))) &&
	ld	hl, (_sprite_screen_x)
	ld	de, #0x0020
	add	hl, de
	ld	de, #0x00e0
	cp	a, a
	sbc	hl, de
	jr	NC, 00105$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:182: ((UINT16)(sprite_screen_y + MAXIMUM_SPRITES_SIZE) < (UINT16)(DEVICE_SCREEN_PX_HEIGHT + (MAXIMUM_SPRITES_SIZE << 1)))
	ld	hl, (_sprite_screen_y)
	ld	de, #0x0020
	add	hl, de
	ld	de, #0x00d0
	cp	a, a
	sbc	hl, de
	jr	NC, 00105$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:185: sprite_screen_x += (DEVICE_SPRITE_PX_OFFSET_X + SCREEN_SPR_OFFSET_X);
	ld	hl, #_sprite_screen_x
	ld	a, (hl)
	add	a, #0x30
	ld	(hl), a
	jr	NC, 00148$
	inc	hl
	inc	(hl)
00148$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:186: sprite_screen_y += DEVICE_SPRITE_PX_OFFSET_Y;
	ld	hl, #_sprite_screen_y
	ld	a, (hl)
	add	a, #0x17
	ld	(hl), a
	jp	NC, _RenderSprite
	inc	hl
	inc	(hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:189: return RenderSprite();
	jp  _RenderSprite
00105$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:193: if (THIS->persistent) return;
	push	iy
	pop	bc
	ld	hl, #33
	add	hl, bc
	ld	a, (hl)
	rrca
	and	a, #0x01
	ret	NZ
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:197: ((UINT16)(sprite_screen_x + THIS->lim_x + 16u) > (UINT16)((THIS->lim_x << 1) + (DEVICE_SCREEN_PX_WIDTH + (16u << 1)))) || 
	push	iy
	pop	bc
	ld	hl, #25
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, (_sprite_screen_x)
	add	hl, bc
	ex	de, hl
	ld	hl, #0x0010
	add	hl, de
	ex	de, hl
	ld	l, c
	ld	h, b
	add	hl, hl
	ld	bc, #0x00c0
	add	hl, bc
	xor	a, a
	sbc	hl, de
	jr	C, 00108$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:198: ((UINT16)(sprite_screen_y + THIS->lim_y + 16u) > (UINT16)((THIS->lim_y << 1) + (DEVICE_SCREEN_PX_HEIGHT + (16u << 1))))
	ld	c, 27 (iy)
	ld	b, 28 (iy)
	ld	hl, (_sprite_screen_y)
	add	hl, bc
	ex	de, hl
	ld	hl, #0x0010
	add	hl, de
	ex	de, hl
	ld	l, c
	ld	h, b
	add	hl, hl
	ld	bc, #0x00b0
	add	hl, bc
	xor	a, a
	sbc	hl, de
	ret	NC
00108$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:200: SpriteManagerRemoveSprite(THIS);
	ld	hl, (_THIS)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:202: }
	jp	_SpriteManagerRemoveSprite
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
