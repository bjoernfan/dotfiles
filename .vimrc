colorscheme jellybeans

set nocompatible
set autoindent
set nobackup
set backspace=2
set tabstop=4
set shiftwidth=4
set background=light
set cindent
set history=50
set ruler
set number
set clipboard=unnamedplus

function! Filenc()
    if &fileencoding != ""
        return "[" . &fileencoding . "]" 
    else
        return ""
    endif
endfunction

set incsearch
set laststatus=2
set nohlsearch
set statusline=%F\ %y%m%=\ %{fugitive#statusline()}\ %{Filenc()}[%{&ff}]\ %c%V\ %l\,%L\ %P

set wildmenu
set wildmode=list:longest,full

set tags=tags;/

"Kräver libvi-quickfix-perl
":make i perl-script, :cn och :cp för att hoppa mellan kompileringsfel.
set makeprg=perl\ -c\ -MVi::QuickFix\ %
set errorformat+=%m\ at\ %f\ line\ %l\.
set errorformat+=%m\ at\ %f\ line\ %l

filetype plugin on

syntax on

let mapleader = " "

map <Tab> ==<CR>
map <C-P> :set paste!<CR>
map <C-N> :set number!<CR>
map <C-S> :set hlsearch!<CR>

imap <C-H> <Left>
imap <C-L> <Right>
imap <C-J> <Down>
imap <C-K> <Up>
imap <C-E> \emph{}<Esc>i

imap <S-Insert> <C-R>+

"map <Leader>c :s/\(\S\)/#\1/<CR>
map <Leader>c :s/^/#\1/<CR>
"map <C-C> :s/\(\S\)/#\1/<CR>
map <S-C> :s/#\(.\)/\1/<CR>

map <Leader>T :tabnew<CR>
map <Leader>t :vnew<CR><C-W>L

map + <C-w>+
map - <C-w>-
map <C-Left> <C-w><
map <C-Right> <C-w>>

if $TERM == "rxvt-unicode"
	set t_Co=16
endif

" Current directory follows the file being edited, unless it's a remote file
if exists(":lcd")
	autocmd BufEnter * if bufname("") !~ '^[[:alnum:]]*://' | silent! lcd %:p:h | endif
else
	autocmd BufEnter * if bufname("") !~ '^[[:alnum:]]*://' | cd %:p:h | endif
endif

" Some settings for :TOhtml
if exists(":TOhtml")
	let g:html_use_css = 1
	let g:html_use_xhtml = 1
	let g:html_number_lines = 1
endif

" Folding
if version >= 600
	set foldenable
	set foldmethod=marker
endif

if has("autocmd") 
	autocmd bufwritepost * call system("[ -f .autogit ] && git add '" . expand('%') . "' && git commit -m '`date`: " . expand('%') . "' '" . expand('%') . "'") 
endif

let g:erlangFold = 0
let c_C99 = 1

set tabline=%!ShortTabLine()

function ShortTabLine()
	let ret = ''

	for i in range(tabpagenr('$'))
		" select the color group for highlighting active tab
		if i + 1 == tabpagenr()
			let ret .= '%#errorMsg#'
		else
			let ret .= '%#TabLine#'
		endif
		" find the buffername for the tablabel
		let buflist = tabpagebuflist(i+1)
		let winnr = tabpagewinnr(i+1)
		let buffername = bufname(buflist[winnr - 1])
		let filename = fnamemodify(buffername,':t')

		" check if there is no name
		if filename == ''
			let filename = 'noname'
		endif

		let ret .= '['.filename.']'
	endfor

	" after the last tab fill with TabLineFill and reset tab page #
	let ret .= '%#TabLineFill#%T'

	return ret
endfunction
