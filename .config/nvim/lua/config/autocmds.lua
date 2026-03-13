
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = {
        "/home/w3zL/Documents/Partner/*",
        "/home/w3zL/Documents/Dict/*",
    },
    callback = function()
        require("lazy").load({ plugins = { "vim-arsync" } })
    end,
})
vim.api.nvim_create_autocmd("BufReadPre", {
  callback = function()
    local path = vim.fn.expand('%:p:h') .. "/.vimrc"
    if vim.fn.filereadable(path) == 1 then
      vim.cmd('source ' .. path)
    end
  end
})

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = "*",
})
