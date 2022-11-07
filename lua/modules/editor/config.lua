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
      prompt_prefix = '🔭 ',
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
  })
end

function config.nvim_treesitter()
  vim.api.nvim_command('set foldmethod=expr')
  vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')
  require('nvim-treesitter.configs').setup({
    sync_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
    },
    rainbow = {
      enable = true,
      -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil, -- Do not enable for files with more than n lines, int
      -- colors = {}, -- table of hex strings
      -- termcolors = {} -- table of colour name strings
    },
    autotag = {
      enable = true,
      filetypes = { 'html', 'xml' },
    },
    indent = { enable = true },
    textobjects = {
      select = {
        enable = true,
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          -- ["ia"] = "@attribute.inner",
          -- ["aa"] = "@attribute.outer",

          ['iB'] = '@block.inner',
          ['aB'] = '@block.outer',

          ['c'] = '@call.inner', -- all call args
          ['C'] = '@call.outer',

          ['ic'] = '@class.inner',
          ['ac'] = '@class.outer',

          ['ii'] = '@conditional.inner', -- if
          ['ai'] = '@conditional.outer', -- if

          ['aF'] = '@frame.inner',
          ['iF'] = '@frame.outer',

          ['if'] = '@function.inner', -- function
          ['af'] = '@function.outer', -- funiction

          ['il'] = '@loop.inner', -- loop
          ['al'] = '@loop.outer', -- loop

          ['ia'] = '@parameter.inner', -- args
          ['aa'] = '@parameter.outer', -- args

          ['/'] = '@comment.outer',
          -- ["is"] = "@scopename.inner",
          ['is'] = '@statement.outer', -- statement
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ['<A-.>'] = '@function.outer',
          ['<C-.>'] = '@class.outer',
        },
        goto_next_end = {
          ['<A-e>'] = '@function.outer',
          ['<C-e>'] = '@class.outer',
        },
        goto_previous_start = {
          ['<A-,>'] = '@function.outer',
          ['<C-,>'] = '@class.outer',
        },
        goto_previous_end = {
          ['<A-E>'] = '@function.outer',
          ['<C-P>'] = '@class.outer',
        },
      },
    },
  })
end

return config
