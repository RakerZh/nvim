local config = {}

local has_words_before = function()
  if vim.api.nvim_get_option_value('buftype', { buf = 0 }) == 'prompt' then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
    and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match('^%s*$') == nil
end

local lspkind_icons = {
  Text = ' ',
  Method = ' ',
  Function = '',
  Constructor = ' ',
  Field = ' ',
  Variable = ' ',
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
  Operator = ' ',
  TypeParameter = ' ',
  Copilot = ' ',
}

function config.nvim_cmp()
  local cmp = require('cmp')
  local compare = require('cmp.config.compare')
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  local ls = require('modules.completion.luasnip')

  cmp.setup({
    preselect = cmp.PreselectMode.Item,
    formatting = {
      fields = { 'kind', 'abbr', 'menu' },
      format = function(entry, vim_item)
        vim_item.kind = lspkind_icons[vim_item.kind]
        -- if entry.source.name == 'copilot_cmp' then
        -- vim_item.kind = lspkind_icons['Copilot']
        -- vim_item.kind_hl_group = 'CmpItemKindCopilot'
        -- vim.api.nvim_set_hl(0, 'CmpItemKindCopilot', { fg = '#6CC644' })
        -- end

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
      ['<C-e>'] = cmp.mapping.close(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-j>'] = cmp.mapping.select_next_item(),
      ['<C-k>'] = cmp.mapping.select_prev_item(),
      ['<Tab>'] = vim.schedule_wrap(function(fallback)
        if cmp.visible() and has_words_before() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        else
          fallback()
        end
      end),
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
    },
  })
end

return config
