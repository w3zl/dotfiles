call plug#begin('~/.config/nvim/autoload/plugged')
    "Nerd Tree
    Plug 'preservim/nerdtree'

    "Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    ""AutoComplete
    Plug 'neovim/nvim-lspconfig' " -- Collection of configurations for built-in LSP client
    Plug 'hrsh7th/nvim-cmp' " -- Autocompletion plugin
    Plug 'hrsh7th/cmp-nvim-lsp' "  -- LSP source for nvim-cmp
    Plug 'saadparwaiz1/cmp_luasnip' " -- Snippets source for nvim-cmp
    Plug 'L3MON4D3/LuaSnip' " -- Snippets plugin  

    "Syntax Highliting
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    "Themes
    Plug 'gruvbox-community/gruvbox'
    Plug 'EdenEast/nightfox.nvim'
call plug#end()

if filereadable('./.vim')
    source ./.vim
endif

syntax on
set nu relativenumber
set tabstop=4 softtabstop=4 
set hidden " hidden buffer (no write)
"set nowrap
set backspace=indent,eol,start

set exrc
set nohlsearch  
set errorbells
set laststatus=2
set noswapfile
set nobackup
set scrolloff=15
set shiftwidth=4
set autoindent
set fileformat=unix
set expandtab 
set smartindent

let mapleader = " "

" Clipboard 'y'
set clipboard+=unnamedplus
nnoremap d "_d
vnoremap d "_d

" Encoding
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8

"Indentation
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Auto Sudo
autocmd BufWritePre * silent! call CheckSudo()

" KeyBinds
nmap <CR> o<Esc> 
map <C-s> :w<CR>
map <C-w> :bd<CR> "Deletes buffer (tab)

" Split?
nmap <leader><Up> :wincmd k<CR>
nmap <leader><Down> :wincmd j<CR>
nmap <leader><Left> :wincmd h<CR>
nmap <leader><Right> :wincmd l<CR>

" Nerd Tree
let NERDTreeQuitOnOpen=1
let g:NERDTreeMinimalUI=1
nmap <F2> :NERDTreeToggle<CR>

" Tabs Buffer Settings form Airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemode=':t'
nmap <C-h> :bp<CR>
nmap <C-l> :bn<CR>

" Look of Terminal
colorscheme nordfox
let g:airline_theme='gruvbox'

"" Language Servers
silent! autocmd! filetypedetect BufRead,BufNewFile *.tf
autocmd BufRead,BufNewFile *.hcl set filetype=hcl
autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl
autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform
autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json

let g:terraform_fmt_on_save=1
let g:terraform_align=1

lua <<EOF

    require'nvim-treesitter.configs'.setup {
        highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        },
    }   

    -- Add additional capabilities supported by nvim-cmp
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    
    local lspconfig = require('lspconfig')
    require'lspconfig'.terraformls.setup{}
    require'lspconfig'.tflint.setup{}
    
    -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
    local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        -- on_attach = my_custom_on_attach,
        capabilities = capabilities,
      }
    end
    
    -- luasnip setup
    local luasnip = require 'luasnip'
    
    -- nvim-cmp setup
    local cmp = require 'cmp'
    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
        ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
        -- C-b (back) C-f (forward) for snippet placeholder navigation.
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      },
    } 
EOF
