local M = {}
local lspconfig = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.offsetEncoding = { 'utf-16' }

function M._attach(client, bufnr)
  vim.opt.omnifunc = 'v:lua.vim.lsp.omnifunc'
  client.server_capabilities.semanticTokensProvider = nil
end

lspconfig.gopls.setup({
  cmd = { 'gopls', 'serve' },
  on_attach = function(client, _)
    local orignal = vim.notify
    local mynotify = function(msg, level, opts)
      if msg == 'No code actions available' then
        return
      end
      orignal(msg, level, opts)
    end

    vim.notify = mynotify
    M._attach(client)
    -- vim.opt.omnifunc = "v:lua.vim.lsp.omnifunc"
    -- if client.name == "gopls" and not client.server_capabilities.semanticTokensProvider then
    -- 	local semantic = client.config.capabilities.textDocument.semanticTokens
    -- 	client.server_capabilities.semanticTokensProvider = {
    -- 		full = true,
    -- 		legend = { tokenModifiers = semantic.tokenModifiers, tokenTypes = semantic.tokenTypes },
    -- 		range = true,
    -- 	}
    -- end
  end,
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
  },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      -- semanticTokens = true,
      staticcheck = true,
    },
  },
})

lspconfig.lua_ls.setup({
  on_attach = M._attach,
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
      completion = {
        callSnippet = 'Replace',
      },
    },
  },
})

lspconfig.clangd.setup({
  on_attach = M._attach,
  capabilities = capabilities,
  cmd = {
    'clangd',
    '--background-index',
    '--suggest-missing-includes',
    '--clang-tidy',
    '--header-insertion=iwyu',
  },
})

lspconfig.rust_analyzer.setup({
  on_attach = M._attach,
  capabilities = capabilities,
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

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = M._attach,
  })
end

vim.lsp.handlers['workspace/diagnostic/refresh'] = function(_, _, ctx)
  local ns = vim.lsp.diagnostic.get_namespace(ctx.client_id)
  local bufnr = vim.api.nvim_get_current_buf()
  vim.diagnostic.reset(ns, bufnr)
  return true
end

return M
