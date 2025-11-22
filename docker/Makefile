IMAGE_REPO    = docker.io/dagui0
DATESTAMP     = $(shell date +%Y%m%d)
LINUX_PLATFORMS = linux/amd64,linux/arm64,linux/arm/v7

-include local.mk

.PHONY: help yabasic gcc-x86

help:
	@echo "Available targets:"
	@echo "  yabasic        - Build and push yabasic Docker image"
	@echo "  gcc-x86        - Build and push gcc-x86 Docker image"

yabasic: build/yabasic
gcc-x86: build/gcc-x86

build/gcc-x86: gcc-x86/Dockerfile gcc-x86/entrypoint.sh
	image_name=$$(basename $@); \
	docker buildx build	--builder crossbuilder \
	--platform "linux/386" \
	-t $(IMAGE_REPO)/$$image_name:$(DATESTAMP) \
	-t $(IMAGE_REPO)/$$image_name:latest \
	-f $$image_name/Dockerfile \
	--push $$image_name && \
	mkdir -p build && touch $@

build/yabasic: yabasic/Dockerfile yabasic/entrypoint.sh
	image_name=$$(basename $@); \
	docker buildx build	--builder crossbuilder \
	--platform "$(LINUX_PLATFORMS)" \
	-t $(IMAGE_REPO)/$$image_name:$(DATESTAMP) \
	-t $(IMAGE_REPO)/$$image_name:latest \
	-f $$image_name/Dockerfile \
	--push $$image_name && \
	mkdir -p build && touch $@
