#!/usr/bin/bash

# Created to be called from NeoVIM/ViM like so:
# nnoremap <silent> <Space>p :execute "silent !md-zathura.sh " . bufname("%")<CR>
# 
# Opens a preview in zathura and (in an admittedly very inelegant
# way), prevents more than one preview from being opened at the same time.

if [ -f "/tmp/md-zathura-pid" ]; then
	PID="$(cat /tmp/md-zathura-pid)"
	kill -SIGKILL "$PID"
fi

md2pdf $1 -o "/tmp/md-zathura-$1.pdf"
zathura "/tmp/md-zathura-$1.pdf" & disown
echo $! > "/tmp/md-zathura-pid"

