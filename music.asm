#importonce
SPEED: .byte $0b
MASTER: .byte $0f
CH1_AD: .byte $09
CH1_SR: .byte $70
CH2_AD: .byte $09
CH2_SR: .byte $70
CH3_AD: .byte $09
CH3_SR: .byte $70
CH1_WV: .byte $11
CH2_WV: .byte $11
CH3_WV: .byte $11
CH1_PL: .byte $00
CH1_PH: .byte $01
CH2_PL: .byte $00
CH2_PH: .byte $01
CH3_PL: .byte $00
CH3_PH: .byte $01
CH1_DATA:
	.byte $30, $fc, $37, $3a, $3c, $3a, $37, $33
	.byte $30, $33, $37, $3a, $3c, $3a, $37, $33
	.byte $30, $33, $37, $3a, $3c, $3a, $37, $33
	.byte $30, $33, $37, $3a, $3c, $3a, $37, $33
	.byte $35, $38, $3c, $3f, $41, $3f, $3c, $38
	.byte $35, $38, $3c, $3f, $41, $3f, $3c, $38
	.byte $35, $38, $3c, $3f, $41, $3f, $3c, $38
	.byte $35, $38, $3c, $3f, $41, $3f, $3c, $38
	.byte $fe
CH2_DATA:
	.byte $33, $fc, $3a, $3e, $3f, $3e, $3a, $37
	.byte $33, $37, $3a, $3e, $3f, $3e, $3a, $37
	.byte $33, $37, $3a, $3e, $3f, $3e, $3a, $37
	.byte $33, $37, $3a, $3e, $3f, $3e, $3a, $37
	.byte $38, $3c, $3f, $43, $44, $43, $3f, $3c
	.byte $38, $3c, $3f, $43, $44, $43, $3f, $3c
	.byte $38, $3c, $3f, $43, $44, $43, $3f, $3c
	.byte $38, $3c, $3f, $43, $44, $43, $3f, $3c
	.byte $fe
CH3_DATA:
	.byte $37, $fc, $3e, $41, $43, $41, $3e, $3a
	.byte $37, $3a, $3e, $41, $43, $41, $3e, $3a
	.byte $37, $3a, $3e, $41, $43, $41, $3e, $3a
	.byte $37, $3a, $3e, $41, $43, $41, $3e, $3a
	.byte $3c, $3f, $43, $46, $48, $46, $43, $3f
	.byte $3c, $3f, $43, $46, $48, $46, $43, $3f
	.byte $3c, $3f, $43, $46, $48, $46, $43, $3f
	.byte $3c, $3f, $43, $46, $48, $46, $43, $3f
	.byte $fe