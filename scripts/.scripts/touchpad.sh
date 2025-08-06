
# CHOSEN=$(printf "Enable Touchpad\nDisable Touchpad" | rofi -dmenu -i)
# 
# case "$CHOSEN" in
#     "Enable Touchpad")
#         xinput enable 12
#         xinput enable 13
#         ;;
#     "Disable Touchpad")
#         xinput disable 12
#         xinput disable 13
#         ;;
#     *)
#         exit 1
#         ;;
# esac

ENABLED=$(xinput list-props 12 | grep 170 | awk -F: '{ print $2 }')

if [ $ENABLED = 1 ]; then
    xdotool mousemove 0 0
    xinput disable 12
    xinput disable 13
else
    xdotool mousemove 960 540
    xinput enable 12
    xinput enable 13
fi
