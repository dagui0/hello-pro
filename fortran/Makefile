.PHONY: all clean

all: hello
	@./hello

hello.o: hello.f90
	$(FC) -c -o $@ $<

hello: hello.o
	$(FC) -o $@ $<

clean:
	rm -f hello.o hello
