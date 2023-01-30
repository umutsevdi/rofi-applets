#! /bin/bash
# powermenu.sh - Rofi Powermenu
# @author umutsevdi 

[ "$ROFI_APPLETS_PATH" = "" ] && ROFI_APPLETS_PATH=$HOME/.dotfiles/rofi-applets/
dir="${ROFI_APPLETS_PATH}/applets/powermenu"
rofi_cmd="rofi -theme $dir/config.rasi"
uptime="`uptime -p | sed -e "s/up //g" | sed -e "s/hours/h/g" | sed -e  "s/hour/h/g" | sed -e "s/minutes/min/g"`"

shutdown=""
reboot="勒"
lock=""
sleep=⏾
logout=""

Lock() {
    if command -v cinnamon-screensaver-command &> /dev/null; then
        cinnamon-screensaver-command --activate
    elif command -v lockscreen &> /dev/null; then
        echo "cinnamon-screensaver doesn't exist, falling back to lockscreen" 1>&2
        lockscreen
    elif command -v i3lock &> /dev/null; then
        echo "lockscreen doesn't exist, falling back to i3lock" 1>&2
        i3lock
    else
        echo "no lockscreen tool was found, unlocking directly" 1>&2
    fi
}

options="$shutdown\n$reboot\n$lock\n$logout\n$sleep"

chosen="`echo -e "$options" | $rofi_cmd -p "$uptime" -dmenu -selected-row 1`"

echo $chosen
case $chosen in
    $shutdown)
        echo "shutting down"
        systemctl poweroff
    ;;
    $reboot)
        echo "rebooting"
        systemctl reboot
    ;;
    $lock)
        dunstctl set-paused true
        echo "locking"
        Lock
        [ `dunstctl is-paused` = true ] && dunstctl set-paused false
    ;;
    $sleep)
        echo "hibernate"
        dunstctl set-paused true
        playerctl pause
        (( `amixer get Master  | grep "\[on\]" | wc -l` > 0 )) && amixer set Master mute
        systemctl suspend
        Lock
        [ `dunstctl is-paused` = true ] && dunstctl set-paused false
        (( `amixer get Master  | grep "\[off\]" | wc -l` > 0 )) && amixer set Master unmute
    ;;
    $logout)
        echo "logout"
        i3-msg exit
        ;;
esac
