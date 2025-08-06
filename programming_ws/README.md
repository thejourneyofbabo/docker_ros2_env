# Programming Workspace

This is your ROS2 development workspace. Create your ROS2 packages here.

## Setup

Inside the container:
```bash
cd /workspace/programming_ws
mkdir -p src
colcon build
source install/setup.zsh
```

## Create a Package

```bash
cd src
ros2 pkg create --build-type ament_python my_package
# or
ros2 pkg create --build-type ament_cmake my_package
```

## Build and Run

```bash
# Build all packages
colcon build

# Source the workspace
source install/setup.zsh

# Run your package
ros2 run my_package my_node
```
