exec = a.exe
sources = $(wildcard *.c)
objects = $(sources:.c=.o)


$(exec): $(objects)
	gcc $(objects) -o $(exec)

%.o: %.c %.h
	gcc -c $< -o $@

install:
	make

clean:
	-rm *.o a.exe
