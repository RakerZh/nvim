local package = require('core.pack').package
local conf = require('modules.lang.config')

package{'nvim-treesitter/nvim-treesitter',
  event = 'BufRead',
  after = 'telescope.nvim',
  config = conf.nvim_treesitter,
}

package{'nvim-treesitter/nvim-treesitter-textobjects',
  after = 'nvim-treesitter'
}

