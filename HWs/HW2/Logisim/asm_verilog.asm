.data
    BEGINMEM:0x0000
	ENDMEM:0x01ff
	KEYPAD:0x0900
	STATUSREG:0x0901
	SEVENSEG:0x0b00
    STAR:0xe
    SQUARE:0xf
.code
# r0 result
# r1 coming input, keypad
# r2 keypad +1 to check status reg then changes
# r3
# r4 
# r5 star
# r6 square
# r7 stack pointer ---- DONT TOUCH
init    ldi 0 0
        ldi 2 0
        ldi 1 0
        ldi 3 0
        ldi 4 1
        ld 5 STAR 
        ld 6 SQUARE
        # call to convert hex to binary for keypad
readkey ld 1 KEYPAD
        ld 2 STATUSREG
loop1   jz readkey # * e # f
        sub 2 5 1
        jz setmultreg
        sub 2 6 1
        jz setaddreg
        and 2 3 4  # enters only at the beginning of the program
        jz calladdlbl
        sub 2 3 5
        jz callmultlbl
        sub 2 3 6
        jz calladdlbl
        
setaddreg
        ld 3 SQUARE
        jmp readkey

setmultreg
        ld 3 STAR
        jmp readkey

callmultlbl
        call mult
        jmp readkey

calladdlbl
        call addit
        jmp readkey

addit
        add 0 0 1
        ret

mult
        mul 0 0 1
        ret