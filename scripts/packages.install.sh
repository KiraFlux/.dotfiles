#!/bin/bash

echo "installing packages..."

sudo pacman -Syu --needed --noconfirm $(cat "../pkglist.txt")
yay -Syu --needed --noconfirm $(cat "../pkglist-aur.txt")

echo "Done!"