local config = {}

function config.galaxyline()
  require('modules.ui.eviline')
end

function config.zephyr()
  vim.cmd('colorscheme zephyr')
end

function config.dashboard()
  local home = os.getenv('HOME')
  local db = require('dashboard')
  local z = require('zephyr')

  -- db.custom_header = {
  --   '',
  --   '  █████╗ ███████╗ █████╗ ██╗  ██╗██╗   ██╗     ██╗███╗   ██╗██╗   ██╗██╗  ██╗ ',
  --   ' ██╔══██╗██╔════╝██╔══██╗██║  ██║██║   ██║     ██║████╗  ██║██║   ██║╚██╗██╔╝ ',
  --   ' ███████║███████╗███████║███████║██║   ██║     ██║██╔██╗ ██║██║   ██║ ╚███╔╝ ',
  --   ' ██╔══██║╚════██║██╔══██║██╔══██║██║   ██║     ██║██║╚██╗██║██║   ██║ ██╔██╗ ',
  --   ' ██║  ██║███████║██║  ██║██║  ██║██║   ███████╗██║██║ ╚████║╚██████╔╝██╔╝ ██╗ ',
  --   ' ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝   ╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝ ',
  --   '',
  -- }

  -- db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
  -- db.preview_file_height = 12
  -- db.preview_file_width = 80
  vim.cmd('highlight DashboardCenter guifg=#9fb2ca')
  -- vim.cmd('highlight DashboardHeader guifg=#b0465d')
  require('dashboard').setup({
    theme = 'hyper',
    config = {
      shortcut = {
        {
          desc = '  Directories ',
          group = 'DashboardShortCut',
        },
        {
          desc = '  RakerZh',
          group = 'Delimiter',
        },
      },
    },
    preview = {
      command = 'cat ', -- preview command
      file_path = '~/.config/nvim/static/taoism.cat', -- preview file path
      file_height = 6, -- preview file height
      file_width = 54, -- preview file width
    },
  })
end

function config.gitsigns()
  require('gitsigns').setup({
    signs = {
      add = { hl = 'GitGutterAdd', text = '▋' },
      change = { hl = 'GitGutterChange', text = '▋' },
      delete = { hl = 'GitGutterDelete', text = '▋' },
      topdelete = { hl = 'GitGutterDeleteChange', text = '▔' },
      changedelete = { hl = 'GitGutterChange', text = '▎' },
      untracked = { hl = 'GitGutterAdd', text = '▋' },
    },
    keymaps = {
      -- Default keymap options
      noremap = true,
      buffer = true,

      ['n ]g'] = { expr = true, "&diff ? ']g' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
      ['n [g'] = { expr = true, "&diff ? '[g' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },

      ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
      ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
      ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
      ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',

      -- Text objects
      ['o ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
      ['x ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
    },
  })
end

function config.indent_blankline()
  require('indent_blankline').setup({
    char = '│',
    use_treesitter_scope = true,
    show_first_indent_level = true,
    show_current_context = false,
    show_current_context_start = false,
    show_current_context_start_on_current_line = false,
    filetype_exclude = {
      'dashboard',
      'DogicPrompt',
      'log',
      'fugitive',
      'gitcommit',
      'packer',
      'markdown',
      'json',
      'txt',
      'vista',
      'help',
      'todoist',
      'Neotree',
      'git',
      'TelescopePrompt',
      'undotree',
    },
    buftype_exclude = { 'terminal', 'nofile', 'prompt' },
    context_patterns = {
      'class',
      'function',
      'method',
      'block',
      'list_literal',
      'selector',
      '^if',
      '^table',
      'if_statement',
      'while',
      'for',
    },
  })
end

function config.todo()
  require('todo-comments').setup({
    -- TEST: TESTING, test
    -- FIX: FIXME, BUG, FIXIT, ISSUE, fix
    -- TODO:
    -- WARN:
    -- PERF: OPTIM, PERFORMANCE, OPTIMIZE
    --
    -- NOTE:
    -- INFO:
    --
    -- PASSED: pass PASS
    -- FAILED: FAIL fail
    -- Link: link Ref link
    keywords = {
      FIX = { icon = ' ', color = '#cc3b1d', alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE', 'fix' } },
      PERF = { icon = ' ', color = '#64a9ab', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
      TEST = { icon = ' ', color = 'test', alt = { 'TESTING', 'test' } },
      PASSED = { icon = ' ', color = '#6da063', alt = { 'PASS', 'pass' } },
      FAILED = { icon = ' ', color = '#d45d44', alt = { 'FAIL', 'fail' } },
      Ref = { icon = ' ', color = '#5a636b', alt = { 'Link', 'LINK', 'REF', 'link' } },
    },
  })
end

return config
