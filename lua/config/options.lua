local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs and spaces
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Cursor
opt.scrolloff = 10

-- Auto-format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.lsp.buf.format()
	end,
})

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

