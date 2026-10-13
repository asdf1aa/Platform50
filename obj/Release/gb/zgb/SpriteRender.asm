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
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_RenderSprite___save_10000_279:
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
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteRender.c:129: void RenderSprite(void) {
;	---------------------------------
; Function RenderSprite
; ---------------------------------
_RenderSprite::
	add	sp, #-7
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteRender.c:131: __save = CURRENT_BANK;
	ldh	a, (__current_bank + 0)
	ld	(#_RenderSprite___save_10000_279),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteRender.c:132: SWITCH_ROM(THIS->mt_sprite_bank);
	ld	a, (#_THIS)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#_THIS + 1)
	ldhl	sp,	#1
	ld	(hl), a
	pop	de
	push	de
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldh	(__current_bank + 0), a
	ld	a, (bc)
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteRender.c:134: __current_metasprite = THIS->mt_sprite;
	pop	de
	push	de
	ld	hl, #0x0014
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl)
	ld	hl, #___current_metasprite
	ld	(hl), c
	inc	hl
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteRender.c:135: __current_base_prop = THIS->attr_add;
	pop	de
	push	de
	ld	hl, #0x000e
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	(#___current_base_prop),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteRender.c:137: switch(THIS->mirror) {
	pop	de
	push	de
	ld	hl, #0x0016
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, #0x04
	sub	a, (hl)
	jp	C, 00106$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteRender.c:140: next_oam_idx += __move_metasprite(next_oam_idx, (sprite_screen_y << 8) | (uint8_t)sprite_screen_x);
	ld	a, (#_sprite_screen_y)
	ldhl	sp,	#4
	ld	(hl-), a
	ld	(hl), #0x00
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteRender.c:144: next_oam_idx += __move_metasprite_flipy(next_oam_idx, ((sprite_screen_y + THIS->coll_h + ((LCDC_REG & LCDCF_OBJ16) ? -16 : -8)) << 8) | (uint8_t)sprite_screen_x);
	pop	de
	push	de
	ld	hl, #0x0005
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteRender.c:137: switch(THIS->mirror) {
	ldhl	sp,	#2
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #00134$
	add	hl, bc
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, c
	jp	(hl)
00134$:
	.dw	00101$
	.dw	00102$
	.dw	00103$
	.dw	00105$
	.dw	00105$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteRender.c:138: case NO_MIRROR:
00101$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteRender.c:139: __current_base_tile = THIS->first_tile;
	pop	de
	push	de
	ld	hl, #0x000a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	(#___current_base_tile),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteRender.c:140: next_oam_idx += __move_metasprite(next_oam_idx, (sprite_screen_y << 8) | (uint8_t)sprite_screen_x);
	ld	a, (_sprite_screen_x)
	ld	c, a
	ldhl	sp,	#3
	ld	a, (hl+)
	or	a, c
	ld	d, (hl)
	ld	e, a
	ld	a, (_next_oam_idx)
	call	___move_metasprite
	ld	hl, #_next_oam_idx
	add	a, (hl)
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteRender.c:141: break;
	jp	00106$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteRender.c:142: case H_MIRROR:  
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteRender.c:143: __current_base_tile = THIS->first_tile_H;
	pop	de
	push	de
	ld	hl, #0x000b
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	(#___current_base_tile),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteRender.c:144: next_oam_idx += __move_metasprite_flipy(next_oam_idx, ((sprite_screen_y + THIS->coll_h + ((LCDC_REG & LCDCF_OBJ16) ? -16 : -8)) << 8) | (uint8_t)sprite_screen_x);
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	b, #0x00
	ld	a, c
	ld	hl, #_sprite_screen_y
	add	a, (hl)
	inc	hl
	ld	c, a
	ld	a, b
	adc	a, (hl)
	ld	b, a
	ldh	a, (_LCDC_REG + 0)
	bit	2, a
	ld	a, #0xf0
	jr	NZ, 00110$
	ld	a, #0xf8
00110$:
	ld	l, a
	rlca
	sbc	a, a
	ld	h, a
	add	hl, bc
	ld	d, l
	ld	e, #0x00
	ld	a, (_sprite_screen_x)
	or	a, e
	ld	e, a
	ld	a, (_next_oam_idx)
	call	___move_metasprite_flipy
	ld	hl, #_next_oam_idx
	add	a, (hl)
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteRender.c:145: break;
	jp	00106$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteRender.c:146: case V_MIRROR:  
00103$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteRender.c:147: __current_base_tile = THIS->first_tile_V;
	pop	de
	push	de
	ld	hl, #0x000c
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	(#___current_base_tile),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteRender.c:148: next_oam_idx += __move_metasprite_flipx(next_oam_idx, (sprite_screen_y << 8) | (uint8_t)(sprite_screen_x + THIS->coll_w - 8));
	ld	a, (_sprite_screen_x)
	ld	c, a
	pop	de
	push	de
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	add	a, c
	add	a, #0xf8
	ld	c, a
	ldhl	sp,	#3
	ld	a, (hl+)
	or	a, c
	ld	d, (hl)
	ld	e, a
	ld	a, (_next_oam_idx)
	call	___move_metasprite_flipx
	ld	hl, #_next_oam_idx
	add	a, (hl)
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteRender.c:149: break;
	jr	00106$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteRender.c:151: case HV_MIRROR: 
00105$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteRender.c:152: __current_base_tile = THIS->first_tile_HV;
	pop	de
	push	de
	ld	hl, #0x000d
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	(#___current_base_tile),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteRender.c:153: next_oam_idx += __move_metasprite_flipxy(next_oam_idx, ((sprite_screen_y + THIS->coll_h + ((LCDC_REG & LCDCF_OBJ16) ? -16 : -8)) << 8) | (uint8_t)(sprite_screen_x + THIS->coll_w - 8));
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	b, #0x00
	ld	a, c
	ld	hl, #_sprite_screen_y
	add	a, (hl)
	inc	hl
	ld	c, a
	ld	a, b
	adc	a, (hl)
	ld	b, a
	ldh	a, (_LCDC_REG + 0)
	bit	2, a
	ld	a, #0xf0
	jr	NZ, 00112$
	ld	a, #0xf8
00112$:
	ld	l, a
	rlca
	sbc	a, a
	ld	h, a
	add	hl, bc
	ld	d, l
	ld	e, #0x00
	ld	a, (_sprite_screen_x)
	ld	c, a
	ld	a, (_THIS)
	ld	l, a
	ld	a, (_THIS + 1)
	ld	h, a
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	add	a, c
	add	a, #0xf8
	or	a, e
	ld	e, a
	ld	a, (_next_oam_idx)
	call	___move_metasprite_flipxy
	ld	hl, #_next_oam_idx
	add	a, (hl)
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteRender.c:155: }
00106$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteRender.c:156: SWITCH_ROM(__save);
	ld	a, (_RenderSprite___save_10000_279)
	ldh	(__current_bank + 0), a
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteRender.c:157: }
	add	sp, #7
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
