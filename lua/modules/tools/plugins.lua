local package = require('core.pack').package
local conf = require('modules.tools.config')

package({
  'kristijanhusak/vim-dadbod-ui',
  cmd = { 'DBUIToggle', 'DBUIAddConnection', 'DBUI', 'DBUIFindBuffer', 'DBUIRenameBuffer' },
  config = conf.vim_dadbod_ui,
  dependencies = { 'tpope/vim-dadbod' },
})

--[[package{'Shatur/neovim-cmake',
  ft = {'cpp','c','h','hpp'},
  requires = {{'nvim-lua/plenary.nvim',opt = true}},
  -- require dap
}]]

package({
  'sindrets/diffview.nvim',
  config = conf.diffview,
  dependencies = { 'nvim-lua/plenary.nvim' },
})

package({
  'TimUntersberger/neogit',
  cmd = 'Neoload',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('neogit')
  end,
})

-- package({ 'github/copilot.vim' })

package({
  'folke/noice.nvim',
  config = function()
    require('noice').setup({
      -- add any options here
    })
  end,
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    'rcarriga/nvim-notify',
  },
})

package({
  'glepnir/template.nvim',
  config = conf.template_nvim,
  ft = { 'lua', 'rust', 'go', 'cpp' },
})

package({ 'glepnir/coman.nvim', event = 'BufRead', config = conf.coman })

package({
  'akinsho/git-conflict.nvim',
  config = function()
    require('git-conflict').setup()
  end,
})

package({ 'jghauser/follow-md-links.nvim' })

package({ 'RakerZh/min-preview.nvim' })

package({
  'nvim-neo-tree/neo-tree.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = conf.neotree,
})

-- package({
--   'nvim-tree/nvim-tree.lua',
--   dependencies = {
--     'nvim-tree/nvim-web-devicons', -- optional, for file icons
--   },
--   config = function ()
--     require('nvim-tree').setup()
--   end
-- })
