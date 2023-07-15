return {
	{
		"hrsh7th/nvim-cmp",
		opts = {
			event = "InsertEnter",
			config = function()
				require("plugins.cmp").config()
			end,
		},
	},
}
