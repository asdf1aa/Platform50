;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module ZGBMain
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _GetTileReplacement
	.globl _next_state
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_next_state::
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
;ZGBMain.c:6: UINT8 GetTileReplacement(UINT8* tile_ptr, UINT8* tile) {
;	---------------------------------
; Function GetTileReplacement
; ---------------------------------
_GetTileReplacement::
;ZGBMain.c:8: if (*tile_ptr == 0xFDu) {
	ld	a, (de)
	ld	e, a
;ZGBMain.c:7: if (current_state == StateGame) {
	ld	a, (#_current_state)
	or	a, a
	jr	NZ, 00108$
;ZGBMain.c:8: if (*tile_ptr == 0xFDu) {
	ld	a, e
	sub	a, #0xfd
	jr	NZ, 00102$
;ZGBMain.c:9: *tile = 0;
	xor	a, a
	ld	(bc), a
;ZGBMain.c:10: return SpriteEnemy;
	ld	a, #0x01
	ret
00102$:
;ZGBMain.c:12: if (*tile_ptr == 0xFEu) {
	ld	a, e
	sub	a, #0xfe
	jr	NZ, 00104$
;ZGBMain.c:13: *tile = 0;
	xor	a, a
	ld	(bc), a
;ZGBMain.c:14: return SpriteEnemyStill;
	ld	a, #0x02
	ret
00104$:
;ZGBMain.c:16: if (*tile_ptr == 0x02u) {
	ld	a, e
	sub	a, #0x02
	jr	NZ, 00108$
;ZGBMain.c:17: *tile = 0;
	xor	a, a
	ld	(bc), a
;ZGBMain.c:18: return SpriteEnemyH;
	ld	a, #0x03
	ret
00108$:
;ZGBMain.c:21: *tile = *tile_ptr;
	ld	a, e
	ld	(bc), a
;ZGBMain.c:22: return 255u;
	ld	a, #0xff
;ZGBMain.c:23: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__next_state:
	.db #0x00	; 0
	.area _CABS (ABS)
