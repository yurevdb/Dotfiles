"Plugins to install
call plug#begin()

"Theme and airline goodness
Plug 'dracula/vim'
Plug 'itchyny/lightline.vim'

"Editor stuff
Plug 'editorconfig/editorconfig-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"Useful extra's
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'

call plug#end()

" Remapping Keys
inoremap jj <Esc>
nnoremap ; :
function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_slash)
    return "\<C-X>\<C-O>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  endif
endfunction
inoremap <tab> <c-r>=Smart_TabComplete()<CR>

"Simple Settings
set number relativenumber
set ruler
set noswapfile
set nowrap
syntax on
set tabstop=4
set shiftwidth=4
set expandtab

"Colorscheme
color dracula
set termguicolors

"Lightline
let g:lightline = { 'colorscheme': 'Dracula',}

"Nerdtree
map <C-o> :NERDTreeToggle<CR>

" Deoplete
let g:deoplete#enable_at_startup = 1
