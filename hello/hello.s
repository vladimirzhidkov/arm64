
.text
.align 8
.global _start // starting address

_start:
    ldr     X1, =msg
    mov     X2, msg_len 
    bl      print // branch and link

// exit
    mov     X0, #0
    bl      exit


/*
    PRINT - print message to stdout
    X1 - string pointer to message
    X2 - message length
*/
print:
    mov     X0, #1 // stdout
    mov     X8, #64 // write to file (fd is in X0) system call
    svc     0 //supervisor call (software interrupt) expects arguments in X0-X4 and system call number in X8
    ret


/*
    EXIT - terminate program
    X0 - exit code
*/
exit:
    mov    X8, #93 // terminate system call.
    svc    0
    ret


.data
msg:
    .ascii "Hello assembly!\n"
msg_len = . - msg // '.' means current value of location counter
 
