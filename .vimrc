
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

""--------- NERDTree -------
Bundle 'scrooloose/nerdtree'
let NERDTreeWinPos='right'
let NERDTreeWinSize=30
map <F2> :NERDTreeToggle<CR>

let NERDTreeIgnore = ['\.meta']		""忽略文件
""--------------------------

"" ------- MiniBufExplorer --------------
Bundle 'fholgado/minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1   
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1  
let g:miniBufExplMoreThanOne=0

map <F11> :MBEbp<CR>
map <F12> :MBEbn<CR>
""---------------------------------------

"" ------- airline -------
Bundle 'bling/vim-airline'
set laststatus=2
"" -----------------------

"" ------- ctags和taglist --------------------------------------------------------
Bundle 'taglist.vim'
let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1               "不同时显示多个文件的tag，只显示当前文件的
let Tlist_WinWidt =28                   "设置taglist的宽度
let Tlist_Exit_OnlyWindow=1             "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window=1           "在右侧窗口中显示taglist窗口
let Tlist_Use_Left_Windo =1             "在左侧窗口中显示taglist窗口 
"" --------------------------------------------------------------------------------

"" ------- YouCompleteMe --------
Bundle 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf=0
let g:ycm_key_invoke_completion = '<C-/>'
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
"" -------------------------------
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype on

nmap <F8> :TagbarToggle<CR>

"colorscheme solarized
colorscheme monokai

filetype on

set nu
