; Define the registers
.DEF R1_HI = R16
.DEF R1_LO = R17
.DEF R2_HI = R18
.DEF R2_LO = R19
.DEF RESULT_2 = R20
.DEF RESULT_1 = R21

; Load initial values into registers
LDI R1_HI, 0x48    ; Load 0x48 into R1_HI
LDI R1_LO, 0x74    ; Load 0x74 into R1_LO
LDI R2_HI, 0x02    ; Load 0x02 into R2_HI
LDI R2_LO, 0x12    ; Load 0x12 into R2_LO
LDI R30, 1         ; Load 1 into R30

; Main Loop
MAIN:
  CP R1_HI, R2_HI  ; Compare R1_HI with R2_HI
  BRLO EXIT        ; If R1_HI < R2_HI, exit loop
  CP R1_HI, R2_HI  ; Compare R1_HI with R2_HI again
  BRNE OPERATION   ; If R1_HI != R2_HI, perform OP
  CP R1_LO, R2_LO  ; Compare R1_LO with R2_LO
  BRLO EXIT        ; If R1_LO < R2_LO, exit loop

OPERATION:
  SUB R1_LO, R2_LO  ; Subtract R2_LO from R1_LO
  SBC R1_HI, R2_HI  ; Subtract R2_HI from R1_HI with borrow
  ADD RESULT_1, R30 ; Add 1 to RESULT_1
  ADC RESULT_2, R0  ; Add carry to RESULT_2
  RJMP MAIN         ; Repeat MAIN loop

EXIT: RJMP EXIT     ; End of program
