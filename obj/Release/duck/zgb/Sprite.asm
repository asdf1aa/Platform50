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
	.globl _GetSpriteAnimation
	.globl _sprite_screen_y
	.globl _sprite_screen_x
	.globl _InitSprite
	.globl _DrawSprite
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
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
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:122: void InitSprite(Sprite* sprite, UINT8 sprite_type) {
;	---------------------------------
; Function InitSprite
; ---------------------------------
_InitSprite::
	add	sp, #-9
	ldhl	sp,	#7
	ld	(hl), e
	inc	hl
	ld	(hl), d
	ld	c, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:123: const struct MetaSpriteInfo* mt_sprite_info = spriteDatas[sprite_type];
	ld	l, c
	xor	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_spriteDatas
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:125: sprite->mt_sprite_info = mt_sprite_info;
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:126: sprite->mt_sprite_bank = spriteDataBanks[sprite_type];
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	inc	sp
	inc	sp
	push	hl
	ld	de, #_spriteDataBanks
	ld	l, c
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	pop	hl
	push	hl
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:128: sprite->flips = spriteFlips[sprite_type];
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0009
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_spriteFlips
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ld	(de), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:129: sprite->first_tile = spriteIdxs[sprite_type];
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_spriteIdxs
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ld	(de), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:130: sprite->first_tile_H = spriteIdxsH[sprite_type];
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000b
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_spriteIdxsH
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ld	(de), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:131: sprite->first_tile_V = spriteIdxsV[sprite_type];
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000c
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_spriteIdxsV
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ld	(de), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:132: sprite->first_tile_HV = spriteIdxsHV[sprite_type];
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000d
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_spriteIdxsHV
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ld	(de), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:136: sprite->attr_add = 0;
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000e
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:139: sprite->anim_data = NULL;	
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000f
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
	inc	bc
	ld	(bc), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:140: sprite->anim_speed = 33u;
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0012
	add	hl, de
	ld	(hl), #0x21
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/include/Sprite.h:83: sprite->mt_sprite = GetSpriteAnimation(sprite, frame);
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0014
	add	hl, de
	push	hl
	ld	bc, #0x0000
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_GetSpriteAnimation
	pop	de
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/include/Sprite.h:84: sprite->anim_frame = frame;
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0013
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:144: sprite->ctx = NULL;
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0017
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
	inc	bc
	ld	(bc), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:146: sprite->x = 0;
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:147: sprite->y = 0;
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	c, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:149: sprite->coll_group = COLL_GROUP_DEFAULT;
	ld	a, (hl-)
	ld	b, a
	inc	bc
	inc	bc
	xor	a, a
	ld	(bc), a
	inc	bc
	ld	(bc), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0022
	add	hl, de
	ld	(hl), #0x01
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:150: sprite->coll_group_down = COLL_GROUP_DOWN;
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0023
	add	hl, de
	ld	(hl), #0x80
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/include/Sprite.h:102: sprite->visible = (visible);
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0021
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, #0x01
	ld	(bc), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/include/Sprite.h:105: sprite->persistent = (persistent);
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0021
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	and	a, #0xfd
	ld	(bc), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/include/Sprite.h:108: sprite->loop_anim = (loop_anim);
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0021
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, #0x04
	ld	(bc), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:156: UINT8 __save = CURRENT_BANK;
	ldh	a, (__current_bank + 0)
	ldhl	sp,	#6
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:157: SWITCH_ROM(spriteDataBanks[sprite_type]);
	ld	(hl-), a
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldh	(__current_bank + 0), a
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:158: sprite->coll_w = mt_sprite_info->width;
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(bc), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:159: sprite->coll_h = mt_sprite_info->height;
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	ld	a, (de)
	ld	(bc), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:160: SWITCH_ROM(__save);
	ldhl	sp,	#6
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	a, (hl)
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:161: }
	add	sp, #9
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:169: void DrawSprite(void) {
;	---------------------------------
; Function DrawSprite
; ---------------------------------
_DrawSprite::
	add	sp, #-4
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:171: sprite_screen_x = THIS->x - scroll_x;
	ld	hl, #_THIS
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (_scroll_x)
	ld	e, a
	ld	hl, #_scroll_x + 1
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	hl, #_sprite_screen_x
	ld	(hl+), a
	ld	a, b
	sbc	a, d
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:172: sprite_screen_y = THIS->y - scroll_y;
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (_scroll_y)
	ld	e, a
	ld	hl, #_scroll_y + 1
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	hl, #_sprite_screen_y
	ld	(hl+), a
	ld	a, b
	sbc	a, d
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:175: TickAnimSprite();
	call	_TickAnimSprite
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:172: sprite_screen_y = THIS->y - scroll_y;
	ld	a, (_THIS)
	ld	c, a
	ld	hl, #_THIS + 1
	ld	b, (hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:178: if (THIS->visible) {
	ld	hl, #0x0021
	add	hl, bc
	ld	a, (hl)
	and	a, #0x01
	jr	Z, 00105$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:181: ((UINT16)(sprite_screen_x + MAXIMUM_SPRITES_SIZE) < (UINT16)(DEVICE_SCREEN_PX_WIDTH + (MAXIMUM_SPRITES_SIZE << 1))) &&
	ld	hl, #_sprite_screen_x
	ld	a, (hl+)
	add	a, #0x20
	ld	e, a
	ld	a, (hl)
	adc	a, #0x00
	ld	d, a
	ld	a, e
	sub	a, #0xe0
	ld	a, d
	sbc	a, #0x00
	jr	NC, 00105$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:182: ((UINT16)(sprite_screen_y + MAXIMUM_SPRITES_SIZE) < (UINT16)(DEVICE_SCREEN_PX_HEIGHT + (MAXIMUM_SPRITES_SIZE << 1)))
	ld	hl, #_sprite_screen_y
	ld	a, (hl+)
	add	a, #0x20
	ld	e, a
	ld	a, (hl)
	adc	a, #0x00
	ld	d, a
	ld	a, e
	sub	a, #0xd0
	ld	a, d
	sbc	a, #0x00
	jr	NC, 00105$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:185: sprite_screen_x += (DEVICE_SPRITE_PX_OFFSET_X + SCREEN_SPR_OFFSET_X);
	ld	hl, #_sprite_screen_x
	ld	a, (hl)
	add	a, #0x08
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0x00
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:186: sprite_screen_y += DEVICE_SPRITE_PX_OFFSET_Y;
	ld	hl, #_sprite_screen_y
	ld	a, (hl)
	add	a, #0x10
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0x00
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:189: return RenderSprite();
	call	_RenderSprite
	jr	00111$
00105$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:193: if (THIS->persistent) return;
	ld	hl, #0x0021
	add	hl, bc
	ld	a, (hl)
	rrca
	and	a, #0x01
	jr	NZ, 00111$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:197: ((UINT16)(sprite_screen_x + THIS->lim_x + 16u) > (UINT16)((THIS->lim_x << 1) + (DEVICE_SCREEN_PX_WIDTH + (16u << 1)))) || 
	ld	hl, #0x0019
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ld	hl, #_sprite_screen_x
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #0x0010
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	d, (hl)
	add	a, a
	rl	d
	add	a, #0xc0
	ld	e, a
	jr	NC, 00149$
	inc	d
00149$:
	inc	hl
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00108$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:198: ((UINT16)(sprite_screen_y + THIS->lim_y + 16u) > (UINT16)((THIS->lim_y << 1) + (DEVICE_SCREEN_PX_HEIGHT + (16u << 1))))
	ld	hl, #0x001b
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	ld	hl, #_sprite_screen_y
	add	a, (hl)
	inc	hl
	ld	e, a
	ld	a, b
	adc	a, (hl)
	ld	d, a
	ld	hl, #0x0010
	add	hl, de
	ld	e, l
	ld	d, h
	ld	l, c
	ld	h, b
	add	hl, hl
	ld	bc, #0x00b0
	add	hl, bc
	ld	a, l
	sub	a, e
	ld	a, h
	sbc	a, d
	jr	NC, 00111$
00108$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:200: SpriteManagerRemoveSprite(THIS);
	ld	a, (_THIS)
	ld	e, a
	ld	hl, #_THIS + 1
	ld	d, (hl)
	call	_SpriteManagerRemoveSprite
00111$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Sprite.c:202: }
	add	sp, #4
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
