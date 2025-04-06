return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = vim.g.have_nerd_font,
    },
  },
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {},
  },
  {
    "winston0410/range-highlight.nvim",
    event = { "CmdlineEnter" },
    opts = {},
  },
}
