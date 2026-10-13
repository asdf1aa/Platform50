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
_SpriteManagerFlushRemove___save_10000_241:
	.ds 1
_SpriteManagerFlushRemove_current_10000_241:
	.ds 1
_SpriteManagerFlushRemove_sprite_idx_10000_241:
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
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManagerFlushRemove.c:10: __save = CURRENT_BANK;
	ld	a, (_MAP_FRAME1+0)
	ld	(_SpriteManagerFlushRemove___save_10000_241+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManagerFlushRemove.c:12: current = 0;
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManagerFlushRemove.c:13: SPRITEMANAGER_ITERATE(THIS_IDX, THIS) {
	xor	a, a
	ld	(_SpriteManagerFlushRemove_current_10000_241+0), a
	ld	(_THIS_IDX+0), a
	ld	bc, #_sprite_manager_sprites+0
	ld	de, #_sprite_manager_updatables+0
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
00106$:
	ld	a, (de)
	ld	l, a
	ld	a, (_THIS_IDX)
	sub	a, l
	jp	Z, 00104$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManagerFlushRemove.c:15: sprite_idx = VECTOR_GET(sprite_manager_updatables, THIS_IDX);
	ld	a, (_THIS_IDX)
	ld	h, #0x00
	ld	l, a
	inc	hl
	add	hl, de
	ld	a, (hl)
	ld	(_SpriteManagerFlushRemove_sprite_idx_10000_241+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManagerFlushRemove.c:17: if (THIS->marked_for_removal) {
	ld	hl, (_THIS)
	ex	(sp), hl
	pop	hl
	push	hl
	push	bc
	ld	bc, #0x001e
	add	hl, bc
	pop	bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManagerFlushRemove.c:19: SWITCH_ROM(spriteBanks[THIS->type]);
	ld	a, -4 (ix)
	add	a, #0x1d
	ld	-2 (ix), a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	add	a, #<(_spriteBanks)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_spriteBanks)
	ld	h, a
	ld	a, (hl)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManagerFlushRemove.c:20: spriteDestroyFuncs[THIS->type]();
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	push	de
	ld	de, #_spriteDestroyFuncs
	add	hl, de
	pop	de
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	push	bc
	push	de
	push	hl
	pop	iy
	call	___sdcc_call_iy
	pop	de
	pop	bc
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManagerFlushRemove.c:22: StackPush(sprite_manager_sprites_pool, sprite_idx);
	ld	hl, (_sprite_manager_sprites_pool)
	inc	hl
	ld	(_sprite_manager_sprites_pool), hl
	ld	hl, (_sprite_manager_sprites_pool)
	ld	a, (_SpriteManagerFlushRemove_sprite_idx_10000_241)
	ld	(hl), a
	jr	00107$
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManagerFlushRemove.c:25: VECTOR_SET_DIRECT(sprite_manager_updatables, current++, sprite_idx);
	ld	a, (_SpriteManagerFlushRemove_current_10000_241+0)
	ld	-1 (ix), a
	ld	hl, #_SpriteManagerFlushRemove_current_10000_241
	inc	(hl)
	ld	l, -1 (ix)
	ld	h, #0x00
	inc	hl
	add	hl, de
	ld	a, (_SpriteManagerFlushRemove_sprite_idx_10000_241)
	ld	(hl), a
00107$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManagerFlushRemove.c:13: SPRITEMANAGER_ITERATE(THIS_IDX, THIS) {
	ld	hl, #_THIS_IDX
	inc	(hl)
	ld	a, (_THIS_IDX+0)
	ld	l, a
	ld	h, #0x00
	inc	hl
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
	jp	00106$
00104$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManagerFlushRemove.c:30: VECTOR_LEN(sprite_manager_updatables) = current;
	ld	a, (_SpriteManagerFlushRemove_current_10000_241)
	ld	(de), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManagerFlushRemove.c:31: SWITCH_ROM(__save);
	ld	a, (_SpriteManagerFlushRemove___save_10000_241+0)
	ld	(_MAP_FRAME1+0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManagerFlushRemove.c:33: sprite_manager_purge = TRUE;
	ld	hl, #_sprite_manager_purge
	ld	(hl), #0x01
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteManagerFlushRemove.c:34: }
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
