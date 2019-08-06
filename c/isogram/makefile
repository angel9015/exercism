### If you wish to use extra libraries (math.h for instance),
### add their flags here (-lm in our case) in the "LIBS" variable.

LIBS = -lm

###
tests.exe: 
	@echo Compiling $@
	@$(CC) $(CFLAGS) src\*.c test/vendor/unity.c test/*.c $(LIBS)
