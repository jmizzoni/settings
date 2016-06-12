venv() {
    source ~/.virtualenvs/$1/bin/activate
}

react_browserify() {
    browserify -t [ babelify --presets [ react ] ] $1 -o build/bundle.js
}

parse_git_branch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

ps1_git_branch_display() {
    parse_git_branch | sed -e 's/\(.*\)/ → \1/'
}

branch() {
    git pull
    git checkout -b $1
    track $1
}

track() {
   git push -u origin $1
}

squash() {
    branch_name="$(parse_git_branch)"
    git checkout master
    git pull
    branch _squashed_$branch_name
    git merge --squash $branch_name
    git commit -a
}

prune_local() {
    if [ "$1" == "--delete" ]; then
        git branch --merged | grep -v "\*" | grep -v master | xargs -n 1 git branch -d
    else
        git branch --merged | grep -v "\*" | grep -v master
    fi
}
