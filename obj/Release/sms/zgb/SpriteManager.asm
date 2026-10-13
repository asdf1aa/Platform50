;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module SpriteManager
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SetPalette
	.globl _RefreshScroll
	.globl _DrawSprite
	.globl _InitSprite
	.globl _set_sprite_data_flip
	.globl _ClearOAMs
	.globl _BufferExchange
	.globl _BufferRotate
	.globl _set_sprite_native_data
	.globl _memset
	.globl _THIS
	.globl _enable_flickering
	.globl _sprite_tile_allocator_top
	.globl _sprite_manager_sprites_pool
	.globl _THIS_IDX
	.globl _last_sprite_pal_loaded
	.globl _last_sprite_loaded
	.globl _sprite_manager_purge
	.globl _sprite_manager_updatables
	.globl _sprite_manager_sprites_poolSTACK
	.globl _sprite_manager_sprites
	.globl _sprite_manager_sprites_mem
	.globl _SpriteManagerReset
	.globl _SpriteManagerLoad
	.globl _SpriteManagerAddEx
	.globl _SpriteManagerRemove
	.globl _SpriteManagerRemoveSprite
	.globl _SpriteManagerUpdate
	.globl _SpriteManagerRenderOnly
	.globl _SpriteManagerRenderPurge
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
_sprite_manager_sprites_mem::
	.ds 880
_sprite_manager_sprites::
	.ds 40
_sprite_manager_sprites_poolSTACK::
	.ds 20
_sprite_manager_updatables::
	.ds 21
_sprite_manager_purge::
	.ds 1
_last_sprite_loaded::
	.ds 2
_last_sprite_pal_loaded::
	.ds 1
_SpriteManagerAddEx_sprite_10000_278:
	.ds 2
_SpriteManagerAddEx_cached_sprite_10000_278:
	.ds 2
_SpriteManagerAddEx_sprite_idx_10000_278:
	.ds 1
_SpriteManagerAddEx_cached_sprite_idx_10000_278:
	.ds 1
_SpriteManagerAddEx___save_10000_278:
	.ds 1
_THIS_IDX::
	.ds 1
_SpriteManagerUpdate___save_10000_286:
	.ds 1
_SpriteManagerRenderOnly___save_10000_300:
	.ds 1
_SpriteManagerRenderPurge___save_10000_304:
	.ds 1
_SpriteManagerRenderPurge_current_10000_304:
	.ds 1
_SpriteManagerRenderPurge_sprite_idx_10000_304:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_sprite_manager_sprites_pool::
	.ds 2
_sprite_tile_allocator_top::
	.ds 2
_enable_flickering::
	.ds 1
