" Plugins
call plug#begin()

Plug 'arcticicestudio/nord-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'

" Programming
Plug 'maralla/completor.vim'
Plug 'racer-rust/vim-racer'

call plug#end()

" Visuals
colorscheme nord
let g:lightline = { 'colorscheme': 'nord' }
set cursorline
set relativenumber

" General Settings
set foldmethod=indent
set foldlevel=10
set list lcs=trail:·,tab:»·
au FileType * set fo-=r fo-=o
set sts=2
set ts=2
set sw=2
set et

" Keymappings
let mapleader=" "

inoremap jj <Esc>

nnoremap ; :
nnoremap <Leader><Leader> za
nnoremap j gj
nnoremap k gk
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

map <C-2> <Nop>

map <C-n> :NERDTreeToggle<CR>
map <C-G> :Goyo<CR>

" Programming Settings
set hidden
let g:racer_cmd = "/home/yure/.cargo/bin/racer"
let g:racer_experimental_completer = 1

" Completor
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
let g:completor_racer_binary = "/home/yure/.cargo/bin/racer"

" Functions
if ( $TERM == "xterm-256color" || $TERM == "screen-256color" )
	set t_Co=256
	
	" Enable powerline too
	set rtp+=/usr/share/powerline/bindings/vim/
endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Goyo
function! s:goyo_enter()
	let b:quitting = 0
	let b:quitting_bang = 0
	autocmd QuitPre <buffer> let b:quitting = 1
	cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
	" Quit Vim if this is the only remaining buffer
	if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
		if b:quitting_bang
			qa!
		else
			qa
		endif
	endif
endfunction
autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()
