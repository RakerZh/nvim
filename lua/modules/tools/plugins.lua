local package = require('core.pack').package
local conf = require('modules.ui.config')

package{'nvim-lua/plenary.nvim'}

package{'kristijanhusak/vim-dadbod-ui',
  cmd = {'DBUIToggle','DBUIAddConnection','DBUI','DBUIFindBuffer','DBUIRenameBuffer'},
  config = conf.vim_dadbod_ui,
  requires = {{'tpope/vim-dadbod',opt = true}}
}

package{'editorconfig/editorconfig-vim',
  ft = { 'go','typescript','javascript','vim','rust','zig','c','cpp' }
}

package{'glepnir/prodoc.nvim',
  event = 'BufReadPre'
}

package{'liuchengxu/vista.vim',
  cmd = 'Vista',
  config = conf.vim_vista
}

package{'brooth/far.vim',
  cmd = {'Far','Farp'},
  config = function ()
    vim.g['far#source'] = 'rg'
  end
}

package{'iamcco/markdown-preview.nvim',
  ft = 'markdown',
  config = function ()
    vim.g.mkdp_auto_start = 0
  end
}

package{'mfussenegger/nvim-dap',
}

package{'Shatur/neovim-cmake',
  ft = {'cpp','c','h','hpp'},
  requires = {{'nvim-lua/plenary.nvim',opt = true}},
}


package{'sindrets/diffview.nvim',
  requires = {{'nvim-lua/plenary.nvim',opt = true}},
  config = function ()
    require('diffview')
  end
}

package{'searleser97/cpbooster.vim',

}

package{'TimUntersberger/neogit',
  requires = {{'nvim-lua/plenary.nvim',opt = true}},
  config = function ()
    require('neogit')
  end
}

--package{'github/copilot.vim',
--}

package{'famiu/bufdelete.nvim',

}

package{'dvdsk/prosesitter',
    config = function ()
      require('prosesitter')
    end
}

package{'rcarriga/nvim-notify',
  config = function()
    require('notify')
  end
}

package{'akinsho/toggleterm.nvim',
    config = function()
        require('toggleterm')
    end
}

