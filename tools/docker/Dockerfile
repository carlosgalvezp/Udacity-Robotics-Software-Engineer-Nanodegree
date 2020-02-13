FROM nvidia/opengl:1.0-glvnd-runtime-ubuntu18.04

# Install basics
RUN apt-get update && \
    apt-get install --assume-yes --no-install-recommends \
        apt-utils \
        build-essential \
        cmake \
        gnupg2 \
        lsb-release \
        wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install gazebo
RUN echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > \
    /etc/apt/sources.list.d/gazebo-stable.list && \
    wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add - && \
    apt-get update && \
    DEBIAN_FRONTEND="noninteractive" \
    apt-get install --assume-yes --no-install-recommends \
        gazebo11 \
        libgazebo11-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
