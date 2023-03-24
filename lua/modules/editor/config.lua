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
end

function config.smart_input()
  local filters = require('mutchar.filters')
  require('mutchar').setup({
    ['c'] = {
      rules = { '-', '->' },
      filter = filters.non_space_before,
    },
    ['cpp'] = {
      rules = {
        { ',', ' <!>' },
        { '-', '->' },
      },
      filter = {
        filters.generic_in_cpp,
        filters.non_space_before,
      },
    },
    ['rust'] = {
      rules = {
        { ';', ': ' },
        { '-', '->' },
        { ',', '<!>' },
      },
      filter = {
        filters.semicolon_in_rust,
        filters.minus_in_rust,
        filters.generic_in_rust,
      },
      one_to_one = true,
    },
    ['go'] = {
      rules = {
        { ';', ' :=' },
        { ',', ' <-' },
      },
      filter = {
        filters.find_diagnostic_msg({ 'initial', 'undeclare' }),
        filters.go_arrow_symbol,
      },
      one_to_one = true,
    },
  })

  --[[require('mutchar').setup({
    ['go'] = { ';', ':=', ';' },
    ['lua'] = { '!', '~=', '!' },
    ['rust'] = { '90', '::', '90' },
  })]]
end

function config.nvim_treesitter()
  vim.opt.foldmethod = 'expr'
  vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

  local ignored = {
    'phpdoc',
    'astro',
    'beancount',
    'bibtex',
    'bluprint',
    'eex',
    'embedded_template',
    'vala',
    'wgsl',
    'verilog',
    'twig',
    'turtle',
    'm68k',
    'hocon',
    'lalrpop',
    'meson',
    'mehir',
    'rasi',
    'rego',
    'racket',
    'pug',
    'java',
  }

  require('nvim-treesitter.configs').setup({
    ensure_installed = 'all',
    ignore_install = ignored,
    highlight = {
      enable = true,
    },
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
    },
  })
end

return config
