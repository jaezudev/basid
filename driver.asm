; BaSID: a basic-ass SID sound driver
; 2022 by jaezu (jaezudev on github)

; definitions
define	freqlo1	$d400
define	freqhi1	$d401
define	wave1	$d404
define	ad1	$d405
define	sr1	$d406
define	vol	$d418

; max out the volume
lda #$0f
sta vol

; set the ADSR
lda #$07
sta ad1
lda #$00
sta sr1

; frequency lo-byte and hi-byte
lda #$45
sta freqlo1
lda #$1d
sta freqhi1

; set waveform (triangle = $11)
lda #$11
sta wave1
