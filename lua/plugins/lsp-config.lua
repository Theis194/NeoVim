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
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
                ["rust_analyzer"] = function()
                    require("lspconfig").rust_analyzer.setup({
                        capabilities = capabilities,
                        on_attach = function(_, bufnr)
                            local opts = { noremap = true, silent = true, buffer = bufnr }
                            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                        end,
                        settings = {
                            ["rust_analyzer"] = {
                                cargo = { allFeatures = true },
                                procMacro = { enabled = true },
                            },
                        },
                    })
                end,
            })
        end,
    },
}
