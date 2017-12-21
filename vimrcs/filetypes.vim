" Set Comment Start
autocmd BufNewFile *.py,*.cs,*.lua,*.md,*.php,*.js,*.cpp exec ":call SetComment()" | normal 10Go

   

function SetComment()
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
	call append(1, " * Filename\t\t\t: ".expand("%:t"))
	call append(2, " * ")
	call append(3, " * Author\t\t\t: Kid - 347494143@qq.com")
	call append(4, " * Create\t\t\t: ".strftime("%Y-%m-%d %H:%M:%S"))
	call append(5, " * Last Modified\t: ".strftime("%Y-%m-%d %H:%M:%S"))
	call append(6, " * Description\t\t: ")
    call append(7, "***************************************************".commentEnd)
	echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf
map <F4> : call SetComment()<CR>:10<CR>o
" Set Comment End

" Set Last Modified Time Start
" 更新最近修改时间和文件名
function DataInsert()
	call cursor(5,1)
	if search('Last Modified') != 0
		let line = line('.')
		call setline(line, " * Last Modified\t: ".strftime("%Y-%m-%d %H:%M:%S"))
	endif
	echohl WarningMsg | echo "Successful in updating the copyright." | echohl None
endf
autocmd FileWritePre,BufWritePre *.py,*.cs,*.lua,*.md,*.php,*.js,*.cpp ks|call DataInsert() | 's
" Set Last Modified Time End

" 在插入状态下输入”xdt "“后Enter来插入系统当前时间
iab xdt <c-r>=strftime("20%y-%m-%d %H:%M(%A)")<cr>
"示例：=======2015.01.06.17:35(星期二)=======
"
"注释///
iab /// <c-r>/// <summary><CR>///<CR>/// </summary>
iab ----- <c-r>---------------------  -------------------------<esc>bi
