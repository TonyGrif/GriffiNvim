--[
-- Yet Another Neovim Configuration
--
-- Requirements:
--  * Neovim >= 0.10.0
--  * Git >= 2.19.0
--  * C compiler in path (treesitter)
--  * Libstdc++ (treesitter)
--  * ripgrep (telescope)
--]

require("core.globals")
require("core.options")
require("core.mappings")
require("core.autocmds")

require("lazyvim")
