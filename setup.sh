#!/bin/bash

echo "Setup dotfiles..."

# Bash rc
cp ./.bashrc ~/

# Configs
cp -r ./config/* ~/.config/

# Scripts
chmod +x ./scripts/*

# Dirs
mkdir -p ~/Repos
mkdir -p ~/Images/Screenshots/

echo "Done! (Reload i3: Super+Shift+R)"