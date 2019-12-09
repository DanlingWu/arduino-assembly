; Danling Wu
; Timing the LED light flashing according to the morse code for "dan". 

.equ SREG, 0x3f                                ; assign constant 0x3f to SREG.
.equ DDRB, 0x04                                ; assign constant 0x04 to DDRB.
.equ PORTB, 0x05                               ; assign constant 0x05 to PORTB.

.org 0                                         ;start of our program, it sets the location counter to zero.

main:        ldi r16, 0                        ;clear SREG to 0.       
             out SREG,r16 ;

	  
             ldi r16, 0x0F                     ;set PORTB to output             
             out DDRB,r16 ;

dan:		call dash;                         ;morse code for "dan".
            call space;
			call dot;
			call space;
			call dot;
			call newletter;
			call dot;
			call space;
			call dash;
			call newletter;
			call dash;
			call space;
			call dot;
			call space;
			rjmp dan;
			
newletter:  call space                          ;between letters space.
			call space
			call space
			ret
			
            
dot:     	call lighton                        ;lighting time fot a dot.
			ldi r17, 20
			loop6:    nop
				ldi r18, 255
				loop7:    nop
						ldi r19, 125
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
			call lightoff
			ret

space: 	    ldi r17, 20                         ;delay time for the space between parts of the same letter.
			loop1:    nop
				ldi r18, 255
				loop2:    nop
						ldi r19, 125
						loop3:    nop
						dec r19
						cpi r19, 0
						brne  loop3
				dec r18
				cpi r18, 0
				brne  loop2 
			dec r17
			cpi r17, 0
			brne  loop1
			ret
			
dash:		call lighton                         ;lighting time for a dash.
			ldi r17, 60
			loop4:    nop
				ldi r18, 255
				loop5:    nop
						ldi r19, 125
						loop61:    nop
						dec r19
						cpi r19, 0
						brne  loop61
				dec r18
				cpi r18, 0
				brne  loop5
			dec r17
			cpi r17, 0
			brne  loop4
			call lightoff
			ret	
			
lighton:    ldi r16, 0x01                       ;output 1 value to PORTB which is turning a light on.
            out PORTB , r16
		    ret
lightoff:   ldi r16, 0x00                       ;output 0 which is turning the light off.
            out PORTB , r16
			ret