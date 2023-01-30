#! /bin/bash
# emoji.sh - Global Emoji Selection 
# @author umutsevdi 
# @requires xclip 

[ "$ROFI_APPLETS_PATH" = "" ] && ROFI_APPLETS_PATH=$HOME/.dotfiles/rofi-applets/
if ! command -v xclip &> /dev/null; then
    echo xclip was not found 
fi

rofi_cmd="rofi -theme ${ROFI_APPLETS_PATH}/applets/emoji/config.rasi"

# The famous "get a menu of emojis to copy" script.

# Get user selection via dmenu from emoji file.
chosen=`cut -d ';' -f1 ${ROFI_APPLETS_PATH}/applets/emoji/.emoji/list | $rofi_cmd -p -dmenu | sed "s/ .*//"`

# Exit if none chosen.
[ -z "$chosen" ] && exit

# If you run this command with an argument, it will automatically insert the
# character. Otherwise, show a message that the emoji has been copied.
if [ -n "$1" ]; then
	xdotool type "$chosen"
else
	printf "$chosen" | xclip -selection clipboard
	notify-send --app-name=Clipboard --icon="diodon-panel" "'$chosen' copied to clipboard." &
fi
