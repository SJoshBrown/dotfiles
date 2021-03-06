set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'sickill/vim-monokai'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'embear/vim-localvimrc'

Plugin 'nvie/vim-flake8'

call vundle#end()
filetype plugin indent on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set ruler " show the cursor position all the time

if has('mouse')
  set mouse=a
endif

set number
set colorcolumn=99
set relativenumber
set clipboard=unnamed

set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

set nobackup
set noswapfile

" reload files changed on disk
set autoread
au FocusGained,BufEnter * :checktime

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

" format XML
com! FormatXML :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"
nnoremap = :FormatXML<Cr>

" NERDtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Color
syntax enable
colorscheme monokai

set cursorline

" YouCompleteMe
let g:ycm_server_python_interpreter = '/usr/local/bin/python3'

" vim-flake8
autocmd BufWritePost *.py call Flake8()
let g:flake8_show_in_gutter=1

" for git gutter
set updatetime=100
