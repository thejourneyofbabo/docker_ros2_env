# MIT License

# Copyright (c) 2025 Jisang Yun

FROM ros:humble

# Add ROS 2 APT repository
RUN apt-get update && apt-get install -y curl && \
    curl -sSL 'http://repo.ros2.org/repos.key' | apt-key add - && \
    sh -c 'echo "deb http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list' && \
    apt-get update

# Base dependencies
RUN apt-get update && apt-get install -y \
   git nano vim python3-pip libeigen3-dev tmux \
   ros-humble-rviz2 libclang-dev python3-vcstool \
   zsh curl wget fonts-powerline \
   cmake ninja-build gettext unzip \
   && rm -rf /var/lib/apt/lists/*

# Neovim installation
RUN git clone https://github.com/neovim/neovim && \
   cd neovim && \
   git checkout stable && \
   make CMAKE_BUILD_TYPE=RelWithDebInfo && \
   make install

# NvChad setup
RUN git clone https://github.com/NvChad/starter ~/.config/nvim

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN rustup default stable

# Setup zsh
RUN which zsh || { ln -s $(which zsh) /bin/zsh; }
RUN sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true

# Config
RUN echo "source /opt/ros/humble/setup.zsh" >> /root/.zshrc && \
   echo "export PATH=$PATH:/usr/bin/zsh:/root/.cargo/bin" >> /root/.zshrc && \
   echo 'source $HOME/.cargo/env' >> /root/.zshrc

# Dependencies
RUN pip3 install transforms3d \
   git+https://github.com/colcon/colcon-cargo.git \
   git+https://github.com/colcon/colcon-ros-cargo.git

# Set working directory
WORKDIR /ros2_ws

SHELL ["/usr/bin/zsh", "-c"]
ENV SHELL=/usr/bin/zsh
ENTRYPOINT ["/usr/bin/zsh"]
