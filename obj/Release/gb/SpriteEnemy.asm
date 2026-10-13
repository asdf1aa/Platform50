;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module SpriteEnemy
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Destroy_SpriteEnemy
	.globl _Update_SpriteEnemy
	.globl _Start_SpriteEnemy
	.globl _TranslateSprite
	.globl ___bank_SpriteEnemy
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
;SpriteEnemy.c:6: void START() {
;	---------------------------------
; Function Start_SpriteEnemy
; ---------------------------------
_Start_SpriteEnemy::
;SpriteEnemy.c:7: SetPersistent(THIS, TRUE);
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	h, (hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/include/Sprite.h:105: sprite->persistent = (persistent);
	ld	l, a
	ld	de, #0x0021
	add	hl, de
	set	1, (hl)
;SpriteEnemy.c:8: CUSTOM_DATA* data =(CUSTOM_DATA*)THIS->custom_data;
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	h, (hl)
	ld	l, a
	ld	de, #0x0024
	add	hl, de
;SpriteEnemy.c:9: data->vy = 1;
	ld	(hl), #0x01
;SpriteEnemy.c:10: }
	ret
___bank_SpriteEnemy	=	0x00ff
;SpriteEnemy.c:12: void UPDATE() {   
;	---------------------------------
; Function Update_SpriteEnemy
; ---------------------------------
_Update_SpriteEnemy::
;SpriteEnemy.c:13: CUSTOM_DATA* data = (CUSTOM_DATA*)THIS->custom_data;
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	b, (hl)
	add	a, #0x24
	ld	c, a
	jr	NC, 00112$
	inc	b
00112$:
;SpriteEnemy.c:14: if(TranslateSprite(THIS, 0, data->vy)) {
	dec	hl
	ld	a, (bc)
	push	bc
	push	af
	inc	sp
	xor	a, a
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_TranslateSprite
	pop	bc
	or	a, a
	ret	Z
;SpriteEnemy.c:15: data->vy = -data->vy;
	ld	a, (bc)
	ld	e, a
	xor	a, a
	sub	a, e
	ld	e, a
	ld	(bc), a
;SpriteEnemy.c:17: }
	ret
;SpriteEnemy.c:19: void DESTROY() {
;	---------------------------------
; Function Destroy_SpriteEnemy
; ---------------------------------
_Destroy_SpriteEnemy::
;SpriteEnemy.c:20: }
	ret
	.area _CODE_255
	.area _INITIALIZER
	.area _CABS (ABS)
