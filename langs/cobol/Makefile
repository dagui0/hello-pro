.PHONY: run clean

run: hello
	@./hello

hello: hello.cbl
	cobc -x -free hello.cbl

clean:
	rm -f hello
