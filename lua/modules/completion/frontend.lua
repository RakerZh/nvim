local lspconfig = require('lspconfig')
local _attach = require('modules.completion.backend')._attach
local capabilities = require('modules.completion.backend').capabilities

lspconfig.jsonls.setup({
  cmd = { 'vscode-json-languageserver' },
  on_attach = _attach,
})

lspconfig.ts_ls.setup({
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  on_attach = _attach,
  capabilities = capabilities,
})

lspconfig.eslint.setup({
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = bufnr,
      command = 'EslintFixAll',
    })
  end,
})
