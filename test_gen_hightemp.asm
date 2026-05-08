; Draw a re d circle at co or d in ate s ( 10 , 10 ) . It the n p i x el s to RA M 3 3 4 be f o re h al t ing e x e cu tion .

; D i re d p i x el - based -- draw a ra me s s = 20 - based screen p i x el s ( 10 , 10 ) and w as p i x el at ( 10 , 20 p i x el s w id , 4 )
; P i x el s from screen
; P i x el s to RA M - based screen p i x el s to RA M 0x 10000 - 0x 24 FF FF

LDI r0, 0x4000 ; p i x el 0
LDI r1, 1 ; r1 = p i x el index

bar_loop:
; Co mp ut e p i x el s at ( x , y ) is p i x el p a ra me t ers
; de crement
LDI r2, 0 ; color index 0
LDI r3, 12
LDI r8, 4 ; color p i x el

x_loop:
; Co mp ut e ac h color : x