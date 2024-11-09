return {
    --themes
    { 'scottmckendry/cyberdream.nvim', config = function() vim.cmd.colorscheme('cyberdream') end },
    { 'gruvbox-community/gruvbox' },
    { 'EdenEast/nightfox.nvim' },

    --misc
    {'xiyaowong/transparent.nvim', run = ':TransparentEnable'},
}
