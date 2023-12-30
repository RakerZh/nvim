local conf = require('modules.ui.config')

-- package({
--   'akinsho/bufferline.nvim',
--   version = 'v3.*',
--   config = conf.bufferline,
--   dependencies = 'nvim-tree/nvim-web-devicons',
-- })

-- package({
--   'catppuccin/nvim',
--   name = 'catppuccin',
--   config = function()
--     require('catppuccin').setup({
--       flavour = 'macchiato',
--       color_overrides = {
--         macchiato = {
--           mantle = '#222529',
--         },
--       },
--       integration = {
--         neotree = true,
--         lspsaga = true,
--         Special = true,
--         noice = true,
--       },
--       transparent_background = false,
--       custom_highlights = function()
--         return {
--           TelescopePromptTitle = { fg = '#f5f5f5', bg = '#e06c75', bold = true },
--         }
--       end,
--     })
--     vim.cmd('colorscheme catppuccin')
--   end,
-- })

packadd({
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = conf.dashboard,
})

packadd({
  'RakerZh/whiskyline.nvim',
  config = conf.whisky,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
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

-- packadd({
--   'nvimdev/indentmini.nvim',
--   event = 'BufEnter */*',
--   config = function()
--     require('indentmini').setup({})
--   end,
--   dependencies = { 'nvim-treesitter/nvim-treesitter' },
-- })

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
