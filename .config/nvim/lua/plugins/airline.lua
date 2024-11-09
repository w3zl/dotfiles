return {
    { 'vim-airline/vim-airline-themes' },
    { 
	'vim-airline/vim-airline',
        config = function()
            vim.g.airline_theme = 'gruvbox'
            vim.g.airline_extensions_tabline_enabled = 1
            vim.g.airline_extensions_tabline_fnamemode = ':t'
            vim.api.nvim_set_keymap('n', '<C-h>', ':bp<CR>', { noremap = true })
            vim.api.nvim_set_keymap('n', '<C-l>', ':bn<CR>', { noremap = true })
        end,
    },
}
