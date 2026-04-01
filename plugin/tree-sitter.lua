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

-- On file open, check if there already exists a parser for the filetype
vim.api.nvim_create_autocmd("FileType", {
	callback = function(ev)
		local lang = vim.treesitter.language.get_lang(ev.match)
		if not lang then
			return
		end

		local ok = pcall(vim.treesitter.language.inspect, lang)
		if not ok then
			require("nvim-treesitter.install").install(lang)
		end
	end,
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
