-- [[ Easy Escape ]]
vim.keymap.set("i", "jk", "<ESC>")

-- [[ File Explorer ]]
vim.keymap.set("n", "<leader>.", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- [[ Remove Highlight ]]
vim.keymap.set("n", "<ESC>", "<cmd>nohlsearch<CR>")

-- [[ Window Naviagation ]]
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
