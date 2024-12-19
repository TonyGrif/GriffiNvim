return {
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
        { "<leader>d", group = "Diagnostics" },
        { "<leader>f", group = "Find" },
        { "<leader>t", group = "Toggle" },
      })
    end,
  },
}
