return {
    -- Colorscheme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight-night]])
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = true,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent_blankline_show_first_indent_level = false,
            indent_blankline_show_trailing_blankline_indent = true,
        },
    },

    {
        "sidebar-nvim/sidebar.nvim",
        config = function()
            require("sidebar-nvim").setup({
                open = false,
                hide_on_resize = true,
            })
        end,
    },

    -- Parenthesis
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },

    {
        "HiPhish/nvim-ts-rainbow2",
        config = function()
            require("nvim-treesitter.configs").setup({
                rainbow = {
                    enable = true,
                    extended_mode = true,
                    max_file_lines = 1000,
                },
            })
        end,
    },

    -- Git
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    },

    { "tpope/vim-fugitive" },

    -- Startup screen
    {
        "startup-nvim/startup.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            require("startup").setup()
        end,
    },
}
