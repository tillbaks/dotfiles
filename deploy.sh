#!/bin/sh
#
# Deploys dotfiles for current user
# Nothing is copied - only symlinks to this location are created
#
# NOTE: Existing config will be overwritten!
#

# Path to script since absolute paths are required for ln
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

echo "=> Adding symlink to .profile"
ln -vnfs $SCRIPTPATH/.profile $HOME/.profile

echo "=> Adding symlink to aliasrc"
mkdir -v -p $HOME/.config
ln -vnfs $SCRIPTPATH/.config/aliasrc $HOME/.config/aliasrc

if type zsh &>/dev/null; then
  echo "=> Adding symlinks to zsh config"
  mkdir -v -p $HOME/.config/zsh
  ln -vnfs $SCRIPTPATH/.zprofile $HOME/.zprofile
  ln -vnfs $SCRIPTPATH/.config/zsh/.zshrc $HOME/.config/zsh/.zshrc
  ln -vnfs $SCRIPTPATH/.config/zsh/.zkeybinds $HOME/.config/zsh/.zkeybinds
fi

if type lf &>/dev/null; then
  echo "=> Adding symlinks to lf config"
  mkdir -v -p $HOME/.config/lf
  ln -vnfs $SCRIPTPATH/.config/lf/lfrc $HOME/.config/lf/lfrc
fi

if type nvim &>/dev/null; then
  echo "=> Adding symlinks to neovim config"
  mkdir -v -p $HOME/.config/nvim
  ln -vnfs $SCRIPTPATH/.config/nvim/init.vim $HOME/.config/nvim/init.vim
  ln -vnfs $SCRIPTPATH/.config/nvim/coc-settings.json $HOME/.config/nvim/coc-settings.json
fi

# Configs for any non-root users
if [ ! $USER == "root" ]; then

  echo "=> Adding symlink to .Xdefaults (dpi, cursor..)"
  ln -vnfs $SCRIPTPATH/.Xdefaults $HOME/.Xdefaults

  echo "=> Adding symlinks to gtk3 config"
  mkdir -v -p $HOME/.config/gtk-3.0
  ln -vnfs $SCRIPTPATH/.config/gtk-3.0/gtk.css $HOME/.config/gtk-3.0/gtk.css
  ln -vnfs $SCRIPTPATH/.config/gtk-3.0/settings.ini $HOME/.config/gtk-3.0/settings.ini

  echo "=> Adding symlinks to scripts"
  mkdir -v -p $HOME/scripts
  ln -vnfs $SCRIPTPATH/scripts/brightness $HOME/scripts/brightness
  ln -vnfs $SCRIPTPATH/scripts/swaybg-random.sh $HOME/scripts/swaybg-random.sh

  echo "=> Adding symlinks to gtk3 theme"
  mkdir -v -p $HOME/.themes
  ln -vnfs $SCRIPTPATH/.themes/oomox-gruvbox-dark-hard $HOME/.themes/oomox-gruvbox-dark-hard

  if type rofi &>/dev/null; then
    echo "=> Adding symlinks to rofi config"
    mkdir -v -p $HOME/.config/rofi
    ln -vnfs $SCRIPTPATH/.config/rofi/config $HOME/.config/rofi/config
    ln -vnfs $SCRIPTPATH/.config/rofi/gruvbox-common.inc.rasi $HOME/.config/rofi/gruvbox-common.inc.rasi
    ln -vnfs $SCRIPTPATH/.config/rofi/gruvbox.rasi $HOME/.config/rofi/gruvbox.rasi
  fi

  if type sway &>/dev/null; then
    echo "=> Adding symlinks to sway config"
    mkdir -v -p $HOME/.config/sway
    ln -vnfs $SCRIPTPATH/.config/sway/config $HOME/.config/sway/config
  fi

  if type waybar &>/dev/null; then
    echo "=> Adding symlinks to waybar config"
    mkdir -v -p $HOME/.config/waybar
    ln -vnfs $SCRIPTPATH/.config/waybar/config $HOME/.config/waybar/config
    ln -vnfs $SCRIPTPATH/.config/waybar/style.css $HOME/.config/waybar/style.css
  fi

  if type termite &>/dev/null; then
    echo "=> Adding symlinks to termite config"
    mkdir -v -p $HOME/.config/termite
    ln -vnfs $SCRIPTPATH/.config/termite/config $HOME/.config/termite/config
  fi

  if type mpv &>/dev/null; then
    echo "=> Adding symlinks to mpv config"
    mkdir -v -p $HOME/.config/mpv
    ln -vnfs $SCRIPTPATH/.config/mpv/config $HOME/.config/mpv/config
  fi
fi
