#!/bin/bash

# installing packages
sudo pacman -S --needed --noconfirm $(cat pkglist.txt)
yay -S --needed --noconfirm $(cat pkglist-aur.txt)

echo "dotfiles setup..."

# Bash rc
cp ./.bashrc ~/

# Configs
cp -r ./config/* ~/.config/

# Scripts
chmod +x ./scripts

# Dirs
mkdir -p ~/Repos
mkdir -p ~/Images/Screenshots/

echo "Done! (Reload i3: Super+Shift+R)"
