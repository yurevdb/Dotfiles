" Plugins
call plug#begin()

Plug 'arcticicestudio/nord-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'daviesjamie/vim-base16-lightline'
Plug 'junegunn/goyo.vim'
Plug 'chriskempson/base16-vim'

" Programming
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'racer-rust/vim-racer'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', { 'do': './install.sh'}

" Javascript/Typescript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

call plug#end()

" Visuals
set termguicolors
colorscheme nord
let g:lightline = { 'colorscheme': 'base16' }
set cursorline
set number relativenumber

" General Settings
set noswapfile
set foldmethod=indent
set foldlevel=99
set list lcs=trail:·,tab:»·
set sts=2
set ts=2
set sw=2
set et
au FileType * set fo-=r fo-=o

" Lua File options
autocmd Syntax lua setlocal foldlevel=0

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
let g:deoplete#enable_at_startup = 1
let g:deoplete#sourcers#rust#racer_binary='/home/yure/.cargo/bin/racer'
let g:deoplete#source#rust#rust_source_path='/home/yure/.rustlang/src'

" Completor
let g:completor_racer_binary = "/home/yure/.cargo/bin/racer"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"


" Functions
if ( $TERM == "xterm-256color" || $TERM == "screen-256color" )
	set t_Co=256
	" Enable powerline too
	set rtp+=/usr/share/powerline/bindings/vim/
endif
autocmd StdinReadPre * let s:std_in=1
" If vim enters into an empty buffer, open with Nerdtree opened
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" If Nerdtree is the only buffer left, close it automatically
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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

" Setup base16 config
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
