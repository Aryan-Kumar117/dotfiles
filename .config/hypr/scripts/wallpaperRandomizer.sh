#!/bin/bash

# --- CONFIGURATION ---
# IMPORTANT: Change this to your actual wallpaper directory
WALLPAPER_DIR=~/Pictures/Wallpapers
# ---------------------

# 1. Get a list of all files in the directory and select one randomly.
#    Note: This is more robust than the original script's array method.
#    'find' finds files, 'shuf' shuffles them, '-n 1' picks the first one.
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.webp" \) | shuf -n 1)

# Check if a wallpaper was found
if [ -z "$WALLPAPER" ]; then
    echo "Error: No wallpapers found in $WALLPAPER_DIR"
    exit 1
fi

# 2. Get a list of all active monitor names
#    hyprctl monitors | grep Monitor | awk '{print $2}' gets the monitor names (e.g., 'DP-1', 'HDMI-A-1')
MONITORS=(`hyprctl monitors | grep Monitor | awk '{print $2}'`)

# 3. Apply the wallpaper using hyprpaper IPC
echo "Setting wallpaper: $WALLPAPER"

# Unload all existing wallpapers to free memory
hyprctl hyprpaper unload all

# Preload the new wallpaper
hyprctl hyprpaper preload "$WALLPAPER"

# Set the wallpaper on all monitors
for MONITOR in "${MONITORS[@]}"; do
    hyprctl hyprpaper wallpaper "$MONITOR,$WALLPAPER"
done

# You can optionally unload unused wallpapers after a delay to free memory
# sleep 1 # wait for the wallpaper to settle
# hyprctl hyprpaper unload unused
