BIN_DIR   = bin
BUILD_DIR = build
SRC_DIR   = .

# To install go language locally, follow instructions at https://golang.org/doc/install
# On debian based systems, you can also run:
#   sudo apt install golang
GO        = go

# To run go using Docker, create `local.mk` and add the following line:
#
# GO = docker run --rm -u $$UID:$$GID -v .:/app -w /app golang:latest go

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

$(BIN_DIR)/%: $(SRC_DIR)/%.go | $(BIN_DIR)
	$(GO) build -o $@ $<

hello: $(BIN_DIR)/hello
	@$<

 truth: $(BIN_DIR)/truth
	@$<
