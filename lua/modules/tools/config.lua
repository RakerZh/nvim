local config = {}

function config.template_nvim()
  local temp = require('template')
  temp.temp_dir = os.getenv('HOME') .. 'AppData/Local/nvim/template/'
  temp.author = 'RakerZh'
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

function config.notify()
  require('notify').setup({
    background_colour = '#4C566A',
    timeout = 3000,
  })
end

return config
