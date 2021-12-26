.data
                BEGINMEM:0x0000
                ENDMEM:0x01ff
                KEYPAD:0x0900
                STATUSREG:0x0901
                SEVENSEG:0x0b00
                STAR:0xe
                SQUARE:0xf
.code
init            ldi 0 1
                ldi 1 1
                ldi 2 0x0b00
                add 0 0 1
                st 2 0
                jmp init