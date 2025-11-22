BIN_DIR   = bin
BUILD_DIR = build
SRC_DIR   = .

# To install go language locally, follow instructions at https://golang.org/doc/install
# On debian based systems, you can also run:
#   sudo apt install golang
GO        = go

# To run go language using Docker, create `local.mk` and add the following line:
#
# GO = docker run --rm -it \
#     -e USER=$$(id -un) -e UID=$$(id -u) -e GID=$$(id -g) \
#     -e LANG=$$LANG -v /etc/localtime:/etc/localtime:ro \
#     -v `pwd`:/app -w /app $(DOCKER_IMAGE) go
#
# If you're interested in the go language and plan to run it multiple times, daemon mode is recommended.
# To run go using Docker in daemon mode, add the following lines to `local.mk`:
#
# BASIC = docker exec -it $(DOCKER_DAEMON) go
#
# When running BASIC in Docker daemon mode, ensure that the container is running.
#
# make docker-daemon             # Start the container in daemon mode.
#
DOCKER_IMAGE  = golang:latest
DOCKER_DAEMON = golang-daemon

-include local.mk

.PHONY: run clean docker-daemon docker-clean \
		hello truth
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

docker-daemon:
	if [ $$(docker ps -a -f name=$(DOCKER_DAEMON) -q | wc -l) -eq 0 ]; then \
	  docker run -d --name $(DOCKER_DAEMON) \
	    -e UID=$$(id -u) \
	    -e GID=$$(id -g) \
		-e USER=$$(id -un) \
	    -e LANG=$$LANG \
	    -v /etc/localtime:/etc/localtime:ro \
	    -v `pwd`:/app \
	    -w /app \
	    $(DOCKER_IMAGE) \
		sleep infinity; \
	fi

docker-clean:
	if [ $$(docker ps -a -f name=$(DOCKER_DAEMON) -q | wc -l) -eq 1 ]; then \
		docker stop -t 3 $(DOCKER_DAEMON); \
	    docker rm -f $(DOCKER_DAEMON); \
	fi


hello: $(BIN_DIR)/hello
	@$<

 truth: $(BIN_DIR)/truth
	@$<
