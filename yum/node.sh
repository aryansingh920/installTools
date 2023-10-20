#!/bin/bash

# Check if NVM is already installed
if [ -d "$HOME/.nvm" ]; then
  echo "NVM is already installed. Skipping installation."
else
  # Install NVM
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

  # Load NVM
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

  # Add NVM initialization to ~/.bashrc
  echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc
  echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc
fi

# Source .bashrc to load NVM for this session
source ~/.bashrc

# Check if a Node version was provided as an argument
if [ -z "$1" ]; then
  echo "Please provide the Node.js version you want to install."
  exit 1
fi

# Install the specified Node.js version using NVM
nvm install "$1"

# Set the installed Node.js version as the default
nvm alias default "$1"

# Display Node.js and npm versions
node -v
npm -v

# Confirm successful installation
echo "Node.js and npm have been installed and set as default."
