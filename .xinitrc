#!/bin/sh

# merge in defaults and keymaps
sysresources=/etc/X11/xinit/.Xresources ; [ -f "$sysresources"  ] && xrdb -merge "$sysresources"
sysmodmap=/etc/X11/xinit/.Xmodmap       ; [ -f "$sysmodmap"     ] && xmodmap "$sysmodmap"
userresources="$HOME/.Xresources"       ; [ -f "$userresources" ] && xrdb -merge "$userresources"
usermodmap="$HOME/.config/Xmodmap"      ; [ -f "$usermodmap"    ] && xmodmap "$usermodmap"


# start any default scripts
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# set st as defaut terminal
export TERMINAL=st

# disable bell
xset -b

# key repeat rate
xset r rate 250 60

# disable dpms?
xset s off -dpms

# startup
clipmenud &
