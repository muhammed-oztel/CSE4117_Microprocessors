.data
.code
init    ldi 6 0x0000
        ldi 0 0x0000
        mov 6 0
        call showval
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
        call showval
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
        call showval
        jmp contmul
carp    mov 0 6
        mov 6 4                   
        call mult
        call showval
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
        call showval
        jmp contadd
addit   mov 0 6
        mov 6 4
        add 6 6 0
        mov 0 6
        call showval
        jmp start
readkey ldi 3 0x0001
        ldi 2 0x0901
        ld 2 2
        and 2 2 3
        jz readk2
        ldi 1 0x0900
        ld 1 1
        ret
readk2  ldi 1 0x0c00
        ld 1 1
        ret
showval mov 0 6
        ldi 3 0x0001
        ldi 5 0x0008
sloop   and 2 3 5
        jz endshow
        ldi 2 0x0000
        sub 2 0 2
        jz endshow
        ldi 2 0x0100
        sub 2 0 2
        jz sloop2
        ldi 2 0x0200
        sub 2 0 2
        jz sloop2
        ldi 2 0x0300
        sub 2 0 2
        jz sloop2
        ldi 2 0x0400
        sub 2 0 2
        jz sloop2
        ldi 2 0x0300
        add 0 0 2
sloop2  ldi 2 0x1000
        sub 2 0 2
        jz shft
        ldi 2 0x2000
        sub 2 0 2
        jz shft
        ldi 2 0x3000
        sub 2 0 2
        jz shft
        ldi 2 0x4000
        sub 2 0 2
        jz shft
        ldi 2 0x3000
        add 0 0 2
shft    add 0 0 0
        dec 5
        jmp sloop
endshow ldi 3 0x0b00
        st 3 0
        ret


        