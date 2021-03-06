local package = require('core.pack').package
local conf = require('modules.tools.config')

package({
  'kristijanhusak/vim-dadbod-ui',
  disable = true,
  cmd = { 'DBUIToggle', 'DBUIAddConnection', 'DBUI', 'DBUIFindBuffer', 'DBUIRenameBuffer' },
  config = conf.vim_dadbod_ui,
  requires = { { 'tpope/vim-dadbod', opt = true } },
})

package({ 'editorconfig/editorconfig-vim', ft = { 'go', 'typescript', 'javascript', 'vim', 'rust', 'c', 'cpp' } })

package({ 'glepnir/prodoc.nvim', event = 'BufReadPre' })

package({ 'liuchengxu/vista.vim', cmd = 'Vista', config = conf.vim_vista })

package({
  'brooth/far.vim',
  cmd = { 'Far', 'Farp' },
  config = function()
    vim.g['far#source'] = 'rg'
  end,
})

--[[package{'Shatur/neovim-cmake',
  ft = {'cpp','c','h','hpp'},
  requires = {{'nvim-lua/plenary.nvim',opt = true}},
  -- require dap
}]]

package({ 'sindrets/diffview.nvim', requires = { { 'nvim-lua/plenary.nvim', opt = true } } })

package({ 'searleser97/cpbooster.vim' })

package({
  'TimUntersberger/neogit',
  cmd = 'neoload',
  requires = { { 'nvim-lua/plenary.nvim', opt = true } },
  config = function()
    require('neogit')
  end,
})

--package{'github/copilot.vim',
--}

package({ 'famiu/bufdelete.nvim' })

package({
  'dvdsk/prosesitter',
  config = function()
    require('prosesitter')
  end,
})

package({ 'rcarriga/nvim-notify' })

package({
  'akinsho/toggleterm.nvim',
  config = function()
    require('toggleterm')
  end,
})

package({ 'glepnir/template.nvim', config = conf.template_nvim })

-- package({ '~/space/docnote.nvim/'})
