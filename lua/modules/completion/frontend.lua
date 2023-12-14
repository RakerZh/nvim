local lspconfig = require('lspconfig')

local _attach = require('modules.completion.backend')._attach

lspconfig.jsonls.setup({
  cmd = { 'vscode-json-languageserver' },
  on_attach = _attach,
})

lspconfig.tsserver.setup({
  on_attach = _attach,
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
