vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "/home/w3zL/Documents/Partner/*",
    callback = function()
        require("lazy").load({ plugins = { "vim-arsync" } })
    end,
})
