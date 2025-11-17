.PHONY: run build clean

run:
	go run hello.go

build: hello
hello:
	go build -o $@ hello.go
	./hello

clean:
	rm -f hello
