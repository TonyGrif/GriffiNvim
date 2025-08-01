return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "lua",
        "python",
        "vim",
        "vimdoc",
      },
      sync_install = false,
      auto_install = false,
      highlight = { enable = true, },
    }
  end,
}
