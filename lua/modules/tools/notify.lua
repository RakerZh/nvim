-- vim.notify = require('notify')

-- local plugin = "My Awesome Plugin"

local notification = {}

function notification.post()
  pcall(function()
    require("telescope").load_extension("notify")
  end)

  require("notify").setup({
    background_colour = "#121212",
  })
end


--[[vim.notify("This is an error message.\nSomething went wrong!", "error", {
  title = plugin,
  on_open = function()
    vim.notify("Attempting recovery.", vim.lsp.log_levels.WARN, {
      title = plugin,
    })
    local timer = vim.loop.new_timer()
    timer:start(2000, 0, function()
      vim.notify({ "Fixing problem.", "Please wait..." }, "info", {
        title = plugin,
        timeout = 3000,
        on_close = function()
          vim.notify("Problem solved", nil, { title = plugin })
          vim.notify("Error code 0x0395AF", 1, { title = plugin })
        end,
      })
    end)
  end,
}) --]]

--[[require("notify").setup {
  stages = 'fade_in_slide_out',
  background_colour = "Normal",
  timout = 5000,
  render = "default",
  minimum_width = 50,
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
}
]]--





--vim.notify = require('notify')

--[[ vim.notify("This is an error message.\nSomething went wrong!", "error", {
  title = plugin,
  on_open = function()
    vim.notify("Attempting recovery.", vim.lsp.log_levels.WARN, {
      title = plugin,
    })
    local timer = vim.loop.new_timer()
    timer:start(2000, 0, function()
      vim.notify({ "Fixing problem.", "Please wait..." }, "info", {
        title = plugin,
        timeout = 3000,
        on_close = function()
          vim.notify("Problem solved", nil, { title = plugin })
          vim.notify("Error code 0x0395AF", 1, { title = plugin })
        end,
      })
    end)
  end,
})
--]]

--[[ require('notify').setup({
    minimum_width = math.floor(vim.api.nvim_get_option('columns') / 3),
    max_width = math.floor(vim.api.nvim_get_option('columns') / 3),
    on_open = function(win)
        vim.api.nvim_win_set_option(win, 'wrap', true)
        -- Don't like when it shows after packer sync and blocks the
        -- commits from plugins. So print normal if ft is packer
        local ft = vim.api.nvim_buf_get_option(0, 'ft')
        if ft == 'packer' then
            vim.api.nvim_win_close(win, true)
            local history = require('notify').history()
            local last = history[#history]
            print(unpack(last.message))
        end
        -- Hopefully less annoying interrupts from rust_analyzer
        if ft == 'rust' then
            local history = require('notify').history()
            local last = history[#history]
            if string.match(unpack(last.message), 'rust_analyzer') then
                vim.api.nvim_win_close(win, true)
                print(unpack(last.message))
            end
        end
    end,
})
--]]
--
return notification
