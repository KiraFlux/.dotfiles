#!/bin/bash
case "$1" in
    "up")   amixer -q set PCM 10+ && amixer -q set Master 5+ ;;
    "down") amixer -q set PCM 10- && amixer -q set Master 5- ;;
    "toggle") amixer -q set Master toggle ;;
esac

volume=$(amixer get Master | grep -oP '\d+%' | head -1 | tr -d '%')
muted=$(amixer get Master | grep -oP '\[(off)\]')

if [[ "$muted" == "[off]" ]]; then
    notify-send -t 1000 -i '' "vol: muted"
else
    notify-send -t 1000 -i '' "vol: ${volume}%"
fi

killall -SIGUSR1 i3status 2>/dev/null