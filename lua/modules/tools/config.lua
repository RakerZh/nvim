local config = {}

function config.template_nvim()
  require('template').setup({
    temp_dir = '~/.config/nvim/template',
    author = 'RakerZh',
    project = {
      ['test'] = {
        ['lang'] = {
          ['cpp'] = {
            ['Tests'] = {
              'CMakeLists.txt',
            },
          },
        },
      },
      ['other'] = {
        ['default'] = {
          'README.md',
          '.gitignore',
        },
        ['lang'] = {
          ['lua'] = {
            '.stylua.toml',
          },
          ['cpp'] = {
            '.clang-format',
            'main.cpp',
            'CMakeLists.txt',
          },
          ['python'] = {
            'requirements.txt',
          },
        },
      },
    },
  })
  require('telescope').load_extension('find_template')
end

function config.coman()
  local custom_template = require('coman').custom_template
  custom_template['c'] = function(tbl, cms)
    local insert = table.insert
    local space = ' '
    local contents = {}
    for i, v in pairs(tbl) do
      if i == 1 then
        insert(contents, '/**')
        insert(contents, ' *' .. space .. '@Description' .. space .. v)
      else
        insert(contents, ' *' .. space .. '@param' .. space .. v)
      end
    end
    insert(contents, ' */')
    return contents
  end
  custom_template['cpp'] = function(tbl, cms)
    local insert = table.insert
    local space = ' '
    local contents = {}
    for i, v in pairs(tbl) do
      if i == 1 then
        insert(contents, '/**')
        insert(contents, ' *' .. space .. '@Description' .. space .. v)
      else
        insert(contents, ' *' .. space .. '@param' .. space .. v)
      end
    end
    insert(contents, ' */')
    return contents
  end
end

function config.guard()
  local ft = require('guard.filetype')
  ft('c'):fmt({
    cmd = 'clang-format',
    stdin = true,
  }):lint('clang-tidy')

  ft('cpp'):fmt('clang-format'):lint('clang-tidy')
  ft('lua'):fmt({
    cmd = 'stylua',
    args = { '-' },
    stdin = true,
    ignore_patterns = 'function.*_spec%.lua',
    find = '.stylua.toml',
  })
  ft('go'):fmt('lsp'):append('golines') --:lint('golangci-lint')
  ft('rust'):fmt('rustfmt')
  ft('typescript', 'javascript', 'typescriptreact', 'javascriptreact'):fmt('prettier')
  ft('python'):fmt({ cmd = 'ruff', args = { 'format', '-' }, stdin = true })
  ft('zig'):fmt('lsp')

  vim.api.nvim_create_autocmd('User', {
    pattern = 'GuardFmt',
    callback = function(args)
      if args.data.status == 'done' then
        vim.diagnostic.show()
      end
    end,
  })
end

function config.noice()
  require('noice').setup({
    views = {
      cmdline_popup = {
        position = {
          row = 18,
          col = '50%',
        },
        size = {
          width = 60,
          height = 'auto',
        },
      },
      popupmenu = {
        relative = 'editor',
        position = {
          row = 21,
          col = '50%',
        },
        size = {
          width = 60,
          height = 10,
        },
        border = {
          style = 'rounded',
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = { Normal = 'Normal', FloatBorder = 'DiagnosticInfo' },
        },
      },
    },
  })
end

function config.dyninput()
  local rs = require('dyninput.lang.rust')
  local ms = require('dyninput.lang.misc')
  require('dyninput').setup({
    c = {
      ['-'] = { '->', ms.c_struct_pointer },
    },
    cpp = {
      [','] = { ' <!>', ms.generic_in_cpp },
      ['-'] = { '->', ms.c_struct_pointer },
    },
    rust = {
      [';'] = {
        { '::', rs.double_colon },
        { ': ', rs.single_colon },
      },
      ['='] = { ' => ', rs.fat_arrow },
      ['-'] = { ' -> ', rs.thin_arrow },
      ['\\'] = { '|!| {}', rs.closure_fn },
    },
    lua = {
      [';'] = { ':', ms.semicolon_in_lua },
    },
    go = {
      [';'] = {
        { ' := ', ms.go_variable_define },
        { ': ', ms.go_struct_field },
      },
    },
  })
end

function config.vimtex()
  vim.g.tex_flavor = 'latex'         -- treat .tex as LaTeX not plain TeX
  vim.g.vimtex_view_method = 'skim'
  vim.g.vimtex_view_skim_activate = 1
  vim.g.vimtex_compiler_method = 'latexmk'
  vim.g.vimtex_compiler_latexmk = {
    options = {
      '-pdf',
      '-shell-escape',
      '-verbose',
      '-file-line-error',
      '-synctex=1',
      '-interaction=nonstopmode',
    },
  }
  vim.g.vimtex_quickfix_mode = 0     -- don't auto-open quickfix on warning
  -- Start Neovim with a named server for nvr inverse search
  if vim.fn.serverlist()[1] == nil then
    vim.fn.serverstart('/tmp/nvim.sock')
  end
end

function config.zotcite()
  vim.g.zotcite_filetypes = { 'tex', 'markdown' }
  -- zotcite reads from Zotero's SQLite DB directly; set data dir if non-default:
  -- vim.g.zotero_data = vim.fn.expand('~/Zotero')
end

return config
