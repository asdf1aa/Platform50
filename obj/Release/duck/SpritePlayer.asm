;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module SpritePlayer
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Destroy_SpritePlayer
	.globl _Update_SpritePlayer
	.globl _Start_SpritePlayer
	.globl _TranslateSprite
	.globl ___bank_SpritePlayer
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
;SpritePlayer.c:6: void START() {
;	---------------------------------
; Function Start_SpritePlayer
; ---------------------------------
_Start_SpritePlayer::
;SpritePlayer.c:7: }
	ret
___bank_SpritePlayer	=	0x00ff
;SpritePlayer.c:9: void UPDATE() {
;	---------------------------------
; Function Update_SpritePlayer
; ---------------------------------
_Update_SpritePlayer::
;SpritePlayer.c:10: if(KEY_PRESSED(J_UP)) {
	ld	a, (#(_joypads + 1) + 0)
	bit	2, a
	jr	Z, 00102$
;SpritePlayer.c:11: TranslateSprite(THIS, 0, -1);
	ld	a, #0xff
	push	af
	inc	sp
	xor	a, a
	ld	hl, #_THIS
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_TranslateSprite
00102$:
;SpritePlayer.c:13: if(KEY_PRESSED(J_DOWN)) {
	ld	a, (#(_joypads + 1) + 0)
	bit	3, a
	jr	Z, 00104$
;SpritePlayer.c:14: TranslateSprite(THIS, 0, 1);
	ld	a, #0x01
	push	af
	inc	sp
	xor	a, a
	ld	hl, #_THIS
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_TranslateSprite
00104$:
;SpritePlayer.c:16: if(KEY_PRESSED(J_LEFT)) {
	ld	a, (#(_joypads + 1) + 0)
	bit	1, a
	jr	Z, 00106$
;SpritePlayer.c:17: TranslateSprite(THIS, -1, 0);
	xor	a, a
	push	af
	inc	sp
	ld	a, #0xff
	ld	hl, #_THIS
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_TranslateSprite
00106$:
;SpritePlayer.c:19: if(KEY_PRESSED(J_RIGHT)) {
	ld	a, (#(_joypads + 1) + 0)
	rrca
	ret	NC
;SpritePlayer.c:20: TranslateSprite(THIS, 1, 0);
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x01
	ld	hl, #_THIS
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_TranslateSprite
;SpritePlayer.c:22: }
	ret
;SpritePlayer.c:24: void DESTROY() {
;	---------------------------------
; Function Destroy_SpritePlayer
; ---------------------------------
_Destroy_SpritePlayer::
;SpritePlayer.c:25: }
	ret
	.area _CODE_255
	.area _INITIALIZER
	.area _CABS (ABS)
