#!/bin/bash

# Check if Python is already installed
if command -v python3 &>/dev/null; then
    echo "Python is already installed."
else
    # Install Python using Yum
    sudo yum -y install python3
    echo "Python installed successfully."
fi

# Check if Pip is already installed
if command -v pip &>/dev/null; then
    echo "Pip is already installed."
else
    # Install Pip
    sudo yum -y install python3-pip
    echo "Pip installed successfully."
fi

# Add Python installation path to ~/.bashrc
if ! grep -q 'export PATH=$PATH:/usr/bin' ~/.bashrc; then
    echo 'export PATH=$PATH:/usr/bin' >> ~/.bashrc
    source ~/.bashrc
    echo "Python path added to ~/.bashrc."
else
    echo "Python path is already added to ~/.bashrc."
fi
