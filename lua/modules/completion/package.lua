local package = require('core.pack').package
local conf = require('modules.completion.config')

package({
  'neovim/nvim-lspconfig',
  ft = { 'go', 'lua', 'sh', 'rust', 'c', 'cpp', 'python', 'json', 'typescript', 'typescriptreact' },
  config = conf.nvim_lsp,
  dependencies = {
    { 'glepnir/lspsaga.nvim', event = 'BufRead', config = conf.lspsaga },
  },
})

package({
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  config = conf.nvim_cmp,
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-buffer' },
    { 'saadparwaiz1/cmp_luasnip' },
  },
})

package({ 'L3MON4D3/LuaSnip', event = 'InsertCharPre', config = conf.lua_snip })

package({ 'windwp/nvim-autopairs', event = 'InsertEnter', config = conf.auto_pairs })

package({
  'ray-x/go.nvim',
  ft = 'go',
  config = function()
    require('go').setup({})
  end,
})
