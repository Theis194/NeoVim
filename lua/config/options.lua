local opt = vim.opt

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.nofsync = true

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs and spaces
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Cursor
opt.scrolloff = 10

-- Auto-format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        vim.lsp.buf.format()
    end,
})

if vim.g.env_vars["WINDOWS"] == "true" then
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Tell nvim to use powershell
    vim.o.shell = "powershell"
    vim.o.shellcmdflag =
    "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
    vim.o.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
    vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
    vim.o.shellquote = ""
    vim.o.shellxquote = ""

    opt.clipboard = "unnamedplus"
end

if vim.g.env_vars["WINDOWS"] ~= "true" then
    -- For Linux with Fish shell
    vim.o.shell = "fish"
    vim.o.shellcmdflag = "-c"
    vim.o.shellredir = "> %s 2>&1"
    vim.o.shellpipe = "2>&1 | tee %s"
    vim.o.shellquote = ""
    vim.o.shellxquote = ""

    vim.g.clipboard = {
        name = "wl-clipboard (Wayland)",
        copy = {
            ["+"] = "wl-copy --foreground --type text/plain",
            ["*"] = "wl-copy --foreground --primary --type text/plain",
        },
        paste = {
            ["+"] = "wl-paste --no-newline",
            ["*"] = "wl-paste --no-newline --primary",
        },
        cache_enabled = true,
    }
    opt.clipboard = "unnamedplus"
end
