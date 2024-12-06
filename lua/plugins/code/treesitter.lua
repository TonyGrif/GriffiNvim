return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "nix", "python", "vim", "vimdoc" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = false },
      })
    end
  },
}
