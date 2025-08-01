return {
  -- TODO: Migrate this to new recommended setup
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    local servers = {
      lua_ls = {
        cmd = "lua-language-server",
        config = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" }
              }
            }
          }
        }
      },
      pyright = {
        cmd = "pyright",
        config = {},
      },
    }

    for server, data in pairs(servers) do
      if vim.fn.executable(data.cmd) == 1 then
        lspconfig[server].setup(data.config)
      end
    end
  end,
}
