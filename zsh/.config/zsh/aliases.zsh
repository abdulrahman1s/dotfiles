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
alias untar="tar -xzvf"
alias shutup="killall -KILL"
alias \$=""
alias cd="z"

function what() { curl cheat.sh/$@ }
function add_path() {
		p=$1
		echo "export PATH=\"\$PATH:${p/$HOME/\$HOME}\"" >> ~/.config/zsh/variables.zsh
		source ~/.config/zsh/variables.zsh
}

function commit_plz() {
		git pull
		git add .
		git commit -m "$(curl -sk whatthecommit.com/index.txt)"
		git push
}
