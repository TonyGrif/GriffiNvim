return {
  {
    "xiyaowong/transparent.nvim",
    config = function()
      vim.keymap.set("n", "<leader>tT", "<cmd>TransparentToggle<CR>", { desc = "[T]ransparent background", })
    end,
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      vim.keymap.set("n", "<leader>tz", "<cmd>ZenMode<CR>", { desc = "[Z]en Mode" })
    end,
  },
  {
    "folke/twilight.nvim",
    config = function()
      vim.keymap.set("n", "<leader>tt", "<cmd>Twilight<CR>", { desc = "[T]wilight" })
    end,
  },
}
