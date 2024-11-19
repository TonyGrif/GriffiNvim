-- [[ Yank ]]
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Lua ]]
vim.api.nvim_create_autocmd({"VimEnter", "BufReadPre", "FileType"}, {
  desc = "Set settings for lua files",
  group = vim.api.nvim_create_augroup("lang-lua", { clear = true }),
  pattern = "*.lua",
  callback = function()
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
  end,
})

-- [[ Nix ]]
vim.api.nvim_create_autocmd({"VimEnter", "BufReadPre", "FileType"}, {
  desc = "Set settings for nix files",
  group = vim.api.nvim_create_augroup("lang-nix", { clear = true }),
  pattern = "*.nix",
  callback = function()
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
  end,
})
