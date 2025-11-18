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

$(BUILD_DIR)/%.o: %.s | $(BUILD_DIR)
	$(CC) $(ASFLAGS) -m32 -c -o $@ $<

$(BIN_DIR)/%: $(BUILD_DIR)/%.o | $(BIN_DIR)
	$(CC) $(LDFLAGS) -m32 -nostdlib -no-pie -o $@ $<

hello: $(BIN_DIR)/hello
	@$<
