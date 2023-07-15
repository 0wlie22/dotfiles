return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		enabled = true,
		opts = {
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 75,
				keymap = {
					accept = "<C-j>",
					accept_word = "<C-w>",
					accept_line = "<C-v>",
					next = "<C-h>",
					prev = "<C-l>",
					dismiss = "<C-e>",
				},
			},
			panel = {
				enabled = false,
			},
		},
		config = function(_, opts)
			require("copilot").setup(opts)
		end,
	},
}
