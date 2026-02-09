#!/usr/bin/env bash

BG_COLOR="000000"           # Фон (чёрный)
RING_COLOR="ccccccff"       # Ярко-белое кольцо
INSIDE_COLOR="00000000"     # Полностью прозрачная внутренность круга
TIME_COLOR="ffffffff"       # Белый цвет времени
DATE_COLOR="ccccccff"       # Более яркий серый для даты

KEYHL_COLOR="9955ffff"      # ЯРКИЙ НЕОН-ФИОЛЕТОВЫЙ для ввода
BSHL_COLOR="ff6600ff"       # ЯРКИЙ ОРАНЖЕВО-КРАСНЫЙ для ошибок
RINGVER_COLOR="00ffffff"    # ЯРКИЙ ГОЛУБОЙ для кольца при проверке
RINGWRONG_COLOR="ff3300ff"  # Такой же оранжевый для кольца при ошибке
SEPARATOR_COLOR="ffffffff"  # Белые разделители

RADIUS=140                  # Большой радиус
RING_WIDTH=10               # Толстое кольцо

SCREEN_INFO=$(xdpyinfo | grep dimensions 2>/dev/null)
if [[ -n "$SCREEN_INFO" ]]; then
    SCREEN_WIDTH=$(echo "$SCREEN_INFO" | awk '{print $2}' | cut -dx -f1)
    SCREEN_HEIGHT=$(echo "$SCREEN_INFO" | awk '{print $2}' | cut -dx -f2)
else
    SCREEN_WIDTH=1920
    SCREEN_HEIGHT=1080
fi

CENTER_X=$((SCREEN_WIDTH / 2))
CENTER_Y=$((SCREEN_HEIGHT / 2))

TIME_POS="${CENTER_X}:$((CENTER_Y + 20))"
DATE_POS="${CENTER_X}:$((SCREEN_HEIGHT - 50))"

i3lock --nofork \
    --color="${BG_COLOR}" \
    --ignore-empty-password \
    --show-failed-attempts \
    --indicator \
    --clock \
    --time-str="%H:%M" \
    --date-str="%A, %d %B" \
    --verif-text="..." \
    --wrong-text="✗" \
    --noinput-text="" \
    --radius="${RADIUS}" \
    --ring-width="${RING_WIDTH}" \
    --time-size=64 \
    --date-size=24 \
    --time-font="Fira Code, monospace" \
    --date-font="Fira Code, monospace" \
    --time-color="${TIME_COLOR}" \
    --date-color="${DATE_COLOR}" \
    --inside-color="${INSIDE_COLOR}" \
    --ring-color="${RING_COLOR}" \
    --insidever-color="${INSIDE_COLOR}" \
    --ringver-color="${RINGVER_COLOR}" \
    --insidewrong-color="${INSIDE_COLOR}" \
    --ringwrong-color="${RINGWRONG_COLOR}" \
    --keyhl-color="${KEYHL_COLOR}" \
    --bshl-color="${BSHL_COLOR}" \
    --separator-color="${SEPARATOR_COLOR}" \
    --line-uses-ring \
    --ind-pos="${CENTER_X}:${CENTER_Y}" \
    --time-pos="${TIME_POS}" \
    --date-pos="${DATE_POS}" \
    --no-modkey-text \
    --refresh-rate=0.8 \
    --composite

sleep 0.2
xsetroot -cursor_name left_ptr 2>/dev/null || true