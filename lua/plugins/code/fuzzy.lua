return {
  "nvim-telescope/telescope.nvim", tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]iles" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "via [G]rep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[B]uffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[H]elp" })
  end,
}
