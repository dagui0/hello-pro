.PHONY: run clean

run: hello
	@./hello

hello.o: hello.c
	$(CC) -c -o $@ $<

hello: hello.o
	$(CC) -o $@ $<

clean:
	rm -f hello.o hello
