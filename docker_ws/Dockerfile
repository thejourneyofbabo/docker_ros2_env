# MIT License

# Copyright (c) 2025 Jisang Yun

FROM ros:humble

# Install system dependencies and ROS 2 packages
RUN apt-get update && apt-get install -y \
    curl \
    git \
    nano \
    vim \
    python3-pip \
    libeigen3-dev \
    tmux \
    ros-humble-rviz2 \
    libclang-dev \
    python3-vcstool \
    zsh \
    wget \
    fonts-powerline \
    cmake \
    ninja-build \
    gettext \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Setup zsh
RUN which zsh || { ln -s $(which zsh) /bin/zsh; }
RUN sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true

# Setup ROS environment
RUN echo "source /opt/ros/humble/setup.zsh" >> /root/.zshrc

# Install Python dependencies
RUN pip3 install \
    transforms3d \
    git+https://github.com/colcon/colcon-cargo.git \
    git+https://github.com/colcon/colcon-ros-cargo.git

# Set working directory
WORKDIR /workspace

SHELL ["/usr/bin/zsh", "-c"]
ENV SHELL=/usr/bin/zsh
ENTRYPOINT ["/usr/bin/zsh"]
