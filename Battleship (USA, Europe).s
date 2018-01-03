BANK0	group	$00
	org	$0000

	db	"GBS"		; Identifier string ("GBS")
	db	1		; Version (1)
	db	27		; Number of songs (1-255)
	db	1		; First song (usually 1)
	dw	$4000		; Load address ($400-$7fff)
	dw	$5e90		; Init address ($400-$7fff)
	dw	$5e9d		; Play address ($400-$7fff)
	dw	$e000		; Stack pointer
	db	$ab		; Timer modulo
	db	4		; Timer control
	db	"Battleship (USA, Europe)",0		; Title string
	org	$0030
	db	"<?>",0		; Author string
	org	$0050
	db	"Milton Bradley Co., Use Corp.",0		; Copyright string
	org	$0070

;	org	$4000
	libbin	bs-plyr.bin

;	org	$5e90
init:
	inc	a
	cp	8
	jr	nc,_1	
	jp	$4009
_1
	sub	7
	jp	$400c

;	org	$5e9d
play:
	call	$4003
	jp	$4006
