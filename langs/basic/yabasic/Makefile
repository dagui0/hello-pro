BIN_DIR   = bin
BUILD_DIR = build
SRC_DIR   = .

# To install yabasic interpreter locally, follow instructions at https://www.yabasic.de/
# On debian based systems, you can also run:
#   sudo apt install yabasic
BASIC     = yabasic

# To run BASIC using Docker, you must first build your own Docker image.
#
# make docker-build              # Create a Docker image
#
# Create `local.mk` and add the following lines:
#
# BASIC = docker run --rm -it \
#     -e USER=$$(id -un) -e UID=$$(id -u) -e GID=$$(id -g) \
#     -e LANG=$$LANG -v /etc/localtime:/etc/localtime:ro \
#     -v `pwd`:/app -w /app $(DOCKER_IMAGE) yabasic
#
# If you're interested in the BASIC language and plan to run it multiple times, daemon mode is recommended.
# To run BASIC using Docker in daemon mode, add the following lines to `local.mk`:
#
# BASIC = docker exec -it $(DOCKER_DAEMON) yabasic
#
# When running BASIC in Docker daemon mode, ensure that the container is running.
#
# make docker-daemon             # Start the container in daemon mode.
#
DOCKER_IMAGE  = hellopro/yabasic:latest
DOCKER_DAEMON = yabasic-daemon

-include local.mk

.PHONY: run clean docker-build docker-daemon docker-clean \
		hello truth truth-sp

run: hello

clean:
	rm -rf $(BIN_DIR) $(BUILD_DIR)

$(BIN_DIR)/%: $(SRC_DIR)/%.bas
	@$(BASIC) $<

docker-build: .docker.img-id
.docker.img-id:
	docker images -q $(DOCKER_IMAGE) >.docker.img-id; \
	if [ $$(cat .docker.img-id | wc -l) -eq 0 ]; then \
	    rm -f .docker.img-id; \
	    docker build -t $(DOCKER_IMAGE) -f docker/Dockerfile docker && \
		docker images -q $(DOCKER_IMAGE) >.docker.img-id; \
	fi

docker-daemon: .docker.img-id
	if [ $$(docker ps -a -f name=$(DOCKER_DAEMON) -q | wc -l) -eq 0 ]; then \
	  docker run -d --name $(DOCKER_DAEMON) \
	    -e UID=$$(id -u) \
	    -e GID=$$(id -g) \
		-e USER=$$(id -un) \
	    -e LANG=$$LANG \
	    -v /etc/localtime:/etc/localtime:ro \
	    -v `pwd`:/app \
	    -w /app \
	    $(DOCKER_IMAGE); \
	fi

docker-clean:
	if [ $$(docker ps -a -f name=$(DOCKER_DAEMON) -q | wc -l) -eq 1 ]; then \
		docker stop -t 3 $(DOCKER_DAEMON); \
	    docker rm -f $(DOCKER_DAEMON); \
	fi; \
	if [ -f .docker.img-id ]; then \
	    docker rmi `cat .docker.img-id`; \
		rm -f .docker.img-id; \
	fi

hello: $(BIN_DIR)/hello

truth: $(BIN_DIR)/truth

truth-sp: $(BIN_DIR)/truth-sp
