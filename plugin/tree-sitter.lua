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

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		if ev.data.spec.name == "nvim-treesitter" and ev.data.kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

local config = require("nvim-treesitter.config")
config.setup({
	ensure_installed = {
		"c",
		"lua",
		"javascript",
		"typescript",
		"html",
		"css",
		"rust",
		"markdown",
		"markdown_inline",
		"c_sharp",
		"razor",
	},
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
