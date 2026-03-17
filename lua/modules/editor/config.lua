local config = {}

function config.telescope()
  require('telescope').setup({
    defaults = {
      file_ignore_patterns = { 'build' },
      prompt_prefix = '  ',
      selection_caret = ' ',
      layout_strategy = 'horizontal',
      layout_config = {
        prompt_position = 'top',
        height = 24,
        width = 0.8,
        -- horizontal = { prompt_position = 'top', results_width = 0.6 },
        -- vertical = { mirror = false },
      },
      sorting_strategy = 'ascending',
    },
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      },
      zoxide = {
        prompt_title = '>_ ZOXIDE',
      },
    },
  })
  pcall(require('telescope').load_extension, 'dotfiles')
  pcall(require('telescope').load_extension, 'fzy_native')
  pcall(require('telescope').load_extension, 'zoxide')
  -- require('telescope').load_extension('cheat')
  -- require('telescope').load_extension('gosource')
  -- require('telescope').load_extension('file_browser')
end

function config.nvim_treesitter()
  local ts = require('nvim-treesitter')

  ts.setup({})
  ts.install({
    'c',
    'cpp',
    'rust',
    'zig',
    'lua',
    'go',
    'python',
    'proto',
    'typescript',
    'javascript',
    'tsx',
    'bash',
    'css',
    'scss',
    'diff',
    'dockerfile',
    'gomod',
    'gosum',
    'graphql',
    'html',
    'sql',
    'markdown',
    'markdown_inline',
    'json',
    'vimdoc',
    'vim',
    'cmake',
  }, { summary = false })

  vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('ts_highlight', { clear = true }),
    callback = function(ev)
      local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(ev.buf))
      if ok and stats and stats.size > 500 * 1024 then
        return
      end
      pcall(vim.treesitter.start)
    end,
  })
end

function config.nvim_treesitter_textobjects()
  require('nvim-treesitter-textobjects').setup({
    select = {
      lookahead = true,
    },
  })

  local select = require('nvim-treesitter-textobjects.select')
  vim.keymap.set({ 'x', 'o' }, 'af', function()
    select.select_textobject('@function.outer', 'textobjects')
  end)
  vim.keymap.set({ 'x', 'o' }, 'if', function()
    select.select_textobject('@function.inner', 'textobjects')
  end)
  vim.keymap.set({ 'x', 'o' }, 'ac', function()
    select.select_textobject('@class.outer', 'textobjects')
  end)
  vim.keymap.set({ 'x', 'o' }, 'ic', function()
    select.select_textobject('@class.inner', 'textobjects')
  end)
end

return config
