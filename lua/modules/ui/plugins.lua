local ui = {}
local conf = require('modules.ui.config')

ui['glepnir/zephyr-nvim'] = {
  config = [[vim.cmd('colorscheme zephyr')]]
}

ui['EdenEast/nightfox.nvim'] = {}
ui['folke/tokyonight.nvim'] = {}
ui['rmehri01/onenord.nvim'] = {}

ui['Shatur/neovim-ayu'] = {
  config = function()
    require('ayu').setup({
      mirage = false,
      overrides = {},
    })
  end
}

ui['nvim-lualine/lualine.nvim'] = {
  config = conf.lualine,
  requires = {'kyazdani42/nvim-web-devicons',opt=true}
}

ui['glepnir/dashboard-nvim'] = {
  config = conf.dashboard
}

--ui['NTBBloodbath/galaxyline.nvim'] = {
--  config = conf.galaxyline,
--  requires = {'kyazdani42/nvim-web-devicons',opt=true}
--}

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

ui['ibhagwan/fzf-lua'] = {
  config = conf.fzf_lua,
  requires = {'kyazdani42/nvim-web-devicons',opt = true}
}

ui['mechatroner/rainbow_csv'] = {
  ft = 'csv',
}

return ui
