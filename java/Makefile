PACKAGE_NAME = com.yidigun.hellopro
PACKAGE_DIR  = com/yidigun/hellopro

.PHONY: run clean

run: hello.jar
	@java -jar hello.jar

hello.jar: build/$(PACKAGE_DIR)/Hello.class
	(cd build; \
	mkdir -p META-INF && \
	echo "Main-Class: $(PACKAGE_NAME).Hello" \
	    >META-INF/MANIFEST.MF && \
	jar cfm ../hello.jar META-INF/MANIFEST.MF *)

build/$(PACKAGE_DIR)/Hello.class: $(PACKAGE_DIR)/Hello.java
	mkdir -p build && \
	javac -d build $$(find . -type f -name "*.java")

clean:
	rm -rf build hello.jar
