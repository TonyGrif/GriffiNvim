---@module 'lazy'
---@type LazySpec
return {
  'stevearc/oil.nvim',
  dependencies = {
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  keys = {
    { '<leader>.', function() require('oil').open() end, desc = 'Open Oil' },
  },
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
}
