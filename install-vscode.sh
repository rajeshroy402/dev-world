#!/bin/bash

# Get system architecture
ARCH=$(dpkg --print-architecture)

# Import the Microsoft GPG key
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

# Enable the Visual Studio Code repository
if [ "$ARCH" = "amd64" ]; then
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
elif [ "$ARCH" = "arm64" ] || [ "$ARCH" = "armhf" ]; then
    sudo add-apt-repository "deb [arch=$ARCH] https://packages.microsoft.com/repos/vscode stable main"
else
    echo "Unsupported architecture: $ARCH"
    exit 1
fi

# Update package lists
sudo apt update

# Check if Visual Studio Code is already installed
if ! dpkg -s code >/dev/null 2>&1; then
    # Install Visual Studio Code if not installed
    sudo apt install code -y
    echo "Visual Studio Code has been installed successfully!"
else
    echo "Visual Studio Code is already installed."
fi