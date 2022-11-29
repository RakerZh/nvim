local package = require('core.pack').package
local conf = require('modules.completion.config')

package({
  'neovim/nvim-lspconfig',
  ft = { 'go', 'lua', 'sh', 'rust', 'c', 'cpp', 'python' },
  config = conf.nvim_lsp,
})

package({ 'glepnir/lspsaga.nvim', after = 'nvim-lspconfig', config = conf.lspsaga })

package({ 'hrsh7th/cmp-nvim-lsp' })

package({
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  config = conf.nvim_cmp,
  requires = {
    { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-lspconfig' },
    { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
    { 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip' },
  },
})

package({ 'L3MON4D3/LuaSnip', event = 'InsertCharPre', config = conf.lua_snip })

package({ 'windwp/nvim-autopairs', event = 'InsertEnter', config = conf.auto_pairs })

package({
  'ray-x/go.nvim',
  ft = 'go',
  config = function()
    vim.cmd([[packadd go.nvim]])
    require('go').setup({})
  end,
})

--[[package({
  'nvim-neorg/neorg',
  ft = 'norg',
  after = 'nvim-treesitter',
  config = conf.neorg,
  requires = { 'nvim-lua/plenary.nvim', opt = true },
})]]
