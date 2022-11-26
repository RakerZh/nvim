local config = {}

function config.telescope()
  if not packer_plugins['popup.nvim'].loaded then
    vim.cmd([[packadd popup.nvim]])
    vim.cmd([[packadd plenary.nvim]])
    vim.cmd([[packadd telescope-file-broswer.nvim]])
    vim.cmd([[packadd telescope-fzy-native.nvim]])
    vim.cmd([[packadd telescope-ui-select.nvim]])
    vim.cmd([[packadd telescope-zoxide]])
  end

  require('telescope').setup({
    defaults = {
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
  require('telescope').load_extension('find_template')
  require('telescope').load_extension('zoxide')
end

function config.nvim_colorizer()
  require('colorizer').setup()
end

function config.smart_input()
  require('mcc').setup({
    ['go'] = { ';', ':=', ';' },
    ['lua'] = { '!', '~=', '!' },
    ['rust'] = { '90', '::', '90' },
  })
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

function config.hop()
  local hop = require('hop')
  hop.setup({
    keys = 'etovxqpdygfblzhckisuran',
  })
end

return config
