; Danling Wu

.equ SREG, 0x3f ;
.equ DDRB, 0x04 ;
.equ PORTB, 0x05 ;

.org 0

main: ldi r16, 0  ;        
      out SREG,r16 ;

	  
      ldi r16, 0x0F                ;set PORTB to output             
      out DDRB,r16 ;

      
lighton:      ldi r16, 0x01                ;output 1 value to portb
      out PORTB , r16


    ldi r17, 255
    loop:    nop
		ldi r18, 255
		loop2:    nop
				ldi r19, 25
				loop3:    nop
				dec r19
				cpi r19, 0
				brne  loop3 
		dec r18
		cpi r18, 0
		brne  loop2 
	dec r17
	cpi r17, 0
	brne  loop
      
lightoff:      ldi r16, 0x00
      out PORTB , r16

    ldi r17, 255
    loop6:    nop
		ldi r18, 255
		loop7:    nop
				ldi r19, 25
				loop8:    nop
				dec r19
				cpi r19, 0
				brne  loop8
		dec r18
		cpi r18, 0
		brne  loop7 
	dec r17
	cpi r17, 0
	brne  loop6
rjmp lighton














