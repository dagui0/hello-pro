.PHONY: all clean

all: hello
	@./hello

hello.o: hello.cxx
	$(CXX) -c -o $@ $<

hello: hello.o
	$(CXX) -o $@ $<

clean:
	rm -f hello.o hello
