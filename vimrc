set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'sickill/vim-monokai'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set ruler " show the cursor position all the time

if has('mouse')
  set mouse=a
endif

set number
set clipboard=unnamed

set nobackup
set noswapfile

syntax on

" window movement
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" windows
vnoremap < <gv
vnoremap > >gv

" tab > spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" case insensitive search
set hlsearch
set incsearch
set ignorecase
set smartcase 

" NERDtree
map <C-n> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree

" Color
syntax enable
colorscheme monokai

set cursorline

" YouCompleteMe
let g:ycm_server_python_interpreter = '/usr/local/bin/python3'
