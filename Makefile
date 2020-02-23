
SHELL := /bin/bash

define run_docker
	docker run --rm -it -u $$(id -u):$$(id -g) -v $$(pwd):$$(pwd) -w $$(pwd) \
				-e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:rw --gpus=all \
				-e HOME=$$(pwd)/.gazebo_home \
				-e GAZEBO_PLUGIN_PATH=$$(pwd)/build \
				carlosgalvezp/robotics_nd:latest $(1)
endef

.PHONY: build-docker
build-docker:
	docker build --tag carlosgalvezp/robotics_nd:latest tools/docker

.PHONY: gazebo
gazebo:
	$(call run_docker, gazebo)

.PHONY: project-1
project-1:
	$(call run_docker, gazebo RSEND_Gazebo_Build_My_World/world/world)
