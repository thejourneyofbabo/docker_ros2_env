# ROS2 Docker Environment

Ready-to-use ROS2 Humble development environment with GUI support.

## Getting Started

1. **Start the environment**
   ```bash
   cd docker_ws
   docker compose up -d
   ```

## Stopping the Environment

### Stop containers (keeps environment)
If you started with `docker compose up` (without `-d`), you can stop with `Ctrl+C`.

To stop containers but keep them for later:
```bash
docker compose stop
```

To restart stopped containers:
```bash
docker compose start
```

### Stop and remove containers
To completely stop and remove containers (environment will be lost):
```bash
docker compose down
```

To also remove volumes:
```bash
docker compose down -v
```

2. **Access the container**
   ```bash
   docker exec -it ros2_docker zsh
   ```

3. **Open GUI applications**
   - Go to `http://localhost:8080/vnc.html` in your browser
   - Click "Connect"

## What's Included

- ROS2 Humble (Ubuntu base)
- RViz2, development tools (git, cmake, vim)
- Oh My Zsh shell
- GUI access via noVNC
- Your files mounted at `/workspace`

## Workspace Structure

- `docker_ws/` - Docker files
- `programming_ws/` - Your ROS2 projects go here

## Quick Test

Inside the container:
```bash
# Test ROS2
ros2 run demo_nodes_cpp talker

# In another terminal
ros2 run demo_nodes_py listener
```


