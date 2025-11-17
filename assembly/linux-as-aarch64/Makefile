.PHONY: all clean

all: hello
	@./hello

hello.o: hello.s
	$(AS) -o $@ $<

hello: hello.o
	$(LD) -o $@ $<

clean:
	rm -f hello.o hello
