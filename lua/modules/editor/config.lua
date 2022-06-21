local config = {}

function config.telescope()
    if not packer_plugins['plenary.nvim'].loaded then
        vim.cmd [[packadd plenary.nvim]]
        vim.cmd [[packadd popup.nvim]]
        vim.cmd [[packadd telescope-fzy-native.nvim]]
        vim.cmd [[packadd telescope-file-broswer.nvim]]
        vim.cmd [[packadd telescope-ui-select.nvim]]
    end
    require('telescope').setup {
        defaults = {
            prompt_prefix = '🔭 ',
            selection_caret = " ",
            layout_config = {
                horizontal = {prompt_position = "top", results_width = 0.6},
                vertical = {mirror = false}
            },
            sorting_strategy = 'ascending',
            file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
            grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep
                .new,
            qflist_previewer = require'telescope.previewers'.vim_buffer_qflist
                .new
        },
        extensions = {
            fzy_native = {
                override_generic_sorter = false,
                override_file_sorter = true
            },
            ["ui-select"] = {
              require("telescope.themes").get_dropdown {

              }
            }
        }
    }
    require('telescope').load_extension('fzy_native')
    require'telescope'.load_extension('dotfiles')
    require'telescope'.load_extension('gosource')
    require('telescope').load_extension('file_browser')
    require('telescope').load_extension('ui-select')
end

function config.nvim_colorizer()
  require('colorizer').setup()
end

return config
