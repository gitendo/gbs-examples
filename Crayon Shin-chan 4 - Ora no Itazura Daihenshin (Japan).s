BANK0	group	$00
	org	$0000

	db	"GBS"		; Identifier string ("GBS")
	db	1		; Version (1)
	db	47		; Number of songs (1-255)
	db	1		; First song (usually 1)
	dw	$0f0d		; Load address ($400-$7fff)
	dw	$1703		; Init address ($400-$7fff)
	dw	$0f9d		; Play address ($400-$7fff)
	dw	$e000		; Stack pointer
	db	0		; Timer modulo
	db	0		; Timer control
	db	"Crayon Shin-chan 4 (J)",0		; Title string
	org	$0030
	db	"<?>",0		; Author string
	org	$0050
	db	"Yoshito Usui/Futabasha, Shinei",0		; Copyright string


	org	$0f0d
	libbin	s-plyr.bin

;	org	$1710
init:
	push	af
	call	$0f0d
	pop	af
	cp	18
	jr	c,_1
	ld	b,a
	xor	a
	ld	($dd9f),a
	ld	a,b
_1
	rlca
	add	a,<table
	ld	l,a
	adc	a,>table
	sub	l
	ld	h,a
	ld	a,(hl+)
	ld	h,(hl)
	dec	h
	jp	z,$0f3b
	dec	h
	jp	z,$0f38
	dec	h
	jp	z,$0f35
	jp	$0f32

table	;libbin	table.bin
	dw	$0400, $0404, $0408, $040C, $0410, $0414, $041C, $0420		;songs
	dw	$0424, $0428, $042C, $0430, $0434, $0438, $043C, $0455
	dw	$0460, $0464

	dw	$0140, $0141, $0142, $0143, $0244, $0145, $0246, $0147		;sfx
	dw	$0148, $0249, $014A, $014B, $014C, $014D, $014E, $014F
	dw	$0150, $0151, $0152, $0153, $0154, $0159, $015A, $015B
	dw	$015C, $015D, $025E, $015F, $0168


BANK1	group	$01
	org	$6200
	libbin	s-data.bin

