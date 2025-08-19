return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				-- For .tpl files add yaml parser
				highlight = {
					enable = true,
					disable = function(_, buf)
						local max_filesize = 100 * 1024 -- 100 KiB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,
				},
				indent = {
					enable = true,
				},
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {
			enable = true,
			max_lines = 3,
			min_window_height = 32,
			line_numbers = true,
			multiline_threshold = 20,
			trim_scope = "outer",
			mode = "cursor", -- "cursor" or "topline"
			separator = nil,
			zindex = 20,
		},
		config = function(_, opts)
			require("treesitter-context").setup(opts)
			vim.api.nvim_set_hl(0, "TreesitterContextBottom", { sp = "Gray" })
			vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { sp = "Gray" })
		end,
	},
}
