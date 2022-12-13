#!/bin/bash

if [[ `ibus engine | awk -F":" '{ print $2 }'` == "us" ]]; then
	ibus engine 'anthy'
	setxkbmap -layout jp
else
	ibus engine 'xkb:us::eng'
	setxkbmap -layout us
fi
