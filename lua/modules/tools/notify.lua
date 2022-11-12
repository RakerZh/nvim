local notification = {}

function notification.post()
  pcall(function()
    require("telescope").load_extension("notify")
  end)

  require("notify").setup({
    background_colour = "#121212",
  })
end

return notification
