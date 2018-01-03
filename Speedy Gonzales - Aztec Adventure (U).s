BANK0	group	$00

main:
	org	$0000

	db	"GBS"		; Identifier string ("GBS")
	db	1		; Version (1)
	db	54		; Number of songs (1-255)
	db	1		; First song (usually 1)
	dw	$3f00		; Load address ($400-$7fff)
	dw	$3fd6		; Init address ($400-$7fff)
	dw	$4003		; Play address ($400-$7fff)
	dw	$e000		; Stack pointer
	db	0		; Timer modulo
	db	0		; Timer control
	db	"Speedy Gonzales: Aztec Adventure (U)",0		; Title string
	org	$0030
	db	"<?>",0		; Author string
	org	$0050
	db	"Warner Bros., Sunsoft",0		; Copyright string
	org	$0070

; remove padding data from output binary between these addresses

	org 	$3f00
songs
	db	01,02,03,04,05,06,07,08,09,10,11,62,63
sfx
	db	14,15,16,17,18,19,20,21,22,23,24,25,26
	db	27,28,29,30,31,32,33,35,37,38,39,40,41
	db	42,43,44,45,46,47,48,51,52,53,54,55,56
	db	57,58


	org	$3fd6

	push	af
	ld	a,($c0f4)
	cp	$ff
	call	nz,$4000	; player reset
	pop	af
	ld	h,$3f		; songs' offset hi byte
	ld	l,a
	ld	a,(hl)
	or	$80
	jp	$4006		; select song/sfx


	org	$3fe9		; bank switching routine used in game

	di
	ld	($ff80),a
	swap	a
	and	7
	srl	a
	ld	($4000),a
	ld	a,($ff80)
	and	$1f
	ld	($2000),a
	ei
	ret


BANK1	group	$01
	org	$4000
	libbin	sg-plyr.1


BANK2	group	$02
	org	$4000
	libbin	sg-plyr.2
