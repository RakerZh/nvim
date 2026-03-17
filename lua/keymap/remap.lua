local keymap = require('core.keymap')
local nmap, imap, cmap, tmap, vmap = keymap.nmap, keymap.imap, keymap.cmap, keymap.tmap, keymap.vmap
local silent, noremap = keymap.silent, keymap.noremap
local expr = keymap.expr
local opts = keymap.new_opts
local cmd = keymap.cmd
local ls = require('modules.completion.luasnip')

-- noremal remap
nmap({
  -- close buffer
  { '<C-x>k', cmd('bdelete') },
  -- save
  { '<C-s>', cmd('write') },
  -- yank
  { 'Y', 'y$' },
  -- buffer jump
  { ']b', cmd('bn') },
  { '[b', cmd('bp') },
  -- remove trailing white space
  { '<Leader>w', cmd('TrimTrailingWhitespace') },
  -- window jump
  { '<C-h>', '<C-w>h' },
  { '<C-l>', '<C-w>l' },
  { '<C-j>', '<C-w>j' },
  { '<C-k>', '<C-w>k' },
  { '<esc>', cmd('noh') },
  { '<A-[>', cmd('vertical resize -5') },
  { '<A-]>', cmd('vertical resize +5') },
  { '-', cmd('Oil --float') },
  { '_', cmd('Oil . --float <CR>') },
})

-- insertmode remap
imap({
  { '<C-w>', '<C-[>diwa' },
  { '<C-h>', '<Bs>' },
  { '<C-j>', '<Esc>o' },
  { '<C-k>', '<Esc>O' },
  { '<C-l>', '<Right>' },
  { '<C-d>', '<Del>' },
  { '<C-u>', '<C-G>u<C-u>' },
  { '<C-b>', '<Left>' },
  -- { '<C-f>', '<Right>' },
  { '<C-a>', '<Esc>^i' },
  { '<C-s>', '<ESC>:w<CR>' },
  {
    '<C-e>',
    function()
      return vim.fn.pumvisible() == 1 and '<C-e>' or '<end>'
    end,
    opts(expr),
  },
  {
    '<TAB>',
    function()
      if ls.locally_jumpable(1) then
        return ls.jump(1)
      else
        return '<TAB>'
      end
    end,
    { expr = true },
  },
  {
    '<S-TAB>',
    function()
      if ls.locally_jumpable(-1) then
        return ls.jump(-1)
      else
        return '<S-TAB>'
      end
    end,
    { expr = true },
  },
})

tmap({ '<Esc>', [[<C-\><C-n>]] })

cmap({
  { '<C-h>', '<Left>' },
  { '<C-l>', '<Right>' },
  { '<C-a>', '<Home>' },
  { '<C-e>', '<End>' },
  { '<C-d>', '<Del>' },
  { '<C-b>', '<BS>' },
})
