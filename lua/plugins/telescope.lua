return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind [G]rep" })
    vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind [W]ord" })

    -- BUGGED: vim.keymap.set("n", "<leader>lr", builtin.lsp_references, { desc = "[L]sp [R]eferences" })
    vim.keymap.set("n", "<leader>ld", builtin.diagnostics, { desc = "[L]sp [D]iagnositcs" })

    vim.keymap.set("n", "<leader>vc", builtin.commands, { desc = "[V]im [C]ommands" })
    vim.keymap.set("n", "<leader>vh", builtin.help_tags, { desc = "[V]im [H]elp" })
    vim.keymap.set("n", "<leader>vm", builtin.marks, { desc = "[V]im [M]arks" })
    vim.keymap.set("n", "<leader>vq", builtin.quickfix, { desc = "[V]im [Q]uickfix" })
    vim.keymap.set("n", "<leader>vr", builtin.registers, { desc = "[V]im [R]egisters" })

    vim.keymap.set("n", "<leader>C", builtin.colorscheme, { desc = "[C]olorschemes" })
  end,
}
