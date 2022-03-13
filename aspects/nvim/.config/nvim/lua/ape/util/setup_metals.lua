return function()
  vim.keymap.set("n", "<Leader>fm", require("telescope").extensions.metals.commands)
  require("metals").initialize_or_attach(Metals_config())
end
