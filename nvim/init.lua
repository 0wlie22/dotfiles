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
require("opts")

-- Plugins
require("lazy").setup("plugins")
require("md-to-pdf")

-- Keybindings
require("keybindings")

vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("FormatOptions", { clear = true }),
	pattern = "*",
	callback = function()
		vim.opt.formatoptions:remove("a") -- Disable auto formatting
		vim.opt.formatoptions:remove("t") -- Don't auto-wrap text
		vim.opt.formatoptions:append("c") -- Auto-wrap comments
		vim.opt.formatoptions:append("q") -- Allow formatting comments with gq
		vim.opt.formatoptions:remove("o") -- Don't insert comment leader when formatting
		vim.opt.formatoptions:append("r") -- Continue comments when pressing Enter
		vim.opt.formatoptions:append("n") -- Recognize numbered lists, when formatting
		vim.opt.formatoptions:append("j") -- Remove comment leader when joining lines
		vim.opt.formatoptions:remove("2") -- Don't use the indent of the second line
	end,
})
