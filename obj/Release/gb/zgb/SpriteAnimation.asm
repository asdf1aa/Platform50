;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module SpriteAnimation
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TickAnimSprite
	.globl _GetSpriteAnimation
	.globl _SetSpriteAnim
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
	.area _CODE
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:6: void SetSpriteAnim(Sprite* sprite, const UINT8* data, UINT8 speed) {
;	---------------------------------
; Function SetSpriteAnim
; ---------------------------------
_SetSpriteAnim::
	add	sp, #-4
	ldhl	sp,	#2
	ld	a, e
	ld	(hl+), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:7: if (sprite->anim_data == data) return;
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000f
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	ld	a, l
	sub	a, c
	jr	NZ, 00102$
	ld	a, h
	sub	a, b
	jr	Z, 00104$
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:9: sprite->anim_data = (UINT8* )data;
	pop	hl
	push	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:10: SetFrame(sprite, VECTOR_GET(data, 0));
	inc	bc
	ld	a, (bc)
	ldhl	sp,	#1
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/include/Sprite.h:83: sprite->mt_sprite = GetSpriteAnimation(sprite, frame);
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0014
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	c, a
	xor	a, a
	push	de
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_GetSpriteAnimation
	pop	de
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/include/Sprite.h:84: sprite->anim_frame = frame;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0013
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#1
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:11: sprite->anim_frame = 0;
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:12: sprite->anim_accum_ticks = 0;
	ld	a, (hl+)
	ld	(bc), a
	xor	a, a
	ld	(bc), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0011
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:13: sprite->anim_speed = speed;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0012
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#6
	ld	a, (hl)
	ld	(bc), a
00104$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:14: }
	add	sp, #4
	pop	hl
	inc	sp
	jp	(hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:72: void TickAnimSprite(void) {
;	---------------------------------
; Function TickAnimSprite
; ---------------------------------
_TickAnimSprite::
	dec	sp
	dec	sp
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:73: if (THIS->anim_data) {
	ld	a, (_THIS)
	ld	c, a
	ld	hl, #_THIS + 1
	ld	b, (hl)
	ld	hl, #0x000f
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#1
	ld	a, (hl-)
	or	a, (hl)
	jp	Z, 00110$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:74: THIS->anim_accum_ticks += ((delta_time) ? (THIS->anim_speed << 1) : THIS->anim_speed);
	ld	hl, #0x0011
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#1
	ld	(hl), a
	ld	hl, #0x0012
	add	hl, bc
	ld	c, (hl)
	ld	a, (#_delta_time)
	or	a, a
	jr	Z, 00112$
	ld	a, c
	add	a, a
	jr	00113$
00112$:
	ld	a, c
00113$:
	ldhl	sp,	#1
	add	a, (hl)
	ld	(de), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:73: if (THIS->anim_data) {
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	h, (hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:74: THIS->anim_accum_ticks += ((delta_time) ? (THIS->anim_speed << 1) : THIS->anim_speed);
	ld	l, a
	ld	de, #0x0011
	add	hl, de
	ld	a, (hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:75: if (THIS->anim_accum_ticks >= SPRITE_ANIM_MAX_TICKS) {
	cp	a, #0x64
	jr	C, 00110$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:76: THIS->anim_accum_ticks -= SPRITE_ANIM_MAX_TICKS;
	add	a, #0x9c
	ld	(hl), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:78: if (++THIS->anim_frame >= VECTOR_LEN(THIS->anim_data)) {
	ld	a, (_THIS)
	ld	hl, #_THIS + 1
	ld	b, (hl)
	add	a, #0x13
	ld	c, a
	jr	NC, 00149$
	inc	b
00149$:
	ld	a, (bc)
	inc	a
	ldhl	sp,	#1
	ld	(hl), a
	ld	(bc), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:73: if (THIS->anim_data) {
	ld	a, (_THIS)
	ld	c, a
	ld	hl, #_THIS + 1
	ld	b, (hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:78: if (++THIS->anim_frame >= VECTOR_LEN(THIS->anim_data)) {
	ld	hl, #0x000f
	add	hl, bc
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	e, (hl)
	ldhl	sp,	#1
	ld	a, (hl)
	sub	a, e
	jr	C, 00105$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:79: if (THIS->loop_anim) {
	ld	hl, #0x0021
	add	hl, bc
	ld	a, (hl)
	rrca
	rrca
	and	a, #0x01
	ld	e, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:80: THIS->anim_frame = 0;
	ld	hl, #0x0013
	add	hl, bc
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:79: if (THIS->loop_anim) {
	ld	a, e
	or	a, a
	jr	Z, 00102$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:80: THIS->anim_frame = 0;
	ld	(hl), #0x00
	jr	00105$
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:82: --THIS->anim_frame;
	dec	(hl)
00105$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:73: if (THIS->anim_data) {
	ld	a, (_THIS)
	ld	c, a
	ld	hl, #_THIS + 1
	ld	b, (hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:85: THIS->mt_sprite = GetSpriteAnimation(THIS, VECTOR_GET(THIS->anim_data, THIS->anim_frame));
	ld	hl, #0x0014
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
	ld	hl, #0x000f
	add	hl, bc
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	add	a, #0x13
	ld	c, a
	jr	NC, 00150$
	inc	b
00150$:
	ld	a, (bc)
	ld	b, #0x00
	ld	c, a
	inc	bc
	add	hl, bc
	ld	c, (hl)
	xor	a, a
	ld	b, a
	ld	a, (_THIS)
	ld	e, a
	ld	hl, #_THIS + 1
	ld	d, (hl)
	call	_GetSpriteAnimation
	pop	hl
	push	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00110$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:88: }
	inc	sp
	inc	sp
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
