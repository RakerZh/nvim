local package = require('core.pack').package
local conf = require('modules.editor.config')

-- TODO: fzf-lua implemented
--
--[[package{'ibhagwan/fzf-lua',
  config = conf.fzf_lua,
  dependencies = {'kyazdani42/nvim-web-devicons'}
}]]

package({
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  config = conf.telescope,
  dependencies = {
    { 'nvim-lua/popup.nvim' },
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzy-native.nvim' },
    { 'nvim-telescope/telescope-file-browser.nvim' },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'jvgrootveld/telescope-zoxide' },
  },
})

package({
  'nvim-treesitter/nvim-treesitter',
  event = 'BufRead',
  run = ':TSUpdate',
  config = conf.nvim_treesitter,
  dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
})

package({
  'glepnir/mutchar.nvim',
  ft = { 'c', 'go', 'lua', 'rust', 'cpp' },
  config = conf.smart_input,
})

package({
  'norcalli/nvim-colorizer.lua',
  config = conf.nvim_colorizer,
})

-- package({ 'antoinemadec/FixCursorHold.nvim', event = 'BufReadPre' })

-- package({ 'phaazon/hop.nvim', config = conf.hop, event = 'BufRead', })

package({
  'glepnir/hlsearch.nvim',
  event = 'BufRead',
  config = function()
    require('hlsearch').setup()
  end,
})

package({
  'ggandor/leap.nvim',
  config = function()
    require('leap').set_default_keymaps()
  end,
})

package({
  'L3MON4D3/LuaSnip',
  event = 'InsertCharPre',
  config = conf.lua_snip,
})

package({
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = conf.auto_pairs,
})
