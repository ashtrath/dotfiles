#!/usr/bin/env sh

maimselect="maim -s --noopengl --capturebackground --hidecursor"
maimfull="maim --noopengl --capturebackground --hidecursor"

notification() {
  dunstify -i "$tempfile" "Screenshot  " "Screenshot captured and copied to clipboard!"
}

case $1 in

  area)
    tempfile="/tmp/screenshot-$(date +%Y%m%d_%H%M%S).png"
    $maimselect -s "$tempfile" && xclip -selection c -t image/png < "$tempfile"

    # Check if users cancel the screenshot
    if [ ! -f "$tempfile" ]; then
      dunstify "Screenshot Failed 﫞 " "Screenshot are canceled by user"
      exit 0
    fi

    notification area &

    sleep 1
    rm "$tempfile"
    ;;

  full)
    tempfile="/tmp/screenshot-$(date +%Y%m%d_%H%M%S).png"
    $maimfull "$tempfile" && xclip -selection c -t image/png < "$tempfile"

    # Check if users cancel the screenshot
    if [ ! -f "$tempfile" ]; then
      dunstify "Screenshot Failed 﫞 " "Screenshot are canceled by user"
      exit 0
    fi

    notification full &

    sleep 1
    rm "$tempfile"
    ;;

esac
