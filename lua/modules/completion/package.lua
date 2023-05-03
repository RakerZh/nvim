local package = require('core.pack').package
local conf = require('modules.completion.config')

local function lsp_fts(type)
  type = type or nil
  local fts = {}
  fts.backend = {
    'go',
    'lua',
    'sh',
    'rust',
    'c',
    'cpp',
    'zig',
    'python',
  }

  fts.frontend = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'json',
  }
  if not type then
    return vim.list_extend(fts.backend, fts.frontend)
  end
  return fts[type]
end

local loaded = false
local function diag_config()
  local signs = {
    Error = ' ',
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
    virtual_text = {
      prefix = '󰶺 ',
    },
  })
end

package({
  'neovim/nvim-lspconfig',
  ft = lsp_fts(),
  config = function()
    if not loaded then
      diag_config()
      loaded = true
    end
    require('modules.completion.backend')
    require('modules.completion.frontend')
  end,
})

package({
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  config = conf.nvim_cmp,
  dependencies = {
    {
      'zbirenbaum/copilot-cmp',
      config = function()
        require('copilot_cmp').setup()
      end,
      dependencies = {
        'zbirenbaum/copilot.lua',
        config = function()
          require('copilot').setup({
            suggestion = {
              enabled = true,
              auto_trigger = true,
              keymap = {
                accept = '<C-l>',
                accept_word = false,
                accept_line = false,
                decline = '<C-g>',
                next = '<C-.>',
                prev = '<C-,>',
                dismiss = '<C-\\>',
              },
            },
          })
        end,
      },
    },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-buffer' },
    { 'saadparwaiz1/cmp_luasnip' },
  },
})

package({
  'nvimdev/lspsaga.nvim',
  event = 'LspAttach',
  cmd = 'Lspsaga term_toggle',
  config = function()
    require('lspsaga').setup({
      diagnostic = {
        on_insert = true,
        on_insert_follow = true,
        insert_winblend = 60,
      },
      symbol_in_winbar = {
        ignore_patterns = { '%w_spec' },
      },
    })
  end,
})

-- package({ 'ray-x/go.nvim' })
