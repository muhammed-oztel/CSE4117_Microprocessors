.data 
            terms: 7
.code 
init        ldi 2 terms 
            ldi 0 terms 
            ld 2 2
            ld 0 0
loopb       add 1 1 0  
            dec 2
            jz out1
            jmp loopb
out1        dec 0
            jz exit
            dec 0 
            add 2 2 0
            jmp loopb
exit        add 0 1 4
lp1        jmp lp1