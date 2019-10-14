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

# Move node history to cache
export NODE_REPL_HISTORY=/home/johannes/.cache/node/history

# Set up Node Version Manager
if [ -s "$NVM_SOURCE/nvm.sh" ]; then
  export NVM_DIR="$HOME/.nvm"
  export NVM_SOURCE="/usr/share/nvm"
  source "$NVM_SOURCE/init-nvm.sh"
fi

# hardware accel in mpv
export LIBVA_DRIVER_NAME=iHD

# Force the usage of X11 on a Wayland session (Android emulator)
export QT_QPA_PLATFORM=xcb
# Run firefox with wayland
export MOZ_ENABLE_WAYLAND=true

# Note: Many proprietary games come bundled with old versions of SDL
# which don't support Wayland and might break entirely if you set SDL_VIDEODRIVER=wayland.
# To force the application to run with XWayland, set SDL_VIDEODRIVER=x11
#export SDL_VIDEODRIVER=wayland

# Some Java-based applications will display blank screen when opened, for example any Intellij editor.
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dsun.java2d.uiScale=1.5 -Dsun.java2d.uiScale.enabled=false"

# Start sway if installed and not already running.
if type sway &>/dev/null; then
  [ "$(tty)" = "/dev/tty1" ] && ! pgrep -x sway >/dev/null && exec sway
fi
# Start i3 if installed and not already running.
#if type i3 &>/dev/null; then
#[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec i3
#fi
