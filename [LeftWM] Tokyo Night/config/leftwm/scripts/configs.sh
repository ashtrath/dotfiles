#!/usr/bin/env sh
export LANG="POSIX"
FILE="$HOME/.config/configs"

get_filepath() {
  awk '{ printf "%-40s %s\n", $1, $2 }' < "$FILE" \
    | rofi -dmenu -i -theme ~/.config/rofi/theme/list \
    | sed 's/^.*~//g'
}

CONF_PATH="$(get_filepath)"
if [ -n "$CONF_PATH" ]; then
  xdg-open "$HOME/$CONF_PATH"
fi
