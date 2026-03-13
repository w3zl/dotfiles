vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

vim.o.hidden = true
vim.o.backspace = 'indent,eol,start'
vim.o.exrc = true
vim.o.hlsearch = false
vim.o.errorbells = false
vim.o.laststatus = 2
vim.o.swapfile = false
vim.o.backup = false
vim.o.scrolloff = 15
vim.o.autoindent = true
vim.o.fileformat = 'unix'
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.clipboard = 'unnamedplus'
vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.o.undofile = true
vim.o.undodir = vim.fn.expand "~/.cache/nvim/undo"

vim.o.autoread = true

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true


