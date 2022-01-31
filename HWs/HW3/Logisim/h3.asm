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
        ldi 4 0x00e0
        and 2 0 4
        ldi 3 0x0020
        sub 3 2 3
        jz pass1
        ldi 3 0x0040
        sub 3 2 3
        jz pass1
        ldi 3 0x0060
        sub 3 2 3
        jz pass1
        ldi 3 0x0080
        sub 3 2 3
        jz pass1
        ldi 4 0x0060
        add 0 0 4
pass1   ldi 4 0x00f0
        and 2 0 4
        ldi 3 0x0010
        sub 3 2 3
        jz pass2
        ldi 3 0x0020
        sub 3 2 3
        jz pass2
        ldi 3 0x0030
        sub 3 2 3
        jz pass2
        ldi 3 0x0040
        sub 3 2 3
        jz pass2
        ldi 4 0x0030
        add 0 0 4
pass2   ldi 4 0x0078
        and 2 0 4
        ldi 3 0x0008
        sub 3 2 3
        jz pass3
        ldi 3 0x0010
        sub 3 2 3
        jz pass3
        ldi 3 0x0018
        sub 3 2 3
        jz pass3
        ldi 3 0x0020
        sub 3 2 3
        jz pass3
        ldi 4 0x0018
        add 0 0 4
pass3   ldi 4 0x01c0
        and 2 0 4
        ldi 3 0x0040
        sub 3 2 3
        jz pass4
        ldi 3 0x0080
        sub 3 2 3
        jz pass4
        ldi 3 0x00c0
        sub 3 2 3
        jz pass4
        ldi 3 0x0100
        sub 3 2 3
        jz pass4
        ldi 4 0x00c0
        add 0 0 4
pass4   ldi 4 0x003c
        and 2 0 4
        ldi 3 0x0004
        sub 3 2 3
        jz pass5
        ldi 3 0x0008
        sub 3 2 3
        jz pass5
        ldi 3 0x000c
        sub 3 2 3
        jz pass5
        ldi 3 0x0010
        sub 3 2 3
        jz pass5
        ldi 4 0x000c
        add 0 0 4
pass5   ldi 4 0x01e0
        and 2 0 4
        ldi 3 0x0020
        sub 3 2 3
        jz pass6
        ldi 3 0x0040
        sub 3 2 3
        jz pass6
        ldi 3 0x0060
        sub 3 2 3
        jz pass6
        ldi 3 0x0080
        sub 3 2 3
        jz pass6
        ldi 4 0x0060
        add 0 0 4
pass6   ldi 4 0x001e
        and 2 0 4
        ldi 3 0x0002
        sub 3 2 3
        jz endshow
        ldi 3 0x0004
        sub 3 2 3
        jz endshow
        ldi 3 0x0006
        sub 3 2 3
        jz endshow
        ldi 3 0x0008
        sub 3 2 3
        jz endshow
        ldi 4 0x0006
        add 0 0 4
endshow ldi 1 0x7FF5	
        st  1 0
        ret