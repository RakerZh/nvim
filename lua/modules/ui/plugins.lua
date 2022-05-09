local ui = {}
local conf = require('modules.ui.config')

ui['RakerZh/zephyr-nvim'] = {
  config = [[vim.cmd('colorscheme zephyr')]]
}

ui['glepnir/dashboard-nvim'] = {
  config = conf.dashboard
}

ui['NTBBloodbath/galaxyline.nvim'] = {
  branch = 'main',
  config = conf.galaxyline,
  requires = {'kyazdani42/nvim-web-devicons',opt=true}
}

ui['lukas-reineke/indent-blankline.nvim'] = {
  event = 'BufRead',
  branch = 'master',
  config = conf.indent_blakline
}


ui['akinsho/bufferline.nvim'] = {
  config = conf.nvim_bufferline,
  requires = 'kyazdani42/nvim-web-devicons'
}

ui['kyazdani42/nvim-tree.lua'] = {
--  cmd = {'NvimTreeToggle','NvimTreeOpen'},
  config = conf.nvim_tree,
  requires = 'kyazdani42/nvim-web-devicons',
--  config = function() require'nvim-tree'.setup {} end
}

ui['lewis6991/gitsigns.nvim'] = {
  event = {'BufRead','BufNewFile'},
  branch = 'main',
  config = conf.gitsigns,
  requires = {'nvim-lua/plenary.nvim'}
}

ui['rcarriga/nvim-dap-ui'] = {
   requires = {"mfussenegger/nvim-dap"},
   config = conf.dapui,
}
ui['theHamsta/nvim-dap-virtual-text'] = {
   config = function ()
     require("nvim-dap-virtual-text").setup()
   end
}
ui['mechatroner/rainbow_csv'] = {
  ft = 'csv',
}



return ui
