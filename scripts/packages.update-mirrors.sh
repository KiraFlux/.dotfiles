#!/bin/bash

set -e

# root check
if [[ $EUID -ne 0 ]]; then
    echo "error: launch with sudo: sudo $0"
    exit 1
fi

echo "Mirrors list update..."

cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup.$(date +%Y%m%d_%H%M%S) 2>/dev/null || true

echo "Looking for fastest mirrors (Russia)..."
reflector \
    --country "Russia" \
    --protocol https,http \
    --latest 30 \
    --sort rate \
    --age 24 \
    --fastest 10 \
    --save /etc/pacman.d/mirrorlist 2>/dev/null || {
    echo "warn: reflector did not work well, using alternative (curl)..."
    curl -s "https://archlinux.org/mirrorlist/?country=RU&protocol=https&protocol=http&ip_version=4&use_mirror_status=on" |
        sed 's/^#Server/Server/' > /etc/pacman.d/mirrorlist.tmp &&
    mv /etc/pacman.d/mirrorlist.tmp /etc/pacman.d/mirrorlist
}

echo "Mirrors update successfully"
echo "Top-5:"
grep "^Server" /etc/pacman.d/mirrorlist | head -5