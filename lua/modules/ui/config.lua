local config = {}

function config.galaxyline()
  require('modules.ui.eviline')
end

function config.zephyr()
  --  require('modules.ui.eviline1')
  vim.cmd('colorscheme zephyr')
end

function config.nvim_bufferline()
  vim.opt.termguicolors = true
  require('bufferline').setup({
    options = {
      mode = 'buffers',
      numbers = 'none',
      close_command = 'bdelete! %d',
      right_mouse_command = 'bdelete! %d',
      left_mouse_command = 'buffer %d',
      middle_mouse_command = nil,
      modified_icon = '✥',
      always_show_bufferline = false,
      indicator_icon = '▎',
      buffer_close_icon = '',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',

      name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
        -- remove extension from markdown files for example
        if buf.name:match('%.md') then
          return vim.fn.fnamemodify(buf.name, ':t:r')
        end
      end,

      custom_filter = function(buf_number, buf_numbers)
        -- filter out filetypes you don't want to see
        if vim.bo[buf_number].filetype ~= '<i-dont-want-to-see-this>' then
          return true
        end
        -- filter out by buffer name
        if vim.fn.bufname(buf_number) ~= '<buffer-name-I-dont-want>' then
          return true
        end
        -- filter out based on arbitrary rules
        -- e.g. filter out vim wiki buffer from tabline in your work repo
        if vim.fn.getcwd() == '<work-repo>' and vim.bo[buf_number].filetype ~= 'wiki' then
          return true
        end
        -- filter out by it's index number in list (don't show first buffer)
        if buf_numbers[1] ~= buf_number then
          return true
        end
      end,
      max_name_length = 18,
      max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      tab_size = 18,
      diagnostics = 'nvim_lsp',
      diagnostics_update_in_insert = false,
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        return '(' .. count .. ')'
      end,
      color_icons = true,
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
      show_close_icon = true,
      show_tab_indicators = true,
      persist_buffer_sort = true,
      separator_style = 'slant',
      enforce_regular_tabs = false,
    },
  })
  local groups = require('bufferline.groups')
  groups = {
    options = {
      toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
    },
    items = {
      {
        name = 'Tests', -- Mandatory
        highlight = { gui = 'underline', guisp = 'blue' }, -- Optional
        priority = 2, -- determines where it will appear relative to other groups (Optional)
        icon = '', -- Optional
        matcher = function(buf) -- Mandatory
          return buf.name:match('%_test') or buf.name:match('%_spec')
        end,
      },
      {
        name = 'Docs',
        highlight = { gui = 'undercurl', guisp = 'green' },
        auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
        icon = '',
        matcher = function(buf)
          return buf.name:match('%.md') or buf.name:match('%.txt')
        end,
        separator = { -- Optional
          style = require('bufferline.groups').separator.tab,
        },
      },
      {
        name = 'Resources',
        highlight = { gui = 'undercurl', guisp = 'red' },
        auto_close = true,
        icon = '',
        matcher = function(buf)
          return buf.name:match('%.jpg')
            or buf.name:match('%.png')
            or buf.name:match('%.gif')
            or buf.name:match('%.ico')
        end,
      },
    },
  }
end

function config.dashboard()
  local home = os.getenv('HOME')
  local db = require('dashboard')
  db.session_directory = home .. '/.cache/nvim/session'
  db.preview_command = 'cat | lolcat -F 0.3'
  --  db.preview_command = 'chafa -c 256 --fg-only'
  db.preview_file_path = '~/.config/nvim/static/neovim.cat'
  db.preview_file_height = 12
  db.preview_file_width = 80
  db.custom_center = {
    {
      icon = '  ',
      desc = 'Update Plugins                          ',
      shortcut = 'SPC p u',
      action = 'PackerUpdate',
    },
    {
      icon = '  ',
      desc = 'Recently opened files                   ',
      action = 'Telescope oldfiles',
      shortcut = 'SPC f h',
    },
    {
      icon = '  ',
      desc = 'Find  File                              ',
      action = 'Telescope find_files find_command=rg,--hidden,--files',
      shortcut = 'SPC f f',
    },
    {
      icon = '  ',
      desc = 'File Browser                            ',
      action = 'Telescope file_browser',
      shortcut = 'SPC f b',
    },
    {
      icon = '  ',
      desc = 'Find  word                              ',
      aciton = 'Telescope live_grep',
      shortcut = 'SPC f w',
    },
    {
      icon = '  ',
      desc = 'Open Personal dotfiles                  ',
      action = 'Telescope dotfiles path=' .. home .. '/.dotfiles',
      shortcut = 'SPC f d',
    },
  }
