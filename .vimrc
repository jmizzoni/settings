set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"syntax
Plugin 'othree/yajs'
Plugin 'gavocanov/vim-js-indent'
Plugin 'elzr/vim-json'
Plugin 'mxw/vim-jsx'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-latex/vim-latex'
Plugin 'jmizzoni/vim-tsx'
Plugin 'exu/pgsql.vim'

"useful things
Plugin 'valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'dbakker/vim-projectroot'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'chrisbra/Colorizer'
Plugin 'dyng/ctrlsf.vim'

call vundle#end()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" specific linting settings

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_typescript_checkers = ['tslint']

" other

let g:ackprg = 'ag --nogroup --nocolor --column'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:ctrlsf_regex_pattern = 1
let g:ctrlsf_default_root = 'project'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" regular preferences

filetype plugin indent on
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set number
set term=builtin_ansi
set laststatus=2
set autoread
set hlsearch
syntax on
set t_Co=256

colorscheme darkfantasy
hi Normal ctermbg=none
highlight NonText ctermbg=none

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python,javascript,jsx autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
autocmd FileType jsx setfiletype javascript.jsx
autocmd FileType pgsql setfiletype sql

" keymaps

:map <C-F> :CtrlSF 

set runtimepath^=~/.vim/bundle/ctrlp.vim
