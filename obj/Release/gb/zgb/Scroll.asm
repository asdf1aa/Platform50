;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module Scroll
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ScrollUpdateColumnWithDelay
	.globl _ScrollUpdateColumnR
	.globl _ScrollUpdateRowWithDelay
	.globl _ScrollUpdateRowR
	.globl _ClampScrollLimits
	.globl _UPDATE_TILE
	.globl _get_win_xy_addr
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _get_bkg_xy_addr
	.globl _set_vram_byte
	.globl _memset
	.globl _last_tile_loaded
	.globl _pending_w_map
	.globl _pending_h_map
	.globl _clamp_enabled
	.globl _scroll_h_border
	.globl _scroll_offset_y
	.globl _scroll_offset_x
	.globl _scroll_target
	.globl _scroll_y_vblank
	.globl _scroll_x_vblank
	.globl _scroll_y
	.globl _scroll_x
	.globl _scroll_cmap
	.globl _scroll_map
	.globl _scroll_bottom_movement_limit
	.globl _scroll_top_movement_limit
	.globl _dest_cptr
	.globl _dest_ptr
	.globl _map_cbuffer
	.globl _map_buffer
	.globl _scroll_cptr
	.globl _scroll_ptr
	.globl _tiles_0
	.globl _tiles_bank_0
	.globl _hud_map_offset
	.globl _pending_w_i
	.globl _pending_w_y
	.globl _pending_w_x
	.globl _pending_h_i
	.globl _pending_h_y
	.globl _pending_h_x
	.globl _scroll_bank
	.globl _scroll_tile_info
	.globl _scroll_collisions
	.globl _scroll_tiles_h
	.globl _scroll_tiles_w
	.globl _scroll_h
	.globl _scroll_w
	.globl _ScrollSetTiles
	.globl _UpdateMapTile
	.globl _LoadMap
	.globl _ScrollSetMap
	.globl _ScrollInitTilesFromMap
	.globl _ScrollCollisionsReset
	.globl _ScrollInitCollisionGroup
	.globl _ScrollInitCollisionGroupVector
	.globl _ScrollRemoveCollisionGroupVector
	.globl _ScrollInitCollisions
	.globl _ScrollScreenRedraw
	.globl _InitScroll
	.globl _ScrollUpdateRow
	.globl _ScrollUpdateColumn
	.globl _RefreshScroll
	.globl _MoveScroll
	.globl _GetScrollTile
	.globl _GetMapSize
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_scroll_w::
	.ds 2
_scroll_h::
	.ds 2
_scroll_tiles_w::
	.ds 2
_scroll_tiles_h::
	.ds 2
_scroll_collisions::
	.ds 256
_scroll_tile_info::
	.ds 256
_scroll_bank::
	.ds 1
_pending_h_x::
	.ds 2
_pending_h_y::
	.ds 2
_pending_h_i::
	.ds 1
_pending_w_x::
	.ds 2
_pending_w_y::
	.ds 2
_pending_w_i::
	.ds 1
_hud_map_offset::
	.ds 2
_tiles_bank_0::
	.ds 1
_tiles_0::
	.ds 2
_scroll_ptr::
	.ds 2
_scroll_cptr::
	.ds 2
_map_buffer::
	.ds 23
_map_cbuffer::
	.ds 23
_dest_ptr::
	.ds 2
_dest_cptr::
	.ds 2
_temp_coord:
	.ds 2
_ScrollUpdateRow___save_10001_360:
	.ds 1
_ScrollUpdateColumn___save_10001_373:
	.ds 1
_MoveScroll_current_column_10000_383:
	.ds 2
_MoveScroll_new_column_10000_383:
	.ds 2
_MoveScroll_current_row_10000_383:
	.ds 2
_MoveScroll_new_row_10000_383:
	.ds 2
_MoveScroll___save_10000_383:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_scroll_top_movement_limit::
	.ds 1
_scroll_bottom_movement_limit::
	.ds 1
_scroll_map::
	.ds 2
_scroll_cmap::
	.ds 2
_scroll_x::
	.ds 2
_scroll_y::
	.ds 2
_scroll_x_vblank::
	.ds 2
_scroll_y_vblank::
	.ds 2
_scroll_target::
	.ds 2
_scroll_offset_x::
	.ds 1
_scroll_offset_y::
	.ds 1
_scroll_h_border::
	.ds 2
_clamp_enabled::
	.ds 1
_pending_h_map::
	.ds 2
_pending_w_map::
	.ds 2
