local config = {}

-- function config.galaxyline()
-- require('modules.ui.eviline')
-- end

function config.whisky()
	require("whiskyline").setup()
end

function config.nordic()
	require("nordic").setup({
		cursorline = {
			theme = "dark",
		},
		integrations = {
			treesitter = true,
			native_lsp = true,
			lsp_trouble = true,
			lsp_saga = true,
			gitgutter = false,
			gitsigns = true,
			telescope = true,
			nvimtree = false,
			barbar = true,
			bufferline = false,
			indent_blankline = true,
			dashboard = true,
			neogit = true,
			vim_sneak = false,
			vim_matchup = false,
			vim_signify = false,
			which_key = false,
		},
	})
	vim.cmd("colorscheme nordic")
end

function config.zephyr()
	vim.cmd("colorscheme zephyr")
end

function config.dashboard()
	local db = require("dashboard")

	-- db.custom_header = {
	--   '',
	--   '  █████╗ ███████╗ █████╗ ██╗  ██╗██╗   ██╗     ██╗███╗   ██╗██╗   ██╗██╗  ██╗ ',
	--   ' ██╔══██╗██╔════╝██╔══██╗██║  ██║██║   ██║     ██║████╗  ██║██║   ██║╚██╗██╔╝ ',
	--   ' ███████║███████╗███████║███████║██║   ██║     ██║██╔██╗ ██║██║   ██║ ╚███╔╝ ',
	--   ' ██╔══██║╚════██║██╔══██║██╔══██║██║   ██║     ██║██║╚██╗██║██║   ██║ ██╔██╗ ',
	--   ' ██║  ██║███████║██║  ██║██║  ██║██║   ███████╗██║██║ ╚████║╚██████╔╝██╔╝ ██╗ ',
	--   ' ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝   ╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝ ',
	--   '',
	-- }

	-- db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
	-- db.preview_file_height = 12
	-- db.preview_file_width = 80
	vim.cmd("highlight DashboardCenter guifg=#9fb2ca")
	-- vim.cmd('highlight DashboardHeader guifg=#b0465d')
	db.setup({
		theme = "hyper",
		config = {
			project = {
				enable = true,
			},
			shortcut = {
				{
					desc = "  Directories ",
					group = "DashboardShortCut",
				},
				{
					desc = "  RakerZh",
					group = "Delimiter",
				},
			},
			week_header = {
				enable = true,
			},
		},
		-- preview = {
		-- command = 'bat --style=plain', -- preview command
		--   command = 'catt', -- preview command
		--   file_path = '~/.config/nvim/static/taoism', -- preview file path
		--   file_height = 22, -- preview file height
		--   file_width = 58, -- preview file width
		-- },
	})
end

function config.gitsigns()
	require("gitsigns").setup({
		signs = {
			add = { hl = "GitGutterAdd", text = "▋" },
			change = { hl = "GitGutterChange", text = "▋" },
			delete = { hl = "GitGutterDelete", text = "▋" },
			topdelete = { hl = "GitGutterDeleteChange", text = "▔" },
			changedelete = { hl = "GitGutterChange", text = "▎" },
			untracked = { hl = "GitGutterAdd", text = "▋" },
		},
		keymaps = {
			-- Default keymap options
			noremap = true,
			buffer = true,

			["n ]g"] = { expr = true, "&diff ? ']g' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
			["n [g"] = { expr = true, "&diff ? '[g' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },

			["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
			["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
			["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
			["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
			["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line()<CR>',

			-- Text objects
			["o ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>',
			["x ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>',
		},
	})
end

function config.todo()
	require("todo-comments").setup({
		-- TEST: TESTING, test
		-- FIX: FIXME, BUG, FIXIT, ISSUE, fix
		-- TODO:
		-- WARN:
		-- PERF: OPTIM, PERFORMANCE, OPTIMIZE
		--
		-- NOTE:
		-- INFO:
		--
		-- PASSED: pass PASS
		-- FAILED: FAIL fail
		-- Link: link Ref link
		keywords = {
			FIX = { icon = " ", color = "#cc3b1d", alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "fix" } },
			PERF = { icon = " ", color = "#64a9ab", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			TEST = { icon = " ", color = "test", alt = { "TESTING", "test" } },
			NOTE = { icon = " ", color = "#FFFFF0", alt = { "INFO" } },
			PASSED = { icon = " ", color = "#6da063", alt = { "PASS", "pass" } },
			FAILED = { icon = " ", color = "#d45d44", alt = { "FAIL", "fail" } },
			Ref = { icon = " ", color = "#5a636b", alt = { "Link", "LINK", "REF", "link" } },
		},
	})
end

function config.bufferline()
	require("bufferline").setup({})
end

return config
