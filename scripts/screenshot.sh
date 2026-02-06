#!/bin/bash
# Основной скрипт скриншотов
SCREENSHOT_DIR="$HOME/Images/Screenshots"

# Функция для получения имени окна
get_window_name() {
    xdotool getwindowfocus getwindowname 2>/dev/null | \
    sed 's/[\/:*?"<>|]/_/g' | \
    cut -c 1-50  # Ограничиваем длину имени
}

# Функция для формирования имени файла
generate_filename() {
    local timestamp=$(date "+%Y.%m.%d-%H.%M.%S")
    local appname=$(get_window_name)
    echo "${timestamp}${appname:+-${appname}}.png"
}

case "$1" in
    "active")
        # Снимок активного окна
        maim -i $(xdotool getactivewindow) | xclip -selection clipboard -t image/png
        if [[ "$2" == "save" ]]; then
            maim -i $(xdotool getactivewindow) "$SCREENSHOT_DIR/$(generate_filename)"
        fi
        ;;
    "full")
        # Снимок всего экрана
        maim | xclip -selection clipboard -t image/png
        if [[ "$2" == "save" ]]; then
            maim "$SCREENSHOT_DIR/$(generate_filename)"
        fi
        ;;
    "area")
        # Выбор области
        maim -s | xclip -selection clipboard -t image/png
        if [[ "$2" == "save" ]]; then
            maim -s "$SCREENSHOT_DIR/$(generate_filename)"
        fi
        ;;
    *)
        echo "Использование: $0 {active|full|area} [save]"
        exit 1
        ;;
esac

notify-send -t 1000 -i "Скриншот сделан" "Сохранён в буфер${2:+ и в файл}"