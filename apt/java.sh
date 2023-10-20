#!/bin/bash

# Update the package repository and install OpenJDK
sudo apt update
sudo apt install -y openjdk-11-jdk

# Set environment variables (adjust version as needed)
echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" >> ~/.bashrc
echo "export PATH=\$PATH:\$JAVA_HOME/bin" >> ~/.bashrc

# Apply changes to the current session
source ~/.bashrc

# Check Java version
java -version
