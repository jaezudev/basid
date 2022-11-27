; Basic-ass SID sound driver
; don't question why

; first of all, we need to define some stuff
; cuz that will make our lives easier

define	freqlo1	$d400
define	freqhi1	$d401
define	cr1		$d404
define	ad1		$d405
define	sr1		$d406
define	vol		$d418

; TODO: code the actual routine

; select waveform (10h = triangle)
lda #$10
sta cr1

; set ADSR (3, 7, 0, 0)
lda #$37
sta ad1
lda #$00
sta sr1

; divide frequency into high and low


; play
lda #$0f
sta vol
