local api = vim.api
local au = api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup('RakerZh', {})

au({ 'BufWritePre' }, {
  group = group,
  pattern = { '/tmp/*', 'COMMIT_EDITMSG', 'MERGE_MSG', '*.tmp', '*.bak' },
  command = 'setlocal noundofile',
})

au('BufRead', {
  group = group,
  pattern = '*.conf',
  command = 'setlocal filetype=conf',
})

au('TextYankPost', {
  group = group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 400 })
  end,
})

au({ 'BufEnter' }, {
  group = group,
  pattern = '*',
  callback = function()
    if vim.bo.filetype ~= 'dashboard' and not vim.opt_local.cursorline:get() then
      vim.opt_local.cursorline = true
    end
  end,
})

au({ 'WinLeave', 'BufLeave', 'InsertEnter' }, {
  group = group,
  pattern = '*',
  callback = function()
    if vim.bo.filetype ~= 'dashboard' and vim.opt_local.cursorline:get() then
      vim.opt_local.cursorline = false
    end
  end,
})

au('UIEnter', {
  group = group,
  once = true,
  callback = function()
    vim.schedule(function()
      vim.lsp.enable({
        'lua_ls',
        'gopls',
        -- 'emmylua_ls',
        'ts_ls',
        'clangd',
        'rust_analyzer',
        'basedpyright',
        -- 'ruff',
        'zls',
        'cmake',
        'bashls',
        'dockerls',
        -- 'tsls',
      })

      vim.lsp.log.set_level(vim.log.levels.OFF)

      vim.diagnostic.config({
        float = {
          title = '',
          header = '',
        },
        virtual_text = { current_line = true },
        signs = {
          text = { '●', '●', '●', '●' },
          numhl = {
            'DiagnosticError',
            'DiagnosticWarn',
            'DiagnosticInfo',
            'DiagnosticHint',
          },
        },
        severity_sort = true,
      })

      api.nvim_create_user_command('LspLog', function()
        vim.cmd(string.format('tabnew %s', vim.lsp.get_log_path()))
      end, {
        desc = 'Opens the Nvim LSP client log.',
      })

      api.nvim_create_user_command('LspDebug', function()
        vim.lsp.log.set_level(vim.log.levels.WARN)
      end, { desc = 'enable lsp log' })

      -- vim.cmd.packadd('nohlsearch')
    end)
  end,
  desc = 'Initializer',
})

-- disable default syntax for large file.
au('Filetype', {
  group = group,
  pattern = '*.c,*.cpp,*.lua,*.go,*.rs,*.py,*.ts,*.tsx',
  callback = function()
    vim.cmd('syntax off')
  end,
})
