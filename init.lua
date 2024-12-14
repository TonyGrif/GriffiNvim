--[[

 ██████╗ ██████╗ ██╗███████╗███████╗██╗███╗   ██╗██╗   ██╗██╗███╗   ███╗
██╔════╝ ██╔══██╗██║██╔════╝██╔════╝██║████╗  ██║██║   ██║██║████╗ ████║
██║  ███╗██████╔╝██║█████╗  █████╗  ██║██╔██╗ ██║██║   ██║██║██╔████╔██║
██║   ██║██╔══██╗██║██╔══╝  ██╔══╝  ██║██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
╚██████╔╝██║  ██║██║██║     ██║     ██║██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
 ╚═════╝ ╚═╝  ╚═╝╚═╝╚═╝     ╚═╝     ╚═╝╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝

Requirements:
  Git (https://www.git-scm.com/)
  C Compiler (https://gcc.gnu.org/)
  RipGrep (https://github.com/BurntSushi/ripgrep)
  GNU Make (https://www.gnu.org/software/make/)

LSP Requirements:
  Cargo (https://github.com/rust-lang/cargo)
  Python3 (https://www.python.org/)
  NPM (https://www.npmjs.com/)

Optional Requirements:
  Nerd Font (https://www.nerdfonts.com/)

--]]

require("core")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  spec = {
    {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
      init = function()
        vim.cmd.colorscheme("catppuccin-mocha")
      end,
    },
    { import = "plugins.ui", },
    { import = "plugins.code" },
  },
  change_detection = { enabled = false, },
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})