_last_tile_loaded::
	.ds 1
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
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:76: UINT16 ScrollSetTiles(UINT8 first_tile, UINT8 tiles_bank, const struct TilesInfo* tiles) {
;	---------------------------------
; Function ScrollSetTiles
; ---------------------------------
_ScrollSetTiles::
	add	sp, #-8
	ldhl	sp,	#7
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:81: UINT16 offset = first_tile;
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), #0x00
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:83: if(first_tile == 0) {
	ldhl	sp,	#7
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:84: tiles_bank_0 = tiles_bank;
	ld	hl, #_tiles_bank_0
	ld	(hl), e
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:85: tiles_0 = tiles;
	ldhl	sp,	#10
	ld	a, (hl)
	ld	(#_tiles_0),a
	ldhl	sp,	#11
	ld	a, (hl)
	ld	(#_tiles_0 + 1),a
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:88: UINT8 __save = CURRENT_BANK;
	ldh	a, (__current_bank + 0)
	ldhl	sp,	#2
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:89: SWITCH_ROM(tiles_bank);
	ld	a, e
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), e
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:90: n_tiles = tiles->num_frames;
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (bc)
	ldhl	sp,	#6
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:91: palette_entries = tiles->color_data;
	ld	hl, #0x0006
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#3
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:96: set_bkg_data(first_tile, n_tiles, tiles->data);
	ld	l, c
	ld	h, b
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_set_bkg_data
	add	sp, #4
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:99: last_tile_loaded = first_tile + n_tiles;
	ldhl	sp,	#7
	ld	a, (hl-)
	add	a, (hl)
	ld	(#_last_tile_loaded),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:100: for(i = first_tile; i != last_tile_loaded; ++i) {
	ldhl	sp,	#7
	ld	c, (hl)
00105$:
	ld	a, (#_last_tile_loaded)
	sub	a, c
	jr	Z, 00103$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:101: scroll_tile_info[i] = palette_entries ? palette_entries[i - first_tile] : 0;
	ld	de, #_scroll_tile_info
	ld	l, c
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	dec	hl
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00109$
	ld	a, c
	ldhl	sp,	#7
	ld	e, (hl)
	ld	d, #0x00
	sub	a, e
	ld	e, a
	sbc	a, a
	sub	a, d
	ld	d, a
	ldhl	sp,	#3
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	jr	00110$
00109$:
	xor	a, a
00110$:
	ldhl	sp,	#5
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:100: for(i = first_tile; i != last_tile_loaded; ++i) {
	inc	c
	jr	00105$
00103$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:121: SWITCH_ROM(__save);
	ldhl	sp,	#2
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	a, (hl)
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:123: return offset;
	pop	bc
	push	bc
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:124: }
	add	sp, #8
	pop	hl
	pop	af
	jp	(hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:126: void UpdateMapTile(UINT8 bg_or_win, UINT8 x, UINT8 y, UINT16 map_offset, UINT8 data, UINT8* attr) {
;	---------------------------------
; Function UpdateMapTile
; ---------------------------------
_UpdateMapTile::
	ld	c, e
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:128: UINT8* addr = (bg_or_win == TARGET_BKG) ? get_bkg_xy_addr(x, y) : get_win_xy_addr(x, y);
	or	a, a
	jr	NZ, 00104$
	ldhl	sp,	#2
	ld	e, (hl)
	ld	a, c
	call	_get_bkg_xy_addr
	jr	00105$
00104$:
	ldhl	sp,	#2
	ld	e, (hl)
	ld	a, c
	call	_get_win_xy_addr
00105$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:133: ScrollSetAttrTileAddr(addr, (UINT8)map_offset + data, (attr) ? *attr : (UINT8)(map_offset >> 8) + scroll_tile_info[(UINT8)map_offset + data]);
	ldhl	sp,	#3
	ld	a, (hl+)
	inc	hl
	add	a, (hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/include/Scroll.h:168: set_vram_byte(addr, t);
	ld	e, c
	ld	d, b
	call	_set_vram_byte
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:133: ScrollSetAttrTileAddr(addr, (UINT8)map_offset + data, (attr) ? *attr : (UINT8)(map_offset >> 8) + scroll_tile_info[(UINT8)map_offset + data]);
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:134: }
	pop	hl
	add	sp, #6
	jp	(hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:136: UINT16 LoadMap(UINT8 bg_or_win, UINT8 x, UINT8 y, UINT8 map_bank, struct MapInfo* map) {
;	---------------------------------
; Function LoadMap
; ---------------------------------
_LoadMap::
	add	sp, #-15
	ldhl	sp,	#9
	ld	(hl-), a
	ld	(hl), e
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:141: UINT8 __save = CURRENT_BANK;
	ldh	a, (__current_bank + 0)
	ldhl	sp,	#0
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:142: SWITCH_ROM(map_bank);
	ldhl	sp,	#18
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:146: UINT8 load_tiles = (tiles_bank_0 != map->tiles_bank) || (tiles_0 != map->tiles); // If the tile set is the same as the one used for the scroll or the bg (which is stored in tiles_bank_0 and tiles0) then do not load the tiles again
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0008
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#13
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#12
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	ld	hl, #0x0009
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#15
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#14
	ld	(hl), a
	ld	a, (#_tiles_bank_0)
	ldhl	sp,	#10
	sub	a, (hl)
	jr	NZ, 00122$
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	a, (#_tiles_0)
	ldhl	sp,	#6
	sub	a, (hl)
	jr	NZ, 00122$
	ld	a, (#_tiles_0 + 1)
	ldhl	sp,	#7
	sub	a, (hl)
	jr	NZ, 00122$
	xor	a, a
	jr	00123$
00122$:
	ld	a, #0x01
00123$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:147: if (load_tiles) {
	or	a, a
	jr	Z, 00107$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:148: if (map->extra_tiles) {
	ld	hl, #0x000c
	add	hl, bc
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	or	a, h
	jr	Z, 00104$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:149: map_offset = ScrollSetTiles(last_tile_loaded, map->extra_tiles_bank, map->extra_tiles);
	ld	a, c
	add	a, #0x0b
	ld	e, a
	ld	a, b
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	push	bc
	push	hl
	ld	e, a
	ld	a, (_last_tile_loaded)
	call	_ScrollSetTiles
	ldhl	sp,	#3
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	pop	bc
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:150: if (map->tiles) ScrollSetTiles(last_tile_loaded, map->tiles_bank, map->tiles);
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00108$
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	push	bc
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	ld	e, a
	ld	a, (_last_tile_loaded)
	call	_ScrollSetTiles
	pop	bc
	jr	00108$
00104$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:152: map_offset = ScrollSetTiles(last_tile_loaded, map->tiles_bank, map->tiles);
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	push	bc
	push	hl
	ldhl	sp,	#14
	ld	e, (hl)
	ld	a, (_last_tile_loaded)
	call	_ScrollSetTiles
	ldhl	sp,	#3
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	pop	bc
	jr	00108$
00107$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:155: map_offset = 0;
	xor	a, a
	ldhl	sp,	#1
	ld	(hl+), a
	ld	(hl), a
00108$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:159: UINT8* data = map->data;
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#13
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:160: UINT8* attrs = map->attributes;
	ld	hl, #0x0006
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#11
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:161: for (UINT8 j = 0; j < map->height; ++j) {
	ld	hl, #0x0002
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl), a
	ld	hl, #0x0004
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#10
	ld	(hl), #0x00
00117$:
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#10
	ld	e, (hl)
	ld	d, #0x00
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jr	NC, 00112$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:162: for (UINT8 i = 0; i < map->width; ++i) {
	ldhl	sp,	#17
	ld	a, (hl)
	ldhl	sp,	#10
	add	a, (hl)
	ldhl	sp,	#7
	ld	(hl), a
	ld	c, #0x00
00114$:
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	inc	de
	ld	a, (de)
	ld	l, a
	ld	e, c
	ld	d, #0x00
	ld	a, e
	sub	a, b
	ld	a, d
	sbc	a, l
	jr	NC, 00134$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:163: UpdateMapTile(bg_or_win, x + i, y + j, map_offset, *data, attrs);
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#8
	ld	a, (hl)
	add	a, c
	push	bc
	ldhl	sp,	#13
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	push	bc
	inc	sp
	ldhl	sp,	#6
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	ldhl	sp,	#14
	ld	h, (hl)
	push	hl
	inc	sp
	ld	e, a
	ldhl	sp,	#17
	ld	a, (hl)
	call	_UpdateMapTile
	pop	bc
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:165: ++data;
	ldhl	sp,	#13
	inc	(hl)
	jr	NZ, 00200$
	inc	hl
	inc	(hl)
00200$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:166: if (attrs)
	ldhl	sp,	#12
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00115$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:167: ++attrs;
	inc	(hl)
	jr	NZ, 00201$
	inc	hl
	inc	(hl)
00201$:
00115$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:162: for (UINT8 i = 0; i < map->width; ++i) {
	inc	c
	jr	00114$
00134$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:161: for (UINT8 j = 0; j < map->height; ++j) {
	ldhl	sp,	#10
	inc	(hl)
	jr	00117$
00112$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:171: SWITCH_ROM(__save);
	ldhl	sp,	#0
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	a, (hl)
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:174: return map_offset;
	ldhl	sp,	#1
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:175: }
	add	sp, #15
	pop	hl
	add	sp, #4
	jp	(hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:179: void ScrollSetMap(UINT8 map_bank, const struct MapInfo* map) {
;	---------------------------------
; Function ScrollSetMap
; ---------------------------------
_ScrollSetMap::
	dec	sp
	dec	sp
	ldhl	sp,	#1
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:180: UINT8 __save = CURRENT_BANK;
	ld	(hl-), a
	ld	c, e
	ld	b, d
	ldh	a, (__current_bank + 0)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:181: SWITCH_ROM(map_bank);
	ld	(hl+), a
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	a, (hl)
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:182: scroll_tiles_w = map->width;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #_scroll_tiles_w
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:183: scroll_tiles_h = map->height;
	ld	hl, #0x0004
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #_scroll_tiles_h
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:184: scroll_map = map->data;
	ld	e, c
	ld	d, b
	ld	a, (de)
	ld	hl, #_scroll_map
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:185: scroll_cmap = map->attributes;
	ld	hl, #0x0006
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #_scroll_cmap
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:186: scroll_x = 0;
	xor	a, a
	ld	hl, #_scroll_x
	ld	(hl+), a
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:187: scroll_y = 0;
	xor	a, a
	ld	hl, #_scroll_y
	ld	(hl+), a
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:188: scroll_w = TILE_TO_PX(scroll_tiles_w);
	ld	a, (#_scroll_tiles_w)
	ld	(#_scroll_w),a
	ld	a, (#_scroll_tiles_w + 1)
	ld	(#_scroll_w + 1),a
	ld	a, #0x03
00112$:
	ld	hl, #_scroll_w
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00112$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:189: scroll_h = TILE_TO_PX(scroll_tiles_h);
	ld	a, (#_scroll_tiles_h)
	ld	(#_scroll_h),a
	ld	a, (#_scroll_tiles_h + 1)
	ld	(#_scroll_h + 1),a
	ld	a, #0x03
00113$:
	ld	hl, #_scroll_h
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00113$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:190: scroll_bank = map_bank;
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(#_scroll_bank),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:191: if (scroll_target) {
	ld	hl, #_scroll_target + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00102$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:192: scroll_x = scroll_target->x - (SCREEN_WIDTH >> 1);
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	add	a, #0xb0
	ld	hl, #_scroll_x
	ld	(hl+), a
	ld	a, b
	adc	a, #0xff
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:193: scroll_y = scroll_target->y - scroll_bottom_movement_limit; //Move the camera to its bottom limit
	ld	a, (_scroll_target)
	ld	hl, #_scroll_target + 1
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (_scroll_bottom_movement_limit)
	ld	e, a
	ld	d, #0x00
	ld	a, c
	sub	a, e
	ld	hl, #_scroll_y
	ld	(hl+), a
	ld	a, b
	sbc	a, d
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:194: ClampScrollLimits();
	call	_ClampScrollLimits
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:196: pending_h_i = 0;
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:197: pending_w_i = 0;
	xor	a, a
	ld	(#_pending_h_i), a
	ld	(#_pending_w_i),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:198: SWITCH_ROM(__save);
	ldhl	sp,	#0
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	a, (hl)
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:199: }
	inc	sp
	inc	sp
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:201: void ScrollInitTilesFromMap(UINT8 first_tile, UINT8 map_bank, const struct MapInfo* map) {
;	---------------------------------
; Function ScrollInitTilesFromMap
; ---------------------------------
_ScrollInitTilesFromMap::
	dec	sp
	ld	(#_last_tile_loaded),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:203: UINT8 __save = CURRENT_BANK;
	ldh	a, (__current_bank + 0)
	ldhl	sp,	#0
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:204: SWITCH_ROM(map_bank);
	ld	a, e
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), e
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:205: if (map->tiles) ScrollSetTiles(0, map->tiles_bank, map->tiles);
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0009
	add	hl, bc
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	or	a, h
	jr	Z, 00102$
	ld	a, c
	add	a, #0x08
	ld	e, a
	ld	a, b
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	push	bc
	push	hl
	ld	e, a
	xor	a, a
	call	_ScrollSetTiles
	pop	bc
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:206: if (map->extra_tiles) ScrollSetTiles(last_tile_loaded, map->extra_tiles_bank, map->extra_tiles);
	ld	hl, #0x000c
	add	hl, bc
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	or	a, h
	jr	Z, 00104$
	ld	a, c
	add	a, #0x0b
	ld	c, a
	jr	NC, 00121$
	inc	b
00121$:
	ld	a, (bc)
	push	hl
	ld	e, a
	ld	a, (_last_tile_loaded)
	call	_ScrollSetTiles
00104$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:207: SWITCH_ROM(__save);
	ldhl	sp,	#0
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	a, (hl)
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:208: }
	inc	sp
	pop	hl
	pop	af
	jp	(hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:211: void ScrollCollisionsReset(void) {
;	---------------------------------
; Function ScrollCollisionsReset
; ---------------------------------
_ScrollCollisionsReset::
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:212: memset(scroll_collisions, 0, sizeof(scroll_collisions));
	xor	a, a
	inc	a
	push	af
	ld	de, #0x0000
	push	de
	ld	de, #_scroll_collisions
	push	de
	call	_memset
	add	sp, #6
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:213: }
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:215: void ScrollInitCollisionGroup(UINT8 group, const UINT8* coll_list) {
;	---------------------------------
; Function ScrollInitCollisionGroup
; ---------------------------------
_ScrollInitCollisionGroup::
	ld	c, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:216: for (const UINT8 * ptr = coll_list; (*ptr); ptr++)
00103$:
	ld	a, (de)
	or	a, a
	ret	Z
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:217: scroll_collisions[*ptr] |= group;
	add	a, #<(_scroll_collisions)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_scroll_collisions)
	ld	h, a
	ld	a, (hl)
	or	a, c
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:216: for (const UINT8 * ptr = coll_list; (*ptr); ptr++)
	inc	de
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:218: }
	jr	00103$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:220: void ScrollInitCollisionGroupVector(UINT8 group, const UINT8* coll_vector) {
;	---------------------------------
; Function ScrollInitCollisionGroupVector
; ---------------------------------
_ScrollInitCollisionGroupVector::
	ld	c, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:221: for (UINT8 idx = *coll_vector++; (idx); --idx) scroll_collisions[*coll_vector++] |= group;
	ld	a, (de)
	ld	b, a
	inc	de
00103$:
	ld	a, b
	or	a, a
	ret	Z
	ld	a, (de)
	inc	de
	add	a, #<(_scroll_collisions)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_scroll_collisions)
	ld	h, a
	ld	a, (hl)
	or	a, c
	ld	(hl), a
	dec	b
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:222: }
	jr	00103$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:224: void ScrollRemoveCollisionGroupVector(UINT8 group, const UINT8* coll_vector) {
;	---------------------------------
; Function ScrollRemoveCollisionGroupVector
; ---------------------------------
_ScrollRemoveCollisionGroupVector::
	ld	b, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:225: for (UINT8 idx = *coll_vector++; (idx); --idx) scroll_collisions[*coll_vector++] &= ~group;
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, b
	cpl
	ld	b, a
00103$:
	ld	a, c
	or	a, a
	ret	Z
	ld	a, (de)
	inc	de
	add	a, #<(_scroll_collisions)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_scroll_collisions)
	ld	h, a
	ld	a, (hl)
	and	a, b
	ld	(hl), a
	dec	c
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:226: }
	jr	00103$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:228: void ScrollInitCollisions(const UINT8* coll_list, const UINT8* coll_list_down) {
;	---------------------------------
; Function ScrollInitCollisions
; ---------------------------------
_ScrollInitCollisions::
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:229: ScrollCollisionsReset();
	push	bc
	push	de
	call	_ScrollCollisionsReset
	pop	de
	pop	bc
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:230: if (coll_list) {
	ld	a, d
	or	a, e
	jr	Z, 00102$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:231: ScrollInitCollisionGroup((COLL_GROUP_DEFAULT | COLL_GROUP_DOWN), coll_list);
	push	bc
	ld	a, #0x81
	call	_ScrollInitCollisionGroup
	pop	bc
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:233: if (coll_list_down) {
	ld	a, b
	or	a, c
	ret	Z
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:234: ScrollInitCollisionGroup(COLL_GROUP_DOWN, coll_list_down);
	ld	e, c
	ld	d, b
	ld	a, #0x80
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:236: }
	jp	_ScrollInitCollisionGroup
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:238: void ScrollScreenRedraw(void) {
;	---------------------------------
; Function ScrollScreenRedraw
; ---------------------------------
_ScrollScreenRedraw::
	add	sp, #-4
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:239: UINT8 __save = CURRENT_BANK;
	ldh	a, (__current_bank + 0)
	ldhl	sp,	#0
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:240: SWITCH_ROM(scroll_bank);
	ld	a, (_scroll_bank)
	ldh	(__current_bank + 0), a
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:241: INT16 y = PX_TO_TILE(scroll_y) - SCREEN_PAD_TOP;
	ld	hl, #_scroll_y
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	de, #0x0001
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ldhl	sp,	#2
	ld	(hl-), a
	ld	(hl), e
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:242: INT16 x = PX_TO_TILE(scroll_x) - SCREEN_PAD_LEFT;
	ld	hl, #_scroll_x
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	dec	de
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:243: for (UINT8 i = 0u; i != (SCREEN_TILE_REFRES_H) && y != scroll_h; ++i) ScrollUpdateRow(x,  y++);
	ldhl	sp,	#3
	ld	(hl), #0x00
00104$:
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x15
	jr	Z, 00101$
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_scroll_h
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00131$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	Z, 00101$
00131$:
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	ld	b, a
	inc	(hl)
	jr	NZ, 00132$
	inc	hl
	inc	(hl)
00132$:
	push	de
	call	_ScrollUpdateRow
	pop	de
	ldhl	sp,	#3
	inc	(hl)
	jr	00104$
00101$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:244: SWITCH_ROM(__save);
	ldhl	sp,	#0
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	a, (hl)
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:245: }
	add	sp, #4
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:247: void InitScroll(UINT8 map_bank, const struct MapInfo* map, const UINT8* coll_list, const UINT8* coll_list_down) {
;	---------------------------------
; Function InitScroll
; ---------------------------------
_InitScroll::
	ld	c, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:249: ScrollInitTilesFromMap(0, map_bank, map);
	push	bc
	push	de
	push	de
	ld	e, c
	xor	a, a
	call	_ScrollInitTilesFromMap
	pop	de
	pop	bc
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:252: ScrollSetMap(map_bank, map);
	ld	a, c
	call	_ScrollSetMap
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:255: ScrollInitCollisions(coll_list, coll_list_down);
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_ScrollInitCollisions
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:258: ScrollScreenRedraw();
	call	_ScrollScreenRedraw
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:259: }
	pop	hl
	add	sp, #4
	jp	(hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:261: static void ScrollSetTileMapPart(UINT8 x, UINT8 y, UINT8 w, UINT8 h, UINT8 * map, UINT8 * cmap) {
;	---------------------------------
; Function ScrollSetTileMapPart
; ---------------------------------
_ScrollSetTileMapPart:
	ld	b, e
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:270: set_tile_map(x, y, w, h, map);
	ldhl	sp,	#4
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	dec	hl
	push	de
	ld	h, (hl)
	push	hl
	inc	sp
	ldhl	sp,	#5
	ld	h, (hl)
	ld	l, b
	push	hl
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:271: }
	pop	hl
	add	sp, #6
	jp	(hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:273: static void ScrollSetTileMapRow(INT16 x, INT16 y, UINT8 w, UINT8 * map, UINT8 * cmap) {
;	---------------------------------
; Function ScrollSetTileMapRow
; ---------------------------------
_ScrollSetTileMapRow:
	dec	sp
	dec	sp
	ld	l, c
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:276: UINT8 map_x = (UINT8)(SCREEN_BKG_OFFSET_X + x + scroll_offset_x) & 0x1Fu;
	ld	a, (_scroll_offset_x)
	add	a, e
	and	a, #0x1f
	ld	c, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:277: UINT8 map_y = (UINT8)(y + scroll_offset_y) & 0x1Fu;
	ld	a, (_scroll_offset_y)
	add	a, l
	and	a, #0x1f
	ld	e, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:278: UINT8 first_width = MIN(w, 32u - map_x);
	ld	b, c
	ld	a, #0x20
	sub	a, b
	ld	b, a
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, b
	jr	NC, 00105$
	ld	d, (hl)
	jr	00106$
00105$:
	ld	a, #0x20
	sub	a, c
	ld	d, a
00106$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:279: ScrollSetTileMapPart(map_x, map_y, first_width, 1, map, cmap);
	push	de
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	push	de
	inc	sp
	ld	a, c
	call	_ScrollSetTileMapPart
	pop	de
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:280: if (first_width < w) {
	ld	a, d
	ldhl	sp,	#4
	sub	a, (hl)
	jr	NC, 00103$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:281: ScrollSetTileMapPart(0, map_y, w - first_width, 1, map + first_width, cmap + first_width);
	push	de
	ld	e, d
	ld	d, #0x00
	ldhl	sp,	#9
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	pop	de
	ld	c, l
	ld	b, h
	push	de
	ld	e, d
	ld	d, #0x00
	ldhl	sp,	#7
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	pop	de
	inc	sp
	inc	sp
	push	hl
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, d
	push	bc
	ldhl	sp,	#2
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	xor	a, a
	call	_ScrollSetTileMapPart
00103$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:286: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #5
	jp	(hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:288: static void ScrollSetTileMapColumn(INT16 x, INT16 y, UINT8 h, UINT8 * map, UINT8 * cmap) {
;	---------------------------------
; Function ScrollSetTileMapColumn
; ---------------------------------
_ScrollSetTileMapColumn:
	dec	sp
	dec	sp
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:290: UINT8 map_x = (UINT8)(SCREEN_BKG_OFFSET_X + x + scroll_offset_x) & 0x1Fu;
	ld	a, (_scroll_offset_x)
	add	a, e
	and	a, #0x1f
	ldhl	sp,	#0
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:291: UINT8 map_y = (UINT8)(y + scroll_offset_y) & 0x1Fu;
	ld	a, (_scroll_offset_y)
	add	a, c
	and	a, #0x1f
	ld	e, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:292: UINT8 first_height = MIN(h, 32u - map_y);
	ld	c, e
	ld	a, #0x20
	sub	a, c
	ld	c, a
	ldhl	sp,	#4
	ld	a,(hl)
	cp	a,c
	jr	C, 00106$
	ld	a, #0x20
	sub	a, e
00106$:
	ldhl	sp,	#1
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:293: ScrollSetTileMapPart(map_x, map_y, 1, first_height, map, cmap);
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ldhl	sp,	#5
	ld	a, (hl-)
	ld	b, a
	ld	c, #0x01
	push	bc
	ld	a, (hl)
	call	_ScrollSetTileMapPart
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:294: if (first_height < h) {
	ldhl	sp,	#1
	ld	a, (hl)
	ldhl	sp,	#4
	sub	a, (hl)
	jr	NC, 00103$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:295: ScrollSetTileMapPart(map_x, 0, 1, h - first_height, map + first_height, cmap + first_height);
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#1
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#1
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#1
	sub	a, (hl)
	dec	hl
	push	bc
	push	de
	ld	d, a
	ld	e, #0x01
	push	de
	ld	e, #0x00
	ld	a, (hl)
	call	_ScrollSetTileMapPart
00103$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:300: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #5
	jp	(hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:302: void ScrollUpdateRowR(void) {
;	---------------------------------
; Function ScrollUpdateRowR
; ---------------------------------
_ScrollUpdateRowR::
	dec	sp
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:303: scroll_ptr = pending_w_map;
	ld	a, (#_pending_w_map)
	ld	(#_scroll_ptr),a
	ld	a, (#_pending_w_map + 1)
	ld	(#_scroll_ptr + 1),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:304: dest_ptr = map_buffer;
	ld	hl, #_dest_ptr
	ld	(hl), #<(_map_buffer)
	inc	hl
	ld	(hl), #>(_map_buffer)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:312: scroll_cptr = NULL;
	xor	a, a
	ld	hl, #_scroll_cptr
	ld	(hl+), a
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:314: temp_coord = pending_w_x;
	ld	a, (#_pending_w_x)
	ld	(#_temp_coord),a
	ld	a, (#_pending_w_x + 1)
	ld	(#_temp_coord + 1),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:315: for (UINT8 i = MAX(SCREEN_RESTORE_W, pending_w_i); (i); --i) {
	ld	a, (#_pending_w_i)
	sub	a, #0x05
	jr	NC, 00107$
	ld	a, #0x05
	jr	00108$
00107$:
	ld	a, (_pending_w_i)
00108$:
	ldhl	sp,	#0
	ld	(hl), a
00103$:
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	Z, 00101$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:316: UPDATE_TILE(pending_w_x++, pending_w_y);
	ld	a, (_pending_w_x)
	ld	e, a
	ld	hl, #_pending_w_x + 1
	ld	a, (hl-)
	ld	d, a
	inc	(hl)
	jr	NZ, 00140$
	inc	hl
	inc	(hl)
00140$:
	ld	a, (_pending_w_y)
	ld	c, a
	ld	hl, #_pending_w_y + 1
	ld	b, (hl)
	call	_UPDATE_TILE
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:317: scroll_ptr++;
	ld	hl, #_scroll_ptr
	inc	(hl)
	jr	NZ, 00141$
	inc	hl
	inc	(hl)
00141$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:323: dest_ptr++;
	ld	hl, #_dest_ptr
	inc	(hl)
	jr	NZ, 00142$
	inc	hl
	inc	(hl)
00142$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:315: for (UINT8 i = MAX(SCREEN_RESTORE_W, pending_w_i); (i); --i) {
	ldhl	sp,	#0
	dec	(hl)
	jr	00103$
00101$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:330: ScrollSetTileMapRow(temp_coord, pending_w_y, MAX(SCREEN_RESTORE_W, pending_w_i), map_buffer, map_cbuffer);
	ld	bc, #_map_cbuffer+0
	ld	a, (#_pending_w_i)
	sub	a, #0x05
	jr	NC, 00109$
	ld	a, #0x05
	jr	00110$
00109$:
	ld	a, (_pending_w_i)
00110$:
	push	bc
	ld	de, #_map_buffer
	push	de
	push	af
	inc	sp
	ld	a, (_pending_w_y)
	ld	c, a
	ld	hl, #_pending_w_y + 1
	ld	b, (hl)
	ld	a, (_temp_coord)
	ld	e, a
	ld	hl, #_temp_coord + 1
	ld	d, (hl)
	call	_ScrollSetTileMapRow
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:331: pending_w_i = 0;
	xor	a, a
	ld	(#_pending_w_i),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:332: }
	inc	sp
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:334: void ScrollUpdateRowWithDelay(INT16 x, INT16 y) {
;	---------------------------------
; Function ScrollUpdateRowWithDelay
; ---------------------------------
_ScrollUpdateRowWithDelay::
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:335: if (pending_w_i) ScrollUpdateRowR();
	ld	a, (#_pending_w_i)
	or	a, a
	jr	Z, 00102$
	push	bc
	push	de
	call	_ScrollUpdateRowR
	pop	de
	pop	bc
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:337: pending_w_i = SCREEN_TILE_REFRES_W;
	ld	hl, #_pending_w_i
	ld	(hl), #0x17
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:339: UINT16 offset = scroll_tiles_w * (pending_w_y = y) + (pending_w_x = x);
	ld	hl, #_pending_w_y
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	push	de
	ld	a, (_scroll_tiles_w)
	ld	e, a
	ld	hl, #_scroll_tiles_w + 1
	ld	d, (hl)
	call	__mulint
	pop	de
	ld	hl, #_pending_w_x
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ld	l, e
	ld	h, d
	add	hl, bc
	ld	c, l
	ld	b, h
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:340: pending_w_map = scroll_map + offset;
	ld	a, (#_scroll_map)
	add	a, c
	ld	(#_pending_w_map),a
	ld	a, (#_scroll_map + 1)
	adc	a, b
	ld	(#_pending_w_map + 1),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:344: }
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:346: void ScrollUpdateRow(INT16 x, INT16 y) {
;	---------------------------------
; Function ScrollUpdateRow
; ---------------------------------
_ScrollUpdateRow::
	add	sp, #-1
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:347: UINT16 offset = scroll_tiles_w * y + x;
	push	bc
	push	de
	ld	a, (_scroll_tiles_w)
	ld	e, a
	ld	hl, #_scroll_tiles_w + 1
	ld	d, (hl)
	call	__mulint
	pop	de
	ld	l, e
	ld	h, d
	add	hl, bc
	ld	c, l
	ld	b, h
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:349: scroll_ptr = scroll_map + offset;
	ld	a, (#_scroll_map)
	add	a, c
	ld	(#_scroll_ptr),a
	ld	a, (#_scroll_map + 1)
	adc	a, b
	ld	(#_scroll_ptr + 1),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:350: dest_ptr = map_buffer;
	ld	hl, #_dest_ptr
	ld	(hl), #<(_map_buffer)
	inc	hl
	ld	(hl), #>(_map_buffer)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:358: scroll_cptr = NULL;
	xor	a, a
	ld	hl, #_scroll_cptr
	ld	(hl+), a
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:361: temp_coord = x;
	ld	hl, #_temp_coord
	ld	(hl), e
	inc	hl
	ld	(hl), d
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:363: __save = CURRENT_BANK;
	ldh	a, (__current_bank + 0)
	ld	(#_ScrollUpdateRow___save_10001_360),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:364: SWITCH_ROM(scroll_bank);
	ld	a, (_scroll_bank)
	ldh	(__current_bank + 0), a
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:365: for (UINT8 i = SCREEN_TILE_REFRES_W; (i); --i) {
	ldhl	sp,	#2
	ld	(hl), #0x17
00103$:
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00101$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:366: UPDATE_TILE(x++, y);
	ld	a, e
	ld	l, d
	inc	de
	push	de
	push	hl
	ldhl	sp,	#4
	ld	c, (hl)
	ldhl	sp,	#5
	ld	b, (hl)
	pop	hl
	ld	e, a
	ld	d, l
	call	_UPDATE_TILE
	pop	de
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:367: scroll_ptr++;
	ld	hl, #_scroll_ptr
	inc	(hl)
	jr	NZ, 00122$
	inc	hl
	inc	(hl)
00122$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:373: dest_ptr++;
	ld	hl, #_dest_ptr
	inc	(hl)
	jr	NZ, 00123$
	inc	hl
	inc	(hl)
00123$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:365: for (UINT8 i = SCREEN_TILE_REFRES_W; (i); --i) {
	ldhl	sp,	#2
	dec	(hl)
	jr	00103$
00101$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:380: SWITCH_ROM(__save);
	ld	a, (_ScrollUpdateRow___save_10001_360)
	ldh	(__current_bank + 0), a
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:382: ScrollSetTileMapRow(temp_coord, y, SCREEN_TILE_REFRES_W, map_buffer, map_cbuffer);
	ld	de, #_map_cbuffer
	push	de
	ld	de, #_map_buffer
	push	de
	ld	a, #0x17
	push	af
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (_temp_coord)
	ld	e, a
	ld	hl, #_temp_coord + 1
	ld	d, (hl)
	call	_ScrollSetTileMapRow
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:383: }
	add	sp, #3
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:385: void ScrollUpdateColumnR(void) {
;	---------------------------------
; Function ScrollUpdateColumnR
; ---------------------------------
_ScrollUpdateColumnR::
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:386: scroll_ptr = pending_h_map;
	ld	a, (#_pending_h_map)
	ld	(#_scroll_ptr),a
	ld	a, (#_pending_h_map + 1)
	ld	(#_scroll_ptr + 1),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:387: dest_ptr = map_buffer;
	ld	hl, #_dest_ptr
	ld	(hl), #<(_map_buffer)
	inc	hl
	ld	(hl), #>(_map_buffer)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:395: scroll_cptr = NULL;
	xor	a, a
	ld	hl, #_scroll_cptr
	ld	(hl+), a
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:397: temp_coord = pending_h_y;
	ld	a, (#_pending_h_y)
	ld	(#_temp_coord),a
	ld	a, (#_pending_h_y + 1)
	ld	(#_temp_coord + 1),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:398: for (UINT8 i = MAX(SCREEN_RESTORE_H, pending_h_i); (i); --i) {
	ld	a, (#_pending_h_i)
	sub	a, #0x05
	jr	NC, 00107$
	ld	e, #0x05
	jr	00108$
00107$:
	ld	a, (_pending_h_i)
	ld	e, a
00108$:
00103$:
	ld	a, e
	or	a, a
	jr	Z, 00101$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:399: UPDATE_TILE(pending_h_x, pending_h_y++);
	ld	a, (_pending_h_y)
	ld	c, a
	ld	hl, #_pending_h_y + 1
	ld	a, (hl-)
	ld	b, a
	inc	(hl)
	jr	NZ, 00140$
	inc	hl
	inc	(hl)
00140$:
	push	de
	ld	a, (_pending_h_x)
	ld	e, a
	ld	hl, #_pending_h_x + 1
	ld	d, (hl)
	call	_UPDATE_TILE
	pop	de
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:400: scroll_ptr += scroll_tiles_w;
	ld	a, (#_scroll_ptr)
	ld	hl, #_scroll_tiles_w
	add	a, (hl)
	ld	hl, #_scroll_ptr
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_scroll_tiles_w + 1
	adc	a, (hl)
	ld	(#_scroll_ptr + 1),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:406: dest_ptr++;
	ld	hl, #_dest_ptr
	inc	(hl)
	jr	NZ, 00141$
	inc	hl
	inc	(hl)
00141$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:398: for (UINT8 i = MAX(SCREEN_RESTORE_H, pending_h_i); (i); --i) {
	dec	e
	jr	00103$
00101$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:413: ScrollSetTileMapColumn(pending_h_x, temp_coord, MAX(SCREEN_RESTORE_H, pending_h_i), map_buffer, map_cbuffer);
	ld	bc, #_map_cbuffer+0
	ld	a, (#_pending_h_i)
	sub	a, #0x05
	jr	NC, 00109$
	ld	a, #0x05
	jr	00110$
00109$:
	ld	a, (_pending_h_i)
00110$:
	push	bc
	ld	de, #_map_buffer
	push	de
	push	af
	inc	sp
	ld	a, (_temp_coord)
	ld	c, a
	ld	hl, #_temp_coord + 1
	ld	b, (hl)
	ld	a, (_pending_h_x)
	ld	e, a
	ld	hl, #_pending_h_x + 1
	ld	d, (hl)
	call	_ScrollSetTileMapColumn
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:414: pending_h_i = 0;
	xor	a, a
	ld	(#_pending_h_i),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:415: }
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:417: void ScrollUpdateColumnWithDelay(INT16 x, INT16 y) {
;	---------------------------------
; Function ScrollUpdateColumnWithDelay
; ---------------------------------
_ScrollUpdateColumnWithDelay::
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:418: if (pending_h_i) ScrollUpdateColumnR();
	ld	a, (#_pending_h_i)
	or	a, a
	jr	Z, 00102$
	push	bc
	push	de
	call	_ScrollUpdateColumnR
	pop	de
	pop	bc
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:420: pending_h_i = SCREEN_TILE_REFRES_H;
	ld	hl, #_pending_h_i
	ld	(hl), #0x15
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:422: UINT16 offset = scroll_tiles_w * (pending_h_y = y) + (pending_h_x = x);
	ld	hl, #_pending_h_y
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	push	de
	ld	a, (_scroll_tiles_w)
	ld	e, a
	ld	hl, #_scroll_tiles_w + 1
	ld	d, (hl)
	call	__mulint
	pop	de
	ld	hl, #_pending_h_x
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ld	l, e
	ld	h, d
	add	hl, bc
	ld	c, l
	ld	b, h
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:423: pending_h_map = scroll_map + offset;
	ld	a, (#_scroll_map)
	add	a, c
	ld	(#_pending_h_map),a
	ld	a, (#_scroll_map + 1)
	adc	a, b
	ld	(#_pending_h_map + 1),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:427: }
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:429: void ScrollUpdateColumn(INT16 x, INT16 y) {
;	---------------------------------
; Function ScrollUpdateColumn
; ---------------------------------
_ScrollUpdateColumn::
	add	sp, #-5
	ldhl	sp,	#2
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:430: UINT16 offset = scroll_tiles_w * y + x;
	push	bc
	ld	a, (_scroll_tiles_w)
	ld	e, a
	ld	hl, #_scroll_tiles_w + 1
	ld	d, (hl)
	call	__mulint
	pop	de
	ldhl	sp,	#2
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:432: scroll_ptr = scroll_map + offset;
	ld	a, (#_scroll_map)
	add	a, c
	ld	(#_scroll_ptr),a
	ld	a, (#_scroll_map + 1)
	adc	a, b
	ld	(#_scroll_ptr + 1),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:433: dest_ptr = map_buffer;
	ld	hl, #_dest_ptr
	ld	(hl), #<(_map_buffer)
	inc	hl
	ld	(hl), #>(_map_buffer)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:441: scroll_cptr = NULL;
	xor	a, a
	ld	hl, #_scroll_cptr
	ld	(hl+), a
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:444: temp_coord = y;
	ld	hl, #_temp_coord
	ld	(hl), e
	inc	hl
	ld	(hl), d
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:446: __save = CURRENT_BANK;
	ldh	a, (__current_bank + 0)
	ld	(#_ScrollUpdateColumn___save_10001_373),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:447: SWITCH_ROM(scroll_bank);
	ld	a, (_scroll_bank)
	ldh	(__current_bank + 0), a
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:448: for (UINT8 i = SCREEN_TILE_REFRES_H; (i); --i) {
	ldhl	sp,	#4
	ld	(hl), #0x15
00103$:
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	Z, 00101$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:449: UPDATE_TILE(x, y++);
	dec	hl
	dec	hl
	ld	c, e
	ld	b, d
	inc	de
	push	de
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_UPDATE_TILE
	pop	de
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:450: scroll_ptr += scroll_tiles_w;
	ld	a, (#_scroll_ptr)
	ld	hl, #_scroll_tiles_w
	add	a, (hl)
	ld	hl, #_scroll_ptr
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_scroll_tiles_w + 1
	adc	a, (hl)
	ld	(#_scroll_ptr + 1),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:456: dest_ptr++;
	ld	hl, #_dest_ptr
	inc	(hl)
	jr	NZ, 00122$
	inc	hl
	inc	(hl)
00122$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:448: for (UINT8 i = SCREEN_TILE_REFRES_H; (i); --i) {
	ldhl	sp,	#4
	dec	(hl)
	jr	00103$
00101$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:463: SWITCH_ROM(__save);
	ld	a, (_ScrollUpdateColumn___save_10001_373)
	ldh	(__current_bank + 0), a
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:465: ScrollSetTileMapColumn(x, temp_coord, SCREEN_TILE_REFRES_H, map_buffer, map_cbuffer);
	ld	de, #_map_cbuffer
	push	de
	ld	de, #_map_buffer
	push	de
	ld	a, #0x15
	push	af
	inc	sp
	ld	a, (_temp_coord)
	ld	c, a
	ld	hl, #_temp_coord + 1
	ld	b, (hl)
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_ScrollSetTileMapColumn
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:466: }
	add	sp, #5
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:468: void RefreshScroll(void) {
;	---------------------------------
; Function RefreshScroll
; ---------------------------------
_RefreshScroll::
	add	sp, #-4
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:469: if (scroll_target) {
	ld	hl, #_scroll_target + 1
	ld	a, (hl-)
	or	a, (hl)
	jp	Z, 00108$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:470: UINT16 ny = scroll_y;
	ld	a, (#_scroll_y)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#_scroll_y + 1)
	ldhl	sp,	#1
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:472: if (scroll_bottom_movement_limit < (scroll_target->y - scroll_y)) ny = scroll_target->y - scroll_bottom_movement_limit;
	ld	a, (_scroll_target)
	ld	hl, #_scroll_target + 1
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	b, a
	ld	c, (hl)
	ld	a, (_scroll_y)
	ld	e, a
	ld	hl, #_scroll_y + 1
	ld	d, (hl)
	ld	a, b
	sub	a, e
	ld	e, a
	ld	a, c
	sbc	a, d
	ld	d, a
	ld	a, (_scroll_bottom_movement_limit)
	ld	l, a
	ld	h, #0x00
	ld	a, l
	sub	a, e
	ld	a, h
	sbc	a, d
	jr	NC, 00104$
	ld	a, (_scroll_bottom_movement_limit)
	ldhl	sp,	#2
	ld	(hl+), a
	ld	(hl), #0x00
	ld	e, b
	ld	d, c
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#1
	ld	(hl-), a
	ld	(hl), e
	jr	00105$
00104$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:473: else if (scroll_top_movement_limit > (scroll_target->y - scroll_y)) ny = scroll_target->y - scroll_top_movement_limit;
	ld	a, (_scroll_top_movement_limit)
	ld	l, a
	ld	h, #0x00
	ld	a, e
	sub	a, l
	ld	a, d
	sbc	a, h
	jr	NC, 00105$
	ld	a, (_scroll_top_movement_limit)
	ldhl	sp,	#2
	ld	(hl+), a
	ld	(hl), #0x00
	ld	e, b
	ld	d, c
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#1
	ld	(hl-), a
	ld	(hl), e
00105$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:475: MoveScroll(scroll_target->x - (SCREEN_WIDTH >> 1), ny);
	ld	hl, #_scroll_target
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	add	a, #0xb0
	ld	e, a
	ld	a, b
	adc	a, #0xff
	pop	bc
	push	bc
	ld	d, a
	call	_MoveScroll
00108$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:477: }
	add	sp, #4
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:479: void MoveScroll(INT16 x, INT16 y) {
;	---------------------------------
; Function MoveScroll
; ---------------------------------
_MoveScroll::
	dec	sp
	dec	sp
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:483: __save = CURRENT_BANK;
	ldh	a, (__current_bank + 0)
	ld	(#_MoveScroll___save_10000_383),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:484: SWITCH_ROM(scroll_bank);
	ld	a, (_scroll_bank)
	ldh	(__current_bank + 0), a
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:486: current_column = PX_TO_TILE(scroll_x);
	ld	a, (#_scroll_x)
	ld	(#_MoveScroll_current_column_10000_383),a
	ld	a, (#_scroll_x + 1)
	ld	hl, #_MoveScroll_current_column_10000_383 + 1
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
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:487: current_row    = PX_TO_TILE(scroll_y);
	ld	a, (#_scroll_y)
	ld	(#_MoveScroll_current_row_10000_383),a
	ld	a, (#_scroll_y + 1)
	ld	hl, #_MoveScroll_current_row_10000_383 + 1
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
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:489: scroll_x = x;
	ld	hl, #_scroll_x
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:490: scroll_y = y;
	ld	hl, #_scroll_y
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:491: ClampScrollLimits();
	call	_ClampScrollLimits
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:493: new_column     = PX_TO_TILE(scroll_x);
	ld	a, (#_scroll_x)
	ld	(#_MoveScroll_new_column_10000_383),a
	ld	a, (#_scroll_x + 1)
	ld	hl, #_MoveScroll_new_column_10000_383 + 1
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
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:494: new_row        = PX_TO_TILE(scroll_y);
	ld	a, (#_scroll_y)
	ld	(#_MoveScroll_new_row_10000_383),a
	ld	a, (#_scroll_y + 1)
	ld	hl, #_MoveScroll_new_row_10000_383 + 1
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
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:496: if (current_column != new_column) {
	ld	a, (#_MoveScroll_current_column_10000_383)
	ld	hl, #_MoveScroll_new_column_10000_383
	sub	a, (hl)
	jr	NZ, 00168$
	ld	a, (#_MoveScroll_current_column_10000_383 + 1)
	ld	hl, #_MoveScroll_new_column_10000_383 + 1
	sub	a, (hl)
	jr	Z, 00105$
00168$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:498: ScrollUpdateColumnWithDelay(new_column - SCREEN_PAD_LEFT + SCREEN_TILE_REFRES_W - 1, new_row - SCREEN_PAD_TOP);
	ld	hl, #_MoveScroll_new_row_10000_383
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	dec	bc
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:497: if (new_column > current_column) {
	ld	de, #_MoveScroll_current_column_10000_383
	ld	hl, #_MoveScroll_new_column_10000_383
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00169$
	bit	7, d
	jr	NZ, 00170$
	cp	a, a
	jr	00170$
00169$:
	bit	7, d
	jr	Z, 00170$
	scf
00170$:
	jr	NC, 00102$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:498: ScrollUpdateColumnWithDelay(new_column - SCREEN_PAD_LEFT + SCREEN_TILE_REFRES_W - 1, new_row - SCREEN_PAD_TOP);
	ld	hl, #_MoveScroll_new_column_10000_383
	ld	a, (hl+)
	add	a, #0x15
	ld	e, a
	ld	a, (hl)
	adc	a, #0x00
	ld	d, a
	call	_ScrollUpdateColumnWithDelay
	jr	00105$
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:500: ScrollUpdateColumnWithDelay(new_column - SCREEN_PAD_LEFT,                            new_row - SCREEN_PAD_TOP);
	ld	hl, #_MoveScroll_new_column_10000_383
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	dec	de
	call	_ScrollUpdateColumnWithDelay
00105$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:504: if (current_row != new_row) {
	ld	a, (#_MoveScroll_current_row_10000_383)
	ld	hl, #_MoveScroll_new_row_10000_383
	sub	a, (hl)
	jr	NZ, 00171$
	ld	a, (#_MoveScroll_current_row_10000_383 + 1)
	ld	hl, #_MoveScroll_new_row_10000_383 + 1
	sub	a, (hl)
	jr	Z, 00112$
00171$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:500: ScrollUpdateColumnWithDelay(new_column - SCREEN_PAD_LEFT,                            new_row - SCREEN_PAD_TOP);
	ld	hl, #_MoveScroll_new_column_10000_383
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0001
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#1
	ld	(hl-), a
	ld	(hl), e
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:505: if (new_row > current_row) {
	ld	de, #_MoveScroll_current_row_10000_383
	ld	hl, #_MoveScroll_new_row_10000_383
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00172$
	bit	7, d
	jr	NZ, 00173$
	cp	a, a
	jr	00173$
00172$:
	bit	7, d
	jr	Z, 00173$
	scf
00173$:
	jr	NC, 00109$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:506: ScrollUpdateRowWithDelay(new_column - SCREEN_PAD_LEFT, new_row - SCREEN_PAD_TOP + SCREEN_TILE_REFRES_H - 1);
	ld	hl, #_MoveScroll_new_row_10000_383
	ld	a, (hl+)
	add	a, #0x13
	ld	c, a
	ld	a, (hl)
	adc	a, #0x00
	ld	b, a
	pop	de
	push	de
	call	_ScrollUpdateRowWithDelay
	jr	00112$
00109$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:507: } else if (new_row >= SCREEN_PAD_TOP) {
	ld	hl, #_MoveScroll_new_row_10000_383
	ld	a, (hl+)
	sub	a, #0x01
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	ld	e, a
	bit	7, e
	jr	Z, 00174$
	bit	7, d
	jr	NZ, 00175$
	cp	a, a
	jr	00175$
00174$:
	bit	7, d
	jr	Z, 00175$
	scf
00175$:
	jr	C, 00112$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:508: ScrollUpdateRowWithDelay(new_column - SCREEN_PAD_LEFT, new_row - SCREEN_PAD_TOP);
	ld	hl, #_MoveScroll_new_row_10000_383
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	dec	bc
	pop	de
	push	de
	call	_ScrollUpdateRowWithDelay
00112$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:512: if (pending_w_i) {
	ld	a, (#_pending_w_i)
	or	a, a
	jr	Z, 00114$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:513: ScrollUpdateRowR();
	call	_ScrollUpdateRowR
00114$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:515: if (pending_h_i) {
	ld	a, (#_pending_h_i)
	or	a, a
	jr	Z, 00116$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:516: ScrollUpdateColumnR();
	call	_ScrollUpdateColumnR
00116$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:518: SWITCH_ROM(__save);
	ld	a, (_MoveScroll___save_10000_383)
	ldh	(__current_bank + 0), a
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:519: }
	inc	sp
	inc	sp
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:521: UINT8 GetScrollTile(UINT16 x, UINT16 y) {
;	---------------------------------
; Function GetScrollTile
; ---------------------------------
_GetScrollTile::
	ld	l, b
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:523: UINT8 __save = CURRENT_BANK;
	ldh	a, (__current_bank + 0)
	ld	b, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:524: SWITCH_ROM(scroll_bank);
	ld	a, (_scroll_bank)
	ldh	(__current_bank + 0), a
	ld	(_rROMB0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/include/Scroll.h:157: return scroll_map + (scroll_tiles_w * y + x);
	push	bc
	push	de
	ld	b, l
	ld	a, (_scroll_tiles_w)
	ld	e, a
	ld	hl, #_scroll_tiles_w + 1
	ld	d, (hl)
	call	__mulint
	ld	l, c
	ld	h, b
	pop	de
	pop	bc
	add	hl, de
	ld	a, l
	ld	d, h
	ld	hl, #_scroll_map
	add	a, (hl)
	inc	hl
	ld	e, a
	ld	a, d
	adc	a, (hl)
	ld	d, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:525: ret = *GetScrollTilePtr(x, y);
	ld	a, (de)
	ld	c, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:526: SWITCH_ROM(__save);
	ld	a, b
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), b
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:527: return ret;
	ld	a, c
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:528: }
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:530: void GetMapSize(UINT8 map_bank, const struct MapInfo* map, UINT16* tiles_w, UINT16* tiles_h) {
;	---------------------------------
; Function GetMapSize
; ---------------------------------
_GetMapSize::
	add	sp, #-5
	ld	c, a
	ldhl	sp,	#3
	ld	(hl), e
	inc	hl
	ld	(hl), d
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:531: UINT8 __save = CURRENT_BANK;
	ldh	a, (__current_bank + 0)
	ldhl	sp,	#0
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:532: SWITCH_ROM(map_bank);
	ld	a, c
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), c
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:533: if (tiles_w) *tiles_w = map->width;
	ldhl	sp,	#8
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00102$
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	ld	a,	(hl+)
	ld	h, (hl)
	ld	(bc), a
	inc	bc
	ld	a, h
	ld	(bc), a
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:534: if (tiles_h) *tiles_h = map->height;
	ldhl	sp,	#10
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00104$
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00104$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:535: SWITCH_ROM(__save);
	ldhl	sp,	#0
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	a, (hl)
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:536: }
	add	sp, #5
	pop	hl
	add	sp, #4
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
__xinit__scroll_top_movement_limit:
	.db #0x1e	; 30
__xinit__scroll_bottom_movement_limit:
	.db #0x64	; 100	'd'
__xinit__scroll_map:
	.dw #0x0000
__xinit__scroll_cmap:
	.dw #0x0000
__xinit__scroll_x:
	.dw #0x0000
__xinit__scroll_y:
	.dw #0x0000
__xinit__scroll_x_vblank:
	.dw #0x0000
__xinit__scroll_y_vblank:
	.dw #0x0000
__xinit__scroll_target:
	.dw #0x0000
__xinit__scroll_offset_x:
	.db #0x00	; 0
__xinit__scroll_offset_y:
	.db #0x00	; 0
__xinit__scroll_h_border:
	.dw #0x0000
__xinit__clamp_enabled:
	.db #0x01	; 1
__xinit__pending_h_map:
	.dw #0x0000
__xinit__pending_w_map:
	.dw #0x0000
__xinit__last_tile_loaded:
	.db #0x00	; 0
	.area _CABS (ABS)
