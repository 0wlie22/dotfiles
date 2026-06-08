return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-web-devicons",
			"leafo/magick",
			"nvim-telescope/telescope-file-browser.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		opts = function()
			local actions = require("telescope.actions")
			local action_layout = require("telescope.actions.layout")
			local find_files_theme = require("telescope.themes").get_ivy({
				winblend = 30,
				prompt = "",
				previewer = true,
				layout_config = {
					width = 0.8,
					height = 0.8,
				},
			})
			return {
				defaults = {
					mappings = {
						i = {
							["<C-u>"] = false,
							["<M-p>"] = action_layout.toggle_preview,
						},
						n = {
							["<M-p>"] = action_layout.toggle_preview,
						},
					},
				},
				pickers = {
					find_files = vim.tbl_extend("force", find_files_theme, {
						hidden = true,
						no_ignore = false,
						previewer = true,
						file_ignore_patterns = {
							"^.git/",

							-- Node
							"node_modules/",
							"^%.angular/",

							-- Python
							"^venv/",
							"^%.venv/",
							"__pycache__/",
							"%.pytest_cache/",
							"%.ruff_cache/",
							"%.pyc",

							-- Terraform
							"%.terraform/",
							"%.terraform%.lock%.hcl",
							"%.terragrunt.cache/",

							-- Java
							"%.class",

							-- Zsh
							"%.zwc",
							"%.zwc%.old",
						},
					}),
					buffers = {
						show_all_buffers = true,
						ignore_current_buffer = true,
						sort_lastused = true,
						sort_mru = true,
						mappings = {
							i = {
								["<C-d>"] = actions.delete_buffer + actions.move_to_top,
							},
						},
					},
					live_grep = {
						additional_args = { "--hidden" },
					},
				},
				extensions_enable = { "file_browser", "fzf" },
				extensions = {
					file_browser = {
						theme = "ivy",
						hijack_netrw = true,
						collapse_dirs = true,
                        git_status = false,
					},
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
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
