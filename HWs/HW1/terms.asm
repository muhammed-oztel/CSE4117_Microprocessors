.data 
            terms: 7

.code 
init        ldi 2 terms # initialize reg 2 to dec 1 
            ldi 0 terms # initializing

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