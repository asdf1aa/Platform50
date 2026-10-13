;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module SpriteEnemyH
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Destroy_SpriteEnemyH
	.globl _Update_SpriteEnemyH
	.globl _Start_SpriteEnemyH
	.globl _TranslateSprite
	.globl ___bank_SpriteEnemyH
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
;SpriteEnemyH.c:6: void START() {
;	---------------------------------
; Function Start_SpriteEnemyH
; ---------------------------------
_Start_SpriteEnemyH::
;SpriteEnemyH.c:7: SetPersistent(THIS, TRUE);
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	h, (hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/include/Sprite.h:105: sprite->persistent = (persistent);
	ld	l, a
	ld	de, #0x0021
	add	hl, de
	set	1, (hl)
;SpriteEnemyH.c:8: CUSTOM_DATA* data =(CUSTOM_DATA*)THIS->custom_data;
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	h, (hl)
	ld	l, a
	ld	de, #0x0024
	add	hl, de
;SpriteEnemyH.c:9: data->vx = 1;
	ld	(hl), #0x01
;SpriteEnemyH.c:10: }
	ret
___bank_SpriteEnemyH	=	0x00ff
;SpriteEnemyH.c:12: void UPDATE() {   
;	---------------------------------
; Function Update_SpriteEnemyH
; ---------------------------------
_Update_SpriteEnemyH::
;SpriteEnemyH.c:13: CUSTOM_DATA* data = (CUSTOM_DATA*)THIS->custom_data;
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	b, (hl)
	add	a, #0x24
	ld	c, a
	jr	NC, 00112$
	inc	b
00112$:
;SpriteEnemyH.c:14: if(TranslateSprite(THIS, data->vx, 0)) {
	ld	a, (bc)
	push	bc
	ld	h, #0x00
	push	hl
	inc	sp
	ld	hl, #_THIS
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_TranslateSprite
	pop	bc
	or	a, a
	ret	Z
;SpriteEnemyH.c:15: data->vx = -data->vx;
	ld	a, (bc)
	ld	e, a
	xor	a, a
	sub	a, e
	ld	e, a
	ld	(bc), a
;SpriteEnemyH.c:17: }
	ret
;SpriteEnemyH.c:19: void DESTROY() {
;	---------------------------------
; Function Destroy_SpriteEnemyH
; ---------------------------------
_Destroy_SpriteEnemyH::
;SpriteEnemyH.c:20: }
	ret
	.area _CODE_255
	.area _INITIALIZER
	.area _CABS (ABS)
