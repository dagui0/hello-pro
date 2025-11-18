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

$(BUILD_DIR)/%.o: %.cxx | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c -o $@ $<

$(BIN_DIR)/%: $(BUILD_DIR)/%.o | $(BIN_DIR)
	$(CXX) $(LDFLAGS) -o $@ $<

hello: $(BIN_DIR)/hello
	@$<
