.PHONY: run clean

run: hello
	@./hello

hello.o: hello.s
	$(CC) -m32 -c -o $@ $<

hello: hello.o
	$(CC) -m32 -o $@ $< -nostdlib -no-pie

clean:
	rm -f hello.o hello
