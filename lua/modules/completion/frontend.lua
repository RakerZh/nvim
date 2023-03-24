local lspconfig = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.offsetEncoding = { 'utf-16', 'utf-8' }

local _attach = require('modules.completion.backend')._attach

lspconfig.jsonls.setup({
  on_attach = _attach,
})

-- npm i -g typescript
-- npm i -g typescript-langauge-server
lspconfig.tsserver.setup({
  on_attach = _attach,
})

-- npm i -g vscode-langservers-extracted
lspconfig.eslint.setup({
  filetypes = { 'javascriptreact', 'typescriptreact' },
  on_attach = function(client, bufnr)
    _attach(client, bufnr)
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = bufnr,
      command = 'EslintFixAll',
    })
  end,
})
