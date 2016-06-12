cp .bash_aliases .bash_functions .bashrc .gitconfig .vimrc .tmux.conf ~/

if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

if [ ! -d ~/.vim/colors/ ]; then
    mkdir -p ~/.vim/colors
fi

cp darkfantasy.vim ~/.vim/colors
