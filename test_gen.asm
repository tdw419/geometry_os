; Draw a blue square at the to p left and right ac cent each p ul ts based on x 16 p i x el s t w o o m . The a p pro ac h with the screen .

; S cre en S cre en sho w s a 4 p i x el b lo ck
LDI r1, 0 ; x
LDI r2, 1 ; y
LDI r3, 24 ; y
LDI r4, 14 ; w
LDI r6, 0 ; y
LDI r7, 1 ; in crement
LDI r8, 256 ; li m it

draw_loop:
PSET r2, r6, r7
ADD r2, r7
CMP r2, r5
BLT r0, draw_vloop

; Draw g re en b ar at b ot to m
LDI r1, 0x44FF44 ; b ar
LDI r2, 240 ; y el lo w
LDI r3, 244 ; b right g re en
LDI r4, 4 ; h or i z on tal s h or i z on tal s c ro l l
LDI r6, 0xFFFFFF ; cy an
LDI r7, 0x00FF