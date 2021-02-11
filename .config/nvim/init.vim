call plug#begin('~/.vim/plugged')
    Plug 'mbbill/undotree'
    Plug 'hlissner/zsh-autopair'
    Plug 'sheerun/vim-polyglot'
    Plug 'ycm-core/YouCompleteMe'
    Plug 'gruvbox-community/gruvbox'
    Plug 'sjl/badwolf'
    Plug 'joshdick/onedark.vim'
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'ervandew/supertab'
    Plug 'preservim/nerdtree'
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'vim-scripts/indentpython.vim'
"   Plug 'majutsushi/tagbar'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-thems'
    Plug 'vim-scripts/AutoComplPop'
    Plug 'davidhalter/jedi-vim'
call plug#end()
let mapleader = " "
syntax on

set exrc
set nohlsearch  
set hidden 
set errorbells
set nu relativenumber
set nowrap
set laststatus=2
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set scrolloff=15
set tabstop=4 softtabstop=4 
set shiftwidth=4
set autoindent
set fileformat=unix
set expandtab 
set smartindent
set backspace=indent,eol,start

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
map <leader><Down> :wincmd j<CR>
nmap <leader><Left> :wincmd h<CR>
nmap <leader><Right> :wincmd l<CR>
nmap <leader>u :UndotreeShow<CR>


" file browser
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeMinimalUI = 1
let NerdTreeQuitOnOpen = 1
map <leader>f :NERDTreeToggle<CR>
map <F2> :NERDTreeToggle<CR>

" python auto complete

" tags
map <leader>t :TagbarToggle<CR>

" Tabs Buffer Settings form Airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemode=':t'
nmap <leader>1 :bp<CR>
nmap <leader>2 :bn<CR>


" look of Terminal
colorscheme gruvbox
let g:airline_theme='gruvbox'
set background=dark

highlight Normal guibg=none ctermbg=NONE

