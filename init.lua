print(vim.fn.stdpath("config"))
-- Load enviornment variables
require("load_env")

-- Load settings
require("config.options")

-- Load plugins
require("plugins")

-- Load keymaps
require("config.keymaps")
