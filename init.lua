--[[

 ██████╗ ██████╗ ██╗███████╗███████╗██╗███╗   ██╗██╗   ██╗██╗███╗   ███╗
██╔════╝ ██╔══██╗██║██╔════╝██╔════╝██║████╗  ██║██║   ██║██║████╗ ████║
██║  ███╗██████╔╝██║█████╗  █████╗  ██║██╔██╗ ██║██║   ██║██║██╔████╔██║
██║   ██║██╔══██╗██║██╔══╝  ██╔══╝  ██║██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
╚██████╔╝██║  ██║██║██║     ██║     ██║██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
 ╚═════╝ ╚═╝  ╚═╝╚═╝╚═╝     ╚═╝     ╚═╝╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝

Yet another NeoVim configuration

--]]

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("globals")
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
    { import = "plugins.ui", },
    { import = "plugins.learning" },
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
