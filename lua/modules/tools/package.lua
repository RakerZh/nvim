local conf = require('modules.tools.config')

--[[package{'Shatur/neovim-cmake',
  ft = {'cpp','c','h','hpp'},
  requires = {{'nvim-lua/plenary.nvim',opt = true}},
  -- require dap
}]]

-- packadd(
--   {
--   "yetone/avante.nvim",
--   event = "VeryLazy",
--   version = false,
--   opts = {
--     provider = "openai",
--     openai = {
--       endpoint = "https://api.openai.com/v1",
--       model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
--       timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
--       temperature = 0,
--       max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
--       --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
--     },
--   },
--   build = "make",
--   dependencies = {
--     "nvim-treesitter/nvim-treesitter",
--     "stevearc/dressing.nvim",
--     "nvim-lua/plenary.nvim",
--     "MunifTanjim/nui.nvim",
--     --- The below dependencies are optional,
--     "echasnovski/mini.pick", -- for file_selector provider mini.pick
--     "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
--     "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
--     "ibhagwan/fzf-lua", -- for file_selector provider fzf
--     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
--     "zbirenbaum/copilot.lua", -- for providers='copilot'
--     {
-- -- support for image pasting
--       "HakonHarnes/img-clip.nvim",
--       event = "VeryLazy",
--       opts = {
--        -- recommended settings
--         default = {
--           embed_image_as_base64 = false,
--           prompt_for_file_name = false,
--           drag_and_drop = {
--             insert_mode = true,
--           },
--          -- required for Windows users
--           use_absolute_path = true,
--         },
--       },
--     },
--     {
--      -- Make sure to set this up properly if you have lazy=true
--       'MeanderingProgrammer/render-markdown.nvim',
--       opts = {
--         file_types = { "markdown", "Avante" },
--       },
--       ft = { "markdown", "Avante" },
--     },
--   },
-- })
packadd({
  'nvimdev/dyninput.nvim',
  ft = { 'c', 'go', 'lua', 'rust', 'cpp' },
  config = conf.dyninput,
})

packadd({
  'monaqa/dial.nvim',
  config = function()
    local augend = require('dial.augend')
    require('dial.config').augends:register_group({
      default = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.date.alias['%Y/%m/%d'],
      },
      typescript = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.constant.new({ elements = { 'let', 'const' } }),
      },

      visual = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.date.alias['%Y/%m/%d'],
        augend.constant.alias.alpha,
        augend.constant.alias.Alpha,
      },
    })

    -- change augends in VISUAL mode
  end,
})

-- packadd({
--   'MeanderingProgrammer/render-markdown.nvim',
--  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
--  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
--   dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
--   ---@module 'render-markdown'
--   ---@type render.md.UserConfig
--   opts = {},
--   config = function()
--     require('render-markdown').setup({
--       heading = {
--         position = 'inline',
--         icons = { '󰉫 ', '󰉬 ', '󰉭 ', '󰉮 ', '󰉯 ', '󰉰 ' },
--       },
--     })
--   end,
-- })

packadd({
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  opts = {}, -- this is equalent to setup({}) function
})

packadd({
  'sindrets/diffview.nvim',
  config = conf.diffview,
  dependencies = { { 'nvim-lua/plenary.nvim' } },
})

-- package({ 'rcarriga/nvim-notify', config = conf.notify })

-- package({
--   'folke/noice.nvim',
--   config = conf.noice,
--   dependencies = {
--     { 'MunifTanjim/nui.nvim' },
--   },
-- })

packadd({
  'nvimdev/template.nvim',
  cmd = { 'TemProject', 'Template' },
  config = conf.template_nvim,
})

packadd({ 'nvimdev/coman.nvim', event = 'BufRead', config = conf.coman })

packadd({
  'akinsho/git-conflict.nvim',
  config = true,
})

packadd({ 'jghauser/follow-md-links.nvim' })

-- package({ 'RakerZh/min-preview.nvim' })

packadd({
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false, -- neo-tree will lazily load itself
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    -- fill any relevant options here
  },
})

packadd({
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  -- dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  config = function()
    require('oil').setup({
      columns = { 'icon' },
      keymaps = {
        ['q'] = 'actions.close',
        -- ['<C-h>'] = false,
        -- ['<C-l>'] = false,
        -- ['<C-k>'] = false,
        -- ['<C-j>'] = false,
        ['<M-h>'] = 'actions.select_split',
      },
      win_options = {
        wrap = true,
        winblend = 0,
      },
    })
  end,
})

packadd({
  'nvimdev/guard.nvim',
  ft = { 'c', 'cpp', 'rust', 'lua', 'go', 'typescript', 'javascrip', 'javascriptreact' },
  config = conf.guard,
  dependencies = {
    'nvimdev/guard-collection',
  },
  cmd = { 'GuardFmt', 'GuardDisable', 'GuardEnable' },
})

packadd({
  'ii14/emmylua-nvim',
  ft = 'lua',
})

packadd({
  'nvimdev/rapid.nvim',
  cmd = 'Rapid',
  config = function()
    require('rapid').setup()
  end,
})
packadd({
  'nvimdev/dbsession.nvim',
  cmd = { 'SessionSave', 'SessionLoad', 'SessionDelete' },
  opts = true,
})

packadd({
  'cshuaimin/ssr.nvim',
  module = 'ssr',
  config = function()
    require('ssr').setup({
      border = 'rounded',
      min_width = 50,
      min_height = 5,
      max_width = 120,
      max_height = 25,
      keymaps = {
        close = 'q',
        next_match = 'n',
        prev_match = 'N',
        replace_confirm = '<cr>',
        replace_all = '<leader><cr>',
      },
    })
  end,
})

packadd({ 'gennaro-tedesco/nvim-peekup' })
