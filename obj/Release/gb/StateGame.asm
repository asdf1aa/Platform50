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
	.globl _Printf
	.globl _InitRecodeTable
	.globl _LoadMap
	.globl _InitScroll
	.globl _ScrollSetTiles
	.globl _SetWindowPos
	.globl _SpriteManagerAddEx
	.globl _game_score
	.globl _collision_tiles
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
_collision_tiles::
	.ds 2
_game_score::
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
;StateGame.c:13: void START(void) {
;	---------------------------------
; Function Start_StateGame
; ---------------------------------
_Start_StateGame::
	dec	sp
;StateGame.c:14: InitScroll(BANK(map), &map, collision_tiles, 0);
	ldhl	sp,	#0
	ld	(hl), #<(___bank_map)
	ld	de, #0x0000
	push	de
	ld	de, #_collision_tiles
	push	de
	ld	de, #_map
	ld	a, (hl)
	call	_InitScroll
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/include/SpriteManager.h:45: return SpriteManagerAddEx(sprite_type, x, y, NULL);
	ld	de, #0x0000
	push	de
	ld	de, #0x0018
	push	de
	xor	a, a
	call	_SpriteManagerAddEx
;StateGame.c:15: scroll_target = SpriteManagerAdd(SpritePlayer, 24, 24);
	ld	hl, #_scroll_target
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/include/SpriteManager.h:45: return SpriteManagerAddEx(sprite_type, x, y, NULL);
	ld	de, #0x0000
	push	de
	ld	de, #0x0010
	push	de
	ld	de, #0x00c8
	ld	a, #0x04
	call	_SpriteManagerAddEx
;StateGame.c:17: INIT_FONT_EX(font, PRINT_BKG);
	ld	e, #<(___bank_font)
	push	de
	ld	a, e
	ld	de, #_font_table
	call	_InitRecodeTable
	pop	de
	xor	a, a
	ld	(#_print_target), a
	ld	(#_print_render),a
	ld	hl, #_font_tiledata_bank
	ld	(hl), e
	ld	hl, #_font_tiledata
	ld	a, #<(_font_tiles)
	ld	(hl+), a
	ld	(hl), #>(_font_tiles)
	ld	bc, #_font
	push	bc
	ld	a, (_last_tile_loaded)
	call	_ScrollSetTiles
	ld	hl, #_font_offset
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ld	hl, #_font_current_offset
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;StateGame.c:18: INIT_HUD_EX(map, 0, 8);
	ld	de, #_map
	push	de
	ldhl	sp,	#2
	ld	h, (hl)
	ld	l, #0x00
	push	hl
	ld	e, #0x00
	ld	a, #0x01
	call	_LoadMap
	ld	hl, #_hud_map_offset
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ld	a, #0x08
	push	af
	inc	sp
	ld	e, #0x00
	ld	a, #0x07
	call	_SetWindowPos
;StateGame.c:19: print_target = PRINT_WIN;
	ld	hl, #_print_target
	ld	(hl), #0x01
;StateGame.c:20: PRINT(0, 0, "SCORE %u", game_score);
	xor	a, a
	ld	(#_print_x), a
	ld	(#_print_y),a
	ld	a, (_game_score)
	ld	e, a
	ld	hl, #_game_score + 1
	ld	d, (hl)
	push	de
	ld	de, #___str_0
	push	de
	call	_Printf
;StateGame.c:21: }
	add	sp, #5
	ret
___bank_StateGame	=	0x00ff
___str_0:
	.ascii "SCORE %u"
	.db 0x00
;StateGame.c:23: void UPDATE(void) {
;	---------------------------------
; Function Update_StateGame
; ---------------------------------
_Update_StateGame::
;StateGame.c:24: }
	ret
	.area _CODE_255
	.area _INITIALIZER
__xinit__collision_tiles:
	.db #0x01	; 1
	.db #0x00	; 0
__xinit__game_score:
	.dw #0x0000
	.area _CABS (ABS)
