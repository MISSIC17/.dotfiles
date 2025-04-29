#!/bin/bash

STATE_FILE="/tmp/hyprsunset_state"
STATE=$(cat "$STATE_FILE" 2>/dev/null || echo "off")

if [ "$STATE" = "off" ]; then
  echo "👓"
else
  echo "🕶"
fi
