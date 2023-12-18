.INCLUDE "M32DEF.INC"
.DEF cnt = R10			; Counter variable defined as R10
.EQU i = 0xB0			; Memory location 0xB0 used for variable i
.EQU j = 0xB1			; Memory location 0xB1 used for variable j
.ORG 0					; Start of the code

	LDI R16, 0			; Initialize R16 with 0
	MOV cnt, R16		; Initialize cnt (R10) with 0
	
	LDI R17, 5			; Load immediate value 5 to R17
	LDI R18, 6			; Load immediate value 6 to R18

	LDI R19, 0			; Initialization for outer loop counter
	LDI R23, 2			; Value to add to the counter in the outer loop
	LDI R24, 1			; Value to add to the counter in the inner loop

outerLoop:
	INC R19				; Increment R19 (outer loop counter)
	STS i, R19			; Store R19 value into memory location i (0xB0)

	LDI R20, 0			; Initialize R20
	ADD R20, R17		; R20 = R17
	ADD R20, R18		; R20 = R17 + R18 (representing 5+6)

innerLoop:
	LDS R21, i			; Load value from memory location i (0xB0) to R21
	LDS R22, j			; Load value from memory location j (0xB1) to R22

	CP R22, R21			; Compare j with i
	ADD cnt, R24		; Increment cnt
	BRMI innerLoop		; Branch if j >= i to continue inner loop

	SUB cnt, R24		; Undo the last increment
	ADD cnt, R23		; Add 2 to cnt

	CP R19, R20			; Compare outer loop counter with the total iterations
	BRCS outerLoop		; Branch if R19 is less than or equal to R20 (total iterations)
