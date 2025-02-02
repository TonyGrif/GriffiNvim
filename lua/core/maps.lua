-- [[ Easy Escape ]]
vim.keymap.set("i", "jk", "<ESC>")

-- [[ Diagnostic ]]
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "[P]revious message" })
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "[N]ext message" })
vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, { desc = "Show [E]rror messages" })
vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "[Q]uickfix list" })

-- [[ File Explorer ]]
-- vim.keymap.set("n", "<leader>E", "<cmd>Explore<CR>", { desc = "Open File [E]xplorer" })
-- See 'lua/plugins/code/explorer' for new binding

-- [[ Navigation ]]
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- [[ Searching ]]
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove highlight from hlsearch" })
