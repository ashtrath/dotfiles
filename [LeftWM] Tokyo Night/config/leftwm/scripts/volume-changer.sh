#!/bin/sh

# Icons Variable
HIGH=/usr/share/icons/Papirus-Dark/symbolic/status/audio-volume-high-symbolic.svg
MEDIUM=/usr/share/icons/Papirus-Dark/symbolic/status/audio-volume-medium-symbolic.svg
LOW=/usr/share/icons/Papirus-Dark/symbolic/status/audio-volume-low-symbolic.svg
MUTED=/usr/share/icons/Papirus-Dark/symbolic/status/audio-volume-muted-symbolic.svg

function get_volume {
  amixer -D pulse get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

function is_mute {
  amixer -D pulse get Master | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null
}

function send_notification {
  volume=$(get_volume)

  bar=$(seq -s "─" $(($volume / 3 - 5)) | sed 's/[0-9]//g')
  if [ $volume -eq 0 ]; then
    dunstify -i $MUTED -r 2593 -u normal "Audio Muted!"
  elif [ $volume -lt 70 ]; then
    dunstify -i $MEDIUM -r 2593 -u normal "    $bar"
  elif [ $volume -eq 30 ]; then
    dunstify -i $LOW -r 2593 -u normal "    $bar"
  else
    dunstify -i $HIGH -r 2593 -u normal "    $bar"
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
    dunstify -i $MUTED -r 2593 -u normal "Audio Muted!"
  else
    send_notification
  fi
  ;;
esac
