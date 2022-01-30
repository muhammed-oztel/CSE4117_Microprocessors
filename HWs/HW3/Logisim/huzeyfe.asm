.data
.code
        ldi 6 0x0
loop1   ldi 0 0xFFF0
        ld 0 0
        ldi 1 0xFFF1
        ld 1 1
        ldi 2 0xFFF2
        ld 2 2
        ldi 4 0x0001
        and 5 4 2
        jz chkpb2
        jmp multsum
chkpb2  ldi 2 0xFFF3
        ld 2 2
        ldi 4 0x0001
        and 5 4 2
        jz loop1
        jmp mult
multsum call pb1sum 
        jmp dsseg
mult    call pb2mult
        jmp dsseg
dsseg   call showval
        jmp loop1
pb1sum  add 6 6 6
        add 6 6 0
        ret
pb2mult mov 3 1
        ldi 5 0x0000
        jz out1
loop2   add 5 6 5
        dec 3
        jz out1
        jmp loop2
out1    mov 6 5
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
endshow ldi 2 0xFFF4
        st 2 6
        ret
    