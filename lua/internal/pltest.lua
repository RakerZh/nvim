local scan = require('plenary.scandir')
local source = {
  name = 'tldr',
  uri = 'https://github.com/tldr-pages/tldr',
  root = '',
  depth = 3,
  pattern = '%.md',
  add_dirs = false,
  ft = 'markdown',
  get_ns_keyword = function(path)
    return 'lang', path:match('.*/([^./]+).*')
  end,
}

local get_source_path = function(path)
  return scan.scan_dir_async(path .. source.root, {
    search_pattern = source.pattern,
    depth = source.depth,
    add_dirs = source.add_dirs,
  })
end
