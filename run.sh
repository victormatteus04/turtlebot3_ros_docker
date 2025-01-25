#!/bin/bash

# Allow local connections to the X server for GUI applications in Docker
xhost +local:

# Setup for X11 forwarding to enable GUI
XAUTH=/tmp/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

IMAGE_NAME=ros-noetic-turtlebot3:latest

# Prompt for the host folder to mount in the container
# echo "Enter the full path of the folder to mount in the container:"

HOST_FOLDER_PATH="$(pwd)"

# Define the container's folder path where the host folder will be mounted
CONTAINER_FOLDER_PATH="/root/shared_folder/"

# Run the Docker container with the selected image and configurations for GUI applications
docker run -it \
  --rm \
  --name=turtlebot3_container \
  --user=root \
  --privileged \
  --network=host \
  --env="DISPLAY=$DISPLAY" \
  --env="QT_X11_NO_MITSHM=1" \
  --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
  --env="XAUTHORITY=$XAUTH" \
  --volume="$XAUTH:$XAUTH" \
  -v "/dev:/dev" \
  -v "$HOST_FOLDER_PATH/shared_folder:$CONTAINER_FOLDER_PATH" \
  -v "$HOST_FOLDER_PATH/ros_packages:/root/catkin_ws/src" \
  $IMAGE_NAME

# Notes:
# - The script assumes a certain level of trust with the containers being run, especially with options like --privileged and X11 forwarding.
# - Consider enhancing security measures and validating input paths for better safety in production environments.
