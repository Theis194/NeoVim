vim.pack.add({
	"https://github.com/windwp/nvim-ts-autotag",
	"https://github.com/nvim-treesitter/nvim-treesitter",
})

require("nvim-ts-autotag").setup({
	opts = {
		enable_close = true,
		enable_rename = true,
		enable_close_on_slash = false,
	},
})

local config = require("nvim-treesitter.config")
config.setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
	auto_install = true,
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = {
			"razor",
		},
	},
	indent = { enable = true },
})

vim.treesitter.language.register("c_sharp", "cs")
vim.treesitter.language.register("c_sharp", "csharp")
