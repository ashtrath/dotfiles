#!/usr/bin/env sh
export LC_ALL='POSIX' LANG='POSIX'

FILE="$HOME/.config/configs"
get_filepath() {
  awk '{ printf "%-40s %s\n", $1, $2 }' < "$FILE" \
    | rofi -dmenu -i -theme "$HOME/.config/rofi/theme/list" \
    | sed 's/^.*~//g'
}

configpath="$(get_filepath)"
if [ -n "$configpath" ]; then
  st nvim "$HOME/$configpath"
fi
