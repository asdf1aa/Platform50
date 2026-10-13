;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module Offsets
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___offset_MetaSpriteInfo__metasprites
	.globl ___offset_MetaSpriteInfo__num_sprites
	.globl ___offset_MetaSpriteInfo__palettes
	.globl ___offset_MetaSpriteInfo__num_palettes
	.globl ___offset_MetaSpriteInfo__data
	.globl ___offset_MetaSpriteInfo__num_tiles
	.globl ___offset_MetaSpriteInfo__height
	.globl ___offset_MetaSpriteInfo__width
	.globl ___offset_MapInfo__extra_tiles
	.globl ___offset_MapInfo__extra_tiles_bank
	.globl ___offset_MapInfo__tiles
	.globl ___offset_MapInfo__tiles_bank
	.globl ___offset_MapInfo__attributes
	.globl ___offset_MapInfo__height
	.globl ___offset_MapInfo__width
	.globl ___offset_MapInfo__data
	.globl ___offset_TilesInfo__color_data
	.globl ___offset_TilesInfo__pals
	.globl ___offset_TilesInfo__num_pals
	.globl ___offset_TilesInfo__data
	.globl ___offset_TilesInfo__num_frames
	.globl ___offset_Sprite__custom_data
	.globl ___offset_Sprite__coll_group_down
	.globl ___offset_Sprite__coll_group
	.globl ___offset_Sprite__flags
	.globl ___offset_Sprite__unique_id
	.globl ___offset_Sprite__marked_for_removal
	.globl ___offset_Sprite__type
	.globl ___offset_Sprite__lim_y
	.globl ___offset_Sprite__lim_x
	.globl ___offset_Sprite__ctx
	.globl ___offset_Sprite__mirror
	.globl ___offset_Sprite__mt_sprite
	.globl ___offset_Sprite__anim_frame
	.globl ___offset_Sprite__anim_speed
	.globl ___offset_Sprite__anim_accum_ticks
	.globl ___offset_Sprite__anim_data
	.globl ___offset_Sprite__attr_add
	.globl ___offset_Sprite__first_tile_HV
	.globl ___offset_Sprite__first_tile_V
	.globl ___offset_Sprite__first_tile_H
	.globl ___offset_Sprite__first_tile
	.globl ___offset_Sprite__flips
	.globl ___offset_Sprite__mt_sprite_info
	.globl ___offset_Sprite__mt_sprite_bank
	.globl ___offset_Sprite__coll_h
	.globl ___offset_Sprite__coll_w
	.globl ___offset_Sprite__y
	.globl ___offset_Sprite__x
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
	.area _CODE
___offset_Sprite__x	=	0x0000
___offset_Sprite__y	=	0x0002
___offset_Sprite__coll_w	=	0x0004
___offset_Sprite__coll_h	=	0x0005
___offset_Sprite__mt_sprite_bank	=	0x0006
___offset_Sprite__mt_sprite_info	=	0x0007
___offset_Sprite__flips	=	0x0009
___offset_Sprite__first_tile	=	0x000a
___offset_Sprite__first_tile_H	=	0x000b
___offset_Sprite__first_tile_V	=	0x000c
___offset_Sprite__first_tile_HV	=	0x000d
___offset_Sprite__attr_add	=	0x000e
___offset_Sprite__anim_data	=	0x000f
___offset_Sprite__anim_accum_ticks	=	0x0011
___offset_Sprite__anim_speed	=	0x0012
___offset_Sprite__anim_frame	=	0x0013
___offset_Sprite__mt_sprite	=	0x0014
___offset_Sprite__mirror	=	0x0016
___offset_Sprite__ctx	=	0x0017
___offset_Sprite__lim_x	=	0x0019
___offset_Sprite__lim_y	=	0x001b
___offset_Sprite__type	=	0x001d
___offset_Sprite__marked_for_removal	=	0x001e
___offset_Sprite__unique_id	=	0x001f
___offset_Sprite__flags	=	0x0021
___offset_Sprite__coll_group	=	0x0022
___offset_Sprite__coll_group_down	=	0x0023
___offset_Sprite__custom_data	=	0x0024
___offset_TilesInfo__num_frames	=	0x0000
___offset_TilesInfo__data	=	0x0001
___offset_TilesInfo__num_pals	=	0x0003
___offset_TilesInfo__pals	=	0x0004
___offset_TilesInfo__color_data	=	0x0006
___offset_MapInfo__data	=	0x0000
___offset_MapInfo__width	=	0x0002
___offset_MapInfo__height	=	0x0004
___offset_MapInfo__attributes	=	0x0006
___offset_MapInfo__tiles_bank	=	0x0008
___offset_MapInfo__tiles	=	0x0009
___offset_MapInfo__extra_tiles_bank	=	0x000b
___offset_MapInfo__extra_tiles	=	0x000c
___offset_MetaSpriteInfo__width	=	0x0000
___offset_MetaSpriteInfo__height	=	0x0001
___offset_MetaSpriteInfo__num_tiles	=	0x0002
___offset_MetaSpriteInfo__data	=	0x0003
___offset_MetaSpriteInfo__num_palettes	=	0x0005
___offset_MetaSpriteInfo__palettes	=	0x0006
___offset_MetaSpriteInfo__num_sprites	=	0x0008
___offset_MetaSpriteInfo__metasprites	=	0x0009
	.area _INITIALIZER
	.area _CABS (ABS)
