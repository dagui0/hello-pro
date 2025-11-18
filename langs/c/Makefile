BIN_DIR   = bin
BUILD_DIR = build
SRC_DIR   = .

-include local.setup.mk

.PHONY: run clean setup hello truth echo
.SECONDARY:

run: hello

clean:
	rm -rf bin build

$(BIN_DIR):
	mkdir -p $@
$(BUILD_DIR):
	mkdir -p $@

$(BUILD_DIR)/%.o: %.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c -o $@ $<

$(BIN_DIR)/%: $(BUILD_DIR)/%.o | $(BIN_DIR)
	$(CC) $(LDFLAGS) -o $@ $<

hello: $(BIN_DIR)/hello
	@$<

truth: $(BIN_DIR)/truth
	@$<

echo: $(BIN_DIR)/echo
	@echo -n "Enter arguments: "; \
	read args; \
	$< $$args
