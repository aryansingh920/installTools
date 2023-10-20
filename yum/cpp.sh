#!/bin/bash

# Check if the user is running the script with sudo
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script with sudo or as the root user."
  exit 1
fi

# Install C/C++ development tools
echo "Installing C/C++ development tools..."
yum groupinstall "Development Tools" -y

# Add C/C++ compiler paths to the .bashrc file
echo "Adding C/C++ compiler paths to ~/.bashrc..."
echo 'export PATH=$PATH:/usr/bin' >> ~/.bashrc
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc

echo "C/C++ development tools installed and paths added to ~/.bashrc."

exit 0
