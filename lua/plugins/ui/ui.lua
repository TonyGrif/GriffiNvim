return {
  {
    "nvim-tree/nvim-web-devicons",
    enabled = vim.g.have_nerd_font,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
    config = function()
      local wk = require("which-key")
      wk.setup()
      wk.add({
        { "<leader>d", group="Diagnostics" },
        { "<leader>f", group="Files" },
        { "<leader>t", group="Toggle" },
      })
    end,
  },
}
