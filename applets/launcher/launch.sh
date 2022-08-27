#! /bin/bash
# launcher.sh - Rofi App Launcher, is a dmenu like graphical app launcher
# @author umutsevdi 
# @requires rofi
[ "$ROFI_APPLETS_PATH" = "" ] && ROFI_APPLETS_PATH=$HOME/.dotfiles/applets/
theme="config"
dir="${ROFI_APPLETS_PATH}/applets/launcher"
rofi -no-lazy-grab -show combi -combi-modi drun -theme $dir/"$theme" -show-combi
