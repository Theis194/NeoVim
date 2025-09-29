return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "rust_analyzer",
                },
                automatic_installation = false,
            })
        end,
    },
    --[[
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local on_attach = function(client, bufnr)
                local opts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

                -- Show diagnostics in a floating window
                vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

                -- Navigate diagnostics
                vim.keymap.set("n", "[d", function()
                    vim.diagnostic.jump({ count = -1, float = true })
                end, opts)

                vim.keymap.set("n", "]d", function()
                    vim.diagnostic.jump({ count = 1, float = true })
                end, opts)
            end

            local lsp_dir = vim.fn.stdpath("config") .. "/lua/lsp"
            for _, file in ipairs(vim.fn.readdir(lsp_dir, [[v:val =~ '\.lua$'\]\])) do
                local server = file:gsub("%.lua$", "")
                local setup = require("lsp." .. server)
                setup(on_attach, capabilities)
            end
        end,
    },]]

}
