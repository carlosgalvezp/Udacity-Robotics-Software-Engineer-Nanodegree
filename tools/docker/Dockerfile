FROM nvidia/opengl:1.1-glvnd-runtime-ubuntu16.04

# Install basics
RUN apt-get update && \
    apt-get install --assume-yes --no-install-recommends \
        apt-utils \
        build-essential \
        cmake \
        curl \
        gnupg2 \
        locales \
        lsb-release \
        wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install gazebo
RUN echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > \
    /etc/apt/sources.list.d/gazebo-stable.list && \
    wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add - && \
    apt-get update && \
    apt-get install --assume-yes --no-install-recommends \
        gazebo7 \
        libgazebo7-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN locale-gen en_US.utf8 && \
    update-locale

# Install ROS
ARG ROS_VERSION="kinetic"
RUN echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > \
    /etc/apt/sources.list.d/ros-latest.list && \
    curl -sSL \
    'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | \
    apt-key add - && \
    apt-get update && \
    apt-get install --assume-yes --no-install-recommends \
        ros-${ROS_VERSION}-desktop-full && \
    apt-get install --assume-yes --no-install-recommends \
        python-rosinstall \
        python-rosinstall-generator \
        python-wstool \
        build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN rosdep init && \
    rosdep update

# Install dependencies needed for P3
RUN apt-get update && \
    apt-get install --assume-yes --no-install-recommends \
        libignition-math2-dev \
        protobuf-compiler \
        ros-${ROS_VERSION}-navigation \
        ros-${ROS_VERSION}-map-server \
        ros-${ROS_VERSION}-move-base \
        ros-${ROS_VERSION}-amcl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install dependencies needed for P4
RUN apt-get update && \
    apt-get install --assume-yes --no-install-recommends \
        ros-${ROS_VERSION}-teleop-twist-keyboard \
        ros-${ROS_VERSION}-rtabmap-ros && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install dependencies needed for P5
RUN apt-get update && \
    apt-get upgrade --assume-yes && \
    apt-get install --assume-yes --no-install-recommends \
        ros-${ROS_VERSION}-gmapping \
        ros-${ROS_VERSION}-joy \
        xterm  && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
