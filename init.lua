print(vim.fn.stdpath("config"))
-- Load enviornment variables
require("load_env")

-- Load settings
require("config.options")

-- Load lsps
require("core.lsp")

-- Load auto commands
require("config.autocmds")
