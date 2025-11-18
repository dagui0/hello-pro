BIN_DIR   = bin
BUILD_DIR = build
SRC_DIR   = .

-include local.setup.mk

.PHONY: run clean hello
.SECONDARY:

run: hello

clean:
	rm -rf $(BIN_DIR) $(BUILD_DIR)

$(BIN_DIR):
	mkdir -p $@
$(BUILD_DIR):
	mkdir -p $@

$(BIN_DIR)/%: $(SRC_DIR)/%.cbl | $(BIN_DIR)
	cobc -x -free -o $@ $<

hello: $(BIN_DIR)/hello
	@$<
