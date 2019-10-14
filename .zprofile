# Move ZSH config files to all other config
export ZDOTDIR="$HOME/.config/zsh"

# lazy load nvm
export NVM_LAZY_LOAD=true

# Source profile last because it starts graphical environment
source "$HOME/.profile"
