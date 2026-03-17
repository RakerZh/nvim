local M = {}
-- local lspconfig = require('lspconfig')
-- local lspconfig = vim.lsp.config

M.capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('gopls', {
  cmd = { 'gopls', 'serve' },
  -- on_attach = M._attach,
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

vim.lsp.config('emmylua_ls', {
  cmd = { 'emmylua_ls' },
  filetypes = { 'lua' },
  root_markers = {
    '.emmyrc.json',
  },
  workspace_required = true,
})

vim.lsp.config('clangd', {
  cmd = {
    'clangd',
  },
  root_markers = {
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
  },
  filetypes = { 'c', 'cpp', 'cuda', 'objcpp', 'objc', 'proto' },
  capabilities = {
    textDocument = {
      completion = {
        editsNearCursor = true,
        completionItem = {
          snippetSupport = false,
        },
      },
    },
  },
})
-- lspconfig.clangd.setup({
----  on_attach = M._attach,
--   capabilities = M.capabilities,
--   cmd = {
--     'clangd',
--    -- '--background-index',
--   -- '--header-insertion=never',
--   },
-- })

-- lspconfig.gopls.setup({
--   cmd = { 'gopls', 'serve' },
--  -- on_attach = M._attach,
--   capabilities = M.capabilities,
--   init_options = {
--     usePlaceholders = true,
--     completeUnimported = true,
--   },
--   settings = {
--     gopls = {
--       analyses = {
--         unusedparams = true,
--       },
--       staticcheck = true,
--     },
--   },
-- })

-- lspconfig.marksman.setup({
--   on_attach = M._attach,
--   capabilities = M.capabilities,
--   cmd = {
--     'marksman',
--     'server',
--   },
-- })

vim.lsp.config('rust_analyzer', {
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
--
-- lspconfig.rust_analyzer.setup({
--   settings = {
--     ['rust-analyzer'] = {
--       imports = {
--         granularity = {
--           group = 'module',
--         },
--         prefix = 'self',
--       },
--       cargo = {
--         buildScripts = {
--           enable = true,
--         },
--       },
--       procMacro = {
--         enable = false,
--       },
--     },
--   },
-- })

-- local servers = {
--   'dockerls',
--   'pyright',
--   'bashls',
--   'zls',
-- }

-- for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
--   local default_diagnostic_handler = vim.lsp.handlers[method]
--   vim.lsp.handlers[method] = function(err, result, context, config)
--     if err ~= nil and err.code == -32802 then
--       return
--     end
--     return default_diagnostic_handler(err, result, context, config)
--   end
-- end

-- for _, server in ipairs(servers) do
--   vim.lsp.config[server].setup({
--    -- on_attach = M._attach,
--     capabilities = M.capabilities,
--   })
-- end

-- vim.lsp.handlers['workspace/diagnostic/refresh'] = function(_, _, ctx)
--   local ns = vim.lsp.diagnostic.get_namespace(ctx.client_id, false)
--   local bufnr = vim.api.nvim_get_current_buf()
--   vim.diagnostic.reset(ns)
--   return true
-- end

return M
