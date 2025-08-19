return {

    { "christoomey/vim-system-copy" },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            notify = false,
        },
    },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("todo-comments").setup({
                signs = true,
            })
        end,
    },

    {
        "jvdmeulen/json-fold.nvim",
        config = function()
            require("json-fold").setup()

            -- keybinding for the min (un-)fold actions
            vim.api.nvim_set_keymap("n", "<leader>jc", ":JsonFoldFromCursor<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<leader>jd", ":JsonUnfoldFromCursor<CR>", { noremap = true, silent = true })

            -- keybinding for the max (un-)fold actions
            vim.api.nvim_set_keymap("n", "<leader>jC", ":JsonMaxFoldFromCursor<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap(
                "n",
                "<leader>jD",
                ":JsonMaxUnfoldFromCursor<CR>",
                { noremap = true, silent = true }
            )
        end,
    },
}
