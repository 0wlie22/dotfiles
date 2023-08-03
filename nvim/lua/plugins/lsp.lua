return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = true,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.pyright.setup({})
			lspconfig.gopls.setup({})
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
		end,
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		opts = function()
			local null_ls = require("null-ls")
			local formatting = null_ls.builtins.formatting
			local diagnostics = null_ls.builtins.diagnostics

			null_ls.setup({
				debug = false,
				sources = {
					formatting.stylua,
					formatting.black,
					formatting.isort,
					formatting.goimports,
					formatting.shfmt,
					diagnostics.shellcheck,
				},
			})
		end,
	},
}
