local package = require('core.pack').package
local conf = require('modules.ui.config')

package{'glepnir/zephyr-nvim',
  config = conf.zephyr
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

--[[package{'nvim-lualine/lualine.nvim'  {
  config = conf.lualine,
  requires = {'kyazdani42/nvim-web-devicons',opt=true}
}]]--

package{'glepnir/dashboard-nvim',
  after = 'fzf-lua',
  config = conf.dashboard,
}

package{'glepnir/galaxyline.nvim',
  branch = 'main',
  config = conf.galaxyline, 
  requires = {'kyazdani42/nvim-web-devicons',opt=true}
}

package{'lukas-reineke/indent-blankline.nvim',
  event = 'BufRead',
  branch = 'master',
  config = conf.indent_blakline
}

package{'akinsho/bufferline.nvim',
  config = conf.nvim_bufferline,
  requires = 'kyazdani42/nvim-web-devicons'
}

package{'kyazdani42/nvim-tree.lua',
  cmd = 'NvimTreeToggle',
  config = conf.nvim_tree,
  requires = 'kyazdani42/nvim-web-devicons',
--  config = function() require'nvim-tree'.setup {} end
}

package{'lewis6991/gitsigns.nvim',
--  event = {'BufRead','BufNewFile'},
  config = conf.gitsigns,
}

package{'rcarriga/nvim-dap-ui',
   requires = {"mfussenegger/nvim-dap"},
   config = conf.dapui,
}

package{'theHamsta/nvim-dap-virtual-text',
   config = function ()
     require("nvim-dap-virtual-text").setup()
   end
}



package{'mechatroner/rainbow_csv',
  ft = 'csv',
}

