#!/bin/bash

# Check if the user has root privileges
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

# Install Nginx using yum
yum install -y nginx

# Start Nginx and enable it to start on boot
systemctl start nginx
systemctl enable nginx

# Add Nginx to the bashrc
echo 'alias startnginx="systemctl start nginx"' >> ~/.bashrc
echo 'alias stopnginx="systemctl stop nginx"' >> ~/.bashrc
echo 'alias restartnginx="systemctl restart nginx"' >> ~/.bashrc
echo 'alias reloadnginx="systemctl reload nginx"' >> ~/.bashrc

# Reload the bashrc
source ~/.bashrc

# Provide installation status
echo "Nginx has been installed and added to the bashrc."
