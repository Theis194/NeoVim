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
            })
        end,
    },
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
                vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
                vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

                vim.keymap.set("n", "[w", function()
                    vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
                end, opts)

                vim.keymap.set("n", "]w", function()
                    vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
                end, opts)
            end

            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        }
                    }
                }
            })

            vim.lsp.config("rust_analyzer", {
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    ["rust_analyzer"] = {
                        cargo = { allFeatures = true },
                        procMacro = { enabled = true },
                    },
                },
            })
        end,
    },
}
