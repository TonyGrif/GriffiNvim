return {
  "stevearc/oil.nvim",
  opts = {},
  config = function()
    require("oil").setup({
      keymaps = {
        ["?"] = { "actions.show_help", mode = "n" },

        ["<CR>"] = "actions.select",
        ["<C-v>"] = { "actions.select", opts = { vertical = true } },
        ["<C-x>"] = { "actions.select", opts = { horizontal = true } },
        ["<C-t>"] = { "actions.select", opts = { tab = true } },

        ["<C-p>"] = "actions.preview",
        ["<C-r>"] = "actions.refresh",

        ["<C-c>"] = { "actions.close", mode = "n" },
        ["q"] = { "actions.close", mode = "n" },

        ["."] = { "actions.parent", mode = "n" },
        ["_"] = { "actions.open_cwd", mode = "n" },
        ["`"] = { "actions.cd", mode = "n" },
        ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
        ["gs"] = { "actions.change_sort", mode = "n" },
        ["gx"] = "actions.open_external",
        ["g."] = { "actions.toggle_hidden", mode = "n" },
        ["g\\"] = { "actions.toggle_trash", mode = "n" },
      },
      use_default_keymaps = false,
    })

    -- [[ File Explorer ]]
    vim.keymap.set("n", "<leader>E", "<cmd>Oil<CR>")
  end
}
