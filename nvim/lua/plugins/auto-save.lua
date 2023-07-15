return {
	{
		"Pocco81/auto-save.nvim",
		config = function()
			require("auto-save").setup({
				enabled = true,

				execution_message = {
					message = function()
						return ("File saved: " .. vim.fn.strftime("%H:%M:%S"))
					end,
					dim = 0.2,
					cleaning_interval = 2000,
				},

				trigger_events = { "InsertLeave", "TextChanged" },

				condition = function(buf)
					local fn = vim.fn
					local utils = require("auto-save.utils.data")

					if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
						if fn.getbufvar(buf, "&filetype") == "lua" then
							return false -- Don't save .lua files
						end
						return true -- Met condition(s), can save
					end
					return false -- Can't save
				end,
			})
		end,
		write_all_buffers = false,
		debounce_delay = 135,
	},
}
