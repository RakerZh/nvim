local completion = {}
local conf = require('modules.completion.config')

completion['neovim/nvim-lspconfig'] = {
  event = 'BufReadPre',
  config = function ()
    require('modules.completion.lspconfig')
  end
}

completion['tami5/lspsaga.nvim'] = {
  cmd = 'Lspsaga',
}

--completion['hrsh7th/nvim-compe'] = {
--  event = 'InsertEnter',
--  config = conf.nvim_compe,
--}

completion['hrsh7th/vim-vsnip'] = {
  event = 'InsertCharPre',
  config = function()
  vim.g.vsnip_snippet_dir = os.getenv('HOME') .. '/.config/nvim/snippets'
  end
}

completion['nvim-telescope/telescope.nvim'] = {
  cmd = 'Telescope',
  config = conf.telescope,
  requires = {
    {'nvim-lua/popup.nvim', opt = true},
    {'nvim-lua/plenary.nvim',opt = true},
    {'nvim-telescope/telescope-fzf-native.nvim',opt = true},
  }
}

completion['nvim-telescope/telescope-fzf-native.nvim'] = {
  run = 'make',
}


completion['glepnir/smartinput.nvim'] = {
  ft = 'go',
  config = conf.smart_input
}

completion['mattn/vim-sonictemplate'] = {
  cmd = 'Template',
  ft = {'go','typescript','lua','javascript','vim','rust','markdown', 'cpp'},
  config = conf.vim_sonictemplate,
}

completion['mattn/emmet-vim'] = {
  event = 'InsertEnter',
  ft = {'html','css','javascript','javascriptreact','vue','typescript','typescriptreact'},
  config = conf.emmet,
}

completion["folke/lua-dev.nvim"] = {}

completion['hrsh7th/cmp-nvim-lsp'] = {}

completion['hrsh7th/cmp-buffer'] = {}

completion['hrsh7th/cmp-path'] = {}

completion['hrsh7th/cmp-cmdline'] = {}

completion['hrsh7th/nvim-cmp'] = {}

completion["zbirenbaum/copilot.lua"] = {
--  after = 'lualine.nvim',
  event = {"VimEnter"},
  config = function()
    vim.defer_fn(function()
      require("copilot").setup{
      ft_disable = { "markdown",},
    }
    end, 100)
  end,
}

completion["zbirenbaum/copilot-cmp"] = {
    after = { "copilot.lua", "nvim-cmp" },
}

completion['p00f/clangd_extensions.nvim'] = {
    config = function ()
        require('clangd_extensions')
    end
}

completion['ray-x/go.nvim'] = {
  ft = 'go',
  config = function()
      vim.cmd [[packadd go.nvim]]
      require('go').setup({})
  end
}
completion["nvim-neorg/neorg"] = {
  config = function()
    require('neorg').setup{}
  end,
  requires = {"nvim-lua/plenary.nvim", opt = true}
}

return completion
