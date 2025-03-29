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
                            globals = { 'vim' }
                        }
                    }
                },
            }
            require("lspconfig").pyright.setup {
                capabilities = capabilities,
            }
            require("lspconfig").ruff.setup {
                capabilities = capabilities,
            }
            require("lspconfig").nixd.setup {
                capabilities = capabilities,
                settings = {
                    nixd = {
                        nixpkgs = {
                            expr = "import <nixpkgs> { }",
                        },
                        formatting = {
                            command = { "nixfmt" },
                        },
                    }
                },
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
            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and
                    vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end
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
                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                            -- elseif luasnip.expand_or_jumpable() then
                            --   luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<s-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                            -- elseif luasnip.jumpable(-1) then
                            --   luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<c-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = {
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                },
            })
        end,
    },
    -- {
    --     "nvimtools/none-ls.nvim",
    --     dependencies = { "nvim-lua/plenary.nvim" },
    --     lazy = false,
    --     config = function()
    --         local null_ls = require("null-ls")

    --         null_ls.setup({
    --             sources = {
    --                 -- this doesnt work anymore, installing ruff as an lsp worked though.
    --                 -- null_ls.builtins.diagnostics.ruff,
    --             }
    --         })
    --     end
    -- },
}
