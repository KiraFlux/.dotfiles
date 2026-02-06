#!/bin/bash

echo "System setup..."

# installing packages
sudo pacman -S --needed $(cat pkglist.txt)
yay -S --needed $(cat pkglist-yay.txt)

# Configs
cp -r config/* ~/.config/

# Scripts
mkdir ~/bin
cp scripts/* ~/bin
chmod +x ~/bin

# Bash rc
cp .bachrc ~/

echo "Done!"
echo "Reload i3: 'Super+Shift+R'
