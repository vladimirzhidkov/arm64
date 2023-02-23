#-*- Makefile -*-

ifdef DEBUG
	DEBUGFLAGS = -g 
	EXEC = a.out
else
	DEBUGFLAGS =
	EXEC = upper.out
endif

OBJS = upper.o

$(EXEC): $(OBJS) 
	ld -o $(EXEC) $(OBJS) 

# implicit rules (pattern rules)
# @ = name of the current target
# < = name of dependency
%.o: %.s
	as $(DEBUGFLAGS) -o $@ $< 

clean:
	rm -f *.out *.o
	ls -la    
