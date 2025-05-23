#!/bin/bash
# Modified From: https://github.com/BijanRegmi/.dotfiles/blob/wayland/.config/hypr/scripts/wallpaper.sh

# Set the wallpaper directory
wallpaper_dir="$HOME/.config/hypr/wallpapers"
current_file="$HOME/.config/hypr/wallpapers/.current_wallpaper"

# Check if wallpaper directory exists
if [ ! -d "$wallpaper_dir" ]; then
  notify-send "Error" "Wallpaper directory not found: $wallpaper_dir" -u critical
  exit 1
fi

# Get all image files (jpg, png, jpeg, webp)
mapfile -t wallpapers < <(find "$wallpaper_dir" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | sort)

# Check if any wallpapers were found
if [ ${#wallpapers[@]} -eq 0 ]; then
  notify-send "Error" "No wallpapers found in $wallpaper_dir" -u critical
  exit 1
fi

# Get total count
count=${#wallpapers[@]}

# Select a random wallpaper
random_index=$((RANDOM % count))
selected_wallpaper="${wallpapers[$random_index]}"

# Get just the filename for display
wallpaper_name=$(basename "$selected_wallpaper")

# Kill existing hyprpaper and start fresh
if pidof hyprpaper >/dev/null; then
  pkill hyprpaper
fi

# Start hyprpaper in background
hyprpaper >/dev/null 2>&1 &

# Wait a moment for hyprpaper to initialize
sleep 1

# Now preload and set the wallpaper
hyprctl hyprpaper preload "$selected_wallpaper"
hyprctl hyprpaper wallpaper ",$selected_wallpaper"

# Send notification
notify-send "Wallpaper Updated" "Random wallpaper: $wallpaper_name" -r 69

# Save current wallpaper info for reference
echo "$selected_wallpaper" >"$current_file"

echo "Random wallpaper set: $wallpaper_name"
