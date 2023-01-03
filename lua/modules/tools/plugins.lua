local package = require('core.pack').package
local conf = require('modules.tools.config')

package({
  'kristijanhusak/vim-dadbod-ui',
  cmd = { 'DBUIToggle', 'DBUIAddConnection', 'DBUI', 'DBUIFindBuffer', 'DBUIRenameBuffer' },
  config = conf.vim_dadbod_ui,
  dependencies = { 'tpope/vim-dadbod' },
})

package({
  'editorconfig/editorconfig-vim',
  ft = { 'go', 'typescript', 'javascript', 'vim', 'rust', 'c', 'cpp' },
})

--[[package{'Shatur/neovim-cmake',
  ft = {'cpp','c','h','hpp'},
  requires = {{'nvim-lua/plenary.nvim',opt = true}},
  -- require dap
}]]

package({ 'sindrets/diffview.nvim', requires = { 'nvim-lua/plenary.nvim' } })

package({
  'TimUntersberger/neogit',
  cmd = 'Neoload',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('neogit')
  end,
})

-- package({ 'github/copilot.vim' })

package({ 'famiu/bufdelete.nvim' })

package({ 'rcarriga/nvim-notify' })

package({
  'glepnir/template.nvim',
  config = conf.template_nvim,
})

package({ 'glepnir/coman.nvim', event = 'BufRead', config = conf.coman })

package({
  'akinsho/git-conflict.nvim',
  config = function()
    require('git-conflict').setup()
  end,
})

package({
  'jghauser/follow-md-links.nvim',
})

-- package({ '~/space/docnote.nvim/'})

package({ 'RakerZh/min-preview.nvim' })
