#!/bin/bash

filename="$HOME/Pictures/Screenshots/$(date +'%s_grim.png')"

grim -g "$(slurp)" "$filename" &&
  wl-copy <"$filename" &&
  notify-send -i $filename "Screenshot taken" "Saved to $filename"
