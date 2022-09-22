alias :q=exit
alias :wq=exit
alias ~="cd ~"
alias ..="cd .."
alias ....="cd ../.."
alias weather="curl wttr.in/Egypt+Giza"
alias myip="curl http://ipecho.net/plain; echo"
alias vim="nvim"
alias v="nvim"
alias ls="exa -la --icons --no-permissions --no-user --git"
alias tree="exa --tree --icons"
alias \$=""

function what() { curl cheat.sh/$@ }
