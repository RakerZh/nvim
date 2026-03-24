-- tex-specific buffer options
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.spell = true
vim.opt_local.spelllang = 'en_us'
vim.opt_local.conceallevel = 2    -- vimtex conceal (hides \textbf{ etc.)
vim.opt_local.concealcursor = 'nc'
vim.opt_local.textwidth = 0

-- keymaps (plugins loaded by this point via ft trigger)
vim.keymap.set('n', '<leader>lb', '<cmd>Telescope bibtex<CR>',
  { buffer = true, desc = 'Search BibTeX' })
vim.keymap.set('n', '<leader>lp', function()
  require('nabla').popup()
end, { buffer = true, desc = 'Preview math equation' })
vim.keymap.set('n', '<leader>lt', function()
  require('nabla').toggle_virt()
end, { buffer = true, desc = 'Toggle inline math preview' })
