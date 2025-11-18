return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = { 'php', 'vue', 'html', 'javascript' },
                highlight = {
                    enable = true,
                },
                indent = {
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
