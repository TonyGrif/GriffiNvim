--[
-- Yet Another Neovim Configuration
--
-- Requirements:
--  * Neovim >= 0.8.0 (lazy.vim)
--  * Git >= 2.19.0 (lazy.vim)
--  * C compiler in path (treesitter)
--  * Libstdc++ (treesitter)
--]

require("core.globals")
require("core.options")
require("core.mappings")
require("core.autocmds")

require("lazyvim")
