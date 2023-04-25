.label freqlo1=$d400
.label freqhi1=$d401
.label freqlo2=$d407
.label freqhi2=$d408
.label freqlo3=$d40e
.label freqhi3=$d40f
.label pwlo1=$d402
.label pwhi1=$d403
.label pwlo2=$d409
.label pwhi2=$d40a
.label pwlo3=$d410
.label pwhi3=$d411
.label wave1=$d404
.label wave2=$d40b
.label wave3=$d412
.label ad1=$d405
.label sr1=$d406
.label ad2=$d40c
.label sr2=$d40d
.label ad3=$d413
.label sr3=$d414
.label vol=$d418

.label counter=$fa

*=$0801

BasicUpstart(start)

*=$0810

start:
	jsr init
	jmp play0

*=$1000

SPEED: .byte $0b

init:
	pha
	lda MASTER
	sta vol
	lda CH1_AD
	sta ad1
	lda CH1_SR
	sta sr1
	lda CH2_AD
	sta ad2
	lda CH2_SR
	sta sr2
	lda CH3_AD
	sta ad3
	lda CH3_SR
	sta sr3
	lda CH1_PL
	sta pwlo1
	lda CH1_PH
	sta pwhi1
	lda CH2_PL
	sta pwlo2
	lda CH2_PH
	sta pwhi2
	lda CH3_PL
	sta pwlo3
	lda CH3_PH
	sta pwhi3
	pla
	lda #$00
	sta counter
	tay
	rts

play0:
	lda CH1_DATA,y
	cmp #$ff
	beq endprg
	cmp #$fe
	beq restartplay
	dec wave1
	dec wave2
	dec wave3
	jsr boop_ch1
	jsr boop_ch2
	jsr boop_ch3
	iny
loop1:
	sty $0400
	lda #$fb
loop2:
	cmp $d012
	bne loop2
	inc counter
	lda counter
	cmp #$0b
	bne out
	lda #$00
	sta counter
play:
	lda CH1_DATA,y
	cmp #$ff
	beq endprg
	cmp #$fe
	beq restartplay
	dec wave1
	dec wave2
	dec wave3
	jsr boop_ch1
	jsr boop_ch2
	jsr boop_ch3
	iny
out:
	lda $d012
loop3:
	cmp $d012
	beq loop3
	jmp loop1

endprg:
	lda #$00
	sta wave1
	sta wave2
	sta wave3
	jmp $a714
restartplay:
	ldy #$00
	jmp play

boop_ch1:
	lda CH1_DATA,y
	cmp #$fc
	beq dooq_ch1
	cmp #$fd
	beq unboop_ch1
	tax
	lda NOTETABLE_LOW,x
	sta freqlo1
	lda NOTETABLE_HIGH,x
	sta freqhi1
	lda CH1_WV
	sta wave1
	rts
unboop_ch1:
	dec wave1
dooq_ch1:
	rts

boop_ch2:
	lda CH2_DATA,y
	cmp #$fc
	beq dooq_ch2
	cmp #$fd
	beq unboop_ch2
	tax
	lda NOTETABLE_LOW,x
	sta freqlo2
	lda NOTETABLE_HIGH,x
	sta freqhi2
	lda CH2_WV
	sta wave2
	rts
unboop_ch2:
	dec wave2
dooq_ch2:
	rts

boop_ch3:
	lda CH3_DATA,y
	cmp #$fc
	beq dooq_ch3
	cmp #$fd
	beq unboop_ch3
	tax
	lda NOTETABLE_LOW,x
	sta freqlo3
	lda NOTETABLE_HIGH,x
	sta freqhi3
	lda CH3_WV
	sta wave3
	rts
unboop_ch3:
	dec wave3
dooq_ch3:
	rts

#import "music.asm"

NOTETABLE_LOW:
	.byte $16, $27, $39, $4b, $5f, $74, $8a, $a1, $ba, $d4, $f0, $0e
	.byte $2d, $4e, $71, $96, $be, $e7, $14, $42, $74, $a9, $e0, $1b
	.byte $5a, $9c, $e2, $2d, $7b, $cf, $27, $85, $e8, $51, $c1, $37
	.byte $b4, $38, $c4, $59, $f7, $9e, $4e, $0a, $d0, $a2, $81, $6d
	.byte $67, $70, $89, $b2, $ed, $3b, $9d, $14, $a0, $45, $03, $db
	.byte $cf, $e1, $12, $65, $db, $76, $3a, $27, $41, $8a, $05, $b5
	.byte $9d, $c1, $24, $c9, $b6, $ed, $73, $4e, $82, $14, $0a, $6a
	.byte $3b, $82, $48, $93, $6b, $da, $e7, $9c, $04, $28, $14, $00

NOTETABLE_HIGH:
	.byte $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $02
	.byte $02, $02, $02, $02, $02, $02, $03, $03, $03, $03, $03, $04
	.byte $04, $04, $04, $05, $05, $05, $06, $06, $06, $07, $07, $08
	.byte $08, $09, $09, $0a, $0a, $0b, $0c, $0d, $0d, $0e, $0f, $10
	.byte $11, $12, $13, $14, $15, $17, $18, $1a, $1b, $1d, $1f, $20
	.byte $22, $24, $27, $29, $2b, $2e, $31, $34, $37, $3a, $3e, $41
	.byte $45, $49, $4e, $52, $57, $5c, $62, $68, $6e, $75, $7c, $83
	.byte $8b, $93, $9c, $a5, $af, $b9, $c4, $d0, $dd, $ea, $f8, $00