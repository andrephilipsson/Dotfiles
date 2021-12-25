local nnoremap = require("astronauta.keymap").nnoremap

return function ()
  nnoremap { "<Leader>fm", require("telescope").extensions.metals.commands }
  require("metals").initialize_or_attach(Metals_config())
end
