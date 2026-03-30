vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		if ev.data.spec.name == "telescope-fzf-native.nvim" and ev.data.kind == "install" then
			vim.system({ "make" }, { cmd = ev.data.spec.path })
		end
	end,
})

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
