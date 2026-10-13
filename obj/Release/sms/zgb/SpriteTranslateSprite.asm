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
_TranslateSprite___save_10000_241:
	.ds 1
_TranslateSprite_tile_coll_10000_241:
	.ds 2
_TranslateSprite_start_tile_x_10000_241:
	.ds 2
_TranslateSprite_end_tile_x_10000_241:
	.ds 2
_TranslateSprite_start_tile_y_10000_241:
	.ds 2
_TranslateSprite_end_tile_y_10000_241:
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
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-20
	add	iy, sp
	ld	sp, iy
	ld	-2 (ix), l
	ld	-1 (ix), h
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:13: UINT8 ret = 0;
	ld	-20 (ix), #0x00
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:16: __save = CURRENT_BANK;
	ld	a, (_MAP_FRAME1+0)
	ld	(_TranslateSprite___save_10000_241+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:17: SWITCH_ROM(scroll_bank);
	ld	a, (_scroll_bank+0)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:19: pivot_x = (x > 0) ? (sprite->x + (UINT8)(sprite->coll_w - 1u)) : sprite->x;
	ld	a, -2 (ix)
	ld	-19 (ix), a
	ld	a, -1 (ix)
	ld	-18 (ix), a
	ld	a, -2 (ix)
	add	a, #0x04
	ld	-17 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-16 (ix), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:23: pivot_x += x;
	ld	a, 4 (ix)
	ld	-15 (ix), a
	rlca
	sbc	a, a
	ld	-14 (ix), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:35: if (sprite->y >= scroll_h) {
	ld	a, -2 (ix)
	add	a, #0x02
	ld	-13 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-12 (ix), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:42: pivot_y = sprite->y + sprite->coll_h - 1;
	ld	a, -2 (ix)
	add	a, #0x05
	ld	-11 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-10 (ix), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:51: scroll_coll_group = sprite->coll_group;
	ld	a, -2 (ix)
	add	a, #0x22
	ld	-9 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-8 (ix), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:18: if (x) {
	ld	a, 4 (ix)
	or	a, a
	jp	Z, 00116$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:19: pivot_x = (x > 0) ? (sprite->x + (UINT8)(sprite->coll_w - 1u)) : sprite->x;
	xor	a, a
	sub	a, 4 (ix)
	jp	PO, 00336$
	xor	a, #0x80
00336$:
	rlca
	and	a,#0x01
	ld	-7 (ix), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:82: if (sprite->x >= scroll_w){
	ld	l, -19 (ix)
	ld	h, -18 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:19: pivot_x = (x > 0) ? (sprite->x + (UINT8)(sprite->coll_w - 1u)) : sprite->x;
	ld	a, -7 (ix)
	or	a, a
	jr	Z, 00143$
	ld	l, -17 (ix)
	ld	h, -16 (ix)
	ld	l, (hl)
	dec	l
	ld	h, #0x00
	add	hl, de
	ex	de, hl
00143$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:22: UINT16 tmp = PX_TO_TILE(pivot_x);
	ld	c, e
	ld	b, d
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:23: pivot_x += x;
	ld	a, -15 (ix)
	add	a, e
	ld	e, a
	ld	a, -14 (ix)
	adc	a, d
	ld	d, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:24: start_tile_x = PX_TO_TILE(pivot_x);
	ld	(_TranslateSprite_start_tile_x_10000_241), de
	ld	iy, #_TranslateSprite_start_tile_x_10000_241
	sra	1 (iy)
	rr	0 (iy)
	sra	1 (iy)
	rr	0 (iy)
	sra	1 (iy)
	rr	0 (iy)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:25: if (tmp == start_tile_x) {
	ld	hl, (_TranslateSprite_start_tile_x_10000_241)
	cp	a, a
	sbc	hl, bc
	jp	Z, 00116$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:30: if ((UINT16)pivot_x >= scroll_w) {
	ld	hl, #_scroll_w
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jp	NC, 00116$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:35: if (sprite->y >= scroll_h) {
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:36: start_tile_y = ((INT16)sprite->y < 0) ? 0 : (scroll_tiles_h - 1);
	ld	a, (_scroll_tiles_h+0)
	add	a, #0xff
	ld	-6 (ix), a
	ld	a, (_scroll_tiles_h+1)
	adc	a, #0xff
	ld	-5 (ix), a
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
	ld	-4 (ix), a
	ld	-3 (ix), a
	jr	00146$
00145$:
	ld	a, -6 (ix)
	ld	-4 (ix), a
	ld	a, -5 (ix)
	ld	-3 (ix), a
00146$:
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(_TranslateSprite_start_tile_y_10000_241), hl
	jr	00107$
00106$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:38: start_tile_y = PX_TO_TILE(sprite->y);
	ld	(_TranslateSprite_start_tile_y_10000_241), bc
	ld	iy, #_TranslateSprite_start_tile_y_10000_241
	srl	1 (iy)
	rr	0 (iy)
	srl	1 (iy)
	rr	0 (iy)
	srl	1 (iy)
	rr	0 (iy)
00107$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:42: pivot_y = sprite->y + sprite->coll_h - 1;
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	a, l
	add	a, #0xff
	ld	-4 (ix), a
	ld	a, h
	adc	a, #0xff
	ld	-3 (ix), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:43: if ((UINT16)pivot_y >= scroll_h) {
	ld	c, -4 (ix)
	ld	b, -3 (ix)
	ld	hl, #_scroll_h
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	C, 00109$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:44: end_tile_y = (pivot_y < 0) ? 0 : (scroll_tiles_h - 1);
	bit	7, -3 (ix)
	jr	Z, 00147$
	ld	hl, #0x0000
	jr	00148$
00147$:
	ld	l, -6 (ix)
	ld	h, -5 (ix)
00148$:
	ld	(_TranslateSprite_end_tile_y_10000_241), hl
	jr	00110$
00109$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:46: end_tile_y = PX_TO_TILE(pivot_y);
	ld	a, -4 (ix)
	ld	(_TranslateSprite_end_tile_y_10000_241+0), a
	ld	a, -3 (ix)
	ld	(_TranslateSprite_end_tile_y_10000_241+1), a
	ld	iy, #_TranslateSprite_end_tile_y_10000_241
	sra	1 (iy)
	rr	0 (iy)
	sra	1 (iy)
	rr	0 (iy)
	sra	1 (iy)
	rr	0 (iy)
00110$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:49: tile_coll = scroll_map + (scroll_tiles_w * start_tile_y + start_tile_x);
	ld	de, (_TranslateSprite_start_tile_y_10000_241)
	ld	hl, (_scroll_tiles_w)
	call	__mulint
	ld	a, e
	ld	hl, #_TranslateSprite_start_tile_x_10000_241
	add	a, (hl)
	inc	hl
	ld	c, a
	ld	a, d
	adc	a, (hl)
	ld	e, a
	ld	a, c
	ld	hl, #_scroll_map
	ld	iy, #_TranslateSprite_tile_coll_10000_241
	add	a, (hl)
	ld	0 (iy), a
	inc	hl
	ld	a, e
	adc	a, (hl)
	inc	iy
	ld	0 (iy), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:50: end_tile_y ++;
	ld	hl, (_TranslateSprite_end_tile_y_10000_241)
	inc	hl
	ld	(_TranslateSprite_end_tile_y_10000_241), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:51: scroll_coll_group = sprite->coll_group;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	c, (hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:52: for (tmp = start_tile_y; tmp != end_tile_y; tmp ++, tile_coll += scroll_tiles_w) {
	ld	de, (_TranslateSprite_start_tile_y_10000_241)
00136$:
	ld	hl, (_TranslateSprite_end_tile_y_10000_241)
	cp	a, a
	sbc	hl, de
	jp	Z, 00116$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:53: if (scroll_collisions[*tile_coll] & scroll_coll_group) {
	ld	hl, (_TranslateSprite_tile_coll_10000_241)
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
	ld	a, -7 (ix)
	or	a, a
	jr	Z, 00149$
	ld	a, (_TranslateSprite_start_tile_x_10000_241+0)
	ld	-6 (ix), a
	ld	a, (_TranslateSprite_start_tile_x_10000_241+1)
	ld	-5 (ix), a
	ld	b, #0x03
00339$:
	sla	-6 (ix)
	rl	-5 (ix)
	djnz	00339$
	ld	l, -17 (ix)
	ld	h, -16 (ix)
	ld	a, (hl)
	ld	-3 (ix), a
	ld	-4 (ix), a
	ld	-3 (ix), #0x00
	ld	a, -6 (ix)
	sub	a, -4 (ix)
	ld	e, a
	ld	a, -5 (ix)
	sbc	a, -3 (ix)
	ld	c, a
	jr	00150$
00149$:
	ld	hl, (_TranslateSprite_start_tile_x_10000_241)
	inc	hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	c, h
00150$:
	ld	l, -19 (ix)
	ld	h, -18 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), c
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:55: ret = *tile_coll;
	ld	hl, (_TranslateSprite_tile_coll_10000_241)
	ld	a, (hl)
	ld	-20 (ix), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:56: goto done_x;
	jr	00117$
00137$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:52: for (tmp = start_tile_y; tmp != end_tile_y; tmp ++, tile_coll += scroll_tiles_w) {
	inc	de
	ld	hl, #_scroll_tiles_w
	push	de
	ld	iy, #_TranslateSprite_tile_coll_10000_241
	push	iy
	pop	de
	ld	a, (de)
	add	a, (hl)
	inc	hl
	ld	(de), a
	inc	de
	ld	a, (de)
	adc	a, (hl)
	ld	(de), a
	pop	de
	jp	00136$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:61: inc_x:
00116$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:62: sprite->x += x;
	ld	l, -19 (ix)
	ld	h, -18 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	add	hl, bc
	ex	de, hl
	ld	l, -19 (ix)
	ld	h, -18 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:63: done_x:
00117$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:70: pivot_y += y;
	ld	a, 5 (ix)
	ld	-5 (ix), a
	rlca
	sbc	a, a
	ld	-4 (ix), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:65: if (y) {
	ld	a, 5 (ix)
	or	a, a
	jp	Z, 00133$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:66: pivot_y = (y > 0) ? (sprite->y + (UINT8)(sprite->coll_h - 1u)) : sprite->y;
	xor	a, a
	sub	a, 5 (ix)
	jp	PO, 00340$
	xor	a, #0x80
00340$:
	rlca
	and	a,#0x01
	ld	-3 (ix), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:35: if (sprite->y >= scroll_h) {
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:66: pivot_y = (y > 0) ? (sprite->y + (UINT8)(sprite->coll_h - 1u)) : sprite->y;
	ld	a, -3 (ix)
	or	a, a
	jr	Z, 00151$
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	l, (hl)
	dec	l
	ld	h, #0x00
	add	hl, de
	ex	de, hl
00151$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:69: UINT16 tmp = PX_TO_TILE(pivot_y);
	ld	c, e
	ld	b, d
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:70: pivot_y += y;
	ld	a, -5 (ix)
	add	a, e
	ld	e, a
	ld	a, -4 (ix)
	adc	a, d
	ld	d, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:71: start_tile_y = PX_TO_TILE(pivot_y);
	ld	(_TranslateSprite_start_tile_y_10000_241), de
	ld	iy, #_TranslateSprite_start_tile_y_10000_241
	sra	1 (iy)
	rr	0 (iy)
	sra	1 (iy)
	rr	0 (iy)
	sra	1 (iy)
	rr	0 (iy)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:72: if (tmp == start_tile_y) {
	ld	hl, (_TranslateSprite_start_tile_y_10000_241)
	cp	a, a
	sbc	hl, bc
	jp	Z, 00133$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:77: if ((UINT16)pivot_y >= scroll_h) {
	ld	hl, #_scroll_h
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jp	NC, 00133$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:82: if (sprite->x >= scroll_w){
	ld	l, -19 (ix)
	ld	h, -18 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:83: start_tile_x = ((INT16)sprite->x < 0) ? 0 : (scroll_tiles_w - 1);
	ld	a, (_scroll_tiles_w+0)
	add	a, #0xff
	ld	-7 (ix), a
	ld	a, (_scroll_tiles_w+1)
	adc	a, #0xff
	ld	-6 (ix), a
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
	ld	bc, #0x0000
	jr	00154$
00153$:
	ld	c, -7 (ix)
	ld	b, -6 (ix)
00154$:
	ld	(_TranslateSprite_start_tile_x_10000_241), bc
	jr	00124$
00123$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:85: start_tile_x = PX_TO_TILE(sprite->x);
	ld	(_TranslateSprite_start_tile_x_10000_241), bc
	ld	iy, #_TranslateSprite_start_tile_x_10000_241
	srl	1 (iy)
	rr	0 (iy)
	srl	1 (iy)
	rr	0 (iy)
	srl	1 (iy)
	rr	0 (iy)
00124$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:89: pivot_x = sprite->x + sprite->coll_w - 1;
	ld	l, -19 (ix)
	ld	h, -18 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, -17 (ix)
	ld	h, -16 (ix)
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	a, l
	add	a, #0xff
	ld	-15 (ix), a
	ld	a, h
	adc	a, #0xff
	ld	-14 (ix), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:90: if ((UINT16)pivot_x >= scroll_w) {
	ld	c, -15 (ix)
	ld	b, -14 (ix)
	ld	hl, #_scroll_w
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	C, 00126$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:91: end_tile_x = (pivot_x < 0) ? 0 : (scroll_tiles_w - 1);
	bit	7, -14 (ix)
	jr	Z, 00155$
	ld	de, #0x0000
	jr	00156$
00155$:
	ld	e, -7 (ix)
	ld	d, -6 (ix)
00156$:
	ld	(_TranslateSprite_end_tile_x_10000_241), de
	jr	00127$
00126$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:93: end_tile_x = PX_TO_TILE(pivot_x);
	ld	a, -15 (ix)
	ld	(_TranslateSprite_end_tile_x_10000_241+0), a
	ld	a, -14 (ix)
	ld	(_TranslateSprite_end_tile_x_10000_241+1), a
	ld	iy, #_TranslateSprite_end_tile_x_10000_241
	sra	1 (iy)
	rr	0 (iy)
	sra	1 (iy)
	rr	0 (iy)
	sra	1 (iy)
	rr	0 (iy)
00127$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:96: tile_coll = scroll_map + (scroll_tiles_w * start_tile_y + start_tile_x);
	ld	de, (_TranslateSprite_start_tile_y_10000_241)
	ld	hl, (_scroll_tiles_w)
	call	__mulint
	ld	a, e
	ld	hl, #_TranslateSprite_start_tile_x_10000_241
	add	a, (hl)
	inc	hl
	ld	c, a
	ld	a, d
	adc	a, (hl)
	ld	b, a
	ld	a, c
	ld	iy, #_scroll_map
	add	a, 0 (iy)
	ld	(_TranslateSprite_tile_coll_10000_241+0), a
	ld	a, b
	adc	a, 1 (iy)
	ld	(_TranslateSprite_tile_coll_10000_241+1), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:97: end_tile_x ++;
	ld	hl, (_TranslateSprite_end_tile_x_10000_241)
	inc	hl
	ld	(_TranslateSprite_end_tile_x_10000_241), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:98: scroll_coll_group = (y < 0) ? sprite->coll_group : sprite->coll_group_down;
	bit	7, 5 (ix)
	jr	Z, 00157$
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	a, (hl)
	jr	00158$
00157$:
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	hl, #35
	add	hl, bc
	ld	a, (hl)
00158$:
	ld	-14 (ix), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:99: for (tmp = start_tile_x; tmp != end_tile_x; tmp ++, tile_coll += 1) {
	ld	hl, (_TranslateSprite_start_tile_x_10000_241)
	ld	-7 (ix), l
	ld	-6 (ix), h
00139$:
	ld	a, (_TranslateSprite_end_tile_x_10000_241+0)
	sub	a, -7 (ix)
	jr	NZ, 00342$
	ld	a, (_TranslateSprite_end_tile_x_10000_241+1)
	sub	a, -6 (ix)
	jp	Z, 00133$
00342$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:100: if (scroll_collisions[*tile_coll] & scroll_coll_group) {
	ld	hl, (_TranslateSprite_tile_coll_10000_241)
	ld	-9 (ix), l
	ld	-8 (ix), h
	ld	a, (hl)
	ld	-8 (ix), a
	add	a, #<(_scroll_collisions)
	ld	-9 (ix), a
	ld	a, #0x00
	adc	a, #>(_scroll_collisions)
	ld	-8 (ix), a
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	a, (hl)
	and	a, -14 (ix)
	jr	Z, 00140$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:101: sprite->y = (y > 0) ? (TILE_TO_PX(start_tile_y) - sprite->coll_h) : (TILE_TO_PX(start_tile_y + 1));
	ld	a, -3 (ix)
	or	a, a
	jr	Z, 00159$
	ld	a, (_TranslateSprite_start_tile_y_10000_241+0)
	ld	-5 (ix), a
	ld	a, (_TranslateSprite_start_tile_y_10000_241+1)
	ld	-4 (ix), a
	ld	b, #0x03
00343$:
	sla	-5 (ix)
	rl	-4 (ix)
	djnz	00343$
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	a, (hl)
	ld	-3 (ix), a
	ld	-7 (ix), a
	ld	-6 (ix), #0x00
	ld	a, -5 (ix)
	sub	a, -7 (ix)
	ld	-9 (ix), a
	ld	a, -4 (ix)
	sbc	a, -6 (ix)
	ld	-8 (ix), a
	jr	00160$
00159$:
	ld	hl, (_TranslateSprite_start_tile_y_10000_241)
	inc	hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	-9 (ix), l
	ld	-8 (ix), h
00160$:
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	a, -9 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -8 (ix)
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:102: ret = *tile_coll;
	ld	hl, (_TranslateSprite_tile_coll_10000_241)
	ld	a, (hl)
	ld	-20 (ix), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:103: goto done_y;
	jr	00134$
00140$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:99: for (tmp = start_tile_x; tmp != end_tile_x; tmp ++, tile_coll += 1) {
	inc	-7 (ix)
	jr	NZ, 00344$
	inc	-6 (ix)
00344$:
	ld	hl, (_TranslateSprite_tile_coll_10000_241)
	inc	hl
	ld	(_TranslateSprite_tile_coll_10000_241), hl
	jp	00139$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:108: inc_y:
00133$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:109: sprite->y += y;
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	add	hl, bc
	ex	de, hl
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:110: done_y:
00134$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:111: SWITCH_ROM(__save);
	ld	a, (_TranslateSprite___save_10000_241+0)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:112: return ret;
	ld	a, -20 (ix)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteTranslateSprite.c:113: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	bc
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
