;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module SpriteEnemyStill
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Destroy_SpriteEnemyStill
	.globl _Update_SpriteEnemyStill
	.globl _Start_SpriteEnemyStill
	.globl ___bank_SpriteEnemyStill
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
;SpriteEnemyStill.c:4: void START() {
;	---------------------------------
; Function Start_SpriteEnemyStill
; ---------------------------------
_Start_SpriteEnemyStill::
;SpriteEnemyStill.c:5: SetPersistent(THIS, TRUE);
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	h, (hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/include/Sprite.h:105: sprite->persistent = (persistent);
	ld	l, a
	ld	de, #0x0021
	add	hl, de
	set	1, (hl)
;SpriteEnemyStill.c:5: SetPersistent(THIS, TRUE);
;SpriteEnemyStill.c:6: }
	ret
___bank_SpriteEnemyStill	=	0x00ff
;SpriteEnemyStill.c:8: void UPDATE() {   
;	---------------------------------
; Function Update_SpriteEnemyStill
; ---------------------------------
_Update_SpriteEnemyStill::
;SpriteEnemyStill.c:10: }
	ret
;SpriteEnemyStill.c:12: void DESTROY() {
;	---------------------------------
; Function Destroy_SpriteEnemyStill
; ---------------------------------
_Destroy_SpriteEnemyStill::
;SpriteEnemyStill.c:13: }
	ret
	.area _CODE_255
	.area _INITIALIZER
	.area _CABS (ABS)
