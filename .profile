#!/bin/sh
# Profile file. Runs on login.

PATH="$HOME/scripts:$PATH"

export VISUAL="nvim"
export EDITOR="nvim"
export TERMINAL="termite"
export BROWSER="firefox"
export READER="evince"
export FILE="lf"

# Disable less search history
export LESSHISTFILE=/dev/null

# Move node historyto cache
export NODE_REPL_HISTORY=/home/johannes/.cache/node/history

# Set up Node Version Manager
export NVM_DIR="$HOME/.nvm"

# hardware accel in mpv
export LIBVA_DRIVER_NAME=iHD

# Force the usage of X11 on a Wayland session (Android emulator)
export QT_QPA_PLATFORM=xcb

# Note: Many proprietary games come bundled with old versions of SDL
# which don't support Wayland and might break entirely if you set SDL_VIDEODRIVER=wayland.
# To force the application to run with XWayland, set SDL_VIDEODRIVER=x11
#export SDL_VIDEODRIVER=wayland

# Some Java-based applications will display blank screen when opened, for example any Intellij editor.
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dsun.java2d.uiScale=1.5 -Dsun.java2d.uiScale.enabled=false"

# Start graphical server if not already running.
#[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x sway >/dev/null && exec sway
