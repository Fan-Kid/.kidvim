
set nocompatible
set nu
syntax enable
syntax on
set background=dark
let &termencoding=&encoding
set fileencodings=utf-8,gbk
set nobackup
set nowrapscan
set hlsearch
set t_Co=256

set noundofile 
set nobackup 
set noswapfile
inoremap jj <esc>


"""""""""""""""""""""""""""Configuration of vundle """"""""""""""""""
filetype off
set rtp+=~/.kidvim/bundle/vundle/
call vundle#rc('$HOME/.kidvim/bundle')
Bundle 'gmarik/vundle'
"Bundle 'majutsushi/tagbar'
Bundle 'altercation/vim-colors-solarized'
Bundle 'rickharris/vim-monokai' 
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-lua-ftplugin'

filetype on

nmap <F8> :TagbarToggle<CR>

"colorscheme solarized
colorscheme monokai

filetype on

set nu
