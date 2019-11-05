#!/bin/sh
#
# Just a simple script to install all packages I use
# with the ability to choose gui packages for devices with displays
#

# yay is required to install packages
! type yay &> /dev/null && echo "yay is required. Please install it to continue." && exit 1

requiredPackages="lf
neovim
zsh
zsh-autosuggestions
zsh-completions
zsh-syntax-highlighting
fzf
fzy
the_silver_searcher
gitflow-avh
gitflow-zshcompletion-avh
cquery"

guiPackages="numix-icon-theme
redshift-wlr-gamma-control-git
ttf-google-fonts-typewolf
sway
mako
rot8-git
rofi
termite
imv
mpv
evince
firefox-developer-edition
brave-bin
transmission-remote-gtk"

gamePackages="retroarch
libretro-fceumm-git
nottetris2
antimicro
obs-studio
moonlight-qt"

# Start installing

if [ -d "$HOME/.config/zsh/.zsh-nvm" ]; then
  echo "zsh-nvm exists - updating"
  git -C "$HOME/.config/zsh/.zsh-nvm" pull
else
  git clone https://github.com/lukechilds/zsh-nvm.git "$HOME/.config/zsh/.zsh-nvm"
fi

# Nothing else should be installed by root users
if [ $USER == "root" ]; then
  echo "=> Done."
  exit 0
fi

echo "=> Installing required packages"
yay -S --needed $requiredPackages

echo "=> Do you want to install GUI packages? [Y/N]"
read installGui
case $installGui in
  [yY])
    echo "=> Installing GUI packages"
    yay -S --needed $guiPackages

    echo "=> Do you want to install Game packages? [Y/N]"
    read installGames
    case $installGames in
      [yY])
        echo "=> Installing Game packages"
        yay -S --needed $gamePackages
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
