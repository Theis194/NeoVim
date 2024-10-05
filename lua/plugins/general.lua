return {
    { 
        "catppuccin/nvim", 
        name = "catppuccin", 
        priority = 1000,
        config = function()
            require("catppuccin").setup()
        end
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    -- Replace with your desired formatters
                    null_ls.builtins.formatting.prettier, -- For JavaScript, TypeScript, etc.
                    null_ls.builtins.formatting.stylua,   -- For Lua
                    null_ls.builtins.formatting.rustfmt,  -- For Rust
                    -- Add formatters for other languages as needed
                },
            })
        end
    },
    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                plugins = {
                    spelling = {
                        enabled = true,
                    },
                },
            }
        end
    },
}
