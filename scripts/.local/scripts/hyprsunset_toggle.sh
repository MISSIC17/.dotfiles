#!/bin/bash

STATE_FILE="/tmp/hyprsunset_state"

if [ ! -f "$STATE_FILE" ]; then
  echo "off" >"$STATE_FILE"
fi

STATE=$(cat "$STATE_FILE")
if [ "$STATE" = "off" ]; then
  hyprctl hyprsunset gamma 80
  hyprctl hyprsunset temperature 4000
  echo "on" >"$STATE_FILE"
else
  hyprctl hyprsunset gamma 100
  hyprctl hyprsunset temperature 5000
  echo "off" >"$STATE_FILE"
fi
