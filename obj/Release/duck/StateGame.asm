;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module StateGame
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Update_StateGame
	.globl _Start_StateGame
	.globl _InitScroll
	.globl _SpriteManagerAddEx
	.globl _collsion_tile
	.globl ___bank_StateGame
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
_collsion_tile::
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
	.area _CODE_255
;StateGame.c:9: void START(void) {
;	---------------------------------
; Function Start_StateGame
; ---------------------------------
_Start_StateGame::
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/include/SpriteManager.h:45: return SpriteManagerAddEx(sprite_type, x, y, NULL);
	ld	de, #0x0000
	push	de
	ld	de, #0x0032
	push	de
	xor	a, a
	call	_SpriteManagerAddEx
;StateGame.c:10: scroll_target = SpriteManagerAdd(SpritePlayer, 50, 50);
	ld	hl, #_scroll_target
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;StateGame.c:11: InitScroll(BANK(map), &map, 0, 0);
	ld	a, #<(___bank_map)
	ld	de, #0x0000
	push	de
	push	de
	ld	de, #_map
	call	_InitScroll
;StateGame.c:12: }
	ret
___bank_StateGame	=	0x00ff
;StateGame.c:14: void UPDATE(void) {
;	---------------------------------
; Function Update_StateGame
; ---------------------------------
_Update_StateGame::
;StateGame.c:15: }
	ret
	.area _CODE_255
	.area _INITIALIZER
__xinit__collsion_tile:
	.db #0x01	; 1
	.db #0x00	; 0
	.area _CABS (ABS)
