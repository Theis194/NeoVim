print(vim.fn.stdpath("config"))
-- Load enviornment variables
require("load_env")

-- Load settings
require("config.options")

-- Load plugins
require("core.lazy")

-- Load lsps
require("core.lsp")

-- Load keymaps
require("config.keymaps")

-- Load auto commands
require("config.autocmds")

-- Set colorscheme
vim.cmd.colorscheme("catppuccin")
