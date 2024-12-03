#!/usr/bin/bash

# Select a random wallpaper every 30 minutes
#
#  |                 | |          
#  __ \   _` |  _ \  | __ \   _` |
#  |   | (   | (   | | | | | (   |
# _.__/ \__,_|\___/ _|_| |_|\__, |
#                               _|

while true; do
  # Kill existing hyprpaper process if it exists
  if pgrep -x hyprpaper > /dev/null; then
    killall hyprpaper
  fi

  # Select a random wallpaper
  file=$(ls $HOME/.config/hypr/bg | sort -R | tail -n 1)
  abs_path=$HOME/.config/hypr/bg/$file

  # Update hyprpaper configuration
  printf "preload = $abs_path\nwallpaper = , $abs_path\n" > $HOME/.config/hypr/hyprpaper.conf

  # Re-run and wait
  hyprpaper &
  sleep 30m
done

