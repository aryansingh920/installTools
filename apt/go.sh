#!/bin/bash

# Check if Go is already installed
if go version &>/dev/null; then
  echo "Go is already installed."
else
  # Update the package list and install Go
  sudo apt update
  sudo apt install -y golang-go

  # Add Go binary directory to PATH and update .bashrc
  if [ -d "/usr/local/go/bin" ]; then
    echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
    source ~/.bashrc
  else
    echo "Go binary directory not found. Installation may have failed."
    exit 1
  fi

  # Check if Go is installed successfully
  if go version &>/dev/null; then
    echo "Go is successfully installed."
  else
    echo "Go installation failed. Please check the installation process."
  fi
fi
