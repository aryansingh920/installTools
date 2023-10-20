#!/bin/bash

# Check if NVM is already installed
if [ ! -d "$HOME/.nvm" ]; then
  # Install NVM
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
fi

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Check if NVM is sourced in the current shell
if [ -z "$NVM_DIR" ]; then
  echo "NVM was not loaded. Please restart your terminal or run 'source ~/.bashrc' to continue."
  exit 1
fi

# Input the Node.js version to be installed
read -p "Enter the Node.js version to install (e.g., 14.17.4): " node_version

# Install the specified Node.js version
nvm install "$node_version"

# Set the installed Node.js version as the default
nvm alias default "$node_version"

# Add NVM initialization to your ~/.bashrc
echo "export NVM_DIR=\"$HOME/.nvm\"" >> ~/.bashrc
echo "[ -s \"\$NVM_DIR/nvm.sh\" ] && \\. \"\$NVM_DIR/nvm.sh\"" >> ~/.bashrc

# Load NVM for the current session
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Source the updated .bashrc to make the changes take effect in the current terminal
source ~/.bashrc

# Verify the Node.js installation
node -v
npm -v

echo "Node.js $node_version has been installed and set as the default version."
