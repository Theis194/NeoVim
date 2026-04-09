vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
})

require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "node_modules" },
	},
})
