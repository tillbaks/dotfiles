#!/bin/sh

wallpaper_dir='/home/johannes/Pictures/Wallpapers'

random_wallpaper=`ls $wallpaper_dir | sort --random-sort | head -1`

swaymsg "output * bg $wallpaper_dir/$random_wallpaper stretch"
