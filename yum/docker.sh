#!/bin/bash

# Check if Docker is already installed
if command -v docker &> /dev/null; then
    echo "Docker is already installed."
else
    # Install Docker using yum
    sudo yum install -y docker

    # Start and enable the Docker service
    sudo systemctl start docker
    sudo systemctl enable docker

    # Add the user to the docker group (to run Docker without sudo)
    sudo usermod -aG docker $USER

    # Reload the user's group membership
    newgrp docker

    # Add Docker to the bashrc
    if ! grep -q "docker" ~/.bashrc; then
        echo 'alias docker="sudo docker"' >> ~/.bashrc
        echo 'alias docker-compose="sudo docker-compose"' >> ~/.bashrc
    fi

    echo "Docker has been installed and added to your ~/.bashrc."
fi
