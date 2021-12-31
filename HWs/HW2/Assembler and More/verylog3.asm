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
init    ldi 6 0x0000
        ldi 0 0x0000
        ldi 3 0x0b00
        st 3 6
start   call readkey
        ldi 5 0x000a
        sub 2 5 1
        jz init
        ldi 5 0x000b
        sub 2 5 1
        jz cmultlb
        ldi 5 0x000c
        sub 2 5 1
        jz caddlb
        ldi 0 10
        call mult               
        add 6 6 1             
        ldi 3 0x0b00
        st 3 6
        jmp start
cmultlb mov 4 6              
        ldi 6 0x0000            
contmul call readkey
        ldi 5 0x000b
        sub 2 5 1
        jz carp
        ldi 0 10                
        call mult
        add 6 6 1                          
        ldi 3 0x0b00
        st 3 6
        jmp contmul
carp    mov 0 6
        mov 6 4                   
        call mult
        ldi 3 0x0b00
        st 3 6
        jmp start 
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
caddlb  mov 4 6              
        ldi 6 0x0000            
contadd call readkey
        ldi 5 0x000c
        sub 2 5 1
        jz addit
        ldi 0 10                
        call mult
        add 6 6 1                          
        ldi 3 0x0b00
        st 3 6
        jmp contadd
addit   mov 0 6
        mov 6 4
        add 6 6 0
        mov 0 6
        ldi 3 0x0b00
        st 3 6
        jmp start
readkey ldi 3 0x0001
        ldi 2 0x0901
        ld 2 2
        and 2 2 3
        jz readkey
        ldi 1 0x0900
        ld 1 1
        ret