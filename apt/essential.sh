#!/bin/bash

# Define a list of tools that can be installed using apt
apt_tools=("gcc" "make" "git" "curl" "wget" "apache")

# Define a list of tools that need alternative installation methods
alternative_installation=("uvicorn" "nodemon" "typescript" "ts-node")

# Update the package repository and install the apt tools
sudo apt update
for tool in "${apt_tools[@]}"; do
    sudo apt install -y "$tool"
done

# Install alternative tools using npm or other methods
for tool in "${alternative_installation[@]}"; do
    case "$tool" in
        "uvicorn")
            pip3 install uvicorn
            ;;

        "nodemon")
            npm install -g nodemon
            ;;

        "typescript")
            npm install -g typescript
            ;;

        "ts-node")
            npm install -g ts-node
            ;;
    esac
done

# Add the apt tools to the ~/.bashrc file
for tool in "${apt_tools[@]}"; do
    echo "export PATH=\$PATH:/usr/bin/$tool" >> ~/.bashrc
done

# Reload the ~/.bashrc file
source ~/.bashrc

echo "Essential development tools have been installed and added to ~/.bashrc."
