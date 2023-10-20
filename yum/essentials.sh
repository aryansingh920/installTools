#!/bin/bash

# Define a list of tools that can be installed using yum
yum_tools=("gcc" "make" "git" "curl" "wget" "httpd")

# Define a list of tools that need alternative installation methods
alternative_installation=("uvicorn" "nodemon" "typescript" "ts-node")

# Update the package repository and install the yum tools
sudo yum update
for tool in "${yum_tools[@]}"; do
    sudo yum install -y "$tool"
done

# Install alternative tools using pip or npm
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

# Add the yum tools to the ~/.bashrc file
for tool in "${yum_tools[@]}"; do
    echo "export PATH=\$PATH:/usr/bin/$tool" >> ~/.bashrc
done

# Reload the ~/.bashrc file
source ~/.bashrc

echo "Essential development tools have been installed and added to ~/.bashrc."
