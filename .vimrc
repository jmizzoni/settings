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
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'endel/flashdevelop.vim'

"useful things
Plugin 'valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-rooter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'chrisbra/Colorizer'
Plugin 'dyng/ctrlsf.vim'
Plugin 'tomtom/tlib_vim'

call vundle#end()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" prefer syntastic over YCM for linting C family languages
let g:ycm_show_diagnostics_ui = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_global_conf.py'


" syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" specific linting settings

let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-Wall -std=c++11'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_filetype_map = {'html.handlebars' : 'handlebars' }

" other
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensios#tabline#show_buffers = 1
let g:airline_symbols.space = "\ua0"
let g:airline_theme='behelit'

let g:ctrlsf_regex_pattern = 1
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_winsize = '100%'
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" regular preferences

filetype plugin indent on
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set number
set hidden

if !has('nvim')
    set term=builtin_ansi
endif

set laststatus=2
set autoread
set hlsearch
syntax on
set t_Co=256
set clipboard=unnamed
set backspace=indent,eol,start

if has('nvim')
    set termguicolors
endif

colorscheme darkfantasy
hi Normal ctermbg=none
highlight NonText ctermbg=none

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python,javascript,jsx,tsx,ts,as,actionscript,handlebars autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
autocmd FileType jsx setfiletype javascript.jsx
autocmd FileType pgsql setfiletype sql
autocmd FileType as,actionscript set expandtab!
autocmd FileType html,handlebars set tabstop=2

" keymaps

nmap <C-F> <Plug>CtrlSFPrompt
vmap <C-F> <Plug>CtrlSFVwordPath
nmap <C-G> *<Plug>CtrlSFCwordPath
nmap <C-n> :bp<CR>
nmap <C-m> :bn<CR>
nnoremap gp p`[v`]
vnoremap gp p`[v`]

" Fix syntastic error jumping
function! <SID>LocationPrevious()
    try
        lprev
    catch /^Vim\%((\a\+)\)\=:E553/
        llast
    endtry
endfunction

function! <SID>LocationNext()
    try
        lnext
    catch /^Vim\%((\a\+)\)\=:E553/
        lfirst
    endtry
endfunction

nnoremap <silent> <Plug>LocationPrevious         :<C-u>exe 'call <SID>LocationPrevious()'<CR>
nnoremap <silent> <Plug>LocationNext             :<C-u>exe 'call <SID>LocationNext()'<CR>
nmap <silent> lp  <Plug>LocationPrevious
nmap <silent> ln  <Plug>LocationNext

set runtimepath^=~/.vim/bundle/ctrlp.vim
