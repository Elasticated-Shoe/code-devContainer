function dropthebase() {
    git rebase -i HEAD~$1
}

function bb() {
    if [ -z "$1" ]; then
        git branch -a | grep feat | sort -t - -k 2 -g
    else
        git branch -a | grep $1
    fi
}

alias oopsie='git reset --hard @{u}'

export BROWSER=NONE