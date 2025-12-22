local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Toggle nvim tree
map("n", "<leader>n", ":NvimTreeToggle<CR>", opts)

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

-- Insert mode movement
map("i", "<C-h>", "<Left>", opts)
map("i", "<C-l>", "<Right>", opts)
map("i", "<C-j>", "<Down>", opts)
map("i", "<C-k>", "<Up>", opts)

-- Show diagnostics in a floating window
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Line diagnostics' })

-- Navigate diagnostics
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })

-- Show all diagnostics in a floating window
vim.keymap.set('n', '<leader>D', function()
    vim.diagnostic.setqflist({ open = true })
end, { desc = 'All diagnostics (quickfix)' })
