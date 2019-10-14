#!/bin/sh
#
# Just a simple script to install all packages I use
# with the ability to choose gui packages for devices with displays
#

# yay is required to install packages
! type yay &> /dev/null && echo "yay is required. Please install it to continue." && exit 1

requiredPackages="
lf
neovim
zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting
fzf fzy
ccls nvm
the_silver_searcher
gitflow-avh gitflow-zshcompletion-avh
"

guiPackages="
numix-icon-theme
redshift-wlr-gamma-control-git
ttf-google-fonts-typewolf
sway rofi termite
imv mpv evince
firefox-developer-edition brave-bin
transmission-remote-gtk
"

gamePackages="
retroarch libretro-fceumm-git \
nottetris2 \
antimicro obs-studio \
moonlight-qt
"

echo "=> Installing required packages"

yay -S $requiredPackages

echo "=> Do you want to install GUI packages? [Y/N]"
read installGui
case $installGui in
  [yY])
    echo "=> Installing GUI packages"
    yay -S $guiPackages

    echo "=> Do you want to install Game packages? [Y/N]"
    read installGames
    case $installGames in
      [yY])
        echo "=> Installing Game packages"
        yay -S $gamePackages
        ;;
      *)
        echo "=> Skipping Game packages"
        ;;
    esac
    ;;
  *)
    echo "=> Skipping GUI packages"
    ;;
esac


echo "=> Done"
