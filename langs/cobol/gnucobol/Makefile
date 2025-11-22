BIN_DIR   = bin
BUILD_DIR = build
SRC_DIR   = .

# To install the COBOL compiler locally, you need to install the gnucobol package along with the GCC toolchain.
# On Debian-based systems, you can also run:
#
# sudo apt install build-essential gnucobol
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
DOCKER_IMAGE	= dagui0/gnucobol:latest
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
COBC        = $(DOCKER_MODE) cobc
COBCRUN     = $(DOCKER_MODE) cobcrun

# If you compile a COBOL program using Docker,
# it's likely that you won't be able to run it on your local system because the shared libraries aren't available.
# Therefore, you'll also need to run the compiled program using Docker.
COBOL_RUN	= $(DOCKER_MODE)

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

$(BIN_DIR)/%: $(BUILD_DIR)/%.o | $(BIN_DIR)
	$(COBC) -x -o $@ $<

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cob | $(BUILD_DIR)
	$(COBC) -c -x -free -o $@ $<

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
	@$(COBOL_RUN) $<
