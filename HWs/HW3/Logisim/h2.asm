.data
.code
        ldi 7 0x0900
        ldi 4 0x07f0
        ldi 2 tisr
        st  4 2
        ldi 5 0x0000
main    sti
        ldi 3 0x0000
        cli
        jmp main
tisr    ldi 1 0x0001 
        add 5 5 1
        call showval
        iret
showval mov 0 5
        ldi 3 0x0001
        ldi 1 0x0008
sloop   and 2 3 1
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
        dec 1
        jmp sloop
endshow ldi 1 0x7FF5	
        st  1 0
        ret
