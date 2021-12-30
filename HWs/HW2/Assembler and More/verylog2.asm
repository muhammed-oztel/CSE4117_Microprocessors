.data
        BEGINMEM:0x0000
        ENDMEM:0x01ff
        KEYPAD:0x0900
        STATUSREG:0x0901
        SEVENSEG:0x0b00
        STAR:0xe
        SQUARE:0xf

# r6 = total

.code
        ldi 6 0x0000
        ldi 0 0x0000
readkey ldi 4 0x0001
        ldi 2 0x0901
        ld 2 2
        and 2 2 4
        jz readkey
        ldi 1 0x0900
        ld 1 1
        ldi 5 0x000b
        sub 2 5 1
        jz cmultlb
        ldi 5 0x000c 
        sub 2 5 1
        jz caddlb
        ldi 3 0x0b00
        mov 0 1
        st 3 1
        jmp readkey
cmultlb call mult
        ldi 3 0x0b00
        st 3 6
        jmp readkey 
mult    ldi 5 0x0000
        mov 3 0 
        jz out1
loop2   add 5 6 5
        dec 3
        jz out1
        jmp loop2
out1    mov 6 5
        mov 0 6
        ret
caddlb  call addit
        ldi 3 0x0b00
        st 3 6
        jmp readkey 
addit   add 6 6 0
        mov 0 6
        ret