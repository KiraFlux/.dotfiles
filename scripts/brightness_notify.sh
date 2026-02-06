#!/bin/bash
case "$1" in
    "up") brightnessctl set +10% ;;
    "down") brightnessctl set 10%- ;;
esac

current=$(brightnessctl get)
max=$(brightnessctl max)
percentage=$((current * 100 / max))
notify-send -t 1000 -i '' "ярк: $percentage%"