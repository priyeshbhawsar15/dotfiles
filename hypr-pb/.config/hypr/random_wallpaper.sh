#!/bin/bash

directory=/home/priyesh/Pictures/walls-catppuccin-mocha/
monitor=`hyprctl monitors | grep Monitor | awk '{print $2}'`

if [ -d "$directory" ]; then
    random_background=$((ls $directory/*.jpg && ls $directory/*.png) | shuf -n 1)

    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload $random_background
    hyprctl hyprpaper wallpaper ", $random_background"

fi
