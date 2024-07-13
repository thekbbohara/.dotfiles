#!/usr/bin/bash

set -e
set -u

# \n\Uf0019  Switchuser
option=$(echo -e "\Uf033e  Lockscreen\n\Uf04b2  Suspend\n\Uf02ca  Hibernate\n\Uf0709  Reboot\n\Uf0425  Shutdown\n\Uf0343  Logout" | rofi -dmenu -config $HOME/.config/rofi/powermenu.rasi)

selected=$(echo "$option" | awk '{print $2}' )

echo $selected

case "$selected" in
    "Lockscreen")
      loginctl lock-session
      ;;
    "Logout")
        pkill -KILL -u $USER
        ;;
    "Reboot")
        systemctl reboot
        ;;
    "Shutdown")
        systemctl poweroff
        ;;
    "Suspend")
        systemctl suspend
        ;;
    "Hibernate")
      systemctl hibernate
      ;;
esac
