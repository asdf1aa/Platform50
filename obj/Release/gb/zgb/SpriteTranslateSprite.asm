;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module SpriteTranslateSprite
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TranslateSprite
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_TranslateSprite___save_10000_279:
	.ds 1
_TranslateSprite_tile_coll_10000_279:
	.ds 2
_TranslateSprite_start_tile_x_10000_279:
	.ds 2
_TranslateSprite_end_tile_x_10000_279:
	.ds 2
_TranslateSprite_start_tile_y_10000_279:
	.ds 2
_TranslateSprite_end_tile_y_10000_279:
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
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:7: UINT8 TranslateSprite(Sprite* sprite, INT8 x, INT8 y) {
;	---------------------------------
; Function TranslateSprite
; ---------------------------------
_TranslateSprite::
	add	sp, #-20
	ldhl	sp,	#18
	ld	(hl), e
	inc	hl
	ld	(hl), d
	ld	c, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:13: UINT8 ret = 0;
	ldhl	sp,	#0
	ld	(hl), #0x00
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:16: __save = CURRENT_BANK;
	ldh	a, (__current_bank + 0)
	ld	(#_TranslateSprite___save_10000_279),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:17: SWITCH_ROM(scroll_bank);
	ld	a, (_scroll_bank)
	ldh	(__current_bank + 0), a
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:19: pivot_x = (x > 0) ? (sprite->x + (UINT8)(sprite->coll_w - 1u)) : sprite->x;
	ldhl	sp,	#18
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,	#19
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,#18
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:23: pivot_x += x;
	ld	(hl+), a
	ld	a, c
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:35: if (sprite->y >= scroll_h) {
	ldhl	sp,#18
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:42: pivot_y = sprite->y + sprite->coll_h - 1;
	ldhl	sp,#18
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:51: scroll_coll_group = sprite->coll_group;
	ldhl	sp,#18
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0022
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#13
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#12
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:18: if (x) {
	ld	a, c
	or	a, a
	jp	Z, 00116$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:19: pivot_x = (x > 0) ? (sprite->x + (UINT8)(sprite->coll_w - 1u)) : sprite->x;
	ld	e, c
	xor	a, a
	ld	d, a
	sub	a, c
	bit	7, e
	jr	Z, 00336$
	bit	7, d
	jr	NZ, 00337$
	cp	a, a
	jr	00337$
00336$:
	bit	7, d
	jr	Z, 00337$
	scf
00337$:
	ld	a, #0x00
	rla
	ldhl	sp,	#13
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:82: if (sprite->x >= scroll_w){
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:19: pivot_x = (x > 0) ? (sprite->x + (UINT8)(sprite->coll_w - 1u)) : sprite->x;
	ldhl	sp,	#13
	ld	a, (hl)
	or	a, a
	jr	Z, 00143$
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	dec	a
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
00143$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:22: UINT16 tmp = PX_TO_TILE(pivot_x);
	ld	e, c
	ld	d, b
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:23: pivot_x += x;
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:24: start_tile_x = PX_TO_TILE(pivot_x);
	ld	hl, #_TranslateSprite_start_tile_x_10000_279
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:25: if (tmp == start_tile_x) {
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00338$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jp	Z, 00116$
00338$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:30: if ((UINT16)pivot_x >= scroll_w) {
	ld	hl, #_scroll_w
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jp	NC, 00116$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:35: if (sprite->y >= scroll_h) {
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:36: start_tile_y = ((INT16)sprite->y < 0) ? 0 : (scroll_tiles_h - 1);
	ld	hl, #_scroll_tiles_h
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0001
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#15
	ld	(hl-), a
	ld	(hl), e
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:35: if (sprite->y >= scroll_h) {
	ld	hl, #_scroll_h
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	C, 00106$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:36: start_tile_y = ((INT16)sprite->y < 0) ? 0 : (scroll_tiles_h - 1);
	bit	7, b
	jr	Z, 00145$
	xor	a, a
	ldhl	sp,	#16
	ld	(hl+), a
	ld	(hl), a
	jr	00146$
00145$:
	ldhl	sp,	#14
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
00146$:
	ldhl	sp,	#16
	ld	a, (hl)
	ld	(#_TranslateSprite_start_tile_y_10000_279),a
	ldhl	sp,	#17
	ld	a, (hl)
	ld	(#_TranslateSprite_start_tile_y_10000_279 + 1),a
	jr	00107$
00106$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:38: start_tile_y = PX_TO_TILE(sprite->y);
	ld	hl, #_TranslateSprite_start_tile_y_10000_279
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
00107$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:42: pivot_y = sprite->y + sprite->coll_h - 1;
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	dec	bc
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:43: if ((UINT16)pivot_y >= scroll_h) {
	ld	e, c
	ld	d, b
	ld	hl, #_scroll_h
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00109$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:44: end_tile_y = (pivot_y < 0) ? 0 : (scroll_tiles_h - 1);
	bit	7, b
	jr	Z, 00147$
	xor	a, a
	ld	c, a
	jr	00148$
00147$:
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	c, (hl)
00148$:
	ld	hl, #_TranslateSprite_end_tile_y_10000_279
	ld	(hl+), a
	ld	(hl), c
	jr	00110$
00109$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:46: end_tile_y = PX_TO_TILE(pivot_y);
	ld	hl, #_TranslateSprite_end_tile_y_10000_279
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
00110$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:49: tile_coll = scroll_map + (scroll_tiles_w * start_tile_y + start_tile_x);
	ld	a, (_TranslateSprite_start_tile_y_10000_279)
	ld	c, a
	ld	hl, #_TranslateSprite_start_tile_y_10000_279 + 1
	ld	b, (hl)
	ld	a, (_scroll_tiles_w)
	ld	e, a
	ld	hl, #_scroll_tiles_w + 1
	ld	d, (hl)
	call	__mulint
	ld	a, c
	ld	hl, #_TranslateSprite_start_tile_x_10000_279
	add	a, (hl)
	inc	hl
	ld	c, a
	ld	a, b
	adc	a, (hl)
	ld	b, a
	ld	a, (#_scroll_map)
	add	a, c
	ld	(#_TranslateSprite_tile_coll_10000_279),a
	ld	a, (#_scroll_map + 1)
	adc	a, b
	ld	(#_TranslateSprite_tile_coll_10000_279 + 1),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:50: end_tile_y ++;
	ld	hl, #_TranslateSprite_end_tile_y_10000_279
	inc	(hl)
	jr	NZ, 00339$
	inc	hl
	inc	(hl)
00339$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:51: scroll_coll_group = sprite->coll_group;
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:52: for (tmp = start_tile_y; tmp != end_tile_y; tmp ++, tile_coll += scroll_tiles_w) {
	ld	a, (_TranslateSprite_start_tile_y_10000_279)
	ld	e, a
	ld	hl, #_TranslateSprite_start_tile_y_10000_279 + 1
	ld	d, (hl)
00136$:
	ld	hl, #_TranslateSprite_end_tile_y_10000_279
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00340$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jp	Z, 00116$
00340$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:53: if (scroll_collisions[*tile_coll] & scroll_coll_group) {
	ld	a, (_TranslateSprite_tile_coll_10000_279)
	ld	l, a
	ld	a, (_TranslateSprite_tile_coll_10000_279 + 1)
	ld	h, a
	ld	a, (hl)
	add	a, #<(_scroll_collisions)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_scroll_collisions)
	ld	h, a
	ld	a, (hl)
	and	a, c
	jr	Z, 00137$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:54: sprite->x = (x > 0) ? (TILE_TO_PX(start_tile_x) - sprite->coll_w) : (TILE_TO_PX(start_tile_x + 1));
	ldhl	sp,	#13
	ld	a, (hl)
	or	a, a
	jr	Z, 00149$
	ld	a, (#_TranslateSprite_start_tile_x_10000_279)
	ldhl	sp,	#5
	ld	(hl), a
	ld	a, (#_TranslateSprite_start_tile_x_10000_279 + 1)
	ldhl	sp,	#6
	ld	(hl), a
	ld	a, #0x03
00341$:
	ldhl	sp,	#5
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00341$
	dec	hl
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#17
	ld	(hl), a
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#14
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#17
	ld	(hl-), a
	ld	(hl), e
	jr	00150$
00149$:
	ld	a, (_TranslateSprite_start_tile_x_10000_279)
	ld	c, a
	ld	hl, #_TranslateSprite_start_tile_x_10000_279 + 1
	ld	b, (hl)
	inc	bc
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	ldhl	sp,	#16
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00150$:
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:55: ret = *tile_coll;
	ld	a, (_TranslateSprite_tile_coll_10000_279)
	ld	hl, #_TranslateSprite_tile_coll_10000_279 + 1
	ld	h, (hl)
	ld	l, a
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:56: goto done_x;
	jr	00117$
00137$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:52: for (tmp = start_tile_y; tmp != end_tile_y; tmp ++, tile_coll += scroll_tiles_w) {
	inc	de
	ld	a, (#_TranslateSprite_tile_coll_10000_279)
	ld	hl, #_scroll_tiles_w
	add	a, (hl)
	ld	hl, #_TranslateSprite_tile_coll_10000_279
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_scroll_tiles_w + 1
	adc	a, (hl)
	ld	(#_TranslateSprite_tile_coll_10000_279 + 1),a
	jp	00136$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:61: inc_x:
00116$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:62: sprite->x += x;
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	e, (hl)
	add	a, c
	ld	c, a
	ld	a, e
	adc	a, b
	ld	b, a
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:63: done_x:
00117$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:70: pivot_y += y;
	ldhl	sp,	#22
	ld	a, (hl)
	ldhl	sp,	#13
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:65: if (y) {
	ldhl	sp,	#22
	ld	a, (hl)
	or	a, a
	jp	Z, 00133$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:66: pivot_y = (y > 0) ? (sprite->y + (UINT8)(sprite->coll_h - 1u)) : sprite->y;
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00343$
	bit	7, d
	jr	NZ, 00344$
	cp	a, a
	jr	00344$
00343$:
	bit	7, d
	jr	Z, 00344$
	scf
00344$:
	ld	a, #0x00
	rla
	ldhl	sp,	#15
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:35: if (sprite->y >= scroll_h) {
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#16
	ld	(hl+), a
	inc	de
	ld	a, (de)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:66: pivot_y = (y > 0) ? (sprite->y + (UINT8)(sprite->coll_h - 1u)) : sprite->y;
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00151$
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	dec	a
	ld	d, #0x00
	ld	e, a
	ldhl	sp,	#16
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	jr	00152$
00151$:
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
00152$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:69: UINT16 tmp = PX_TO_TILE(pivot_y);
	ld	e, c
	ld	d, b
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:70: pivot_y += y;
	ldhl	sp,	#13
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:71: start_tile_y = PX_TO_TILE(pivot_y);
	ld	hl, #_TranslateSprite_start_tile_y_10000_279
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:72: if (tmp == start_tile_y) {
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00345$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jp	Z, 00133$
00345$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:77: if ((UINT16)pivot_y >= scroll_h) {
	ld	hl, #_scroll_h
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jp	NC, 00133$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:82: if (sprite->x >= scroll_w){
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:83: start_tile_x = ((INT16)sprite->x < 0) ? 0 : (scroll_tiles_w - 1);
	ld	hl, #_scroll_tiles_w
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0001
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#17
	ld	(hl-), a
	ld	(hl), e
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:82: if (sprite->x >= scroll_w){
	ld	hl, #_scroll_w
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	C, 00123$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:83: start_tile_x = ((INT16)sprite->x < 0) ? 0 : (scroll_tiles_w - 1);
	bit	7, b
	jr	Z, 00153$
	xor	a, a
	ld	c, a
	jr	00154$
00153$:
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	c, (hl)
00154$:
	ld	hl, #_TranslateSprite_start_tile_x_10000_279
	ld	(hl+), a
	ld	(hl), c
	jr	00124$
00123$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:85: start_tile_x = PX_TO_TILE(sprite->x);
	ld	hl, #_TranslateSprite_start_tile_x_10000_279
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
00124$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:89: pivot_x = sprite->x + sprite->coll_w - 1;
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	de, #0x0001
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ldhl	sp,	#6
	ld	(hl-), a
	ld	(hl), e
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:90: if ((UINT16)pivot_x >= scroll_w) {
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_scroll_w
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	C, 00126$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:91: end_tile_x = (pivot_x < 0) ? 0 : (scroll_tiles_w - 1);
	ldhl	sp,	#6
	bit	7, (hl)
	jr	Z, 00155$
	xor	a, a
	ld	d, a
	jr	00156$
00155$:
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	d, (hl)
00156$:
	ld	hl, #_TranslateSprite_end_tile_x_10000_279
	ld	(hl+), a
	ld	(hl), d
	jr	00127$
00126$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:93: end_tile_x = PX_TO_TILE(pivot_x);
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(#_TranslateSprite_end_tile_x_10000_279),a
	ldhl	sp,	#6
	ld	a, (hl)
	ld	hl, #_TranslateSprite_end_tile_x_10000_279 + 1
	ld	(hl), a
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
00127$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:96: tile_coll = scroll_map + (scroll_tiles_w * start_tile_y + start_tile_x);
	ld	a, (_TranslateSprite_start_tile_y_10000_279)
	ld	c, a
	ld	hl, #_TranslateSprite_start_tile_y_10000_279 + 1
	ld	b, (hl)
	ld	a, (_scroll_tiles_w)
	ld	e, a
	ld	hl, #_scroll_tiles_w + 1
	ld	d, (hl)
	call	__mulint
	ld	a, c
	ld	hl, #_TranslateSprite_start_tile_x_10000_279
	add	a, (hl)
	inc	hl
	ld	c, a
	ld	a, b
	adc	a, (hl)
	ld	b, a
	ld	a, (#_scroll_map)
	add	a, c
	ld	(#_TranslateSprite_tile_coll_10000_279),a
	ld	a, (#_scroll_map + 1)
	adc	a, b
	ld	(#_TranslateSprite_tile_coll_10000_279 + 1),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:97: end_tile_x ++;
	ld	hl, #_TranslateSprite_end_tile_x_10000_279
	inc	(hl)
	jr	NZ, 00346$
	inc	hl
	inc	(hl)
00346$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:98: scroll_coll_group = (y < 0) ? sprite->coll_group : sprite->coll_group_down;
	ldhl	sp,	#22
	bit	7, (hl)
	jr	Z, 00157$
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	jr	00158$
00157$:
	ldhl	sp,#18
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0023
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
00158$:
	ldhl	sp,	#12
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:99: for (tmp = start_tile_x; tmp != end_tile_x; tmp ++, tile_coll += 1) {
	ld	a, (#_TranslateSprite_start_tile_x_10000_279)
	ldhl	sp,	#16
	ld	(hl), a
	ld	a, (#_TranslateSprite_start_tile_x_10000_279 + 1)
	ldhl	sp,	#17
	ld	(hl), a
00139$:
	ldhl	sp,	#16
	ld	a, (hl)
	ld	hl, #_TranslateSprite_end_tile_x_10000_279
	sub	a, (hl)
	jr	NZ, 00347$
	ldhl	sp,	#17
	ld	a, (hl)
	ld	hl, #_TranslateSprite_end_tile_x_10000_279 + 1
	sub	a, (hl)
	jp	Z, 00133$
00347$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:100: if (scroll_collisions[*tile_coll] & scroll_coll_group) {
	ld	a, (_TranslateSprite_tile_coll_10000_279)
	ld	hl, #_TranslateSprite_tile_coll_10000_279 + 1
	ld	h, (hl)
	ld	l, a
	ld	l, (hl)
	ld	h, #0x00
	ld	de, #_scroll_collisions
	add	hl, de
	ld	a, (hl)
	ldhl	sp,	#12
	and	a, (hl)
	jr	Z, 00140$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:101: sprite->y = (y > 0) ? (TILE_TO_PX(start_tile_y) - sprite->coll_h) : (TILE_TO_PX(start_tile_y + 1));
	ldhl	sp,	#15
	ld	a, (hl)
	or	a, a
	jr	Z, 00159$
	ld	a, (#_TranslateSprite_start_tile_y_10000_279)
	ldhl	sp,	#16
	ld	(hl), a
	ld	a, (#_TranslateSprite_start_tile_y_10000_279 + 1)
	ldhl	sp,	#17
	ld	(hl), a
	ld	a, #0x03
00348$:
	ldhl	sp,	#16
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00348$
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#15
	ld	(hl), a
	ld	a, (hl)
	ldhl	sp,	#12
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,#16
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#12
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#15
	ld	(hl-), a
	ld	(hl), e
	jr	00160$
00159$:
	ld	a, (_TranslateSprite_start_tile_y_10000_279)
	ld	c, a
	ld	hl, #_TranslateSprite_start_tile_y_10000_279 + 1
	ld	b, (hl)
	inc	bc
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	ldhl	sp,	#14
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00160$:
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:102: ret = *tile_coll;
	ld	a, (_TranslateSprite_tile_coll_10000_279)
	ld	hl, #_TranslateSprite_tile_coll_10000_279 + 1
	ld	h, (hl)
	ld	l, a
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:103: goto done_y;
	jr	00134$
00140$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:99: for (tmp = start_tile_x; tmp != end_tile_x; tmp ++, tile_coll += 1) {
	ldhl	sp,	#16
	inc	(hl)
	jr	NZ, 00350$
	inc	hl
	inc	(hl)
00350$:
	ld	hl, #_TranslateSprite_tile_coll_10000_279
	inc	(hl)
	jp	NZ, 00139$
	inc	hl
	inc	(hl)
	jp	00139$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:108: inc_y:
00133$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:109: sprite->y += y;
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#13
	ld	a, (hl+)
	ld	e, (hl)
	add	a, c
	ld	c, a
	ld	a, e
	adc	a, b
	ld	b, a
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:110: done_y:
00134$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:111: SWITCH_ROM(__save);
	ld	a, (_TranslateSprite___save_10000_279)
	ldh	(__current_bank + 0), a
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:112: return ret;
	ldhl	sp,	#0
	ld	a, (hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:113: }
	add	sp, #20
	pop	hl
	inc	sp
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
