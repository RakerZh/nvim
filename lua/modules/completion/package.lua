local conf = require('modules.completion.config')

local function lsp_fts(type)
  type = type or nil
  local fts = {}
  fts.backend = {
    'go',
    'lua',
    'sh',
    'zsh',
    'bash',
    'rust',
    'c',
    'cpp',
    'java',
    'zig',
    'python',
    'markdown',
  }
  fts.frontend = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'json',
    'vue',
  }
  if not type then
    return vim.list_extend(fts.backend, fts.frontend)
  end
  return fts[type]
end

local function diag_config()
  local signs = {
    Error = ' ',
    Warn = ' ',
    Info = ' ',
    Hint = ' ',
  }
  for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  vim.diagnostic.config({
    signs = true,
    severity_sort = true,
    virtual_text = true,
  })

  vim.lsp.set_log_level(vim.lsp.log_levels.OFF)
end

packadd({
  'neovim/nvim-lspconfig',
  ft = lsp_fts(),
  config = function()
    diag_config()
    require('modules.completion.backend')
    require('modules.completion.frontend')
  end,
  dependencies = {
    'ziglang/zig.vim',
    -- 'SmiteshP/nvim-navbuddy',
    -- dependencies = {
    --   'SmiteshP/nvim-navic',
    --   'MunifTanjim/nui.nvim',
    --   'numToStr/Comment.nvim', -- Optional
    --   'nvim-telescope/telescope.nvim', -- Optional
    -- },
  },
})

-- package({
--   'zbirenbaum/copilot.lua',
--   ft = lsp_fts(),
--   cmd = 'Copilot',
--   event = 'InsertEnter',
--   config = function()
--     require('copilot').setup({
--       suggestion = { enabled = false },
--       panel = { enabled = false },
--     })
--   end,
-- })

-- package({
--   'zbirenbaum/copilot-cmp',
--   after = { 'copilot.lua' },
--   config = function()
--     require('copilot_cmp').setup()
--   end,
-- })

packadd({
  'nvimdev/lspsaga.nvim',
  event = 'LspAttach',
  config = function()
    require('lspsaga').setup({
      ui = { use_nerd = false },
      symbol_in_winbar = {
        enable = false,
      },
      lightbulb = {
        sign = false,
      },
      outline = {
        layout = 'float',
      },
    })
  end,
})

-- packadd({
--   'nvimdev/epo.nvim',
--   event = 'LspAttach',
--   opts = {
--     signature = false,
--     kind_format = function(k)
--       return k:lower()
--     end,
--   },
-- })

packadd({
  'L3MON4D3/LuaSnip',
  version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  build = 'make install_jsregexp',
})

packadd({
  'norcalli/nvim-colorizer.lua',
})

packadd({
  'mfussenegger/nvim-jdtls',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
})

packadd({
  'hrsh7th/nvim-cmp',
  ft = lsp_fts(),
  event = 'InsertEnter',
  config = conf.nvim_cmp,
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-buffer' },
    { 'saadparwaiz1/cmp_luasnip' },
  },
})
-- package({ 'ray-x/go.nvim' })
