// BaSID: a basic-ass SID sound driver

*=$0C00

// definitions
.label freqlo1=$d400
.label freqhi1=$d401
.label wave1=$d404
.label ad1=$d405
.label sr1=$d406
.label vol=$d418

START:
		// max out the volume
		lda #$0f
		sta vol
		
		// set the ADSR
		lda #$0a
		sta ad1
		lda #$00
		sta sr1
		
		// frequency lo-byte and hi-byte
		lda #$45
		sta freqlo1
		lda #$1d
		sta freqhi1
		
		// set waveform (triangle = $11)
		lda #$11
		sta wave1
		
		rts
