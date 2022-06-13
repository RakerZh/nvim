local package = require('core.pack').package
local conf = require('modules.editor.config')

package{'Raimondi/delimitMate',
  event = 'InsertEnter',
  config = conf.delimimate,
}

package{'rhysd/accelerated-jk',
  opt = true
}

package{'norcalli/nvim-colorizer.lua',
  ft = { 'html','css','sass','vim','typescript','typescriptreact'},
  config = conf.nvim_colorizer
}

package{'itchyny/vim-cursorword',
  event = {'BufReadPre','BufNewFile'},
  config = conf.vim_cursorwod
}

package{'hrsh7th/vim-eft',
  opt = true,
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

package{'kana/vim-niceblock',
  opt = true
}
