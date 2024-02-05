local lspconfig = require('lspconfig')
local _attach = require('modules.completion.backend')._attach
local capabilities = require('modules.completion.backend').capabilities

lspconfig.jsonls.setup({
  cmd = { 'vscode-json-languageserver' },
  on_attach = _attach,
})

lspconfig.tsserver.setup({
  on_attach = _attach,
  capabilities = capabilities,
})

lspconfig.eslint.setup({
  filetypes = { 'javascriptreact', 'typescriptreact' },
  on_attach = function(client, bufnr)
    _attach(client)
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = bufnr,
      command = 'EslintFixAll',
    })
  end,
})
