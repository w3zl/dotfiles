return {
  -- existing themes
  { "gruvbox-community/gruvbox" },
  { "EdenEast/nightfox.nvim" },
  { "scottmckendry/cyberdream.nvim" },
  {
    "sainnhe/sonokai",
    init = function()
      -- choices: "default", "atlantis", "andromeda", "shusia", "maia", "espresso"
      vim.g.sonokai_style = "andromeda"
      vim.g.sonokai_better_performance = 1
      --vim.g.sonokai_enable_italic = 0
      --vim.g.sonokai_disable_italic_comment = 1
      vim.cmd.colorscheme('sonokai')
    end,
  },

    --misc
    {'xiyaowong/transparent.nvim', run = ':TransparentEnable'},
}
