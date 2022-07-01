.global _start

_start:	mov	X0, #1 // stdout 
	ldr	X1, =msg
	mov	X2, msg_len 
	mov	X8, #64 // write to file (fd is in X0) system call
	svc	0

	mov	X0, #0
	mov	X8, #93 // terminate system call.
	svc	0

.data
msg:	.ascii "Hello assembly!\n"
msg_len = . - msg // '.' means current value of location counter
 
