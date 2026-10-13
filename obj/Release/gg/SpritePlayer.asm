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
	rrca
	jr	NC, 00102$
;SpritePlayer.c:11: TranslateSprite(THIS, 0, -1);
	ld	hl, #0xff00
	push	hl
	ld	hl, (_THIS)
	call	_TranslateSprite
00102$:
;SpritePlayer.c:13: if(KEY_PRESSED(J_DOWN)) {
	ld	a, (#(_joypads + 1) + 0)
	bit	1, a
	jr	Z, 00104$
;SpritePlayer.c:14: TranslateSprite(THIS, 0, 1);
	ld	hl, #0x100
	push	hl
	ld	hl, (_THIS)
	call	_TranslateSprite
00104$:
;SpritePlayer.c:16: if(KEY_PRESSED(J_LEFT)) {
	ld	a, (#(_joypads + 1) + 0)
	bit	2, a
	jr	Z, 00106$
;SpritePlayer.c:17: TranslateSprite(THIS, -1, 0);
	ld	hl, #0xff
	push	hl
	ld	hl, (_THIS)
	call	_TranslateSprite
00106$:
;SpritePlayer.c:19: if(KEY_PRESSED(J_RIGHT)) {
	ld	a, (#(_joypads + 1) + 0)
	bit	3, a
	ret	Z
;SpritePlayer.c:20: TranslateSprite(THIS, 1, 0);
	ld	hl, #0x01
	push	hl
	ld	hl, (_THIS)
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
