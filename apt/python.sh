#!/bin/bash

# Update system packages
sudo apt update

# Install Python 3
sudo apt install -y python3

# Install Pip for Python 3
sudo apt install -y python3-pip

# Add Python and Pip to the .bashrc file
echo 'export PATH="$PATH:/usr/bin/python3:/usr/local/bin:/usr/bin/pip3"' >> ~/.bashrc

# Source the .bashrc file to apply changes immediately
source ~/.bashrc

# Verify Python and Pip installation
python3 --version
pip3 --version

echo 'alias python=python3' >> ~/.bashrc
echo 'alias pip=pip3' >> ~/.bashrc

python --version
pip --version

echo "Python and Pip installed and added to .bashrc."
