local package = require('core.pack').package
local conf = require('modules.ui.config')

package{'glepnir/zephyr-nvim',
  config = conf.zephyr,
  requires = { 'nvim-treesitter/nvim-treesitter', opt = true}
}

--package{'EdenEast/nightfox.nvim'  {}
--package{'folke/tokyonight.nvim'  {}
--package{'rmehri01/onenord.nvim'  {}
--package{'catppuccin/nvim'  {
--  as = "catppuccin",
--  config = conf.catppuccinm
--}

--[[package{'Shatur/neovim-ayu'  {
  config = function()
    require('ayu').setup({
      mirage = false,
      overrides = {},
    })
  end
}]]--

package{'~/github/init_vim'}

package{'glepnir/dashboard-nvim',
  config = conf.dashboard,
}

package{'glepnir/galaxyline.nvim',
  branch = 'main',
  config = conf.galaxyline, 
  requires = {'kyazdani42/nvim-web-devicons',opt=true}
}


package{'lukas-reineke/indent-blankline.nvim',
--  event = 'BufRead',
  config = conf.indent_blankline
}

package{'akinsho/bufferline.nvim',
  config = conf.nvim_bufferline,
  requires = 'kyazdani42/nvim-web-devicons'
}

package{'kyazdani42/nvim-tree.lua',
  cmd = 'NvimTreeToggle',
  config = conf.nvim_tree,
  requires = 'kyazdani42/nvim-web-devicons',
}

package{'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup()
  end
}

package{'mechatroner/rainbow_csv',
  ft = 'csv',
}
package{'nvim-telescope/telescope-ui-select.nvim'}

