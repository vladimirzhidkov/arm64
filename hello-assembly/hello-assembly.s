.global _start

_start:	mov	X0, #1
	ldr	X1, =message
	mov	X2, #16 
	mov	X8, #64 // write to file system call
	svc	0

	mov	X0, #0
	mov	X8, #93 // terminate system call.
	svc	0

.data
message:	.ascii "Hello assembly!\n"
