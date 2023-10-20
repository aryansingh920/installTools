#!/bin/bash

# Check if Go is already installed
if command -v go &>/dev/null; then
    echo "Go is already installed."
else
    # Install Go using yum
    sudo yum install -y golang

    # Check if the installation was successful
    if [ $? -eq 0 ]; then
        echo "Go has been successfully installed."
        
        # Add Go to the PATH and update .bashrc
        echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
        source ~/.bashrc
        echo "Go has been added to your PATH and .bashrc has been updated."

        # Verify the installation
        go version
    else
        echo "Failed to install Go. Please check your internet connection or package repository."
    fi
fi
