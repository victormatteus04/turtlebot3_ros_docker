FROM osrf/ros:noetic-desktop-full 

RUN apt update && apt install -y \
    nano \
    git \
    python3-pip \
    python3-rosdep \
    python3-rosinstall \
    python3-rosinstall-generator \
    python3-wstool \
    build-essential \
    ros-noetic-rqt* \
    ros-noetic-turtlebot3* \
    ros-noetic-gmapping \
    ros-noetic-move-base* \
    ros-noetic-dwa-local-planner \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root/

RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc