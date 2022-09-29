export WINEARCH=win32
export WINEPATH=$HOME
export WINEPREFIX=$WINEPATH/.wine_cfg
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.npm-packages/bin"
[[ -f $HOME/.config/zsh/variables.private.zsh ]] && source $HOME/.config/zsh/variables.private.zsh 
