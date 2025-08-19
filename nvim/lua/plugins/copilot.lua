return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        enabled = true,
        opts = {
            suggestion = {
                enabled = true,
                auto_trigger = true,
                debounce = 75,
                keymap = {
                    accept = "<C-j>",
                    accept_word = "<C-w>",
                    accept_line = "<C-v>",
                    next = "<C-l>",
                    prev = "<C-h>",
                    dismiss = "<C-e>",
                },
            },
            panel = {
                enabled = false,
            },
            filetypes = {
                yaml = true,
            },
        },
        config = function(_, opts)
            require("copilot").setup(opts)
            vim.g.copilot_proxy = vim.fn.getenv("ftp_proxy")
            vim.g.copilot_proxy_strict_ssl = false
        end,
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        lazy = false,
        dependencies = {
            { "zbirenbaum/copilot.lua" },
            { "nvim-lua/plenary.nvim" },
        },

        opts = {},
    },
}
