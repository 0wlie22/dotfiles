return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = true,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "neodev.nvim",
        },

        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.pyright.setup({})
            lspconfig.gopls.setup({})
            lspconfig.custom_elements_ls.setup({})
            lspconfig.yamlls.setup({})
            lspconfig.clangd.setup({
                capabilities = vim.tbl_extend("force", vim.lsp.protocol.make_client_capabilities(), {
                    offsetEncoding = { "utf-16" },
                }),
            })
            lspconfig.groovyls.setup({
                -- set LSP to Jenkinsfile
                filetypes = { "groovy", "Jenkinsfile" },
            })
            lspconfig.dockerls.setup({})
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })
        end,
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        opts = function()
            local null_ls = require("null-ls")
            local formatting = null_ls.builtins.formatting
            local diagnostics = null_ls.builtins.diagnostics

            null_ls.setup({
                debug = false,
                sources = {
                    formatting.stylua,
                    formatting.black,
                    formatting.isort,
                    formatting.goimports,
                    formatting.beautysh,
                    formatting.clang_format,
                    formatting.prettier,
                    diagnostics.pylint,
                    diagnostics.shellcheck,
                },
            })
        end,
    },

    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        opts = {},
    },

    {
        "folke/neodev.nvim",
        opts = {
            library = {
                types = true,
            },
        },
    },
}
