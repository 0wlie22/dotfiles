return {
	{
		"iamcco/markdown-preview.nvim",
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

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
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				padding = true,
			})
		end,
	},

	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	},
	{
		"sindrets/diffview.nvim",
		cmd = "DiffviewOpen",
		dependencies = { "nvim-web-devicons" },
		opts = {
			default_args = {
				DiffviewOpen = { "-uno" },
			},
			hooks = {
				diff_buff_read = function()
					vim.opt_local.colorcolumn = ""
				end,
			},
		},
	},
}
