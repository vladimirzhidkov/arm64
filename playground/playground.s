.global _start

_start:	mov	X0, #1 // stdout 
	ldr	X1, =message
	mov	X2, #16 
	mov	X8, #64 // write to file (fd is in X0) system call
	svc	0

	mov	X0, #0
	mov	X8, #93 // terminate system call.
	svc	0

.data
message:	.ascii "Hello assembly!\n"
