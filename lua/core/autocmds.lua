-- [[ Highligh Yank ]]
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- [[ LSP Commands ]]
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-commands", { clear = true }),
  callback = function(e)
    local opts = { buffer = e.buf }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  end,
})

-- [[ Spacing ]]
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("double-spaced-langs", { clear = true }),
  pattern = { "lua", "nix" },
  callback = function()
    vim.opt.autoindent = true
    vim.opt.breakindent = true
    vim.opt.expandtab = true
    vim.opt.shiftwidth = 2
    vim.opt.softtabstop = 2
    vim.opt.tabstop = 2
  end,
})
