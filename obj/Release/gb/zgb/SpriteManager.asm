;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module SpriteManager
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _set_sprite_native_data_wrap
	.globl _RefreshScroll
	.globl _DrawSprite
	.globl _InitSprite
	.globl _ClearOAMs
	.globl _BufferExchange
	.globl _BufferRotate
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
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
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
_SpriteManagerAddEx_sprite_10000_296:
	.ds 2
_SpriteManagerAddEx_cached_sprite_10000_296:
	.ds 2
_SpriteManagerAddEx_sprite_idx_10000_296:
	.ds 1
_SpriteManagerAddEx_cached_sprite_idx_10000_296:
	.ds 1
_SpriteManagerAddEx___save_10000_296:
	.ds 1
_THIS_IDX::
	.ds 1
_SpriteManagerUpdate___save_10000_304:
	.ds 1
_SpriteManagerRenderOnly___save_10000_318:
	.ds 1
_SpriteManagerRenderPurge___save_10000_322:
	.ds 1
_SpriteManagerRenderPurge_current_10000_322:
	.ds 1
_SpriteManagerRenderPurge_sprite_idx_10000_322:
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
	dec	sp
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:35: last_sprite_loaded = sprite_tile_allocator_top;
	ld	a, (#_sprite_tile_allocator_top)
	ld	(#_last_sprite_loaded),a
	ld	a, (#_sprite_tile_allocator_top + 1)
	ld	(#_last_sprite_loaded + 1),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:36: last_sprite_pal_loaded = 0;
	xor	a, a
	ld	(#_last_sprite_pal_loaded),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:38: UINT8 __save = CURRENT_BANK;
	ldh	a, (__current_bank + 0)
	ld	c, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:40: for(UINT8 i = 0u; i != VECTOR_LEN(sprite_manager_updatables); ++ i) {
	ld	b, #0x00
00104$:
	ld	a, (#_sprite_manager_updatables + 0)
	sub	a, b
	jr	Z, 00101$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:41: THIS = sprite_manager_sprites[VECTOR_GET(sprite_manager_updatables, i)];
	inc	b
	ld	a, #<(_sprite_manager_updatables)
	add	a, b
	ld	l, a
	ld	a, #>(_sprite_manager_updatables)
	adc	a, #0x00
	ld	h, a
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
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:42: SWITCH_ROM(spriteBanks[THIS->type]);
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	d, (hl)
	add	a, #0x1d
	ld	e, a
	jr	NC, 00141$
	inc	d
00141$:
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
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:43: spriteDestroyFuncs[THIS->type]();
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
	ld	bc, #00142$
	push	bc
	push	hl
	ret
00142$:
	pop	bc
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:40: for(UINT8 i = 0u; i != VECTOR_LEN(sprite_manager_updatables); ++ i) {
	jr	00104$
00101$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:45: SWITCH_ROM(__save);
	ld	a, c
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), c
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:48: StackClear(sprite_manager_sprites_pool);
	ld	hl, #_sprite_manager_sprites_pool
	ld	(hl), #<((_sprite_manager_sprites_poolSTACK - 1))
	inc	hl
	ld	(hl), #>((_sprite_manager_sprites_poolSTACK - 1))
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:49: for(UINT8 i = 0; i != N_SPRITE_MANAGER_SPRITES; ++i) {
	ldhl	sp,	#0
	ld	(hl), #0x00
00107$:
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x14
	jr	Z, 00102$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:50: sprite_manager_sprites[i] = &sprite_manager_sprites_mem[i];
	ldhl	sp,	#0
	ld	c, (hl)
	ld	b, #0x00
	sla	c
	rl	b
	ld	hl, #_sprite_manager_sprites
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#0
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	de, #_sprite_manager_sprites_mem
	add	hl, de
	ld	a, l
	ld	(bc), a
	inc	bc
	ld	a, h
	ld	(bc), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:51: StackPush(sprite_manager_sprites_pool, i);
	ld	hl, #_sprite_manager_sprites_pool
	inc	(hl)
	jr	NZ, 00145$
	inc	hl
	inc	(hl)
00145$:
	ld	a, (_sprite_manager_sprites_pool)
	ld	c, a
	ld	hl, #_sprite_manager_sprites_pool + 1
	ld	b, (hl)
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(bc), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:49: for(UINT8 i = 0; i != N_SPRITE_MANAGER_SPRITES; ++i) {
	inc	(hl)
	jr	00107$
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:53: ClearOAMs();
	call	_ClearOAMs
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:55: memset(spriteIdxs,   (UINT8)SPRITE_TILE_ALLOC_BOTTOM, SPRITES_ARRAY_LEN);
	ld	de, #0x0005
	push	de
	xor	a, a
	push	af
	ld	de, #_spriteIdxs
	push	de
	call	_memset
	add	sp, #6
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:56: memset(spriteIdxsH,  (UINT8)SPRITE_TILE_ALLOC_BOTTOM, SPRITES_ARRAY_LEN);
	ld	de, #0x0005
	push	de
	xor	a, a
	push	af
	ld	de, #_spriteIdxsH
	push	de
	call	_memset
	add	sp, #6
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:57: memset(spriteIdxsV,  (UINT8)SPRITE_TILE_ALLOC_BOTTOM, SPRITES_ARRAY_LEN);
	ld	de, #0x0005
	push	de
	xor	a, a
	push	af
	ld	de, #_spriteIdxsV
	push	de
	call	_memset
	add	sp, #6
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:58: memset(spriteIdxsHV, (UINT8)SPRITE_TILE_ALLOC_BOTTOM, SPRITES_ARRAY_LEN);
	ld	de, #0x0005
	push	de
	xor	a, a
	push	af
	ld	de, #_spriteIdxsHV
	push	de
	call	_memset
	add	sp, #6
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:61: VECTOR_CLEAR(sprite_manager_updatables);
	ld	hl, #_sprite_manager_updatables
	ld	(hl), #0x00
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:62: sprite_manager_purge = FALSE;
	xor	a, a
	ld	(#_sprite_manager_purge),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:63: }
	inc	sp
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:69: UINT8 SpriteManagerLoad(UINT8 sprite_type) {
;	---------------------------------
; Function SpriteManagerLoad
; ---------------------------------
_SpriteManagerLoad::
	add	sp, #-7
	ldhl	sp,	#6
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:71: if (((INT8)spriteIdxs[sprite_type]) >= last_sprite_loaded)
	ld	de, #_spriteIdxs
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
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
	ld	a, b
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z, 00130$
	bit	7, d
	jr	NZ, 00131$
	cp	a, a
	jr	00131$
00130$:
	bit	7, d
	jr	Z, 00131$
	scf
00131$:
	jr	C, 00102$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:72: return TRUE;
	ld	a, #0x01
	jp	00107$
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:74: UINT8 __save = CURRENT_BANK;
	ldh	a, (__current_bank + 0)
	ldhl	sp,	#2
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:75: SWITCH_ROM(spriteDataBanks[sprite_type]);
	ld	bc, #_spriteDataBanks+0
	ldhl	sp,	#6
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldh	(__current_bank + 0), a
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:77: const struct MetaSpriteInfo* data = spriteDatas[sprite_type];
	ld	bc, #_spriteDatas+0
	ldhl	sp,	#6
	ld	e, (hl)
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#3
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:78: UINT8 n_tiles = data->num_tiles;
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:81: if ((last_sprite_loaded - n_tiles) < SPRITE_TILE_ALLOC_BOTTOM) {
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #_last_sprite_loaded
	ld	a, (hl+)
	sub	a, c
	ld	c, a
	ld	a, (hl)
	sbc	a, b
	ld	b, a
	ld	a, c
	sub	a, #0x80
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	NC, 00104$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:82: SWITCH_ROM(__save);
	ldhl	sp,	#2
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	a, (hl)
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:83: return FALSE;
	xor	a, a
	jr	00107$
00104$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:87: last_sprite_loaded -= n_tiles;
	ld	hl, #_last_sprite_loaded
	ld	a, c
	ld	(hl+), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:89: spriteIdxs[sprite_type] = last_sprite_loaded;
	ld	a, b
	ld	(hl-), a
	ld	a, (hl)
	pop	hl
	push	hl
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:90: spriteIdxsH[sprite_type] = last_sprite_loaded;
	ld	bc, #_spriteIdxsH+0
	ldhl	sp,	#6
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (_last_sprite_loaded)
	ld	(bc), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:91: spriteIdxsV[sprite_type] = last_sprite_loaded;
	ld	bc, #_spriteIdxsV+0
	ldhl	sp,	#6
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (_last_sprite_loaded)
	ld	(bc), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:92: spriteIdxsHV[sprite_type] = last_sprite_loaded;
	ld	bc, #_spriteIdxsHV+0
	ldhl	sp,	#6
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (_last_sprite_loaded)
	ld	(bc), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:94: if (n_tiles) {
	ldhl	sp,	#5
	ld	a, (hl)
	or	a, a
	jr	Z, 00106$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:97: set_sprite_native_data_wrap(last_sprite_loaded, n_tiles, data->data);
	dec	hl
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (_last_sprite_loaded)
	push	bc
	ldhl	sp,	#7
	ld	e, (hl)
	call	_set_sprite_native_data_wrap
00106$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:160: SWITCH_ROM(__save);
	ldhl	sp,	#2
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	a, (hl)
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:162: return TRUE;
	ld	a, #0x01
00107$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:163: }
	add	sp, #7
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:165: Sprite* SpriteManagerAddEx(UINT8 sprite_type, UINT16 x, UINT16 y, void* data) {
;	---------------------------------
; Function SpriteManagerAddEx
; ---------------------------------
_SpriteManagerAddEx::
	dec	sp
	dec	sp
	ld	c, a
	inc	sp
	inc	sp
	push	de
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:170: if (VECTOR_LEN(sprite_manager_updatables) > (N_SPRITE_MANAGER_SPRITES - 1)) return NULL;
	ld	a, (#_sprite_manager_updatables + 0)
	cp	a, #0x14
	jr	C, 00102$
	ld	bc, #0x0000
	jp	00105$
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:172: if (!SpriteManagerLoad(sprite_type)) return NULL;
	push	bc
	ld	a, c
	call	_SpriteManagerLoad
	pop	bc
	or	a, a
	jr	NZ, 00104$
	ld	bc, #0x0000
	jp	00105$
00104$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:174: sprite_idx = StackPop(sprite_manager_sprites_pool);
	ld	a, (_sprite_manager_sprites_pool)
	ld	hl, #_sprite_manager_sprites_pool + 1
	ld	h, (hl)
	ld	l, a
	ld	a, (hl)
	ld	(#_SpriteManagerAddEx_sprite_idx_10000_296),a
	ld	hl, #_sprite_manager_sprites_pool
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:175: sprite = sprite_manager_sprites[sprite_idx];
	ld	de, #_sprite_manager_sprites+0
	ld	a, (_SpriteManagerAddEx_sprite_idx_10000_296)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #_SpriteManagerAddEx_sprite_10000_296
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:176: sprite->type = sprite_type;
	ld	a, (_SpriteManagerAddEx_sprite_10000_296)
	ld	hl, #_SpriteManagerAddEx_sprite_10000_296 + 1
	ld	h, (hl)
	ld	l, a
	ld	de, #0x001d
	add	hl, de
	ld	(hl), c
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:177: sprite->marked_for_removal = FALSE;
	ld	a, (_SpriteManagerAddEx_sprite_10000_296)
	ld	hl, #_SpriteManagerAddEx_sprite_10000_296 + 1
	ld	h, (hl)
	ld	l, a
	ld	de, #0x001e
	add	hl, de
	ld	(hl), #0x00
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:178: sprite->lim_x = SPRITE_LIMIT_X;
	ld	a, (_SpriteManagerAddEx_sprite_10000_296)
	ld	hl, #_SpriteManagerAddEx_sprite_10000_296 + 1
	ld	h, (hl)
	ld	l, a
	ld	de, #0x0019
	add	hl, de
	ld	a, #0x20
	ld	(hl+), a
	ld	(hl), #0x00
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:179: sprite->lim_y = SPRITE_LIMIT_Y;
	ld	a, (_SpriteManagerAddEx_sprite_10000_296)
	ld	hl, #_SpriteManagerAddEx_sprite_10000_296 + 1
	ld	h, (hl)
	ld	l, a
	ld	de, #0x001b
	add	hl, de
	ld	a, #0x20
	ld	(hl+), a
	ld	(hl), #0x00
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:180: sprite->mirror = NO_MIRROR;
	ld	a, (_SpriteManagerAddEx_sprite_10000_296)
	ld	hl, #_SpriteManagerAddEx_sprite_10000_296 + 1
	ld	h, (hl)
	ld	l, a
	ld	de, #0x0016
	add	hl, de
	ld	(hl), #0x00
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:182: VectorAdd(sprite_manager_updatables, sprite_idx);
	ld	a, (#_sprite_manager_updatables + 0)
	inc	a
	ld	(#_sprite_manager_updatables),a
	ld	l, a
	ld	h, #0x00
	ld	de, #_sprite_manager_updatables
	add	hl, de
	ld	a, (_SpriteManagerAddEx_sprite_idx_10000_296)
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:184: InitSprite(sprite, sprite_type);
	ld	a, c
	ld	hl, #_SpriteManagerAddEx_sprite_10000_296
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_InitSprite
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:185: sprite->x = x;
	ld	a, (_SpriteManagerAddEx_sprite_10000_296)
	ld	c, a
	ld	hl, #_SpriteManagerAddEx_sprite_10000_296 + 1
	ld	b, (hl)
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:186: sprite->y = y;
	ld	a, (_SpriteManagerAddEx_sprite_10000_296)
	ld	hl, #_SpriteManagerAddEx_sprite_10000_296 + 1
	ld	b, (hl)
	ld	c, a
	inc	bc
	inc	bc
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:187: sprite->unique_id = (UINT16)data;
	ld	a, (_SpriteManagerAddEx_sprite_10000_296)
	ld	hl, #_SpriteManagerAddEx_sprite_10000_296 + 1
	ld	b, (hl)
	add	a, #0x1f
	ld	c, a
	jr	NC, 00121$
	inc	b
00121$:
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:190: cached_sprite = THIS;
	ld	a, (#_THIS)
	ld	(#_SpriteManagerAddEx_cached_sprite_10000_296),a
	ld	a, (#_THIS + 1)
	ld	(#_SpriteManagerAddEx_cached_sprite_10000_296 + 1),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:191: cached_sprite_idx = THIS_IDX;
	ld	a, (#_THIS_IDX)
	ld	(#_SpriteManagerAddEx_cached_sprite_idx_10000_296),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:192: THIS = sprite;
	ld	a, (#_SpriteManagerAddEx_sprite_10000_296)
	ld	(#_THIS),a
	ld	a, (#_SpriteManagerAddEx_sprite_10000_296 + 1)
	ld	(#_THIS + 1),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:193: THIS_IDX = VECTOR_LEN(sprite_manager_updatables) - 1;
	ld	a, (#_sprite_manager_updatables + 0)
	dec	a
	ld	(#_THIS_IDX),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:195: __save = CURRENT_BANK;
	ldh	a, (__current_bank + 0)
	ld	(#_SpriteManagerAddEx___save_10000_296),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:196: SWITCH_ROM(spriteBanks[sprite->type]);
	ld	bc, #_spriteBanks+0
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:176: sprite->type = sprite_type;
	ld	a, (_SpriteManagerAddEx_sprite_10000_296)
	ld	hl, #_SpriteManagerAddEx_sprite_10000_296 + 1
	ld	d, (hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:196: SWITCH_ROM(spriteBanks[sprite->type]);
	add	a, #0x1d
	ld	e, a
	jr	NC, 00122$
	inc	d
00122$:
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:197: spriteStartFuncs[sprite->type](data);
	ld	bc, #_spriteStartFuncs+0
	ld	a, (de)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ldhl	sp,	#6
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, c
	ld	h, b
	call	___sdcc_call_hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:198: SWITCH_ROM(__save);
	ld	a, (_SpriteManagerAddEx___save_10000_296)
	ldh	(__current_bank + 0), a
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:201: THIS = cached_sprite;
	ld	a, (#_SpriteManagerAddEx_cached_sprite_10000_296)
	ld	(#_THIS),a
	ld	a, (#_SpriteManagerAddEx_cached_sprite_10000_296 + 1)
	ld	(#_THIS + 1),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:202: THIS_IDX = cached_sprite_idx;
	ld	a, (#_SpriteManagerAddEx_cached_sprite_idx_10000_296)
	ld	(#_THIS_IDX),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:203: return sprite;
	ld	a, (_SpriteManagerAddEx_sprite_10000_296)
	ld	c, a
	ld	hl, #_SpriteManagerAddEx_sprite_10000_296 + 1
	ld	b, (hl)
00105$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:204: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #4
	jp	(hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:206: void SpriteManagerRemove(UINT8 idx) {
;	---------------------------------
; Function SpriteManagerRemove
; ---------------------------------
_SpriteManagerRemove::
	ld	e, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:207: sprite_manager_sprites[VECTOR_GET(sprite_manager_updatables, idx)]->marked_for_removal = TRUE;
	ld	bc, #_sprite_manager_sprites+0
	inc	e
	ld	l, e
	ld	h, #0x00
	ld	de, #_sprite_manager_updatables
	add	hl, de
	ld	l, (hl)
	xor	a, a
	ld	h, a
	add	hl, hl
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
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
	ld	hl, #0x001e
	add	hl, de
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
	add	sp, #-4
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:223: __save = CURRENT_BANK;
	ldh	a, (__current_bank + 0)
	ld	(#_SpriteManagerUpdate___save_10000_304),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:225: SPRITEMANAGER_ITERATE(THIS_IDX, THIS)  {
	xor	a, a
	ld	(#_THIS_IDX),a
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
00116$:
	ld	a, (#_sprite_manager_updatables + 0)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:236: BufferExchange(sprite_manager_updatables + 1, THIS_IDX);
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:225: SPRITEMANAGER_ITERATE(THIS_IDX, THIS)  {
	ld	hl, #_THIS_IDX
	sub	a, (hl)
	jp	Z, 00109$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:227: if (THIS->marked_for_removal) continue;
	ld	a, (#_THIS)
	ldhl	sp,	#1
	ld	(hl), a
	ld	a, (#_THIS + 1)
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x001e
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jp	NZ, 00108$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:229: SWITCH_ROM(spriteBanks[THIS->type]);
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x001d
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	l, a
	ld	h, #0x00
	ld	de, #_spriteBanks
	add	hl, de
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	a, (bc)
	ld	l, a
	ld	h, #0x00
	ld	de, #_spriteBanks
	add	hl, de
	ld	a, (hl)
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:231: spriteUpdateFuncs[THIS->type]();
	ld	a, (bc)
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, (hl-)
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	sla	(hl)
	inc	hl
	rl	(hl)
	pop	de
	push	de
	ld	hl, #_spriteUpdateFuncs
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	call	___sdcc_call_hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:233: if (THIS == scroll_target) {
	ld	a, (#_THIS)
	ld	hl, #_scroll_target
	sub	a, (hl)
	jr	NZ, 00108$
	ld	a, (#_THIS + 1)
	ld	hl, #_scroll_target + 1
	sub	a, (hl)
	jr	NZ, 00108$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:234: RefreshScroll();
	call	_RefreshScroll
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:235: if ((THIS_IDX) && (enable_flickering)) {
	ld	a, (#_THIS_IDX)
	or	a, a
	jr	Z, 00108$
	ld	a, (#_enable_flickering)
	or	a, a
	jr	Z, 00108$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:236: BufferExchange(sprite_manager_updatables + 1, THIS_IDX);
	ld	a, (_THIS_IDX)
	ld	b, #0x00
	ld	c, a
	ld	de, #(_sprite_manager_updatables + 1)
	call	_BufferExchange
00108$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:225: SPRITEMANAGER_ITERATE(THIS_IDX, THIS)  {
	ld	hl, #_THIS_IDX
	inc	(hl)
	ld	a, (hl)
	inc	a
	ld	l, a
	ld	h, #0x00
	ld	de, #_sprite_manager_updatables
	add	hl, de
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
	jp	00116$
00109$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:241: SWITCH_ROM(__save);
	ld	a, (_SpriteManagerUpdate___save_10000_304)
	ldh	(__current_bank + 0), a
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:243: if (enable_flickering) {
	ld	a, (#_enable_flickering)
	or	a, a
	jr	Z, 00117$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:225: SPRITEMANAGER_ITERATE(THIS_IDX, THIS)  {
	ld	hl, #_sprite_manager_updatables
	ld	c, (hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:244: if (scroll_target) {
	ld	hl, #_scroll_target + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00111$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:245: BufferRotate(sprite_manager_updatables + 2, VECTOR_LEN(sprite_manager_updatables) - 1);
	xor	a, a
	ld	b, a
	dec	bc
	ld	de, #(_sprite_manager_updatables + 2)
	call	_BufferRotate
	jr	00117$
00111$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:247: BufferRotate(sprite_manager_updatables + 1, VECTOR_LEN(sprite_manager_updatables));
	xor	a, a
	ld	b, a
	ld	de, #(_sprite_manager_updatables + 1)
	call	_BufferRotate
00117$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:250: }
	add	sp, #4
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:252: void SpriteManagerRenderOnly(void) {
;	---------------------------------
; Function SpriteManagerRenderOnly
; ---------------------------------
_SpriteManagerRenderOnly::
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:254: __save = CURRENT_BANK;
	ldh	a, (__current_bank + 0)
	ld	(#_SpriteManagerRenderOnly___save_10000_318),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:256: SPRITEMANAGER_ITERATE(THIS_IDX, THIS) {
	xor	a, a
	ld	(#_THIS_IDX),a
	ld	hl, #_sprite_manager_updatables + 1
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
	ld	bc, #_spriteBanks+0
00103$:
	ld	a, (#_sprite_manager_updatables + 0)
	ld	hl, #_THIS_IDX
	sub	a, (hl)
	jr	Z, 00101$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:258: SWITCH_ROM(spriteBanks[THIS->type]);
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	d, (hl)
	add	a, #0x1d
	ld	e, a
	jr	NC, 00122$
	inc	d
00122$:
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:260: DrawSprite();
	push	bc
	call	_DrawSprite
	pop	bc
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:256: SPRITEMANAGER_ITERATE(THIS_IDX, THIS) {
	ld	hl, #_THIS_IDX
	inc	(hl)
	ld	a, (hl)
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
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #_THIS
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	jr	00103$
00101$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:262: SWITCH_ROM(__save);
	ld	a, (_SpriteManagerRenderOnly___save_10000_318)
	ldh	(__current_bank + 0), a
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:263: }
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:265: void SpriteManagerRenderPurge(void) {
;	---------------------------------
; Function SpriteManagerRenderPurge
; ---------------------------------
_SpriteManagerRenderPurge::
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:267: __save = CURRENT_BANK;
	ldh	a, (__current_bank + 0)
	ld	(#_SpriteManagerRenderPurge___save_10000_322),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:269: current = 0;
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:270: SPRITEMANAGER_ITERATE(THIS_IDX, THIS) {
	xor	a, a
	ld	(#_SpriteManagerRenderPurge_current_10000_322), a
	ld	(#_THIS_IDX),a
	ld	hl, #_sprite_manager_updatables + 1
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
	ld	a, (#_sprite_manager_updatables + 0)
	ld	hl, #_THIS_IDX
	sub	a, (hl)
	jp	Z, 00104$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:272: SWITCH_ROM(spriteBanks[THIS->type]);
	ld	a, (_THIS)
	ld	e, a
	ld	hl, #_THIS + 1
	ld	d, (hl)
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
	ldh	(__current_bank + 0), a
	ld	a, (bc)
	add	a, #<(_spriteBanks)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_spriteBanks)
	ld	h, a
	ld	a, (hl)
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:274: sprite_idx = VECTOR_GET(sprite_manager_updatables, THIS_IDX);
	ld	a, (#_THIS_IDX)
	inc	a
	add	a, #<(_sprite_manager_updatables)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_sprite_manager_updatables)
	ld	h, a
	ld	a, (hl)
	ld	(#_SpriteManagerRenderPurge_sprite_idx_10000_322),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:276: if (THIS->marked_for_removal) {
	ld	hl, #0x001e
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
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	call	___sdcc_call_hl
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:279: StackPush(sprite_manager_sprites_pool, sprite_idx);
	ld	hl, #_sprite_manager_sprites_pool
	inc	(hl)
	jr	NZ, 00132$
	inc	hl
	inc	(hl)
00132$:
	ld	a, (_sprite_manager_sprites_pool)
	ld	c, a
	ld	hl, #_sprite_manager_sprites_pool + 1
	ld	b, (hl)
	ld	a, (_SpriteManagerRenderPurge_sprite_idx_10000_322)
	ld	(bc), a
	jr	00107$
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:282: DrawSprite();
	call	_DrawSprite
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:284: VECTOR_SET_DIRECT(sprite_manager_updatables, current++, sprite_idx);
	ld	a, (_SpriteManagerRenderPurge_current_10000_322)
	ld	c, a
	ld	hl, #_SpriteManagerRenderPurge_current_10000_322
	inc	(hl)
	inc	c
	ld	l, c
	ld	h, #0x00
	ld	de, #_sprite_manager_updatables
	add	hl, de
	ld	a, (_SpriteManagerRenderPurge_sprite_idx_10000_322)
	ld	(hl), a
00107$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:270: SPRITEMANAGER_ITERATE(THIS_IDX, THIS) {
	ld	hl, #_THIS_IDX
	inc	(hl)
	ld	a, (hl)
	inc	a
	ld	l, a
	ld	h, #0x00
	ld	de, #_sprite_manager_updatables
	add	hl, de
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
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:289: VECTOR_LEN(sprite_manager_updatables) = current;
	ld	de, #_sprite_manager_updatables
	ld	a, (_SpriteManagerRenderPurge_current_10000_322)
	ld	(de), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:290: SWITCH_ROM(__save);
	ld	a, (_SpriteManagerRenderPurge___save_10000_322)
	ldh	(__current_bank + 0), a
	ld	(#_rROMB0),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManager.c:291: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__sprite_manager_sprites_pool:
	.dw (_sprite_manager_sprites_poolSTACK - 1)
__xinit__sprite_tile_allocator_top:
	.dw #0x0080
__xinit__enable_flickering:
	.db #0x01	; 1
__xinit__THIS:
	.dw #0x0000
	.area _CABS (ABS)
