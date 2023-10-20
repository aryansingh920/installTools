#!/bin/bash

# Check if Docker is already installed
if command -v docker &>/dev/null; then
    echo "Docker is already installed."
else
    # Update the package index and install required dependencies
    sudo apt update
    sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

    # Add Docker GPG key and repository
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

    # Install Docker
    sudo apt update
    sudo apt install -y docker-ce

    # Add the current user to the docker group
    sudo usermod -aG docker $USER

    # Enable and start the Docker service
    sudo systemctl enable docker
    sudo systemctl start docker

    echo "Docker is now installed."

    # Add Docker environment variables to ~/.bashrc
    echo 'export DOCKER_HOST="unix:///var/run/docker.sock"' >> ~/.bashrc
    echo 'export DOCKER_CLI_AWS_LOG=0' >> ~/.bashrc
    echo 'export DOCKER_CERT_PATH="/etc/docker"' >> ~/.bashrc
    echo 'export DOCKER_TLS=auto' >> ~/.bashrc
    echo 'export DOCKER_TLS_VERIFY=1' >> ~/.bashrc
    echo 'export DOCKER_TLS_VERIFY=1' >> ~/.bashrc
    echo 'export DOCKER_TLS_VERIFY=1' >> ~/.bashrc
    echo 'export DOCKER_TLS_VERIFY=1' >> ~/.bashrc
    echo 'export DOCKER_TLS_VERIFY=1' >> ~/.bashrc
    echo 'export DOCKER_TLS_VERIFY=1' >> ~/.bashrc

    source ~/.bashrc
fi
