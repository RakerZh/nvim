if packer_plugins['plenary.nvim'] and not packer_plugins['plenary.nvim'].loaded then
  vim.cmd([[packadd plenary.nvim]])
end

-- Lua
local cb = require('diffview.config').diffview_callback

require('diffview').setup({})
