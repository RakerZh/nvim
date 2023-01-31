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

-- package({ 'github/copilot.vim' })

package({
  'sindrets/diffview.nvim',
  config = conf.diffview,
  dependencies = { { 'nvim-lua/plenary.nvim' } },
})

package({
  'TimUntersberger/neogit',
  cmd = 'Neoload',
  dependencies = { { 'nvim-lua/plenary.nvim' } },
  config = function()
    require('neogit')
  end,
})

-- package({ 'rcarriga/nvim-notify', config = conf.notify })

package({
  'folke/noice.nvim',
  config = function()
    require('noice').setup({
      -- add any options here
    })
  end,
  dependencies = {
    { 'MunifTanjim/nui.nvim' },
  },
})

package({
  'glepnir/template.nvim',
  cmd = { 'TemProject', 'Template' },
  config = conf.template_nvim,
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
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-tree/nvim-web-devicons' },
  },
  config = conf.neotree,
})
