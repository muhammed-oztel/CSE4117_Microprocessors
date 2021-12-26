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
init            ldi 0 0
                ldi 2 0
                ldi 1 0
                ldi 3 0
                ldi 4 1
                ldi 5 0xe 
                ldi 6 0xf
                # call to convert hex to binary for keypad
readkey         ldi 1 0x0900
                ldi 2 0x0901
                ld 1 1
                ld 2 2
                and 2 2 4
                jz readkey # * e # f
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
                jmp readkey
        
setaddreg	ldi 3 0xf
                ld 3 3
                jmp readkey

setmultreg	ldi 3 0xe
                ld 3 3
                jmp readkey

callmultlbl	call mult
                jmp readkey

calladdlbl	call addit
                jmp readkey

addit		add 0 0 1
                ldi 1 0x0b00
                st 1 0
                ret

mult		mul 0 0 1
                ldi 1 0x0b00
                st 1 0
                ret