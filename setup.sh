#!/bin/bash

echo "dotfiles setup..."

# installing packages
sudo pacman -S --needed --noconfirm $(cat pkglist.txt)
yay -S --needed --noconfirm $(cat pkglist-aur.txt)

# Bash rc
cp ./.bashrc ~/

# Configs
cp -r config/* ~/.config/

# Scripts
mkdir -p ~/bin
cp scripts/* ~/bin
chmod +x ~/bin

# Dirs
mkdir -p ~/Repos
mkdir -p ~/Images/Screenshots/

echo "Done! (Reload i3: Super+Shift+R)"
