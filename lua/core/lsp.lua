vim.lsp.enable({
    "rust_analyzer",
    "lua_ls",
    -- "hls",
    -- "eslint",
    -- "ts_ls",
    "denols",
    "html",
    "tailwindcss",
    "roslyn_ls",
})

vim.diagnostic.config({
    virtual_lines = false,
    virtual_text = false,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true, -- Show source of diagnostic
        header = "",   -- Remove the "Diagnostics:" header
        prefix = function(diagnostic)
            local icons = {
                [vim.diagnostic.severity.ERROR] = " ",
                [vim.diagnostic.severity.WARN] = " ",
                [vim.diagnostic.severity.INFO] = " ",
                [vim.diagnostic.severity.HINT] = " ",
            }
            return icons[diagnostic.severity]
        end,
        format = function(diagnostic)
            if diagnostic.source then
                return string.format("%s [%s]", diagnostic.message, diagnostic.source)
            end
            return diagnostic.message
        end,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        }
    }
})
