;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module ScrollUpdateTile
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _UPDATE_TILE
	.globl _GetTileReplacement
	.globl _SpriteManagerAddEx
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_UPDATE_TILE_type_30000_283:
	.ds 1
_UPDATE_TILE_i_50000_285:
	.ds 1
_UPDATE_TILE___save_50000_285:
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
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/ScrollUpdateTile.c:167: void UPDATE_TILE(INT16 x, INT16 y) {
;	---------------------------------
; Function UPDATE_TILE
; ---------------------------------
_UPDATE_TILE::
	add	sp, #-6
	ldhl	sp,	#4
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#2
	ld	a, c
	ld	(hl+), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/ScrollUpdateTile.c:168: if(((UINT16)x >= scroll_tiles_w) || ((UINT16)y >= scroll_tiles_h)) { //This also checks x < 0 || y < 0
	ld	a, b
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/ScrollUpdateTile.c:169: *dest_ptr = 0;
	ld	a, (_dest_ptr)
	ld	c, a
	ld	hl, #_dest_ptr + 1
	ld	b, (hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/ScrollUpdateTile.c:168: if(((UINT16)x >= scroll_tiles_w) || ((UINT16)y >= scroll_tiles_h)) { //This also checks x < 0 || y < 0
	ld	hl, #_scroll_tiles_w
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	NC, 00109$
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_scroll_tiles_h
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00110$
00109$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/ScrollUpdateTile.c:169: *dest_ptr = 0;
	xor	a, a
	ld	(bc), a
	jp	00116$
00110$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/ScrollUpdateTile.c:172: *dest_ptr = *scroll_ptr;
	ld	a, (_scroll_ptr)
	ld	hl, #_scroll_ptr + 1
	ld	h, (hl)
	ld	l, a
	ld	a, (hl)
	ld	(bc), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/ScrollUpdateTile.c:173: type = GetTileReplacement(scroll_ptr, dest_ptr);
	ld	a, (_dest_ptr)
	ld	c, a
	ld	hl, #_dest_ptr + 1
	ld	b, (hl)
	ld	a, (_scroll_ptr)
	ld	e, a
	ld	hl, #_scroll_ptr + 1
	ld	d, (hl)
	call	_GetTileReplacement
	ld	hl, #_UPDATE_TILE_type_30000_283
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/ScrollUpdateTile.c:174: if(type != 255u) {
	ld	a, (hl)
	inc	a
	jp	Z, 00116$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/ScrollUpdateTile.c:176: for (i = VECTOR_LEN(sprite_manager_updatables); (i); i--) {
	ld	a, (#_sprite_manager_updatables + 0)
	ld	(#_UPDATE_TILE_i_50000_285),a
00114$:
	ld	hl, #_UPDATE_TILE_i_50000_285
	ld	a, (hl)
	or	a, a
	jr	Z, 00104$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/ScrollUpdateTile.c:177: Sprite* s = sprite_manager_sprites[sprite_manager_updatables[i]];
	ld	a, #<(_sprite_manager_updatables)
	add	a, (hl)
	ld	c, a
	ld	a, #>(_sprite_manager_updatables)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	ld	de, #_sprite_manager_sprites
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/ScrollUpdateTile.c:178: if ((s->type == type) && (s->unique_id == (UINT16)scroll_ptr)) {
	ld	hl, #0x001d
	add	hl, bc
	ld	a, (hl)
	ld	hl, #_UPDATE_TILE_type_30000_283
	sub	a, (hl)
	jr	NZ, 00115$
	ld	hl, #0x001f
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (_scroll_ptr)
	ld	e, a
	ld	hl, #_scroll_ptr + 1
	ld	d, (hl)
	ld	a, e
	sub	a, c
	jr	NZ, 00163$
	ld	a, d
	sub	a, b
	jr	Z, 00104$
00163$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/ScrollUpdateTile.c:179: break;
00115$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/ScrollUpdateTile.c:176: for (i = VECTOR_LEN(sprite_manager_updatables); (i); i--) {
	ld	hl, #_UPDATE_TILE_i_50000_285
	dec	(hl)
	jr	00114$
00104$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/ScrollUpdateTile.c:182: if (i == 0) {
	ld	a, (#_UPDATE_TILE_i_50000_285)
	or	a, a
	jr	NZ, 00116$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/ScrollUpdateTile.c:183: __save = CURRENT_BANK;
	ldh	a, (__current_bank + 0)
	ld	(#_UPDATE_TILE___save_50000_285),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/ScrollUpdateTile.c:184: SWITCH_ROM(spriteDataBanks[type]);
	ld	a, #<(_spriteDataBanks)
	ld	hl, #_UPDATE_TILE_type_30000_283
	add	a, (hl)
	ld	c, a
	ld	a, #>(_spriteDataBanks)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ldh	(__current_bank + 0), a
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/ScrollUpdateTile.c:185: UINT16 sprite_y = TILE_TO_PX(y + 1) - spriteDatas[type]->height;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	de, #_spriteDatas+0
	ld	a, (_UPDATE_TILE_type_30000_283)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	add	hl, de
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	ld	e, (hl)
	ld	d, #0x00
	ld	a, c
	sub	a, e
	ld	c, a
	ld	a, b
	sbc	a, d
	ld	b, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/ScrollUpdateTile.c:186: SWITCH_ROM(__save);
	ld	a, (_UPDATE_TILE___save_50000_285)
	ldh	(__current_bank + 0), a
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/ScrollUpdateTile.c:187: SpriteManagerAddEx(type, TILE_TO_PX(x), sprite_y, scroll_ptr);
	ld	a, (#_scroll_ptr)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#_scroll_ptr + 1)
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	pop	hl
	push	hl
	push	hl
	push	bc
	ld	a, (_UPDATE_TILE_type_30000_283)
	call	_SpriteManagerAddEx
00116$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/ScrollUpdateTile.c:194: }
	add	sp, #6
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
