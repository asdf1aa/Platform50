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
	.globl _SetPalette
	.globl _set_vram_word
	.globl _get_bkg_xy_addr
	.globl _set_tile_map
	.globl _set_bkg_native_data
	.globl _memset
	.globl _last_tile_loaded
	.globl _pending_w_cmap
	.globl _pending_h_cmap
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
	.ds 64
_dest_ptr::
	.ds 2
_dest_cptr::
	.ds 2
_temp_coord:
	.ds 2
_ScrollUpdateRow___save_10001_326:
	.ds 1
_ScrollUpdateColumn___save_10001_347:
	.ds 1
_MoveScroll_current_column_10000_361:
	.ds 2
_MoveScroll_new_column_10000_361:
	.ds 2
_MoveScroll_current_row_10000_361:
	.ds 2
_MoveScroll_new_row_10000_361:
	.ds 2
_MoveScroll___save_10000_361:
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
_pending_h_cmap::
	.ds 2
_pending_w_cmap::
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
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-9
	add	iy, sp
	ld	sp, iy
	ld	-1 (ix), a
	ld	-2 (ix), l
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:81: UINT16 offset = first_tile;
	ld	a, -1 (ix)
	ld	-9 (ix), a
	ld	-8 (ix), #0x00
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:83: if(first_tile == 0) {
	ld	a, -1 (ix)
	or	a, a
	jr	NZ, 00102$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:84: tiles_bank_0 = tiles_bank;
	ld	a, -2 (ix)
	ld	(_tiles_bank_0+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:85: tiles_0 = tiles;
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	ld	(_tiles_0), hl
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:88: UINT8 __save = CURRENT_BANK;
	ld	a, (_MAP_FRAME1+0)
	ld	-7 (ix), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:89: SWITCH_ROM(tiles_bank);
	ld	a, -2 (ix)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:90: n_tiles = tiles->num_frames;
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	ld	a, (bc)
	ld	-3 (ix), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:91: palette_entries = tiles->color_data;
	push	bc
	pop	iy
	ld	a, 6 (iy)
	ld	-6 (ix), a
	ld	a, 7 (iy)
	ld	-5 (ix), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:94: set_bkg_native_data(first_tile, n_tiles, tiles->data);
	ld	l, c
	ld	h, b
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	pop	iy
	ld	e, -3 (ix)
	ld	d, #0x00
	ld	l, -1 (ix)
	ld	h, #0x00
	push	bc
	push	iy
	call	_set_bkg_native_data
	pop	bc
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:99: last_tile_loaded = first_tile + n_tiles;
	ld	a, -1 (ix)
	add	a, -3 (ix)
	ld	(_last_tile_loaded+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:100: for(i = first_tile; i != last_tile_loaded; ++i) {
	ld	e, -1 (ix)
00105$:
	ld	a, (_last_tile_loaded+0)
	sub	a, e
	jr	Z, 00103$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:101: scroll_tile_info[i] = palette_entries ? palette_entries[i - first_tile] : 0;
	ld	a, #<(_scroll_tile_info)
	add	a, e
	ld	-4 (ix), a
	ld	a, #>(_scroll_tile_info)
	adc	a, #0x00
	ld	-3 (ix), a
	ld	a, -5 (ix)
	or	a, -6 (ix)
	jr	Z, 00109$
	ld	a, e
	ld	l, -1 (ix)
	ld	h, #0x00
	sub	a, l
	ld	l, a
	sbc	a, a
	sub	a, h
	ld	d, a
	ld	a, l
	add	a, -6 (ix)
	ld	l, a
	ld	a, d
	adc	a, -5 (ix)
	ld	h, a
	ld	a, (hl)
	jr	00110$
00109$:
	xor	a, a
00110$:
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:100: for(i = first_tile; i != last_tile_loaded; ++i) {
	inc	e
	jr	00105$
00103$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:116: last_bg_pal_loaded += SetPalette(BG_PALETTE, last_bg_pal_loaded, tiles->num_pals, tiles->pals, tiles_bank);
	ld	e, c
	ld	d, b
	ld	hl, #4
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #3
	add	hl, bc
	ld	a, (hl)
	ld	h, -2 (ix)
	push	hl
	inc	sp
	push	de
	push	af
	inc	sp
	ld	a, (_last_bg_pal_loaded)
	ld	l, a
	xor	a, a
	call	_SetPalette
	ld	c, a
	ld	a, (_last_bg_pal_loaded)
	add	a, c
	ld	(_last_bg_pal_loaded+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:121: SWITCH_ROM(__save);
	ld	a, -7 (ix)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:123: return offset;
	pop	de
	push	de
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:124: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:126: void UpdateMapTile(UINT8 bg_or_win, UINT8 x, UINT8 y, UINT16 map_offset, UINT8 data, UINT8* attr) {
;	---------------------------------
; Function UpdateMapTile
; ---------------------------------
_UpdateMapTile::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:130: if (bg_or_win != TARGET_BKG) return;
	or	a, a
	jr	NZ, 00104$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:131: UINT8 * addr = get_bkg_xy_addr(x, y);
	ld	a, 4 (ix)
	push	af
	ld	a, l
	inc	sp
	push	af
	inc	sp
	call	_get_bkg_xy_addr
	ld	c, l
	ld	b, h
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:133: ScrollSetAttrTileAddr(addr, (UINT8)map_offset + data, (attr) ? *attr : (UINT8)(map_offset >> 8) + scroll_tile_info[(UINT8)map_offset + data]);
	ld	d, 5 (ix)
	ld	a, 9 (ix)
	or	a, 8 (ix)
	jr	Z, 00106$
	ld	l, 8 (ix)
	ld	h, 9 (ix)
	ld	e, (hl)
	jr	00107$
00106$:
	ld	a, 6 (ix)
	ld	-1 (ix), a
	ld	a, d
	ld	e, #0x00
	ld	l, 7 (ix)
	ld	h, #0x00
	add	a, l
	ld	l, a
	ld	a, e
	adc	a, h
	ld	h, a
	ld	a, #<(_scroll_tile_info)
	add	a, l
	ld	l, a
	ld	a, #>(_scroll_tile_info)
	adc	a, h
	ld	h, a
	ld	a, (hl)
	add	a, -1 (ix)
	ld	e, a
00107$:
	ld	a, d
	add	a, 7 (ix)
	ld	l, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/include/Scroll.h:177: set_vram_word(addr, (UINT16)(c << 8) | t);
	ld	d, e
	ld	e, l
	ld	l, c
	ld	h, b
	call	_set_vram_word
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:133: ScrollSetAttrTileAddr(addr, (UINT8)map_offset + data, (attr) ? *attr : (UINT8)(map_offset >> 8) + scroll_tile_info[(UINT8)map_offset + data]);
00104$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:134: }
	inc	sp
	pop	ix
	pop	hl
	pop	af
	pop	af
	pop	af
	jp	(hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:136: UINT16 LoadMap(UINT8 bg_or_win, UINT8 x, UINT8 y, UINT8 map_bank, struct MapInfo* map) {
;	---------------------------------
; Function LoadMap
; ---------------------------------
_LoadMap::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-19
	add	iy, sp
	ld	sp, iy
	ld	-7 (ix), a
	ld	-8 (ix), l
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:138: if (bg_or_win != TARGET_BKG) return 0;
	ld	a, -7 (ix)
	or	a, a
	jr	Z, 00102$
	ld	de, #0x0000
	jp	00121$
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:141: UINT8 __save = CURRENT_BANK;
	ld	a, (_MAP_FRAME1+0)
	ld	-17 (ix), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:142: SWITCH_ROM(map_bank);
	ld	a, 5 (ix)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:146: UINT8 load_tiles = (tiles_bank_0 != map->tiles_bank) || (tiles_0 != map->tiles); // If the tile set is the same as the one used for the scroll or the bg (which is stored in tiles_bank_0 and tiles0) then do not load the tiles again
	ld	a, 6 (ix)
	ld	-2 (ix), a
	ld	a, 7 (ix)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	add	a, #0x08
	ld	-6 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-5 (ix), a
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, (hl)
	ld	-11 (ix), a
	ld	a, -2 (ix)
	add	a, #0x09
	ld	-4 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
	ld	a, (_tiles_bank_0+0)
	sub	a, -11 (ix)
	jr	NZ, 00124$
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, (_tiles_0)
	cp	a, a
	sbc	hl, bc
	jr	NZ, 00124$
	xor	a, a
	jr	00125$
00124$:
	ld	a, #0x01
00125$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:147: if (load_tiles) {
	ld	-9 (ix), a
	or	a, a
	jp	Z, 00109$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:148: if (map->extra_tiles) {
	ld	a, -2 (ix)
	ld	-10 (ix), a
	ld	a, -1 (ix)
	ld	-9 (ix), a
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	de, #0x000c
	add	hl, de
	ld	a, (hl)
	ld	-10 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-9 (ix), a
	or	a, -10 (ix)
	jr	Z, 00106$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:149: map_offset = ScrollSetTiles(last_tile_loaded, map->extra_tiles_bank, map->extra_tiles);
	ld	a, -2 (ix)
	ld	-12 (ix), a
	ld	a, -1 (ix)
	ld	-11 (ix), a
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	de, #0x000b
	add	hl, de
	ld	l, (hl)
	ld	e, -10 (ix)
	ld	d, -9 (ix)
	push	de
	ld	a, (_last_tile_loaded)
	call	_ScrollSetTiles
	ld	-16 (ix), e
	ld	-15 (ix), d
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:150: if (map->tiles) ScrollSetTiles(last_tile_loaded, map->tiles_bank, map->tiles);
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, b
	or	a, c
	jr	Z, 00110$
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	l, (hl)
	push	bc
	ld	a, (_last_tile_loaded)
	call	_ScrollSetTiles
	jr	00110$
00106$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:152: map_offset = ScrollSetTiles(last_tile_loaded, map->tiles_bank, map->tiles);
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	l, -11 (ix)
	ld	a, (_last_tile_loaded)
	call	_ScrollSetTiles
	ld	-16 (ix), e
	ld	-15 (ix), d
	jr	00110$
00109$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:155: map_offset = 0;
	xor	a, a
	ld	-16 (ix), a
	ld	-15 (ix), a
00110$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:159: UINT8* data = map->data;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	ld	-19 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-18 (ix), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:160: UINT8* attrs = map->attributes;
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	hl, #6
	add	hl, bc
	ld	a, (hl)
	ld	-5 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:161: for (UINT8 j = 0; j < map->height; ++j) {
	ld	a, -2 (ix)
	ld	-14 (ix), a
	ld	a, -1 (ix)
	ld	-13 (ix), a
	ld	a, -2 (ix)
	ld	-12 (ix), a
	ld	a, -1 (ix)
	ld	-11 (ix), a
	ld	-6 (ix), #0x00
00119$:
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	de, #0x0004
	add	hl, de
	ld	a, (hl)
	ld	-10 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-9 (ix), a
	ld	a, -6 (ix)
	ld	-2 (ix), a
	ld	-1 (ix), #0x00
	ld	a, -2 (ix)
	sub	a, -10 (ix)
	ld	a, #0x00
	sbc	a, -9 (ix)
	jp	NC, 00114$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:162: for (UINT8 i = 0; i < map->width; ++i) {
	ld	a, -6 (ix)
	add	a, 4 (ix)
	ld	-10 (ix), a
	ld	a, -19 (ix)
	ld	-3 (ix), a
	ld	a, -18 (ix)
	ld	-2 (ix), a
	ld	-1 (ix), #0x00
00116$:
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, -1 (ix)
	xor	a, a
	ld	h, a
	sbc	hl, bc
	jr	NC, 00137$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:163: UpdateMapTile(bg_or_win, x + i, y + j, map_offset, *data, attrs);
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	a, (hl)
	ld	-9 (ix), a
	ld	a, -1 (ix)
	add	a, -8 (ix)
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	push	hl
	ld	h, -9 (ix)
	push	hl
	inc	sp
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	push	hl
	ld	h, -10 (ix)
	push	hl
	inc	sp
	ld	l, a
	ld	a, -7 (ix)
	call	_UpdateMapTile
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:165: ++data;
	inc	-3 (ix)
	jr	NZ, 00209$
	inc	-2 (ix)
00209$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:166: if (attrs)
	ld	a, -4 (ix)
	or	a, -5 (ix)
	jr	Z, 00117$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:167: ++attrs;
	inc	-5 (ix)
	jr	NZ, 00210$
	inc	-4 (ix)
00210$:
00117$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:162: for (UINT8 i = 0; i < map->width; ++i) {
	inc	-1 (ix)
	jr	00116$
00137$:
	ld	a, -3 (ix)
	ld	-19 (ix), a
	ld	a, -2 (ix)
	ld	-18 (ix), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:161: for (UINT8 j = 0; j < map->height; ++j) {
	inc	-6 (ix)
	jp	00119$
00114$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:171: SWITCH_ROM(__save);
	ld	a, -17 (ix)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:174: return map_offset;
	ld	e, -16 (ix)
	ld	d, -15 (ix)
00121$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:175: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	pop	af
	jp	(hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:179: void ScrollSetMap(UINT8 map_bank, const struct MapInfo* map) {
;	---------------------------------
; Function ScrollSetMap
; ---------------------------------
_ScrollSetMap::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	ld	c, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:180: UINT8 __save = CURRENT_BANK;
	ld	a, (_MAP_FRAME1+0)
	ld	-1 (ix), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:181: SWITCH_ROM(map_bank);
	ld	hl, #_MAP_FRAME1
	ld	(hl), c
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:182: scroll_tiles_w = map->width;
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a, (hl)
	inc	hl
	ld	(_scroll_tiles_w+0), a
	ld	a, (hl)
	ld	(_scroll_tiles_w+1), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:183: scroll_tiles_h = map->height;
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	inc	hl
	ld	(_scroll_tiles_h+0), a
	ld	a, (hl)
	ld	(_scroll_tiles_h+1), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:184: scroll_map = map->data;
	ld	l, e
	ld	h, d
	ld	a, (hl)
	inc	hl
	ld	(_scroll_map+0), a
	ld	a, (hl)
	ld	(_scroll_map+1), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:185: scroll_cmap = map->attributes;
	ld	hl, #6
	add	hl, de
	ld	a, (hl)
	inc	hl
	ld	(_scroll_cmap+0), a
	ld	a, (hl)
	ld	(_scroll_cmap+1), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:186: scroll_x = 0;
	ld	hl, #0x0000
	ld	(_scroll_x), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:187: scroll_y = 0;
	ld	(_scroll_y), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:188: scroll_w = TILE_TO_PX(scroll_tiles_w);
	ld	hl, (_scroll_tiles_w)
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	(_scroll_w), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:189: scroll_h = TILE_TO_PX(scroll_tiles_h);
	ld	hl, (_scroll_tiles_h)
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	(_scroll_h), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:190: scroll_bank = map_bank;
	ld	hl, #_scroll_bank
	ld	(hl), c
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:191: if (scroll_target) {
	ld	a, (_scroll_target+1)
	ld	hl, #_scroll_target
	or	a, (hl)
	jr	Z, 00102$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:192: scroll_x = scroll_target->x - (SCREEN_WIDTH >> 1);
	ld	hl, (_scroll_target)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, #_scroll_x
	ld	a, c
	add	a, #0x84
	ld	(hl), a
	inc	hl
	ld	a, b
	adc	a, #0xff
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:193: scroll_y = scroll_target->y - scroll_bottom_movement_limit; //Move the camera to its bottom limit
	ld	hl, (_scroll_target)
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, (_scroll_bottom_movement_limit)
	ld	e, a
	ld	d, #0x00
	ld	hl, #_scroll_y
	ld	a, c
	sub	a, e
	ld	(hl), a
	inc	hl
	ld	a, b
	sbc	a, d
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:194: ClampScrollLimits();
	call	_ClampScrollLimits
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:196: pending_h_i = 0;
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:197: pending_w_i = 0;
	xor	a, a
	ld	(_pending_h_i+0), a
	ld	(_pending_w_i+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:198: SWITCH_ROM(__save);
	ld	a, -1 (ix)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:199: }
	inc	sp
	pop	ix
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:201: void ScrollInitTilesFromMap(UINT8 first_tile, UINT8 map_bank, const struct MapInfo* map) {
;	---------------------------------
; Function ScrollInitTilesFromMap
; ---------------------------------
_ScrollInitTilesFromMap::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	ld	(_last_tile_loaded+0), a
	ld	a, l
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:203: UINT8 __save = CURRENT_BANK;
	push	af
	ld	a, (_MAP_FRAME1+0)
	ld	-1 (ix), a
	pop	af
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:204: SWITCH_ROM(map_bank);
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:205: if (map->tiles) ScrollSetTiles(0, map->tiles_bank, map->tiles);
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	ld	e, c
	ld	d, b
	ld	hl, #9
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, d
	or	a, e
	jr	Z, 00102$
	ld	l, c
	ld	h, b
	push	bc
	ld	bc, #0x0008
	add	hl, bc
	ld	l, (hl)
	push	de
	xor	a, a
	call	_ScrollSetTiles
	pop	bc
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:206: if (map->extra_tiles) ScrollSetTiles(last_tile_loaded, map->extra_tiles_bank, map->extra_tiles);
	ld	e, c
	ld	d, b
	ld	hl, #12
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, d
	or	a, e
	jr	Z, 00104$
	ld	hl, #11
	add	hl, bc
	ld	l, (hl)
	push	de
	ld	a, (_last_tile_loaded)
	call	_ScrollSetTiles
00104$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:207: SWITCH_ROM(__save);
	ld	a, -1 (ix)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:208: }
	inc	sp
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:211: void ScrollCollisionsReset(void) {
;	---------------------------------
; Function ScrollCollisionsReset
; ---------------------------------
_ScrollCollisionsReset::
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:212: memset(scroll_collisions, 0, sizeof(scroll_collisions));
	ld	hl, #0x0100
	push	hl
	ld	h, l
	push	hl
	ld	hl, #_scroll_collisions
	push	hl
	call	_memset
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
	push	hl
	push	de
	call	_ScrollCollisionsReset
	pop	de
	pop	hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:230: if (coll_list) {
	ld	a, h
	or	a, l
	jr	Z, 00102$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:231: ScrollInitCollisionGroup((COLL_GROUP_DEFAULT | COLL_GROUP_DOWN), coll_list);
	ex	de, hl
	push	hl
	ld	a, #0x81
	call	_ScrollInitCollisionGroup
	pop	de
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:233: if (coll_list_down) {
	ld	a, d
	or	a, e
	ret	Z
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:234: ScrollInitCollisionGroup(COLL_GROUP_DOWN, coll_list_down);
	ld	a, #0x80
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:236: }
	jp	_ScrollInitCollisionGroup
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:238: void ScrollScreenRedraw(void) {
;	---------------------------------
; Function ScrollScreenRedraw
; ---------------------------------
_ScrollScreenRedraw::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:239: UINT8 __save = CURRENT_BANK;
	ld	a, (_MAP_FRAME1+0)
	ld	-4 (ix), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:240: SWITCH_ROM(scroll_bank);
	ld	a, (_scroll_bank+0)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:241: INT16 y = PX_TO_TILE(scroll_y) - SCREEN_PAD_TOP;
	ld	bc, (_scroll_y)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:242: INT16 x = PX_TO_TILE(scroll_x) - SCREEN_PAD_LEFT;
	ld	a, (_scroll_x+0)
	ld	-3 (ix), a
	ld	a, (_scroll_x+1)
	ld	-2 (ix), a
	sra	-2 (ix)
	rr	-3 (ix)
	sra	-2 (ix)
	rr	-3 (ix)
	sra	-2 (ix)
	rr	-3 (ix)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:243: for (UINT8 i = 0u; i != (SCREEN_TILE_REFRES_H) && y != scroll_h; ++i) ScrollUpdateRow(x,  y++);
	ld	-1 (ix), #0x00
00104$:
	ld	a, -1 (ix)
	sub	a, #0x1a
	jr	Z, 00101$
	ld	e, c
	ld	d, b
	ld	hl, (_scroll_h)
	cp	a, a
	sbc	hl, de
	jr	Z, 00101$
	ld	e, c
	ld	d, b
	inc	bc
	push	bc
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	call	_ScrollUpdateRow
	pop	bc
	inc	-1 (ix)
	jr	00104$
00101$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:244: SWITCH_ROM(__save);
	ld	a, -4 (ix)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:245: }
	ld	sp, ix
	pop	ix
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:247: void InitScroll(UINT8 map_bank, const struct MapInfo* map, const UINT8* coll_list, const UINT8* coll_list_down) {
;	---------------------------------
; Function InitScroll
; ---------------------------------
_InitScroll::
	ld	l, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:249: ScrollInitTilesFromMap(0, map_bank, map);
	push	hl
	push	de
	push	de
	xor	a, a
	call	_ScrollInitTilesFromMap
	pop	de
	pop	hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:252: ScrollSetMap(map_bank, map);
	ld	a, l
	call	_ScrollSetMap
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:255: ScrollInitCollisions(coll_list, coll_list_down);
	ld	iy, #4
	add	iy, sp
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	ld	l, -2 (iy)
	ld	h, -1 (iy)
	call	_ScrollInitCollisions
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:258: ScrollScreenRedraw();
	call	_ScrollScreenRedraw
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:259: }
	pop	hl
	pop	af
	pop	af
	jp	(hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:273: void ScrollUpdateRowR(void) {
;	---------------------------------
; Function ScrollUpdateRowR
; ---------------------------------
_ScrollUpdateRowR::
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:274: scroll_ptr = pending_w_map;
	ld	hl, (_pending_w_map)
	ld	(_scroll_ptr), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:275: dest_ptr = map_buffer;
	ld	hl, #_map_buffer
	ld	(_dest_ptr), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:277: scroll_cptr = pending_w_cmap;
	ld	hl, (_pending_w_cmap)
	ld	(_scroll_cptr), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:278: dest_cptr = map_buffer + 1;
	ld	hl, #(_map_buffer + 1)
	ld	(_dest_cptr), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:285: temp_coord = pending_w_x;
	ld	hl, (_pending_w_x)
	ld	(_temp_coord), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:286: for (UINT8 i = MAX(SCREEN_RESTORE_W, pending_w_i); (i); --i) {
	ld	a, (_pending_w_i+0)
	sub	a, #0x10
	jr	NC, 00110$
	ld	c, #0x10
	jr	00111$
00110$:
	ld	a, (_pending_w_i)
	ld	c, a
00111$:
00106$:
	ld	a, c
	or	a, a
	jr	Z, 00103$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:287: UPDATE_TILE(pending_w_x++, pending_w_y);
	ld	iy, (_pending_w_x)
	ld	hl, (_pending_w_x)
	inc	hl
	ld	(_pending_w_x), hl
	push	bc
	ld	de, (_pending_w_y)
	push	iy
	pop	hl
	call	_UPDATE_TILE
	pop	bc
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:288: scroll_ptr++;
	ld	hl, (_scroll_ptr)
	inc	hl
	ld	(_scroll_ptr), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:290: dest_ptr += 2;
	ld	hl, (_dest_ptr)
	inc	hl
	inc	hl
	ld	(_dest_ptr), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:291: dest_cptr += 2;
	ld	hl, (_dest_cptr)
	inc	hl
	inc	hl
	ld	(_dest_cptr), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:292: if (scroll_cptr) scroll_cptr++;
	ld	a, (_scroll_cptr+1)
	ld	hl, #_scroll_cptr
	or	a, (hl)
	jr	Z, 00107$
	ld	hl, (_scroll_cptr)
	inc	hl
	ld	(_scroll_cptr), hl
00107$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:286: for (UINT8 i = MAX(SCREEN_RESTORE_W, pending_w_i); (i); --i) {
	dec	c
	jr	00106$
00103$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:301: ScrollSetTileMap(temp_coord, pending_w_y, MAX(SCREEN_RESTORE_W, pending_w_i), 1, map_buffer, map_cbuffer);
	ld	bc, #_map_buffer
	ld	a, (_pending_w_i+0)
	sub	a, #0x10
	jr	NC, 00112$
	ld	e, #0x10
	jr	00113$
00112$:
	ld	a, (_pending_w_i)
	ld	e, a
00113$:
	ld	a, (_pending_w_y)
	ld	d, a
	ld	hl, (_temp_coord)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:270: set_tile_map(SCREEN_BKG_OFFSET_X + x + scroll_offset_x, y + scroll_offset_y, w, h, map);
	ld	a, (_scroll_offset_y)
	add	a, d
	ld	d, a
	inc	l
	ld	a, (_scroll_offset_x)
	add	a, l
	push	bc
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, e
	ld	l, d
	push	hl
	push	af
	inc	sp
	call	_set_tile_map
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:302: pending_w_i = 0;
	xor	a, a
	ld	(_pending_w_i+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:303: }
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:305: void ScrollUpdateRowWithDelay(INT16 x, INT16 y) {
;	---------------------------------
; Function ScrollUpdateRowWithDelay
; ---------------------------------
_ScrollUpdateRowWithDelay::
	ld	c, l
	ld	b, h
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:306: if (pending_w_i) ScrollUpdateRowR();
	ld	a, (_pending_w_i+0)
	or	a, a
	jr	Z, 00102$
	push	bc
	push	de
	call	_ScrollUpdateRowR
	pop	de
	pop	bc
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:308: pending_w_i = SCREEN_TILE_REFRES_W;
	ld	hl, #_pending_w_i
	ld	(hl), #0x20
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:310: UINT16 offset = scroll_tiles_w * (pending_w_y = y) + (pending_w_x = x);
	ld	(_pending_w_y), de
	push	bc
	ld	hl, (_scroll_tiles_w)
	call	__mulint
	ex	de, hl
	pop	bc
	ld	(_pending_w_x), bc
	add	hl, bc
	ld	c, l
	ld	e, h
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:311: pending_w_map = scroll_map + offset;
	ld	a, c
	ld	hl, #_scroll_map
	ld	iy, #_pending_w_map
	add	a, (hl)
	ld	0 (iy), a
	inc	hl
	ld	a, e
	adc	a, (hl)
	inc	iy
	ld	0 (iy), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:313: pending_w_cmap = (scroll_cmap) ? (scroll_cmap + offset) : NULL;
	ld	a, (_scroll_cmap+1)
	ld	hl, #_scroll_cmap
	or	a, (hl)
	jr	Z, 00105$
	ld	hl, (_scroll_cmap)
	ld	b, e
	add	hl, bc
	jr	00106$
00105$:
	ld	hl, #0x0000
00106$:
	ld	(_pending_w_cmap), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:315: }
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:317: void ScrollUpdateRow(INT16 x, INT16 y) {
;	---------------------------------
; Function ScrollUpdateRow
; ---------------------------------
_ScrollUpdateRow::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	ld	c, l
	ld	b, h
	inc	sp
	inc	sp
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:318: UINT16 offset = scroll_tiles_w * y + x;
	push	de
	push	bc
	ld	hl, (_scroll_tiles_w)
	call	__mulint
	pop	bc
	ld	a, c
	ld	l, b
	add	a, e
	ld	e, a
	ld	a, l
	adc	a, d
	ld	d, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:320: scroll_ptr = scroll_map + offset;
	ld	a, e
	ld	iy, #_scroll_map
	add	a, 0 (iy)
	ld	(_scroll_ptr+0), a
	ld	a, d
	adc	a, 1 (iy)
	ld	(_scroll_ptr+1), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:321: dest_ptr = map_buffer;
	ld	hl, #_map_buffer
	ld	(_dest_ptr), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:323: scroll_cptr = (scroll_cmap) ? (scroll_cmap + offset) : NULL;
	ld	a, (_scroll_cmap+1)
	ld	hl, #_scroll_cmap
	or	a, (hl)
	jr	Z, 00110$
	ld	hl, (_scroll_cmap)
	add	hl, de
	jr	00111$
00110$:
	ld	hl, #0x0000
00111$:
	ld	(_scroll_cptr), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:324: dest_cptr = map_buffer + 1;
	ld	hl, #(_map_buffer + 1)
	ld	(_dest_cptr), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:332: temp_coord = x;
	ld	(_temp_coord), bc
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:334: __save = CURRENT_BANK;
	ld	a, (_MAP_FRAME1+0)
	ld	(_ScrollUpdateRow___save_10001_326+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:335: SWITCH_ROM(scroll_bank);
	ld	a, (_scroll_bank+0)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:336: for (UINT8 i = SCREEN_TILE_REFRES_W; (i); --i) {
	ld	-2 (ix), c
	ld	-1 (ix), b
	ld	c, #0x20
00106$:
	ld	a, c
	or	a, a
	jr	Z, 00103$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:337: UPDATE_TILE(x++, y);
	pop	de
	pop	hl
	push	hl
	push	de
	inc	-2 (ix)
	jr	NZ, 00141$
	inc	-1 (ix)
00141$:
	push	bc
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	call	_UPDATE_TILE
	pop	bc
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:338: scroll_ptr++;
	ld	hl, (_scroll_ptr)
	inc	hl
	ld	(_scroll_ptr), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:340: dest_ptr += 2;
	ld	hl, (_dest_ptr)
	inc	hl
	inc	hl
	ld	(_dest_ptr), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:341: dest_cptr += 2;
	ld	hl, (_dest_cptr)
	inc	hl
	inc	hl
	ld	(_dest_cptr), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:342: if (scroll_cptr) scroll_cptr++;
	ld	a, (_scroll_cptr+1)
	ld	hl, #_scroll_cptr
	or	a, (hl)
	jr	Z, 00107$
	ld	hl, (_scroll_cptr)
	inc	hl
	ld	(_scroll_cptr), hl
00107$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:336: for (UINT8 i = SCREEN_TILE_REFRES_W; (i); --i) {
	dec	c
	jr	00106$
00103$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:351: SWITCH_ROM(__save);
	ld	a, (_ScrollUpdateRow___save_10001_326+0)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:353: ScrollSetTileMap(temp_coord, y, SCREEN_TILE_REFRES_W, 1, map_buffer, map_cbuffer);
	ld	hl, (_temp_coord)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:270: set_tile_map(SCREEN_BKG_OFFSET_X + x + scroll_offset_x, y + scroll_offset_y, w, h, map);
	ld	c, -4 (ix)
	ld	a, (_scroll_offset_y)
	add	a, c
	ld	b, a
	inc	l
	ld	a, (_scroll_offset_x)
	add	a, l
	ld	hl, #_map_buffer
	push	hl
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x20
	ld	l, b
	push	hl
	push	af
	inc	sp
	call	_set_tile_map
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:353: ScrollSetTileMap(temp_coord, y, SCREEN_TILE_REFRES_W, 1, map_buffer, map_cbuffer);
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:354: }
	ld	sp, ix
	pop	ix
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:356: void ScrollUpdateColumnR(void) {
;	---------------------------------
; Function ScrollUpdateColumnR
; ---------------------------------
_ScrollUpdateColumnR::
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:357: scroll_ptr = pending_h_map;
	ld	hl, (_pending_h_map)
	ld	(_scroll_ptr), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:358: dest_ptr = map_buffer;
	ld	hl, #_map_buffer
	ld	(_dest_ptr), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:360: scroll_cptr = pending_h_cmap;
	ld	hl, (_pending_h_cmap)
	ld	(_scroll_cptr), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:361: dest_cptr = map_buffer + 1;
	ld	hl, #(_map_buffer + 1)
	ld	(_dest_cptr), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:368: temp_coord = pending_h_y;
	ld	hl, (_pending_h_y)
	ld	(_temp_coord), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:369: for (UINT8 i = MAX(SCREEN_RESTORE_H, pending_h_i); (i); --i) {
	ld	a, (_pending_h_i+0)
	sub	a, #0x0a
	jr	NC, 00110$
	ld	c, #0x0a
	jr	00111$
00110$:
	ld	a, (_pending_h_i)
	ld	c, a
00111$:
00106$:
	ld	a, c
	or	a, a
	jr	Z, 00103$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:370: UPDATE_TILE(pending_h_x, pending_h_y++);
	ld	de, (_pending_h_y)
	ld	hl, (_pending_h_y)
	inc	hl
	ld	(_pending_h_y), hl
	push	bc
	ld	hl, (_pending_h_x)
	call	_UPDATE_TILE
	pop	bc
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:371: scroll_ptr += scroll_tiles_w;
	ld	hl, #_scroll_tiles_w
	push	de
	ld	de, #_scroll_ptr
	ld	a, (de)
	add	a, (hl)
	inc	hl
	ld	(de), a
	inc	de
	ld	a, (de)
	adc	a, (hl)
	ld	(de), a
	pop	de
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:373: dest_ptr += 2;
	ld	hl, (_dest_ptr)
	inc	hl
	inc	hl
	ld	(_dest_ptr), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:374: dest_cptr += 2;
	ld	hl, (_dest_cptr)
	inc	hl
	inc	hl
	ld	(_dest_cptr), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:375: if (scroll_cptr) scroll_cptr += scroll_tiles_w;
	ld	a, (_scroll_cptr+1)
	ld	iy, #_scroll_cptr
	or	a, 0 (iy)
	jr	Z, 00107$
	ld	hl, #_scroll_tiles_w
	push	de
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
00107$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:369: for (UINT8 i = MAX(SCREEN_RESTORE_H, pending_h_i); (i); --i) {
	dec	c
	jr	00106$
00103$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:384: ScrollSetTileMap(pending_h_x, temp_coord, 1, MAX(SCREEN_RESTORE_H, pending_h_i), map_buffer, map_cbuffer);
	ld	bc, #_map_buffer
	ld	a, (_pending_h_i+0)
	sub	a, #0x0a
	jr	NC, 00112$
	ld	e, #0x0a
	jr	00113$
00112$:
	ld	a, (_pending_h_i)
	ld	e, a
00113$:
	ld	a, (_temp_coord)
	ld	d, a
	ld	hl, (_pending_h_x)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:270: set_tile_map(SCREEN_BKG_OFFSET_X + x + scroll_offset_x, y + scroll_offset_y, w, h, map);
	ld	a, (_scroll_offset_y)
	add	a, d
	ld	d, a
	inc	l
	ld	a, (_scroll_offset_x)
	add	a, l
	push	bc
	ld	h, e
	push	hl
	inc	sp
	ld	h, #0x01
	ld	l, d
	push	hl
	push	af
	inc	sp
	call	_set_tile_map
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:385: pending_h_i = 0;
	xor	a, a
	ld	(_pending_h_i+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:386: }
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:388: void ScrollUpdateColumnWithDelay(INT16 x, INT16 y) {
;	---------------------------------
; Function ScrollUpdateColumnWithDelay
; ---------------------------------
_ScrollUpdateColumnWithDelay::
	ld	c, l
	ld	b, h
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:389: if (pending_h_i) ScrollUpdateColumnR();
	ld	a, (_pending_h_i+0)
	or	a, a
	jr	Z, 00102$
	push	bc
	push	de
	call	_ScrollUpdateColumnR
	pop	de
	pop	bc
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:391: pending_h_i = SCREEN_TILE_REFRES_H;
	ld	hl, #_pending_h_i
	ld	(hl), #0x1a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:393: UINT16 offset = scroll_tiles_w * (pending_h_y = y) + (pending_h_x = x);
	ld	(_pending_h_y), de
	push	bc
	ld	hl, (_scroll_tiles_w)
	call	__mulint
	ex	de, hl
	pop	bc
	ld	(_pending_h_x), bc
	add	hl, bc
	ld	c, l
	ld	e, h
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:394: pending_h_map = scroll_map + offset;
	ld	a, c
	ld	hl, #_scroll_map
	ld	iy, #_pending_h_map
	add	a, (hl)
	ld	0 (iy), a
	inc	hl
	ld	a, e
	adc	a, (hl)
	inc	iy
	ld	0 (iy), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:396: pending_h_cmap = (scroll_cmap) ? (scroll_cmap + offset) : NULL;
	ld	a, (_scroll_cmap+1)
	ld	hl, #_scroll_cmap
	or	a, (hl)
	jr	Z, 00105$
	ld	hl, (_scroll_cmap)
	ld	b, e
	add	hl, bc
	jr	00106$
00105$:
	ld	hl, #0x0000
00106$:
	ld	(_pending_h_cmap), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:398: }
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:400: void ScrollUpdateColumn(INT16 x, INT16 y) {
;	---------------------------------
; Function ScrollUpdateColumn
; ---------------------------------
_ScrollUpdateColumn::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:401: UINT16 offset = scroll_tiles_w * y + x;
	push	de
	ld	hl, (_scroll_tiles_w)
	call	__mulint
	pop	bc
	ld	a, -4 (ix)
	ld	l, -3 (ix)
	add	a, e
	ld	e, a
	ld	a, l
	adc	a, d
	ld	d, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:403: scroll_ptr = scroll_map + offset;
	ld	a, e
	ld	iy, #_scroll_map
	add	a, 0 (iy)
	ld	(_scroll_ptr+0), a
	ld	a, d
	adc	a, 1 (iy)
	ld	(_scroll_ptr+1), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:404: dest_ptr = map_buffer;
	ld	hl, #_map_buffer
	ld	(_dest_ptr), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:406: scroll_cptr = (scroll_cmap) ? (scroll_cmap + offset) : NULL;
	ld	a, (_scroll_cmap+1)
	ld	hl, #_scroll_cmap
	or	a, (hl)
	jr	Z, 00110$
	ld	hl, (_scroll_cmap)
	add	hl, de
	jr	00111$
00110$:
	ld	hl, #0x0000
00111$:
	ld	(_scroll_cptr), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:407: dest_cptr = map_buffer + 1;
	ld	hl, #(_map_buffer + 1)
	ld	(_dest_cptr), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:415: temp_coord = y;
	ld	(_temp_coord), bc
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:417: __save = CURRENT_BANK;
	ld	a, (_MAP_FRAME1+0)
	ld	(_ScrollUpdateColumn___save_10001_347+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:418: SWITCH_ROM(scroll_bank);
	ld	a, (_scroll_bank+0)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:419: for (UINT8 i = SCREEN_TILE_REFRES_H; (i); --i) {
	ld	-2 (ix), c
	ld	-1 (ix), b
	ld	c, #0x1a
00106$:
	ld	a, c
	or	a, a
	jr	Z, 00103$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:420: UPDATE_TILE(x, y++);
	pop	hl
	pop	de
	push	de
	push	hl
	inc	-2 (ix)
	jr	NZ, 00141$
	inc	-1 (ix)
00141$:
	push	bc
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	call	_UPDATE_TILE
	pop	bc
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:421: scroll_ptr += scroll_tiles_w;
	ld	hl, #_scroll_tiles_w
	push	de
	ld	de, #_scroll_ptr
	ld	a, (de)
	add	a, (hl)
	inc	hl
	ld	(de), a
	inc	de
	ld	a, (de)
	adc	a, (hl)
	ld	(de), a
	pop	de
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:423: dest_ptr += 2;
	ld	hl, (_dest_ptr)
	inc	hl
	inc	hl
	ld	(_dest_ptr), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:424: dest_cptr += 2;
	ld	hl, (_dest_cptr)
	inc	hl
	inc	hl
	ld	(_dest_cptr), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:425: if (scroll_cptr) scroll_cptr += scroll_tiles_w;
	ld	a, (_scroll_cptr+1)
	ld	iy, #_scroll_cptr
	or	a, 0 (iy)
	jr	Z, 00107$
	ld	hl, #_scroll_tiles_w
	push	de
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
00107$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:419: for (UINT8 i = SCREEN_TILE_REFRES_H; (i); --i) {
	dec	c
	jr	00106$
00103$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:434: SWITCH_ROM(__save);
	ld	a, (_ScrollUpdateColumn___save_10001_347+0)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:436: ScrollSetTileMap(x, temp_coord, 1, SCREEN_TILE_REFRES_H, map_buffer, map_cbuffer);
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:270: set_tile_map(SCREEN_BKG_OFFSET_X + x + scroll_offset_x, y + scroll_offset_y, w, h, map);
	ld	hl, (_temp_coord)
	ld	a, (_scroll_offset_y)
	add	a, l
	ld	b, a
	ld	c, -4 (ix)
	inc	c
	ld	a, (_scroll_offset_x)
	add	a, c
	ld	hl, #_map_buffer
	push	hl
	ld	h, #0x1a
	push	hl
	inc	sp
	ld	h, #0x01
	ld	l, b
	push	hl
	push	af
	inc	sp
	call	_set_tile_map
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:436: ScrollSetTileMap(x, temp_coord, 1, SCREEN_TILE_REFRES_H, map_buffer, map_cbuffer);
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:437: }
	ld	sp, ix
	pop	ix
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:439: void RefreshScroll(void) {
;	---------------------------------
; Function RefreshScroll
; ---------------------------------
_RefreshScroll::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:440: if (scroll_target) {
	ld	a, (_scroll_target+1)
	ld	hl, #_scroll_target
	or	a, (hl)
	jr	Z, 00108$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:441: UINT16 ny = scroll_y;
	ld	de, (_scroll_y)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:443: if (scroll_bottom_movement_limit < (scroll_target->y - scroll_y)) ny = scroll_target->y - scroll_bottom_movement_limit;
	ld	hl, (_scroll_target)
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, (_scroll_y)
	ld	a, c
	sub	a, l
	ld	-2 (ix), a
	ld	a, b
	sbc	a, h
	ld	-1 (ix), a
	ld	a, (_scroll_bottom_movement_limit)
	ld	l, a
	ld	h, #0x00
	ld	a, l
	sub	a, -2 (ix)
	ld	a, h
	sbc	a, -1 (ix)
	jr	NC, 00104$
	ld	a, (_scroll_bottom_movement_limit)
	ld	e, a
	ld	d, #0x00
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ld	d, a
	jr	00105$
00104$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:444: else if (scroll_top_movement_limit > (scroll_target->y - scroll_y)) ny = scroll_target->y - scroll_top_movement_limit;
	ld	a, (_scroll_top_movement_limit)
	ld	l, a
	ld	h, #0x00
	ld	a, -2 (ix)
	sub	a, l
	ld	a, -1 (ix)
	sbc	a, h
	jr	NC, 00105$
	ld	a, (_scroll_top_movement_limit)
	ld	e, a
	ld	d, #0x00
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ld	d, a
00105$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:446: MoveScroll(scroll_target->x - (SCREEN_WIDTH >> 1), ny);
	ld	hl, (_scroll_target)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, c
	add	a, #0x84
	ld	l, a
	ld	a, b
	adc	a, #0xff
	ld	h, a
	call	_MoveScroll
00108$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:448: }
	ld	sp, ix
	pop	ix
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:450: void MoveScroll(INT16 x, INT16 y) {
;	---------------------------------
; Function MoveScroll
; ---------------------------------
_MoveScroll::
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:454: __save = CURRENT_BANK;
	ld	a, (_MAP_FRAME1+0)
	ld	(_MoveScroll___save_10000_361+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:455: SWITCH_ROM(scroll_bank);
	ld	a, (_scroll_bank+0)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:457: current_column = PX_TO_TILE(scroll_x);
	ld	a, (_scroll_x+0)
	ld	(_MoveScroll_current_column_10000_361+0), a
	ld	a, (_scroll_x+1)
	ld	(_MoveScroll_current_column_10000_361+1), a
	ld	iy, #_MoveScroll_current_column_10000_361
	sra	1 (iy)
	rr	0 (iy)
	sra	1 (iy)
	rr	0 (iy)
	sra	1 (iy)
	rr	0 (iy)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:458: current_row    = PX_TO_TILE(scroll_y);
	ld	a, (_scroll_y+0)
	ld	(_MoveScroll_current_row_10000_361+0), a
	ld	a, (_scroll_y+1)
	ld	(_MoveScroll_current_row_10000_361+1), a
	ld	iy, #_MoveScroll_current_row_10000_361
	sra	1 (iy)
	rr	0 (iy)
	sra	1 (iy)
	rr	0 (iy)
	sra	1 (iy)
	rr	0 (iy)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:460: scroll_x = x;
	ld	(_scroll_x), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:461: scroll_y = y;
	ld	(_scroll_y), de
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:462: ClampScrollLimits();
	call	_ClampScrollLimits
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:464: new_column     = PX_TO_TILE(scroll_x);
	ld	a, (_scroll_x+0)
	ld	(_MoveScroll_new_column_10000_361+0), a
	ld	a, (_scroll_x+1)
	ld	(_MoveScroll_new_column_10000_361+1), a
	ld	iy, #_MoveScroll_new_column_10000_361
	sra	1 (iy)
	rr	0 (iy)
	sra	1 (iy)
	rr	0 (iy)
	sra	1 (iy)
	rr	0 (iy)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:465: new_row        = PX_TO_TILE(scroll_y);
	ld	a, (_scroll_y+0)
	ld	(_MoveScroll_new_row_10000_361+0), a
	ld	a, (_scroll_y+1)
	ld	(_MoveScroll_new_row_10000_361+1), a
	ld	iy, #_MoveScroll_new_row_10000_361
	sra	1 (iy)
	rr	0 (iy)
	sra	1 (iy)
	rr	0 (iy)
	sra	1 (iy)
	rr	0 (iy)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:467: if (current_column != new_column) {
	ld	a, (_MoveScroll_current_column_10000_361+0)
	ld	iy, #_MoveScroll_new_column_10000_361
	sub	a, 0 (iy)
	jr	NZ, 00168$
	ld	a, (_MoveScroll_current_column_10000_361+1)
	sub	a, 1 (iy)
	jr	Z, 00105$
00168$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:469: ScrollUpdateColumnWithDelay(new_column - SCREEN_PAD_LEFT + SCREEN_TILE_REFRES_W - 1, new_row - SCREEN_PAD_TOP);
	ld	de, (_MoveScroll_new_row_10000_361)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:468: if (new_column > current_column) {
	ld	hl, #_MoveScroll_current_column_10000_361
	ld	a, (hl)
	sub	a, 0 (iy)
	inc	hl
	ld	a, (hl)
	sbc	a, 1 (iy)
	jp	PO, 00169$
	xor	a, #0x80
00169$:
	jp	P, 00102$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:469: ScrollUpdateColumnWithDelay(new_column - SCREEN_PAD_LEFT + SCREEN_TILE_REFRES_W - 1, new_row - SCREEN_PAD_TOP);
	ld	hl, (_MoveScroll_new_column_10000_361)
	ld	bc, #0x001f
	add	hl, bc
	call	_ScrollUpdateColumnWithDelay
	jr	00105$
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:471: ScrollUpdateColumnWithDelay(new_column - SCREEN_PAD_LEFT,                            new_row - SCREEN_PAD_TOP);
	ld	hl, (_MoveScroll_new_column_10000_361)
	call	_ScrollUpdateColumnWithDelay
00105$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:475: if (current_row != new_row) {
	ld	a, (_MoveScroll_current_row_10000_361+0)
	ld	iy, #_MoveScroll_new_row_10000_361
	sub	a, 0 (iy)
	jr	NZ, 00170$
	ld	a, (_MoveScroll_current_row_10000_361+1)
	sub	a, 1 (iy)
	jr	Z, 00112$
00170$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:471: ScrollUpdateColumnWithDelay(new_column - SCREEN_PAD_LEFT,                            new_row - SCREEN_PAD_TOP);
	ld	bc, (_MoveScroll_new_column_10000_361)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:476: if (new_row > current_row) {
	ld	hl, #_MoveScroll_current_row_10000_361
	ld	a, (hl)
	sub	a, 0 (iy)
	inc	hl
	ld	a, (hl)
	sbc	a, 1 (iy)
	jp	PO, 00171$
	xor	a, #0x80
00171$:
	jp	P, 00109$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:477: ScrollUpdateRowWithDelay(new_column - SCREEN_PAD_LEFT, new_row - SCREEN_PAD_TOP + SCREEN_TILE_REFRES_H - 1);
	ld	hl, (_MoveScroll_new_row_10000_361)
	ld	de, #0x0019
	add	hl, de
	ex	de, hl
	ld	l, c
	ld	h, b
	call	_ScrollUpdateRowWithDelay
	jr	00112$
00109$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:478: } else if (new_row >= SCREEN_PAD_TOP) {
	ld	a, (_MoveScroll_new_row_10000_361+1)
	bit	7, a
	jr	NZ, 00112$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:479: ScrollUpdateRowWithDelay(new_column - SCREEN_PAD_LEFT, new_row - SCREEN_PAD_TOP);
	ld	de, (_MoveScroll_new_row_10000_361)
	ld	l, c
	ld	h, b
	call	_ScrollUpdateRowWithDelay
00112$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:483: if (pending_w_i) {
	ld	a, (_pending_w_i+0)
	or	a, a
	jr	Z, 00114$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:484: ScrollUpdateRowR();
	call	_ScrollUpdateRowR
00114$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:486: if (pending_h_i) {
	ld	a, (_pending_h_i+0)
	or	a, a
	jr	Z, 00116$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:487: ScrollUpdateColumnR();
	call	_ScrollUpdateColumnR
00116$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:489: SWITCH_ROM(__save);
	ld	a, (_MoveScroll___save_10000_361+0)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:490: }
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:492: UINT8 GetScrollTile(UINT16 x, UINT16 y) {
;	---------------------------------
; Function GetScrollTile
; ---------------------------------
_GetScrollTile::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:494: UINT8 __save = CURRENT_BANK;
	ld	a, (_MAP_FRAME1+0)
	ld	-1 (ix), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:495: SWITCH_ROM(scroll_bank);
	ld	a, (_scroll_bank+0)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/include/Scroll.h:157: return scroll_map + (scroll_tiles_w * y + x);
	push	hl
	ld	hl, (_scroll_tiles_w)
	call	__mulint
	pop	hl
	add	hl, de
	ex	de, hl
	ld	hl, (_scroll_map)
	add	hl, de
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:496: ret = *GetScrollTilePtr(x, y);
	ld	c, (hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:497: SWITCH_ROM(__save);
	ld	a, -1 (ix)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:498: return ret;
	ld	a, c
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:499: }
	inc	sp
	pop	ix
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:501: void GetMapSize(UINT8 map_bank, const struct MapInfo* map, UINT16* tiles_w, UINT16* tiles_h) {
;	---------------------------------
; Function GetMapSize
; ---------------------------------
_GetMapSize::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:502: UINT8 __save = CURRENT_BANK;
	push	af
	ld	a, (_MAP_FRAME1+0)
	ld	-1 (ix), a
	pop	af
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:503: SWITCH_ROM(map_bank);
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:504: if (tiles_w) *tiles_w = map->width;
	ld	a, 5 (ix)
	or	a, 4 (ix)
	jr	Z, 00102$
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	(bc), a
	inc	bc
	ld	a, h
	ld	(bc), a
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:505: if (tiles_h) *tiles_h = map->height;
	ld	a, 7 (ix)
	or	a, 6 (ix)
	jr	Z, 00104$
	ld	b, 6 (ix)
	ld	c, 7 (ix)
	ld	hl, #4
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, b
	ld	h, c
	ld	(hl), e
	inc	hl
	ld	(hl), d
00104$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:506: SWITCH_ROM(__save);
	ld	a, -1 (ix)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Scroll.c:507: }
	inc	sp
	pop	ix
	pop	hl
	pop	af
	pop	af
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
__xinit__scroll_top_movement_limit:
	.db #0x1e	; 30
__xinit__scroll_bottom_movement_limit:
	.db #0x96	; 150
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
__xinit__pending_h_cmap:
	.dw #0x0000
__xinit__pending_w_cmap:
	.dw #0x0000
__xinit__last_tile_loaded:
	.db #0x00	; 0
	.area _CABS (ABS)
