#!/bin/bash
hyprpicker | grep -o '#[0-9A-Fa-f]\{6\}' | tr -d '\n' | wl-copy
