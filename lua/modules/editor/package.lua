local conf = require('modules.editor.config')

-- TODO: fzf-lua implemented
--
--[[package{'ibhagwan/fzf-lua',
  config = conf.fzf_lua,
  dependencies = {'kyazdani42/nvim-web-devicons'}
}]]

packadd({
  'nvimdev/hlsearch.nvim',
  event = 'BufRead',
  config = function()
    require('hlsearch').setup()
  end,
})

packadd({
  'folke/flash.nvim',
  event = 'VeryLazy',
  ---@type Flash.Config
  opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
})

packadd({
  'ggandor/leap.nvim',
  config = function()
    require('leap').set_default_keymaps()
  end,
})

packadd({
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

packadd({
  'nvim-treesitter/nvim-treesitter',
  event = 'BufRead',
  run = ':TSUpdate',
  config = conf.nvim_treesitter,
  dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
})

packadd({
  'norcalli/nvim-colorizer.lua',
  config = conf.nvim_colorizer,
})

packadd({
  'ggandor/leap.nvim',
  config = function()
    require('leap').set_default_keymaps()
  end,
})
