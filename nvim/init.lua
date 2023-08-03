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

-- General keybindings
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("i", "<C-c>", "<Esc>", opts)

-- Telescope keybindings
vim.api.nvim_set_keymap("n", "ff", [[<cmd>lua require("telescope.builtin").find_files()<CR>]], opts)
vim.api.nvim_set_keymap("n", "fg", [[<cmd>lua require("telescope.builtin").live_grep()<CR>]], opts)
vim.api.nvim_set_keymap("n", "fb", [[<cmd>lua require("telescope.builtin").buffers()<CR>]], opts)
vim.api.nvim_set_keymap("n", "fh", [[<cmd>lua require("telescope.builtin").help_tags()<CR>]], opts)

-- Null ls formatting keybindings
vim.api.nvim_set_keymap("n", "<leader>f", [[<cmd>lua vim.lsp.buf.format()<CR>]], opts)

-- Sidebar keybindings
vim.api.nvim_set_keymap("n", "<leader>o", [[<cmd>SidebarNvimToggle<CR>]], opts)

-- Plugins
require("lazy").setup("plugins")
require("md-to-pdf")
