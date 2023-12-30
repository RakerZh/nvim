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
      file_previewer = require('telescope.previewers').vim_buffer_cat.new,
      grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
      qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
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
  require('telescope').load_extension('dotfiles')
  require('telescope').load_extension('cheat')
  -- require('telescope').load_extension('gosource')
  -- require('telescope').load_extension('file_browser')
end

function config.nvim_colorizer()
  require('colorizer').setup()
end

function config.nvim_treesitter()
  vim.opt.foldmethod = 'expr'
  vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
  require('nvim-treesitter.configs').setup({
    indent = {
      enable = true,
    },
    highlight = {
      enable = true,
    },
  })
end

return config
