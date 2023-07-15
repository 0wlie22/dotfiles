return {
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

	{
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},

	{ "tpope/vim-fugitive" },
	{ "christoomey/vim-system-copy" },

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},

	{
		"kiran94/edit-markdown-table.nvim",
		config = true,
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		cmd = "EditMarkdownTable",
	},

	--{"nvim-telescope/telescope.nvim",},
	--{
	--  "phaazon/hop.nvim",
	--  branch = 'v2',
	--  config = function()
	--    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
	--  end
	--}
}
