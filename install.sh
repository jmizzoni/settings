cp .bash_aliases .bash_functions .bashrc .gitconfig .vimrc .tmux.conf ~/

if [ ! -d ~/.vim/colors/ ]; then
    mkdir -p ~/.vim/colors
fi

cp darkfantasy.vim ~/.vim/colors
