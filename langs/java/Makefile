BIN_DIR   = bin
BUILD_DIR = build
SRC_DIR   = .

-include local.mk

_SOURCES = $(wildcard $(SRC_DIR)/*.java)

.PHONY: run clean hello truth echo
.SECONDARY:

run: hello

clean:
	rm -rf $(BIN_DIR) $(BUILD_DIR)

$(BIN_DIR):
	mkdir -p $@
$(BUILD_DIR):
	mkdir -p $@

$(BIN_DIR)/hello.jar: $(_SOURCES) | $(BIN_DIR) $(BUILD_DIR)
	javac -d $(BUILD_DIR) $(_SOURCES) && \
	(cd $(BUILD_DIR); jar cf hello.jar *) && \
	mv $(BUILD_DIR)/hello.jar $(BIN_DIR)/hello.jar

$(BIN_DIR)/%: $(BIN_DIR)/hello.jar
	@java -cp $< `echo $@ | sed -e 's!^$(BIN_DIR)/!!'`

hello: $(BIN_DIR)/Hello

quine: $(BIN_DIR)/Quine

truth: $(BIN_DIR)/Truth
