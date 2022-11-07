#!/usr/bin/bash

# This script is only slightly modified from what can be found here:
# https://www.reddit.com/r/commandline/comments/jatyek/using_fzf_as_a_dmenurofi_replacement/
#
# Unfortunatly it doesnt work when copied verbatim for kitty.

FZF_ARGS="--reverse --border --prompt='launch: ' --tiebreak=end,length --color='fg:#f2f2e9,bg:#17171c,prompt:#cca37a,bg+:#cca37a,fg+:#f2f2e9,pointer:#f2f2e9'"
kitty -d "$HOME" --class "fzfmenu" sh -c "/usr/bin/fzf $FZF_ARGS < /proc/$$/fd/0 > /proc/$$/fd/1"

