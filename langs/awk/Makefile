BIN_DIR   = bin
BUILD_DIR = build
SRC_DIR   = .

-include local.mk

.PHONY: run clean hello truth

run: hello

clean:
	rm -rf $(BIN_DIR) $(BUILD_DIR)

$(BIN_DIR)/%: $(SRC_DIR)/%.awk
	@awk -f $<

hello: $(BIN_DIR)/hello

truth: $(BIN_DIR)/truth
