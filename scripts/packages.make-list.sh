echo "Updating package list..."

pacman -Qqen > ../pkglist.txt
pacman -Qqem > ../pkglist-aur.txt

echo "Done!"