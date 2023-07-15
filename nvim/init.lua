local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Options
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.textwidth = 100
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Keybindings
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("i", "<C-c>", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>f", [[<cmd>lua require("stylua-nvim").format_file()<CR>]], opts)

-- Plugins
require("lazy").setup("plugins")
require("md-to-pdf")
