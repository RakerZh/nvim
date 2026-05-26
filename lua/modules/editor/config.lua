local config = {}

function config.telescope()
  require('telescope').setup({
    defaults = {
      file_ignore_patterns = { '%.git/', '%.log$', 'node_modules/', 'build/', '%.DS_Store' },
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
    pickers = {
      find_files = {
        hidden = true,
        no_ignore = true,
      },
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

function config.vimtex()
  vim.g.vimtex_view_method = 'skim'
  vim.g.vimtex_compiler_method = 'latexmk'
  vim.g.vimtex_compiler_latexmk = {
    options = {
      '-shell-escape',
      '-synctex=1',
      '-interaction=nonstopmode',
    },
    engines = {
      _ = '-pdf',
      pdflatex = '-pdf',
      lualatex = '-lualatex',
      xelatex = '-xelatex',
    },
  }
  -- Default engine is pdflatex. Override per-project with modeline:
  --   % !TEX program = xelatex
  --   % !TEX program = lualatex
  -- Or set a global default engine:
  -- vim.g.vimtex_compiler_latexmk_engines = { ['_'] = '-xelatex' }
end

function config.smart_splits()
  local splits = require('smart-splits')

  vim.keymap.set('n', '<C-h>', splits.move_cursor_left)
  vim.keymap.set('n', '<C-j>', splits.move_cursor_down)
  vim.keymap.set('n', '<C-k>', splits.move_cursor_up)
  vim.keymap.set('n', '<C-l>', splits.move_cursor_right)

  vim.keymap.set('n', '<M-h>', splits.resize_left)
  vim.keymap.set('n', '<M-j>', splits.resize_down)
  vim.keymap.set('n', '<M-k>', splits.resize_up)
  vim.keymap.set('n', '<M-l>', splits.resize_right)
end

return config
