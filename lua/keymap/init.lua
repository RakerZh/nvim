require('keymap.remap')
local keymap = require('core.keymap')
local nmap, imap, xmap = keymap.nmap, keymap.imap, keymap.xmap
local silent, noremap, expr, remap = keymap.silent, keymap.noremap, keymap.expr, keymap.remap
local opts = keymap.new_opts
local cmd, cu = keymap.cmd, keymap.cu

nmap({
  -- packer
  { '<Leader>pu', cmd('Lazy update') },
  { '<Leader>pi', cmd('Lazy install') },
  -- Lsp
  { '<Leader>li', cmd('LspInfo') },
  { '<Leader>ll', cmd('LspLog') },
  { '<Leader>lr', cmd('LspRestart') },
  -- Lspsaga
  { '[e', cmd('Lspsaga diagnostic_jump_next') },
  { ']e', cmd('Lspsaga diagnostic_jump_prev') },
  { '[c', cmd('Lspsaga show_cursor_diagnostics') },
  { 'K', cmd('Lspsaga hover_doc') },
  { 'ga', cmd('Lspsaga code_action') },

  { 'gd', cmd('Lspsaga peek_definition') },
  { 'gs', cmd('Lspsaga signature_help') },
  { 'gr', cmd('Lspsaga rename') },
  { 'gh', cmd('Lspsaga lsp_finder') },
  { 'gk', cmd('!Open -a Safari https://github.com/RakerZh') },
  --  { '<Leader>g', cmd('Lspsaga term_toggle lazygit') },

  { '<Leader>o', cmd('Lspsaga outline') },
  -- dashboard create file
  { '<Leader>n', cmd('DashboardNewFile') },
  { '<Leader>ll', cmd('Lspsaga show_line_diagnostics') },
  { '<Leader>ci', cmd('Lspsaga incoming_calls') },
  { '<Leader>co', cmd('Lspsaga outgoing_calls') },
  { '<Leader>ss', cmd('SessionSave') },
  { '<Leader>sl', cmd('SessionLoad') },
  -- nvimtree
  --{'<Leader>kh',cmd('NvimTreeResize -10'),opts(noremap,silent)},
  --{'<Leader>kl',cmd('NvimTreeResize +2'),opts(noremap,silent)},
  { '<Leader>d', cmd('DiffviewOpen') },
  { '<Leader>e', cmd('Neotree toggle') },

  -- Telescope
  { '<Leader>tb', cmd('Telescope buffers') },
  { '<Leader>fa', cmd('Telescope live_grep') },
  { '<Leader>fb', cmd('Telescope file_browser') },
  { '<Leader>ff', cmd('Telescope find_files') },
  { '<Leader>fs', cmd('Telescope git_status') },
  { '<Leader>fk', cmd('Telescope keymaps') },
  { '<Leader>fw', cmd('Telescope grep_string') },
  { '<Leader>fh', cmd('Telescope oldfiles') },
  { '<Leader>fj', cmd('Telescope help_tags') },
  { '<Leader>fg', cmd('Telescope git_commits') },
  -- zoxide
  { '<Leader>fq', cmd('Telescope zoxide list') },
  { '<Leader>r', cmd('Rapid') },

  { '<Leader>b', cmd('FlyBuf') },
  {
    '<Leader>t',
    function()
      return ':Template '
    end,
    opts(expr),
  },
  { '<Leader>fn', cmd('Navbuddy') },
})

--  coman
nmap({ 'gcc', '<cmd>ComComment<cr>' })
xmap({ 'gcc', ':ComComment<CR>' })
nmap({ 'gcj', '<cmd>ComAnnotation<Cr>' })

-- Lspsaga floaterminal
nmap({ '<A-d>', cmd('Lspsaga open_floaterm') })

vim.keymap.set({ 'n', 't' }, '<A-d>', cmd('Lspsaga term_toggle'))
vim.keymap.set({ 'n' }, '<Leader>g', cmd('Lspsaga term_toggle lazygit'))
vim.keymap.set({ 'n', 'x' }, '<leader>sr', function()
  require('ssr').open()
end)

xmap({ 'ga', cmd('Lspsaga code_action') })
