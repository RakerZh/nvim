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

  vim.lsp.set_log_level('OFF')

  --disable diagnostic in neovim test file *_spec.lua
  vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('DisableInSpec', { clear = true }),
    pattern = 'lua',
    callback = function(opt)
      local fname = vim.api.nvim_buf_get_name(opt.buf)
      if fname:find('%w_spec%.lua') then
        vim.diagnostic.disable(opt.buf)
      end
    end,
  })
end

package({
  'neovim/nvim-lspconfig',
  ft = lsp_fts(),
  config = function()
    diag_config()
    require('modules.completion.backend')
    require('modules.completion.frontend')
    exec_filetype({ 'lspconfig', 'DisableInSpec' })
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

package({
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  ft = lsp_fts(),
  config = conf.nvim_cmp,
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-buffer' },
    { 'saadparwaiz1/cmp_luasnip' },
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

package({
  'nvimdev/lspsaga.nvim',
  ft = lsp_fts(),
  cmd = 'Lspsaga term_toggle',
  config = function()
    require('lspsaga').setup({
      symbol_in_winbar = {
        hide_keyword = true,
      },
      outline = {
        layout = 'float',
      },
    })
  end,
})

-- package({ 'ray-x/go.nvim' })
