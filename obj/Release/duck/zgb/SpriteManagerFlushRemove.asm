;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module SpriteManagerFlushRemove
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SpriteManagerFlushRemove
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_SpriteManagerFlushRemove___save_10000_279:
	.ds 1
_SpriteManagerFlushRemove_current_10000_279:
	.ds 1
_SpriteManagerFlushRemove_sprite_idx_10000_279:
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
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManagerFlushRemove.c:8: void SpriteManagerFlushRemove(void) {
;	---------------------------------
; Function SpriteManagerFlushRemove
; ---------------------------------
_SpriteManagerFlushRemove::
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManagerFlushRemove.c:10: __save = CURRENT_BANK;
	ldh	a, (__current_bank + 0)
	ld	(#_SpriteManagerFlushRemove___save_10000_279),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManagerFlushRemove.c:12: current = 0;
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManagerFlushRemove.c:13: SPRITEMANAGER_ITERATE(THIS_IDX, THIS) {
	xor	a, a
	ld	(#_SpriteManagerFlushRemove_current_10000_279), a
	ld	(#_THIS_IDX),a
	ld	bc, #_sprite_manager_updatables+0
	ld	hl, #(_sprite_manager_updatables + 1)
	ld	l, (hl)
	xor	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_sprite_manager_sprites
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #_THIS
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
00106$:
	ld	a, (bc)
	ld	hl, #_THIS_IDX
	sub	a, (hl)
	jp	Z, 00104$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManagerFlushRemove.c:15: sprite_idx = VECTOR_GET(sprite_manager_updatables, THIS_IDX);
	ld	a, (_THIS_IDX)
	ld	h, #0x00
	ld	l, a
	inc	hl
	add	hl, bc
	ld	a, (hl)
	ld	(#_SpriteManagerFlushRemove_sprite_idx_10000_279),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManagerFlushRemove.c:17: if (THIS->marked_for_removal) {
	ld	a, (_THIS)
	ld	e, a
	ld	hl, #_THIS + 1
	ld	d, (hl)
	ld	hl, #0x001e
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManagerFlushRemove.c:19: SWITCH_ROM(spriteBanks[THIS->type]);
	ld	hl, #0x001d
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	add	a, #<(_spriteBanks)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_spriteBanks)
	ld	h, a
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	a, (de)
	add	a, #<(_spriteBanks)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_spriteBanks)
	ld	h, a
	ld	a, (hl)
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManagerFlushRemove.c:20: spriteDestroyFuncs[THIS->type]();
	ld	a, (de)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	ld	de, #_spriteDestroyFuncs
	add	hl, de
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	push	bc
	ld	bc, #00132$
	push	bc
	push	hl
	ret
00132$:
	pop	bc
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManagerFlushRemove.c:22: StackPush(sprite_manager_sprites_pool, sprite_idx);
	ld	hl, #_sprite_manager_sprites_pool
	inc	(hl)
	jr	NZ, 00133$
	inc	hl
	inc	(hl)
00133$:
	ld	a, (_sprite_manager_sprites_pool)
	ld	e, a
	ld	hl, #_sprite_manager_sprites_pool + 1
	ld	d, (hl)
	ld	a, (_SpriteManagerFlushRemove_sprite_idx_10000_279)
	ld	(de), a
	jr	00107$
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManagerFlushRemove.c:25: VECTOR_SET_DIRECT(sprite_manager_updatables, current++, sprite_idx);
	ld	a, (_SpriteManagerFlushRemove_current_10000_279)
	ld	e, a
	ld	hl, #_SpriteManagerFlushRemove_current_10000_279
	inc	(hl)
	xor	a, a
	ld	l, e
	ld	h, a
	inc	hl
	add	hl, bc
	ld	a, (_SpriteManagerFlushRemove_sprite_idx_10000_279)
	ld	(hl), a
00107$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManagerFlushRemove.c:13: SPRITEMANAGER_ITERATE(THIS_IDX, THIS) {
	ld	hl, #_THIS_IDX
	inc	(hl)
	ld	a, (hl)
	ld	h, #0x00
	ld	l, a
	inc	hl
	add	hl, bc
	ld	l, (hl)
	xor	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_sprite_manager_sprites
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #_THIS
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	jp	00106$
00104$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManagerFlushRemove.c:30: VECTOR_LEN(sprite_manager_updatables) = current;
	ld	a, (_SpriteManagerFlushRemove_current_10000_279)
	ld	(bc), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManagerFlushRemove.c:31: SWITCH_ROM(__save);
	ld	a, (_SpriteManagerFlushRemove___save_10000_279)
	ldh	(__current_bank + 0), a
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManagerFlushRemove.c:33: sprite_manager_purge = TRUE;
	ld	hl, #_sprite_manager_purge
	ld	(hl), #0x01
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManagerFlushRemove.c:34: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
