return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local config = {}

		-- View settings
		config.view = {}
		config.view.width = 40
		config.view.side = "right"
		config.view.adaptive_size = true

		config.filters = {}
		config.filters.dotfiles = true

		config.git = {}
		config.git.enable = true

		require("nvim-tree").setup(config)
	end,
}
