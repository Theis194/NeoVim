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

-- Copilot
map("n", "<leader>cc", ":CopilotChatOpen<CR>", opts)
map("n", "<leader>cd", ":CopilotChatClose<CR>", opts)
map("n", "<leader>cr", ":CopilotChatReset<CR>", opts)
map("n", "<leader>cce", ":CopilotChatExplain<CR>", opts)
