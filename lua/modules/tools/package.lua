local conf = require('modules.tools.config')

--[[package{'Shatur/neovim-cmake',
  ft = {'cpp','c','h','hpp'},
  requires = {{'nvim-lua/plenary.nvim',opt = true}},
  -- require dap
}]]

packadd({
  'nvimdev/dyninput.nvim',
  ft = { 'c', 'go', 'lua', 'rust', 'cpp' },
  config = conf.dyninput,
})

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
  },
  config = conf.neotree,
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
