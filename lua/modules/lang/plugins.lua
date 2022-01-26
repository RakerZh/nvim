local lang = {}
local conf = require('modules.lang.config')

lang['nvim-treesitter/nvim-treesitter'] = {
  event = 'BufRead',
  after = 'telescope.nvim',
  config = conf.nvim_treesitter,
--  commit = '668de0951a36ef17016074f1120b6aacbe6c4515',
}

lang['nvim-treesitter/nvim-treesitter-textobjects'] = {
  after = 'nvim-treesitter'
 }

return lang
