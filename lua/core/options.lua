-- [[ Clipboard ]]
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

-- [[ Color ]]
vim.opt.termguicolors = true

-- [[ Mouse ]]
vim.opt.mouse = "a"

-- [[ Save ]]
vim.opt.confirm = true
vim.opt.swapfile = true
vim.opt.undofile = true
vim.opt.updatetime = 250

-- [[ Searching ]]
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- [[ Spacing ]]
vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

-- [[ Substitutions ]]
vim.opt.inccommand = "split"

-- [[ Splits ]]
vim.opt.splitright = true
vim.opt.splitbelow = true

-- [[ Typing ]]
vim.opt.timeoutlen = 300

-- [[ UI ]]
vim.opt.cursorline = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.signcolumn = "auto"
vim.opt.showmode = true
vim.opt.wrap = false
