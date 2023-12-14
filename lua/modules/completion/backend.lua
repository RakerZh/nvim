local M = {}
local lspconfig = require('lspconfig')

M.capabilities = require('cmp_nvim_lsp').default_capabilities()

function M._attach(client, _)
  vim.opt.omnifunc = 'v:lua.vim.lsp.omnifunc'
  -- client.server_capabilities.semanticTokensProvider = nil
  local orignal = vim.notify
  local mynotify = function(msg, level, opts)
    if msg == 'No code actions available' or msg:find('overly') then
      return
    end
    orignal(msg, level, opts)
  end
  vim.notify = mynotify
end

lspconfig.gopls.setup({
  cmd = { 'gopls', 'serve' },
  on_attach = M._attach,
  capabilities = M.capabilities,
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
  },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
})

lspconfig.lua_ls.setup({
  on_attach = M._attach,
  capabilities = M.capabilities,
  settings = {
    Lua = {
      diagnostics = {
        enable = true,
        globals = { 'vim' },
      },
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      workspace = {
        library = {
          vim.env.VIMRUNTIME,
          vim.env.HOME .. '/.local/share/nvim/lazy/emmylua-nvim',
        },
        checkThirdParty = false,
      },
      completion = {
        callSnippet = 'Replace',
      },
    },
  },
})

lspconfig.clangd.setup({
  on_attach = M._attach,
  cmd = {
    'clangd',
    '--background-index',
    '--clang-tidy',
    '--header-insertion=iwyu',
  },
})

lspconfig.rust_analyzer.setup({
  on_attach = M._attach,
  -- settings = {
  --   ['rust-analyzer'] = {
  --     imports = {
  --       granularity = {
  --         group = 'module',
  --       },
  --       prefix = 'self',
  --     },
  --     cargo = {
  --       buildScripts = {
  --         enable = true,
  --       },
  --     },
  --     procMacro = {
  --       enable = false,
  --     },
  --   },
  -- },
})

local servers = {
  'dockerls',
  'pyright',
  'bashls',
  'zls',
}

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = M._attach,
    capabilities = M.capabilities,
  })
end

vim.lsp.handlers['workspace/diagnostic/refresh'] = function(_, _, ctx)
  local ns = vim.lsp.diagnostic.get_namespace(ctx.client_id, false)
  local bufnr = vim.api.nvim_get_current_buf()
  vim.diagnostic.reset(ns)
  return true
end

return M
