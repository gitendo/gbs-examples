BANK0	group	$00

	org	$0000

	db	"GBS"		; Identifier string ("GBS")
	db	1		; Version (1)
	db	14		; Number of songs (1-255)
	db	1		; First song (usually 1)
	dw	$056e		; Load address ($400-$7fff)
	dw	$0e36		; Init address ($400-$7fff)
	dw	$0725		; Play address ($400-$7fff)
	dw	$e000		; Stack pointer
	db	0		; Timer modulo
	db	0		; Timer control
	db	"Othello (Japan)",0		; Title string
	org	$0030
	db	"<?>",0		; Author string
	org	$0050
	db	"Kawada",0		; Copyright string
	org	$0070

; cut here

	org	$056e
	libbin	o-plyr.bin	; player code

;	org	$0e36
	push	af
	call	$056e		; player init
	pop	af
	cp	3
	jr	c,_1
	inc	a
_1
	jp	$06df		; song select

	org	$330a
	libbin	o-data.bin	; songs data


