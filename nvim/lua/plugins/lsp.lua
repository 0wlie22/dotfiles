return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = true,
	},

	{
		"VidocqH/lsp-lens.nvim",
		config = true,
	},
	{
		"b0o/schemastore.nvim",
		lazy = true,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"neodev.nvim",
		},

		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			local servers = {
				pyright = {
					settings = {
						python = {
							analysis = {
								typeCheckingMode = "basic",
							},
						},
					},
				},

				-- basedpyright = {
				-- 	cmd = { "basedpyright-langserver", "--stdio" },
				-- 	analysis = {
				-- 		basedpyright = {
				-- 			analysis = {
				-- 				autoSearchPaths = true,
				-- 				diagnosticsMode = "workspace",
				-- 				useLibraryCodeForTypes = true,
				-- 				autoImportCompletions = true,
				--                             typeCheckingMode = "off",
				-- 			},
				-- 		},
				-- 		diagnosticMode = "openFilesOnly",
				-- 		inlayHints = {
				-- 			callArgumentNames = true,
				-- 		},
				-- 	},
				-- },
				ruff = {
					init_options = {
						settings = {
							logLevel = "debug",
							codeAction = {
								disableRuleComment = {
									enable = true,
									matchPattern = "disableRule",
								},
							},
						},
					},
				},
				gopls = {
                    settings = {
                        gopls = {
                            analyses = {
                                unusedparams = true,
                            },
                            staticcheck = true,
                            gofumpt = true,
                        },
                    },
                },
				lemminx = {},
				jdtls = {
					cmd = { "jdtls" },
					init_options = {
						extendedClientCapabilities = {
							classFileContentsSupport = true,
						},
					},
				},
				-- ltex = {
				-- 	language = "en-US",
				-- },
				yamlls = {
					settings = {
						yaml = {
							schemaStore = {
								enable = true,
								url = "https://www.schemastore.org/api/json/catalog.json",
							},
						},
					},
				},
				jsonls = {
					settings = {
						json = {
							schemas = require("schemastore").json.schemas(),
							validate = { enable = true },
						},
					},
				},
				clangd = {
					capabilities = {
						offsetEncoding = { "utf-8" },
					},
				},
				groovyls = {
					-- cmd = {
					-- 	"java",
					-- 	"-jar",
					-- 	"~/.local/share/nvim/mason/packages/groovy-language-server/build/libs/groovy-language-server-all.jar",
					-- },
					filetypes = { "groovy", "Jenkinsfile" },
				},
				dockerls = {},
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				},
				rust_analyzer = {},
				asm_lsp = {},
				ts_ls = {},
			}

			for server, config in pairs(servers) do
				vim.lsp.config(server, vim.tbl_extend("force", {
					capabilities = capabilities,
					flags = {
						debounce_text_changes = 150,
					},
				}, config))
				vim.lsp.enable(server)
			end
		end,
	},

	{
		"nvimtools/none-ls.nvim",
		opts = function()
			local null_ls = require("null-ls")
			local formatting = null_ls.builtins.formatting
			-- local diagnostics = null_ls.builtins.diagnostics

			null_ls.setup({
				debug = false,
				timeout = 5000,
				sources = {
					formatting.stylua,
					formatting.isort,
					formatting.goimports,
					formatting.clang_format,
					formatting.prettier,
					formatting.npm_groovy_lint,
					-- diagnostics.pylint,
				},
			})
		end,
	},

	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		opts = {},
	},
	{
		"folke/neodev.nvim",
		opts = {},
	},
	-- {
	--     "chikko80/error-lens.nvim",
	--     event = "BufRead",
	--     dependencies = {
	--         "nvim-telescope/telescope.nvim",
	--     },
	--     opts = {},
	-- },

	"vinnymeller/swagger-preview.nvim",
	cmd = { "SwaggerPreview", "SwaggerPreviewStop", "SwaggerPreviewToggle" },
	build = "npm i",
	config = true,
	config = function()
		local swagger_ui_watcher_path = vim.fn.system("which swagger-ui-watcher"):gsub("\n", "")
		require("swagger-preview").setup({
			port = 8000,
			host = "localhost",
		})
	end,
}
