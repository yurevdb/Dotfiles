"Plugins to install
call plug#begin()
Plug 'dracula/vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

"Remapping Keys
inoremap jj <Esc>

"Simple Settings
set number relativenumber
set ruler
set noswapfile
set nowrap

syntax on

"Colorscheme
color dracula
set termguicolors

"Airline
let g:airline_powerline_fonts = 1
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_section_y = ''
let g:airline_section_warning = ''

