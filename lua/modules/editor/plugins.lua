local package = require('core.pack').package
local conf = require('modules.editor.config')

--[[package{'ibhagwan/fzf-lua',
  config = conf.fzf_lua,
  requires = {'kyazdani42/nvim-web-devicons',opt = true}
}]]

package{'nvim-telescope/telescope-fzy-native.nvim'}
package{'nvim-telescope/telescope-file-browser.nvim'}

package{'nvim-telescope/telescope.nvim',
  cmd = "Telescope",
  config = conf.telescope,
  requires = {
    {'nvim-lua/popup.nvim',opt = true},
    {'nvim-lua/plenary.nvim', opt = true},
    {'nvim-telescope/telescope-fzy-native.nvim',opt = true},
    {'nvim-telescope/telescope-file-browser.nvim',opt = true},
    {'nvim-telescope/telescope-ui-select.nvim',opt=true}
  }
}

package{'rhysd/accelerated-jk', opt = true }

package{'norcalli/nvim-colorizer.lua',
  config = conf.nvim_colorizer
}

package{'hrsh7th/vim-eft', opt = true,
  config = function()
    vim.g.eft_ignorecase = true
  end
}

package{'kana/vim-operator-replace',
  keys = {{'x','p'}},
  config = function()
    vim.api.nvim_set_keymap("x", "p", "<Plug>(operator-replace)",{silent =true})
  end,
  requires = 'kana/vim-operator-user'
}

package{'rhysd/vim-operator-surround',
  event = 'BufRead',
  requires = 'kana/vim-operator-user'
}

package{'kana/vim-niceblock', opt = true }

package{'antoinemadec/FixCursorHold.nvim', event = 'BufReadPre'}
