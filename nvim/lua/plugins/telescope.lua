return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-web-devicons",
			"nvim-telescope/telescope-file-browser.nvim",
		},
		opts = function()
			local actions = require("telescope.actions")
			local action_layout = require("telescope.actions.layout")
			return {
				defaults = {
					mappings = {
						i = {
							-- ["<esc>"] = actions.close,
							["<C-u>"] = false,
							["<M-p>"] = action_layout.toggle_preview,
						},
						n = {
							["<M-p>"] = action_layout.toggle_preview,
						},
					},
				},
				extensions_enable = { "file_browser" },
				extensions = {
					file_browser = {
						theme = "dropdown",
						hijack_netrw = true,
					},
				},
			}
		end,
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)
			for _, ext in pairs(opts.extensions_enable) do
				telescope.load_extension(ext)
			end
		end,
	},
}
