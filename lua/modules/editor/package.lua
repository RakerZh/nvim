local conf = require('modules.editor.config')

packadd({
  'ibhagwan/fzf-lua',
  cmd = { 'FzfLua' },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
})

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

-- jupyternotebook
-- packadd({
--   'benlubas/molten-nvim',
--   version = '^1.0.0', -- use version <2.0.0 to avoid breaking changes
--   build = ':UpdateRemotePlugins',
--   init = function()
--     vim.g.molten_output_win_max_height = 12
--   end,
-- })

packadd({
  'LeonHeidelbach/trailblazer.nvim',
  keys = { '<A-l>', '<A-b>' },
  config = function()
    require('trailblazer').setup({})
  end,
})

packadd({
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  config = conf.telescope,
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzy-native.nvim' },
    { 'jvgrootveld/telescope-zoxide' },
  },
})

packadd({
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  build = ':TSUpdate',
  lazy = false,
  config = conf.nvim_treesitter,
})

packadd({
  'nvim-treesitter/nvim-treesitter-textobjects',
  branch = 'main',
  config = conf.nvim_treesitter_textobjects,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
})
