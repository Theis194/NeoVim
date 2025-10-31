return {
    {
        "nvimtools/none-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.prettier, -- For JavaScript, TypeScript, etc.
                    null_ls.builtins.formatting.stylua,   -- For Lua
                    null_ls.builtins.formatting.dxfmt,    -- For Rust
                },
            })

            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
        end,
    },
    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup({
                plugins = {
                    spelling = {
                        enabled = true,
                    },
                },
            })
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true,
            })
        end,
    },
    {
        'NvChad/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup({
                user_default_options = {
                    RGB = true,          -- #RGB hex codes
                    RRGGBB = true,       -- #RRGGBB hex codes
                    names = false,       -- "red", "blue" color names
                    RRGGBBAA = true,     -- #RRGGBBAA hex codes
                    rgb_fn = true,       -- CSS rgb() and rgba() functions
                    hsl_fn = true,       -- CSS hsl() and hsla() functions
                    css = true,          -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                    css_fn = true,       -- Enable all CSS *functions*: rgb_fn, hsl_fn
                    mode = 'background', -- foreground, background
                    tailwind = false,    -- Enable tailwind colors
                }
            })
        end
    },
    {
        "olimorris/persisted.nvim",
        config = function()
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
        end,
    },
    {
        "OXY2DEV/markview.nvim",
        lazy = false,
        config = function()
            local presets = require("markview.presets");

            require("markview").setup({
                markdown = {
                    headings = presets.headings.glow,
                },
            })
        end,
        priority = 49,
    },
}
