require('telescope').load_extension('prosesitter') -- Optionally, depends on telescope.nvim
require('prosesitter'):setup()({
  vale_bin = vim.fn.stdpath('data') .. '/prosesitter/vale',
  vale_cfg = vim.fn.stdpath('data') .. '/prosesitter/vale_cfg.ini',
  -- override default behaviour for a languag
  ext = {
    py = {
      queries = {
        strings = '[(string) ] @capture',
        comments = '[(comment)+ ] @capture',
      },
      lint_target = 'both',
      disabled = false,
    },
    tex = {
      lint_target = 'strings',
      disabled = false,
    },
    sh = {
      lint_target = 'comments',
    },
  },
  -- highlight groups to use for lint errors, warnings and suggestions
  severity_to_hl = { error = 'SpellBad', warning = 'SpellRare', suggestion = 'SpellCap' },
  auto_enable = true, -- do not start linting files on open (default = true)
  default_cmds = false, -- do not add commands (default = true)
})
