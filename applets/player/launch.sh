#! /bin/bash
# player.sh - Rofi Music Player Applet
# @author umutsevdi 
# @requires playerctl

[ "$ROFI_APPLETS_PATH" = "" ] && ROFI_APPLETS_PATH=$HOME/.dotfiles/rofi-applets/
if ! command -v playerctl &> /dev/null; then
    echo playerctl was not found 
fi

rofi_cmd="rofi -theme ${ROFI_APPLETS_PATH}/applets/player/config.rasi"

# Playerctl data initialization
stat=`playerctl status -s`
artist=`playerctl metadata artist -s`
title=`playerctl metadata title -s`
title=${title:0:30}
current="$artist - $title"

i_stop="栗"
i_next="怜"
i_prev="玲"

if   [ "$stat" = "" ]; then
    exit
elif [ "$stat" = "Playing" ]; then
    play_pause=""
else
    play_pause="契"
fi

options="$i_prev\n$play_pause\n$i_next\n$i_stop"
current=${current:0:40}
chosen="`echo -e "$options" | $rofi_cmd -p "$current" -dmenu $active $urgent -selected-row 1`"

case $chosen in
    $i_prev)
        playerctl previous
    ;;
    $play_pause)
        playerctl play-pause
    ;;
    $i_stop)
        playerctl stop
    ;;
    $i_next)
        playerctl next
    ;;
esac
