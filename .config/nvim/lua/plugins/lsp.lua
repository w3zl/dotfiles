return {
    {
        'neovim/nvim-lspconfig',
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            -- Configure diagnostics
            vim.diagnostic.config({
                virtual_text = true,
                update_in_insert = false,
                signs = true,
                underline = true,
            })

            -- Set LSP logging level to debug
            vim.lsp.set_log_level("debug")

            -- Load necessary module
            local util = require("lspconfig.util")

            lspconfig.volar.setup{
              capabilities = capabilities,
              filetypes = { "vue" },
              init_options = {
                typescript = {
                  tsdk = "/usr/lib/node_modules/typescript/lib",
                },
              }
            }

            lspconfig.ts_ls.setup({
                capabilities = capabilities,
                filetypes = { "javascript", "typescript", },
            })

            lspconfig.intelephense.setup({
              capabilities = capabilities,
            })
        end,
    }
}
