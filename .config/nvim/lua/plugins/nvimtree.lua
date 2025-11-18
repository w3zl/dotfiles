return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- Icons for files/folders
    config = function()
      require("nvim-tree").setup({
        
        -- 🌲 File View Settings
        view = {
          width = 30, -- Default width of the tree
          side = "left", -- Position of the tree (left, right)
          adaptive_size = false, -- Keep a fixed width
        },

        -- 🎨 Renderer (Visual tweaks)
        renderer = {
          highlight_opened_files = "name",
          root_folder_label = false,
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true, -- Enable Git status icons
            },
          },
        },

        -- 📌 File Filters
        filters = {
          dotfiles = false,
          custom = { 'node_modules' },
        },

        -- 🟢 Git Integration
        git = {
          enable = true, -- Enable Git decorations
          ignore = true, -- Hide all .gitignored files
          show_on_dirs = false,
        },

        -- ⚡ Actions / Behavior
        actions = {
          open_file = {
            quit_on_open = true, -- Keep NvimTree open after opening a file
            resize_window = true, -- Resize NvimTree when opening files
          },
        },

        update_focused_file = {
          enable = true,
          update_cwd = true,
        },
      })

      --vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true }) -- Toggle NvimTree Shortcut
      vim.keymap.set("n", "<Esc>", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true }) -- Toggle NvimTree Shortcut
      local api = require("nvim-tree.api")
      vim.keymap.set("n", "<CR>", api.node.open.tab, { buffer = bufnr, noremap = true, silent = true, nowait = true }) -- Default newtab

    end
  }
}

