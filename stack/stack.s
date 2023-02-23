
.text
    .align 8
    .global _start // starting address

_start:

// print msg	
    push    {FP, LR}
    add     SP, SP, #4
   
	ldr	    X1, =msg // assembler will create a pointer msg and load X1 with the value of that pointer
    mov     X2, msg_len // assembler will calculate msg_len and substitute the result for msg_len 
    bl      fn_print // branch and link, which means store the address of the next instruction to link register and jump to 'print' label 

// convert msg to uppercase
    ldr	    X1, =msg
    mov     X2, msg_len
    bl      fn_upper

// print msg 3 times
    _init_count = 5
    _step = 1
    mov     X3, _init_count  // loop count
_loop:
    cmp     X3, #0
    beq     _end_loop
    
    // loop body
    ldr	    X1, =msg
    mov     X2, msg_len
    bl      fn_print
    
    // loop step increment
    sub     X3, X3, _step
    b       _loop
_end_loop:


// exit
    mov     X0, #0
    bl      fn_exit


/*
    MAIN FUNCTION
*/
fn_main:
    push    {FP, LR}
    


 
/*
    PRINT - print message to stdout
    input:
    X1 - string pointer to message
    X2 - message length
    reserved:
    X0 = 1 (stdout)
    X8 = 64 (print to file supervisor call)
*/
fn_print:
    mov     X0, #1 // stdout
    mov     X8, #64 // write to file (fd is in X0) system call
    svc     0 //supervisor call (software interrupt) expects arguments in X0-X4 and system call number in X8
    ret
/*
    EXIT - terminate program
    input:
    X0 - exit code
    reserved:
    X8 = 93 (terminate supervisor call)
*/
fn_exit:
	mov	    X8, #93 // terminate system call.
	svc	    0
    ret

.data
    msg:    .ascii "Hello assembly!\n"
    msg_len = . - msg // '.' means current value of assembler location counter
 
