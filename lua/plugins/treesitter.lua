---@module 'lazy'
---@type LazySpec
return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  config = function()
    -- Parser installation is handled by NixOS (see home-manager config).
    -- Prefer system parsers over stale parser artifacts in lazy's plugin dir.
    local seen = {}
    for _, parser in ipairs(vim.api.nvim_get_runtime_file('parser/*.so', true)) do
      local language = vim.fs.basename(parser):gsub('%.so$', '')
      if seen[language] then goto continue end
      seen[language] = true

      local parsers = vim.api.nvim_get_runtime_file('parser/' .. language .. '.so', true)
      local lazy_parser = '/lazy/nvim-treesitter/parser/'

      if #parsers > 1 and parsers[1]:find(lazy_parser, 1, true) then
        for _, system_parser in ipairs(parsers) do
          if not system_parser:find(lazy_parser, 1, true) then
            pcall(vim.treesitter.language.add, language, { path = system_parser })
            break
          end
        end
      end

      ::continue::
    end

    vim.api.nvim_create_autocmd('FileType', {
      callback = function(args)
        local buf, filetype = args.buf, args.match
        local language = vim.treesitter.language.get_lang(filetype)
        if not language then return end
        if not pcall(vim.treesitter.language.add, language) then return end
        if not pcall(vim.treesitter.start, buf, language) then return end
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
