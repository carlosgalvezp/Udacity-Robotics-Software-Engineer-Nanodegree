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
# First, fix for librealsense
# https://github.com/IntelRealSense/librealsense/issues/4781
RUN apt-get update && \
    apt-get install --assume-yes --no-install-recommends \
        binutils \
        cpp \
        cpp-5 \
        dkms \
        fakeroot \
        gcc \
        gcc-5 \
        kmod \
        libasan2 \
        libatomic1 \
        libc-dev-bin \
        libc6-dev \
        libcc1-0 \
        libcilkrts5 \
        libfakeroot \
        libgcc-5-dev \
        libgmp10 \
        libgomp1 \
        libisl15 \
        libitm1 \
        liblsan0 \
        libmpc3 \
        libmpfr4 \
        libmpx0 \
        libquadmath0 \
        libssl-dev \
        libssl-doc \
        libtsan0 \
        libubsan0 \
        libusb-1.0-0 \
        libusb-1.0-0-dev \
        libusb-1.0-doc \
        linux-headers-4.4.0-159 \
        linux-headers-4.4.0-159-generic \
        linux-headers-generic \
        linux-libc-dev \
        make \
        manpages \
        manpages-dev \
        menu \
        patch \
        zlib1g-dev && \
    apt-get install --assume-yes --no-install-recommends \
        libssl-dev \
        libssl-doc \
        libusb-1.0-0 \
        libusb-1.0-0-dev \
        libusb-1.0-doc \
        linux-headers-4.4.0-159 \
        linux-headers-4.4.0-159-generic \
        linux-headers-generic \
        zlib1g-dev && \
    apt-get download ros-kinetic-librealsense && \
    dpkg-deb -R ros-kinetic-librealsense*.deb ros-rslib/ && \
    wget https://gist.githubusercontent.com/dizz/404ef259a15e1410d692792da0c27a47/raw/3769e80a051b5f2ce2a08d4ee6f79c766724f495/postinst && \
    chmod +x postinst && \
    cp postinst ros-rslib/DEBIAN && \
    dpkg-deb -b ./ros-rslib/ ros-kinetic-librealsense_1.12.1-0xenial-20190830_icrlab_amd64.deb && \
    dpkg -i ros-kinetic-librealsense_1.12.1-0xenial-20190830_icrlab_amd64.deb && \
    apt-mark hold ros-kinetic-librealsense && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Finally, install required packages
RUN apt-get update && \
    apt-get install --assume-yes --no-install-recommends \
        ros-${ROS_VERSION}-gmapping \
        ros-${ROS_VERSION}-turtlebot-teleop \
        ros-${ROS_VERSION}-turtlebot-rviz-launchers \
        ros-${ROS_VERSION}-turtlebot-gazebo \
        xterm  && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
