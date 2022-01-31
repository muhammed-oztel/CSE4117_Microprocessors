.data
        s1: 0xfff0
        s2: 0xFFF1
        p1: 0xFFF2
        p2: 0xFFF3
        ss1: 0xFFF4
        ss2: 0xFFF5
        5: sum reg
        6: flags
        7: stack pointer
.code
        ldi 7 0x0900
        ldi 4 0x07f0
        ldi 2 tisr
        st  4 2
        ldi 5 0x0000
main    sti
        ldi 0 0xFFF0 # s1 sel
        ld 0 0
        ldi 1 0xFFF1 # s2 sel
        ld 1 1
        ldi 2 0xFFF2 # pb1 sel
        ld 2 2
        ldi 3 0x0001
        and 3 3 2
        cli
        jz main
        sti
        add 1 1 0
        ldi 0 0xFFF4
        st 1 0
        cli
        jmp main
tisr    push 1
        ldi 1 0x0001 
        add 5 5 1
        ldi 1 0x7FF5	
        st  1 5
        pop 1
        iret
				
