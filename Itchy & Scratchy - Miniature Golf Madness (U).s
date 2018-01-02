BANK0	group	$00
	org	$0000

main:
	db	"GBS"		; Identifier string ("GBS")
	db	1		; Version (1)
	db	28		; Number of songs (1-255)
	db	1		; First song (usually 1)
	dw	$659c		; Load address ($400-$7fff)
	dw	$7860		; Init address ($400-$7fff)
	dw	$659c		; Play address ($400-$7fff)
	dw	$e000		; Stack pointer
	db	0		; Timer modulo
	db	0		; Timer control
	db	"Itchy & Scratchy - Miniature Golf Madness",0		; Title string
	org	$0030
	db	"Marshall Parker",0		; Author string
	org	$0050
	db	"20th Century Fox, Acclaim",0		; Copyright string
	org	$0070

;	org	$659c
	libbin	is-plyr.bin		; extracted player binary, resource it by yourself if you care

;	org	$7860
init:
	push	af
	call 	$66a1		; player reset
	pop	af
	ld	hl,$de74
	inc	a
	or	$80
	cp	$83
	jr	c,_songs
	ld	b,a
	xor	a
	jr	_set
_songs
	ld	b,0
	cp	$81
	jr	nz,_set
	inc	b
_set
	ld	(hl),b		; sfx
	inc	l
	ld	(hl),a		; tune
	ret
