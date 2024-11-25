return {
  "jay-babu/mason-null-ls.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    local linters = {
      "mypy",
    }

    require("mason-null-ls").setup({
      ensure_installed = linters
    })

    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.mypy,
      },
    })
  end,
}
