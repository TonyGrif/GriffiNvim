---@module 'lazy'
---@type LazySpec
return {
  'nvim-telescope/telescope.nvim',
  enabled = true,
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function() return vim.fn.executable 'make' == 1 end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('telescope').setup {
      extensions = {
        ['ui-select'] = { require('telescope.themes').get_dropdown() },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require 'telescope.builtin'
    local actions = require 'telescope.actions'
    local action_state = require 'telescope.actions.state'
    local finders = require 'telescope.finders'
    local pickers = require 'telescope.pickers'
    local conf = require('telescope.config').values

    local builtin_colorscheme_exceptions = {
      -- Add Neovim default colorschemes here to keep them in the picker.
      -- default = true,
      -- habamax = true,
    }

    local function is_builtin_colorscheme(path)
      local runtime = vim.env.VIMRUNTIME
      if not runtime then return false end

      local normalized_path = vim.fs.normalize(path)
      local normalized_runtime = vim.fs.normalize(runtime)
      return normalized_path == normalized_runtime
        or vim.startswith(normalized_path, normalized_runtime .. '/')
    end

    local function colorscheme_name(path)
      return vim.fn.fnamemodify(path, ':t:r')
    end

    local function colorscheme_files()
      local files = vim.list_extend(
        vim.api.nvim_get_runtime_file('colors/*.lua', true),
        vim.api.nvim_get_runtime_file('colors/*.vim', true)
      )

      local lazy = package.loaded['lazy.core.util']
      if lazy and lazy.get_unloaded_rtp then
        local paths = lazy.get_unloaded_rtp ''
        local unloaded = vim.fn.globpath(table.concat(paths, ','), 'colors/*.{lua,vim}', true, true)
        vim.list_extend(files, unloaded)
      end

      return files
    end

    local function available_colorschemes()
      local seen, colors = {}, {}

      for _, path in ipairs(colorscheme_files()) do
        local name = colorscheme_name(path)
        local allowed_builtin = builtin_colorscheme_exceptions[name]

        if not seen[name] and (allowed_builtin or not is_builtin_colorscheme(path)) then
          seen[name] = true
          table.insert(colors, name)
        end
      end

      table.sort(colors)
      return colors
    end

    local function colorscheme_picker(opts)
      opts = opts or {}

      local before_background = vim.o.background
      local before_color = vim.api.nvim_exec2('colorscheme', { output = true }).output
      local restore_color = true

      local picker = pickers.new(opts, {
        prompt_title = 'Plugin Colorschemes',
        finder = finders.new_table { results = available_colorschemes() },
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr)
          actions.select_default:replace(function()
            local selection = action_state.get_selected_entry()
            if not selection then return end

            restore_color = false
            actions.close(prompt_bufnr)
            vim.cmd.colorscheme(selection.value)
          end)

          return true
        end,
      })

      local close_windows = picker.close_windows
      picker.close_windows = function(status)
        close_windows(status)
        if restore_color then
          vim.o.background = before_background
          vim.cmd.colorscheme(before_color)
        end
      end

      local set_selection = picker.set_selection
      picker.set_selection = function(self, row)
        set_selection(self, row)
        local selection = action_state.get_selected_entry()
        if selection then vim.cmd.colorscheme(selection.value) end
      end

      picker:find()
    end

    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set({ 'n', 'v' }, '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sC', colorscheme_picker, { desc = '[S]earch [C]olorschemes' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader>sc', builtin.commands, { desc = '[S]earch [C]ommands' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('telescope-lsp-attach', { clear = true }),
      callback = function(event)
        local buf = event.buf
        vim.keymap.set('n', 'grr', builtin.lsp_references, { buffer = buf, desc = '[G]oto [R]eferences' })
        vim.keymap.set('n', 'gri', builtin.lsp_implementations, { buffer = buf, desc = '[G]oto [I]mplementation' })
        vim.keymap.set('n', 'grd', builtin.lsp_definitions, { buffer = buf, desc = '[G]oto [D]efinition' })
        vim.keymap.set('n', 'gO', builtin.lsp_document_symbols, { buffer = buf, desc = 'Open Document Symbols' })
        vim.keymap.set('n', 'gW', builtin.lsp_dynamic_workspace_symbols, { buffer = buf, desc = 'Open Workspace Symbols' })
        vim.keymap.set('n', 'grt', builtin.lsp_type_definitions, { buffer = buf, desc = '[G]oto [T]ype Definition' })
      end,
    })

    vim.keymap.set('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep { grep_open_files = true, prompt_title = 'Live Grep in Open Files' }
    end, { desc = '[S]earch [/] in Open Files' })

    vim.keymap.set('n', '<leader>sn', function() builtin.find_files { cwd = vim.fn.stdpath 'config' } end, { desc = '[S]earch [N]eovim files' })
  end,
}
