.include �m32def.inc�
start:
    ldi r16, HIGH(Ramend)
    out SPH , r16
    ldi r16, LOW(Ramend)
    out SPL , r16
    call delay
    rjmp another_delay

delay:                    
    ldi r20,0x10          
L1: ldi r21,0xff        
L2: ldi r22,0xff          
L3: NOP                 
    dec r22              
    brne L3               
    dec r21             
    brne L2               
    dec r20             
    brne L1               
    ret   

another_delay:
    rjmp another_delay   
