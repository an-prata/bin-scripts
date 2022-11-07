#!/usr/bin/bash

# Requires xdg-open and for desired defaults to be set with xdg-mime
#
# Intended to be run like so:
# j4-dmenu-desktop --no-generic --term=kitty --dmenu="system-search.sh"
#
# I use it in sxhkd, could easily be put in an i3 config or similar,
# to change terminal, change the --term arg and the last line of fzfmenu.sh

# Change this to change the scanned directory. If you would like to scan more 
# than one I would currently suggest setting up something with sym links, though
# it shouldnt be too diffucult to modify this script to do so.
SCAN_DIR="$HOME"

# You could easily add certain files that dont get scanned here, if you want to
# also scan hidden files you should modify the CURRENT_LS variable's initial value,
# which can be found a few lines down.
FILES=""

DESKTOP_APPS="$(cat < /proc/$$/fd/0)"

# check if this script has already cached the file list
if [ -f "/tmp/system-search/$USER/files" ]; then
	FILES=$(cat "/tmp/system-search/$USER/files")
else
	# get files an cache
	CURRENT_LS="ls -1d $SCAN_DIR*/"
	DIRS="$($CURRENT_LS)"

	while true; do
		CURRENT_LS="$CURRENT_LS*/"
		DIR="$($CURRENT_LS)"

		if [ $? -eq 0 ]; then
			DIRS="$DIRS
$DIR"
		else
			break
		fi
	done

	FILES=$(ls -1dp "$SCAN_DIR"*)
	OLD_IFS="$IFS"
	IFS=$'\n'

	for DIR in $DIRS; do
		LS_OUTPUT=$(ls -1dp "$DIR"*)
		FILES="$FILES
$LS_OUTPUT"
	done

	IFS="$OLD_IFS"

	mkdir -p "/tmp/system-search/$USER/"
	echo "$FILES" > "/tmp/system-search/$USER/files"
fi

SELECTION=$(echo "$FILES
$DESKTOP_APPS" | fzfmenu.sh)

if [[ "$SELECTION" == *"/"* ]]; then
    xdg-open "$SELECTION"
else
    echo "$SELECTION"
fi

