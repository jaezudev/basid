*=$1000

// CH1 definitions
.label freqlo1=$d400
.label freqhi1=$d401
.label pwlo1=$d402
.label pwhi1=$d403
.label wave1=$d404
.label ad1=$d405
.label sr1=$d406

// CH2 definitions
.label freqlo2=$d407
.label freqhi2=$d408
.label pwlo2=$d409
.label pwhi2=$d40a
.label wave2=$d40b
.label ad2=$d40c
.label sr2=$d40d

// CH3 definitions
.label freqlo3=$d40e
.label freqhi3=$d40f
.label pwlo3=$d410
.label pwhi3=$d411
.label wave3=$d412
.label ad3=$d413
.label sr3=$d414

// General SID stuff
.label vol=$d418

// Notetable
.var loBytes = List().add(22, 39, 57, 75, 95, 116, 138, 161, 186, 212, 240, 14, 45, 78, 113, 150, 190, 231, 20, 66, 116, 169, 224, 27, 90, 156, 226, 45, 123, 207, 39, 133, 232, 81, 193, 55, 180, 56, 196, 89, 247, 158, 78, 10, 208, 162, 129, 109, 103, 112, 137, 178, 237, 59, 157, 20, 160, 69, 3, 219, 207, 225, 18, 101, 219, 118, 58, 39, 65, 138, 5, 181, 157, 193, 36, 201, 182, 237, 115, 78, 130, 20, 10, 106, 59, 130, 72, 147, 107, 218, 231, 156, 4, 40, 20)
.var hiBytes = List().add(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 6, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 12, 13, 13, 14, 15, 16, 17, 18, 19, 20, 21, 23, 24, 26, 27, 29, 31, 32, 34, 36, 39, 41, 43, 46, 49, 52, 55, 58, 62, 65, 69, 73, 78, 82, 87, 92, 98, 104, 110, 117, 124, 131, 139, 147, 156, 165, 175, 185, 196, 208, 221, 234, 248)

start:
		// max out the volume
		lda #$0f
		sta vol
		// set the ADSR
		lda #$0a
		sta ad1
		sta ad2
		sta ad3
		lda #$00
		sta sr1
		sta sr2
		sta sr3
		// frequency lo-byte and hi-byte
		ldx #loBytes.get(48)
		ldy #hiBytes.get(48)
		stx freqlo1
		sty freqhi1
		ldx #loBytes.get(52)
		ldy #hiBytes.get(52)
		stx freqlo2
		sty freqhi2
		ldx #loBytes.get(55)
		ldy #hiBytes.get(55)
		stx freqlo3
		sty freqhi3
		// set waveform (triangle = $11)
		lda #$11
		sta wave1
		sta wave2
		sta wave3
		rts
