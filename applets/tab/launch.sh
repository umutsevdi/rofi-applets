#! /bin/bash
# launcher.sh - Rofi Tab Switcher, is a dmenu like graphical app that
# switches between actively running windows
# @author umutsevdi 
# @requires rofi

[ "$ROFI_APPLETS_PATH" = "" ] && ROFI_APPLETS_PATH=$HOME/.dotfiles/rofi-applets/
theme="config"
dir="${ROFI_APPLETS_PATH}/applets/tab"
rofi -show window  -theme $dir/"$theme" 
