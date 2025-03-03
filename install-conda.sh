#!/usr/bin/env bash
#
# Bash script to remove old Miniconda references, install fresh Miniconda,
# initialize conda for bash, and verify that conda works.
#
# Usage: 
#   1) chmod +x fix_conda.sh
#   2) ./fix_conda.sh
#

set -e  # Exit immediately if a command exits with a non-zero status

echo "=============================="
echo " 1. Removing old Miniconda..."
echo "=============================="
rm -rf ~/miniconda3
rm -rf ~/.conda ~/.condarc ~/.continuum

echo
echo "=============================================="
echo " 2. Downloading latest Miniconda (Linux 64-bit)"
echo "=============================================="
wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh

echo
echo "======================================"
echo " 3. Installing Miniconda silently..."
echo "======================================"
bash /tmp/miniconda.sh -b -p "$HOME/miniconda3"

# Clean up the installer
rm /tmp/miniconda.sh

echo
echo "=========================================="
echo " 4. Initializing conda for Bash shell..."
echo "=========================================="
# Initialize conda for bash
"$HOME/miniconda3/bin/conda" init bash

echo
echo "========================================"
echo " 5. Reloading your ~/.bashrc settings..."
echo "========================================"
# Reload .bashrc so this shell session has conda
source ~/.bashrc

echo
echo "=================================="
echo " 6. Checking 'conda --version'..."
echo "=================================="
conda --version

echo
echo "============================================="
echo " All done! 'conda' should now be on your PATH"
echo " Try:  conda activate base"
echo "============================================="
