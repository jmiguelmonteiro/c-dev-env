# Use an official Ubuntu base image
FROM ubuntu:22.04

# Prevent some warnings during build
ENV DEBIAN_FRONTEND=noninteractive

# Install build essentials, Valgrind, GDB, and other useful tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        clang \
        gdb \
        valgrind \
        cmake \
        git \
        vim \
        curl \
	python3-pip \
        python3.10-venv && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*	

RUN python3 -m pip install --upgrade pip setuptools && \
    python3 -m pip install norminette

RUN bash -c "$(curl -fsSL https://raw.github.com/xicodomingues/francinette/master/bin/install.sh)"

# Set working directory
WORKDIR /app

# Entry point (optional)
CMD ["/bin/bash"]

