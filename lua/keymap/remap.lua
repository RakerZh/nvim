local keymap = require('core.keymap')
local nmap, imap, cmap, tmap = keymap.nmap, keymap.imap, keymap.cmap, keymap.tmap
local silent, noremap = keymap.silent, keymap.noremap
local expr = keymap.expr
local opts = keymap.new_opts
local cmd = keymap.cmd

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
})

-- insertmode remap
imap({
  { '<C-w>', '<C-[>diwa' },
  { '<C-h>', '<Bs>' },
  { '<C-d>', '<Del>' },
  { '<C-u>', '<C-G>u<C-u>' },
  { '<C-b>', '<Left>' },
  { '<C-f>', '<Right>' },
  { '<C-a>', '<Esc>^i' },
  { '<C-j>', '<Esc>o' },
  { '<C-k>', '<Esc>O' },
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
      if vim.fn.pumvisible() == 1 then
        return '<C-n>'
      elseif vim.snippet.jumpable(1) then
        return cmd('lua vim.snippet.jump(1)<cr>')
      else
        return '<TAB>'
      end
    end,
    { expr = true },
  },
  {
    '<S-TAB>',
    function()
      if vim.fn.pumvisible() == 1 then
        return '<C-p>'
      elseif vim.snippet.jumpable(-1) then
        return '<cmd>lua vim.snippet.jump(-1)<CR>'
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
