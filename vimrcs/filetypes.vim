" Set Comment Start
autocmd BufNewFile *.cs,*.lua,*.md,*.php,*.js,*.cpp exec ":call SetComment()" | normal 10Go

function SetComment()
	call append(0, "/***********************************************")
	call append(1, " * Filename 		: ".expand("%:t"))
	call append(2, " * ")
	call append(3, " * Author			: Kid - 347494143@qq.com")
	call append(4, " * Create			: ".strftime("%Y-%m-%d %H:%M:%S"))
	call append(5, " * Last Modified	: ".strftime("%Y-%m-%d %H:%M:%S"))
	call append(6, " * Description 		: ")
	call append(7, " * **********************************************/")
	"echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
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
autocmd FileWritePre,BufWritePre *.cs,*.lua,*.md,*.php,*.js,*.cpp ks|call DataInsert() | 's
" Set Last Modified Time End

" 在插入状态下输入”xdt "“后Enter来插入系统当前时间
iab xdt <c-r>=strftime("20%y-%m-%d %H:%M(%A)")<cr>
"示例：=======2015.01.06.17:35(星期二)=======
"
"注释///
inoremap /// /// <summary><CR>///<CR>/// </summary>
inoremap ----- ---------------------  -------------------------<esc>bi
