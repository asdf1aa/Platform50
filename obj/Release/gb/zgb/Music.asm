;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module Music
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _sfx_play_isr
	.globl _stop_music_on_new_state
	.globl _last_music_bank
	.globl _last_music
	.globl _sfx_priority
	.globl _music_mute_mask
	.globl _music_paused
	.globl _music_skip_interrupts
	.globl _MUSIC_isr
	.globl ___PlayMusic
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_music_skip_interrupts::
	.ds 1
_MUSIC_isr_old_mute_mask_10000_176:
	.ds 1
_MUSIC_isr_skip_interrupts_10000_176:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_music_paused::
	.ds 1
_music_mute_mask::
	.ds 1
_sfx_priority::
	.ds 1
_last_music::
	.ds 2
_last_music_bank::
	.ds 1
_stop_music_on_new_state::
	.ds 1
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
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Music.c:86: static UINT8 old_mute_mask = ~MUTE_MASK_NONE;
	ld	hl, #_MUSIC_isr_old_mute_mask_10000_176
	ld	(hl), #0xff
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Music.c:85: void MUSIC_isr(void) NONBANKED {
;	---------------------------------
; Function MUSIC_isr
; ---------------------------------
_MUSIC_isr::
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Music.c:96: if (old_mute_mask != music_mute_mask) {
	ld	a, (#_MUSIC_isr_old_mute_mask_10000_176)
	ld	hl, #_music_mute_mask
	sub	a, (hl)
	jr	Z, 00102$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Music.c:98: old_mute_mask = music_mute_mask;
	ld	a, (#_music_mute_mask)
	ld	(#_MUSIC_isr_old_mute_mask_10000_176),a
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Music.c:101: if (sfx_play_bank != SFX_STOP_BANK) {
	ld	a, (#_sfx_play_bank)
	inc	a
	jr	Z, 00106$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Music.c:102: if (!sfx_play_isr()) {
	call	_sfx_play_isr
	or	a, a
	jr	NZ, 00106$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Music.c:104: sfx_sound_cut_mask(music_mute_mask);
	ld	a, (_music_mute_mask)
	ld	c, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/include/Sound.h:73: if (mask & SFX_CH_1) NR12_REG = 0, NR14_REG = SFX_CH_RETRIGGER;
	rrca
	jr	NC, 00115$
	xor	a, a
	ldh	(_NR12_REG + 0), a
	ld	a, #0xc0
	ldh	(_NR14_REG + 0), a
00115$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/include/Sound.h:74: if (mask & SFX_CH_2) NR22_REG = 0, NR24_REG = SFX_CH_RETRIGGER;
	bit	1, c
	jr	Z, 00117$
	xor	a, a
	ldh	(_NR22_REG + 0), a
	ld	a, #0xc0
	ldh	(_NR24_REG + 0), a
00117$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/include/Sound.h:75: if (mask & SFX_CH_3) NR32_REG = 0;
	bit	2, c
	jr	Z, 00119$
	xor	a, a
	ldh	(_NR32_REG + 0), a
00119$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/include/Sound.h:76: if (mask & SFX_CH_4) NR42_REG = 0, NR44_REG = SFX_CH_RETRIGGER;
	bit	3, c
	jr	Z, 00121$
	xor	a, a
	ldh	(_NR42_REG + 0), a
	ld	a, #0xc0
	ldh	(_NR44_REG + 0), a
00121$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/include/Sound.h:77: NR51_REG = 0xFF;
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Music.c:107: music_mute_mask = old_mute_mask = MUTE_MASK_NONE;
	xor	a, a
	ld	(#_MUSIC_isr_old_mute_mask_10000_176), a
	ld	(#_music_mute_mask),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Music.c:109: sfx_priority = SFX_PRIORITY_MINIMAL;
	xor	a, a
	ld	(#_sfx_priority),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Music.c:110: sfx_play_bank = SFX_STOP_BANK;
	ld	hl, #_sfx_play_bank
	ld	(hl), #0xff
00106$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Music.c:114: if (music_paused)
	ld	a, (#_music_paused)
	or	a, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Music.c:115: return;
	ret	NZ
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Music.c:116: if (last_music_bank == SFX_STOP_BANK)
	ld	a, (#_last_music_bank)
	inc	a
	ret	Z
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Music.c:117: return;
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Music.c:119: if (skip_interrupts) {
	ld	hl, #_MUSIC_isr_skip_interrupts_10000_176
	ld	a, (hl)
	or	a, a
	jr	Z, 00112$
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Music.c:120: --skip_interrupts;
	dec	(hl)
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Music.c:121: return; 
	ret
00112$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Music.c:122: } else skip_interrupts = music_skip_interrupts;
	ld	a, (#_music_skip_interrupts)
	ld	(#_MUSIC_isr_skip_interrupts_10000_176),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Music.c:146: }
	ret
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Music.c:148: void __PlayMusic(void* music, UINT8 bank, UINT8 loop) NONBANKED {
;	---------------------------------
; Function __PlayMusic
; ---------------------------------
___PlayMusic::
	ld	c, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Music.c:150: if ((music != last_music) || (last_music_bank != bank)) {
	ld	hl, #_last_music
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00101$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	NZ, 00101$
	ld	a, (#_last_music_bank)
	sub	a, c
	jr	Z, 00102$
00101$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Music.c:152: UBYTE __save = CURRENT_BANK;
	ldh	a, (__current_bank + 0)
	ld	b, a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/include/Sound.h:86: NR12_REG = NR22_REG = NR32_REG = NR42_REG = 0;
	xor	a, a
	ldh	(_NR42_REG + 0), a
	xor	a, a
	ldh	(_NR32_REG + 0), a
	xor	a, a
	ldh	(_NR22_REG + 0), a
	xor	a, a
	ldh	(_NR12_REG + 0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/include/Sound.h:87: NR14_REG = NR24_REG = NR44_REG = SFX_CH_RETRIGGER;
	ld	a, #0xc0
	ldh	(_NR44_REG + 0), a
	ld	a, #0xc0
	ldh	(_NR24_REG + 0), a
	ld	a, #0xc0
	ldh	(_NR14_REG + 0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/include/Sound.h:88: NR51_REG = 0xFF;
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Music.c:171: SWITCH_ROM(__save);
	ld	a, b
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), b
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Music.c:172: last_music = music;
	ld	hl, #_last_music
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Music.c:173: last_music_bank = bank;
	ld	hl, #_last_music_bank
	ld	(hl), c
00102$:
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Music.c:175: music_paused = 0;
	xor	a, a
	ld	(#_music_paused),a
;C:/Users/karas/OneDrive/Documents/GitHub/CrossZGB/common/src/Music.c:176: }
	pop	hl
	inc	sp
	jp	(hl)
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
__xinit__music_paused:
	.db #0x01	; 1
__xinit__music_mute_mask:
	.db #0x00	; 0
__xinit__sfx_priority:
	.db #0x00	; 0
__xinit__last_music:
	.dw #0x0000
__xinit__last_music_bank:
	.db #0xff	; 255
__xinit__stop_music_on_new_state:
	.db #0x01	; 1
	.area _CABS (ABS)
