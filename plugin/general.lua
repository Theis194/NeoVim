vim.pack.add({
	"https://github.com/nvim-mini/mini.icons",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvimtools/none-ls.nvim",
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/NvChad/nvim-colorizer.lua",
	"https://github.com/olimorris/persisted.nvim",
	"https://github.com/OXY2DEV/markview.nvim",
})

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettier, -- JS, TS
		null_ls.builtins.formatting.stylua, -- Lua
		null_ls.builtins.formatting.dxfmt, -- Rust
	},
})
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

require("nvim-autopairs").setup({
	check_ts = true,
})

require("colorizer").setup({
	user_default_options = {
		RGB = true, -- #RGB hex codes
		RRGGBB = true, -- #RRGGBB hex codes
		names = false, -- "red", "blue" color names
		RRGGBBAA = true, -- #RRGGBBAA hex codes
		rgb_fn = true, -- CSS rgb() and rgba() functions
		hsl_fn = true, -- CSS hsl() and hsla() functions
		css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
		css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
		mode = "background", -- foreground, background
		tailwind = false, -- Enable tailwind colors
	},
})

require("persisted").setup({
	save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"),
	silent = true,
	use_git_branch = true,
	default_branch = "main",
	autosave = true,
	autoload = true,
})
vim.keymap.set("n", "<leader>ss", "<cmd>SessionSave<cr>")
vim.keymap.set("n", "<leader>sl", "<cmd>SessionLoad<cr>")

local presets = require("markview.presets")
require("markview").setup({
	markdown = {
		headings = presets.headings.glow,
	},
})
