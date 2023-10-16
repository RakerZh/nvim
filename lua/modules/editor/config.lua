local config = {}

function config.auto_pairs()
  require('nvim-autopairs').setup({
    map_cr = false,
  })
end

function config.lua_snip()
  local ls = require('luasnip')
  ls.config.set_config({
    delete_check_events = 'TextChanged,InsertEnter',
  })
  require('luasnip.loaders.from_vscode').lazy_load({
    paths = { './snippets/' },
  })
end

function config.telescope()
  require('telescope').setup({
    defaults = {
      file_ignore_patterns = { 'build' },
      prompt_prefix = '  ',
      selection_caret = ' ',
      layout_config = {
        horizontal = { prompt_position = 'top', results_width = 0.6 },
        vertical = { mirror = false },
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
      ['ui-select'] = {
        require('telescope.themes').get_dropdown({}),
      },
    },
  })
  require('telescope').load_extension('fzy_native')
  require('telescope').load_extension('dotfiles')
  require('telescope').load_extension('gosource')
  require('telescope').load_extension('file_browser')
  require('telescope').load_extension('ui-select')
  require('telescope').load_extension('zoxide')
end

function config.nvim_colorizer()
  require('colorizer').setup()
  exec_filetype('ColorizerSetup')
end

function config.nvim_treesitter()
  vim.opt.foldmethod = 'expr'
  vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
  require('nvim-treesitter.configs').setup({
    ensure_installed = {
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
      'gowork',
      'graphql',
      'html',
      'sql',
      'markdown',
      'markdown_inline',
      'json',
      'jsonc',
      'java',

      'cmake',
      'cuda',
      'dart',
      'git_config',
      'git_rebase',
      'kotlin',
      'latex',
      'r',
      'solidity',
      'toml',
      'tsx',
    },
    indent = {
      enable = true,
    },
    highlight = {
      enable = true,
    },
  })
end

return config
