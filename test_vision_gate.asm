; Vision Property Gate Test
; Draws two dashboard regions to validate:
;   1. MeC (Meaningful Colors) <= 8
;   2. TiR (Text-Ink Ratio) <= 30%
;   3. Rule of 6 (<= 6 visual elements)
;   4. Information hierarchy (top-left = health)

; Top-left quadrant: System health indicator (green = good)
; Uses color 3 (green) for "healthy" bar

; Region 1: Top bar - system health at a glance
mov r0, 0        ; x = 0
mov r1, 0        ; y = 0
mov r2, 64       ; width = 64 pixels (1/4 of 256)
mov r3, 16       ; height = 16 pixels
mov r4, 3        ; color = green (healthy)
fill_rect r0 r1 r2 r3 r4

; Health label "OK" at (4, 4)
mov r0, 4
mov r1, 4
mov r2, 0        ; color = white
set_color r2
print_str "OK"

; Region 2: Middle area - scheduler activity bars
; Four horizontal bars showing process states
mov r5, 0        ; bar index
bar_loop:
  mov r0, 0
  mov r1, 40
  mul r1, r5     ; y = 40 + (index * 12)
  add r1, 40
  mov r2, 48     ; width
  mov r3, 8      ; height

  ; Color based on bar index: 4,5,6,7
  mov r4, r5
  add r4, 4
  fill_rect r0 r1 r2 r3 r4

  add r5, 1
  cmp r5, 4
  jlt bar_loop

; Region 3: Bottom area - process metadata text
mov r0, 0
mov r1, 100
set_cursor r0 r1
mov r2, 7        ; color = white
set_color r2
print_str "P0:SLEEP P1:RUN P2:WAIT"

; End
halt
