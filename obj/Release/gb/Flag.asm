;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module Flag
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Destroy_Flag
	.globl _Update_Flag
	.globl _Start_Flag
	.globl ___bank_Flag
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
;Flag.c:4: void START() {
;	---------------------------------
; Function Start_Flag
; ---------------------------------
_Start_Flag::
;Flag.c:5: SetPersistent(THIS, TRUE);
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	h, (hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/include/Sprite.h:105: sprite->persistent = (persistent);
	ld	l, a
	ld	de, #0x0021
	add	hl, de
	set	1, (hl)
;Flag.c:5: SetPersistent(THIS, TRUE);
;Flag.c:6: }
	ret
___bank_Flag	=	0x00ff
;Flag.c:8: void UPDATE() {   
;	---------------------------------
; Function Update_Flag
; ---------------------------------
_Update_Flag::
;Flag.c:10: }
	ret
;Flag.c:12: void DESTROY() {
;	---------------------------------
; Function Destroy_Flag
; ---------------------------------
_Destroy_Flag::
;Flag.c:13: }
	ret
	.area _CODE_255
	.area _INITIALIZER
	.area _CABS (ABS)
