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

  db.session_directory = home .. '/.cache/nvim/session'
  -- db.preview_command = 'cat | lolcat -F 0.05 '
  db.custom_header = {
    '',
    '  █████╗ ███████╗ █████╗ ██╗  ██╗██╗   ██╗     ██╗███╗   ██╗██╗   ██╗██╗  ██╗ ',
    ' ██╔══██╗██╔════╝██╔══██╗██║  ██║██║   ██║     ██║████╗  ██║██║   ██║╚██╗██╔╝ ',
    ' ███████║███████╗███████║███████║██║   ██║     ██║██╔██╗ ██║██║   ██║ ╚███╔╝ ',
    ' ██╔══██║╚════██║██╔══██║██╔══██║██║   ██║     ██║██║╚██╗██║██║   ██║ ██╔██╗ ',
    ' ██║  ██║███████║██║  ██║██║  ██║██║   ███████╗██║██║ ╚████║╚██████╔╝██╔╝ ██╗ ',
    ' ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝   ╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝ ',
    '',
  }

  -- db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
  db.preview_file_height = 12
  db.preview_file_width = 80
  db.custom_center = {
    {
      icon = '  ',
      icon_hl = { fg = z.red },
      desc = 'Update Plugins                          ',
      shortcut = 'SPC p u',
      action = 'PackerUpdate',
    },
    {
      icon = '  ',
      icon_hl = { fg = z.yellow },
      desc = 'Recently opened files                   ',
      action = 'Telescope oldfiles',
      shortcut = 'SPC f h',
    },
    {
      icon = '  ',
      icon_hl = { fg = '#dce3e5' },
      desc = 'Find  File                              ',
      action = 'Telescope find_files find_command=rg,--hidden,--files',
      shortcut = 'SPC f f',
    },
    {
      icon = '  ',
      icon_hl = { fg = z.blue },
      desc = 'File Browser                            ',
      action = 'Telescope file_browser',
      shortcut = 'SPC f b',
    },
    {
      icon = '  ',
      icon_hl = { fg = '#e6653a' },
      desc = 'Find  word                              ',
      aciton = 'Telescope live_grep',
      shortcut = 'SPC f w',
    },
    {
      icon = '  ',
      icon_hl = { fg = z.redwine },
      desc = 'Open Personal dotfiles                  ',
      action = 'Telescope dotfiles path=' .. home .. '/.dotfiles',
      shortcut = 'SPC f d',
    },
    {
      icon = '  ',
      icon_hl = { fg = z.yellow },
      desc = 'Change working directory                ',
      action = 'Telescope zoxide',
      shortcut = 'SPC f q',
    },
    {
      icon = '  ',
      icon_hl = { fg = z.gray },
      desc = 'Show keymaps                            ',
      action = 'Telescope keymaps',
      shortcut = 'SPC f k',
    },
    {
      icon = 'ﰖ  ',
      icon_hl = { fg = z.violet },
      desc = 'Search   commits                       ',
      action = 'Telescope git_commits',
      shortcut = 'SPC f g',
    },
  }
  -- local count = require('lazy').stats().count
  -- local load = '   "/==/' .. ' loaded ' .. '/==/   ' .. count .. '   /==/ plugins/==/"'
  -- vim.cmd('highlight DashboardFooter guifg=#cad3e6')

  --   '    /==/loaded  /==/   45   /==/plugins /==/
  -- db.custom_footer = {
  --   [["`-:-.   ,-;"`-:-.   ,-;"`-:-.   ,-;"`-:-.  ,-;"]],
  --   [[ "`=`,'=/     `=`,'=/     `=`,'=/     `=`,'=/"]],
  --   load,
  --   [[ ",=,-<=`.    ,=,-<=`.    ,=,-<=`.    ,=,-<=`."]],
  --   [[",-'-'   `-=_,-'-'   `-=_,-'-'   `-=_,-'-'   `-=_"]],
  -- }
  vim.cmd('highlight DashboardCenter guifg=#9fb2ca')
  vim.cmd('highlight DashboardHeader guifg=#ed733b')
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
    -- TEST:
    -- FIX:
    -- TODO:
    -- WARN:
    -- PERF:
    --
    -- NOTE:
    -- INFO:
    --
    -- PASSED:
    -- FAILED:
    -- Link:
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
