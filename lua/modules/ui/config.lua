local config = {}

function config.nordic()
  require('nordic').setup({
    telescope = {
      -- Available styles: `classic`, `flat`.
      style = 'classic',
    },
  })
  require('nordic').load()
end

function config.dashboard()
  local db = require('dashboard')

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
  -- vim.cmd('highlight DashboardCenter guifg=#9fb2ca')
  -- vim.cmd('highlight DashboardHeader guifg=#b0465d')
  db.setup({
    theme = 'hyper',
    -- preview = {
    -- },

    config = {
      preview = {},
      project = {
        enable = true,
      },
      -- header = {
      --   '',
      --   '  █████╗ ███████╗ █████╗ ██╗  ██╗██╗   ██╗     ██╗███╗   ██╗██╗   ██╗██╗  ██╗ ',
      --   ' ██╔══██╗██╔════╝██╔══██╗██║  ██║██║   ██║     ██║████╗  ██║██║   ██║╚██╗██╔╝ ',
      --   ' ███████║███████╗███████║███████║██║   ██║     ██║██╔██╗ ██║██║   ██║ ╚███╔╝ ',
      --   ' ██╔══██║╚════██║██╔══██║██╔══██║██║   ██║     ██║██║╚██╗██║██║   ██║ ██╔██╗ ',
      --   ' ██║  ██║███████║██║  ██║██║  ██║██║   ███████╗██║██║ ╚████║╚██████╔╝██╔╝ ██╗ ',
      --   ' ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝   ╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝ ',
      --   '',
      -- },
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
      week_header = {
        enable = true,
      },
    },
  })
end

function config.gitsigns()
  require('gitsigns').setup({
    signs = {
      add = { text = '┃' },
      change = { text = '┃' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
      untracked = { text = '┃' },
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
      NOTE = { icon = ' ', color = '#89CFF0', alt = { 'INFO' } },
      PASSED = { icon = ' ', color = '#6da063', alt = { 'PASS', 'pass' } },
      FAILED = { icon = ' ', color = '#d45d44', alt = { 'FAIL', 'fail' } },
      Ref = { icon = ' ', color = '#5a636b', alt = { 'Link', 'LINK', 'REF', 'link' } },
    },
  })
end

function config.bufferline()
  require('bufferline').setup({})
end

return config
