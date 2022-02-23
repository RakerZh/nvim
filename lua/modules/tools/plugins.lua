local tools = {}
local conf = require('modules.tools.config')

tools['kristijanhusak/vim-dadbod-ui'] = {
  cmd = {'DBUIToggle','DBUIAddConnection','DBUI','DBUIFindBuffer','DBUIRenameBuffer'},
  config = conf.vim_dadbod_ui,
  requires = {{'tpope/vim-dadbod',opt = true}}
}

tools['editorconfig/editorconfig-vim'] = {
  ft = { 'go','typescript','javascript','vim','rust','zig','c','cpp' }
}

tools['glepnir/prodoc.nvim'] = {
  event = 'BufReadPre'
}

tools['liuchengxu/vista.vim'] = {
  cmd = 'Vista',
  config = conf.vim_vista
}

tools['brooth/far.vim'] = {
  cmd = {'Far','Farp'},
  config = function ()
    vim.g['far#source'] = 'rg'
  end
}

tools['iamcco/markdown-preview.nvim'] = {
  ft = 'markdown',
  config = function ()
    vim.g.mkdp_auto_start = 0
  end
}

tools['mfussenegger/nvim-dap'] = {
}

tools['Shatur/neovim-cmake'] = {
  requires = {{'nvim-lua/plenary.nvim',opt = true}},
}

tools['sindrets/diffview.nvim'] = {
  requires = {{'nvim-lua/plenary.nvim',opt = true}},
  config = conf.diffview,
}

tools['searleser97/cpbooster.vim'] = {
}


tools['TimUntersberger/neogit'] = {
  requires = {{'nvim-lua/plenary.nvim',opt = true}},
  config = conf.neogit,
}

return tools
