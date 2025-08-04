#!/bin/sh

CHOSEN=$(printf "Suspend\nReboot\nShutdown\nLock" | rofi -dmenu -i)

case "$CHOSEN" in
	"Suspend") pkill picom & systemctl suspend && sleep 2 && picom & ;;
	"Lock") i3lock-fancy ;;
	"Reboot") reboot ;;
	"Shutdown") poweroff ;;
	*) exit 1 ;;
esac   
