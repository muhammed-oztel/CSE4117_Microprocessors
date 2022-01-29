.data
.code
			ldi     0 0x07f0
			ldi    	1 timerisr
			st      0 1
			ldi     5 0x0000
main		
			

			jmp main

timerisr 	ldi 1 0x0000 
        	add 5 5 1
			ldi	1 0xFFF5	# timer sseg
			st  1 5
			iret