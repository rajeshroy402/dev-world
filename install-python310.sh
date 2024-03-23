#!/bin/bash

# Update package index
sudo apt update

# Install prerequisites
sudo apt install software-properties-common

# Add deadsnakes PPA
sudo add-apt-repository ppa:deadsnakes/ppa

# Install Python 3.10
sudo apt install python3.10

# Install Python 3.10 venv
sudo apt install python3.10-venv

# Install additional dependencies
sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev curl libbz2-dev

# Download get-pip.py
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py

# Install pip for Python 3.10
python3.10 get-pip.py

# Add user binary directory to PATH
echo 'export PATH="$PATH:$HOME/.local/bin"' >> ~/.bashrc
source ~/.bashrc

# Verify Python 3.10 and pip installations
python3.10 --version
python3.10 -m pip --version

# Create symbolic link for python command
sudo rm /usr/bin/python
sudo ln -s /usr/bin/python3.10 /usr/bin/python

# Verify python and pip versions
python --version
pip --version
