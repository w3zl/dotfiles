-- Plugins
require('packer').startup(function()
    -- Nerd Tree
    use 'preservim/nerdtree'

    -- Airline
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'

    -- Transparency
    use {'xiyaowong/transparent.nvim', run = ':TransparentEnable'}

    -- LSP and Completion
    use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin  

    -- Syntax Highlighting
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    -- Themes
    use 'scottmckendry/cyberdream.nvim'
    use 'gruvbox-community/gruvbox'
    use 'EdenEast/nightfox.nvim'
end)

-- Theme
vim.cmd [[colorscheme cyberdream]]

-- Settings
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.hidden = true
vim.o.backspace = 'indent,eol,start'
vim.o.exrc = true
vim.o.hlsearch = false
vim.o.errorbells = false
vim.o.laststatus = 2
vim.o.swapfile = false
vim.o.backup = false
vim.o.scrolloff = 15
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.fileformat = 'unix'
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.clipboard = 'unnamedplus'
vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'

-- Mappings
vim.api.nvim_set_keymap('n', '<CR>', 'o<Esc>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-w>', ':bd<CR>', {noremap = true})

-- NERDTree config
vim.g.NERDTreeQuitOnOpen = 1
vim.g.NERDTreeMinimalUI = 1
vim.api.nvim_set_keymap('n', '<C-t>', ':NERDTreeToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-f>', ':NERDTreeFind<CR>', {noremap = true})

-- Airline settings
vim.g.airline_theme = 'gruvbox'
vim.g.airline_extensions_tabline_enabled = 1
vim.g.airline_extensions_tabline_fnamemode = ':t'
vim.api.nvim_set_keymap('n', '<C-h>', ':bp<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', ':bn<CR>', {noremap = true})

-- Lua configurations for Treesitter, LSP, and CMP
    --require('treesitter_config')
    -- require('lsp_config')
    -- require('cmp_config')
