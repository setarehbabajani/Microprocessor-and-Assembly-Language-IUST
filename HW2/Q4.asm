ldi   R16 , 0          ; Load immediate value 0 into register R16
ldi   R17 , 0xff       ; Load immediate value 0xFF into register R17
ldi   R18 , 0b11001010 ; Load immediate binary value 11001010 into register R18

out   DDRA , R16       ; Configure port A as input 
out   DDRB , R16       ; Configure port B as input 
out   DDRD , R17       ; Configure port D as output 

Q4 :  in R19 , PINA    ; Read input from port A and store it in register R19
      cp R18 , R19     ; Compare the values in R18 and R19
      brne Q4          ; Branch to label Q4 if not equal (if R18 and R19 are not equal)

      in R20 , PINB     ; Read input from port B and store it in register R20
      add R19 , R20     ; Add the values in R19 and R20, storing the result in R19
      out PORTD , R19   ; Output the value in R19 to port D (write R19 to PORTD)

      inc R18           ; Increment the value in R18
      rjmp Q4           ; Unconditional relative jump to label Q4 (loop back)

