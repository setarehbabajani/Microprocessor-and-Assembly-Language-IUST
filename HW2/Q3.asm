.include "iom328p.h"

ldi r20,15        ; Load immediate value 15 into register r20 (outer loop counter)
L1: ldi r21,65    ; Load immediate value 65 into register r21 (middle loop counter)
L2: ldi r22,0xff  ; Load immediate value 0xff into register r22 (inner loop counter)
L3: NOP           ; No operation
dec r22           ; Decrement inner loop counter r22
brne L3           ; Branch if r22 is not equal to zero to label L3 (2 cycles if branch taken, 1 cycle if not)

dec r21           ; Decrement middle loop counter r21
brne L2           ; Branch if r21 is not equal to zero to label L2 (2 cycles if branch taken, 1 cycle if not)
                  ; This loop controls the middle loop, which iterates multiple times

dec r20           ; Decrement outer loop counter r20
brne L1           ; Branch if r20 is not equal to zero to label L1 (2 cycles if branch taken, 1 cycle if not)
                  ; This loop controls the outer loop, which iterates multiple times

ret               ; Return from subroutine
