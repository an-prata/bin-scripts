#!/usr/bin/bash

# Takes a screenshot and saves it to SAVE_DIR with the name FILE_NAME

SAVE_DIR="$HOME/Pictures"
FILE_NAME="Screenshot on $(date +"%B %d, %Y - %-I:%M:%S %p").png"

maim -s | tee "$SAVE_DIR/$FILE_NAME" | xclip -selection clipboard -t image/png 
notify-send "Took a screenshot" "$SAVE_DIR/$FILE_NAME" -a "scrot" -i "$SAVE_DIR/$FILE_NAME"
#meh "$SAVE_DIR/$FILE_NAME" & disown

