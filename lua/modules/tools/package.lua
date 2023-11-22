local package = require('core.pack').package
local conf = require('modules.tools.config')

--[[package{'Shatur/neovim-cmake',
  ft = {'cpp','c','h','hpp'},
  requires = {{'nvim-lua/plenary.nvim',opt = true}},
  -- require dap
}]]

package({
  'nvimdev/dyninput.nvim',
  ft = { 'c', 'go', 'lua', 'rust', 'cpp' },
  config = conf.dyninput,
})

package({
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

package({
  'nvimdev/template.nvim',
  cmd = { 'TemProject', 'Template' },
  config = conf.template_nvim,
})

package({ 'nvimdev/coman.nvim', event = 'BufRead', config = conf.coman })

package({
  'akinsho/git-conflict.nvim',
  config = true,
})

package({ 'jghauser/follow-md-links.nvim' })

-- package({ 'RakerZh/min-preview.nvim' })

package({
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = conf.neotree,
})

package({
  'nvimdev/guard.nvim',
  ft = { 'c', 'cpp', 'rust', 'lua', 'go', 'typescript', 'javascrip', 'javascriptreact', 'python' },
  config = conf.guard,
  dependencies = {
    'nvimdev/guard-collection',
  },
  cmd = { 'GuardFmt', 'GuardDisable', 'GuardEnable' },
})

package({
  'ii14/emmylua-nvim',
  ft = 'lua',
})

package({
  'nvimdev/rapid.nvim',
  cmd = 'Rapid',
  config = function()
    require('rapid').setup()
  end,
})

package({
  'cshuaimin/ssr.nvim',
  module = 'ssr',
  -- Calling setup is optional.
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
