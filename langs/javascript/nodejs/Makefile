BIN_DIR   = bin
BUILD_DIR = build
SRC_DIR   = .

# To run javascript programs, you only need to install Node.js.
# On Debian-based systems, you can also run:
#
# sudo apt install nodejs
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
DOCKER_IMAGE	= node:alpine
DOCKER_DAEMON_NAME= hello-pro-$(shell pwd | sed -e 's!^.*hello-pro/langs/!!' -e 's!/!-!g' -e 's/\+/x/g')
DOCKER_OPTS		= -e USER=$$(id -un) -e UID=$$(id -u) -e GID=$$(id -g) \
		-e LANG=$$LANG -v /etc/localtime:/etc/localtime:ro \
		-v `pwd`:/app -w /app $(DOCKER_IMAGE)
DOCKER_INSTANT	= docker run --rm -it $(DOCKER_OPTS)
DOCKER_DAEMON = docker exec -it -u $$(id -u):$$(id -g) $(DOCKER_DAEMON_NAME)
DOCKER_MODE	=
NODE			= $(DOCKER_MODE) node

-include local.mk

.PHONY: run clean docker-daemon docker-clean \
		hello

run: hello

clean:
	rm -rf $(BIN_DIR) $(BUILD_DIR)

$(BIN_DIR)/%: $(SRC_DIR)/%.js
	@$(NODE) $<

docker-daemon:
	if [ $$(docker ps -a -f name=$(DOCKER_DAEMON_NAME) -q | wc -l) -eq 0 ]; then \
	    docker run -d --name $(DOCKER_DAEMON_NAME) --hostname $(DOCKER_DAEMON_NAME) \
	    --restart=unless-stopped $(DOCKER_OPTS) \
	    sleep infinity; \
	fi

docker-clean:
	if [ $$(docker ps -a -f name=$(DOCKER_DAEMON_NAME) -q | wc -l) -eq 1 ]; then \
	    docker stop -t0 $(DOCKER_DAEMON_NAME); \
	    docker rm -f $(DOCKER_DAEMON_NAME); \
	fi

hello: $(BIN_DIR)/hello
