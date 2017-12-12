
set encoding=utf-8
if has("win32")
set fileencoding=chinese
else
set fileencoding=utf-8
endif
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决consle输出乱码
language messages zh_CN.utf-8
let &termencoding=&encoding

set nocompatible
set nu
"set background=dark
set nowrapscan
set hlsearch
set t_Co=256
set pythonthreedll=C:/Users/Administrator/AppData/Local/Programs/Python/Python36/python36.dll
set luadll=c:/Lua/lua53.dll
" 备份缓存
set noundofile 
set nobackup 
set noswapfile

filetype on
syntax enable
syntax on

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

" 配色方案
"colorscheme solarized
colorscheme monokai