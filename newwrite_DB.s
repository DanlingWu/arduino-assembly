; Danling Wu
; This program outputs my K number to the LEDs.

.equ SREG, 0x3f            
.equ PORTB, 0x05            
.equ DDRB, 0x04  
.equ PORTD, 0x0B
.equ DDRD, 0x0A         

.org 0                      


main:      ldi r16,0        ; load directly(immediately) 0 into register and marks a jump label main.
           out SREG,r16     ; stores data from r16(0) into status register given by SREG (0x3f). 
		   
			ldi r16, 0x0F
			out DDRB, r16
			
			ldi r16, 0xF0
			out DDRD, r16

ldi r16,0xDB              ; load number into r16              ; set data direction PORTB to output
out PORTB,r16               ; output r16 to PORTB                  
out PORTD,r16


mainloop:  rjmp mainloop    ; relative jump to an address, mainloop, which is the same line, so this program loops endlessly when it reach this line.
