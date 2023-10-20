#!/bin/bash

# Check if the user is root or has sudo privileges
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root or with sudo." 
   exit 1
fi

# Install Nginx using apt
apt update
apt install nginx -y

# Check if Nginx installation was successful
if [ $? -eq 0 ]; then
    echo "Nginx has been successfully installed."
else
    echo "Nginx installation failed. Please check for errors."
    exit 1
fi

# Add Nginx to .bashrc
echo 'export PATH="$PATH:/usr/sbin"' >> ~/.bashrc
source ~/.bashrc

# Display a message indicating success
echo "Nginx has been added to your PATH in .bashrc."

# Start Nginx
systemctl start nginx

# Enable Nginx to start on boot
systemctl enable nginx

# Display a message indicating Nginx's status
systemctl status nginx
