.PHONY: run build clean

run: hello
	@./hello

hello: hello.go
	go build -o $@ hello.go

clean:
	rm -f hello
