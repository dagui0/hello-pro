BIN_DIR   = bin
BUILD_DIR = build
SRC_DIR   = .

-include local.setup.mk

.PHONY: run clean hello

run: hello

clean:
	rm -rf $(BIN_DIR) $(BUILD_DIR)

$(BIN_DIR)/%: $(SRC_DIR)/%.pl
	@perl $<

hello: $(BIN_DIR)/hello
