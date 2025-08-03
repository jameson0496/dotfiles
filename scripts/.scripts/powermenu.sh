#!/bin/sh

# Power menu script using tofi

CHOSEN=$(printf "Suspend\nReboot\nShutdown\nLock" | rofi -dmenu -i)
# CHOSEN=$(printf "Suspend\nReboot\nShutdown\nLock" | rofi -dmenu -i -theme-str '@import "glue_pro_blue.rasi"')

case "$CHOSEN" in
	"Suspend") systemctl suspend ;;
	"Lock") i3lock-fancy ;;
	"Reboot") reboot ;;
	"Shutdown") poweroff ;;
	*) exit 1 ;;
esac   
