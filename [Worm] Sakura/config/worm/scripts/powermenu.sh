#!/usr/bin/env sh
export LC_ALL='POSIX' LANG='POSIX'

rofi_command="rofi -theme $HOME/.config/rofi/theme/powermenu"
uptime=$(uptime -p | sed -e 's/up //g')

# Options
shutdown=""
reboot=""
lock=""
suspend=""
logout=""

# Confirmation Dialog
confirmation() {
  printf "yes\nno" | rofi -dmenu -selected-row 1 -no-fixed-num-lines -theme "$HOME/.config/rofi/theme/confirm.rasi"
}

# Notification
notify() {
  dunstctl close
  dunstify -t "$1" -u critical "$2" "$3"
}

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

action="$(printf "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 2)"
case $action in

  "$shutdown")
    choice=$(confirmation &)

    case $choice in
      yes)
        notify 2800 "$shutdown Shutting down" "Powering off your computer in 3 seconds."
        sleep 3
        systemctl poweroff
        dunstctl close-all
        ;;

      no) exit 0 ;;
    esac
    ;;

  "$reboot")
    choice=$(confirmation &)

    case $choice in
      yes)
        notify 2800 "$reboot Rebooting" "Rebooting your computer in 3 seconds."
        sleep 3
        systemctl reboot
        dunstctl close-all
        ;;

      no) exit 0 ;;
    esac
    ;;

  "$lock")
    notify 800 "$lock Locking" "Screenlocking your computer."
    sleep 1
    if [ -x "$(command -v betterlockscreen)" ]; then
      betterlockscreen -l dim
    elif [ -x "$(command -v i3lock)" ]; then
      i3lock
    else
      notify 2800 "$lock Locking" "Failed to lock your computer, please make sure you have i3lock or betterlockscreen installed."
    fi
    ;;

  "$suspend")
    choice=$(confirmation &)

    case $choice in
      yes) 
        mpc -q pause
        amixer set Master mute
        notify 2800 "$suspend Suspending" "Your computer will go to sleep in 3 seconds"
        sleep 3

        systemctl suspend
        betterlockscreen -l dim
        dunstctl close-all
        ;;

      no) exit 0 ;;
    esac
    ;;

  "$logout")
  choice=$(confirmation &)

    case $choice in
      yes)
        notify 2800 "$logout Logging out" "Logging out from current session in 3 seconds"
        sleep 3

        case $DESKTOP_SESSION in
          Openbox|openbox) openbox --exit ;;
          bspwm) bspc quit ;;
          i3) i3-msg exit ;;
          *) pkill -u "${USER}" ;;
        esac
        ;;

      no) exit 0 ;;
    esac
esac

exit ${?}
