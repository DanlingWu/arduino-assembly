; Danling Wu

.equ SREG, 0x3f ;
.equ DDRB, 0x04 ;
.equ PORTB, 0x05 ;

.org 0

main:        ldi r16, 0  ;        
             out SREG,r16 ;

	  
             ldi r16, 0x0F                        ;set PORTB to output             
             out DDRB,r16 ;

      
lighton:     ldi r16, 0x01                       ;output 1 value to portb
             out PORTB , r16

			ldi r20,40
             call delay
lightoff:    ldi r16, 0x00
             out PORTB , r16

			ldi r20, 20
             call delay
             rjmp lighton
delay:     	ldi r17, r20 ; 				 
			loop6:    nop ; 			
				ldi r18, 255 ; 			1 clock cycle = 1/16000000 s
				loop7:    nop ; 		
						ldi r19, 125; 	(l clock cycle
						loop8:    nop 	; 1 clock cycle
						dec r19			; 1 clock cycle
						cpi r19, 0 		; 1 clock cycle
						brne  loop8     ; 1 clock if loop, )2 clock if not
				dec r18
				cpi r18, 0
				brne  loop7 
			dec r17
			cpi r17, 0
			brne  loop6
			ret