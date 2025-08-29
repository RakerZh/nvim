local conf = require('modules.editor.config')

packadd({
  'ibhagwan/fzf-lua',
  -- config = conf.fzf_lua,
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

packadd({
  'LeonHeidelbach/trailblazer.nvim',
  config = function()
    require('trailblazer').setup({
      -- your custom config goes here
    })
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
    { 'nvim-treesitter/nvim-treesitter', tag = 'v0.9.2' },
    { 'jvgrootveld/telescope-zoxide' },
  },
})

packadd({
  'nvim-treesitter/nvim-treesitter',
  event = 'BufRead',
  run = ':TSUpdate',
  config = conf.nvim_treesitter,
})

packadd({
  'nvim-treesitter/nvim-treesitter-textobjects',
  ft = { 'c', 'rust', 'go', 'lua' },
  -- config = function()
  --   vim.defer_fn(function()
  --     require('nvim-treesitter.configs').setup({
  --       textobjects = {
  --         select = {
  --           enable = true,
  --           keymaps = {
  --             ['af'] = '@function.outer',
  --             ['if'] = '@function.inner',
  --             ['ac'] = '@class.outer',
  --             ['ic'] = { query = '@class.inner' },
  --           },
  --         },
  --       },
  --     })
  --   end, 0)
  -- end,
})
