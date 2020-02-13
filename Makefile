
SHELL := /bin/bash

define run_docker
	docker run --rm -it -u $$(id -u):$$(id -g) -v $$(pwd):$$(pwd) -w $$(pwd) \
				-e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:rw --gpus=all \
				-e HOME=$$(pwd) \
				carlosgalvezp/robotics_nd:latest $(1)
endef

.PHONY: build-docker
build-docker:
	docker build --file tools/docker/Dockerfile --tag carlosgalvezp/robotics_nd:latest .

.PHONY: gazebo
gazebo:
	$(call run_docker, gazebo)
