local conf = require('modules.ui.config')

-- package({
--   'akinsho/bufferline.nvim',
--   version = 'v3.*',
--   config = conf.bufferline,
--   dependencies = 'nvim-tree/nvim-web-devicons',
-- })

-- packadd({
--   'norcalli/nvim-colorizer.lua',
--   event = 'VimEnter',
-- })

packadd({
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = conf.dashboard,
})

packadd({
  'RakerZh/whiskyline.nvim',
  event = { 'BufReadPost */*', 'BufNewFile' },
  config = function()
    require('modeline').setup()
  end,
})

packadd({
  'nvimdev/flybuf.nvim',
  cmd = 'FlyBuf',
  config = function()
    require('flybuf').setup({})
  end,
})

packadd({
  'lewis6991/gitsigns.nvim',
  event = { 'BufRead', 'BufNewFile' },
  config = conf.gitsigns,
})

packadd({ 'mechatroner/rainbow_csv', ft = 'csv' })

packadd({
  'folke/todo-comments.nvim',
  dependencies = { { 'nvim-lua/plenary.nvim' } },
  config = conf.todo,
})

packadd({
  'nvimdev/indentmini.nvim',
  event = 'BufEnter */*',
  config = function()
    require('indentmini').setup({})
  end,
})

-- package({
-- 'glepnir/galaxyline.nvim',
-- config = conf.galaxyline,
-- dependencies = { 'nvim-tree/nvim-web-devicons' },
-- })

packadd({
  'RakerZh/nordic.nvim',
  config = conf.nordic,
  dev = true,
})

-- packadd({
--   'nvimdev/nightsky.vim',
--   config = function()
--     vim.cmd('colorscheme nightsky')
--   end,
-- })
