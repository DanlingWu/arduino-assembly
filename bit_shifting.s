; Danling Wu

.equ SREG, 0x3f            
.equ PORTB, 0x05            
.equ DDRB, 0x04  
.equ PORTD, 0x0B
.equ DDRD, 0x0A         

.org 0                      


main:      ldi r16,0        
           out SREG,r16   

			ldi r16, 0x0F
			out DDRB, r16
			
			ldi r16, 0xF0
			out DDRD, r16
		   
original:			
					ldi r16,0x55                         
					out PORTB,r16                  
					out PORTD,r16
					
shiftToLeft:		call halfsec
		            ldi r16, 0x55
					lsl r16             
					out PORTB,r16
					out PORTD,r16 					   

					call halfsec
					lsr r16             
					out PORTB,r16
					out PORTD,r16
					
					call halfsec
					rjmp original


halfsec:   
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
			ret