_THIS::
	.ds 2
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
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:34: void SpriteManagerReset(void) {
;	---------------------------------
; Function SpriteManagerReset
; ---------------------------------
_SpriteManagerReset::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:35: last_sprite_loaded = sprite_tile_allocator_top;
	ld	hl, (_sprite_tile_allocator_top)
	ld	(_last_sprite_loaded), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:36: last_sprite_pal_loaded = 0;
	xor	a, a
	ld	(_last_sprite_pal_loaded+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:38: UINT8 __save = CURRENT_BANK;
	ld	a, (_MAP_FRAME1+0)
	ld	-1 (ix), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:40: for(UINT8 i = 0u; i != VECTOR_LEN(sprite_manager_updatables); ++ i) {
	ld	c, #0x00
00104$:
	ld	a, (#_sprite_manager_updatables + 0)
	sub	a, c
	jr	Z, 00101$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:41: THIS = sprite_manager_sprites[VECTOR_GET(sprite_manager_updatables, i)];
	inc	c
	ld	hl, #_sprite_manager_updatables
	ld	b, #0x00
	add	hl, bc
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	ld	de, #_sprite_manager_sprites
	add	hl, de
	ld	a, (hl)
	inc	hl
	ld	(_THIS+0), a
	ld	a, (hl)
	ld	(_THIS+1), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:42: SWITCH_ROM(spriteBanks[THIS->type]);
	ld	de, (_THIS)
	ld	hl, #0x001d
	add	hl, de
	ex	de, hl
	ld	a, (de)
	add	a, #<(_spriteBanks)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_spriteBanks)
	ld	h, a
	ld	a, (hl)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:43: spriteDestroyFuncs[THIS->type]();
	ld	a, (de)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	ld	de, #_spriteDestroyFuncs
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ex	de,hl
	call	___sdcc_call_hl
	pop	bc
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:40: for(UINT8 i = 0u; i != VECTOR_LEN(sprite_manager_updatables); ++ i) {
	jr	00104$
00101$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:45: SWITCH_ROM(__save);
	ld	a, -1 (ix)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:48: StackClear(sprite_manager_sprites_pool);
	ld	hl, #(_sprite_manager_sprites_poolSTACK - 1)
	ld	(_sprite_manager_sprites_pool), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:49: for(UINT8 i = 0; i != N_SPRITE_MANAGER_SPRITES; ++i) {
	ld	c, #0x00
00107$:
	ld	a, c
	sub	a, #0x14
	jr	Z, 00102$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:50: sprite_manager_sprites[i] = &sprite_manager_sprites_mem[i];
	ld	e, c
	ld	d, #0x00
	ex	de, hl
	add	hl, hl
	ex	de, hl
	ld	hl, #_sprite_manager_sprites
	add	hl, de
	ex	de, hl
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	a, #<(_sprite_manager_sprites_mem)
	add	a, l
	ld	l, a
	ld	a, #>(_sprite_manager_sprites_mem)
	adc	a, h
	ld	b, a
	ld	a, l
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:51: StackPush(sprite_manager_sprites_pool, i);
	ld	hl, (_sprite_manager_sprites_pool)
	inc	hl
	ld	(_sprite_manager_sprites_pool), hl
	ld	hl, (_sprite_manager_sprites_pool)
	ld	(hl), c
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:49: for(UINT8 i = 0; i != N_SPRITE_MANAGER_SPRITES; ++i) {
	inc	c
	jr	00107$
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:53: ClearOAMs();
	call	_ClearOAMs
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:55: memset(spriteIdxs,   (UINT8)SPRITE_TILE_ALLOC_BOTTOM, SPRITES_ARRAY_LEN);
	ld	hl, #0x0001
	push	hl
	ld	l, h
	push	hl
	ld	hl, #_spriteIdxs
	push	hl
	call	_memset
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:56: memset(spriteIdxsH,  (UINT8)SPRITE_TILE_ALLOC_BOTTOM, SPRITES_ARRAY_LEN);
	ld	hl, #0x0001
	push	hl
	ld	l, h
	push	hl
	ld	hl, #_spriteIdxsH
	push	hl
	call	_memset
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:57: memset(spriteIdxsV,  (UINT8)SPRITE_TILE_ALLOC_BOTTOM, SPRITES_ARRAY_LEN);
	ld	hl, #0x0001
	push	hl
	ld	l, h
	push	hl
	ld	hl, #_spriteIdxsV
	push	hl
	call	_memset
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:58: memset(spriteIdxsHV, (UINT8)SPRITE_TILE_ALLOC_BOTTOM, SPRITES_ARRAY_LEN);
	ld	hl, #0x0001
	push	hl
	ld	l, h
	push	hl
	ld	hl, #_spriteIdxsHV
	push	hl
	call	_memset
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:61: VECTOR_CLEAR(sprite_manager_updatables);
	ld	hl, #_sprite_manager_updatables
	ld	(hl), #0x00
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:62: sprite_manager_purge = FALSE;
	xor	a, a
	ld	(_sprite_manager_purge+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:63: }
	inc	sp
	pop	ix
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:69: UINT8 SpriteManagerLoad(UINT8 sprite_type) {
;	---------------------------------
; Function SpriteManagerLoad
; ---------------------------------
_SpriteManagerLoad::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-19
	add	hl, sp
	ld	sp, hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:71: if (((INT8)spriteIdxs[sprite_type]) >= last_sprite_loaded)
	ld	-1 (ix), a
	add	a, #<(_spriteIdxs)
	ld	-5 (ix), a
	ld	a, #0x00
	adc	a, #>(_spriteIdxs)
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, (hl)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ld	hl, #_last_sprite_loaded
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jp	PO, 00202$
	xor	a, #0x80
00202$:
	jp	M, 00102$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:72: return TRUE;
	ld	a, #0x01
	jp	00123$
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:74: UINT8 __save = CURRENT_BANK;
	ld	a, (_MAP_FRAME1+0)
	ld	-19 (ix), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:75: SWITCH_ROM(spriteDataBanks[sprite_type]);
	ld	bc, #_spriteDataBanks+0
	ld	l, -1 (ix)
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:77: const struct MetaSpriteInfo* data = spriteDatas[sprite_type];
	ld	l, -1 (ix)
	ld	h, #0x00
	add	hl, hl
	ld	iy, #_spriteDatas
	ex	de, hl
	add	iy, de
	ld	a, 0 (iy)
	ld	-18 (ix), a
	ld	a, 1 (iy)
	ld	-17 (ix), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:78: UINT8 n_tiles = data->num_tiles;
	ld	c, -18 (ix)
	ld	b, -17 (ix)
	inc	bc
	inc	bc
	ld	a, (bc)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:81: if ((last_sprite_loaded - n_tiles) < SPRITE_TILE_ALLOC_BOTTOM) {
	ld	-16 (ix), a
	ld	-15 (ix), a
	ld	-14 (ix), #0x00
	ld	a, (_last_sprite_loaded+0)
	sub	a, -15 (ix)
	ld	-3 (ix), a
	ld	a, (_last_sprite_loaded+1)
	sbc	a, -14 (ix)
	ld	-2 (ix), a
	bit	7, -2 (ix)
	jr	Z, 00104$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:82: SWITCH_ROM(__save);
	ld	a, -19 (ix)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:83: return FALSE;
	xor	a, a
	jp	00123$
00104$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:87: last_sprite_loaded -= n_tiles;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(_last_sprite_loaded), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:89: spriteIdxs[sprite_type] = last_sprite_loaded;
	ld	a, (_last_sprite_loaded)
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:90: spriteIdxsH[sprite_type] = last_sprite_loaded;
	ld	a, -1 (ix)
	add	a, #<(_spriteIdxsH)
	ld	-13 (ix), a
	ld	a, #0x00
	adc	a, #>(_spriteIdxsH)
	ld	-12 (ix), a
	ld	a, (_last_sprite_loaded)
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:91: spriteIdxsV[sprite_type] = last_sprite_loaded;
	ld	a, -1 (ix)
	add	a, #<(_spriteIdxsV)
	ld	-11 (ix), a
	ld	a, #0x00
	adc	a, #>(_spriteIdxsV)
	ld	-10 (ix), a
	ld	a, (_last_sprite_loaded)
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:92: spriteIdxsHV[sprite_type] = last_sprite_loaded;
	ld	a, -1 (ix)
	add	a, #<(_spriteIdxsHV)
	ld	-9 (ix), a
	ld	a, #0x00
	adc	a, #>(_spriteIdxsHV)
	ld	-8 (ix), a
	ld	a, (_last_sprite_loaded)
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:94: if (n_tiles) {
	ld	a, -16 (ix)
	or	a, a
	jp	Z, 00118$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:101: set_sprite_native_data(last_sprite_loaded, n_tiles, data->data);
	ld	a, -18 (ix)
	add	a, #0x03
	ld	-7 (ix), a
	ld	a, -17 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, (hl)
	ld	-3 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	ld	-5 (ix), a
	ld	a, -2 (ix)
	ld	-4 (ix), a
	ld	a, -16 (ix)
	ld	-3 (ix), a
	ld	-2 (ix), #0x00
	ld	a, (_last_sprite_loaded)
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	push	hl
	ld	e, -3 (ix)
	ld	d, #0x00
	call	_set_sprite_native_data
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:106: if (spriteFlips[sprite_type] & FLIP_X) {
	ld	a, -1 (ix)
	add	a, #<(_spriteFlips)
	ld	-3 (ix), a
	ld	a, #0x00
	adc	a, #>(_spriteFlips)
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	bit	1, (hl)
	jr	Z, 00108$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:107: if ((last_sprite_loaded - n_tiles) >= SPRITE_TILE_ALLOC_BOTTOM) {
	ld	a, (_last_sprite_loaded+0)
	sub	a, -15 (ix)
	ld	c, a
	ld	a, (_last_sprite_loaded+1)
	sbc	a, -14 (ix)
	ld	b, a
	bit	7, b
	jr	NZ, 00108$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:108: last_sprite_loaded -= n_tiles;
	ld	(_last_sprite_loaded), bc
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:109: spriteIdxsV[sprite_type] = last_sprite_loaded;
	ld	a, (_last_sprite_loaded)
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:110: set_sprite_data_flip(last_sprite_loaded, n_tiles, data->data, FLIP_X);
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, (_last_sprite_loaded)
	ld	h, #0x02
	push	hl
	inc	sp
	push	bc
	ld	l, -16 (ix)
	call	_set_sprite_data_flip
00108$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:114: if (spriteFlips[sprite_type] & FLIP_Y) {
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	a, (hl)
	rrca
	jr	NC, 00112$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:115: if ((last_sprite_loaded - n_tiles) >= SPRITE_TILE_ALLOC_BOTTOM) {
	ld	a, (_last_sprite_loaded+0)
	sub	a, -15 (ix)
	ld	-5 (ix), a
	ld	a, (_last_sprite_loaded+1)
	sbc	a, -14 (ix)
	ld	-4 (ix), a
	bit	7, -4 (ix)
	jr	NZ, 00112$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:116: last_sprite_loaded -= n_tiles;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(_last_sprite_loaded), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:117: spriteIdxsH[sprite_type] = last_sprite_loaded;
	ld	a, (_last_sprite_loaded)
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:118: set_sprite_data_flip(last_sprite_loaded, n_tiles, data->data, FLIP_Y);
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, (_last_sprite_loaded)
	ld	h, #0x01
	push	hl
	inc	sp
	push	bc
	ld	l, -16 (ix)
	call	_set_sprite_data_flip
00112$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:122: if (spriteFlips[sprite_type] & FLIP_XY) {
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	bit	2, (hl)
	jr	Z, 00118$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:123: if ((last_sprite_loaded - n_tiles) >= SPRITE_TILE_ALLOC_BOTTOM) {
	ld	a, (_last_sprite_loaded+0)
	sub	a, -15 (ix)
	ld	-3 (ix), a
	ld	a, (_last_sprite_loaded+1)
	sbc	a, -14 (ix)
	ld	-2 (ix), a
	bit	7, -2 (ix)
	jr	NZ, 00118$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:124: last_sprite_loaded -= n_tiles;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(_last_sprite_loaded), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:125: spriteIdxsHV[sprite_type] = last_sprite_loaded;
	ld	a, (_last_sprite_loaded+0)
	ld	-2 (ix), a
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:126: set_sprite_data_flip(last_sprite_loaded, n_tiles, data->data, FLIP_X | FLIP_Y);
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, (hl)
	ld	-3 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
	ld	a, (_last_sprite_loaded+0)
	ld	-4 (ix), a
	ld	a, #0x03
	push	af
	inc	sp
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	push	hl
	ld	l, -16 (ix)
	ld	a, -4 (ix)
	call	_set_sprite_data_flip
00118$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:134: if (n_pals = data->num_palettes) {
	ld	c, -18 (ix)
	ld	b, -17 (ix)
	ld	hl, #5
	add	hl, bc
	ld	a, (hl)
	ld	-2 (ix), a
	ld	-4 (ix), a
	ld	a, -2 (ix)
	or	a, a
	jr	Z, 00122$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:151: spritePalsOffset[sprite_type] = 0;
	ld	bc, #_spritePalsOffset+0
	ld	l, -1 (ix)
	ld	h, #0x00
	add	hl, bc
	ld	(hl), #0x00
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:153: if (!last_sprite_pal_loaded) {
	ld	a, (_last_sprite_pal_loaded+0)
	or	a, a
	jr	NZ, 00122$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:154: last_sprite_pal_loaded += SetPalette(SPRITES_PALETTE, 0, n_pals, data->palettes, CURRENT_BANK);
	ld	a, -18 (ix)
	ld	-3 (ix), a
	ld	a, -17 (ix)
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	de, #0x0006
	add	hl, de
	ld	a, (hl)
	ld	-3 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
	ld	a, (_MAP_FRAME1)
	push	af
	inc	sp
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	push	hl
	ld	a, -4 (ix)
	push	af
	inc	sp
	ld	l, #0x00
	ld	a, #0x01
	call	_SetPalette
	ld	c, a
	ld	a, (_last_sprite_pal_loaded)
	add	a, c
	ld	(_last_sprite_pal_loaded+0), a
00122$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:160: SWITCH_ROM(__save);
	ld	a, -19 (ix)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:162: return TRUE;
	ld	a, #0x01
00123$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:163: }
	ld	sp, ix
	pop	ix
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:165: Sprite* SpriteManagerAddEx(UINT8 sprite_type, UINT16 x, UINT16 y, void* data) {
;	---------------------------------
; Function SpriteManagerAddEx
; ---------------------------------
_SpriteManagerAddEx::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	ld	b, a
	inc	sp
	inc	sp
	push	de
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:170: if (VECTOR_LEN(sprite_manager_updatables) > (N_SPRITE_MANAGER_SPRITES - 1)) return NULL;
	ld	a, (#_sprite_manager_updatables + 0)
	cp	a, #0x14
	jr	C, 00102$
	ld	de, #0x0000
	jp	00105$
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:172: if (!SpriteManagerLoad(sprite_type)) return NULL;
	push	bc
	ld	a, b
	call	_SpriteManagerLoad
	pop	bc
	or	a, a
	jr	NZ, 00104$
	ld	de, #0x0000
	jp	00105$
00104$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:174: sprite_idx = StackPop(sprite_manager_sprites_pool);
	ld	hl, (_sprite_manager_sprites_pool)
	ld	a, (hl)
	ld	(_SpriteManagerAddEx_sprite_idx_10000_278+0), a
	ld	hl, (_sprite_manager_sprites_pool)
	dec	hl
	ld	(_sprite_manager_sprites_pool), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:175: sprite = sprite_manager_sprites[sprite_idx];
	ld	de, #_sprite_manager_sprites+0
	ld	a, (_SpriteManagerAddEx_sprite_idx_10000_278)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	add	hl, de
	ld	a, (hl)
	inc	hl
	ld	(_SpriteManagerAddEx_sprite_10000_278+0), a
	ld	a, (hl)
	ld	(_SpriteManagerAddEx_sprite_10000_278+1), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:176: sprite->type = sprite_type;
	ld	hl, (_SpriteManagerAddEx_sprite_10000_278)
	ld	de, #0x001d
	add	hl, de
	ld	(hl), b
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:177: sprite->marked_for_removal = FALSE;
	ld	hl, (_SpriteManagerAddEx_sprite_10000_278)
	ld	de, #0x001e
	add	hl, de
	ld	(hl), #0x00
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:178: sprite->lim_x = SPRITE_LIMIT_X;
	ld	hl, (_SpriteManagerAddEx_sprite_10000_278)
	ld	de, #0x0019
	add	hl, de
	ld	(hl), #0x20
	inc	hl
	ld	(hl), #0x00
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:179: sprite->lim_y = SPRITE_LIMIT_Y;
	ld	hl, (_SpriteManagerAddEx_sprite_10000_278)
	ld	de, #0x001b
	add	hl, de
	ld	(hl), #0x20
	inc	hl
	ld	(hl), #0x00
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:180: sprite->mirror = NO_MIRROR;
	ld	hl, (_SpriteManagerAddEx_sprite_10000_278)
	ld	de, #0x0016
	add	hl, de
	ld	(hl), #0x00
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:182: VectorAdd(sprite_manager_updatables, sprite_idx);
	ld	hl, #_sprite_manager_updatables
	ld	e, (hl)
	inc	e
	ld	hl, #_sprite_manager_updatables
	ld	(hl), e
	ld	d, #0x00
	add	hl, de
	ld	a, (_SpriteManagerAddEx_sprite_idx_10000_278)
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:184: InitSprite(sprite, sprite_type);
	push	bc
	inc	sp
	ld	hl, (_SpriteManagerAddEx_sprite_10000_278)
	call	_InitSprite
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:185: sprite->x = x;
	ld	hl, (_SpriteManagerAddEx_sprite_10000_278)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:186: sprite->y = y;
	ld	hl, (_SpriteManagerAddEx_sprite_10000_278)
	inc	hl
	inc	hl
	ld	a, 4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, 5 (ix)
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:187: sprite->unique_id = (UINT16)data;
	ld	hl, (_SpriteManagerAddEx_sprite_10000_278)
	ld	bc, #0x001f
	add	hl, bc
	ld	a, 6 (ix)
	ld	c, 7 (ix)
	ld	(hl), a
	inc	hl
	ld	(hl), c
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:190: cached_sprite = THIS;
	ld	hl, (_THIS)
	ld	(_SpriteManagerAddEx_cached_sprite_10000_278), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:191: cached_sprite_idx = THIS_IDX;
	ld	a, (_THIS_IDX+0)
	ld	(_SpriteManagerAddEx_cached_sprite_idx_10000_278+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:192: THIS = sprite;
	ld	hl, (_SpriteManagerAddEx_sprite_10000_278)
	ld	(_THIS), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:193: THIS_IDX = VECTOR_LEN(sprite_manager_updatables) - 1;
	ld	a, (#_sprite_manager_updatables + 0)
	ld	hl, #_THIS_IDX
	dec	a
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:195: __save = CURRENT_BANK;
	ld	a, (_MAP_FRAME1+0)
	ld	(_SpriteManagerAddEx___save_10000_278+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:196: SWITCH_ROM(spriteBanks[sprite->type]);
	ld	bc, #_spriteBanks+0
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:176: sprite->type = sprite_type;
	ld	de, (_SpriteManagerAddEx_sprite_10000_278)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:196: SWITCH_ROM(spriteBanks[sprite->type]);
	ld	hl, #0x001d
	add	hl, de
	ex	de, hl
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:197: spriteStartFuncs[sprite->type](data);
	ld	bc, #_spriteStartFuncs+0
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, hl
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	bc
	pop	iy
	call	___sdcc_call_iy
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:198: SWITCH_ROM(__save);
	ld	a, (_SpriteManagerAddEx___save_10000_278+0)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:201: THIS = cached_sprite;
	ld	hl, (_SpriteManagerAddEx_cached_sprite_10000_278)
	ld	(_THIS), hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:202: THIS_IDX = cached_sprite_idx;
	ld	a, (_SpriteManagerAddEx_cached_sprite_idx_10000_278+0)
	ld	(_THIS_IDX+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:203: return sprite;
	ld	de, (_SpriteManagerAddEx_sprite_10000_278)
00105$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:204: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	pop	af
	jp	(hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:206: void SpriteManagerRemove(UINT8 idx) {
;	---------------------------------
; Function SpriteManagerRemove
; ---------------------------------
_SpriteManagerRemove::
	ld	e, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:207: sprite_manager_sprites[VECTOR_GET(sprite_manager_updatables, idx)]->marked_for_removal = TRUE;
	ld	bc, #_sprite_manager_sprites+0
	ld	hl, #_sprite_manager_updatables+0
	inc	e
	ld	d, #0x00
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, #0x001e
	add	hl, bc
	ld	(hl), #0x01
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:208: sprite_manager_purge = TRUE;
	ld	hl, #_sprite_manager_purge
	ld	(hl), #0x01
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:209: }
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:211: void SpriteManagerRemoveSprite(Sprite* sprite) {
;	---------------------------------
; Function SpriteManagerRemoveSprite
; ---------------------------------
_SpriteManagerRemoveSprite::
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:212: sprite->marked_for_removal = TRUE; 
	ld	bc, #0x001e
	add	hl, bc
	ld	(hl), #0x01
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:213: sprite_manager_purge = TRUE;
	ld	hl, #_sprite_manager_purge
	ld	(hl), #0x01
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:214: }
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:220: void SpriteManagerUpdate(void) {
;	---------------------------------
; Function SpriteManagerUpdate
; ---------------------------------
_SpriteManagerUpdate::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:223: __save = CURRENT_BANK;
	ld	a, (_MAP_FRAME1+0)
	ld	(_SpriteManagerUpdate___save_10000_286+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:225: SPRITEMANAGER_ITERATE(THIS_IDX, THIS)  {
	xor	a, a
	ld	(_THIS_IDX+0), a
	ld	bc, #_sprite_manager_sprites+0
	ld	hl, #(_sprite_manager_updatables + 1)
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, bc
	ld	a, (hl)
	inc	hl
	ld	(_THIS+0), a
	ld	a, (hl)
	ld	(_THIS+1), a
00116$:
	ld	hl, #_sprite_manager_updatables
	ld	e, (hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:236: BufferExchange(sprite_manager_updatables + 1, THIS_IDX);
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:225: SPRITEMANAGER_ITERATE(THIS_IDX, THIS)  {
	ld	a, (_THIS_IDX+0)
	sub	a, e
	jp	Z, 00109$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:227: if (THIS->marked_for_removal) continue;
	ld	hl, (_THIS)
	ex	(sp), hl
	pop	de
	push	de
	ld	hl, #30
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	NZ, 00108$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:229: SWITCH_ROM(spriteBanks[THIS->type]);
	ld	a, -2 (ix)
	add	a, #0x1d
	ld	e, a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	add	a, #<(_spriteBanks)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_spriteBanks)
	ld	h, a
	ld	a, (hl)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:231: spriteUpdateFuncs[THIS->type]();
	ld	a, (de)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	ld	de, #_spriteUpdateFuncs
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ld	l, e
	ld	h, d
	call	___sdcc_call_hl
	pop	bc
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:233: if (THIS == scroll_target) {
	ld	a, (_THIS+0)
	ld	iy, #_scroll_target
	sub	a, 0 (iy)
	jr	NZ, 00108$
	ld	a, (_THIS+1)
	sub	a, 1 (iy)
	jr	NZ, 00108$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:234: RefreshScroll();
	push	bc
	call	_RefreshScroll
	pop	bc
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:235: if ((THIS_IDX) && (enable_flickering)) {
	ld	a, (_THIS_IDX+0)
	or	a, a
	jr	Z, 00108$
	ld	a, (_enable_flickering+0)
	or	a, a
	jr	Z, 00108$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:236: BufferExchange(sprite_manager_updatables + 1, THIS_IDX);
	ld	a, (_THIS_IDX)
	ld	e, a
	ld	d, #0x00
	push	bc
	ld	hl, #(_sprite_manager_updatables + 1)
	call	_BufferExchange
	pop	bc
00108$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:225: SPRITEMANAGER_ITERATE(THIS_IDX, THIS)  {
	ld	hl, #_THIS_IDX
	inc	(hl)
	ld	a, (_THIS_IDX+0)
	inc	a
	ld	l, a
	ld	h, #0x00
	ld	de, #_sprite_manager_updatables
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, bc
	ld	a, (hl)
	inc	hl
	ld	(_THIS+0), a
	ld	a, (hl)
	ld	(_THIS+1), a
	jp	00116$
00109$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:241: SWITCH_ROM(__save);
	ld	a, (_SpriteManagerUpdate___save_10000_286+0)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:243: if (enable_flickering) {
	ld	a, (_enable_flickering+0)
	or	a, a
	jr	Z, 00117$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:225: SPRITEMANAGER_ITERATE(THIS_IDX, THIS)  {
	ld	hl, #_sprite_manager_updatables
	ld	e, (hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:244: if (scroll_target) {
	ld	a, (_scroll_target+1)
	ld	hl, #_scroll_target
	or	a, (hl)
	jr	Z, 00111$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:245: BufferRotate(sprite_manager_updatables + 2, VECTOR_LEN(sprite_manager_updatables) - 1);
	ld	d, #0x00
	dec	de
	ld	hl, #(_sprite_manager_updatables + 2)
	call	_BufferRotate
	jr	00117$
00111$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:247: BufferRotate(sprite_manager_updatables + 1, VECTOR_LEN(sprite_manager_updatables));
	ld	d, #0x00
	ld	hl, #(_sprite_manager_updatables + 1)
	call	_BufferRotate
00117$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:250: }
	ld	sp, ix
	pop	ix
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:252: void SpriteManagerRenderOnly(void) {
;	---------------------------------
; Function SpriteManagerRenderOnly
; ---------------------------------
_SpriteManagerRenderOnly::
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:254: __save = CURRENT_BANK;
	ld	a, (_MAP_FRAME1+0)
	ld	(_SpriteManagerRenderOnly___save_10000_300+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:256: SPRITEMANAGER_ITERATE(THIS_IDX, THIS) {
	xor	a, a
	ld	(_THIS_IDX+0), a
	ld	bc, #_sprite_manager_sprites+0
	ld	hl, #_sprite_manager_updatables + 1
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, bc
	ld	a, (hl)
	inc	hl
	ld	(_THIS+0), a
	ld	a, (hl)
	ld	(_THIS+1), a
00103$:
	ld	hl, #_sprite_manager_updatables
	ld	e, (hl)
	ld	a, (_THIS_IDX+0)
	sub	a, e
	jr	Z, 00101$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:258: SWITCH_ROM(spriteBanks[THIS->type]);
	ld	hl, (_THIS)
	ld	de, #0x001d
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	ld	de, #_spriteBanks
	add	hl, de
	ld	a, (hl)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:260: DrawSprite();
	push	bc
	call	_DrawSprite
	pop	bc
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:256: SPRITEMANAGER_ITERATE(THIS_IDX, THIS) {
	ld	hl, #_THIS_IDX
	inc	(hl)
	ld	a, (_THIS_IDX+0)
	inc	a
	ld	l, a
	ld	h, #0x00
	ld	de, #_sprite_manager_updatables
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, bc
	ld	a, (hl)
	inc	hl
	ld	(_THIS+0), a
	ld	a, (hl)
	ld	(_THIS+1), a
	jr	00103$
00101$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:262: SWITCH_ROM(__save);
	ld	a, (_SpriteManagerRenderOnly___save_10000_300+0)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:263: }
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:265: void SpriteManagerRenderPurge(void) {
;	---------------------------------
; Function SpriteManagerRenderPurge
; ---------------------------------
_SpriteManagerRenderPurge::
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:267: __save = CURRENT_BANK;
	ld	a, (_MAP_FRAME1+0)
	ld	(_SpriteManagerRenderPurge___save_10000_304+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:269: current = 0;
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:270: SPRITEMANAGER_ITERATE(THIS_IDX, THIS) {
	xor	a, a
	ld	(_SpriteManagerRenderPurge_current_10000_304+0), a
	ld	(_THIS_IDX+0), a
	ld	hl, #_sprite_manager_updatables + 1
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	ld	de, #_sprite_manager_sprites
	add	hl, de
	ld	a, (hl)
	inc	hl
	ld	(_THIS+0), a
	ld	a, (hl)
	ld	(_THIS+1), a
00106$:
	ld	hl, #_sprite_manager_updatables
	ld	c, (hl)
	ld	a, (_THIS_IDX+0)
	sub	a, c
	jp	Z, 00104$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:272: SWITCH_ROM(spriteBanks[THIS->type]);
	ld	de, (_THIS)
	ld	hl, #0x001d
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	add	a, #<(_spriteBanks)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_spriteBanks)
	ld	h, a
	ld	a, (hl)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:274: sprite_idx = VECTOR_GET(sprite_manager_updatables, THIS_IDX);
	ld	a, (_THIS_IDX+0)
	inc	a
	add	a, #<(_sprite_manager_updatables)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_sprite_manager_updatables)
	ld	h, a
	ld	a, (hl)
	ld	(_SpriteManagerRenderPurge_sprite_idx_10000_304+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:276: if (THIS->marked_for_removal) {
	ld	hl, #30
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:277: spriteDestroyFuncs[THIS->type]();
	ld	a, (bc)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	ld	de, #_spriteDestroyFuncs
	add	hl, de
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, c
	ld	h, b
	call	___sdcc_call_hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:279: StackPush(sprite_manager_sprites_pool, sprite_idx);
	ld	hl, (_sprite_manager_sprites_pool)
	inc	hl
	ld	(_sprite_manager_sprites_pool), hl
	ld	hl, (_sprite_manager_sprites_pool)
	ld	a, (_SpriteManagerRenderPurge_sprite_idx_10000_304)
	ld	(hl), a
	jr	00107$
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:282: DrawSprite();
	call	_DrawSprite
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:284: VECTOR_SET_DIRECT(sprite_manager_updatables, current++, sprite_idx);
	ld	a, (_SpriteManagerRenderPurge_current_10000_304)
	ld	c, a
	ld	hl, #_SpriteManagerRenderPurge_current_10000_304
	inc	(hl)
	inc	c
	ld	hl, #_sprite_manager_updatables
	ld	b, #0x00
	add	hl, bc
	ld	a, (_SpriteManagerRenderPurge_sprite_idx_10000_304)
	ld	(hl), a
00107$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:270: SPRITEMANAGER_ITERATE(THIS_IDX, THIS) {
	ld	hl, #_THIS_IDX
	inc	(hl)
	ld	a, (_THIS_IDX+0)
	inc	a
	ld	l, a
	ld	h, #0x00
	ld	de, #_sprite_manager_updatables
	add	hl, de
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	ld	de, #_sprite_manager_sprites
	add	hl, de
	ld	a, (hl)
	inc	hl
	ld	(_THIS+0), a
	ld	a, (hl)
	ld	(_THIS+1), a
	jp	00106$
00104$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:289: VECTOR_LEN(sprite_manager_updatables) = current;
	ld	hl, #_sprite_manager_updatables
	ld	a, (_SpriteManagerRenderPurge_current_10000_304)
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:290: SWITCH_ROM(__save);
	ld	a, (_SpriteManagerRenderPurge___save_10000_304+0)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:291: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__sprite_manager_sprites_pool:
	.dw (_sprite_manager_sprites_poolSTACK - 1)
__xinit__sprite_tile_allocator_top:
	.dw #0x0100
__xinit__enable_flickering:
	.db #0x01	; 1
__xinit__THIS:
	.dw #0x0000
	.area _CABS (ABS)
