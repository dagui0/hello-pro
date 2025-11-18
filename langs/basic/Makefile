BIN_DIR   = bin
BUILD_DIR = build
SRC_DIR   = .

-include local.setup.mk

.PHONY: run clean hello truth truth-sp

run: hello

clean:
	rm -rf $(BIN_DIR) $(BUILD_DIR)

$(BIN_DIR)/%: $(SRC_DIR)/%.bas
	@yabasic $<

hello: $(BIN_DIR)/hello

truth: $(BIN_DIR)/truth

truth-sp: $(BIN_DIR)/truth-sp
