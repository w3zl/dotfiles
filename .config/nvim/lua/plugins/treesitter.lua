return {
    {
      "posva/vim-vue",
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = { 'php', 'vue', 'html', 'javascript', 'lua' },
                highlight = {
                    enable = true,
                },
                indenit = {
                    enable = true,
                },
            })
        end,
    },
    {
      "windwp/nvim-ts-autotag",
      event = "InsertEnter",
      config = function()
        require('nvim-ts-autotag').setup({
            per_filetype = {
              ["html"] = {
                -- enable_close = false
              }
            }
        })
      end,
    },
}
