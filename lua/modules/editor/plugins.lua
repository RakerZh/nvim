local package = require('core.pack').package
local conf = require('modules.editor.config')

--[[package{'ibhagwan/fzf-lua',
  config = conf.fzf_lua,
  requires = {'kyazdani42/nvim-web-devicons',opt = true}
}]]

package({
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  config = conf.telescope,
  requires = {
    { 'nvim-lua/popup.nvim', opt = true },
    { 'nvim-lua/plenary.nvim', opt = true },
    { 'nvim-telescope/telescope-fzy-native.nvim', opt = true },
    { 'nvim-telescope/telescope-file-browser.nvim', opt = true },
    { 'nvim-telescope/telescope-ui-select.nvim', opt = true },
    { 'jvgrootveld/telescope-zoxide', opt = true },
  },
})

package({
  'nvim-treesitter/nvim-treesitter',
  event = 'BufRead',
  run = ':TSUpdate',
  after = 'telescope.nvim',
  config = conf.nvim_treesitter,
})

package({ 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' })

package({ 'glepnir/mcc.nvim', ft = { 'go', 'lua' }, config = conf.smart_input })

package({ 'nvim-telescope/telescope-file-browser.nvim' })

package({ 'jvgrootveld/telescope-zoxide' })

package({ 'rhysd/accelerated-jk', opt = true })

package({
  'norcalli/nvim-colorizer.lua',
  config = conf.nvim_colorizer,
  ft = { 'lua', 'css', 'js', 'scss', 'toml' },
})

package({
  'hrsh7th/vim-eft',
  opt = true,
  config = function()
    vim.g.eft_ignorecase = true
  end,
})

package({
  'kana/vim-operator-replace',
  keys = { { 'x', 'p' } },
  config = function()
    vim.api.nvim_set_keymap('x', 'p', '<Plug>(operator-replace)', { silent = true })
  end,
  requires = 'kana/vim-operator-user',
})

-- package({ "rhysd/vim-operator-surround", event = "BufRead", requires = "kana/vim-operator-user" })

-- package({ 'antoinemadec/FixCursorHold.nvim', event = 'BufReadPre' })

package({
  'jedrzejboczar/possession.nvim',
  requires = {
    { 'nvim-lua/plenary.nvim' },
  },
  config = function()
    if not packer_plugins['plenary.nvim'].loaded then
      vim.cmd([[packadd plenary.nvim]])
    end
  end,
})

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
