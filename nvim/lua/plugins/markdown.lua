return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"kiran94/edit-markdown-table.nvim",
		config = true,
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		cmd = "EditMarkdownTable",
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = "markdown",
		dependencies = {
			-- "3rd/image.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			mkdp_port = 8000,
		},
	},
	-- {
	-- 	"3rd/image.nvim",
	-- 	dependencies = {
	-- 		"leafo/magick",
	-- 	},
	-- 	opts = {
	-- 		integrations = {
	-- 			markdown = {
	-- 				only_render_image_at_cursor = true,
	-- 			},
	-- 		},
	-- 	},
	-- },
}
