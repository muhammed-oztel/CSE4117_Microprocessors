.data
.code
        ldi 7 0x1000
start	call readkey
	call showval
	jmp start
readkey	ldi 0 0x0901	# read keypad
	ld 0 0
	ldi 1 0x0001
	and 1 1 0
	jz readpb	# if status is zero, read pushbutton
	ldi 0 0x0900
	ld 0 0
	ret
readpb	ldi 0 0x0c01	# read pushbutton
	ld 0 0 
	ldi 1 0x0001
	and 1 1 0	
	jz readkey 	# if status is zero, read keypad
	ldi 0 0x0c00
	ld 0 0
	call showval
	jmp readkey
showval ldi 1 0x0b00	# show value
	st 1 0
	ret

