#-*- Makefile -*-

EXEC = a.out
OBJS = playground.o 

$(EXEC): $(OBJS) 
	ld -o $(EXEC) $(OBJS) 

# implicit rules (pattern rules)
# @ = name of the current target
# < = name of dependency
%.o: %.s
	as -g -o $@ $< 

clean:
	rm -f *.out *.o 
	ls -l
