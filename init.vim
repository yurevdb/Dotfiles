"Plugins to install
call plug#begin()

" Syntax highlighting 
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

"Theme and airline goodness
Plug 'dracula/vim'
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'

"Editor stuff
Plug 'editorconfig/editorconfig-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'

"Useful extra's
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'

call plug#end()

" Remapping Keys
let mapleader=","
inoremap jj <Esc>
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
nnoremap ; :

"Simple Settings
set number relativenumber
set ruler
set noswapfile
set nowrap
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set foldmethod=syntax

"Colorscheme
let g:nord_comment_brightness = 15
colorscheme nord

"Lightline
let g:lightline = { 'colorscheme': 'nord', }

"Nerdtree
map <C-o> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#file#enable_buffer_path = 1
"call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone,preview,noinsert

" Vim racer
set hidden
let g:racer_cmd = "~/.cargo/bin/racer"
let g:racer_experimental_completer = 0

" Vimagit
map <Leader>m :Magit<CR>