end

function config.nvim_tree()
  require('nvim-tree').setup({
    disable_netrw = false,
    hijack_cursor = true,
    hijack_netrw = true,
    view = {
      width = 30,
      height = 30,
      side = 'left',
      preserve_window_proportions = false,
      number = false,
      relativenumber = false,
      signcolumn = 'yes',
      mappings = {
        custom_only = false,
        list = {
          { key = { 'l' }, action = 'edit' },
          { key = { 's' }, action = 'split' },
          { key = { 'v' }, action = 'vsplit' },
        },
      },
    },
    renderer = {
      icons = {
        webdev_colors = true,
        git_placement = 'before',
        padding = ' ',
        symlink_arrow = ' ➛ ',
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },
        glyphs = {
          default = '',
          symlink = '',
          folder = {
            arrow_closed = '',
            arrow_open = '',
            default = '',
            open = '',
            empty = '',
            empty_open = '',
            symlink = '',
            symlink_open = '',
          },
          git = {
            unstaged = '✗',
            staged = '',
            unmerged = ' ',
            renamed = '',
            untracked = 'ﲉ',
            deleted = '',
            ignored = '◌',
          },
        },
      },
      special_files = { 'Cargo.toml', 'Makefile', 'README.md', 'readme.md' },
    },
  }) -- END_DEFAULT_OPTS
end

function config.gitsigns()
  if not packer_plugins['plenary.nvim'].loaded then
    vim.cmd([[packadd plenary.nvim]])
  end
  require('gitsigns').setup({
    signs = {
      add = { hl = 'GitGutterAdd', text = '▋' },
      change = { hl = 'GitGutterChange', text = '▋' },
      delete = { hl = 'GitGutterDelete', text = '▋' },
      topdelete = { hl = 'GitGutterDeleteChange', text = '▔' },
      changedelete = { hl = 'GitGutterChange', text = '▎' },
    },
    keymaps = {
      -- Default keymap options
      noremap = true,
      buffer = true,

      ['n ]g'] = { expr = true, "&diff ? ']g' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
      ['n [g'] = { expr = true, "&diff ? '[g' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },

      ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
      ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
      ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
      ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',

      -- Text objects
      ['o ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
      ['x ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
    },
  })
end

function config.indent_blankline()
  vim.g.indent_blankline_char = '│'
  vim.g.indent_blankline_show_first_indent_level = true
  vim.g.indent_blankline_filetype_exclude = {
    'dashboard',
    'DogicPrompt',
    'log',
    'fugitive',
    'gitcommit',
    'packer',
    'markdown',
    'json',
    'txt',
    'vista',
    'help',
    'todoist',
    'NvimTree',
    'git',
    'TelescopePrompt',
    'undotree',
    '', -- for all buffers without a file type
  }

  vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile', 'prompt' }
  vim.g.indent_blankline_show_trailing_blankline_indent = false
  vim.g.indent_blankline_show_current_context = true

  vim.g.indent_blankline_context_patterns = {
    'class',
    'function',
    'method',
    'block',
    'list_literal',
    'selector',
    '^if',
    '^table',
    'if_statement',
    'while',
    'for',
  }
  -- because lazy load indent-blankline so need readd this autocmd
  vim.cmd('autocmd CursorMoved * IndentBlanklineRefresh')
end

return config
