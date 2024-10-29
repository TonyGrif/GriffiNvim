return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      keywords = {
        FIX = { icon = vim.g.have_nerd_font and " " or " " },
        TODO = { icon = vim.g.have_nerd_font and " " or " " },
        HACK = { icon = vim.g.have_nerd_font and " " or " " },
        WARN = { icon = vim.g.have_nerd_font and " " or " " },
        PERF = { icon = vim.g.have_nerd_font and " " or " " },
        NOTE = { icon = vim.g.have_nerd_font and " " or " " },
        TEST = { icon = vim.g.have_nerd_font and "⏲ " or " " },
      },
    },
  },
}
