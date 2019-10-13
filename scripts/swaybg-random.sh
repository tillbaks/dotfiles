#!/bin/sh

wallpaper_dir=$HOME/Pictures/subtlepatterns

random_wallpaper=`ls $wallpaper_dir | sort --random-sort | head -1`

swaymsg "output * bg $wallpaper_dir/$random_wallpaper tile"
