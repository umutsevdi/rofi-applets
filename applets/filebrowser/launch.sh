#! /bin/bash
# launcher.sh - Rofi Filebrowser, is a dmenu like graphical filebrowser
# @author umutsevdi 
# @requires rofi

[ "$ROFI_APPLETS_PATH" = "" ] && ROFI_APPLETS_PATH=$HOME/.dotfiles/applets/
theme="config"
dir="${ROFI_APPLETS_PATH}/applets/filebrowser"
rofi -show filebrowser -theme $dir/"$theme"
