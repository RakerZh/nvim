local config = {}

function config.nvim_lsp()
  require('modules.completion.lspconfig')
end

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
  Copilot = ' ',
}

function config.nvim_cmp()
  local cmp = require('cmp')
  cmp.setup({
    preselect = cmp.PreselectMode.Item,
    formatting = {
      fields = { 'kind', 'abbr', 'menu' },
      format = function(entry, vim_item)
        vim_item.kind = lspkind_icons[vim_item.kind]
        if entry.source.name == 'copilot_cmp' then
          vim.api.nvim_set_hl(0, 'CmpItemKindCopilot', { fg = '#6CC644' })
          vim_item.kind = lspkind_icons['Copilot']
          vim_item.kind_hl_group = 'CmpItemKindCopilot'
        end

        vim_item.menu = ({
          nvim_lsp = '',
          nvim_lua = '',
          luasnip = '',
          buffer = '',
          path = '',
          emoji = '',
        })[entry.source.name]

        return vim_item
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      -- ["<Enter>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
      ['<C-j>'] = cmp.mapping.select_next_item(),
      ['<C-k>'] = cmp.mapping.select_prev_item(),
      ['<Tab>'] = cmp.mapping.confirm({ select = true }),
      ['<Enter>'] = cmp.mapping.confirm({ select = true }),
      ['<C-space>'] = cmp.mapping.complete(),
    }),
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    sources = {
      { name = 'nvim_lsp', group_index = 2 },
      { name = 'luasnip', group_index = 2 },
      { name = 'path', group_index = 2 },
      { name = 'buffer', group_index = 2 },
      { name = 'copilot', group_index = 2 },
    },
    sorting = {
      priority_weight = 2,
      comparators = {
        require('copilot_cmp.comparators').prioritize,
        -- Below is the default comparitor list and order for nvim-cmp
        cmp.config.compare.offset,
        -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
        cmp.config.compare.exact,
        cmp.config.compare.score,
        cmp.config.compare.recently_used,
        cmp.config.compare.locality,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
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
      border = 'rounded',
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
  -- vim.wo.winbar = require('lspsaga.symbolwinbar'):get_winbar()
end

return config
