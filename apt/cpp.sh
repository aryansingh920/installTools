#!/bin/bash

# Check if the user has sudo privileges
if [ "$(id -u)" != "0" ]; then
    echo "Please run this script with sudo or as root."
    exit 1
fi

# Install C and C++ development tools using apt
apt update
apt install build-essential

# Check if the installation was successful
if [ $? -eq 0 ]; then
    echo "C and C++ development tools (GCC) have been successfully installed."

    # Add GCC to the bashrc (if not already added)
    if ! grep -q "export PATH=\"\$PATH:/usr/bin\"" ~/.bashrc; then
        echo 'export PATH="$PATH:/usr/bin"' >> ~/.bashrc
        echo "The PATH variable has been updated in your ~/.bashrc file."
        echo "You may need to restart your terminal or run 'source ~/.bashrc' for the changes to take effect."
    else
        echo "GCC is already in your PATH."
    fi
else
    echo "Installation failed. Please check your internet connection or package manager configuration."
    exit 1
fi
