local snippets = require'snippets'
local U = require'snippets.utils'

snippets.set_ux(require'snippets.inserters.vim_input')

snippets.snippets = {
  _global = {
    date = "${=os.date('%Y-%m-%d')}"
  };
}
