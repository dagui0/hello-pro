BIN_DIR   = bin
BUILD_DIR = build
SRC_DIR   = .

# To install the C compiler locally, you need to install the gcc toolchain.
# On Debian-based systems, you can also run:
#
# sudo apt install build-essential
#
# To run using Docker instant mode, create `local.mk` and add the following line:
#
# DOCKER_MODE = $(DOCKER_INSTANT)
#
# If you're interested in this language and plan to run it multiple times, daemon mode is recommended.
# To run Docker in daemon mode, add the following line to `local.mk`:
#
# DOCKER_MODE = $(DOCKER_DAEMON)
#
# If you're using Docker daemon mode, ensure the container is running.
#
# make docker-daemon # Start the container in daemon mode.
#
# To remove the Docker daemon container, run:
#
# make docker-clean # Stop and remove the container.
#
DOCKER_IMAGE	= gcc:latest
DOCKER_DAEMON_NAME= hello-pro-$(shell pwd | sed -e 's!^.*hello-pro/langs/!!' -e 's!/!-!g')
DOCKER_OPTS		= -e USER=$$(id -un) -e UID=$$(id -u) -e GID=$$(id -g) \
		-e LANG=$$LANG -v /etc/localtime:/etc/localtime:ro \
		-v `pwd`:/app -w /app $(DOCKER_IMAGE)
DOCKER_INSTANT	= docker run --rm -it $(DOCKER_OPTS)
DOCKER_DAEMON = docker exec -it -u $$(id -u):$$(id -g) $(DOCKER_DAEMON_NAME)
DOCKER_MODE	=
AS			= $(DOCKER_MODE) as
CC			= $(DOCKER_MODE) gcc
CXX			= $(DOCKER_MODE) g++
LD			= $(DOCKER_MODE) ld

-include local.mk

.PHONY: run clean docker-daemon docker-clean \
		hello truth echo
.SECONDARY:

run: hello

clean:
	rm -rf $(BIN_DIR) $(BUILD_DIR)

$(BIN_DIR):
	mkdir -p $@
$(BUILD_DIR):
	mkdir -p $@

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c -o $@ $<

$(BIN_DIR)/%: $(BUILD_DIR)/%.o | $(BIN_DIR)
	$(CC) $(LDFLAGS) -o $@ $<

docker-daemon:
	if [ $$(docker ps -a -f name=$(DOCKER_DAEMON_NAME) -q | wc -l) -eq 0 ]; then \
	    docker run -d --name $(DOCKER_DAEMON_NAME) $(DOCKER_OPTS) sleep infinity; \
	fi

docker-clean:
	if [ $$(docker ps -a -f name=$(DOCKER_DAEMON_NAME) -q | wc -l) -eq 1 ]; then \
	    docker stop -t0 $(DOCKER_DAEMON_NAME); \
	    docker rm -f $(DOCKER_DAEMON_NAME); \
	fi

hello: $(BIN_DIR)/hello
	@$<

truth: $(BIN_DIR)/truth
	@$<

echo: $(BIN_DIR)/echo
	@echo -n "Enter arguments: "; \
	read args; \
	$< $$args
