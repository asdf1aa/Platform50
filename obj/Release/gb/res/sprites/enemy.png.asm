;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module enemy_png
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _enemy
	.globl _enemy_metasprites
	.globl _enemy_metasprite0
	.globl _enemy_tiles
	.globl _enemy_palettes
	.globl b___func_enemy
	.globl ___func_enemy
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
;../obj/Release/gb/res/sprites/enemy.png.c:12: BANKREF(enemy)
;	---------------------------------
; Function __func_enemy
; ---------------------------------
	b___func_enemy	= 255
___func_enemy::
	.local b___func_enemy 
	___bank_enemy = b___func_enemy 
	.globl ___bank_enemy 
	.area _CODE_255
_enemy_palettes:
	.dw #0x0000
	.dw #0x7fff
	.dw #0x0000
	.dw #0x0000
_enemy_tiles:
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xb8	; 184
	.db #0x10	; 16
	.db #0xa8	; 168
	.db #0x80	; 128
	.db #0x38	; 56	'8'
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x06	; 6
	.db #0xc0	; 192
	.db #0x0f	; 15
	.db #0x84	; 132
	.db #0x08	; 8
	.db #0x84	; 132
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0x30	; 48	'0'
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x3d	; 61
	.db #0x10	; 16
	.db #0x2d	; 45
	.db #0x08	; 8
	.db #0x35	; 53	'5'
	.db #0x00	; 0
	.db #0x3d	; 61
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0xe3	; 227
	.db #0x40	; 64
	.db #0x31	; 49	'1'
	.db #0x40	; 64
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
_enemy_metasprite0:
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_enemy_metasprites:
	.dw _enemy_metasprite0
_enemy:
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x04	; 4
	.dw _enemy_tiles
	.db #0x01	; 1
	.dw _enemy_palettes
	.db #0x01	; 1
	.dw _enemy_metasprites
	.area _INITIALIZER
	.area _CABS (ABS)
