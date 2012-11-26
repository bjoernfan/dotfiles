colorscheme jellybeans
"colorscheme zenburn

set guioptions-=g
set guioptions-=i
set guioptions-=m
set guioptions-=r
set guioptions-=L
set guioptions-=t
set guioptions-=T
set guioptions-=e
set guioptions+=A

set autochdir

map <MiddleMouse> a<C-R>+<esc>
imap <MiddleMouse> <C-R>+
imap <S-Insert> <C-R>+
cmap <S-Insert> <C-R>+

au BufRead,BufNewFile *.html.ep set filetype=html.epl

"au WinEnter * vertical resize 84
"autocmd WinLeave * call AdjustSize()

autocmd WinEnter * call AdjustSize()

function! AdjustSize()
    if (winwidth(0)<84)
		:vertical resize 84
    endif
endfunction

function! ToggleGuifont()
    if (&guifont == 'Source Code Pro 10')
		":set guifont=DejaVu\ Sans\ Mono\ 11
		:set guifont=Source\ Code\ Pro\ 12
	else
		":set guifont=DejaVu\ Sans\ Mono\ 8
		:set guifont=Source\ Code\ Pro\ 9
    endif
endfunction

map <Leader>f :call ToggleGuifont()<CR>

autocmd BufNew * call OverLength()

function! OverLength()
	highlight OverLength ctermbg=red ctermfg=white guibg=#592929
	:match OverLength /\%81v.\+/
endfunction

map b :TlistOpen<CR>
map B :TlistClose<CR>

"set guifont=DejaVu\ Sans\ Mono\ 8
set guifont=Source\ Code\ Pro\ 9
set mouse=""

"set cursorline

function! ShortTabLabel()
	let bufnrlist = tabpagebuflist(v:lnum)
	" show only the first 6 letters of the name + ..
	let label = bufname(bufnrlist[tabpagewinnr(v:lnum) ? 1])
	let filename = fnamemodify(label,':h')
	" only add .. if string is more than 8 letters
	if strlen(filename) >=8
		let ret = filename[0:5].'..'
	else
		let ret = filename
	endif

	let ret = '(' . v:lnum . ') ' . ret

	return ret
endfunction

"show tabs, EOL etc.
set list
set listchars=tab:»·   "show tabs
set listchars+=trail:· "show trailing spaces

highlight SpecialKey term=NONE guifg=#a0a0a0

"set guitablabel=%{ShortTabLabel()}
set tabline=

set showtabline=2 " 2=always

"IndentGuidesEnable

"TabLine guibg; ovalda textens färg, gui=none för att de är underlined by default
autocmd GUIEnter * hi! TabLine     gui=none guibg=#b7af9f guifg=#000000
autocmd GUIEnter * hi! TabLineFill gui=none guibg=#b7af9f guifg=#ffffff
autocmd GUIEnter * hi! TabLineSel  gui=bold guibg=#b7af9f guifg=#000000
