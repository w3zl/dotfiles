return {
    {
        'neovim/nvim-lspconfig',
        config = function()
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

            -- Configure Volar LSP for Vue and JavaScript
            require('lspconfig').volar.setup{
                init_options = {
                    typescript = {
                        tsdk = '/home/w3zL/node_modules/typescript/lib',
                    },
                    vue = {
                        hybridMode = false,
                    },
                    languageFeatures = {
                        diagnostics = true,
                    },
                },
            }

            -- Intelephense LSP for PHP
            require'lspconfig'.intelephense.setup{}
        end,
    }
}
