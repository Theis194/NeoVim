return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = { { "windwp/nvim-ts-autotag" }, },
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = {
                    "c",
                    "lua",
                    "javascript",
                    "typescript",
                    "html",
                    "css",
                    "rust"
                },
                ignore_install = {},
                modules = {},
                auto_install = true,
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        config = function()
            require("nvim-ts-autotag").setup({
                opts = {
                    enable_close = true,
                    enable_rename = true,
                    enable_close_on_slash = false,
                },
            })
        end,
    },
}
