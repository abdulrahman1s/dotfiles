function what() { 
		query=$(printf "$*" | tr " " "+")
		curl cheat.sh/$query
}

function add_path() {
		echo "export PATH=\"\$PATH:${$1/$HOME/\$HOME}\"" >> ~/.config/zsh/variables.zsh
		. ~/.config/zsh/variables.zsh
}

function commit_plz() {
		git pull
		git add .
		git commit -m "$(curl -sk whatthecommit.com/index.txt)"
		git push
}
