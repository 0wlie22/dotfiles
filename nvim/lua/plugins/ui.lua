return {
	-- Colorscheme
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
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").load()
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
	{
		"sidebar-nvim/sidebar.nvim",
		opts = {
			open = false,
			hide_on_resize = true,
		},
	},
	{
		"nvim-neorg/neorg",
		version = "v6.*",
		cmd = { "Neorg" },
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {},
				["core.export"] = {},
				["core.dirman"] = {
					config = {
						workspaces = {
							personal = "~/notes",
						},
						default_workspace = "personal",
					},
				},
				["core.completion"] = {
					config = {
						engine = "nvim-cmp",
					},
				},
				["core.presenter"] = {
					config = {
						zen_mode = "zen-mode",
					},
				},
			},
		},
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
	{
		"sindrets/diffview.nvim",
		config = function()
			require("diffview").setup()
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
