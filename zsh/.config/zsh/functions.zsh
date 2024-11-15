what() {
    curl cheat.sh/$(printf "$*" | tr " " "+")
}

tunnel() {
    if [ "$1" -eq "0" ] 
    then
        echo "Please provide a port"
    else
        cloudflared tunnel --url http://localhost:$1 2> >(grep -oh "https://\(.*\)trycloudflare.com")
    fi
}


add_path() {
    echo "export PATH=\"\$PATH:${$1/$HOME/\$HOME}\"" >> ~/.config/zsh/variables.zsh
    . ~/.config/zsh/variables.zsh
}

commit_plz() {
    git pull
    git add .
    git commit -m "$(curl -sk whatthecommit.com/index.txt)"
    git push
}


# Archive Extractor
ex() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1   ;;
            *.tar.gz)    tar xzf $1   ;;
            *.tar.xz)    tar xJf $1   ;;
            *.bz2)       bunzip2 $1   ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1    ;;
            *.tar)       tar xf $1    ;;
            *.tbz2)      tar xjf $1   ;;
            *.tgz)       tar xzf $1   ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1;;
            *.7z)        7z x $1      ;;
            *)           echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
