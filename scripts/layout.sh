#!/bin/bash

CURRENT_LAYOUT=$(setxkbmap -query | grep layout | awk '{print $2}' | cut -d',' -f1)

if [ "$CURRENT_LAYOUT" = "us" ]; then
    NEXT_LAYOUT="ru"
else
    NEXT_LAYOUT="us"
fi

setxkbmap -layout "$NEXT_LAYOUT"
notify-send -t 800 -i '' "layout: $NEXT_LAYOUT"