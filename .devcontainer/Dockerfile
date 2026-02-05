FROM ubuntu:22.04

SHELL ["/bin/bash", "-c"]

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Ensure all package sources are up to date
RUN apt-get update && \
    apt-get install -y --no-install-recommends eatmydata &&\
    eatmydata apt-get upgrade -y

# Install sudo first (to ensure correct configuration)
RUN apt-get install -y sudo && apt-get install -f && dpkg --configure -a

# Install essential tools
RUN eatmydata apt-get install -y --no-install-recommends locales && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 LANGUAGE=en_US.UTF-8

# Set the default locale for all shells
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# Install required Yocto dependencies
# Basic tools for package management & general system utilities
RUN eatmydata apt-get install -y --no-install-recommends \
    apt-utils \
    wget curl file rsync \
    xz-utils zstd lz4 liblz4-tool \
    tmux screen \
    debianutils \
    iputils-ping \
    nano mc \
    fuse3 sshfs \
    repo

# Development tools
RUN eatmydata apt-get install -y --no-install-recommends \
    git-core \
    diffstat \
    unzip \
    texinfo \
    chrpath \
    socat \
    nmap \
    cpio

# Documentation
RUN eatmydata apt-get install -y --no-install-recommends \
    doxygen graphviz \
    figlet

# Build systems & compilers
RUN eatmydata apt-get install -y --no-install-recommends \
    build-essential \
    gcc-multilib \
    cmake ninja-build \
    ccache

# Python environment
RUN eatmydata apt-get install -y --no-install-recommends \
    python3 python3-pip \
    python3-pexpect \
    python3-git python3-jinja2 \
    python3-cryptography \
    python3-pyelftools \
    python3-dev python3-setuptools \
    pylint

# Yocto-specific dependencies
RUN eatmydata apt-get install -y --no-install-recommends \
    gawk \
    libsystemd-dev \
    bmap-tools

# Development libraries for graphics & UI
RUN eatmydata apt-get install -y --no-install-recommends \
    libegl1-mesa \
    libsdl1.2-dev \
    xterm

RUN rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/*

# Make python3 executable as python
RUN [ ! -e /usr/local/bin/python ] && ln -s /usr/bin/python3 /usr/local/bin/python

ARG UID=1000
ARG GID=1000

RUN groupadd -g ${GID} yocto && \
    useradd -m -u ${UID} -g ${GID} -s /bin/bash yocto && \
    echo "yocto ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# RUN mkdir -p /home/yocto/.cache && chown -R yocto:yocto /home/yocto/.cache

RUN echo "alias ll='ls -alhF --color=auto'" >> /etc/bash.bashrc

USER yocto
WORKDIR /home/yocto
ENV HOME=/home/yocto

# Start a shell to keep the container interactive after startup
CMD ["/bin/bash"]
