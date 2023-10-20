#!/bin/bash

# Check for root privileges
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root or with sudo."
    exit 1
fi

# Install OpenJDK (adjust the package name as needed)
yum install java-11-openjdk-devel -y

# Check if the installation was successful
if [ $? -eq 0 ]; then
    echo "Java has been successfully installed."
else
    echo "Java installation failed. Please check your system configuration and try again."
    exit 1
fi

# Add Java to the PATH and set it in bashrc
JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")

echo "export JAVA_HOME=$JAVA_HOME" >> ~/.bashrc
echo 'export PATH=$PATH:$JAVA_HOME/bin' >> ~/.bashrc

# Reload the .bashrc file to apply changes immediately
source ~/.bashrc

echo "Java is now added to your PATH and set in your .bashrc file."
