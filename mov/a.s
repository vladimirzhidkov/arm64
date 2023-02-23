.global _start

.text
_start:
    // load x2 with 0x1234FECD5687ABCD first using mov and movk
    movz x2, #0xABCD
    movk x2, #0x5687, LSL #16
    movk x2, #0xFECD, LSL #32
    movk x2, #0x1234, LSL #48

    // just move w2 into w1
    mov w1, w2

    // all shifts versions
    mov x1, x2, LSL #1
    mov x1, x2, LSR #1
    mov x1, x2, ASR #1
    mov x1, x2, ROR #1

    // same shifts but using mnemonics
    lsl x1, x2, #1
    lsr x1, x2, #1
    asr x1, x2, #1
    ror x1, x2, #1

    // movn
    movn x1, #0

       
 

    // exit
    mov x0, #0 // exit status
    mov x8, #93 // terminate
    svc 0
