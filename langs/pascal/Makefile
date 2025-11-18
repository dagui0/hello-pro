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

$(BUILD_DIR)/%: $(SRC_DIR)/%.pas | $(BUILD_DIR)
	fpc -FE$(BUILD_DIR) -a $<

$(BIN_DIR)/%: $(BUILD_DIR)/% | $(BIN_DIR)
	cp $< $@

hello: $(BIN_DIR)/hello
	@$<
