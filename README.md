# TurtleBot Tutorial Repository with ROS in Docker

This repository provides a tutorial on setting up and using TurtleBot simulations in a Docker environment with ROS Noetic. Below, you will find detailed instructions to install Docker, build the Docker image, run the container, and perform the TurtleBot simulation tutorials.

---

## Repository Structure

```plaintext
.
├── docker
│   └── Dockerfile
├── README.md
├── ros_packages
│   └── my_package
│       ├── CMakeLists.txt
│       └── package.xml
├── run.sh
└── shared_folder
```

- **docker/Dockerfile**: Contains the instructions for creating the ROS Noetic Docker image.
- **ros_packages/**: Directory for ROS packages. Here, you will create and manage your training packages.
- **run.sh**: Script to launch the Docker container with proper configurations.
- **shared_folder/**: Directory for sharing files between the host and the container.

---

## Prerequisites: Installing Docker

Before proceeding, ensure Docker is installed on your system.

### Installation Steps

#### Ubuntu
1. **Update package index**:
   ```bash
   sudo apt update
   ```

2. **Install prerequisites**:
   ```bash
   sudo apt install -y \
       apt-transport-https \
       ca-certificates \
       curl \
       software-properties-common
   ```

3. **Add Docker’s official GPG key**:
   ```bash
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
   ```

4. **Set up the stable repository**:
   ```bash
   echo \
   "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   ```

5. **Install Docker**:
   ```bash
   sudo apt update
   sudo apt install -y docker-ce docker-ce-cli containerd.io
   ```

6. **Verify installation**:
   ```bash
   docker --version
   ```

#### For other platforms:
Visit the [official Docker documentation](https://docs.docker.com/get-docker/).

---

## Building the Docker Image

1. Navigate to the `docker` directory:
   ```bash
   cd docker
   ```

2. Build the Docker image:
   ```bash
   docker build -t ros-noetic-turtlebot3:latest .
   ```

---

## Running the Docker Container

1. Ensure you are in the root directory of the repository:
   ```bash
   cd path/to/your/repository
   ```

2. Make the `run.sh` script executable:
   ```bash
   chmod +x run.sh
   ```

3. Run the container:
   ```bash
   ./run.sh
   ```

The container will:
- Share the `shared_folder` directory between the host and the container.
- Mount the `ros_packages` directory to `/root/catkin_ws/src` in the container.
- Set up X11 forwarding to enable GUI-based ROS tools.

---

## TurtleBot Simulation Tutorials

Follow the official TurtleBot3 simulation tutorials to perform the tasks described. The tutorials are available at:

- [TurtleBot3 Simulation Manual](https://emanual.robotis.com/docs/en/platform/turtlebot3/simulation/)
- Subsections include:
  - Gazebo simulation setup.
  - Navigation and SLAM tutorials.
  - Customizing TurtleBot behavior.

### Steps to Begin

1. Launch Gazebo simulation in the container:
   ```bash
   export TURTLEBOT3_MODEL=burger
   roslaunch turtlebot3_gazebo turtlebot3_world.launch
   ```

2. Follow the tutorials on SLAM, navigation, and more as per the [TurtleBot3 e-Manual](https://emanual.robotis.com/docs/en/platform/turtlebot3/simulation/).

---

## References

- [Docker Documentation](https://docs.docker.com/)
- [ROS Noetic Documentation](http://wiki.ros.org/noetic)
- [TurtleBot3 GitHub Repository](https://github.com/ROBOTIS-GIT/turtlebot3?tab=readme-ov-file)
- [TurtleBot3 e-Manual](https://emanual.robotis.com/docs/en/platform/turtlebot3/)

---