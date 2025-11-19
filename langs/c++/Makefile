BIN_DIR   = bin
BUILD_DIR = build
SRC_DIR   = .

-include local.mk

.PHONY: run clean hello truth
.SECONDARY:

run: hello

clean:
	rm -rf $(BIN_DIR) $(BUILD_DIR)

$(BIN_DIR):
	mkdir -p $@
$(BUILD_DIR):
	mkdir -p $@

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cxx | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c -o $@ $<

$(BIN_DIR)/%: $(BUILD_DIR)/%.o | $(BIN_DIR)
	$(CXX) $(LDFLAGS) -o $@ $<

hello: $(BIN_DIR)/hello
	@$<

truth: $(BIN_DIR)/truth
	@$<
