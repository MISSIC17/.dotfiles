#!/bin/bash

CONFIG_FILES="~/.config/waybar/config ~/.config/waybar/style.css"

trap "killall waybar" EXIT

while true; do
	waybar &
	inotifywait -e create,modify $CONFIG_FILES
	killall waybar
done
