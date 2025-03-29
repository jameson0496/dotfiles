return {
    -- plugins should be installed in the order mason, mason-lspconfig, nvim-lspconfig
    {
        "neovim/nvim-lspconfig",
        -- dependencies = {
        --     "williamboman/mason.nvim",
        --     "williamboman/mason-lspconfig.nvim",
        -- },
        lazy = false,
        config = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

            -- require("mason").setup()
            -- require("mason-lspconfig").setup {
            --     -- ensure_installed = { "lua_ls", "pyright" },
            -- }
            require("lspconfig").lua_ls.setup {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {'vim'}
                        }
                    }
                },
            }
            require("lspconfig").pyright.setup {
                capabilities = capabilities,
            }
            require("lspconfig").nixd.setup {
                capabilities = capabilities,
            }
        end,
    },

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        lazy = false,
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },
                --completion = {
                --    autocomplete = false
                --},
                sources = {
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                },
            })
        end,
    },
}
