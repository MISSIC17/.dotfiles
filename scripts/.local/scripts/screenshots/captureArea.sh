#!/bin/bash

grim -g "$(slurp)" $HOME/Pictures/Screenshots/$(date +'%s_grim.png') && wl-copy <$HOME/Pictures/Screenshots/$(date +'%s_grim.png')
