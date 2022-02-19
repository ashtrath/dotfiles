#!/usr/bin/env sh
export LC_ALL='POSIX' LANG='POSIX'

# Icons Variable
DIR=$HOME/.config/dunst/icons/

get_volume() {
  amixer -D pulse get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

is_mute() {
  amixer -D pulse get Master | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null
}

send_notification() {
  volume=$(get_volume)

  bar=$(seq -s "─" 0 $((volume / 4)) | sed 's/[0-9]//g')
  if [ "$volume" -eq 0 ]; then
    dunstify -i "$DIR/volume-muted.svg" -r 2593 -u normal "Audio Muted!"
  elif [ "$volume" -lt 20 ]; then
    dunstify -i "$DIR/volume-low.svg" -r 2593 -u normal "    $bar"
  elif [ "$volume" -lt 70 ]; then
    dunstify -i "$DIR/volume-medium.svg" -r 2593 -u normal "    $bar"
  else
    dunstify -i "$DIR/volume-high.svg" -r 2593 -u normal "    $bar"
  fi
}

case $1 in
  up)
  amixer -D pulse set Master on > /dev/null
  amixer -D pulse sset Master 5%+ > /dev/null

  send_notification
  ;;
  down)
  amixer -D pulse set Master on > /dev/null
  amixer -D pulse sset Master 5%- > /dev/null

  send_notification
  ;;
  mute)
  amixer -D pulse set Master 1+ toggle > /dev/null

  if is_mute ; then
    dunstify -i "$DIR/volume-muted.svg" -r 2593 -u normal "Audio Muted!"
  else
    send_notification
  fi
  ;;
esac
