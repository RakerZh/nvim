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
  -- tbl is the function relate table. index 1 is function name
  -- others are params name with type (if have)
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

function config.neotree()
  require('neo-tree').setup({
    filesystem = {
      filtered_items = {
        hide_dotfile = false,
      },
    },
  })
end

function config.guard()
  local ft = require('guard.filetype')
  ft('c'):fmt('clang-format'):lint('clang-tidy')
  ft('cpp'):fmt('clang-format'):lint('clang-tidy')
  ft('lua'):fmt('stylua')
  ft('go'):fmt('lsp'):append('golines') --:lint('golangci-lint')

  require('guard').setup()
  exec_filetype('Guard')
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
  exec_filetype('dyninput')
end

return config
