BANK0	group	$00

	org	$0000

	db	"GBS"		; Identifier string ("GBS")
	db	1		; Version (1)
	db	30		; Number of songs (1-255)
	db	1		; First song (usually 1)
	dw	$3dd4		; Load address ($400-$7fff)
	dw	$6780		; Init address ($400-$7fff)
	dw	$3e78		; Play address ($400-$7fff)
	dw	$e000		; Stack pointer
	db	0		; Timer modulo
	db	0		; Timer control
	db	"Hyper Lode Runner (World)(Rev A)",0		; Title string
	org	$0030
	db	"<?>",0		; Author string
	org	$0050
	db	"Broderbund, Bandai, Doug Smith",0		; Copyright string
	org	$0070

	libbin	hlr-plyr.bin	; extracted player binary, resource it by yourself if you care

	;org 	$6780
init:
	push	af

	ld	hl,$3dd4	; wave table
	ld	de,$ff30
	ld	c,16
_copy
	ld	a,(hl+)
	ld	(de),a
	inc	de
	dec	c
	jr	nz,_copy

	call	$3de4		; freq table

	call	$3e17		; player reset

	pop	af		; song number

	ld	hl,$67a4	; songs array
	rlca
	add	a,l
	ld	l,a
	adc	a,h
	sub	l
	ld	h,a

	ld	a,(hl+)
	ld	l,(hl)
	ld	h,$3e
	jp	(hl)

;42(4) - $1D, $27
;45(3) - $16, $21, $24
;48(2) - $06, $0C, $13
;4B(1) - $00, $01, $04, $05, $08, $09, $0A, $0B, $0E, $0F, $10, $11, $15, $1A, $1B, $1C, $2C

	;org 	$67a4
songs:
	dw	$4516	; 19	; songs, jingles, sfx
	dw	$4524	; 26
	dw	$4b11	; 15
	dw	$4b12	; 16
	dw	$421d	; 24
	dw	$4521	; 25
	dw	$4227	; 27
	dw	$4b2b	; 28
	dw	$4b00	; 0
	dw	$4b01	; 1
	dw	$4b02	; 2
	dw	$4b03	; 3
	dw	$4b04	; 4
	dw	$4b05	; 5
	dw	$4806	; 6
	dw	$4b08	; 7
	dw	$4b09	; 8
	dw	$4b0a	; 9
	dw	$4b0b	; 10
	dw	$480c	; 11
	dw	$4b0e	; 12
	dw	$4b0f	; 13
	dw	$4b10	; 14
	dw	$4813	; 17
	dw	$4b15	; 18
	dw	$4b19	; 20
	dw	$4b1a	; 21
	dw	$4b1b	; 22
	dw	$4b1c	; 23
	dw	$4b2c   ; 29
