BIN_DIR   = bin
BUILD_DIR = build
SRC_DIR   = .

# To install the assembler locally, you need to install the gcc toolchain.
# On Debian-based systems, you can also run:
#
# sudo apt install build-essential
#
# To install x86 assembler on x86_64 system, install gcc toolchain and 32-bit libraries.
# On debian based systems, you can also run:
#
#   sudo dpkg --add-architecture i386
#	sudo apt update
#   sudo apt install gcc-multilib libc6:i386 libstdc++6:i386 build-essential
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
DOCKER_IMAGE	= dagui0/gcc-x86:latest
DOCKER_DAEMON_NAME= hello-pro-$(shell pwd | sed -e 's!^.*hello-pro/langs/!!' -e 's!/!-!g')
DOCKER_OPTS		= -e USER=$$(id -un) -e UID=$$(id -u) -e GID=$$(id -g) \
		-e LANG=$$LANG -v /etc/localtime:/etc/localtime:ro \
		-v `pwd`:/app -w /app $(DOCKER_IMAGE)
DOCKER_INSTANT	= docker run --rm -it $(DOCKER_OPTS)
DOCKER_DAEMON = docker exec -it $(DOCKER_DAEMON_NAME)
DOCKER_MODE	=
AS			= $(DOCKER_MODE) as
CC			= $(DOCKER_MODE) gcc
CXX			= $(DOCKER_MODE) g++
LD			= $(DOCKER_MODE) ld

-include local.mk

.PHONY: run clean docker-daemon docker-clean \
		hello
.SECONDARY:

run: hello

clean:
	rm -rf $(BIN_DIR) $(BUILD_DIR)

$(BIN_DIR):
	mkdir -p $@
$(BUILD_DIR):
	mkdir -p $@

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.s | $(BUILD_DIR)
	$(CC) $(ASFLAGS) -m32 -c -o $@ $<

$(BIN_DIR)/%: $(BUILD_DIR)/%.o | $(BIN_DIR)
	$(CC) $(LDFLAGS) -m32 -nostdlib -no-pie -o $@ $<

docker-daemon:
	if [ $$(docker ps -a -f name=$(DOCKER_DAEMON_NAME) -q | wc -l) -eq 0 ]; then \
	    docker run -d --name $(DOCKER_DAEMON_NAME) $(DOCKER_OPTS); \
	fi

docker-clean:
	if [ $$(docker ps -a -f name=$(DOCKER_DAEMON_NAME) -q | wc -l) -eq 1 ]; then \
	    docker stop -t0 $(DOCKER_DAEMON_NAME); \
	    docker rm -f $(DOCKER_DAEMON_NAME); \
	fi

hello: $(BIN_DIR)/hello
	@$<
