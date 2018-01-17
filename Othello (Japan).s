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
	cp	2
	jr	nz,_1
	ld	a,$fe		; turn on vol for song 3
	ld	($cb54),a
_1
	call	$056e		; player init
	ld	a,$ff
	call	$06df		; song reset
	pop	af
	cp	2
	jr	c,_2
	inc	a		; song 2 repeats sfx 8 four times, then goes straight to song 3
_2
	jp	$06df		; song select

	org	$330a
	libbin	o-data.bin	; songs data


