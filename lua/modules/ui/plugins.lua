local package = require('core.pack').package
local conf = require('modules.ui.config')

package({
  'RakerZh/zephyr-nvim',
  config = conf.zephyr,
  requires = { 'nvim-treesitter/nvim-treesitter', opt = true },
})

--[[ package({
  'folke/tokyonight.nvim',
})]]

package({ 'kyazdani42/nvim-web-devicons' })

package({ 'glepnir/dashboard-nvim', config = conf.dashboard })

package({
  'glepnir/galaxyline.nvim',
  branch = 'main',
  config = conf.galaxyline,
  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
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

package({
  'akinsho/bufferline.nvim',
  config = conf.nvim_bufferline,
  requires = 'kyazdani42/nvim-web-devicons',
})

package({
  'kyazdani42/nvim-tree.lua',
  requires = 'kyazdani42/nvim-web-devicons',
  config = conf.nvim_tree,
  tag = 'nightly',
})

package({
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup()
  end,
})

package({ 'mechatroner/rainbow_csv', ft = 'csv' })
-- package({ 'jupyter-vim/jupyter-vim' })
package({ 'nvim-telescope/telescope-ui-select.nvim' })
