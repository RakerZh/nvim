local config = {}

function config.nvim_lsp()
  require('modules.completion.lspconfig')
end

function config.nvim_cmp()
  local cmp = require('cmp')
  cmp.setup({
    preselect = cmp.PreselectMode.Item,
    formatting = {
      format = function(entry, vim_item)
        local lspkind_icons = {
          Text = '',
          Method = '',
          Function = '',
          Constructor = ' ',
          Field = '',
          Variable = '',
          Class = '',
          Interface = '',
          Module = '硫',
          Property = '',
          Unit = ' ',
          Value = '',
          Enum = ' ',
          Keyword = 'ﱃ',
          Snippet = ' ',
          Color = ' ',
          File = ' ',
          Reference = 'Ꮢ',
          Folder = ' ',
          EnumMember = ' ',
          Constant = ' ',
          Struct = ' ',
          Event = '',
          Operator = '',
          TypeParameter = ' ',
        }

        local meta_type = vim_item.kind
        vim_item.kind = lspkind_icons[vim_item.kind] .. ''
        vim_item.menu = ({
          buffer = ' Buffer',
          nvim_lsp = meta_type,
          path = ' Path',
          luasnip = ' LuaSnip',
        })[entry.source.name]

        return vim_item
      end,
    },
    -- You can set mappings if you want
    mapping = cmp.mapping.preset.insert({
      ['<C-e>'] = cmp.config.disable,
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'path' },
      { name = 'buffer' },
    },
  })
end

function config.lua_snip()
  local ls = require('luasnip')
  ls.config.set_config({
    updateevents = 'TextChanged',
  })
  require('luasnip.loaders.from_vscode').lazy_load({
    paths = { './snippets/' },
  })
end

function config.auto_pairs()
  require('nvim-autopairs').setup({})
  local status, cmp = pcall(require, 'cmp')
  if not status then
    vim.cmd([[packadd nvim-cmp]])
    cmp = require('cmp')
  end
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
end

function config.lspsaga()
  require('lspsaga').setup({
    ui = {
      border = 'double',
      colors = {
        --float window normal bakcground color
        normal_bg = '#232835',
        --title background color
        title_bg = '#5b97db',
        red = '#e95678',
        magenta = '#b33076',
        orange = '#FF8700',
        yellow = '#f7bb3b',
        green = '#afd700',
        cyan = '#36d0e0',
        blue = '#61afef',
        purple = '#CBA6F7',
        white = '#d1d4cf',
        black = '#1c1c19',
      },
    },
  })
  vim.wo.winbar = require('lspsaga.symbolwinbar'):get_winbar()
end

return config
