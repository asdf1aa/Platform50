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
	.area _CODE
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:6: void SetSpriteAnim(Sprite* sprite, const UINT8* data, UINT8 speed) {
;	---------------------------------
; Function SetSpriteAnim
; ---------------------------------
_SetSpriteAnim::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	ld	c, l
	ld	b, h
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:7: if (sprite->anim_data == data) return;
	ld	hl, #0x000f
	add	hl, bc
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	dec	hl
	ld	a, -2 (ix)
	sub	a, e
	jr	NZ, 00102$
	ld	a, -1 (ix)
	sub	a, d
	jr	Z, 00104$
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:9: sprite->anim_data = (UINT8* )data;
	ld	(hl), e
	inc	hl
	ld	(hl), d
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:10: SetFrame(sprite, VECTOR_GET(data, 0));
	inc	de
	ld	a, (de)
	ld	-1 (ix), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/include/Sprite.h:83: sprite->mt_sprite = GetSpriteAnimation(sprite, frame);
	ld	hl, #0x0014
	add	hl, bc
	ld	e, -1 (ix)
	ld	d, #0x00
	push	hl
	push	bc
	ld	l, c
	ld	h, b
	call	_GetSpriteAnimation
	pop	bc
	pop	hl
	ld	(hl), e
	inc	hl
	ld	(hl), d
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/include/Sprite.h:84: sprite->anim_frame = frame;
	ld	hl, #0x0013
	add	hl, bc
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:11: sprite->anim_frame = 0;
	ld	(hl), #0x00
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:12: sprite->anim_accum_ticks = 0;
	ld	hl, #0x0011
	add	hl, bc
	ld	(hl), #0x00
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:13: sprite->anim_speed = speed;
	ld	hl, #0x0012
	add	hl, bc
	ld	a, 4 (ix)
	ld	(hl), a
00104$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:14: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:17: void TickAnimSprite(void) NAKED {
;	---------------------------------
; Function TickAnimSprite
; ---------------------------------
_TickAnimSprite::
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:69: __endasm;
	ld	iy, (_THIS)
	ld	l, ___offset_Sprite__anim_data+0(iy)
	ld	h, ___offset_Sprite__anim_data+1(iy) ; hl: THIS->anim_data
	ld	a, l
	or	h
	ret	z
	ld	a, (_delta_time)
	or	a
	ld	a, ___offset_Sprite__anim_speed(iy)
	jp	z, 0$
	add	a
0$:
	add	___offset_Sprite__anim_accum_ticks(iy)
	ld	___offset_Sprite__anim_accum_ticks(iy), a
	cp	#100
	ret	c
	sub	#100
1$:
	cp	#100
	jp	c, 2$
	sub	#100
2$:
	ld	___offset_Sprite__anim_accum_ticks(iy), a
	ld	a, ___offset_Sprite__anim_frame(iy)
	inc	a
	cp	(hl)
	jp	c, 4$
	bit	2, ___offset_Sprite__flags(iy)
	jp	z, 3$
	ld	a, #1
3$:
	dec	a
4$:
	ld	___offset_Sprite__anim_frame(iy), a
	ld	e, a
	ld	d, #0
	add	hl, de
	inc	hl
	ld	e, (hl)
	ld	hl, (_THIS)
	call	_GetSpriteAnimation
	ld	iy, (_THIS)
	ld	___offset_Sprite__mt_sprite+0(iy), e
	ld	___offset_Sprite__mt_sprite+1(iy), d
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/SpriteAnimation.c:70: }
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
