vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	{
		src = "https://github.com/nvim-tree/nvim-tree.lua",
		version = vim.version.range("*"),
	},
})

require("nvim-tree").setup({
	view = {
		width = 40,
		side = "right",
		adaptive_size = true,
	},
	filters = {
		dotfiles = true,
	},
	git = {
		enable = true,
	},
})
