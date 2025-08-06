# ROS2 Docker Environment

Ubuntu + ROS2 Humble development environment with GUI support.

## Usage

```bash
# Navigate to docker_ws directory
cd docker_ws

# Start containers
docker compose up

# Access container
docker exec -it ros2_docker zsh

# GUI access (RViz, etc.)
http://localhost:8080/vnc.html
```

## Features

- Ubuntu with ROS2 Humble
- Development tools (vim, git, cmake, python)
- Oh My Zsh shell  
- GUI via noVNC
- Volume mounted to Programming/ directory


