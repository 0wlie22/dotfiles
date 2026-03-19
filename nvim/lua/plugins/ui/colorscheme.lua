---@type LazySpec
return {
    -- Colorschemes
    -- {
    --     "folke/tokyonight.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         -- load the colorscheme here
    --         vim.cmd([[colorscheme tokyonight-night]])
    --     end,
    -- },
    {
    	"Shatur/neovim-ayu",
    	config = function()
    		vim.cmd([[colorscheme ayu-mirage]])
    	end,
    },

    -- {
    --     "nvim-lualine/lualine.nvim",
    --     dependencies = {
    --         "nvim-tree/nvim-web-devicons",
    --     },
    --     opts = {},
    -- },
}
