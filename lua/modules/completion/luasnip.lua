local ls = require('luasnip')

ls.config.set_config({
  updateevents = 'TextChanged',
})

require('luasnip.loaders.from_vscode').lazy_load({
  paths = { './snippets/' },
})

return ls
