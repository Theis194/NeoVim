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
                    "rust",
                    "markdown",
                    "markdown_inline",
                    "c_sharp",
                    "razor",
                },
                ignore_install = {},
                modules = {},
                auto_install = true,
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,

        vim.treesitter.language.register("c_sharp", "cs"),
        vim.treesitter.language.register("c_sharp", "csharp"),
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
