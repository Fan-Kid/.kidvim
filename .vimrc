
" 映射(Mappings)---------------------------------------------{{{
let mapleader=","
nmap <leader>w    :w<CR>
" jj代替esc
inoremap jj <esc>
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"}}}

"插件管理-----------------------------------------------{{{
"Configuration of vundle ------------------{{{
filetype off
set rtp+=~/.kidvim/bundle/vundle/
call vundle#rc('$HOME/.kidvim/bundle')
Bundle 'gmarik/vundle'
"Bundle 'majutsushi/tagbar'
Bundle 'altercation/vim-colors-solarized'
Bundle 'rickharris/vim-monokai' 
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-lua-ftplugin'
"}}}

"NERDTree ---------------------------------------{{{
Bundle 'scrooloose/nerdtree'
let NERDTreeWinPos='right'
let NERDTreeWinSize=35
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.meta']		""忽略文件
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

"}}}

"MiniBufExplorer --------------{{{
Bundle 'fholgado/minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1   
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1  
let g:miniBufExplMoreThanOne=0

map <F11> :MBEbp<CR>
map <F12> :MBEbn<CR>
"}}}

"airline ----------{{{
Bundle 'bling/vim-airline'
set laststatus=2
"}}}

"ctags和taglist --------------------------------------------------------{{{
Bundle 'taglist.vim'
let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1               "不同时显示多个文件的tag，只显示当前文件的
let Tlist_WinWidt =28                   "设置taglist的宽度
let Tlist_Exit_OnlyWindow=1             "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window=1           "在右侧窗口中显示taglist窗口
let Tlist_Use_Left_Windo =1             "在左侧窗口中显示taglist窗口 
" }}}

"YouCompleteMe --------{{{
Bundle 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf='C:\Users\Administrator/.kidvim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_key_list_stop_completion = ['<CR>'] "回车即选中当前项
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : '<CR>'	"回车即选中当前项

"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
let g:ycm_key_list_select_completion = ['<tab>','<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<s-tab>', '<c-p>', '<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2	" 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
"nnoremap <leader>lo :lopen<CR>	"open locationlist
"nnoremap <leader>lc :lclose<CR>	"close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处

let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_key_invoke_completion = '<C-/>'

""}}}

"Markdown -----------------------{{{
Plugin 'godlygeek/tabular'

Plugin 'plasticboy/vim-markdown'

Plugin 'iamcco/markdown-preview.vim'

let g:mkdp_path_to_chrome=""
let g:mkdp_auto_close=0
nmap <F7> <Plug>MarkdownPreview
nmap <F8> <Plug>StopMarkdownPreview
"}}}
"}}}

" 文件类型相关设置(FileTyp-specific Settings)-----------------------------------{{{
source ~/.kidvim/vimrcs/filetypes.vim

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

" 备份缓存关闭
set noundofile 
set nobackup 
set noswapfile

" 1 tab == 4 spaces
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"}}}

" 状态条(Status Line)-----------------------------------------{{{
" }}}

" 基本设置(Basic Settings) --------------------------------------------------------{{{
set nocompatible
set number
set background=dark
set nowrapscan

" 搜索高亮
set hlsearch
set t_Co=256

"设定字体
if has('gui_running')
    if has("win16") || has("win32") || has("win95") || has("win64")
		"set guifont=YaHei_Monaco_Hybird:h12:cANSI
		set guifont=Inziu_IosevkaCC_SC_Bold:h12:cANSI

		"set guifontwide=YaHei_Monaco_Hybird:h12:cGB2312
    else
        set guifont=YaHei\ Monaco\ Hybird\ 10
    endif
endif

" 自动缩进
set ai!

"去除vim的GUI版本中得toolbar
set guioptions-=T	

"高亮光标所在行  
set cursorline

"取消光标闪烁  
"set guicursor+=a:blickon0
set novisualbell

"标尺功能，显示当前光标所在行列号  
set ruler  

"设置匹配模式，相当于括号匹配
set showmatch

set foldenable

" 默认窗口最大化
autocmd GUIEnter * simalt ~x

" 配色方案
colorscheme solarized
"colorscheme monokai

filetype on
"启用语法高亮
syntax enable
syntax on

" }}}

"VimScript file settings ---------------{{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
"}}}
