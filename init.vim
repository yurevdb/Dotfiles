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
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'

"Useful extra's
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'
Plug 'Yggdroot/indentLine'

call plug#end()

" Remapping Keys
let mapleader=","
inoremap jj <Esc>
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
nnoremap ; :
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <SPACE> zA

"Simple Settings
set number relativenumber
set cursorline
set ruler
set noswapfile
syntax on

" Formatoptions
au FileType * set fo-=r fo-=o

" Line wrapping
set wrap
set linebreak
set nolist

" Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Folding
set foldmethod=indent
set foldlevel=0

"Colorscheme
let g:nord_comment_brightness = 20
colorscheme nord

"Lightline
let g:lightline = { 'colorscheme': 'nord' }

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

" Snippets
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
