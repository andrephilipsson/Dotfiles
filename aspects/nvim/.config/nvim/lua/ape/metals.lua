local has_metals, metals = pcall(require, "metals")
if not has_metals then
  return
end

local has_lsp, lsp = pcall(require, "ape.lsp")
if not has_lsp then
  return
end

local metals_config = metals.bare_config()

metals_config.settings = {
  showImplicitArguments = true,
  showInferredType = true,
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}

metals_config.init_options.statusBarProvider = "on"
metals_config.capabilities = lsp.capabilities
metals_config.on_attach = lsp.on_attach
metals_config.handlers = lsp.handlers()

local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})
