local package = require('core.pack').package
local conf = require('modules.ui.config')

-- package({
--   'glepnir/flipped.nvim',
-- })

-- package({
--   'glepnir/zephyr-nvim',
--   config = conf.zephyr,
-- })

-- package({
--   'AlexvZyl/nordic.nvim',
--   config = conf.nordic,
-- })

package({
  'catppuccin/nvim',
  name = 'catppuccin',
  config = function()
    require('catppuccin').setup({
      flavour = 'macchiato',
      color_overrides = {
        macchiato = {
          base = '#21252b',
        },
      },
      integration = {
        neotree = true,
        lspsaga = true,
        Special = true,
        noice = true,
      },
    })
    vim.cmd('colorscheme catppuccin')
  end,
})

package({
  'glepnir/dashboard-nvim',
  commit = 'cd6d812',
  event = 'VimEnter',
  config = conf.dashboard,
})

-- package({
-- 	"glepnir/galaxyline.nvim",
-- 	config = conf.galaxyline,
-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
-- })

package({
  'glepnir/whiskyline.nvim',
  config = conf.whisky,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
})

local enable_indent_filetype = {
  'go',
  'lua',
  'sh',
  'rust',
  'cpp',
  'typescript',
  'typescriptreact',
  'javascript',
  'json',
  'python',
}

package({
  'lukas-reineke/indent-blankline.nvim',
  ft = enable_indent_filetype,
  config = conf.indent_blankline,
})

--[[package({
  'kyazdani42/nvim-tree.lua',
  dependencies = { 'kyazdani42/nvim-web-devicons' },
  config = conf.nvim_tree,
})]]

package({
  'lewis6991/gitsigns.nvim',
  event = { 'BufRead', 'BufNewFile' },
  config = conf.gitsigns,
})

package({ 'mechatroner/rainbow_csv', ft = 'csv' })

package({
  'folke/todo-comments.nvim',
  dependencies = { { 'nvim-lua/plenary.nvim' } },
  config = conf.todo,
})

package({
  'akinsho/bufferline.nvim',
  version = 'v3.*',
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  config = function()
    require('bufferline').setup()
  end,
})

package({ 'xiyaowong/nvim-transparent' })

--INFO: jobs market
--INFO: resume salary job type job location environment introduction
-- HR
-- more resumes
-- salary expectation
