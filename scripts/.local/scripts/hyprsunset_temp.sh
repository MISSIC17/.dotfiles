#!/bin/bash

STATE_FILE="$HOME/.cache/hyprsunset_temp"
DEFAULT_TEMP=5000
STEP=100
MIN_TEMP=1000
MAX_TEMP=10000

# Read or initialize temp
temp=$(cat "$STATE_FILE" 2>/dev/null || echo $DEFAULT_TEMP)

case "$1" in
up)
  temp=$((temp + STEP))
  ((temp > MAX_TEMP)) && temp=$MAX_TEMP
  ;;
down)
  temp=$((temp - STEP))
  ((temp < MIN_TEMP)) && temp=$MIN_TEMP
  ;;
toggle)
  # Optional toggle for icons (explained below)
  ;;
esac

echo "$temp" >"$STATE_FILE"
hyprctl hyprsunset temperature "$temp"
