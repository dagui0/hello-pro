BIN_DIR   = bin
BUILD_DIR = build
SRC_DIR   = .

-include local.setup.mk

.PHONY: run clean hello
.SECONDARY:

run: hello

clean:
	rm -rf bin build

$(BIN_DIR):
	mkdir -p $@
$(BUILD_DIR):
	mkdir -p $@

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.s | $(BUILD_DIR)
	$(AS) $(ASFLAGS) -o $@ $<

$(BIN_DIR)/%: $(BUILD_DIR)/%.o | $(BIN_DIR)
	$(LD) $(LDFLAGS) -o $@ $<

hello: $(BIN_DIR)/hello
	@$<
