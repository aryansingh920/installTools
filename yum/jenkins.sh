#!/bin/bash

# Update the system
yum update -y

# Install Java (if not already installed)
yum install java-1.8.0-openjdk -y

# Add Jenkins repository and import the GPG key
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

# Install Jenkins
yum install jenkins -y

# Start and enable Jenkins service
systemctl start jenkins
systemctl enable jenkins

# Add Jenkins to the bashrc file for all users
echo 'export JENKINS_HOME=/var/lib/jenkins' >> /etc/profile
echo 'export PATH=$PATH:$JENKINS_HOME' >> /etc/profile

# Reload the bashrc for all users
source /etc/profile

echo "Jenkins has been installed and added to the bashrc."
