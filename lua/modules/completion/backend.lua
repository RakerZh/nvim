local M = {}
local lspconfig = require('lspconfig')

M.capabilities = require('cmp_nvim_lsp').default_capabilities()
-- M.capabilities = vim.tbl_deep_extend(
--   'force',
--   vim.lsp.protocol.make_client_capabilities(),
-- )

function M._attach(client, _)
  vim.opt.omnifunc = 'v:lua.vim.lsp.omnifunc'
  client.server_capabilities.semanticTokensProvider = nil
  local orignal = vim.notify
  local mynotify = function(msg, level, opts)
    if msg == 'No code actions available' or msg:find('overly') then
      return
    end
    orignal(msg, level, opts)
  end
  vim.notify = mynotify
end

-- lspconfig.jdtls.setup({
--   cmd = { 'jdtls' },
--   root_dir = vim.fs.dirname(
--     vim.fs.find({ '.git', 'mvnw', 'gradlew', 'pom.xml' }, { upward = true })[1]
--   ),
--   capabilities = M.capabilities,
-- })

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
  on_init = function(client)
    local path = client.workspace_folders and client.workspace_folders[1].name
    local fs_stat = vim.uv.fs_stat
    if path and (fs_stat(path .. '/.luarc.json') or fs_stat(path .. '/.luarc.jsonc')) then
      return
    end
    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = { version = 'LuaJIT' },
      completion = { callSnippet = 'Replace' },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          '${3rd}/luv/library',
        },
      },
    })
  end,
  settings = { Lua = {} },
})

-- lspconfig.marksman.setup({
--   on_attach = M._attach,
--   capabilities = M.capabilities,
--   cmd = {
--     'marksman',
--     'server',
--   },
-- })

lspconfig.clangd.setup({
  on_attach = M._attach,
  capabilities = M.capabilities,
  cmd = {
    'clangd',
    '--background-index',
    '--header-insertion=never',
  },
})

lspconfig.rust_analyzer.setup({
  settings = {
    ['rust-analyzer'] = {
      imports = {
        granularity = {
          group = 'module',
        },
        prefix = 'self',
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = false,
      },
    },
  },
})

local servers = {
  'dockerls',
  'pyright',
  'bashls',
  'zls',
}

for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
  local default_diagnostic_handler = vim.lsp.handlers[method]
  vim.lsp.handlers[method] = function(err, result, context, config)
    if err ~= nil and err.code == -32802 then
      return
    end
    return default_diagnostic_handler(err, result, context, config)
  end
end

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
