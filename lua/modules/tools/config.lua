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

function config.easyformat()
  local configs = require('easyformat.config')
  configs.lua = {
    ignore_patterns = { '%pspec', 'neovim/*' },
  }
  configs.use_default({
    'cpp',
    'go',
    'rust',
    'javascriptreact',
  })
  require('easyformat').setup({
    fmt_on_save = true,
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

function config.smart_input()
  local filters = require('mutchar.context')
  require('mutchar').setup({
    ['c'] = {
      rules = { '-', '->' },
      filter = filters.non_space_before,
    },
    ['cpp'] = {
      rules = {
        { ',', ' <!>' },
        { '-', '->' },
      },
      filter = {
        filters.generic_in_cpp,
        filters.non_space_before,
      },
      one_to_one = true,
    },
    ['rust'] = {
      rules = {
        { ';', ': ' },
        { '-', '->' },
        { ',', '<!>' },
      },
      filter = {
        filters.semicolon_in_rust,
        filters.minus_in_rust,
        filters.generic_in_rust,
      },
      one_to_one = true,
    },
    ['lua'] = {
      rules = { ';', ':' },
      filter = filters.semicolon_in_lua,
    },
    ['go'] = {
      rules = {
        { ';', ' :=' },
        { ',', ' <-' },
      },
      filter = {
        filters.diagnostic_match({ 'initial', 'undeclare' }),
        filters.go_arrow_symbol,
      },
      one_to_one = true,
    },
  })
end
return config
