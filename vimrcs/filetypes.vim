" Set Comment Start
autocmd BufNewFile *.py,*.cs,*.lua,*.md,*.php,*.js,*.cpp exec ":call SetComment()" | normal 10Go

   

function! SetComment()
    " 不同语言注释符号不同
    let commentStart = "" 
    let commentEnd = "" 
    if expand("%:e") ==? 'py'
        let commentStart = "'''"
        let commentEnd = "'''"
    elseif expand("%:e") == 'lua'
        let commentStart = "--[["
        let commentEnd = "--]]"
    elseif expand("%:e") ==? 'md' 
        let commentStart = "<!--"
        let commentEnd = "-->"
    elseif (expand("%:e") ==? 'cpp') || (expand("%:e") ==? 'c') || (expand("%:e") ==? 'cs')
        let commentStart = "/*"
        let commentEnd = "*/" 
    endif

    call append(0, commentStart."***************************************************")
	call append(1, " * Filename:        ".expand("%:t"))
	call append(2, " * ")
	call append(3, " * Author:          Kid <347494143@qq.com>")
	call append(4, " * Create:          ".strftime("%Y-%m-%d %H:%M:%S"))
	call append(5, " * Last Change:		".strftime("%Y-%m-%d %H:%M:%S"))
	call append(6, " * Description:     ")
    call append(7, "***************************************************".commentEnd)
	echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf
" map <F4> : call SetComment()<CR>:10<CR>o
map <F4> : call SetComment()<CR>
" Set Comment End

" Set Last Modified Time Start
" 更新最近修改时间和文件名
function! DataInsert()
	call cursor(5,1)
	if search('Last Change') != 0
		let line = line('.')
		call setline(line, " * Last Change:\t\t".strftime("%Y-%m-%d %H:%M:%S"))
	endif
	echohl WarningMsg | echo "Successful in updating the copyright." | echohl None
endf
autocmd FileWritePre,BufWritePre *.py,*.cs,*.lua,*.md,*.php,*.js,*.cpp ks|call DataInsert() | 's
" Set Last Modified Time End
"

" 设置行宽80
au BufRead,BufNewFile *.asm,*.c,*.cpp,*.java,*.cs,*.sh,*.lua,*.pl,*.pm,*.py,*.rb,*.erb,*.hs,*.vim 2match Underlined /.\%81v/
set textwidth=80

" 在插入状态下输入”xdt "“后Enter来插入系统当前时间
iab xdt <c-r>=strftime("20%y-%m-%d %H:%M(%A)")<cr>
"示例：=======2015.01.06.17:35(星期二)=======
"
"注释///
iab /// /// <summary><CR>///<CR>/// </summary><esc>kA 

" 横线
iab ----- ----------------------------------------------<esc>xa
