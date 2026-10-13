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
	.globl _SetState
	.globl _CheckCollision
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
;SpritePlayer.c:8: }
	ret
___bank_SpritePlayer	=	0x00ff
;SpritePlayer.c:10: void UPDATE() {
;	---------------------------------
; Function Update_SpritePlayer
; ---------------------------------
_Update_SpritePlayer::
	dec	sp
;SpritePlayer.c:14: if(KEY_PRESSED(J_UP)) {
	ld	a, (#(_joypads + 1) + 0)
	bit	2, a
	jr	Z, 00102$
;SpritePlayer.c:15: TranslateSprite(THIS, 0, -1);
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
;SpritePlayer.c:17: if(KEY_PRESSED(J_DOWN)) {
	ld	a, (#(_joypads + 1) + 0)
	bit	3, a
	jr	Z, 00104$
;SpritePlayer.c:18: TranslateSprite(THIS, 0, 1);
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
;SpritePlayer.c:20: if(KEY_PRESSED(J_LEFT)) {
	ld	a, (#(_joypads + 1) + 0)
	bit	1, a
	jr	Z, 00106$
;SpritePlayer.c:21: TranslateSprite(THIS, -1, 0);
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
;SpritePlayer.c:23: if(KEY_PRESSED(J_RIGHT)) {
	ld	a, (#(_joypads + 1) + 0)
	rrca
	jr	NC, 00108$
;SpritePlayer.c:24: TranslateSprite(THIS, 1, 0);
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x01
	ld	hl, #_THIS
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_TranslateSprite
00108$:
;SpritePlayer.c:26: SPRITEMANAGER_ITERATE(i, spr) {
	ld	hl, #_sprite_manager_updatables + 1
	ld	l, (hl)
	xor	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_sprite_manager_sprites
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#0
	ld	(hl), #0x00
00121$:
	ld	a, (#_sprite_manager_updatables + 0)
	ldhl	sp,	#0
	sub	a, (hl)
	jr	Z, 00123$
;SpritePlayer.c:27: if(spr->type == SpriteEnemy || spr->type == SpriteEnemyStill || spr->type == SpriteEnemyH) {
	ld	hl, #0x001d
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	cp	a, #0x01
	jr	Z, 00111$
	cp	a, #0x02
	jr	Z, 00111$
	sub	a, #0x03
	jr	NZ, 00112$
00111$:
;SpritePlayer.c:28: if(CheckCollision(THIS, spr)) {
	push	bc
	push	de
	ld	a, (_THIS)
	ld	e, a
	ld	hl, #_THIS + 1
	ld	d, (hl)
	call	_CheckCollision
	pop	de
	pop	bc
	or	a, a
	jr	Z, 00112$
;SpritePlayer.c:29: SetState(StateGame);
	push	bc
	push	de
	xor	a, a
	call	_SetState
	pop	de
	pop	bc
00112$:
;SpritePlayer.c:32: if(spr->type == Flag) {
	ld	a, (de)
	sub	a, #0x04
	jr	NZ, 00122$
;SpritePlayer.c:33: if(CheckCollision(THIS, spr)){
	ld	a, (_THIS)
	ld	e, a
	ld	hl, #_THIS + 1
	ld	d, (hl)
	call	_CheckCollision
	or	a, a
	jr	Z, 00122$
;SpritePlayer.c:34: game_score++;
	ld	hl, #_game_score
	inc	(hl)
	jr	NZ, 00214$
	inc	hl
	inc	(hl)
00214$:
;SpritePlayer.c:35: SetState(StateGame);
	xor	a, a
	call	_SetState
00122$:
;SpritePlayer.c:26: SPRITEMANAGER_ITERATE(i, spr) {
	ldhl	sp,	#0
	inc	(hl)
	ld	c, (hl)
	xor	a, a
	ld	b, a
	inc	bc
	ld	hl, #_sprite_manager_updatables
	add	hl, bc
	ld	l, (hl)
	xor	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_sprite_manager_sprites
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	jr	00121$
00123$:
;SpritePlayer.c:39: }
	inc	sp
	ret
;SpritePlayer.c:41: void DESTROY() {
;	---------------------------------
; Function Destroy_SpritePlayer
; ---------------------------------
_Destroy_SpritePlayer::
;SpritePlayer.c:42: }
	ret
	.area _CODE_255
	.area _INITIALIZER
	.area _CABS (ABS)
