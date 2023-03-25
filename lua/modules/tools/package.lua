local package = require('core.pack').package
local conf = require('modules.tools.config')

--[[package{'Shatur/neovim-cmake',
  ft = {'cpp','c','h','hpp'},
  requires = {{'nvim-lua/plenary.nvim',opt = true}},
  -- require dap
}]]

-- package({ 'github/copilot.vim' })

package({
  'sindrets/diffview.nvim',
  config = conf.diffview,
  dependencies = { { 'nvim-lua/plenary.nvim' } },
})

package({
  'TimUntersberger/neogit',
  cmd = 'Neoload',
  dependencies = { { 'nvim-lua/plenary.nvim' } },
  config = function()
    require('neogit')
  end,
})

-- package({ 'rcarriga/nvim-notify', config = conf.notify })

package({
  'folke/noice.nvim',
  config = conf.noice,
  dependencies = {
    { 'MunifTanjim/nui.nvim' },
  },
})

package({
  'glepnir/template.nvim',
  cmd = { 'TemProject', 'Template' },
  config = conf.template_nvim,
})

package({ 'glepnir/coman.nvim', event = 'BufRead', config = conf.coman })

package({
  'akinsho/git-conflict.nvim',
  config = function()
    require('git-conflict').setup({})
  end,
})

package({ 'jghauser/follow-md-links.nvim' })

package({ 'RakerZh/min-preview.nvim' })

package({
  'nvim-neo-tree/neo-tree.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-tree/nvim-web-devicons' },
  },
  config = conf.neotree,
})

package({
  'glepnir/easyformat.nvim',
  ft = { 'c', 'cpp', 'rust', 'lua', 'go', 'typescript', 'javascrip', 'javascriptreact', 'python' },
  config = conf.easyformat,
})

-- package({
--   {
--     'glepnir/easyformat.nvim',
--     ft = { 'c', 'cpp', 'lua', 'rust', 'go' },
--     config = function()
--       require('easyformat').setup({
--         fmt_on_save = true,
--         c = {
--           cmd = 'clang-format',
--           args = { '-style=file', vim.api.nvim_buf_get_name(0) },
--           ignore_patterns = { 'neovim/*' },
--           find = '.clang-format',
--           stdin = false,
--           lsp = false,
--         },
--         cpp = {
--           cmd = 'clang-format',
--           args = { '-style=file', vim.api.nvim_buf_get_name(0) },
--           find = '.clang-format',
--           stdin = false,
--           lsp = false,
--         },
--         go = {
--           cmd = 'golines',
--           args = { '--max-len=80', vim.api.nvim_buf_get_name(0) },
--           stdin = false,
--           hook = function()
--             vim.lsp.buf.code_action({
--               context = { only = { 'source.organizeImports' } },
--               apply = true,
--             })
--           end,
--           lsp = true,
--         },
--         lua = {
--           cmd = 'stylua',
--           ignore_patterns = { '%pspec', 'neovim/*' },
--           find = '.stylua.toml',
--           args = { '-' },
--           stdin = true,
--           lsp = false,
--         },
--         json = {
--           cmd = 'jq',
--         },
--       })
--     end,
--   },
-- })
