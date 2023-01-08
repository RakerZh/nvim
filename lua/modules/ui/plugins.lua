local package = require('core.pack').package
local conf = require('modules.ui.config')

package({ 'RakerZh/zephyr-nvim', config = conf.zephyr })

package({ 'glepnir/dashboard-nvim', config = conf.dashboard })

package({
  'glepnir/galaxyline.nvim',
  config = conf.galaxyline,
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
  requires = 'nvim-lua/plenary.nvim',
  config = conf.todo,
})

package({
  'akinsho/bufferline.nvim',
  version = 'v3.*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup()
  end,
})
