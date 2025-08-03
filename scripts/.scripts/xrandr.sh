#!/run/current-system/sw/bin/bash
# all three monitors as seperate
# xrandr --auto && xrandr --output DP-4 --primary --auto --output DP-5 --right-of DP-4 --left-of eDP-1 --auto

# only laptop screen
# xrandr --auto && xrandr --output eDP-1 --primary --output DP-4 --off --output DP-5 --off

# print device name and full EDID
# xrandr --prop | grep -A8 -B1 EDID

# for monitor in $(xrandr --prop | grep " connected" | awk '{print $1}'); do
#     echo $monitor
# done

monitors=($(xrandr --prop | grep "connected" | awk '{print $1}'))

left=${monitors[-2]}
right=${monitors[-1]}
laptop=${monitors[0]}
#declare -p monitors

# echo $left $right $laptop

# fixes "ghost" monitors from the dock being unplugged without disabling monitors
xrandr --auto

case "$1" in
    "dock2")
        # only dock monitors
        xrandr --output $left --primary --auto --output $right --right-of $left --auto --output $laptop --off ;;
    "dock3")
        # all three monitors as seperate
        xrandr --output $left --primary --auto --output $right --right-of $left --auto --output $laptop --auto --right-of $right ;;
    *)
        # only laptop screen
        xrandr --output $left --off --output $right --off --output $laptop --auto --primary ;;
esac
