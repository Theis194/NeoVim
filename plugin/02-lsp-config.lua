vim.pack.add({
	"https://github.com/williamboman/mason.nvim",
	"https://github.com/williamboman/mason-lspconfig.nvim",
	"https://github.com/Civitasv/cmake-tools.nvim",
	"https://github.com/tris203/rzls.nvim",
	"https://github.com/seblyng/roslyn.nvim",
})

require("mason").setup({
	registries = {
		"github:mason-org/mason-registry",
		"github:Crashdummyy/mason-registry",
	},
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
	},
	automatic_installation = false,
})

require("cmake-tools").setup({})

require("rzls").setup({})

require("roslyn").setup({
	filewatching = "roslyn",
	choose_target = nil,
	ignore_target = nil,
	broad_search = false,
	lock_target = false,
	silent = false,
})
