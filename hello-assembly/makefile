#-*- Makefile -*-
ifdef DEBUG
	DEBUGFLAGS = 
else
	DEBUGFLAGS = -g
endif

EXEC = hello-assembly.out
OBJS = hello-assembly.o

$(EXEC): $(OBJS) 
	ld -o $(EXEC) $(OBJS) 

# implicit rules (pattern rules)
# @ = name of the current target
# < = name of dependency
%.o: %.s
	as $(DEBUGFLAGS) -o $@ $< 

clean:
	rm -f $(EXEC) *.o 
	ls -l

run:
	./$(EXEC)

