local keymap = require('core.keymap')
local nmap, imap, cmap, tmap, vmap = keymap.nmap, keymap.imap, keymap.cmap, keymap.tmap, keymap.vmap
local silent, noremap = keymap.silent, keymap.noremap
local expr = keymap.expr
local opts = keymap.new_opts
local cmd = keymap.cmd
local ls = require('modules.completion.luasnip')

local a = true
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
  -- resize window
  { '<A-[>', cmd('vertical resize -5') },
  { '<A-]>', cmd('vertical resize +5') },
  { '-', cmd('Oil --float') },
  { '_', cmd('Oil . --float <CR>') },
  -- {
  --   '<C-a>',
  --   function()
  --     require('dial.map').manipulate('increment', 'normal')
  --   end,
  -- },
  -- {
  --   '<C-x>',
  --   function()
  --     require('dial.map').manipulate('decrement', 'normal')
  --   end,
  -- },
  -- {
  --   'g<C-a>',
  --   function()
  --     require('dial.map').manipulate('increment', 'gnormal')
  --   end,
  -- },
  -- {
  --   'g<C-x>',
  --   function()
  --     require('dial.map').manipulate('decrement', 'gnormal')
  --   end,
  -- },
  -- {"<C-a>", }
})

vmap({
  -- {
  --   '<C-a>',
  --   function()
  --     require('dial.map').manipulate('increment', 'visual')
  --   end,
  -- },
  -- {
  --   '<C-x>',
  --   function()
  --     require('dial.map').manipulate('decrement', 'visual')
  --   end,
  -- },
  -- {
  --   'g<C-a>',
  --   function()
  --     require('dial.map').manipulate('increment', 'gvisual')
  --   end,
  -- },
  -- {
  --   'g<C-x>',
  --   function()
  --     require('dial.map').manipulate('decrement', 'gvisual')
  --   end,
  -- },
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
      -- if vim.fn.pumvisible() == 1 then
      -- return '<C-n>'
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
      -- if vim.fn.pumvisible() == 1 then
      -- return '<C-p>'
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

-- commandline remap
cmap({
  { '<C-h>', '<Left>' },
  { '<C-l>', '<Right>' },
  { '<C-a>', '<Home>' },
  { '<C-e>', '<End>' },
  { '<C-d>', '<Del>' },
  { '<C-b>', '<BS>' },
})

vim.keymap.set('i', '<cr>', function()
  if vim.fn.pumvisible() == 1 then
    return '<C-y>'
  end
  return require('nvim-autopairs').autopairs_cr()
end, { expr = true, noremap = true })

-- tmap({ '<Esc>', [[<C-\><C-n>]] })
