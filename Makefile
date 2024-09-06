CURRENT_DIR := $(shell pwd)
IMAGE_NAME = gdrive-downloader
CONTAINER_NAME = gdrive
CONFIGS = $(CURRENT_DIR)/configs
DATADIR = $(CURRENT_DIR)/data

build:
	@echo "Building Docker image..."
	docker build -t $(IMAGE_NAME) .
	docker images

run:
	@echo "Running Docker container:"
	docker run -d --name $(CONTAINER_NAME) -v $(DATADIR):/data -v $(CONFIGS):/configs $(IMAGE_NAME)
	docker ps -a

bash:
	@echo "Running Docker container: bash shell"
	docker run -it -v $(DATADIR):/data -v $(CONFIGS):/configs $(IMAGE_NAME) /bin/bash

stop:
	@echo "Stopping Docker ..."
	docker stop $(CONTAINER_NAME) || true

start:
	@echo "Starting Docker ..."
	docker start $(CONTAINER_NAME) || true

kill:
	@echo "Killing Docker container..."
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true

killall:
	@echo "Killing Docker images and container..."
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true
	docker rmi -f $(IMAGE_NAME) || true

logs:
	@echo "Showing logs from Docker container..."
	docker logs -f $(CONTAINER_NAME)

clean: killall

rebuild: killall build
