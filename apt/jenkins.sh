#!/bin/bash

# Check if the script is being run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root (use sudo)."
    exit 1
fi

# Update the package list and install Java and wget
apt update
apt install -y openjdk-11-jdk wget

# Add Jenkins repository key and repository to apt
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add -
sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Install Jenkins
apt update
apt install -y jenkins

# Enable and start Jenkins service
systemctl enable jenkins
systemctl start jenkins

# Add Jenkins to the bashrc (if not already added)
if ! grep -q "export JENKINS_HOME" ~/.bashrc; then
    echo 'export JENKINS_HOME=/var/lib/jenkins' >> ~/.bashrc
fi

echo "Jenkins has been installed and added to your ~/.bashrc file."

# Display the initial admin password
echo "Initial Admin Password: $(cat /var/lib/jenkins/secrets/initialAdminPassword)"

# You can manually source your ~/.bashrc or start a new terminal for changes to take effect
