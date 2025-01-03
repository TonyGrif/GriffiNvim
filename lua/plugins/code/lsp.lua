return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "hrsh7th/cmp-nvim-lsp" },
  },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

    local lsps = {
      -- Bash Server
      "bashls",

      -- Lua Server
      "lua_ls",

      -- Nix Server
      "nil_ls",

      -- Python Servers
      "pyright",
      "ruff",

      -- Rust Servers
      "rust_analyzer",

      -- Typst Server
      "tinymist"
    }

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = lsps,
      handlers = {
        function(server_name)
          local server = lsps[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require("lspconfig")[server_name].setup(server)
        end,

        lua_ls = function()
          require("lspconfig").lua_ls.setup({
            settings = {
              Lua = {
                runtime = {
                  version = "LuaJIT",
                },
                workspace = {
                  checkThirdParty = false,
                  library = {
                    vim.env.VIMRUNTIME
                  },
                },
              },
            },
          })
        end,
      },
    })
  end,
}
