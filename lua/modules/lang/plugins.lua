local lang = {}
local conf = require('modules.lang.config')

lang['nvim-treesitter/nvim-treesitter'] = {
  event = 'BufRead',
  after = 'telescope.nvim',
  config = conf.nvim_treesitter,
}

lang['nvim-treesitter/nvim-treesitter-textobjects'] = {
  after = 'nvim-treesitter'
}

-- lang['ray-x/go.nvim'] = {
--}

--lang["dvdsk/prosesitter"] = {
--}

--lang["p00f/clangd_extensions.nvim"] ={
--}
return lang
