call plug#begin('~/.config/nvim/autoload/plugged')
    "Indentation
    Plug 'vim-scripts/indentpython.vim'

    "Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    "AutoComplete
    "Plug 'sheerun/vim-polyglot'
    "Plug 'ycm-core/YouCompleteMe'
    "Plug 'vim-scripts/AutoComplPop'
    "Plug 'davidhalter/jedi-vim'

    "Themes
    Plug 'gruvbox-community/gruvbox'
    Plug 'EdenEast/nightfox.nvim'
call plug#end()

syntax on
set nu relativenumber
set tabstop=4 softtabstop=4 

set exrc
set nohlsearch  
set hidden 
set errorbells
set nowrap
set laststatus=2
set noswapfile
set nobackup
set scrolloff=15
set shiftwidth=4
set autoindent
set fileformat=unix
set expandtab 
set smartindent
set backspace=indent,eol,start

let mapleader = " "

" Clipboard 'y'
function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
vnoremap y y:call ClipboardYank()<cr>

set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8

autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

" KeyBinds
nmap <CR> o<Esc> 
map <C-s> :w<CR>

nmap <leader><Up> :wincmd k<CR>
nmap <leader><Down> :wincmd j<CR>
nmap <leader><Left> :wincmd h<CR>
nmap <leader><Right> :wincmd l<CR>

" Tabs Buffer Settings form Airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemode=':t'
nmap <leader>1 :bp<CR>
nmap <leader>2 :bn<CR>

" look of Terminal
colorscheme nordfox
let g:airline_theme='gruvbox'
