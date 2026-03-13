return {
    {
        'neovim/nvim-lspconfig',
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            local on_attach = function(_, bufnr)
              local opts = { noremap = true, silent = true, buffer = bufnr }
              vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
              vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
              vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
              vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
              vim.keymap.set("n", "K",  vim.lsp.buf.hover, opts)
            end

            -- Configure diagnostics
            vim.diagnostic.config({
                virtual_text = true,
                update_in_insert = false,
                signs = true,
                underline = true,
            })

            -- Set LSP logging level to debug
            vim.lsp.set_log_level("debug")

            lspconfig.ts_ls.setup({
              capabilities = capabilities,
              on_attach = on_attach,
              filetypes = { "javascript", "typescript", "vue"},
              root_dir = lspconfig.util.root_pattern("package.json", "node_modules"),
              init_options = {
                plugins = {
                  {
                    name = "@vue/typescript-plugin",
                    location = "/usr/lib/node_modules/@vue/language-server",
                    languages = { "vue" },
                  },
                },
              },
            })

            lspconfig.volar.setup{
              capabilities = capabilities,
--              on_attach = on_attach,
              filetypes = { "vue" },
              init_options = {
                typescript = {
                  tsdk = "/usr/lib/node_modules/typescript/lib",
                },
                vue = {
                    hybridMode = false,
                }
              }
            }

            --require("typescript-tools").setup({
            --  capabilities = capabilities,
            --  on_attach = on_attach,
            --  filetypes = { "javascript", "typescript" },
            --  settings = {
            --    separate_diagnostic_server = true,
            --    publish_diagnostic_on = "insert_leave",
            --  },
            --})

            lspconfig.tailwindcss.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                filetypes = { "html", "vue", },
            })

            lspconfig.intelephense.setup({
              capabilities = capabilities,
              on_attach = on_attach,
            })

            lspconfig.yamlls.setup({
               capabilities = capabilities,
               on_attach = on_attach,
            })
        end,
    },
    {
      "pmizio/typescript-tools.nvim",
      dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    },
}
