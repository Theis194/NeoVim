local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local wk = require("which-key")
local builtin = require("telescope.builtin")

wk.add({
    {
        "<leader>n",
        ":NvimTreeToggle<CR>",
        desc = "Toggle NvimTree",
        remap = false,
        silent = true,
    },
    {
        mode = "i",
        { "<C-h>", "<Left>",  hidden = true },
        { "<C-j>", "<Right>", hidden = true },
        { "<C-h>", "<Down>",  hidden = true },
        { "<C-h>", "<Up>",    hidden = true },
    },
    -- Files
    {
        "<leader>f",
        group = "file",
    },
    {
        "<C-p>",
        builtin.find_files,
        desc = "Find files",
    },
    {
        "<leader>fg",
        builtin.live_grep,
        desc = "File grep",
    },
    -- Diagnostics
    {
        "<C-w>d",
        vim.diagnostic.open_float,
        desc = "Line diagnostics",
    },
    {
        "<C-w>D",
        function()
            vim.diagnostic.setqflist({ open = true })
        end,
        desc = "All diagnostics (quickfix)",
    },
    -- Debugger
    {
        "<leader>d",
        group = "Debugger",
        nowait = true,
        remap = false,
    },
    {
        "<leader>dt",
        function()
            require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
        nowait = true,
        remap = false,
    },
    {
        "<leader>dc",
        function()
            require("dap").continue()
        end,
        desc = "Continue",
        nowait = true,
        remap = false,
    },
    {
        "<leader>di",
        function()
            require("dap").step_into()
        end,
        desc = "Step Into",
        nowait = true,
        remap = false,
    },
    {
        "<leader>do",
        function()
            require("dap").step_over()
        end,
        desc = "Step Over",
        nowait = true,
        remap = false,
    },
    {
        "<leader>du",
        function()
            require("dap").step_out()
        end,
        desc = "Step Out",
        nowait = true,
        remap = false,
    },
    {
        "<leader>dr",
        function()
            require("dap").repl.open()
        end,
        desc = "Open REPL",
        nowait = true,
        remap = false,
    },
    {
        "<leader>dl",
        function()
            require("dap").run_last()
        end,
        desc = "Run Last",
        nowait = true,
        remap = false,
    },
    {
        "<leader>dq",
        function()
            require("dap").terminate()
            require("dapui").close()
            require("nvim-dap-virtual-text").toggle()
        end,
        desc = "Terminate",
        nowait = true,
        remap = false,
    },
    {
        "<leader>db",
        function()
            require("dap").list_breakpoints()
        end,
        desc = "List Breakpoints",
        nowait = true,
        remap = false,
    },
    {
        "<leader>de",
        function()
            require("dap").set_exception_breakpoints({ "all" })
        end,
        desc = "Set Exception Breakpoints",
        nowait = true,
        remap = false,
    },
})
