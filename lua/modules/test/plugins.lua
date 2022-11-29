local package = require('core.pack').package
local conf = require('modules.test.config')

package({
  'nvim-neotest/neotest',
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'antoinemadec/FixCursorHold.nvim',
  },
})
